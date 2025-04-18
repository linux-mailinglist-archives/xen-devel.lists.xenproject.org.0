Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F379BA93885
	for <lists+xen-devel@lfdr.de>; Fri, 18 Apr 2025 16:19:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.959028.1351522 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5mYJ-0003Gn-LW; Fri, 18 Apr 2025 14:18:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 959028.1351522; Fri, 18 Apr 2025 14:18:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5mYJ-0003EY-I6; Fri, 18 Apr 2025 14:18:47 +0000
Received: by outflank-mailman (input) for mailman id 959028;
 Fri, 18 Apr 2025 14:18:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=A0mK=XE=bounce.vates.tech=bounce-md_30504962.68025f43.v1-3200c3f3986847c79b468e7e43cd30ba@srs-se1.protection.inumbo.net>)
 id 1u5mYI-00030I-8i
 for xen-devel@lists.xenproject.org; Fri, 18 Apr 2025 14:18:46 +0000
Received: from mail128-130.atl41.mandrillapp.com
 (mail128-130.atl41.mandrillapp.com [198.2.128.130])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 08d4ebca-1c60-11f0-9ffb-bf95429c2676;
 Fri, 18 Apr 2025 16:18:44 +0200 (CEST)
Received: from pmta08.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail128-130.atl41.mandrillapp.com (Mailchimp) with ESMTP id
 4ZfH1b2zgczS62GpR
 for <xen-devel@lists.xenproject.org>; Fri, 18 Apr 2025 14:18:43 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 3200c3f3986847c79b468e7e43cd30ba; Fri, 18 Apr 2025 14:18:43 +0000
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
X-Inumbo-ID: 08d4ebca-1c60-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1744985923; x=1745255923;
	bh=J8m3l8jLgJoz45tuYz9GxQr5xWvose2J1Z3O7gpBIvU=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=qcQ00cSL8ayn5ry8W81StmFp1NKGS+MrKNdGSZpOcvsw9wmgUgAfYXZhMUEGwavaO
	 MHpgnjlTu05U/vreBDsTG4yzd55/jwMKS1s5C6W1NsBntwS7RQoKN2RfAtPHJsB7Hf
	 a64HqQVGN9vblmgTctfVQ5cpDQ/1POJJNtdH8OUdKbY8suyb4uepzxSB74FNu550ob
	 WhMJmFV18F4IgiC4Cp3uBoRIrru5PiI7k1XlljdxljA9MUw/2fF+Dzr7w8h0RHbyng
	 p+lQCHPS0F2YRnRjG7bBuI/Hu45d5xHs0om4m6LCdiTG5190m4wUN3P8lL6S3nkjRw
	 HuymTIGol2g6Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1744985923; x=1745246423; i=teddy.astie@vates.tech;
	bh=J8m3l8jLgJoz45tuYz9GxQr5xWvose2J1Z3O7gpBIvU=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=COFsAl0BbMxAJyNev1nL5BpPDeXF8hClJZQS/HZw+rewjynCYDF8KWNaTHb8o+ILC
	 jn0qlo64bWTYB3ShvtrjNtysvGbV7QVGcfeoeqjP7HrvHTQJycXaIVan+fvt3+hWSE
	 yr2WTzFfAOsxkQk3HPv/mruIa84I4F+ZvlRlv3l8kFsm5RGvLoD5pJW9N+GDQP4W//
	 8H2oNuMbyANcZmQlT1zmXUF7H7M5BhOsrxoay9nWcRh4wYTILwthQC4P8HH8Rf8HMV
	 RjaJrjEdMrnS/JE/4ei6ILJhs9CgF+oUAnzAL8EDbatNpfTS6loSKjx4Z+lMcIAl0k
	 OV8cTNGcLKlew==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?[RFC=20PATCH=201/4]=20xen:=20Introduce=20physaddr=5Fabi=20CDF=20flag?=
X-Mailer: git-send-email 2.47.2
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1744985922135
To: xen-devel@lists.xenproject.org
Cc: "Teddy Astie" <teddy.astie@vates.tech>, "Andrew Cooper" <andrew.cooper3@citrix.com>, "Anthony PERARD" <anthony.perard@vates.tech>, "Michal Orzel" <michal.orzel@amd.com>, "Jan Beulich" <jbeulich@suse.com>, "Julien Grall" <julien@xen.org>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>, "Stefano Stabellini" <sstabellini@kernel.org>
Message-Id: <df0da6d56a9a9ca440b7bb2c7c0b71d66567e3aa.1744981654.git.teddy.astie@vates.tech>
In-Reply-To: <cover.1744981654.git.teddy.astie@vates.tech>
References: <cover.1744981654.git.teddy.astie@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.3200c3f3986847c79b468e7e43cd30ba?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20250418:md
Date: Fri, 18 Apr 2025 14:18:43 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Introduce the physaddr_abi flag to indicate that the guest uses
physical addresses (gpaddr) instead of virtual addresses when
performing hypercalls.

Signed-off-by: Teddy Astie <teddy.astie@vates.tech>
---
 xen/common/domain.c         | 10 +++++++++-
 xen/include/public/domctl.h |  4 +++-
 xen/include/xen/sched.h     |  6 ++++++
 3 files changed, 18 insertions(+), 2 deletions(-)

diff --git a/xen/common/domain.c b/xen/common/domain.c
index 585fd726a9..1a1e51c32d 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -716,12 +716,14 @@ static int sanitise_domain_config(struct xen_domctl_createdomain *config)
     bool hap = config->flags & XEN_DOMCTL_CDF_hap;
     bool iommu = config->flags & XEN_DOMCTL_CDF_iommu;
     bool vpmu = config->flags & XEN_DOMCTL_CDF_vpmu;
+    bool physaddr_abi = config->flags & XEN_DOMCTL_CDF_physaddr_abi;
 
     if ( config->flags &
          ~(XEN_DOMCTL_CDF_hvm | XEN_DOMCTL_CDF_hap |
            XEN_DOMCTL_CDF_s3_integrity | XEN_DOMCTL_CDF_oos_off |
            XEN_DOMCTL_CDF_xs_domain | XEN_DOMCTL_CDF_iommu |
-           XEN_DOMCTL_CDF_nested_virt | XEN_DOMCTL_CDF_vpmu) )
+           XEN_DOMCTL_CDF_nested_virt | XEN_DOMCTL_CDF_vpmu |
+           XEN_DOMCTL_CDF_physaddr_abi) )
     {
         dprintk(XENLOG_INFO, "Unknown CDF flags %#x\n", config->flags);
         return -EINVAL;
@@ -745,6 +747,12 @@ static int sanitise_domain_config(struct xen_domctl_createdomain *config)
         return -EINVAL;
     }
 
+    if ( physaddr_abi && !hvm )
+    {
+        dprintk(XENLOG_INFO, "Physical address ABI requested for non-HVM guest");
+        return -EINVAL;
+    }
+
     if ( iommu )
     {
         if ( config->iommu_opts & ~XEN_DOMCTL_IOMMU_no_sharept )
diff --git a/xen/include/public/domctl.h b/xen/include/public/domctl.h
index 5b2063eed9..3a77efe673 100644
--- a/xen/include/public/domctl.h
+++ b/xen/include/public/domctl.h
@@ -66,9 +66,11 @@ struct xen_domctl_createdomain {
 #define XEN_DOMCTL_CDF_nested_virt    (1U << _XEN_DOMCTL_CDF_nested_virt)
 /* Should we expose the vPMU to the guest? */
 #define XEN_DOMCTL_CDF_vpmu           (1U << 7)
+/* Do the guest use physical addresses for hypercalls ? */
+#define XEN_DOMCTL_CDF_physaddr_abi   (1U << 8)
 
 /* Max XEN_DOMCTL_CDF_* constant.  Used for ABI checking. */
-#define XEN_DOMCTL_CDF_MAX XEN_DOMCTL_CDF_vpmu
+#define XEN_DOMCTL_CDF_MAX XEN_DOMCTL_CDF_physaddr_abi
 
     uint32_t flags;
 
diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
index 559d201e0c..a29c63c737 100644
--- a/xen/include/xen/sched.h
+++ b/xen/include/xen/sched.h
@@ -1201,6 +1201,12 @@ static always_inline bool hap_enabled(const struct domain *d)
         evaluate_nospec(d->options & XEN_DOMCTL_CDF_hap);
 }
 
+static always_inline bool is_hvm_physaddr_abi(const struct domain *d)
+{
+    return IS_ENABLED(CONFIG_HVM) &&
+        evaluate_nospec(d->options & XEN_DOMCTL_CDF_physaddr_abi);
+}
+
 static inline bool is_hwdom_pinned_vcpu(const struct vcpu *v)
 {
     return (is_hardware_domain(v->domain) &&
-- 
2.47.2



Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


