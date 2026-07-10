Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id DLMeD2b6UGqD9QIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jul 2026 15:57:58 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 97F5E73B82D
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jul 2026 15:57:57 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=vates.tech header.s=selector1 header.b=Xq8mVtOZ;
	dmarc=pass (policy=none) header.from=vates.tech;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.1359418.1613032 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wiBji-0006Ev-43; Fri, 10 Jul 2026 13:57:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1359418.1613032; Fri, 10 Jul 2026 13:57:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wiBji-0006DY-0U; Fri, 10 Jul 2026 13:57:50 +0000
Received: by outflank-mailman (input) for mailman id 1359418;
 Fri, 10 Jul 2026 13:57:47 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19f4c51a755000edb5@swg.vates.tech>)
 id 1wiBjf-00065k-PD
 for xen-devel@lists.xenproject.org; Fri, 10 Jul 2026 13:57:47 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wiBjf-00HA2i-63
 for xen-devel@lists.xenproject.org; Fri, 10 Jul 2026 15:57:47 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19f4c51a755000edb5@swg.vates.tech>)
 id 6a50fa48-5cb7-0a2a0a5109dd-0a2a4508be1e-40
 for <xen-devel@lists.xenproject.org>; Fri, 10 Jul 2026 15:57:47 +0200
Received: from [185.255.28.34] (helo=prod-mta-13-01.swg-srv.net)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.2)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19f4c51a755000edb5@swg.vates.tech>)
 id 6a50fa5a-ee29-0a2a45080019-b9ff1c2281ff-3
 for <xen-devel@lists.xenproject.org>; Fri, 10 Jul 2026 15:57:47 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-01.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19f4c51a755000edb5.00b for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 10 Jul 2026 13:57:27 +0000
Received: from julian.home (lfbn-gre-1-197-6.w90-112.abo.wanadoo.fr
 [90.112.16.6]) (Authenticated sender: julian.vetter@vates.tech)
 by mail2.vates.fr (Postfix) with ESMTPSA id BF391820B8;
 Fri, 10 Jul 2026 15:57:26 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=4V+Q9vdkovRX6sGJOqwhNxmobw30y8/EXlVoTNAgKmo=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=Xq8mVtOZOQwPp3RYv/FwAo+44NSrkgJAmiq76UuJC7Ixfu0vV8A+G2ds5KEfj7P2zVavNh4Wv
 hTy2hqdQNjHuqdmICm4TEqeKIx6kkzU1Du5HF9b+HvLOqPDaAPCo5Hw+uJadG8tFY4lf2jzMt0H
 antmbIrpYwHj4AHSZ9tBV85jMlxpFt0QPmhjFakq+aijUy1rqd17GMl5MaSKohcG83PFyEE6wpT
 AYouqH9mP/FOBLvvS3ONehHhYT09beQ0H8ZTENiXOkI5W1HbkR2eeiukhNL0fOIv1fPsPMBXei1
 FkaMTYdFqV2LlVF+hVFcnP84y4R+noayeveMzGvx63ZA==
X-Zone-Loop: e5c301ef98df420aff81e1cac7d5e024b09f6bbb211e
x-campaign-type: default
x-transaction-id: 735a7bb5-08b5-4b08-bb22-c4bb9abfee64
x-swg-uid: 01-5f9eee70-b623-49fe-a9ba-6a4957a256ae
X-Mailer: Sweego
Message-ID:
 <1783691847.8631fc262581453bbf619ec5b2062170.19f4c51a755000edb5@vates.tech>
x-swg-bid: 1783691847.8631fc262581453bbf619ec5b2062170.19f4c51a755000edb5
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
Subject: [PATCH v2 6/6] xen: make config argument const
Date: Fri, 10 Jul 2026 15:57:11 +0200
In-Reply-To: <20260710135711.301993-1-julian.vetter@vates.tech>
References: <20260710135503.301746-1-julian.vetter@vates.tech>
 <20260710135711.301993-1-julian.vetter@vates.tech>
MIME-Version: 1.0
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.638.6ff1eb3fb31b0ef8.19f4c51a5a9.b3c7760e02c28758=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1783691847082
X-purgate-ID: tlsNG-c1860d/1783691867-1034101C-C2E3F44E/0/0
X-purgate-type: clean
X-purgate-size: 8335
X-Rspamd-Action: no action
X-Spamd-Result: default: False [2.33 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	URI_COUNT_ODD(1.00)[1];
	MIME_MA_MISSING_HTML(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[vates.tech,none];
	R_DKIM_ALLOW(-0.20)[vates.tech:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[multipart/alternative,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	XM_UA_NO_VERSION(0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:from_smtp,lists.xenproject.org:helo,lists.xenproject.org:rdns,vates.tech:dkim,vates.tech:mid,vates.tech:from_mime,vates.tech:url,vates.tech:email];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+];
	RCPT_COUNT_TWELVE(0.00)[21];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:anthony.perard@vates.tech,m:andrew.cooper3@citrix.com,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:jgross@suse.com,m:andriy.sultanov@vates.tech,m:guillaume.thouvenin@vates.tech,m:marmarek@invisiblethingslab.com,m:bertrand.marquis@arm.com,m:Volodymyr_Babchuk@epam.com,m:oleksii_moisieiev@epam.com,m:tpearson@raptorengineering.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:oleksii.kurochko@gmail.com,m:teddy.astie@vates.tech,m:julian.vetter@vates.tech,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[julian.vetter@vates.tech,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_CC(0.00)[vates.tech,citrix.com,amd.com,suse.com,xen.org,kernel.org,invisiblethingslab.com,arm.com,epam.com,raptorengineering.com,wdc.com,gmail.com];
	DKIM_TRACE(0.00)[vates.tech:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[julian.vetter@vates.tech,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	HAS_XOIP(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 97F5E73B82D

---=Part.638.6ff1eb3fb31b0ef8.19f4c51a5a9.b3c7760e02c28758=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

arch_sanitise_domain_config() validates the configuration requested by
the toolstack, and should not fill anything in=2E The config struct passed
to createdomain is supposed to be pure input=2E ARM used to abuse this
(GIC_NATIVE resolution, now removed) to smuggle output back to the
toolstack=2E Making the parameter const stops that type of abuse from
happening on any architecture=2E

The x86 implementation turned out to have its own instance of the same
issue=2E It set XEN_DOMCTL_CDF_oos_off into config->flags for non-HVM
guests=2E Since The sanitisation runs before the function domain_create()
copies config->flags into d->options, this relied on mutating the
toolstack's config to take effect=2E Move the default onto d->options
directly in arch_domain_create() (which runs after d->options is
populated), where all the remaining domain options are resolved=2E This
has the same effect and no mutation of the input config is required=2E

ARM, PPC and RISC-V need no equivalent change, Their implementations
were already read-only=2E

Signed-off-by: Julian Vetter <julian=2Evetter@vates=2Etech>
---
Changes in v2:
- New patch
---
 xen/arch/arm/domain=2Ec                   |  2 +-
 xen/arch/arm/firmware/sci=2Ec             |  2 +-
 xen/arch/arm/firmware/scmi-smc=2Ec        |  2 +-
 xen/arch/arm/include/asm/firmware/sci=2Eh |  6 +++---
 xen/arch/ppc/stubs=2Ec                    |  2 +-
 xen/arch/riscv/domain=2Ec                 |  2 +-
 xen/arch/x86/domain=2Ec                   | 16 ++++++++--------
 xen/include/xen/sched=2Eh                 |  6 ++++--
 8 files changed, 20 insertions(+), 18 deletions(-)

diff --git a/xen/arch/arm/domain=2Ec b/xen/arch/arm/domain=2Ec
index d6d80ac55d=2E=2Ef605446cc5 100644
--- a/xen/arch/arm/domain=2Ec
+++ b/xen/arch/arm/domain=2Ec
@@ -557,7 +557,7 @@ static bool v8r_el1_msa_domain_sanitise_config(
     }
 }
=20
-int arch_sanitise_domain_config(struct xen_domctl_createdomain *config)
+int arch_sanitise_domain_config(const struct xen_domctl_createdomain *con=
fig)
 {
     unsigned int max_vcpus;
     unsigned int flags_required =3D (XEN_DOMCTL_CDF_hvm | XEN_DOMCTL_CDF_=
hap);
diff --git a/xen/arch/arm/firmware/sci=2Ec b/xen/arch/arm/firmware/sci=2Ec
index aa93cda7f0=2E=2Ef73ed06092 100644
--- a/xen/arch/arm/firmware/sci=2Ec
+++ b/xen/arch/arm/firmware/sci=2Ec
@@ -45,7 +45,7 @@ int sci_domain_init(struct domain *d, struct xen_domctl_=
createdomain *config)
     return cur_mediator->domain_init(d, config);
 }
=20
-int sci_domain_sanitise_config(struct xen_domctl_createdomain *config)
+int sci_domain_sanitise_config(const struct xen_domctl_createdomain *conf=
ig)
 {
     if ( !cur_mediator )
         return 0;
diff --git a/xen/arch/arm/firmware/scmi-smc=2Ec b/xen/arch/arm/firmware/sc=
mi-smc=2Ec
index 0835ddeeec=2E=2Ea973679eaf 100644
--- a/xen/arch/arm/firmware/scmi-smc=2Ec
+++ b/xen/arch/arm/firmware/scmi-smc=2Ec
@@ -82,7 +82,7 @@ static bool scmi_handle_smc(struct cpu_user_regs *regs)
 }
=20
 static int
-scmi_smc_domain_sanitise_config(struct xen_domctl_createdomain *config)
+scmi_smc_domain_sanitise_config(const struct xen_domctl_createdomain *con=
fig)
 {
     if ( config->arch=2Earm_sci_type !=3D XEN_DOMCTL_CONFIG_ARM_SCI_NONE =
&&
          config->arch=2Earm_sci_type !=3D XEN_DOMCTL_CONFIG_ARM_SCI_SCMI_=
SMC )
diff --git a/xen/arch/arm/include/asm/firmware/sci=2Eh b/xen/arch/arm/incl=
ude/asm/firmware/sci=2Eh
index 485ce211c9=2E=2E1d566be8e2 100644
--- a/xen/arch/arm/include/asm/firmware/sci=2Eh
+++ b/xen/arch/arm/include/asm/firmware/sci=2Eh
@@ -32,7 +32,7 @@ struct sci_mediator_ops {
      * it to sanitize domain SCI configuration parameters=2E
      * Optional=2E
      */
-    int (*domain_sanitise_config)(struct xen_domctl_createdomain *config)=
;
+    int (*domain_sanitise_config)(const struct xen_domctl_createdomain *c=
onfig);
=20
     /*
      * Called during domain destruction, releases all resources, that
@@ -101,7 +101,7 @@ int sci_domain_init(struct domain *d, struct xen_domct=
l_createdomain *config);
  * Sanitise domain configuration parameters=2E
  *
  */
-int sci_domain_sanitise_config(struct xen_domctl_createdomain *config);
+int sci_domain_sanitise_config(const struct xen_domctl_createdomain *conf=
ig);
=20
 /*
  * Destroy SCI domain instance=2E
@@ -162,7 +162,7 @@ static inline int sci_domain_init(struct domain *d,
 }
=20
 static inline int
-sci_domain_sanitise_config(struct xen_domctl_createdomain *config)
+sci_domain_sanitise_config(const struct xen_domctl_createdomain *config)
 {
     if ( config->arch=2Earm_sci_type !=3D XEN_DOMCTL_CONFIG_ARM_SCI_NONE =
)
         return -EINVAL;
diff --git a/xen/arch/ppc/stubs=2Ec b/xen/arch/ppc/stubs=2Ec
index a333f06119=2E=2E82a289af85 100644
--- a/xen/arch/ppc/stubs=2Ec
+++ b/xen/arch/ppc/stubs=2Ec
@@ -162,7 +162,7 @@ void arch_vcpu_destroy(struct vcpu *v)
     BUG_ON("unimplemented");
 }
=20
-int arch_sanitise_domain_config(struct xen_domctl_createdomain *config)
+int arch_sanitise_domain_config(const struct xen_domctl_createdomain *con=
fig)
 {
     BUG_ON("unimplemented");
 }
diff --git a/xen/arch/riscv/domain=2Ec b/xen/arch/riscv/domain=2Ec
index 2819ff4e7c=2E=2Ee096a53cb5 100644
--- a/xen/arch/riscv/domain=2Ec
+++ b/xen/arch/riscv/domain=2Ec
@@ -289,7 +289,7 @@ void sync_vcpu_execstate(struct vcpu *v)
     /* Nothing to do -- no lazy switching */
 }
=20
-int arch_sanitise_domain_config(struct xen_domctl_createdomain *config)
+int arch_sanitise_domain_config(const struct xen_domctl_createdomain *con=
fig)
 {
     return 0;
 }
diff --git a/xen/arch/x86/domain=2Ec b/xen/arch/x86/domain=2Ec
index 4252339978=2E=2E35f591ab5d 100644
--- a/xen/arch/x86/domain=2Ec
+++ b/xen/arch/x86/domain=2Ec
@@ -590,7 +590,7 @@ void arch_vcpu_destroy(struct vcpu *v)
         ASSERT_UNREACHABLE();
 }
=20
-int arch_sanitise_domain_config(struct xen_domctl_createdomain *config)
+int arch_sanitise_domain_config(const struct xen_domctl_createdomain *con=
fig)
 {
     bool hvm =3D config->flags & XEN_DOMCTL_CDF_hvm;
     bool hap =3D config->flags & XEN_DOMCTL_CDF_hap;
@@ -633,13 +633,6 @@ int arch_sanitise_domain_config(struct xen_domctl_cre=
atedomain *config)
         return -EINVAL;
     }
=20
-    if ( !hvm )
-        /*
-         * It is only meaningful for XEN_DOMCTL_CDF_oos_off to be clear
-         * for HVM guests=2E
-         */
-        config->flags |=3D XEN_DOMCTL_CDF_oos_off;
-
     if ( nested_virt && !hvm_nested_virt_supported() )
     {
         dprintk(XENLOG_INFO, "Nested virt requested but not available\n")=
;
@@ -833,6 +826,13 @@ int arch_domain_create(struct domain *d,
=20
     spin_lock_init(&d->arch=2Ee820_lock);
=20
+    /*
+     * It is only meaningful for XEN_DOMCTL_CDF_oos_off to be clear for H=
VM
+     * guests=2E
+     */
+    if ( !is_hvm_domain(d) )
+        d->options |=3D XEN_DOMCTL_CDF_oos_off;
+
     if ( d->domain_id && cpu_has_amd_erratum(&boot_cpu_data, AMD_ERRATUM_=
121) )
     {
         if ( !opt_allow_unsafe )
diff --git a/xen/include/xen/sched=2Eh b/xen/include/xen/sched=2Eh
index 011292e9f7=2E=2E66ed7454ba 100644
--- a/xen/include/xen/sched=2Eh
+++ b/xen/include/xen/sched=2Eh
@@ -756,9 +756,11 @@ static inline void domain_update_node_affinity(struct=
 domain *d)
=20
 /*
  * To be implemented by each architecture, sanity checking the configurat=
ion
- * and filling in any appropriate defaults=2E
+ * requested by the toolstack=2E config is not modified: createdomain is
+ * input-only, and the toolstack is expected to have already resolved any
+ * defaults=2E
  */
-int arch_sanitise_domain_config(struct xen_domctl_createdomain *config);
+int arch_sanitise_domain_config(const struct xen_domctl_createdomain *con=
fig);
=20
 /*
  * Create a domain: the configuration is only necessary for real domain
--=20
2=2E53=2E0



-- 
Julian Vetter | Vates Hypervisor & Kernel Developer

XCP-ng & Xen Orch=
estra - Vates solutions

web: https://vates=2Etech
---=Part.638.6ff1eb3fb31b0ef8.19f4c51a5a9.b3c7760e02c28758=---

