Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 33B0D31A1DD
	for <lists+xen-devel@lfdr.de>; Fri, 12 Feb 2021 16:41:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.84307.158042 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lAaYQ-0000kc-0y; Fri, 12 Feb 2021 15:40:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 84307.158042; Fri, 12 Feb 2021 15:40:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lAaYP-0000k6-Tq; Fri, 12 Feb 2021 15:40:21 +0000
Received: by outflank-mailman (input) for mailman id 84307;
 Fri, 12 Feb 2021 15:40:20 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=o46S=HO=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lAaYO-0000ix-NY
 for xen-devel@lists.xenproject.org; Fri, 12 Feb 2021 15:40:20 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 03ecbdec-a497-49fe-88a0-a97db26888a2;
 Fri, 12 Feb 2021 15:40:15 +0000 (UTC)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 03ecbdec-a497-49fe-88a0-a97db26888a2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1613144415;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=8n3LNq3HpJRCzFtQilT2o7NpxGGvtcLJdJkdvWcMQnw=;
  b=UOgfUupnQL5p0yk51e3fisezYp6hlsMNH6UyPVrKApSDfGMmJffenVBO
   yLtlsPvab9cHXjk/9dayObOQudrs3DofQhA1IZYPWhHkOhsQ68k4/Ng/b
   L9CkvL9/mnE0xHIMfLZB265/5icY6aSu+4R1mB/SU+0a9Hb8zsNy3xpM2
   E=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: Guvd7p8XjY8XoUmY5MoiKRxmWTdrFrJQvYwSBTWTuijsXIsyt20eYDpEYtfH2O5MPWoj0PTZW5
 gW+twg/8I+eXOb4i9h+6tmEvxZiVKtnFr7su7KUCv3KWc2HZ9ijINDwmS7ktj4xKd+vHu5iKde
 7SttGN2e6fKdhIZ4GNCVU0c2pjUepQS0r3ElBOzU6MexQBetZO8BHtO5ScZgd190YiX2gG8pAt
 im17uWP0xr7Pmh6vpvmx8DyPXiQ/G5vx8rrkiQvPtyYgOqwRnZ1CHMkXgr+L0m0bunnMLWCv8d
 qm4=
X-SBRS: 5.2
X-MesageID: 38508881
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.81,174,1610427600"; 
   d="scan'208";a="38508881"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson
	<iwj@xenproject.org>, Wei Liu <wl@xen.org>, Juergen Gross <jgross@suse.com>
Subject: [PATCH 06/10] stubdom/xenstored: Fix uninitialised variables in lu_read_state()
Date: Fri, 12 Feb 2021 15:39:49 +0000
Message-ID: <20210212153953.4582-7-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20210212153953.4582-1-andrew.cooper3@citrix.com>
References: <20210212153953.4582-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Various version of gcc, when compiling with -Og, complain:

  xenstored_control.c: In function ‘lu_read_state’:
  xenstored_control.c:540:11: error: ‘state.size’ is used uninitialized in this
  function [-Werror=uninitialized]
    if (state.size == 0)
        ~~~~~^~~~~
  xenstored_control.c:543:6: error: ‘state.buf’ may be used uninitialized in
  this function [-Werror=maybe-uninitialized]
    pre = state.buf;
    ~~~~^~~~~~~~~~~
  xenstored_control.c:550:23: error: ‘state.buf’ may be used uninitialized in
  this function [-Werror=maybe-uninitialized]
     (void *)head - state.buf < state.size;
                    ~~~~~^~~~
  xenstored_control.c:550:35: error: ‘state.size’ may be used uninitialized in
  this function [-Werror=maybe-uninitialized]
     (void *)head - state.buf < state.size;
                                ~~~~~^~~~~

Interestingly, this is only in the stubdom build.  I can't identify any
relevant differences vs the regular tools build.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Ian Jackson <iwj@xenproject.org>
CC: Wei Liu <wl@xen.org>
CC: Juergen Gross <jgross@suse.com>
---
 tools/xenstore/xenstored_control.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/xenstore/xenstored_control.c b/tools/xenstore/xenstored_control.c
index 1f733e0a04..f10beaf85e 100644
--- a/tools/xenstore/xenstored_control.c
+++ b/tools/xenstore/xenstored_control.c
@@ -530,7 +530,7 @@ static const char *lu_dump_state(const void *ctx, struct connection *conn)
 
 void lu_read_state(void)
 {
-	struct lu_dump_state state;
+	struct lu_dump_state state = {};
 	struct xs_state_record_header *head;
 	void *ctx = talloc_new(NULL); /* Work context for subfunctions. */
 	struct xs_state_preamble *pre;
-- 
2.11.0


