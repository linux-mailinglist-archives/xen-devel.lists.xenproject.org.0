Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UFeDAlWqd2lBkAEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 26 Jan 2026 18:54:29 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 93B0C8BCB0
	for <lists+xen-devel@lfdr.de>; Mon, 26 Jan 2026 18:54:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1213836.1524342 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vkQml-0005vR-Pn; Mon, 26 Jan 2026 17:53:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1213836.1524342; Mon, 26 Jan 2026 17:53:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vkQml-0005rA-FW; Mon, 26 Jan 2026 17:53:59 +0000
Received: by outflank-mailman (input) for mailman id 1213836;
 Mon, 26 Jan 2026 17:53:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0tkY=77=citrix.com=andrew.cooper3@srs-se1.protection.inumbo.net>)
 id 1vkQmj-0004HW-JB
 for xen-devel@lists.xenproject.org; Mon, 26 Jan 2026 17:53:57 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fc8549ab-fadf-11f0-b15f-2bf370ae4941;
 Mon, 26 Jan 2026 18:53:57 +0100 (CET)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-4801c1ad878so53448445e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 26 Jan 2026 09:53:56 -0800 (PST)
Received: from localhost.localdomain (host-92-26-102-188.as13285.net.
 [92.26.102.188]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48066c10dbasm3896455e9.15.2026.01.26.09.53.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Jan 2026 09:53:54 -0800 (PST)
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
X-Inumbo-ID: fc8549ab-fadf-11f0-b15f-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1769450036; x=1770054836; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4exVf2X0kVUw9W5j5Fb4p8w+lR6Y5FhAJXo3jDL54Ow=;
        b=UhRHp86eF0EC73u2VLSGwCr7eoePloum4ZiSRD10EyofquKgO2wS/P4R3GFxVxuyhE
         WoAGSwFSuc6DaV4kHCvHFW6fWrB59HCS6PD2TNq6FuYGeEmc1osCPkYM3z16W3wYd8jj
         GCNdkjhLHJAUgNjkGmWiwLhLH1ytYjyIDA200=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769450036; x=1770054836;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4exVf2X0kVUw9W5j5Fb4p8w+lR6Y5FhAJXo3jDL54Ow=;
        b=cn8RlU1leUmD+MEr2gmetJxJLhgmhOkmxm+YxC8JpfizrbuiitAhTjBICM/N4oSsJy
         o6NsTLrmHHrDoJ5k6PZaWo+0YHATkEgh4R/f5Qf3l0y+55EbjBtd83Wb/dP1sUcMTTpW
         toBFQSaZ1Qx2EBCKtpDhCDo1lbfKrI4ZCIZ3gOMdVD3MazsgZzXaUayefG0lkpYJebzb
         nIbtGRtjA/LInyzKrIWdW0By3AOQhSsx0ITiXV5xKdkcHwqcPQzgAqgxOGzLdb4/llql
         JhAhqCBTjj8a8pMXIW3dfwPHd52Cp6v/guK3zsSozEGYRuffiE01/SSlRdmkIP2mRZ0S
         w0Rw==
X-Gm-Message-State: AOJu0YxqFwn7ROIyWyXIAMkmha+RU6Y+H5oXInIVdcFCI7E/78953WzU
	By5SU5GvOhLlSHKMtoHNIgo3CnlxKcFmvo9Onwbe5LL9B+r1Gphy8leNN4RQ9+KB+yxcUXdcnBa
	WzX7b
X-Gm-Gg: AZuq6aInhqWeZ//LlgLqRh1Y2MTdOHWmhqJFUmYwTdr4UyVBkhkIV+q98vjm3yW/CAi
	wq10Xu61GKXI2DUV0cxDiWJl+CDs9kcsaGOZq6PduI+Sb/qNWjmGu8O4WqBRuF7LZmzVtJoXHrW
	ow48ESD6iv+npUfv7VfU8uKYvYKRAFX6ElMPZiVwcWzG6IGreltVLvtdXllgolmhzxgWHHxcPiA
	UyM4NtaDHhI0dSEDdjJs60qMjuauT2Cn7ESAag7aniU3p+SiCSstpLNNl0UWs1EkgDBecQQXMCg
	+vqTR6oOzUIaSlkvmqlLGfasu5DcQAmNCJieRUTctqrnmlh2TNpJ72uK3483pbIMHjjAU8pypY/
	sbagUq48p1ROVy84CIR8JeCc3nXTeRnHeooMQ70ioe2bIwqK4Se2x9CoWOaUyUa//MdYIdPkq26
	MEKH9Vu8Zod9bwHOhsZMffSIkDCkJMd20rSj7nMDLY85Z90gAZaNQDjNnnagOlgg==
X-Received: by 2002:a05:600c:a085:b0:480:3230:6c9b with SMTP id 5b1f17b1804b1-4805ce3fd49mr85376395e9.7.1769450035141;
        Mon, 26 Jan 2026 09:53:55 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Julian Vetter <julian.vetter@vates.tech>,
	Teddy Astie <teddy.astie@vates.tech>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	"Daniel P . Smith" <dpsmith@apertussolutions.com>
Subject: [PATCH 08/16] xen/sysctl: Drop XEN_SYSCTL_get_cpu_levelling_caps
Date: Mon, 26 Jan 2026 17:53:37 +0000
Message-Id: <20260126175345.2078371-9-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260126175345.2078371-1-andrew.cooper3@citrix.com>
References: <20260126175345.2078371-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.32 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_ALL(0.00)[];
	FREEMAIL_CC(0.00)[citrix.com,suse.com,vates.tech,gmail.com,apertussolutions.com];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:JBeulich@suse.com,m:roger.pau@citrix.com,m:julian.vetter@vates.tech,m:teddy.astie@vates.tech,m:oleksii.kurochko@gmail.com,m:dpsmith@apertussolutions.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:email,citrix.com:dkim,citrix.com:mid,changelog.md:url,lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:email,keepachangelog.com:url];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 93B0C8BCB0
X-Rspamd-Action: no action

This hypercall is an addition of mine from commit 67528a3f0649 ("x86/cpu:
Sysctl and common infrastructure for levelling context switching", 2016), but
it never got wired into any toolstacks.  In the meantime, how we handle CPUID
for guests has evolved substantially.

In order to reuse the AMD levelling infrasturcture for boot time quirks,
levelling_caps is going to have to change.  While it's probably safe to expose
this difference, it's safer still to make it an internal detail.

When re-plummbing the LCAP_* constants, turn them all into single bits.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Julian Vetter <julian.vetter@vates.tech>
CC: Teddy Astie <teddy.astie@vates.tech>
CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
CC: Daniel P. Smith <dpsmith@apertussolutions.com>
---
 CHANGELOG.md                        |  2 ++
 tools/flask/policy/modules/dom0.te  |  1 -
 tools/include/xenguest.h            |  1 -
 tools/libs/guest/xg_cpuid_x86.c     | 14 --------------
 xen/arch/x86/include/asm/cpuid.h    | 15 ++++++---------
 xen/arch/x86/sysctl.c               |  6 ------
 xen/include/public/sysctl.h         | 22 +---------------------
 xen/xsm/flask/hooks.c               |  4 ----
 xen/xsm/flask/policy/access_vectors |  2 --
 9 files changed, 9 insertions(+), 58 deletions(-)

diff --git a/CHANGELOG.md b/CHANGELOG.md
index 18f3d10f20d2..425118bc9ae9 100644
--- a/CHANGELOG.md
+++ b/CHANGELOG.md
@@ -19,6 +19,8 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
    - The cpuid_mask_* command line options for legacy CPUs.  These were
      deprecated in Xen 4.7 and noted not to work correctly with AMD CPUs from
      2011 onwards, nor work at all with Intel CPUs from 2012.
+   - The SYSCTL_get_cpu_levelling_caps sysctl.  This is not known to have been
+     used by any toolstack.
    - Xenoprofile support.  Oprofile themselves removed support for Xen in 2014
      prior to the version 1.0 release, and there has been no development since
      before then in Xen.
diff --git a/tools/flask/policy/modules/dom0.te b/tools/flask/policy/modules/dom0.te
index d30edf8be1fb..aae69041a966 100644
--- a/tools/flask/policy/modules/dom0.te
+++ b/tools/flask/policy/modules/dom0.te
@@ -43,7 +43,6 @@ allow dom0_t xen_t:xen2 {
 	psr_alloc
 	pmu_ctrl
 	get_symbol
-	get_cpu_levelling_caps
 	get_cpu_featureset
 	livepatch_op
 	coverage_op
diff --git a/tools/include/xenguest.h b/tools/include/xenguest.h
index 7c3b8b098352..2a277cb7cd61 100644
--- a/tools/include/xenguest.h
+++ b/tools/include/xenguest.h
@@ -822,7 +822,6 @@ int xc_cpu_policy_update_msrs(xc_interface *xch, xc_cpu_policy_t *policy,
 bool xc_cpu_policy_is_compatible(xc_interface *xch, xc_cpu_policy_t *host,
                                  xc_cpu_policy_t *guest);
 
-int xc_get_cpu_levelling_caps(xc_interface *xch, uint32_t *caps);
 int xc_get_cpu_featureset(xc_interface *xch, uint32_t index,
                           uint32_t *nr_features, uint32_t *featureset);
 
diff --git a/tools/libs/guest/xg_cpuid_x86.c b/tools/libs/guest/xg_cpuid_x86.c
index 263a9d4787b6..0db6d77cd801 100644
--- a/tools/libs/guest/xg_cpuid_x86.c
+++ b/tools/libs/guest/xg_cpuid_x86.c
@@ -36,20 +36,6 @@ enum {
 #define bitmaskof(idx)      (1u << ((idx) & 31))
 #define featureword_of(idx) ((idx) >> 5)
 
-int xc_get_cpu_levelling_caps(xc_interface *xch, uint32_t *caps)
-{
-    struct xen_sysctl sysctl = {};
-    int ret;
-
-    sysctl.cmd = XEN_SYSCTL_get_cpu_levelling_caps;
-    ret = do_sysctl(xch, &sysctl);
-
-    if ( !ret )
-        *caps = sysctl.u.cpu_levelling_caps.caps;
-
-    return ret;
-}
-
 int xc_get_cpu_featureset(xc_interface *xch, uint32_t index,
                           uint32_t *nr_features, uint32_t *featureset)
 {
diff --git a/xen/arch/x86/include/asm/cpuid.h b/xen/arch/x86/include/asm/cpuid.h
index f1b9e37a42ca..c7ee1d54bc7e 100644
--- a/xen/arch/x86/include/asm/cpuid.h
+++ b/xen/arch/x86/include/asm/cpuid.h
@@ -15,15 +15,12 @@ extern const uint32_t known_features[FSCAPINTS];
  * Expected levelling capabilities (given cpuid vendor/family information),
  * and levelling capabilities actually available (given MSR probing).
  */
-#define LCAP_faulting XEN_SYSCTL_CPU_LEVELCAP_faulting
-#define LCAP_1cd      (XEN_SYSCTL_CPU_LEVELCAP_ecx |        \
-                       XEN_SYSCTL_CPU_LEVELCAP_edx)
-#define LCAP_e1cd     (XEN_SYSCTL_CPU_LEVELCAP_extd_ecx |   \
-                       XEN_SYSCTL_CPU_LEVELCAP_extd_edx)
-#define LCAP_Da1      XEN_SYSCTL_CPU_LEVELCAP_xsave_eax
-#define LCAP_6c       XEN_SYSCTL_CPU_LEVELCAP_thermal_ecx
-#define LCAP_7ab0     (XEN_SYSCTL_CPU_LEVELCAP_l7s0_eax |   \
-                       XEN_SYSCTL_CPU_LEVELCAP_l7s0_ebx)
+#define LCAP_faulting (1U <<  0) /* CPUID Faulting       */
+#define LCAP_1cd      (1U <<  1) /* 0x00000001.ecx/edx   */
+#define LCAP_e1cd     (1U <<  2) /* 0x80000001.ecx/edx   */
+#define LCAP_Da1      (1U <<  3) /* 0x0000000D:1.eax     */
+#define LCAP_6c       (1U <<  4) /* 0x00000006.ecx       */
+#define LCAP_7ab0     (1U <<  5) /* 0x00000007:0.eax/ebx */
 extern unsigned int expected_levelling_cap, levelling_caps;
 
 struct cpuidmasks
diff --git a/xen/arch/x86/sysctl.c b/xen/arch/x86/sysctl.c
index 1b04947516bb..0fbbdd8b280d 100644
--- a/xen/arch/x86/sysctl.c
+++ b/xen/arch/x86/sysctl.c
@@ -289,12 +289,6 @@ long arch_do_sysctl(
         break;
     }
 
-    case XEN_SYSCTL_get_cpu_levelling_caps:
-        sysctl->u.cpu_levelling_caps.caps = levelling_caps;
-        if ( __copy_field_to_guest(u_sysctl, sysctl, u.cpu_levelling_caps.caps) )
-            ret = -EFAULT;
-        break;
-
     case XEN_SYSCTL_get_cpu_featureset:
     {
         static const struct cpu_policy *const policy_table[6] = {
diff --git a/xen/include/public/sysctl.h b/xen/include/public/sysctl.h
index 66c9b65465cc..6b4ec5f7f765 100644
--- a/xen/include/public/sysctl.h
+++ b/xen/include/public/sysctl.h
@@ -932,25 +932,6 @@ struct xen_sysctl_psr_alloc {
     } u;
 };
 
-/*
- * XEN_SYSCTL_get_cpu_levelling_caps (x86 specific)
- *
- * Return hardware capabilities concerning masking or faulting of the cpuid
- * instruction for PV guests.
- */
-struct xen_sysctl_cpu_levelling_caps {
-#define XEN_SYSCTL_CPU_LEVELCAP_faulting    (1UL <<  0) /* CPUID faulting    */
-#define XEN_SYSCTL_CPU_LEVELCAP_ecx         (1UL <<  1) /* 0x00000001.ecx    */
-#define XEN_SYSCTL_CPU_LEVELCAP_edx         (1UL <<  2) /* 0x00000001.edx    */
-#define XEN_SYSCTL_CPU_LEVELCAP_extd_ecx    (1UL <<  3) /* 0x80000001.ecx    */
-#define XEN_SYSCTL_CPU_LEVELCAP_extd_edx    (1UL <<  4) /* 0x80000001.edx    */
-#define XEN_SYSCTL_CPU_LEVELCAP_xsave_eax   (1UL <<  5) /* 0x0000000D:1.eax  */
-#define XEN_SYSCTL_CPU_LEVELCAP_thermal_ecx (1UL <<  6) /* 0x00000006.ecx    */
-#define XEN_SYSCTL_CPU_LEVELCAP_l7s0_eax    (1UL <<  7) /* 0x00000007:0.eax  */
-#define XEN_SYSCTL_CPU_LEVELCAP_l7s0_ebx    (1UL <<  8) /* 0x00000007:0.ebx  */
-    uint32_t caps;
-};
-
 /*
  * XEN_SYSCTL_get_cpu_featureset (x86 specific)
  *
@@ -1270,7 +1251,7 @@ struct xen_sysctl {
 #define XEN_SYSCTL_pcitopoinfo                   22
 #define XEN_SYSCTL_psr_alloc                     23
 /* #define XEN_SYSCTL_tmem_op                       24 */
-#define XEN_SYSCTL_get_cpu_levelling_caps        25
+/* #define XEN_SYSCTL_get_cpu_levelling_caps        25 */
 #define XEN_SYSCTL_get_cpu_featureset            26
 #define XEN_SYSCTL_livepatch_op                  27
 /* #define XEN_SYSCTL_set_parameter              28 */
@@ -1300,7 +1281,6 @@ struct xen_sysctl {
         struct xen_sysctl_coverage_op       coverage_op;
         struct xen_sysctl_psr_cmt_op        psr_cmt_op;
         struct xen_sysctl_psr_alloc         psr_alloc;
-        struct xen_sysctl_cpu_levelling_caps cpu_levelling_caps;
         struct xen_sysctl_cpu_featureset    cpu_featureset;
         struct xen_sysctl_livepatch_op      livepatch;
 #if defined(__i386__) || defined(__x86_64__)
diff --git a/xen/xsm/flask/hooks.c b/xen/xsm/flask/hooks.c
index b250b2706535..28522dcbd271 100644
--- a/xen/xsm/flask/hooks.c
+++ b/xen/xsm/flask/hooks.c
@@ -884,10 +884,6 @@ static int cf_check flask_sysctl(int cmd)
         return avc_current_has_perm(SECINITSID_XEN, SECCLASS_XEN2,
                                     XEN2__PSR_ALLOC, NULL);
 
-    case XEN_SYSCTL_get_cpu_levelling_caps:
-        return avc_current_has_perm(SECINITSID_XEN, SECCLASS_XEN2,
-                                    XEN2__GET_CPU_LEVELLING_CAPS, NULL);
-
     case XEN_SYSCTL_get_cpu_featureset:
         return avc_current_has_perm(SECINITSID_XEN, SECCLASS_XEN2,
                                     XEN2__GET_CPU_FEATURESET, NULL);
diff --git a/xen/xsm/flask/policy/access_vectors b/xen/xsm/flask/policy/access_vectors
index ce907d50a45e..bbb9c117ec4a 100644
--- a/xen/xsm/flask/policy/access_vectors
+++ b/xen/xsm/flask/policy/access_vectors
@@ -87,8 +87,6 @@ class xen2
     pmu_ctrl
 # PMU use (domains, including unprivileged ones, will be using this operation)
     pmu_use
-# XEN_SYSCTL_get_cpu_levelling_caps
-    get_cpu_levelling_caps
 # XEN_SYSCTL_get_cpu_featureset
     get_cpu_featureset
 # XEN_SYSCTL_livepatch_op
-- 
2.39.5


