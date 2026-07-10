Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id EpLJM1j6UGp+9QIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jul 2026 15:57:44 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CCEF73B81F
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jul 2026 15:57:44 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=vates.tech header.s=selector1 header.b=Jd5f6J13;
	dmarc=pass (policy=none) header.from=vates.tech;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.1359407.1613006 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wiBjU-00051S-Ch; Fri, 10 Jul 2026 13:57:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1359407.1613006; Fri, 10 Jul 2026 13:57:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wiBjU-0004z6-7P; Fri, 10 Jul 2026 13:57:36 +0000
Received: by outflank-mailman (input) for mailman id 1359407;
 Fri, 10 Jul 2026 13:57:34 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19f4c5194c3000edb5@swg.vates.tech>)
 id 1wiBjS-0004xj-LF
 for xen-devel@lists.xenproject.org; Fri, 10 Jul 2026 13:57:34 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wiBjS-00F3Mk-1u
 for xen-devel@lists.xenproject.org; Fri, 10 Jul 2026 15:57:34 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19f4c5194c3000edb5@swg.vates.tech>)
 id 6a50fa36-5cb7-0a2a0a5109dd-0a2a4507894a-36
 for <xen-devel@lists.xenproject.org>; Fri, 10 Jul 2026 15:57:34 +0200
Received: from [185.255.28.35] (helo=prod-mta-13-02.swg-srv.net)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.2)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19f4c5194c3000edb5@swg.vates.tech>)
 id 6a50fa4d-ac46-0a2a45070019-b9ff1c23920d-3
 for <xen-devel@lists.xenproject.org>; Fri, 10 Jul 2026 15:57:33 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-02.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19f4c5194c3000edb5.00b for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 10 Jul 2026 13:57:22 +0000
Received: from julian.home (lfbn-gre-1-197-6.w90-112.abo.wanadoo.fr
 [90.112.16.6]) (Authenticated sender: julian.vetter@vates.tech)
 by mail2.vates.fr (Postfix) with ESMTPSA id E87BE820B8;
 Fri, 10 Jul 2026 15:57:21 +0200 (CEST)
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
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech;
 q=dns/txt; s=selector1; bh=KCeEks6QDNEl8+CB/TN5qB2vfef2xtiKavZmLJ3+6HA=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=Jd5f6J13Ar/DcRcSWPt1FRwdWlU8kngoM0w92IZ+wbeD6ZIOkVeT8Ulo/smmECeQu/387TG5G
 suNtTBr0fLXL76aI7/bf5ROl09pqqq3inK2iyETUPO7knrg2ejZZpARDrcCD9kLEYhxQa4pm/tc
 A1IaAmFryD2eDSrRbt3NN6y5ZcJJilIifOA8ypkNpO789e7+ftZ4sELW6SMv22w32jrj1BsPO4H
 JikUq4hgNOEApWhIioCrLLUUGoYLBVXMVbd1bCzDQOB0N/BbZNQv361XhfhDGfm/pkwDvpkY138
 6U85n12Rj8ITVveiVhQpBr7aKzy9nwN3O8CY6Od5LE8Q==
X-Zone-Loop: 54a2ed4566160615818d05f5a4f3ae4b632f55e48db4
x-campaign-type: default
x-transaction-id: 5e4c2080-f9f9-4ea1-b8f0-4bc3c81c7722
x-swg-uid: 01-2ce26901-d131-4059-9122-ebd3e8a0a0ef
X-Mailer: Sweego
Message-ID:
 <1783691842.8631fc262581453bbf619ec5b2062170.19f4c5194c3000edb5@vates.tech>
x-swg-bid: 1783691842.8631fc262581453bbf619ec5b2062170.19f4c5194c3000edb5
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
From: Julian Vetter <julian.vetter@vates.tech>
To: xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@vates.tech>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Juergen Gross <jgross@suse.com>,
	Andrii Sultanov <andriy.sultanov@vates.tech>,
	Guillaume Thouvenin <guillaume.thouvenin@vates.tech>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Oleksii Moisieiev <oleksii_moisieiev@epam.com>,
	Timothy Pearson <tpearson@raptorengineering.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Teddy Astie <teddy.astie@vates.tech>,
	Julian Vetter <julian.vetter@vates.tech>
Subject: [PATCH v2 3/6] xen/arm: choose GIC version explicitly instead of GIC_NATIVE
Date: Fri, 10 Jul 2026 15:57:08 +0200
In-Reply-To: <20260710135711.301993-1-julian.vetter@vates.tech>
References: <20260710135503.301746-1-julian.vetter@vates.tech>
 <20260710135711.301993-1-julian.vetter@vates.tech>
MIME-Version: 1.0
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.635.fa96f48aa331bd50.19f4c5192c3.fb37ab5d552954fb=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1783691842243
X-purgate-ID: tlsNG-ef75cf/1783691854-1EB69201-EE30796D/0/0
X-purgate-type: clean
X-purgate-size: 10790
X-Rspamd-Action: no action
X-Spamd-Result: default: False [2.33 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MIME_MA_MISSING_HTML(1.00)[];
	URI_COUNT_ODD(1.00)[1];
	DMARC_POLICY_ALLOW(-0.50)[vates.tech,none];
	R_DKIM_ALLOW(-0.20)[vates.tech:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[multipart/alternative,text/plain];
	XM_UA_NO_VERSION(0.01)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:anthony.perard@vates.tech,m:andrew.cooper3@citrix.com,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:jgross@suse.com,m:andriy.sultanov@vates.tech,m:guillaume.thouvenin@vates.tech,m:marmarek@invisiblethingslab.com,m:bertrand.marquis@arm.com,m:Volodymyr_Babchuk@epam.com,m:oleksii_moisieiev@epam.com,m:tpearson@raptorengineering.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:oleksii.kurochko@gmail.com,m:teddy.astie@vates.tech,m:julian.vetter@vates.tech,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+,1:+];
	FORGED_SENDER(0.00)[julian.vetter@vates.tech,xen-devel-bounces@lists.xenproject.org];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FREEMAIL_CC(0.00)[vates.tech,citrix.com,amd.com,suse.com,xen.org,kernel.org,invisiblethingslab.com,arm.com,epam.com,raptorengineering.com,wdc.com,gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:from_smtp,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	HAS_XOIP(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[julian.vetter@vates.tech,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[vates.tech:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2CCEF73B81F

---=Part.635.fa96f48aa331bd50.19f4c5192c3.fb37ab5d552954fb=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

From: Andrew Cooper <andrew=2Ecooper3@citrix=2Ecom>

XEN_DOMCTL_CONFIG_GIC_NATIVE lets the toolstack ask Xen to silently
resolve the domain's GIC version to whatever the host hardware has=2E Xen
then writes the resolved value back into the same in/out
xen_arch_domainconfig the toolstack used as input, which is the kind of
API abuse we're trying to get rid of=2E The struct passed to createdomain
should only be an input parameter=2E

Move the "pick the best available GIC version" decision to the
toolstack, using the XEN_SYSCTL_PHYSCAP_ARM_GIC_V2/V3 capability bits
already exposed via XEN_SYSCTL_physinfo:

 * libxl__arch_domain_build_info_setdefault() resolves
   LIBXL_GIC_VERSION_DEFAULT to v3 if available, else v2, else fails,
   before the config is built=2E
 * The Python xc=2Edomain_create() binding does the same via a call to
   xc_physinfo()=2E
 * libxl__arch_domain_prepare_config() therefore only ever sees a
   concrete v2/v3 request and just validates it=2E

On the Xen side, arch_sanitise_domain_config() and the two in-Xen domain
builders (create_dom0() and arch_parse_dom0less_node(), which always
want a vGIC that exactly matches the hardware) no longer resolve
GIC_NATIVE either=2E A new gic_domctl_version() helper returns the
XEN_DOMCTL_CONFIG_GIC_* value matching the host's gic_hw_version(), used
by all three=2E arch_sanitise_domain_config() now only validates that the
requested version is compatible with the hardware, rather than changing
config->arch=2Egic_version in place=2E

Signed-off-by: Julian Vetter <julian=2Evetter@vates=2Etech>
---
Changes in v2:
- New patch
---
 =2E=2E=2E/include/xen-tools/arm-arch-capabilities=2Eh | 21 ++++++++++++++=
++
 tools/libs/light/libxl_arm=2Ec                  | 15 ++++++++---
 tools/python/xen/lowlevel/xc/xc=2Ec             | 18 ++++++++++++-
 xen/arch/arm/dom0less-build=2Ec                 |  3 ++-
 xen/arch/arm/domain=2Ec                         | 25 +++++++------------
 xen/arch/arm/domain_build=2Ec                   |  3 ++-
 xen/arch/arm/gic=2Ec                            | 16 ++++++++++++
 xen/arch/arm/include/asm/gic=2Eh                |  6 +++++
 8 files changed, 85 insertions(+), 22 deletions(-)

diff --git a/tools/include/xen-tools/arm-arch-capabilities=2Eh b/tools/inc=
lude/xen-tools/arm-arch-capabilities=2Eh
index 4aa4c6c34a=2E=2E21e3c73bd1 100644
--- a/tools/include/xen-tools/arm-arch-capabilities=2Eh
+++ b/tools/include/xen-tools/arm-arch-capabilities=2Eh
@@ -6,6 +6,7 @@
 #ifndef ARM_ARCH_CAPABILITIES_H
 #define ARM_ARCH_CAPABILITIES_H
=20
+#include <stdbool=2Eh>
 #include <stdint=2Eh>
 #include <xen/sysctl=2Eh>
=20
@@ -25,4 +26,24 @@ unsigned int arch_capabilities_arm_sve(unsigned int arc=
h_capabilities)
 #endif
 }
=20
+static inline
+bool arch_capabilities_arm_gic_v2(unsigned int arch_capabilities)
+{
+#if defined(__arm__) || defined(__aarch64__)
+    return MASK_EXTR(arch_capabilities, XEN_SYSCTL_PHYSCAP_ARM_GIC_V2);
+#else
+    return false;
+#endif
+}
+
+static inline
+bool arch_capabilities_arm_gic_v3(unsigned int arch_capabilities)
+{
+#if defined(__arm__) || defined(__aarch64__)
+    return MASK_EXTR(arch_capabilities, XEN_SYSCTL_PHYSCAP_ARM_GIC_V3);
+#else
+    return false;
+#endif
+}
+
 #endif /* ARM_ARCH_CAPABILITIES_H */
diff --git a/tools/libs/light/libxl_arm=2Ec b/tools/libs/light/libxl_arm=
=2Ec
index 7e9f8a1bc3=2E=2Ef26ed261dc 100644
--- a/tools/libs/light/libxl_arm=2Ec
+++ b/tools/libs/light/libxl_arm=2Ec
@@ -196,9 +196,6 @@ int libxl__arch_domain_prepare_config(libxl__gc *gc,
     LOG(DEBUG, " - Allocate %u SPIs", config->arch=2Enr_spis);
=20
     switch (d_config->b_info=2Earch_arm=2Egic_version) {
-    case LIBXL_GIC_VERSION_DEFAULT:
-        config->arch=2Egic_version =3D XEN_DOMCTL_CONFIG_GIC_NATIVE;
-        break;
     case LIBXL_GIC_VERSION_V2:
         config->arch=2Egic_version =3D XEN_DOMCTL_CONFIG_GIC_V2;
         break;
@@ -1800,6 +1797,18 @@ int libxl__arch_domain_build_info_setdefault(libxl_=
_gc *gc,
     /* Trapping of unmapped accesses enabled by default=2E  */
     libxl_defbool_setdefault(&b_info->trap_unmapped_accesses, true);
=20
+    /* Pick the best GIC version available if none was requested=2E */
+    if (b_info->arch_arm=2Egic_version =3D=3D LIBXL_GIC_VERSION_DEFAULT) =
{
+        if (arch_capabilities_arm_gic_v3(physinfo->arch_capabilities))
+            b_info->arch_arm=2Egic_version =3D LIBXL_GIC_VERSION_V3;
+        else if (arch_capabilities_arm_gic_v2(physinfo->arch_capabilities=
))
+            b_info->arch_arm=2Egic_version =3D LIBXL_GIC_VERSION_V2;
+        else {
+            LOG(ERROR, "No supported GIC version found on this host");
+            return ERROR_FAIL;
+        }
+    }
+
     /* Sanitise SVE parameter */
     if (b_info->arch_arm=2Esve_vl) {
         unsigned int max_sve_vl =3D
diff --git a/tools/python/xen/lowlevel/xc/xc=2Ec b/tools/python/xen/lowlev=
el/xc/xc=2Ec
index 7a4bf54597=2E=2E0127b4b1b7 100644
--- a/tools/python/xen/lowlevel/xc/xc=2Ec
+++ b/tools/python/xen/lowlevel/xc/xc=2Ec
@@ -163,7 +163,23 @@ static PyObject *pyxc_domain_create(XcObject *self,
                                       ~(XEN_X86_EMU_VPCI |
                                         XEN_X86_EMU_USE_PIRQ);
 #elif defined (__arm__) || defined(__aarch64__)
-    config=2Earch=2Egic_version =3D XEN_DOMCTL_CONFIG_GIC_NATIVE;
+    {
+        xc_physinfo_t pinfo;
+
+        if ( xc_physinfo(self->xc_handle, &pinfo) !=3D 0 )
+            return pyxc_error_to_exception(self->xc_handle);
+
+        if ( arch_capabilities_arm_gic_v3(pinfo=2Earch_capabilities) )
+            config=2Earch=2Egic_version =3D XEN_DOMCTL_CONFIG_GIC_V3;
+        else if ( arch_capabilities_arm_gic_v2(pinfo=2Earch_capabilities)=
 )
+            config=2Earch=2Egic_version =3D XEN_DOMCTL_CONFIG_GIC_V2;
+        else
+        {
+            errno =3D EINVAL;
+            PyErr_SetFromErrno(xc_error_obj);
+            return NULL;
+        }
+    }
 #else
 #error Architecture not supported
 #endif
diff --git a/xen/arch/arm/dom0less-build=2Ec b/xen/arch/arm/dom0less-build=
=2Ec
index 3f48f74226=2E=2E5b01843db4 100644
--- a/xen/arch/arm/dom0less-build=2Ec
+++ b/xen/arch/arm/dom0less-build=2Ec
@@ -23,6 +23,7 @@
 #include <asm/arm64/sve=2Eh>
 #include <asm/domain_build=2Eh>
 #include <asm/firmware/sci=2Eh>
+#include <asm/gic=2Eh>
 #include <asm/grant_table=2Eh>
 #include <asm/setup=2Eh>
=20
@@ -368,7 +369,7 @@ int __init arch_parse_dom0less_node(struct dt_device_n=
ode *node,
     unsigned int flags =3D bd->create_flags;
     uint32_t val;
=20
-    d_cfg->arch=2Egic_version =3D XEN_DOMCTL_CONFIG_GIC_NATIVE;
+    d_cfg->arch=2Egic_version =3D gic_domctl_version();
     d_cfg->flags |=3D XEN_DOMCTL_CDF_hvm | XEN_DOMCTL_CDF_hap;
=20
     if ( domu_dt_sci_parse(node, d_cfg) )
diff --git a/xen/arch/arm/domain=2Ec b/xen/arch/arm/domain=2Ec
index baa3a5d708=2E=2Eb396d5e615 100644
--- a/xen/arch/arm/domain=2Ec
+++ b/xen/arch/arm/domain=2Ec
@@ -609,23 +609,16 @@ int arch_sanitise_domain_config(struct xen_domctl_cr=
eatedomain *config)
         return -EINVAL;
     }
=20
-    /* Fill in the native GIC version, passed back to the toolstack=2E */
-    if ( config->arch=2Egic_version =3D=3D XEN_DOMCTL_CONFIG_GIC_NATIVE )
+    /*
+     * The toolstack must pick a specific GIC version=2E Xen doesn't choo=
se on
+     * its behalf=2E It only checks the requested version matches what th=
e
+     * hardware actually has=2E There's currently no support to run a gue=
st on a
+     * GIC version other than the host's=2E
+     */
+    if ( config->arch=2Egic_version !=3D gic_domctl_version() )
     {
-        switch ( gic_hw_version() )
-        {
-        case GIC_V2:
-            config->arch=2Egic_version =3D XEN_DOMCTL_CONFIG_GIC_V2;
-            break;
-
-        case GIC_V3:
-            config->arch=2Egic_version =3D XEN_DOMCTL_CONFIG_GIC_V3;
-            break;
-
-        default:
-            ASSERT_UNREACHABLE();
-            return -EINVAL;
-        }
+        dprintk(XENLOG_INFO, "Unsupported GIC version\n");
+        return -EINVAL;
     }
=20
     /* max_vcpus depends on the GIC version, and Xen's compiled limit=2E =
*/
diff --git a/xen/arch/arm/domain_build=2Ec b/xen/arch/arm/domain_build=2Ec
index 550617f152=2E=2E2e00fc3e52 100644
--- a/xen/arch/arm/domain_build=2Ec
+++ b/xen/arch/arm/domain_build=2Ec
@@ -26,6 +26,7 @@
 #include <xen/warning=2Eh>
 #include <xen/static-shmem=2Eh>
 #include <asm/device=2Eh>
+#include <asm/gic=2Eh>
 #include <asm/setup=2Eh>
 #include <asm/tee/tee=2Eh>
 #include <asm/pci=2Eh>
@@ -1960,7 +1961,7 @@ void __init create_dom0(void)
     int rc;
=20
     /* The vGIC for DOM0 is exactly emulating the hardware GIC */
-    dom0_cfg=2Earch=2Egic_version =3D XEN_DOMCTL_CONFIG_GIC_NATIVE;
+    dom0_cfg=2Earch=2Egic_version =3D gic_domctl_version();
     dom0_cfg=2Earch=2Enr_spis =3D vgic_def_nr_spis();
     dom0_cfg=2Earch=2Etee_type =3D tee_get_type();
     dom0_cfg=2Emax_vcpus =3D dom0_max_vcpus();
diff --git a/xen/arch/arm/gic=2Ec b/xen/arch/arm/gic=2Ec
index ee75258fc3=2E=2Efc55a65159 100644
--- a/xen/arch/arm/gic=2Ec
+++ b/xen/arch/arm/gic=2Ec
@@ -56,6 +56,22 @@ enum gic_version gic_hw_version(void)
    return gic_hw_ops->info->hw_version;
 }
=20
+uint8_t gic_domctl_version(void)
+{
+    switch ( gic_hw_version() )
+    {
+    case GIC_V2:
+        return XEN_DOMCTL_CONFIG_GIC_V2;
+
+    case GIC_V3:
+        return XEN_DOMCTL_CONFIG_GIC_V3;
+
+    default:
+        ASSERT_UNREACHABLE();
+        return 0;
+    }
+}
+
 unsigned int gic_number_lines(void)
 {
     return gic_hw_ops->info->nr_lines;
diff --git a/xen/arch/arm/include/asm/gic=2Eh b/xen/arch/arm/include/asm/g=
ic=2Eh
index ff22dea40d=2E=2Ede6eabfadd 100644
--- a/xen/arch/arm/include/asm/gic=2Eh
+++ b/xen/arch/arm/include/asm/gic=2Eh
@@ -262,6 +262,12 @@ DECLARE_PER_CPU(uint64_t, lr_mask);
=20
 extern enum gic_version gic_hw_version(void);
=20
+/*
+ * The XEN_DOMCTL_CONFIG_GIC_* value matching the GIC version actually
+ * present on this host=2E
+ */
+extern uint8_t gic_domctl_version(void);
+
 /* Program the IRQ type into the GIC */
 void gic_set_irq_type(struct irq_desc *desc, unsigned int type);
=20
--=20
2=2E53=2E0



-- 
Julian Vetter | Vates Hypervisor & Kernel Developer

XCP-ng & Xen Orch=
estra - Vates solutions

web: https://vates=2Etech
---=Part.635.fa96f48aa331bd50.19f4c5192c3.fb37ab5d552954fb=---

