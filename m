Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AED393FEAEA
	for <lists+xen-devel@lfdr.de>; Thu,  2 Sep 2021 11:00:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.177178.322449 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mLiZY-00057Z-CF; Thu, 02 Sep 2021 08:59:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 177178.322449; Thu, 02 Sep 2021 08:59:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mLiZY-00054n-8U; Thu, 02 Sep 2021 08:59:48 +0000
Received: by outflank-mailman (input) for mailman id 177178;
 Thu, 02 Sep 2021 08:59:46 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mLiZW-00054h-2F
 for xen-devel@lists.xenproject.org; Thu, 02 Sep 2021 08:59:46 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mLiZS-0000gz-9G; Thu, 02 Sep 2021 08:59:42 +0000
Received: from 54-240-197-224.amazon.com ([54.240.197.224]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mLiZS-0001SW-1B; Thu, 02 Sep 2021 08:59:42 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=AZFZoEmGVV9n+CJDtxX6UCmu2LESlsmMlXLemu/qy0c=; b=faZWoWpkJwZTY5H72pvskTMuuC
	lMzemWpbgKHYSfD4HcyWFy3LLmGqfNKx92KSTLkqie+UAU8e7gwzAdn8dtgyDTCHIK3bgLlOf+X+u
	IVi8zkEGayJIwEaUa2yKTkS6XbCuKsTZeahcLblGfEoj0KNpeSASX43BHTaX1ji9Rsao=;
Subject: Re: [PATCH] xen/arm: Introduce pmu_access parameter
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Michal Orzel <Michal.Orzel@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20210901124308.31573-1-michal.orzel@arm.com>
 <599515f0-4b8a-3a71-caea-b17ec27c9123@xen.org>
 <44B48162-EB44-4295-9629-2D95A40D7232@arm.com>
 <46e36ba5-8b3d-2d43-6297-b92d2654ab72@xen.org>
 <alpine.DEB.2.21.2109011045440.17925@sstabellini-ThinkPad-T480s>
 <0e72fb05-a477-ef79-c26f-bc011393a403@xen.org>
 <5B7B9C01-FF1D-44F9-8815-A422E51916A0@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <a7920989-f0e3-3eb1-5317-09e6bcd67211@xen.org>
Date: Thu, 2 Sep 2021 09:59:39 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <5B7B9C01-FF1D-44F9-8815-A422E51916A0@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 02/09/2021 08:57, Bertrand Marquis wrote:
> Hi Julien,

Hi Bertrand,

> If I understand it right, you want a per guest parameter to be able to allow PMU accesses.
> This would require:
> - to save/restore MDCR on context switch
> - introduce a new config parameter for guests (might or might not need a tool change)
> - have a xen command line parameter to have a solution to Allow PMU for dom0 (or maybe a DTB one)
Yes.

> 
> But this would NOT include:
> - interrupt support (only needed to get informed of overflow)
> - provide PMU virtualization (not even sure something like that could make much sense)

I am guessing the following is also included here:

- provide a PMU node in the DTB for the domain.

Without those 3, I feel we are exposing an half backed PMU to the guest. 
But this would still be a good first step, so I would be OK if they are 
not implemented in the first shot.

> 
> I am not saying that we will do that now but as I need to unblock this I could evaluate the effort and see if it could be possible to do this in the future.

Well... Below the patch I wrote during my breakfast this morning. This 
has not been tested and miss some documentation.

 From 690a92cffed82451dcbd8b966e8dee31c1dce5fc Mon Sep 17 00:00:00 2001
From: Julien Grall <jgrall@amazon.com>
Date: Thu, 2 Sep 2021 08:46:12 +0000
Subject: [PATCH] xen/arm: Expose the PMU to the guest

There are requests to expose the PMU (even in a hackish/non-secure way)
to the guests. This is taking the first steps by adding a per-domain
flag to disable the PMU traps.

Long term, we will want to at least expose the PMU interrupts, device-tree
binding. For more use cases, we will also need to save/restore the
PMU context.

Signed-off-by: Julien Grall <jgrall@amazon.com>
---
  tools/include/libxl.h            |  2 ++
  tools/libs/light/libxl_arm.c     |  3 +++
  tools/libs/light/libxl_types.idl |  2 ++
  tools/xl/xl_parse.c              |  3 +++
  xen/arch/arm/domain.c            | 10 ++++++++--
  xen/include/asm-arm/domain.h     |  1 +
  xen/include/public/domctl.h      |  4 ++++
  7 files changed, 23 insertions(+), 2 deletions(-)

diff --git a/tools/include/libxl.h b/tools/include/libxl.h
index b9ba16d69869..d3e795a38670 100644
--- a/tools/include/libxl.h
+++ b/tools/include/libxl.h
@@ -502,6 +502,8 @@
   */
  #define LIBXL_HAVE_X86_MSR_RELAXED 1

+#define LIBXL_HAVE_ARM_VPMU 1
+
  /*
   * libxl ABI compatibility
   *
diff --git a/tools/libs/light/libxl_arm.c b/tools/libs/light/libxl_arm.c
index e3140a6e0039..89865a90dd3e 100644
--- a/tools/libs/light/libxl_arm.c
+++ b/tools/libs/light/libxl_arm.c
@@ -29,6 +29,9 @@ int libxl__arch_domain_prepare_config(libxl__gc *gc,
      uint32_t vuart_irq;
      bool vuart_enabled = false;

+    if (d_config->b_info.arch.vpmu)
+        config->flags |= XEN_DOMCTL_CDF_PMU;
+
      /*
       * If pl011 vuart is enabled then increment the nr_spis to allow 
allocation
       * of SPI VIRQ for pl011.
diff --git a/tools/libs/light/libxl_types.idl 
b/tools/libs/light/libxl_types.idl
index 3f9fff653a4a..daf768cba568 100644
--- a/tools/libs/light/libxl_types.idl
+++ b/tools/libs/light/libxl_types.idl
@@ -644,6 +644,8 @@ libxl_domain_build_info = Struct("domain_build_info",[

      ("arch_arm", Struct(None, [("gic_version", libxl_gic_version),
                                 ("vuart", libxl_vuart_type),
+                              # XXX: Can this be common?
+                               ("vpmu", boolean)
                                ])),
      ("arch_x86", Struct(None, [("msr_relaxed", libxl_defbool),
                                ])),
diff --git a/tools/xl/xl_parse.c b/tools/xl/xl_parse.c
index 17dddb4cd534..6e497cc0b67e 100644
--- a/tools/xl/xl_parse.c
+++ b/tools/xl/xl_parse.c
@@ -2729,6 +2729,9 @@ skip_usbdev:
          }
      }

+    /* XXX: This probably want to be common or #ifdef-ed */
+    xlu_cfg_get_defbool(config, "vpmu", &b_info->arch_arm.vpmu, 0);
+
      if (!xlu_cfg_get_string (config, "tee", &buf, 1)) {
          e = libxl_tee_type_from_string(buf, &b_info->tee);
          if (e) {
diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
index 19c756ac3d46..a0e2321008ab 100644
--- a/xen/arch/arm/domain.c
+++ b/xen/arch/arm/domain.c
@@ -276,6 +276,9 @@ static void ctxt_switch_to(struct vcpu *n)
       * timer. The interrupt needs to be injected into the guest. */
      WRITE_SYSREG(n->arch.cntkctl, CNTKCTL_EL1);
      virt_timer_restore(n);
+
+    /* XXX: Check the position and synchronization requirement */
+    WRITE_SYSREG(n->arch.mdcr_el2, MDCR_EL2);
  }

  /* Update per-VCPU guest runstate shared memory area (if registered). */
@@ -585,6 +588,9 @@ int arch_vcpu_create(struct vcpu *v)
      v->arch.vmpidr = MPIDR_SMP | vcpuid_to_vaffinity(v->vcpu_id);

      v->arch.hcr_el2 = get_default_hcr_flags();
+    v->arch.mdcr_el2 = HDCR_TDRA|HDCR_TDOSA|HDCR_TDA;
+    if ( !(v->domain->options & XEN_DOMCTL_CDF_PMU) )
+        v->arch.mdcr_el2 |= HDCR_TPM|HDCR_TPMCR;

      if ( (rc = vcpu_vgic_init(v)) != 0 )
          goto fail;
@@ -622,8 +628,8 @@ int arch_sanitise_domain_config(struct 
xen_domctl_createdomain *config)
  {
      unsigned int max_vcpus;

-    /* HVM and HAP must be set. IOMMU may or may not be */
-    if ( (config->flags & ~XEN_DOMCTL_CDF_iommu) !=
+    /* HVM and HAP must be set. IOMMU and PMU may or may not be */
+    if ( (config->flags & ~(XEN_DOMCTL_CDF_iommu | XEN_DOMCTL_CDF_pmu)) !=
           (XEN_DOMCTL_CDF_hvm | XEN_DOMCTL_CDF_hap) )
      {
          dprintk(XENLOG_INFO, "Unsupported configuration %#x\n",
diff --git a/xen/include/asm-arm/domain.h b/xen/include/asm-arm/domain.h
index c9277b5c6d94..14e575288f77 100644
--- a/xen/include/asm-arm/domain.h
+++ b/xen/include/asm-arm/domain.h
@@ -166,6 +166,7 @@ struct arch_vcpu

      /* HYP configuration */
      register_t hcr_el2;
+    register_t mdcr_el2;

      uint32_t teecr, teehbr; /* ThumbEE, 32-bit guests only */
  #ifdef CONFIG_ARM_32
diff --git a/xen/include/public/domctl.h b/xen/include/public/domctl.h
index 96696e3842da..db9539ddd579 100644
--- a/xen/include/public/domctl.h
+++ b/xen/include/public/domctl.h
@@ -71,6 +71,10 @@ struct xen_domctl_createdomain {
  #define _XEN_DOMCTL_CDF_nested_virt   6
  #define XEN_DOMCTL_CDF_nested_virt    (1U << _XEN_DOMCTL_CDF_nested_virt)

+/* Should we expose the vPMU to the guest? */
+#define _XEN_DOMCTL_CDF_pmu           6
+#define XEN_DOMCTL_CDF_pmu            (1U<<_XEN_DOMCTL_CDF_pmu)
+
  /* Max XEN_DOMCTL_CDF_* constant.  Used for ABI checking. */
  #define XEN_DOMCTL_CDF_MAX XEN_DOMCTL_CDF_nested_virt

> In the meantime we will start maintaining an internal branch with patches refused upstream as this is blocking us.

For the future, please consider a per-domain option from the beginning. 
This is not much extra effort (see the patch above) and would make the 
acceptance of a patch more likely.

Cheers,

-- 
Julien Grall

