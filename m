Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C430A97312E
	for <lists+xen-devel@lfdr.de>; Tue, 10 Sep 2024 12:09:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.795238.1204510 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1snxoG-00087d-SN; Tue, 10 Sep 2024 10:09:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 795238.1204510; Tue, 10 Sep 2024 10:09:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1snxoG-000801-Ef; Tue, 10 Sep 2024 10:09:20 +0000
Received: by outflank-mailman (input) for mailman id 795238;
 Tue, 10 Sep 2024 10:09:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hUAX=QI=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1snxoE-0006in-7M
 for xen-devel@lists.xenproject.org; Tue, 10 Sep 2024 10:09:18 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bc53b0c0-6f5c-11ef-99a1-01e77a169b0f;
 Tue, 10 Sep 2024 12:09:16 +0200 (CEST)
Received: from truciolo.homenet.telecomitalia.it
 (host-79-37-206-90.retail.telecomitalia.it [79.37.206.90])
 by support.bugseng.com (Postfix) with ESMTPSA id 76D014EE07C1;
 Tue, 10 Sep 2024 12:09:15 +0200 (CEST)
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
X-Inumbo-ID: bc53b0c0-6f5c-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bugseng.com; s=mail;
	t=1725962955; bh=TsJsXtd4r9xjmbF6+cJgP+YCx8JcIm1qmbkTjh4sQ5s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=uwM8yz1fk+JApAYno/Xlf3i19qPtgqfR5C1AeMgzmGkHbCpYY+Te+6X9HV9zAkshS
	 wdyusJe1fBLS8POq+8S8Vc3+yalVk6hWXQOb9/mImaArrQv1wu6CC+SMIms+1bcdBq
	 t8YuMaWW7H+9z2bATKokDe+jEvCcGpXc0ZwMktWgP8jsSeGTE6QCALwFsLUlTkdAcA
	 OL6lfz4DbVD5+VG6HAf1mg59viPwmmvpvwQ16ccntflw82wGxVyD3+DbncJnrmGJDM
	 lKdxlCr4ZBM/DrzJkMnHegXAEBjYnZNVT2g+bLz54RvYfR8c/0Orp/vfFcNeTzdD54
	 s8cBxcmmUI5RA==
From: Federico Serafini <federico.serafini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Federico Serafini <federico.serafini@bugseng.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [XEN PATCH 07/12] x86/mmcfg: address violation of MISRA C Rule 16.3
Date: Tue, 10 Sep 2024 12:08:59 +0200
Message-Id: <daefd5159c38431e2a48b8a94a255f74d07261c4.1725958416.git.federico.serafini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1725958416.git.federico.serafini@bugseng.com>
References: <cover.1725958416.git.federico.serafini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Address a violation of MISRA C:2012 Rule 16.3:
"An unconditional `break' statement shall terminate every
switch-clause".

No functional change.

Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
---
 xen/arch/x86/x86_64/mmconfig-shared.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/xen/arch/x86/x86_64/mmconfig-shared.c b/xen/arch/x86/x86_64/mmconfig-shared.c
index b3b2da7362..77ba1e28f1 100644
--- a/xen/arch/x86/x86_64/mmconfig-shared.c
+++ b/xen/arch/x86/x86_64/mmconfig-shared.c
@@ -112,6 +112,7 @@ static const char *__init cf_check pci_mmcfg_intel_945(void)
         break;
     default:
         pci_mmcfg_config_num = 0;
+        break;
     }
 
     /* Errata #2, things break when not aligned on a 256Mb boundary */
-- 
2.34.1


