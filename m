Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 998885EA260
	for <lists+xen-devel@lfdr.de>; Mon, 26 Sep 2022 13:06:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.411652.654690 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oclwW-00063s-Jg; Mon, 26 Sep 2022 11:06:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 411652.654690; Mon, 26 Sep 2022 11:06:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oclwW-00060M-Gd; Mon, 26 Sep 2022 11:06:32 +0000
Received: by outflank-mailman (input) for mailman id 411652;
 Mon, 26 Sep 2022 11:06:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=t0pF=Z5=citrix.com=prvs=2617546cc=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1oclwV-0004X6-9u
 for xen-devel@lists.xenproject.org; Mon, 26 Sep 2022 11:06:31 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 44494ba1-3d8b-11ed-9648-05401a9f4f97;
 Mon, 26 Sep 2022 13:06:29 +0200 (CEST)
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
X-Inumbo-ID: 44494ba1-3d8b-11ed-9648-05401a9f4f97
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1664190389;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=A69e8qCkoQP+7VHX14D5jJMCbKo+87SB5WfxZWudyP8=;
  b=KGoslosMgyImpmeHo9FU/PMsBaiB9bJq1oGPY7JspNWlvCYwfyqBKJaz
   6mySz1j1iIW6Z1dl6Zihp3pNWo2d5KAKbkbcMa4gIZJrXPNSEWo4H0j0g
   bA89AlnJh7o0NhPwz/LF8gurx2gNEZlYncXuimO6jaJNfwNNqKeerJcOq
   E=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 2.7
X-MesageID: 80472748
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:lGQLpaMT1Ow3xszvrR2Dl8FynXyQoLVcMsEvi/4bfWQNrUpw3mBUx
 2ZOXWqHaKvbamD3KN9zPomxox4CucPWzIJgTgto+SlhQUwRpJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdleF+lH3dOCJQUBUjcmgXqD7BPPPJhd/TAplTDZJoR94kqsyj5UAbeKRWmthg
 vuv5ZyEULOZ82QsaDhMuvje8EkHUMna41v0gHRvPZing3eG/5UlJMp3Db28KXL+Xr5VEoaSL
 woU5Ojklo9x105F5uKNyt4XQGVTKlLhFVHmZk5tc7qjmnB/Shkaic7XAha+hXB/0F1ll/gpo
 DlEWAfZpQ0BZsUgk8xFO/VU/r0X0QSrN9YrLFDm2fF/wXEqfFP8gNtPHRAmB7QU0edvMCJK3
 9IVbzQkO0Xra+KemNpXS8Fpj8UnasLqIJkeqjdryjSx4fQOGM6ZBf+QvJkBgWl21psm8fX2P
 qL1bRJGahjabgIJEVAQEJ8kx8+jh2Xlci0eo1WQzUYyyziLkFMrj+S9WDbTUuSOGcQKz1ibn
 zjf8XWmOhEQE8aR1jXQpxpAgceQxHimCer+DoaQ8/dwhVSJy287CRsIVEC6q/20lk6/Xd1EL
 0UevCEpqMAa1EGtVMi7YBS+r1aNpBtaUN1Ve8Uq5QfIxqfK7gKxAmkfUiUHeNEgrNUxRzEhy
 hmOhdyBLR5FvaCRSHmd3qyJtj70Mi8QRVLufgddE1FDuYO65thu0FSfFb6PDZJZkPXlWh/R0
 mGalhEyrLQLvI0P/Yu2ulTu1mfESofyciY54QDeX2SA5wx/ZZK4a4HA1WU3/cqsP67CEADf4
 SFsd9y2qblXUMrTzHDlrPAlRunB2hqTDNHLbbeD9bEF/i/lxXOsdJs4DNpWdBYwaZZsldMEj
 SbuVeJtCH17ZiHCgUxfOdjZ5yEWIU/IS7zYugj8NIYmX3SIXFbvENtSTUCRxXvxt0MnjLsyP
 5yWGe71UyhGUP8/nWLnHL5BuVPO+szZ7TK7eHwG507/jer2iIC9EN/pz2dinshmtfjZ8W05A
 v5UNteQygU3bdASlhL/qNdLRW3m2FBhWvgaXeQLKbPYSuencUl9Y8LsLUQJINU7wvQIyb2Sp
 hlQmCZwkTLCuJEOEi3SAlgLVV8ldcoXQa4TVcD0AWuV5g==
IronPort-HdrOrdr: A9a23:mopHzq5tKVT1+uMEqQPXwMbXdLJyesId70hD6qhwISY1TiX+rb
 HJoB17726StN9/YgBCpTntAsa9qBDnhPpICOsqTNWftWDd0QPCRuwP0WKL+UyYJ8SUzI5gPM
 lbHZSWcOeAaGRHsQ==
X-IronPort-AV: E=Sophos;i="5.93,345,1654574400"; 
   d="scan'208";a="80472748"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?=
	<marmarek@invisiblethingslab.com>, Henry Wang <Henry.Wang@arm.com>
Subject: [PATCH] drivers/char: Fix build when CET-IBT is enabled
Date: Mon, 26 Sep 2022 12:05:47 +0100
Message-ID: <20220926110547.21287-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

https://gitlab.com/xen-project/xen/-/jobs/3083068950#L1763

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Fixes: 022e40edd4dc ("drivers/char: allow using both dbgp=xhci and dbgp=ehci")
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
CC: Henry Wang <Henry.Wang@arm.com>
---
 xen/drivers/char/ehci-dbgp.c | 2 +-
 xen/drivers/char/xhci-dbc.c  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/xen/drivers/char/ehci-dbgp.c b/xen/drivers/char/ehci-dbgp.c
index 8a0b95850609..bb9d3198d9f2 100644
--- a/xen/drivers/char/ehci-dbgp.c
+++ b/xen/drivers/char/ehci-dbgp.c
@@ -1465,7 +1465,7 @@ static struct ehci_dbgp ehci_dbgp = { .state = dbgp_unsafe, .phys_port = 1 };
 
 static char __initdata opt_dbgp[30];
 
-static int __init parse_ehci_dbgp(const char *opt)
+static int __init cf_check parse_ehci_dbgp(const char *opt)
 {
     if ( strncmp(opt, "ehci", 4) )
         return 0;
diff --git a/xen/drivers/char/xhci-dbc.c b/xen/drivers/char/xhci-dbc.c
index 5f92234a9594..43ed64a004e2 100644
--- a/xen/drivers/char/xhci-dbc.c
+++ b/xen/drivers/char/xhci-dbc.c
@@ -1282,7 +1282,7 @@ struct dbc_dma_bufs {
 static struct dbc_dma_bufs __section(".bss.page_aligned") __aligned(PAGE_SIZE)
     dbc_dma_bufs;
 
-static int __init xhci_parse_dbgp(const char *opt_dbgp)
+static int __init cf_check xhci_parse_dbgp(const char *opt_dbgp)
 {
     struct dbc_uart *uart = &dbc_uart;
     struct dbc *dbc = &uart->dbc;
-- 
2.11.0


