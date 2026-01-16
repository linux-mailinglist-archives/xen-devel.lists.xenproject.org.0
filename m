Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D6EAD2B736
	for <lists+xen-devel@lfdr.de>; Fri, 16 Jan 2026 05:35:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1206121.1519870 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vgbYE-0005vz-WD; Fri, 16 Jan 2026 04:35:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1206121.1519870; Fri, 16 Jan 2026 04:35:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vgbYE-0005t6-SW; Fri, 16 Jan 2026 04:35:10 +0000
Received: by outflank-mailman (input) for mailman id 1206121;
 Fri, 16 Jan 2026 04:35:08 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@xen.org>) id 1vgbYC-0005fx-Su
 for xen-devel@lists.xenproject.org; Fri, 16 Jan 2026 04:35:08 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <dmukhin@xen.org>) id 1vgbYC-006Czk-26;
 Fri, 16 Jan 2026 04:35:08 +0000
Received: from [19.12.91.86] (helo=localhost)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <dmukhin@xen.org>) id 1vgbYC-005RCB-0I;
 Fri, 16 Jan 2026 04:35:08 +0000
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
	bh=sstj4f6s3p4JgN2+Qmv2+rlNpy+6d5aRHrcXL1c5i4w=; b=gZkV7QGbSdUXvIrOgJn1marDGW
	E6xzxYxtMwlyS/7RIlLydtCmd19wXuI9ZsT80vwrTr+irZVLHjUiSHbysVZ70VOi3C4QN2/gxrjvr
	JspWSY7fknF6rbRkNB0gRhEAmb4/l63qWZSpIVOnPjGoCDwhIiSnQYZJeZSn4u1Mu62A=;
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
Subject: [PATCH v1 3/4] scripts/config: add -y|-n flags
Date: Thu, 15 Jan 2026 20:34:57 -0800
Message-ID: <20260116043458.730728-4-dmukhin@ford.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260116043458.730728-1-dmukhin@ford.com>
References: <20260116043458.730728-1-dmukhin@ford.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Denis Mukhin <dmukhin@ford.com> 

Add alias -y ("yes") to --enable and -n ("no") to --disable a Kconfig
option for better scripting experience.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
 xen/scripts/config | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/xen/scripts/config b/xen/scripts/config
index 1050812aae8d..1ede964320cf 100755
--- a/xen/scripts/config
+++ b/xen/scripts/config
@@ -16,8 +16,8 @@ Manipulate options in a .config file from the command line.
 Usage:
 $myname options command ...
 commands:
-	--enable|-e option   Enable option
-	--disable|-d option  Disable option
+	--enable|-e|-y|--yes    option   Enable option
+	--disable|-d|-n|--no    option   Disable option
 	--set-str option string
 	                     Set option to "string"
 	--set-val option value
@@ -166,11 +166,11 @@ while [ "$1" != "" ] ; do
 		;;
 	esac
 	case "$CMD" in
-	--enable|-e)
+	--enable|-e|-y|--yes)
 		set_var "${CONFIG_}$ARG" "${CONFIG_}$ARG=y"
 		;;
 
-	--disable|-d)
+	--disable|-d|-n|--no)
 		set_var "${CONFIG_}$ARG" "# ${CONFIG_}$ARG is not set"
 		;;
 
-- 
2.52.0


