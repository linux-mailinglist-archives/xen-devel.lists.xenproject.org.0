Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AE853F5C9A
	for <lists+xen-devel@lfdr.de>; Tue, 24 Aug 2021 13:01:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.170962.312089 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIUBI-0003wf-2f; Tue, 24 Aug 2021 11:01:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 170962.312089; Tue, 24 Aug 2021 11:01:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIUBH-0003ug-TC; Tue, 24 Aug 2021 11:01:23 +0000
Received: by outflank-mailman (input) for mailman id 170962;
 Tue, 24 Aug 2021 11:01:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MxNM=NP=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1mIU2g-0003Ux-Ax
 for xen-devel@lists.xenproject.org; Tue, 24 Aug 2021 10:52:30 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 494f4692-04c9-11ec-a8c5-12813bfff9fa;
 Tue, 24 Aug 2021 10:51:51 +0000 (UTC)
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
X-Inumbo-ID: 494f4692-04c9-11ec-a8c5-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1629802310;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=vEelbM4UoXbBjdC2Us5bYDimWRQuQticI4pfz6oeico=;
  b=AtqoZtSTf0BBr4W/oSLNxSVY5Zaw0EqmcVbxNYZiltMktQG0r8WcdY3H
   8z+tcwCgfDLIiksRIzoVa2Vf2T+VxAOG363zSmiNF4Es7Df9MtUsUQCzQ
   k6UYZExK/C8cxShyQvOp+4s/vbhYvaIBXOaLNAyZqD6EgGEmJ/yGomZw/
   o=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: K/J/akUfpicZ6OzK9IaEFb0RO9niAiRqNr7aZimZGWj5ic+hUsiB3DOwWn15nxWmazaz/lZ+PC
 nSxUYSxF4LlJdaqayN7IJJfWYA031dK8nR4uEnnFPJJwBTxFihoNdSHgIVY+vlUVOd2rN9HAGP
 1WVYfGKEQ7tVsUTYM4Lw9sEJPFhetQykunHnIy2FVNAUR8Yu4WSjiH8F9D4STYjuYX8hSiXKmD
 wee8e4qRr/F2tgFOceRTrei1PIbt8e+hPfBqv6wJQeQHTzvbN9BXrA557ThYnk7kV7qKHaaEWq
 lLECsuzaxC6Sg8SRa4Uii0of
X-SBRS: 5.1
X-MesageID: 50772220
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:a1Duva4RO7YUTBA3uQPXwPDXdLJyesId70hD6qhwISY6TiX+rb
 HJoB17726NtN9/YhEdcLy7VJVoBEmskKKdgrNhWotKPjOW21dARbsKheCJrgEIWReOktK1vZ
 0QCpSWY+eQMbEVt6nHCXGDYrQd/OU=
X-IronPort-AV: E=Sophos;i="5.84,347,1620705600"; 
   d="scan'208";a="50772220"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Doug Goldstein
	<cardoe@cardoe.com>
Subject: [XEN PATCH v7 31/51] xen/tools/kconfig: fix build with -Wdeclaration-after-statement
Date: Tue, 24 Aug 2021 11:50:18 +0100
Message-ID: <20210824105038.1257926-32-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210824105038.1257926-1-anthony.perard@citrix.com>
References: <20210824105038.1257926-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

We are going to start building kconfig with HOSTCFLAGS from Config.mk,
it has the flag "-Wdeclaration-after-statement".

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---
 xen/tools/kconfig/confdata.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/tools/kconfig/confdata.c b/xen/tools/kconfig/confdata.c
index 3569d2dec37c..a69250c91355 100644
--- a/xen/tools/kconfig/confdata.c
+++ b/xen/tools/kconfig/confdata.c
@@ -1237,6 +1237,7 @@ void set_all_choice_values(struct symbol *csym)
 
 bool conf_set_all_new_symbols(enum conf_def_mode mode)
 {
+	bool has_changed = false;
 	struct symbol *sym, *csym;
 	int i, cnt, pby, pty, ptm;	/* pby: probability of bool     = y
 					 * pty: probability of tristate = y
@@ -1283,7 +1284,6 @@ bool conf_set_all_new_symbols(enum conf_def_mode mode)
 			exit( 1 );
 		}
 	}
-	bool has_changed = false;
 
 	for_all_symbols(i, sym) {
 		if (sym_has_value(sym) || (sym->flags & SYMBOL_VALID))
-- 
Anthony PERARD


