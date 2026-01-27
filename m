Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4DoxNk37eGlfuQEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 27 Jan 2026 18:52:13 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CA4FA98A8D
	for <lists+xen-devel@lfdr.de>; Tue, 27 Jan 2026 18:52:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1215120.1525385 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vknDn-0007kg-Ld; Tue, 27 Jan 2026 17:51:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1215120.1525385; Tue, 27 Jan 2026 17:51:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vknDn-0007hb-I3; Tue, 27 Jan 2026 17:51:23 +0000
Received: by outflank-mailman (input) for mailman id 1215120;
 Tue, 27 Jan 2026 17:51:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=S4F2=AA=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1vknDm-0007hU-Bw
 for xen-devel@lists.xenproject.org; Tue, 27 Jan 2026 17:51:22 +0000
Received: from sender4-of-o50.zoho.com (sender4-of-o50.zoho.com
 [136.143.188.50]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c8322f4c-fba8-11f0-9ccf-f158ae23cfc8;
 Tue, 27 Jan 2026 18:51:19 +0100 (CET)
Received: by mx.zohomail.com with SMTPS id 1769536265579732.5117684063396;
 Tue, 27 Jan 2026 09:51:05 -0800 (PST)
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
X-Inumbo-ID: c8322f4c-fba8-11f0-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; t=1769536269; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=jUfwhqCOEGD87uKQvKdjlo6ohYo1+E2Ohh1nh7InUi7Q092banYqJNfrRAlCvZLLqP1lGNnT4AV0DYk/PoS96R499bGXXvtRFQCi1jyT4JKOBfzkN4vkRMH3FUxbOSbq9adBuiUjh9MmjpM+e+yA79LUrnQJiA6h/+l5i5cfqZ0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1769536269; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=OrN+s/CeBkvY6OLF544byRKGHNDaX7CsVaNVPwnDGfc=; 
	b=OJYlu4dNi/Ul8OKgjDVr0qAZ8Jjt3j6dcLR2C0h+VrNK0/4OB8t6qXo2nhx1wjku2T8axzavKMO0r2oKy3RUiMp1bPcT9TldAJAYsJQE2U7LkYoPgQvw1gJumAwKudonDe/q2/cyvrSp2jdktAp3CgoYPY7qs7qj8OS6iSxWt1I=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1769536269;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=OrN+s/CeBkvY6OLF544byRKGHNDaX7CsVaNVPwnDGfc=;
	b=cF5/R/ccxnaHT1T+coJsTSP1WS8dTcoGsy7e1p9ZLCCL9JbHa0WFV/3baNqerSed
	DgSyO2pf3pRxligYTpq4EFTA9acvcDz2eApkQKfQnyCljcFpIU+8mdoQLnOPE3zY1c1
	iNbs5UGO9NMNZSEvj32/57DRR0NQexFBNHKq9rgU=
Message-ID: <41b1096f-e9f9-4e7f-a718-4cc9bce9b0a1@apertussolutions.com>
Date: Tue, 27 Jan 2026 12:51:05 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/16] xen/sysctl: Drop XEN_SYSCTL_get_cpu_levelling_caps
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Julian Vetter <julian.vetter@vates.tech>,
 Teddy Astie <teddy.astie@vates.tech>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <20260126175345.2078371-1-andrew.cooper3@citrix.com>
 <20260126175345.2078371-9-andrew.cooper3@citrix.com>
Content-Language: en-US
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <20260126175345.2078371-9-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[zohomail.com:s=zohoarc:i=1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[apertussolutions.com:s=zoho];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[changelog.md:url,suse.com:email,apertussolutions.com:email,apertussolutions.com:dkim,apertussolutions.com:mid,keepachangelog.com:url];
	TO_DN_ALL(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:xen-devel@lists.xenproject.org,m:JBeulich@suse.com,m:roger.pau@citrix.com,m:julian.vetter@vates.tech,m:teddy.astie@vates.tech,m:oleksii.kurochko@gmail.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[dpsmith@apertussolutions.com,xen-devel-bounces@lists.xenproject.org];
	DMARC_NA(0.00)[apertussolutions.com];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[suse.com,citrix.com,vates.tech,gmail.com];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	FROM_NEQ_ENVFROM(0.00)[dpsmith@apertussolutions.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[apertussolutions.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	MIME_TRACE(0.00)[0:+];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: CA4FA98A8D
X-Rspamd-Action: no action

On 1/26/26 12:53 PM, Andrew Cooper wrote:
> This hypercall is an addition of mine from commit 67528a3f0649 ("x86/cpu:
> Sysctl and common infrastructure for levelling context switching", 2016), but
> it never got wired into any toolstacks.  In the meantime, how we handle CPUID
> for guests has evolved substantially.
> 
> In order to reuse the AMD levelling infrasturcture for boot time quirks,
> levelling_caps is going to have to change.  While it's probably safe to expose
> this difference, it's safer still to make it an internal detail.
> 
> When re-plummbing the LCAP_* constants, turn them all into single bits.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> CC: Julian Vetter <julian.vetter@vates.tech>
> CC: Teddy Astie <teddy.astie@vates.tech>
> CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> CC: Daniel P. Smith <dpsmith@apertussolutions.com>
> ---
>   CHANGELOG.md                        |  2 ++
>   tools/flask/policy/modules/dom0.te  |  1 -
>   tools/include/xenguest.h            |  1 -
>   tools/libs/guest/xg_cpuid_x86.c     | 14 --------------
>   xen/arch/x86/include/asm/cpuid.h    | 15 ++++++---------
>   xen/arch/x86/sysctl.c               |  6 ------
>   xen/include/public/sysctl.h         | 22 +---------------------
>   xen/xsm/flask/hooks.c               |  4 ----
>   xen/xsm/flask/policy/access_vectors |  2 --
>   9 files changed, 9 insertions(+), 58 deletions(-)
> 
> diff --git a/CHANGELOG.md b/CHANGELOG.md
> index 18f3d10f20d2..425118bc9ae9 100644
> --- a/CHANGELOG.md
> +++ b/CHANGELOG.md
> @@ -19,6 +19,8 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
>      - The cpuid_mask_* command line options for legacy CPUs.  These were
>        deprecated in Xen 4.7 and noted not to work correctly with AMD CPUs from
>        2011 onwards, nor work at all with Intel CPUs from 2012.
> +   - The SYSCTL_get_cpu_levelling_caps sysctl.  This is not known to have been
> +     used by any toolstack.
>      - Xenoprofile support.  Oprofile themselves removed support for Xen in 2014
>        prior to the version 1.0 release, and there has been no development since
>        before then in Xen.
> diff --git a/tools/flask/policy/modules/dom0.te b/tools/flask/policy/modules/dom0.te
> index d30edf8be1fb..aae69041a966 100644
> --- a/tools/flask/policy/modules/dom0.te
> +++ b/tools/flask/policy/modules/dom0.te
> @@ -43,7 +43,6 @@ allow dom0_t xen_t:xen2 {
>   	psr_alloc
>   	pmu_ctrl
>   	get_symbol
> -	get_cpu_levelling_caps
>   	get_cpu_featureset
>   	livepatch_op
>   	coverage_op
> diff --git a/tools/include/xenguest.h b/tools/include/xenguest.h
> index 7c3b8b098352..2a277cb7cd61 100644
> --- a/tools/include/xenguest.h
> +++ b/tools/include/xenguest.h
> @@ -822,7 +822,6 @@ int xc_cpu_policy_update_msrs(xc_interface *xch, xc_cpu_policy_t *policy,
>   bool xc_cpu_policy_is_compatible(xc_interface *xch, xc_cpu_policy_t *host,
>                                    xc_cpu_policy_t *guest);
>   
> -int xc_get_cpu_levelling_caps(xc_interface *xch, uint32_t *caps);
>   int xc_get_cpu_featureset(xc_interface *xch, uint32_t index,
>                             uint32_t *nr_features, uint32_t *featureset);
>   
> diff --git a/tools/libs/guest/xg_cpuid_x86.c b/tools/libs/guest/xg_cpuid_x86.c
> index 263a9d4787b6..0db6d77cd801 100644
> --- a/tools/libs/guest/xg_cpuid_x86.c
> +++ b/tools/libs/guest/xg_cpuid_x86.c
> @@ -36,20 +36,6 @@ enum {
>   #define bitmaskof(idx)      (1u << ((idx) & 31))
>   #define featureword_of(idx) ((idx) >> 5)
>   
> -int xc_get_cpu_levelling_caps(xc_interface *xch, uint32_t *caps)
> -{
> -    struct xen_sysctl sysctl = {};
> -    int ret;
> -
> -    sysctl.cmd = XEN_SYSCTL_get_cpu_levelling_caps;
> -    ret = do_sysctl(xch, &sysctl);
> -
> -    if ( !ret )
> -        *caps = sysctl.u.cpu_levelling_caps.caps;
> -
> -    return ret;
> -}
> -
>   int xc_get_cpu_featureset(xc_interface *xch, uint32_t index,
>                             uint32_t *nr_features, uint32_t *featureset)
>   {
> diff --git a/xen/arch/x86/include/asm/cpuid.h b/xen/arch/x86/include/asm/cpuid.h
> index f1b9e37a42ca..c7ee1d54bc7e 100644
> --- a/xen/arch/x86/include/asm/cpuid.h
> +++ b/xen/arch/x86/include/asm/cpuid.h
> @@ -15,15 +15,12 @@ extern const uint32_t known_features[FSCAPINTS];
>    * Expected levelling capabilities (given cpuid vendor/family information),
>    * and levelling capabilities actually available (given MSR probing).
>    */
> -#define LCAP_faulting XEN_SYSCTL_CPU_LEVELCAP_faulting
> -#define LCAP_1cd      (XEN_SYSCTL_CPU_LEVELCAP_ecx |        \
> -                       XEN_SYSCTL_CPU_LEVELCAP_edx)
> -#define LCAP_e1cd     (XEN_SYSCTL_CPU_LEVELCAP_extd_ecx |   \
> -                       XEN_SYSCTL_CPU_LEVELCAP_extd_edx)
> -#define LCAP_Da1      XEN_SYSCTL_CPU_LEVELCAP_xsave_eax
> -#define LCAP_6c       XEN_SYSCTL_CPU_LEVELCAP_thermal_ecx
> -#define LCAP_7ab0     (XEN_SYSCTL_CPU_LEVELCAP_l7s0_eax |   \
> -                       XEN_SYSCTL_CPU_LEVELCAP_l7s0_ebx)
> +#define LCAP_faulting (1U <<  0) /* CPUID Faulting       */
> +#define LCAP_1cd      (1U <<  1) /* 0x00000001.ecx/edx   */
> +#define LCAP_e1cd     (1U <<  2) /* 0x80000001.ecx/edx   */
> +#define LCAP_Da1      (1U <<  3) /* 0x0000000D:1.eax     */
> +#define LCAP_6c       (1U <<  4) /* 0x00000006.ecx       */
> +#define LCAP_7ab0     (1U <<  5) /* 0x00000007:0.eax/ebx */
>   extern unsigned int expected_levelling_cap, levelling_caps;
>   
>   struct cpuidmasks
> diff --git a/xen/arch/x86/sysctl.c b/xen/arch/x86/sysctl.c
> index 1b04947516bb..0fbbdd8b280d 100644
> --- a/xen/arch/x86/sysctl.c
> +++ b/xen/arch/x86/sysctl.c
> @@ -289,12 +289,6 @@ long arch_do_sysctl(
>           break;
>       }
>   
> -    case XEN_SYSCTL_get_cpu_levelling_caps:
> -        sysctl->u.cpu_levelling_caps.caps = levelling_caps;
> -        if ( __copy_field_to_guest(u_sysctl, sysctl, u.cpu_levelling_caps.caps) )
> -            ret = -EFAULT;
> -        break;
> -
>       case XEN_SYSCTL_get_cpu_featureset:
>       {
>           static const struct cpu_policy *const policy_table[6] = {
> diff --git a/xen/include/public/sysctl.h b/xen/include/public/sysctl.h
> index 66c9b65465cc..6b4ec5f7f765 100644
> --- a/xen/include/public/sysctl.h
> +++ b/xen/include/public/sysctl.h
> @@ -932,25 +932,6 @@ struct xen_sysctl_psr_alloc {
>       } u;
>   };
>   
> -/*
> - * XEN_SYSCTL_get_cpu_levelling_caps (x86 specific)
> - *
> - * Return hardware capabilities concerning masking or faulting of the cpuid
> - * instruction for PV guests.
> - */
> -struct xen_sysctl_cpu_levelling_caps {
> -#define XEN_SYSCTL_CPU_LEVELCAP_faulting    (1UL <<  0) /* CPUID faulting    */
> -#define XEN_SYSCTL_CPU_LEVELCAP_ecx         (1UL <<  1) /* 0x00000001.ecx    */
> -#define XEN_SYSCTL_CPU_LEVELCAP_edx         (1UL <<  2) /* 0x00000001.edx    */
> -#define XEN_SYSCTL_CPU_LEVELCAP_extd_ecx    (1UL <<  3) /* 0x80000001.ecx    */
> -#define XEN_SYSCTL_CPU_LEVELCAP_extd_edx    (1UL <<  4) /* 0x80000001.edx    */
> -#define XEN_SYSCTL_CPU_LEVELCAP_xsave_eax   (1UL <<  5) /* 0x0000000D:1.eax  */
> -#define XEN_SYSCTL_CPU_LEVELCAP_thermal_ecx (1UL <<  6) /* 0x00000006.ecx    */
> -#define XEN_SYSCTL_CPU_LEVELCAP_l7s0_eax    (1UL <<  7) /* 0x00000007:0.eax  */
> -#define XEN_SYSCTL_CPU_LEVELCAP_l7s0_ebx    (1UL <<  8) /* 0x00000007:0.ebx  */
> -    uint32_t caps;
> -};
> -
>   /*
>    * XEN_SYSCTL_get_cpu_featureset (x86 specific)
>    *
> @@ -1270,7 +1251,7 @@ struct xen_sysctl {
>   #define XEN_SYSCTL_pcitopoinfo                   22
>   #define XEN_SYSCTL_psr_alloc                     23
>   /* #define XEN_SYSCTL_tmem_op                       24 */
> -#define XEN_SYSCTL_get_cpu_levelling_caps        25
> +/* #define XEN_SYSCTL_get_cpu_levelling_caps        25 */
>   #define XEN_SYSCTL_get_cpu_featureset            26
>   #define XEN_SYSCTL_livepatch_op                  27
>   /* #define XEN_SYSCTL_set_parameter              28 */
> @@ -1300,7 +1281,6 @@ struct xen_sysctl {
>           struct xen_sysctl_coverage_op       coverage_op;
>           struct xen_sysctl_psr_cmt_op        psr_cmt_op;
>           struct xen_sysctl_psr_alloc         psr_alloc;
> -        struct xen_sysctl_cpu_levelling_caps cpu_levelling_caps;
>           struct xen_sysctl_cpu_featureset    cpu_featureset;
>           struct xen_sysctl_livepatch_op      livepatch;
>   #if defined(__i386__) || defined(__x86_64__)
> diff --git a/xen/xsm/flask/hooks.c b/xen/xsm/flask/hooks.c
> index b250b2706535..28522dcbd271 100644
> --- a/xen/xsm/flask/hooks.c
> +++ b/xen/xsm/flask/hooks.c
> @@ -884,10 +884,6 @@ static int cf_check flask_sysctl(int cmd)
>           return avc_current_has_perm(SECINITSID_XEN, SECCLASS_XEN2,
>                                       XEN2__PSR_ALLOC, NULL);
>   
> -    case XEN_SYSCTL_get_cpu_levelling_caps:
> -        return avc_current_has_perm(SECINITSID_XEN, SECCLASS_XEN2,
> -                                    XEN2__GET_CPU_LEVELLING_CAPS, NULL);
> -
>       case XEN_SYSCTL_get_cpu_featureset:
>           return avc_current_has_perm(SECINITSID_XEN, SECCLASS_XEN2,
>                                       XEN2__GET_CPU_FEATURESET, NULL);
> diff --git a/xen/xsm/flask/policy/access_vectors b/xen/xsm/flask/policy/access_vectors
> index ce907d50a45e..bbb9c117ec4a 100644
> --- a/xen/xsm/flask/policy/access_vectors
> +++ b/xen/xsm/flask/policy/access_vectors
> @@ -87,8 +87,6 @@ class xen2
>       pmu_ctrl
>   # PMU use (domains, including unprivileged ones, will be using this operation)
>       pmu_use
> -# XEN_SYSCTL_get_cpu_levelling_caps
> -    get_cpu_levelling_caps
>   # XEN_SYSCTL_get_cpu_featureset
>       get_cpu_featureset
>   # XEN_SYSCTL_livepatch_op

Acked-by: Daniel P. Smith <dpsmith@apertussolutions.com>

