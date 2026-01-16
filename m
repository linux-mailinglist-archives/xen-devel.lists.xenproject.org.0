Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 65BCAD2B739
	for <lists+xen-devel@lfdr.de>; Fri, 16 Jan 2026 05:35:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1206120.1519856 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vgbYC-0005X5-Oy; Fri, 16 Jan 2026 04:35:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1206120.1519856; Fri, 16 Jan 2026 04:35:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vgbYC-0005Tk-K2; Fri, 16 Jan 2026 04:35:08 +0000
Received: by outflank-mailman (input) for mailman id 1206120;
 Fri, 16 Jan 2026 04:35:07 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@xen.org>) id 1vgbYB-0005MO-JA
 for xen-devel@lists.xenproject.org; Fri, 16 Jan 2026 04:35:07 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <dmukhin@xen.org>) id 1vgbYB-006Cyn-1p;
 Fri, 16 Jan 2026 04:35:07 +0000
Received: from [19.12.91.86] (helo=localhost)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <dmukhin@xen.org>) id 1vgbYA-005RC5-3D;
 Fri, 16 Jan 2026 04:35:07 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From;
	bh=vQ+i0Se3Q6gtbukAXmyZwLdyrtEvtzopHHyFl1Djo1M=; b=CrTbsrOnyAz9/uMEjxsjNsTQMx
	HjJgrENTOYUKVFIS5klb19G8jo1F/ReyqC/PSdocVSGqUR3a0UlLF1DwDPVIkpOUJLzrdgGykQP3h
	oDrKZYuaYsdON0scIrWVxhT4lGcR8wyox+UNAb/Ento25iQzchV0zIk3H41W/L86FOqY=;
From: dmukhin@xen.org
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com,
	anthony.perard@vates.tech,
	jbeulich@suse.com,
	julien@xen.org,
	michal.orzel@amd.com,
	roger.pau@citrix.com,
	sstabellini@kernel.org,
	dmukhin@ford.com
Subject: [PATCH v1 2/4] scripts/config: drop modules support
Date: Thu, 15 Jan 2026 20:34:56 -0800
Message-ID: <20260116043458.730728-3-dmukhin@ford.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260116043458.730728-1-dmukhin@ford.com>
References: <20260116043458.730728-1-dmukhin@ford.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Denis Mukhin <dmukhin@ford.com> 

Drop the --module (-m) and --module-after (-M) options, as Xen
does not support loadable modules, so options are not applicable.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
 xen/scripts/config | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/xen/scripts/config b/xen/scripts/config
index ea475c07de28..1050812aae8d 100755
--- a/xen/scripts/config
+++ b/xen/scripts/config
@@ -18,7 +18,6 @@ $myname options command ...
 commands:
 	--enable|-e option   Enable option
 	--disable|-d option  Disable option
-	--module|-m option   Turn option into a module
 	--set-str option string
 	                     Set option to "string"
 	--set-val option value
@@ -30,8 +29,6 @@ commands:
                              Enable option directly after other option
 	--disable-after|-D beforeopt option
                              Disable option directly after other option
-	--module-after|-M beforeopt option
-                             Turn option into module directly after other option
 	--refresh            Refresh the config using old settings
 
 	commands can be repeated multiple times
@@ -177,10 +174,6 @@ while [ "$1" != "" ] ; do
 		set_var "${CONFIG_}$ARG" "# ${CONFIG_}$ARG is not set"
 		;;
 
-	--module|-m)
-		set_var "${CONFIG_}$ARG" "${CONFIG_}$ARG=m"
-		;;
-
 	--set-str)
 		# sed swallows one level of escaping, so we need double-escaping
 		set_var "${CONFIG_}$ARG" "${CONFIG_}$ARG=\"${1//\"/\\\\\"}\""
@@ -220,10 +213,6 @@ while [ "$1" != "" ] ; do
 		set_var "${CONFIG_}$B" "# ${CONFIG_}$B is not set" "${CONFIG_}$A"
 		;;
 
-	--module-after|-M)
-		set_var "${CONFIG_}$B" "${CONFIG_}$B=m" "${CONFIG_}$A"
-		;;
-
 	--refresh)
 		yes "" | make oldconfig KCONFIG_CONFIG=$FN
 		;;
-- 
2.52.0


