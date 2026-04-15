Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +Aa2NnCT32n5WAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 15 Apr 2026 15:32:32 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4817E404D0A
	for <lists+xen-devel@lfdr.de>; Wed, 15 Apr 2026 15:32:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1282448.1565033 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wD0Lr-0000Iv-QM; Wed, 15 Apr 2026 13:32:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1282448.1565033; Wed, 15 Apr 2026 13:32:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wD0Lr-0000Gc-NU; Wed, 15 Apr 2026 13:32:19 +0000
Received: by outflank-mailman (input) for mailman id 1282448;
 Wed, 15 Apr 2026 13:32:18 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <bounce-md_30504962.69df9360.v1-2f204a884a51440aa20c387e5f905bb7@bounce.vates.tech>)
 id 1wD0Lq-0000GL-Or
 for xen-devel@lists.xenproject.org; Wed, 15 Apr 2026 13:32:18 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wD0Lq-00DDma-1o
 for xen-devel@lists.xenproject.org; Wed, 15 Apr 2026 15:32:18 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <bounce-md_30504962.69df9360.v1-2f204a884a51440aa20c387e5f905bb7@bounce.vates.tech>)
 id 69df9357-e002-0a2a0a5209dd-0a2a4501b888-48
 for <xen-devel@lists.xenproject.org>; Wed, 15 Apr 2026 15:32:18 +0200
Received: from [198.2.187.14] (helo=mail187-14.suw11.mandrillapp.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from
 <bounce-md_30504962.69df9360.v1-2f204a884a51440aa20c387e5f905bb7@bounce.vates.tech>)
 id 69df9360-c1f2-0a2a45010019-c602bb0eba87-3
 for <xen-devel@lists.xenproject.org>; Wed, 15 Apr 2026 15:32:17 +0200
Received: from pmta09.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail187-14.suw11.mandrillapp.com (Mailchimp) with ESMTP id
 4fwhrw3phtz8XSHSC
 for <xen-devel@lists.xenproject.org>; Wed, 15 Apr 2026 13:32:16 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 2f204a884a51440aa20c387e5f905bb7; Wed, 15 Apr 2026 13:32:16 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=mte1 header.d=mandrillapp.com header.i="@mandrillapp.com" header.h="From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:Date:MIME-Version:Content-Type:Content-Transfer-Encoding"; dkim=pass header.s=mte1 header.d=vates.tech header.i="teddy.astie@vates.tech" header.h="From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:Date:MIME-Version:Content-Type:Content-Transfer-Encoding"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1776259936; x=1776529936;
	bh=V1xNEuLkT/UoGYapzOaT2ccLIg+S5oeSeb8h+8Yriq0=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=WXZh8Dzd8Jh/HUh0lgwEq2jolZ+EXZZ7ZvGjDjnMle6r3u7Zrw44uVMOCQml9LTay
	 j3+E734Z/i7cr7aEbZu8QrOq75ZZ8u27s9OPQi3lttmksmCcKgdh/C0zwEOAF3R/x8
	 EcFhVuDLe7KZS4l+suQkXOJH6FQ5BeY4cjehcHjwQECprEnySKOKoxby4G0hKGFiCI
	 acGELDQbHM4RFVy1tnccCtM6YIUJXzdrqdJMLZ5TsSck9YqL49VyeJamgPAFEvYpMt
	 WP0dIuE7bT0d+WSPb+fC4ArvJ6eql1bA0F1y13iZgxDHw2mMUK6wpC92Bh7oXsjcIM
	 LqVKnwMiAY6Mw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1776259936; x=1776520436; i=teddy.astie@vates.tech;
	bh=V1xNEuLkT/UoGYapzOaT2ccLIg+S5oeSeb8h+8Yriq0=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=QqmXDzKPu0zPeEW63cqKXrsHH/05zS9IyAZVmh4ynlQ6NM3HoYbDH7vKPhF2b2hO6
	 JbAUd+ssbjHpS4jvZ/kGHPnhzeEqmuYLRZV/EjofnYLBwFXgUbQlhaBjTruq5mu4Zz
	 BaX4mk+Uqlg5OmcorAOMDhndUvYIpKeg9HyKrUgDbA5UDr1YKJUandjrSuayg2SILl
	 KQu6g0R7buUUn92ddGU3a/luHF2d+YmAqbd8csK/b5AqoMjMqxA3Eemi1zjKoN/WgE
	 M+JTHsWMg0L4ESL+tSBQ9cUyl73F4HzvrJBoyuc+VQ7XSkAeGjrGcChoQR/RkMM5e3
	 4GlwhHOp9Bbww==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?[RFC=20PATCH=202/7]=20common:=20Track=20latest=20pCPU=20that=20ran=20the=20vCPU?=
X-Mailer: git-send-email 2.52.0
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1776259935319
To: xen-devel@lists.xenproject.org
Cc: "Teddy Astie" <teddy.astie@vates.tech>, "Jan Beulich" <jbeulich@suse.com>, "Andrew Cooper" <andrew.cooper3@citrix.com>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>, "Jason Andryuk" <jason.andryuk@amd.com>, "Anthony PERARD" <anthony.perard@vates.tech>, "Michal Orzel" <michal.orzel@amd.com>, "Julien Grall" <julien@xen.org>, "Stefano Stabellini" <sstabellini@kernel.org>
Message-Id: <f127344e083d224d2203b83c701375ca15e6368b.1776259594.git.teddy.astie@vates.tech>
In-Reply-To: <cover.1776259594.git.teddy.astie@vates.tech>
References: <cover.1776259594.git.teddy.astie@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.2f204a884a51440aa20c387e5f905bb7?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20260415:md
Date: Wed, 15 Apr 2026 13:32:16 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d62444/1776259938-B5E6BFF4-9814C635/0/0
X-purgate-type: clean
X-purgate-size: 3524
X-Spamd-Result: default: False [4.51 / 15.00];
	URIBL_GREY(2.50)[mandrillapp.com:dkim];
	SUBJ_EXCESS_QP(1.20)[];
	MID_CONTAINS_FROM(1.00)[];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	BAD_REP_POLICIES(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mandrillapp.com:dkim,vates.tech:mid,vates.tech:email,vates.tech:dkim,vates.tech:url,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	R_DKIM_ALLOW(0.00)[mandrillapp.com:s=mte1,vates.tech:s=mte1];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	GREYLIST(0.00)[pass,meta];
	FORGED_SENDER(0.00)[teddy.astie@vates.tech,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:teddy.astie@vates.tech,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:jason.andryuk@amd.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	DMARC_POLICY_ALLOW(0.00)[vates.tech,none];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[teddy.astie@vates.tech,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[mandrillapp.com:+,vates.tech:+];
	NEURAL_HAM(-0.00)[-0.938];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	R_SPF_ALLOW(0.00)[+a:lists.xenproject.org];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 4817E404D0A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Track on which pCPU each vCPU of a domain ran. This will
be used to know whether a TLB flush is required or not
when the vCPU is migrated on another pCPU.

Signed-off-by: Teddy Astie <teddy.astie@vates.tech>
---
I wonder if there is a way to move 

    curr->domain->latest_vcpu[cpu] = curr->vcpu_id

into a (at least more) common code ?

 xen/arch/x86/hvm/svm/svm.c | 3 +++
 xen/arch/x86/hvm/vmx/vmx.c | 3 +++
 xen/common/domain.c        | 8 ++++++++
 xen/include/xen/sched.h    | 4 ++++
 4 files changed, 18 insertions(+)

diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
index ced6166847..58e927ae04 100644
--- a/xen/arch/x86/hvm/svm/svm.c
+++ b/xen/arch/x86/hvm/svm/svm.c
@@ -967,6 +967,7 @@ void asmlinkage svm_vmenter_helper(void)
     const struct cpu_user_regs *regs = guest_cpu_user_regs();
     struct vcpu *curr = current;
     struct vmcb_struct *vmcb = curr->arch.hvm.svm.vmcb;
+    unsigned int cpu = smp_processor_id();
 
     ASSERT(hvmemul_cache_disabled(curr));
 
@@ -977,6 +978,8 @@ void asmlinkage svm_vmenter_helper(void)
 
     svm_sync_vmcb(curr, vmcb_needs_vmsave);
 
+    curr->domain->latest_vcpu[cpu] = curr->vcpu_id;
+
     vmcb->rax = regs->rax;
     vmcb->rip = regs->rip;
     vmcb->rsp = regs->rsp;
diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
index 269ca56433..ec0a790336 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -4934,6 +4934,7 @@ bool asmlinkage vmx_vmenter_helper(const struct cpu_user_regs *regs)
     u32 new_asid, old_asid;
     struct hvm_vcpu_asid *p_asid;
     bool need_flush;
+    unsigned int cpu = smp_processor_id();
 
     ASSERT(hvmemul_cache_disabled(curr));
 
@@ -4977,6 +4978,8 @@ bool asmlinkage vmx_vmenter_helper(const struct cpu_user_regs *regs)
     if ( unlikely(need_flush) )
         vpid_sync_all();
 
+    currd->latest_vcpu[cpu] = curr->vcpu_id;
+
     if ( paging_mode_hap(curr->domain) )
     {
         struct ept_data *ept = &p2m_get_hostp2m(currd)->ept;
diff --git a/xen/common/domain.c b/xen/common/domain.c
index bb9e210c28..7867166411 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -758,6 +758,7 @@ static void _domain_destroy(struct domain *d)
     rangeset_domain_destroy(d);
 
     free_cpumask_var(d->dirty_cpumask);
+    xfree(d->latest_vcpu);
 
     xsm_free_security_domain(d);
 
@@ -992,6 +993,13 @@ struct domain *domain_create(domid_t domid,
     if ( !zalloc_cpumask_var(&d->dirty_cpumask) )
         goto fail;
 
+    err = -ENOMEM;
+    d->latest_vcpu = xmalloc_array(int, nr_cpu_ids);
+    if ( !d->latest_vcpu )
+        goto fail;
+    for (unsigned int i = 0; i < nr_cpu_ids; i++)
+        d->latest_vcpu[i] = -1;
+
     rangeset_domain_initialise(d);
 
     if ( is_idle_domain(d) )
diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
index 212c7d765c..4b8ae21b51 100644
--- a/xen/include/xen/sched.h
+++ b/xen/include/xen/sched.h
@@ -567,6 +567,10 @@ struct domain
     /* Bitmask of CPUs which are holding onto this domain's state. */
     cpumask_var_t    dirty_cpumask;
 
+    /* Mapping of the latest vCPU that ran on a specific CPU
+     * (-1 if the vCPU hasn't ran yet) */
+    int *latest_vcpu;
+
     struct arch_domain arch;
 
     void *ssid; /* sHype security subject identifier */
-- 
2.52.0



--
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


