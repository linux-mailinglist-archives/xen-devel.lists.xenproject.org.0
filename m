Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB0BA506EFF
	for <lists+xen-devel@lfdr.de>; Tue, 19 Apr 2022 15:53:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.308149.523741 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ngoHu-0004aQ-JY; Tue, 19 Apr 2022 13:53:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 308149.523741; Tue, 19 Apr 2022 13:53:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ngoHu-0004V8-EL; Tue, 19 Apr 2022 13:53:02 +0000
Received: by outflank-mailman (input) for mailman id 308149;
 Tue, 19 Apr 2022 13:53:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Io9b=U5=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1ngoHs-0003n9-1V
 for xen-devel@lists.xenproject.org; Tue, 19 Apr 2022 13:53:00 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 053ec57a-bfe8-11ec-8fbe-03012f2f19d4;
 Tue, 19 Apr 2022 15:52:58 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 3886C1F750;
 Tue, 19 Apr 2022 13:52:58 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id DF56D132E7;
 Tue, 19 Apr 2022 13:52:57 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id qB5ZNbm+XmL/EgAAMHmgww
 (envelope-from <jgross@suse.com>); Tue, 19 Apr 2022 13:52:57 +0000
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
X-Inumbo-ID: 053ec57a-bfe8-11ec-8fbe-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1650376378; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6/VWhQSdoCzBqVa8x/quqgeEjSXetNd8IJxjXUoErU4=;
	b=M3cz+pB2CCUNe8C1A95O1lap4xXxEgJXnIhJva5g0Czvy8QIjRm4AVBN2V41i/jHVYaKQM
	qff3o6VRyCjFgOJDEMedddRdAIswQXmsyxyo7kbXiAijOsMh8Njq8WBQxfkQvum2Y6UoNa
	p0R2TGqhEdgPeYfl34L9V1G5S/jg1yQ=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Wei Liu <wl@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v3 3/3] xen/iommu: cleanup iommu related domctl handling
Date: Tue, 19 Apr 2022 15:52:54 +0200
Message-Id: <20220419135254.21729-4-jgross@suse.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220419135254.21729-1-jgross@suse.com>
References: <20220419135254.21729-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Today iommu_do_domctl() is being called from arch_do_domctl() in the
"default:" case of a switch statement. This has led already to crashes
due to unvalidated parameters.

Fix that by moving the call of iommu_do_domctl() to the main switch
statement of do_domctl().

Signed-off-by: Juergen Gross <jgross@suse.com>
---
Another possibility would even be to merge iommu_do_domctl() completely
into do_domctl(), but I wanted to start with a less intrusive variant.
V3:
- new patch
---
 xen/arch/arm/domctl.c | 11 +----------
 xen/arch/x86/domctl.c |  2 +-
 xen/common/domctl.c   |  7 +++++++
 3 files changed, 9 insertions(+), 11 deletions(-)

diff --git a/xen/arch/arm/domctl.c b/xen/arch/arm/domctl.c
index 6245af6d0b..1baf25c3d9 100644
--- a/xen/arch/arm/domctl.c
+++ b/xen/arch/arm/domctl.c
@@ -176,16 +176,7 @@ long arch_do_domctl(struct xen_domctl *domctl, struct domain *d,
         return rc;
     }
     default:
-    {
-        int rc;
-
-        rc = subarch_do_domctl(domctl, d, u_domctl);
-
-        if ( rc == -ENOSYS )
-            rc = iommu_do_domctl(domctl, d, u_domctl);
-
-        return rc;
-    }
+        return subarch_do_domctl(domctl, d, u_domctl);
     }
 }
 
diff --git a/xen/arch/x86/domctl.c b/xen/arch/x86/domctl.c
index a6aae500a3..c9699bb868 100644
--- a/xen/arch/x86/domctl.c
+++ b/xen/arch/x86/domctl.c
@@ -1380,7 +1380,7 @@ long arch_do_domctl(
         break;
 
     default:
-        ret = iommu_do_domctl(domctl, d, u_domctl);
+        ret = -ENOSYS;
         break;
     }
 
diff --git a/xen/common/domctl.c b/xen/common/domctl.c
index 5879117580..0a866e3132 100644
--- a/xen/common/domctl.c
+++ b/xen/common/domctl.c
@@ -871,6 +871,13 @@ long cf_check do_domctl(XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
             copyback = 1;
         break;
 
+    case XEN_DOMCTL_assign_device:
+    case XEN_DOMCTL_test_assign_device:
+    case XEN_DOMCTL_deassign_device:
+    case XEN_DOMCTL_get_device_group:
+        ret = iommu_do_domctl(op, d, u_domctl);
+        break;
+
     default:
         ret = arch_do_domctl(op, d, u_domctl);
         break;
-- 
2.34.1


