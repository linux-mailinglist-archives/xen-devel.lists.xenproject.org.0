Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AD1631BCDB
	for <lists+xen-devel@lfdr.de>; Mon, 15 Feb 2021 16:37:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.85273.159895 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lBfwA-00047e-AT; Mon, 15 Feb 2021 15:37:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 85273.159895; Mon, 15 Feb 2021 15:37:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lBfwA-00047D-7B; Mon, 15 Feb 2021 15:37:22 +0000
Received: by outflank-mailman (input) for mailman id 85273;
 Mon, 15 Feb 2021 15:37:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/QLJ=HR=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lBfw9-000478-5Z
 for xen-devel@lists.xenproject.org; Mon, 15 Feb 2021 15:37:21 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id aba63bde-7cad-4555-8b0e-636286fb3c35;
 Mon, 15 Feb 2021 15:37:19 +0000 (UTC)
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
X-Inumbo-ID: aba63bde-7cad-4555-8b0e-636286fb3c35
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1613403439;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Zf7KG8h/f/t89+M/y8zcenH/KRVdl9lbrjSfPKDQUDc=;
  b=PuQMaMlkzTENGOn9tQf++aaTVdU9n+cCOO+fBGEBDBLPEcLwRQaAU16B
   tUT8HJlAG1hn1N1Rk2t1L5R4ku9ST/v3L7QCJVnOOoN9ime0wdl64vrzx
   IL399TUpDXHnvZ8NOieIikYymMcP1nRrCZCriPV/miNq5o0ip4O8m1CB5
   c=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: uYHojOcCv3PBzUrbrwWZn9PAmgetAW51eL4awKKfNOzIJ2ZucZQZ5UR4v1Dv4AveR7n/WsvR17
 eni5K0cFLtkGeMZhHDC2SKG1wOh3ADwC9jJya6LbXgW7jNW4OW7v9Luo0iq5BUGLCN99xzqYGH
 ZmrSxpJYjQIws6bUWJrpUCO+oc27xhdSM2zlMxdt+4UCm2Z+zsp40IR18e71bvpeUSbeYRIjlJ
 HrI82reXOprjuihekmoOtp5YYFprVcI9D/r1P/+e4cJR2S7q2g7hI51u3M5otJlpsvSaGPkpy/
 FOU=
X-SBRS: 5.1
X-MesageID: 37460986
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.81,180,1610427600"; 
   d="scan'208";a="37460986"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson
	<iwj@xenproject.org>, Wei Liu <wl@xen.org>, Juergen Gross <jgross@suse.com>
Subject: [PATCH v1.1 06/10] stubdom/xenstored: Fix uninitialised variables in lu_read_state()
Date: Mon, 15 Feb 2021 15:36:49 +0000
Message-ID: <20210215153649.4055-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20210212153953.4582-7-andrew.cooper3@citrix.com>
References: <20210212153953.4582-7-andrew.cooper3@citrix.com>
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

for the stubdom build.  This is because lu_get_dump_state() is a no-op stub in
MiniOS, and state really is operated on uninitialised.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Reviewed-by: Juergen Gross <jgross@suse.com>
---
CC: Ian Jackson <iwj@xenproject.org>
CC: Wei Liu <wl@xen.org>
CC: Juergen Gross <jgross@suse.com>

v2:
 * Reword commit message.
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


