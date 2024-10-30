Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 440799B6A70
	for <lists+xen-devel@lfdr.de>; Wed, 30 Oct 2024 18:12:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.828364.1243221 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t6CDr-0000oX-7z; Wed, 30 Oct 2024 17:11:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 828364.1243221; Wed, 30 Oct 2024 17:11:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t6CDr-0000la-4P; Wed, 30 Oct 2024 17:11:07 +0000
Received: by outflank-mailman (input) for mailman id 828364;
 Wed, 30 Oct 2024 17:11:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rOPv=R2=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1t6CDp-0000lU-7N
 for xen-devel@lists.xenproject.org; Wed, 30 Oct 2024 17:11:05 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id eff1a335-96e1-11ef-99a3-01e77a169b0f;
 Wed, 30 Oct 2024 18:11:01 +0100 (CET)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-a9a2209bd7fso1503366b.2
 for <xen-devel@lists.xenproject.org>; Wed, 30 Oct 2024 10:11:01 -0700 (PDT)
Received: from localhost ([213.195.115.182]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9b1f05deb6sm583328466b.88.2024.10.30.10.10.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Oct 2024 10:11:00 -0700 (PDT)
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
X-Inumbo-ID: eff1a335-96e1-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo2MjkiLCJoZWxvIjoibWFpbC1lajEteDYyOS5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImVmZjFhMzM1LTk2ZTEtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMwMzA4MjYxLjA4NzQ4Niwic2VuZGVyIjoicm9nZXIucGF1QGNsb3VkLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1730308260; x=1730913060; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=W7685/wE7ff7H8WooBHVpshC3WHfBsT7eWfyNzjUyPc=;
        b=MwS68bTYyJc7IxZL6alg5QQZKDf4UB2QyArkfdVGQNbLfaf0OoHao0Q5ZK/m7IHl/t
         bWyRAxn3mKIao73mUSArkGm+DPVqXI2W+7kTRan/1PEuNpu6Z9ASyZY9QYvdAiGXgH69
         snZU4AVv3HEkyK2CEEITT77gPswW/Z78gU6ss=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730308260; x=1730913060;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=W7685/wE7ff7H8WooBHVpshC3WHfBsT7eWfyNzjUyPc=;
        b=pZfy53RFx9XR5hxjDQ4TVprmAIx00XLQ+s0/4k+NIGSMQez5evO1SQoe7xgYK7/5oO
         DfOmIHhGKidWcHD3sOgIAordax1BwytRdJAMybu0ArRg7dF63YzfZxqHBkhgDBIh3dXc
         qQAv6SBWGAZ/gUurAX3nmvo9WB4rtlTX5HnHpFnWMUHhoWc5h2QcpdiL5vei6ErIAGI0
         FNNj+CoGg8akYV3Qvo4VTkQK6Wc4NRWEIMY8Ihhk9Ol8Dum6qkaSkqoXMmu+9kOSNhap
         YQWiZ4NdpAk4YKyH5wYMMBQIETBVIRlWr/aUkFzvM9Poh5vxx4fQhamHfbhgVnRAQiRj
         G0Cg==
X-Gm-Message-State: AOJu0YxW7DGHxhCjmK03mvR6SfifybFkX0xV0RO3P6goGK8+ajbhhTrc
	92x/E4ptKORR3aUHzIHqWsENygHctP0TEGbYVYPI+C+kCpq7zC4O6awTgRP+nF9SiKK9qSx/rvQ
	D
X-Google-Smtp-Source: AGHT+IGCIzuq1pFQVP55pT0Q9ZqpVDJdZgwbzQUXpfOI0Bw+ixw3kN6R9CDRAAIm5CwIpAx2gV2KIQ==
X-Received: by 2002:a17:907:9454:b0:a9a:6b4c:a331 with SMTP id a640c23a62f3a-a9de619e3f6mr1341904166b.54.1730308260399;
        Wed, 30 Oct 2024 10:11:00 -0700 (PDT)
Date: Wed, 30 Oct 2024 18:10:59 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Jan Beulich <JBeulich@suse.com>,
	Alejandro Vallejo <alejandro.vallejo@cloud.com>
Subject: Re: [PATCH] x86/cpu-policy: Extend the guest max policy max
 leaf/subleaves
Message-ID: <ZyJoowmf5_ast4X3@macbook>
References: <20241029175505.2698661-1-andrew.cooper3@citrix.com>
 <ZyH1az6sb2wnVxgu@macbook>
 <f6494fa2-6de0-4ded-864a-9c011d9ad5f2@citrix.com>
 <ZyISitvz_K_XtvL5@macbook>
 <3effac8c-b4cf-4d96-a5f6-99def9f7ec1c@citrix.com>
 <ZyJM_DLUkqolD7mD@macbook>
 <e4d75dee-3cf6-4fc1-9277-ea16ed9e0319@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e4d75dee-3cf6-4fc1-9277-ea16ed9e0319@citrix.com>

On Wed, Oct 30, 2024 at 04:51:34PM +0000, Andrew Cooper wrote:
> On 30/10/2024 3:13 pm, Roger Pau Monné wrote:
> > On Wed, Oct 30, 2024 at 02:45:19PM +0000, Andrew Cooper wrote:
> >> On 30/10/2024 11:03 am, Roger Pau Monné wrote:
> >>> On Wed, Oct 30, 2024 at 10:39:12AM +0000, Andrew Cooper wrote:
> >>>> On 30/10/2024 8:59 am, Roger Pau Monné wrote:
> >>>>> On Tue, Oct 29, 2024 at 05:55:05PM +0000, Andrew Cooper wrote:
> >>>>>> diff --git a/xen/arch/x86/cpu-policy.c b/xen/arch/x86/cpu-policy.c
> >>>>>> index b6d9fad56773..78bc9872b09a 100644
> >>>>>> --- a/xen/arch/x86/cpu-policy.c
> >>>>>> +++ b/xen/arch/x86/cpu-policy.c
> >>>>>> @@ -391,6 +391,27 @@ static void __init calculate_host_policy(void)
> >>>>>>      p->platform_info.cpuid_faulting = cpu_has_cpuid_faulting;
> >>>>>>  }
> >>>>>>  
> >>>>>> +/*
> >>>>>> + * Guest max policies can have any max leaf/subleaf within bounds.
> >>>>>> + *
> >>>>>> + * - Some incoming VMs have a larger-than-necessary feat max_subleaf.
> >>>>>> + * - Some VMs we'd like to synthesise leaves not present on the host.
> >>>>>> + */
> >>>>>> +static void __init guest_common_max_leaves(struct cpu_policy *p)
> >>>>>> +{
> >>>>>> +    p->basic.max_leaf       = ARRAY_SIZE(p->basic.raw) - 1;
> >>>>>> +    p->feat.max_subleaf     = ARRAY_SIZE(p->feat.raw) - 1;
> >>>>>> +    p->extd.max_leaf        = 0x80000000U + ARRAY_SIZE(p->extd.raw) - 1;
> >>>>>> +}
> >>>>>> +
> >>>>>> +/* Guest default policies inherit the host max leaf/subleaf settings. */
> >>>>>> +static void __init guest_common_default_leaves(struct cpu_policy *p)
> >>>>>> +{
> >>>>>> +    p->basic.max_leaf       = host_cpu_policy.basic.max_leaf;
> >>>>>> +    p->feat.max_subleaf     = host_cpu_policy.feat.max_subleaf;
> >>>>>> +    p->extd.max_leaf        = host_cpu_policy.extd.max_leaf;
> >>>>>> +}
> >>>>> I think this what I'm going to ask is future work.  After the
> >>>>> modifications done to the host policy by max functions
> >>>>> (calculate_{hvm,pv}_max_policy()) won't the max {sub,}leaf adjustments
> >>>>> better be done taking into account the contents of the policy, rather
> >>>>> than capping to the host values?
> >>>>>
> >>>>> (note this comment is strictly for guest_common_default_leaves(), the
> >>>>> max version is fine using ARRAY_SIZE).
> >>>> I'm afraid I don't follow.
> >>>>
> >>>> calculate_{pv,hvm}_max_policy() don't modify the host policy.
> >>> Hm, I don't think I've expressed myself clearly, sorry.  Let me try
> >>> again.
> >>>
> >>> calculate_{hvm,pv}_max_policy() extends the host policy by possibly
> >>> setting new features, and such extended policy is then used as the
> >>> base for the PV/HVM default policies.
> >>>
> >>> Won't the resulting policy in calculate_{hvm,pv}_def_policy() risks
> >>> having bits set past the max {sub,}leaf in the host policy, as it's
> >>> based in {hvm,pv}_def_cpu_policy that might have such bits set?
> >> Oh, right.
> >>
> >> This patch doesn't change anything WRT that.
> > Indeed, didn't intend my comment to block it, just that I think at
> > some point the logic in guest_common_default_leaves() will need to be
> > expanded.
> >
> >> But I think you're right that we do risk getting into that case (in
> >> principle at least) because of how guest_common_*_feature_adjustment() work.
> >>
> >> Furthermore, the bug will typically get hidden because we serialise
> >> based on the max_leaf/subleaf, and will discard feature words outside of
> >> the max_leaf/subleaf bounds.
> > Yes, once we serialize it for toolstack consumption the leafs will be
> > implicitly zeroed.
> >
> >> I suppose we probably want a variation of x86_cpu_featureset_to_policy()
> >> which extends the max_leaf/subleaf based on non-zero values in leaves. 
> >> (This already feels like it's going to be an ugly algorithm.)
> > Hm, I was thinking that we would need to adjust
> > guest_common_default_leaves() to properly shrink the max {sub,}leaf
> > fields from the max policies.
> 
> Hmm.  What we'd do is have default inherit max's ARRAY_SIZES(), then do
> all the existing logic, then as the final step, shrink the default
> policies, vaguely per Jan's plan.
> 
> i.e. we'd end up deleting guest_common_default_leaves()
> 
> That way we don't need to encode any knowledge of which feature bit
> means what WRT max_leaf/subleaf.

What about Alejandro's concern about runtime populated {sub,}leafs,
won't we risk shrinking too much if the last leaf intended to be kept
happens to be a fully runtime populated one?

Do we need some kind of special magic for fully run-time populated
leafs (like the topology ones IIRC?) in order to account for them when
doing those max calculations?

Thanks, Roger.

