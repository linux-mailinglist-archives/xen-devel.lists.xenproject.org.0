Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +K2HE0fC2Gk4hwgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 10 Apr 2026 11:26:31 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 95A803D4B8C
	for <lists+xen-devel@lfdr.de>; Fri, 10 Apr 2026 11:26:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1278558.1563350 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wB880-0006k7-Fr; Fri, 10 Apr 2026 09:26:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1278558.1563350; Fri, 10 Apr 2026 09:26:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wB880-0006ho-D9; Fri, 10 Apr 2026 09:26:16 +0000
Received: by outflank-mailman (input) for mailman id 1278558;
 Fri, 10 Apr 2026 09:26:15 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <bounce-md_30504962.69d8c234.v1-e8385e73c0454e59839060e1a48cc0ce@bounce.vates.tech>)
 id 1wB87z-0006gP-2s
 for xen-devel@lists.xenproject.org; Fri, 10 Apr 2026 09:26:15 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wB87y-00GWQO-Ej
 for xen-devel@lists.xenproject.org; Fri, 10 Apr 2026 11:26:14 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <bounce-md_30504962.69d8c234.v1-e8385e73c0454e59839060e1a48cc0ce@bounce.vates.tech>)
 id 69d8c227-bab6-0a2a0a5309dd-0a2a4504e760-34
 for <xen-devel@lists.xenproject.org>; Fri, 10 Apr 2026 11:26:14 +0200
Received: from [198.2.187.14] (helo=mail187-14.suw11.mandrillapp.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from
 <bounce-md_30504962.69d8c234.v1-e8385e73c0454e59839060e1a48cc0ce@bounce.vates.tech>)
 id 69d8c235-bb33-0a2a45040019-c602bb0ebde0-3
 for <xen-devel@lists.xenproject.org>; Fri, 10 Apr 2026 11:26:14 +0200
Received: from pmta09.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail187-14.suw11.mandrillapp.com (Mailchimp) with ESMTP id
 4fsWdJ5V3kz8XS6n3
 for <xen-devel@lists.xenproject.org>; Fri, 10 Apr 2026 09:26:12 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 e8385e73c0454e59839060e1a48cc0ce; Fri, 10 Apr 2026 09:26:12 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=mte1 header.d=mandrillapp.com header.i="@mandrillapp.com" header.h="From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:Date:MIME-Version:Content-Type:Content-Transfer-Encoding"; dkim=pass header.s=mte1 header.d=vates.tech header.i="teddy.astie@vates.tech" header.h="From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:Date:MIME-Version:Content-Type:Content-Transfer-Encoding"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1775813172; x=1776083172;
	bh=MN57+wFD3YMSu+hnCyiMaTNNIg+kDpL+iSz3lyloMgY=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=XrES4pPDXzksgmBdmieUdtHN8sQsbJj5U/zSq7eNeArp9prDarQjFYnRGzfRPi5Kc
	 8hS6TyjTUTOVal2D6ZJhxrK7WK03TgTavVq1kKBvjfD/opN6tffBmIWqHfh52N0n3B
	 yFzIgkCxyMmaRIRU0oKiqi0gElQaZ0dctbaM3iyH3CICyn7LEAl7aINqeIp1GwdVYe
	 QcR7IqwIY1EFw9m99RzeSnvXvCo4DEzCgSxUWQKJVfVduq+nUKtEyF3hc2XtVHL2bb
	 kWuiNVfWAsRu0LvxD/kiAfB3BJESZKIEgWeJhAN6+v9v96tk9tkSQvvpTUiv7gDNfN
	 mVqWZ4iVNQFFg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1775813172; x=1776073672; i=teddy.astie@vates.tech;
	bh=MN57+wFD3YMSu+hnCyiMaTNNIg+kDpL+iSz3lyloMgY=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=t0OteAOWCBimQDuo67L8ZJdOdmYFdhqYVKAD83HzR053udULN6UB1jtUbiw7rjZaN
	 7lbbew+67tzLXULPJvZshon0yjVxQCnLkUv2D5w8Bk7urQI6KZ0zjE9s0FX8Uv3slL
	 trB+sHMRUOocs7wtJOZtu7QZSIQ0BnNaQYfT1Ln7cY0Mmv6H8q7P5H54EcwmwW15FU
	 yoVS11ozG6M0U40PRWZir0wzITeKB8MAuMTNQDWd2v51ykHqoJmydso69zLwiL7V/W
	 LFOq5CtqaLElKEbsvVVAh+0r3NCEx7YV1UIKM6KXdmv11f5QBsRkcNXdrHTajF8rlw
	 3caNT0vJmQYSQ==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=20v4=2000.9/16]=20x86/CPUID:=20enable=20AVX10=20leaf?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1775813171619
Message-Id: <029ab247-b8a1-4961-80ab-5b13e5c7aa77@vates.tech>
To: "Jan Beulich" <jbeulich@suse.com>, xen-devel@lists.xenproject.org
Cc: "Andrew Cooper" <andrew.cooper3@citrix.com>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>
References: <1e2ff012-b07a-43be-9ba6-290b38d3c97c@suse.com> <bdf60f69-6d1f-4332-9575-671d475c542e@suse.com>
In-Reply-To: <bdf60f69-6d1f-4332-9575-671d475c542e@suse.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.e8385e73c0454e59839060e1a48cc0ce?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20260410:md
Date: Fri, 10 Apr 2026 09:26:12 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-ebf023/1775813174-B0B2851B-190ED84D/0/0
X-purgate-type: clean
X-purgate-size: 15738
X-Spamd-Result: default: False [3.51 / 15.00];
	URIBL_GREY(2.50)[mandrillapp.com:dkim];
	SUBJ_EXCESS_QP(1.20)[];
	MAILLIST(-0.18)[generic];
	BAD_REP_POLICIES(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	R_DKIM_ALLOW(0.00)[mandrillapp.com:s=mte1,vates.tech:s=mte1];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[vates.tech,none];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[teddy.astie@vates.tech,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[mandrillapp.com:+,vates.tech:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,mandrillapp.com:dkim,suse.com:email];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-0.927];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[teddy.astie@vates.tech,xen-devel-bounces@lists.xenproject.org];
	RCPT_COUNT_THREE(0.00)[4];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	R_SPF_ALLOW(0.00)[+a:lists.xenproject.org:c];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 95A803D4B8C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Le 09/04/2026 =C3=A0 17:18, Jan Beulich a =C3=A9crit=C2=A0:
> This requires bumping the number of basic leaves we support. Apart from
> this the logic is modeled as closely as possible after that of leaf 7
> handling.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> The gen-cpuid.py adjustment is merely the minimum needed. It's not
> really clear to me whether someone turning off e.g. AVX512BW might then
> also validly expect AVX10 to be turned off.
> 

AFAIUI, AVX512BW is a dependency of AVX10, as AVX10 implies that the 
former is available.

> Do we want to synthesize AVX10 in the (max?) policies when all necessary
> AVX512* features are available, thus allowing migration from an AVX10
> host to a suitable non-AVX10 one?
> 

I guess we want, there is not really a reason to not allow it.

Some software may check for AVX10 only, and not check for individual 
AVX512 bits.

> The prior vsz<N> bits are now defined as reserved-at-1: No idea yet how
> to represent this properly.
> 
> How a toolstack side equivalent (if any) of the init_dom0_cpuid_policy()
> change would look like is entirely unclear to me. How much should we
> take from the max policy, and how much should we permit/require the user
> to specify (and how would the latter look like)?
> 
> While, as per a comment next to the call site of
> recalculate_cpuid_policy(), recalculate_*() are supposed to go away when
> x86_cpu_policies_are_compatible() is complete, some of the checking done
> in recalculate_misc() really wouldn't below there. We'd need another "is
> self-consistent" checking function.
> ---
> v4: Drop all traces of AVX10/256. Add max_subleaf check to
>      x86_cpu_policies_are_compatible(). Add/adjust vsz<N> checks in
>      recalculate_misc(). In the max policies, synthesize AVX512* when
>      AVX10 is available.
> v3: Re-base.
> v2: Add logic to init_dom0_cpuid_policy(). Drop vsz128 field. Re-base.
> 
> --- a/xen/arch/x86/cpu-policy.c
> +++ b/xen/arch/x86/cpu-policy.c
> @@ -211,7 +211,7 @@ static void recalculate_xstate(struct cp
>       if ( p->feat.mpx )
>           xstates |=3D X86_XCR0_BNDREGS | X86_XCR0_BNDCSR;
>   
> -    if ( p->feat.avx512f )
> +    if ( p->feat.avx512f || p->feat.avx10 )

In principle, the avx10 check is redundant as avx512f must be set if 
avx10 is set.

>           xstates |=3D X86_XCR0_OPMASK | X86_XCR0_ZMM | X86_XCR0_HI_ZMM;
>   
>       if ( p->feat.pku )
> @@ -272,6 +272,18 @@ static void recalculate_misc(struct cpu_
>   
>       p->basic.raw[0xc] =3D EMPTY_LEAF;
>   
> +    zero_leaves(p->basic.raw, 0xe, 0x23);
> +
> +    p->avx10.raw[0].b &=3D 0x000700ff;
> +    p->avx10.raw[0].c =3D 0;
> +    p->avx10.raw[0].d =3D 0;
> +    if ( !p->feat.avx10 || !p->avx10.version ||
> +         !p->avx10.vsz512 || !p->avx10.vsz256 || !p->avx10.vsz128 )
> +    {
> +        p->feat.avx10 =3D false;
> +        memset(p->avx10.raw, 0, sizeof(p->avx10.raw));
> +    }
> +
>       p->extd.e1d &=3D ~CPUID_COMMON_1D_FEATURES;
>   
>       /* Most of Power/RAS hidden from guests. */
> @@ -400,6 +412,7 @@ static void __init guest_common_max_leav
>   {
>       p->basic.max_leaf       =3D ARRAY_SIZE(p->basic.raw) - 1;
>       p->feat.max_subleaf     =3D ARRAY_SIZE(p->feat.raw) - 1;
> +    p->avx10.max_subleaf    =3D ARRAY_SIZE(p->avx10.raw) - 1;
>       p->extd.max_leaf        =3D 0x80000000U + ARRAY_SIZE(p->extd.raw) -=
 1;
>   }
>   
> @@ -408,6 +421,7 @@ static void __init guest_common_default_
>   {
>       p->basic.max_leaf       =3D host_cpu_policy.basic.max_leaf;
>       p->feat.max_subleaf     =3D host_cpu_policy.feat.max_subleaf;
> +    p->avx10.max_subleaf    =3D host_cpu_policy.avx10.max_subleaf;
>       p->extd.max_leaf        =3D host_cpu_policy.extd.max_leaf;
>   }
>   
> @@ -503,6 +517,28 @@ static void __init guest_common_max_feat
>        * function correctly when migrated here, even if ERMS isn't availa=
ble.
>        */
>       __set_bit(X86_FEATURE_ERMS, fs);
> +
> +    /*
> +     * AVX10 is merely a re-declaration of a combination of AVX512 featu=
res.
> +     * Synthesize the latter from the former, when available.  Doing it =
the
> +     * other way around would also require synthesizing the AVX10 CPUID =
leaf.
> +     */
> +    if ( test_bit(X86_FEATURE_AVX10, fs) )
> +    {
> +        __set_bit(X86_FEATURE_AVX512F, fs);
> +        __set_bit(X86_FEATURE_AVX512VL, fs);
> +        __set_bit(X86_FEATURE_AVX512BW, fs);
> +        __set_bit(X86_FEATURE_AVX512DQ, fs);
> +        __set_bit(X86_FEATURE_AVX512_BF16, fs);
> +        __set_bit(X86_FEATURE_AVX512_FP16, fs);
> +        __set_bit(X86_FEATURE_AVX512CD, fs);
> +        __set_bit(X86_FEATURE_AVX512_BITALG, fs);
> +        __set_bit(X86_FEATURE_AVX512_IFMA, fs);
> +        __set_bit(X86_FEATURE_AVX512_VBMI, fs);
> +        __set_bit(X86_FEATURE_AVX512_VBMI2, fs);
> +        __set_bit(X86_FEATURE_AVX512_VNNI, fs);
> +        __set_bit(X86_FEATURE_AVX512_VPOPCNTDQ, fs);
> +    }
>   }
>   
>   static void __init guest_common_default_feature_adjustments(uint32_t *f=
s)
> @@ -966,6 +1002,7 @@ void recalculate_cpuid_policy(struct dom
>   
>       p->basic.max_leaf   =3D min(p->basic.max_leaf,   max->basic.max_lea=
f);
>       p->feat.max_subleaf =3D min(p->feat.max_subleaf, max->feat.max_subl=
eaf);
> +    p->avx10.max_subleaf =3D min(p->avx10.max_subleaf, max->avx10.max_su=
bleaf);
>       p->extd.max_leaf    =3D 0x80000000U | min(p->extd.max_leaf & 0xffff=
,
>                                               ((p->x86_vendor & (X86_VEND=
OR_AMD |
>                                                                  X86_VEND=
OR_HYGON))
> @@ -1012,6 +1049,8 @@ void recalculate_cpuid_policy(struct dom
>   
>       if ( p->basic.max_leaf < XSTATE_CPUID )
>           __clear_bit(X86_FEATURE_XSAVE, fs);
> +    if ( p->basic.max_leaf < 0x24 )
> +        __clear_bit(X86_FEATURE_AVX10, fs);
>   
>       sanitise_featureset(fs);
>   
> @@ -1081,9 +1120,18 @@ void __init init_dom0_cpuid_policy(struc
>       /* Apply dom0-cpuid=3D command line settings, if provided. */
>       if ( dom0_cpuid_cmdline )
>       {
> +        const struct cpu_policy *max =3D is_pv_domain(d)
> +            ? (IS_ENABLED(CONFIG_PV)  ?  &pv_max_cpu_policy : NULL)
> +            : (IS_ENABLED(CONFIG_HVM) ? &hvm_max_cpu_policy : NULL);
>           uint32_t fs[FSCAPINTS];
>           unsigned int i;
>   
> +        if ( !max )
> +        {
> +            ASSERT_UNREACHABLE();
> +            return;
> +        }
> +
>           x86_cpu_policy_to_featureset(p, fs);
>   
>           for ( i =3D 0; i < ARRAY_SIZE(fs); ++i )
> @@ -1093,6 +1141,13 @@ void __init init_dom0_cpuid_policy(struc
>           }
>   
>           x86_cpu_featureset_to_policy(fs, p);
> +
> +        /*
> +         * Default-off features with their own leaves need those leaves
> +         * re-populated from the max policy.
> +         */
> +        if ( p->feat.avx10 )
> +            p->avx10 =3D max->avx10;
>       }
>   
>       /*
> @@ -1125,6 +1180,8 @@ static void __init __maybe_unused build_
>                    sizeof(raw_cpu_policy.feat.raw));
>       BUILD_BUG_ON(sizeof(raw_cpu_policy.xstate) !=3D
>                    sizeof(raw_cpu_policy.xstate.raw));
> +    BUILD_BUG_ON(sizeof(raw_cpu_policy.avx10) !=3D
> +                 sizeof(raw_cpu_policy.avx10.raw));
>       BUILD_BUG_ON(sizeof(raw_cpu_policy.extd) !=3D
>                    sizeof(raw_cpu_policy.extd.raw));
>   }
> --- a/xen/arch/x86/cpuid.c
> +++ b/xen/arch/x86/cpuid.c
> @@ -226,6 +226,15 @@ void guest_cpuid(const struct vcpu *v, u
>               *res =3D array_access_nospec(p->xstate.raw, subleaf);
>               break;
>   
> +        case 0x24:
> +            ASSERT(p->avx10.max_subleaf < ARRAY_SIZE(p->avx10.raw));
> +            if ( subleaf > min_t(uint32_t, p->avx10.max_subleaf,
> +                                 ARRAY_SIZE(p->avx10.raw) - 1) )
> +                return;
> +
> +            *res =3D array_access_nospec(p->avx10.raw, subleaf);
> +            break;
> +
>           default:
>               *res =3D array_access_nospec(p->basic.raw, leaf);
>               break;
> --- a/xen/arch/x86/lib/cpu-policy/copy-to-buffer.c
> +++ b/xen/arch/x86/lib/cpu-policy/copy-to-buffer.c
> @@ -123,6 +123,13 @@ int x86_cpuid_copy_to_buffer(const struc
>               break;
>           }
>   
> +        case 0x24:
> +            for ( subleaf =3D 0;
> +                  subleaf <=3D MIN(p->avx10.max_subleaf,
> +                                 ARRAY_SIZE(p->avx10.raw) - 1); ++sublea=
f )
> +                COPY_LEAF(leaf, subleaf, &p->avx10.raw[subleaf]);
> +            break;
> +
>           default:
>               COPY_LEAF(leaf, XEN_CPUID_NO_SUBLEAF, &p->basic.raw[leaf]);
>               break;
> --- a/xen/arch/x86/lib/cpu-policy/copy-from-buffer.c
> +++ b/xen/arch/x86/lib/cpu-policy/copy-from-buffer.c
> @@ -108,6 +108,13 @@ int x86_cpuid_copy_from_buffer(struct cp
>                   array_access_nospec(p->xstate.raw, data.subleaf) =3D l;
>                   break;
>   
> +            case 0x24:
> +                if ( data.subleaf >=3D ARRAY_SIZE(p->avx10.raw) )
> +                    goto out_of_range;
> +
> +                array_access_nospec(p->avx10.raw, data.subleaf) =3D l;
> +                break;
> +
>               default:
>                   if ( data.subleaf !=3D XEN_CPUID_NO_SUBLEAF )
>                       goto out_of_range;
> --- a/xen/arch/x86/lib/cpu-policy/cpuid.c
> +++ b/xen/arch/x86/lib/cpu-policy/cpuid.c
> @@ -125,6 +125,7 @@ void x86_cpu_policy_fill_native(struct c
>           switch ( i )
>           {
>           case 0x4: case 0x7: case 0xb: case 0xd:
> +        case 0x24:
>               /* Multi-invocation leaves.  Deferred. */
>               continue;
>           }
> @@ -218,6 +219,15 @@ void x86_cpu_policy_fill_native(struct c
>           }
>       }
>   
> +    if ( p->basic.max_leaf >=3D 0x24 )
> +    {
> +        cpuid_count_leaf(0x24, 0, &p->avx10.raw[0]);
> +
> +        for ( i =3D 1; i <=3D MIN(p->avx10.max_subleaf,
> +                              ARRAY_SIZE(p->avx10.raw) - 1); ++i )
> +            cpuid_count_leaf(0x24, i, &p->avx10.raw[i]);

Do we need to split the 0 iteration out ? I guess we can just start from 
i =3D 0 instead.

> +    }
> +
>       /* Extended leaves. */
>       cpuid_leaf(0x80000000U, &p->extd.raw[0]);
>       for ( i =3D 1; i <=3D MIN(p->extd.max_leaf & 0xffffU,
> @@ -287,6 +297,9 @@ void x86_cpu_policy_clear_out_of_range_l
>                       ARRAY_SIZE(p->xstate.raw) - 1);
>       }
>   
> +    if ( p->basic.max_leaf < 0x24 )
> +        memset(p->avx10.raw, 0, sizeof(p->avx10.raw));
> +
>       zero_leaves(p->extd.raw,
>                   ((p->extd.max_leaf >> 16) =3D=3D 0x8000
>                    ? (p->extd.max_leaf & 0xffff) + 1 : 0),
> @@ -299,6 +312,8 @@ void __init x86_cpu_policy_bound_max_lea
>           min_t(uint32_t, p->basic.max_leaf, ARRAY_SIZE(p->basic.raw) - 1=
);
>       p->feat.max_subleaf =3D
>           min_t(uint32_t, p->feat.max_subleaf, ARRAY_SIZE(p->feat.raw) - =
1);
> +    p->avx10.max_subleaf =3D
> +        min_t(uint32_t, p->avx10.max_subleaf, ARRAY_SIZE(p->avx10.raw) -=
 1);
>       p->extd.max_leaf =3D 0x80000000U | min_t(uint32_t, p->extd.max_leaf=
 & 0xffff,
>                                              ARRAY_SIZE(p->extd.raw) - 1)=
;
>   }
> @@ -326,6 +341,8 @@ void x86_cpu_policy_shrink_max_leaves(st
>        */
>       p->basic.raw[0xd] =3D p->xstate.raw[0];
>   
> +    p->basic.raw[0x24] =3D p->avx10.raw[0];
> +
>       for ( i =3D p->basic.max_leaf; i; --i )
>           if ( p->basic.raw[i].a | p->basic.raw[i].b |
>                p->basic.raw[i].c | p->basic.raw[i].d )
> --- a/xen/arch/x86/lib/cpu-policy/policy.c
> +++ b/xen/arch/x86/lib/cpu-policy/policy.c
> @@ -24,6 +24,10 @@ int x86_cpu_policies_are_compatible(cons
>       if ( guest->feat.max_subleaf > host->feat.max_subleaf )
>           FAIL_CPUID(7, 0);
>   
> +    if ( guest->avx10.version > host->avx10.version ||
> +         guest->avx10.max_subleaf > host->avx10.max_subleaf )
> +        FAIL_CPUID(0x24, 0);
> +
>       if ( guest->extd.max_leaf > host->extd.max_leaf )
>           FAIL_CPUID(0x80000000U, NA);
>   
> --- a/xen/include/public/arch-x86/cpufeatureset.h
> +++ b/xen/include/public/arch-x86/cpufeatureset.h
> @@ -366,6 +366,7 @@ XEN_CPUFEATURE(PREFETCHI,          15*32
>   XEN_CPUFEATURE(USER_MSR,           15*32+15) /*s  U{RD,WR}MSR Instructi=
ons */
>   XEN_CPUFEATURE(UIRET_UIF,          15*32+17) /*   UIRET updates UIF */
>   XEN_CPUFEATURE(CET_SSS,            15*32+18) /*   CET Supervisor Shadow=
 Stacks safe to use */
> +XEN_CPUFEATURE(AVX10,              15*32+19) /*   AVX10 Converged Vector=
 ISA */
>   XEN_CPUFEATURE(SLSM,               15*32+24) /*   Static Lockstep Mode =
*/
>   
>   /* Intel-defined CPU features, MSR_ARCH_CAPS 0x10a.eax, word 16 */
> --- a/xen/include/xen/lib/x86/cpu-policy.h
> +++ b/xen/include/xen/lib/x86/cpu-policy.h
> @@ -59,11 +59,12 @@ unsigned int x86_cpuid_lookup_vendor(uin
>    */
>   const char *x86_cpuid_vendor_to_str(unsigned int vendor);
>   
> -#define CPUID_GUEST_NR_BASIC      (0xdu + 1)
> +#define CPUID_GUEST_NR_BASIC      (0x24u + 1)
>   #define CPUID_GUEST_NR_CACHE      (5u + 1)
>   #define CPUID_GUEST_NR_FEAT       (2u + 1)
>   #define CPUID_GUEST_NR_TOPO       (1u + 1)
>   #define CPUID_GUEST_NR_XSTATE     (62u + 1)
> +#define CPUID_GUEST_NR_AVX10      (0u + 1)

Intel specification now defines AVX10.2 which has a additional leaf 
(even though the whole leaf is currently marked as "reserved").

>   #define CPUID_GUEST_NR_EXTD_INTEL (0x8u + 1)
>   #define CPUID_GUEST_NR_EXTD_AMD   (0x21u + 1)
>   #define CPUID_GUEST_NR_EXTD       MAX(CPUID_GUEST_NR_EXTD_INTEL, \
> @@ -264,6 +265,19 @@ struct cpu_policy
>           } comp[CPUID_GUEST_NR_XSTATE];
>       } xstate;
>   
> +    /* Structured AVX10 information leaf: 0x000000024[xx] */
> +    union {
> +        struct cpuid_leaf raw[CPUID_GUEST_NR_AVX10];
> +        struct {
> +            /* Subleaf 0. */
> +            uint32_t max_subleaf;
> +            uint32_t version:8, :8;
> +            bool vsz128:1, vsz256:1, vsz512:1;
> +            uint32_t :13;
> +            uint32_t /* c */:32, /* d */:32;
> +        };
> +    } avx10;
> +
>       /* Extended leaves: 0x800000xx */
>       union {
>           struct cpuid_leaf raw[CPUID_GUEST_NR_EXTD];
> --- a/xen/tools/gen-cpuid.py
> +++ b/xen/tools/gen-cpuid.py
> @@ -294,7 +294,7 @@ def crunch_numbers(state):
>           # enabled.  Certain later extensions, acting on 256-bit vectors=
 of
>           # integers, better depend on AVX2 than AVX.
>           AVX2: [AVX512F, VAES, VPCLMULQDQ, AVX_VNNI, AVX_IFMA, AVX_VNNI_=
INT8,
> -               AVX_VNNI_INT16, SHA512, SM4],
> +               AVX_VNNI_INT16, SHA512, SM4, AVX10],
>   

I think we can instead make AVX10 a dependency on AVX512. Especially since

 > Any processor that enumerates support for Intel AVX10 will also 
enumerate support for Intel AVX, Intel AVX2, and Intel AVX-512 (see 
Table 16-2).

with AVX-512 depending on AVX2.

>           # AVX512F is taken to mean hardware support for 512bit register=
s
>           # (which in practice depends on the EVEX prefix to encode) as w=
ell
> 
> 



--
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech



