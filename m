Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7575726883B
	for <lists+xen-devel@lfdr.de>; Mon, 14 Sep 2020 11:25:19 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kHkjM-00070V-PH; Mon, 14 Sep 2020 09:25:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qknR=CX=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kHkjM-00070O-0n
 for xen-devel@lists.xenproject.org; Mon, 14 Sep 2020 09:25:00 +0000
X-Inumbo-ID: a046c954-db43-44f2-b19e-2f76cc1068eb
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a046c954-db43-44f2-b19e-2f76cc1068eb;
 Mon, 14 Sep 2020 09:24:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1600075489;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=wamgop3LxIhBnrdiDDz4m99Y366IRcEkMxrXUbowTR4=;
 b=HANrBVzWzvPp4PLiQVbnQFkiUEZb90vm/uCwlVoF/0O4LPsksKn6uxcT
 1nHv6Ch171QAit4z/7u2xuAHc9P4mNNg9/5ckeuYJf++V7smcQ74GwLCY
 KBN6XWpfG2+zxgPBXDLZ44OQeipO7wjlJFK1Pk94HHoAdZaCZbi1XenYP E=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: mRG/iXQlX3apjjUT3C0FvTWC532oOHIGLdmQq3v89r2fcN57LTxOu6cTygsmha4UmyN3MomdHr
 mSrOsuOC4abMnW3iAS7mRrWc4r00wKeqF+hH9sxfzij7RjWcPm7Ozo7ZyQk81blXqrmuvpcbGN
 a+s6w01T3UPcmPbKSCg3NEAujmx8bZzJhkTCdYyAGF3F7oc53Ek7ru67OC9ffXUKwf8fnzDM4N
 ymrT1R9kEP96VWOzM9p8wWiKbrHs2Xek3ulu7XzB2+8pjzZDRtQN7xhTg1PnEyMYQvD79QdPnj
 ZjE=
X-SBRS: 2.7
X-MesageID: 26906972
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,425,1592884800"; d="scan'208";a="26906972"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Juergen Gross
 <jgross@suse.com>, Ian Jackson <Ian.Jackson@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH 1/2] tools/libs/vchan: Don't run the headers check
Date: Mon, 14 Sep 2020 10:24:19 +0100
Message-ID: <20200914092420.20900-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200914092420.20900-1-andrew.cooper3@citrix.com>
References: <20200914092420.20900-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

There was never a headers check previously, and CentOS 6 can't cope with the
anonymous union in struct libxenvchan.

  cc1: warnings being treated as errors
  ... tools/include/libxenvchan.h:75: error: declaration does not declare anything
  make[6]: *** [headers.chk] Error 1

Fixes: 8ab2429f12 ("tools: split libxenvchan into new tools/libs/vchan directory")
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Juergen Gross <jgross@suse.com>
CC: Ian Jackson <Ian.Jackson@citrix.com>
CC: Wei Liu <wl@xen.org>
---
 tools/libs/vchan/Makefile | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tools/libs/vchan/Makefile b/tools/libs/vchan/Makefile
index 87ff608f45..5e18d5b196 100644
--- a/tools/libs/vchan/Makefile
+++ b/tools/libs/vchan/Makefile
@@ -8,6 +8,8 @@ LIBHEADER := libxenvchan.h
 SRCS-y += init.c
 SRCS-y += io.c
 
+NO_HEADERS_CHK := y
+
 include $(XEN_ROOT)/tools/libs/libs.mk
 
 $(PKG_CONFIG_LOCAL): PKG_CONFIG_INCDIR = $(XEN_libxenvchan)/include
-- 
2.11.0


