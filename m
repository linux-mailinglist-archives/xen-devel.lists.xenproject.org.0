Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B493C9B6932
	for <lists+xen-devel@lfdr.de>; Wed, 30 Oct 2024 17:31:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.828335.1243190 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t6Baf-0002ql-J3; Wed, 30 Oct 2024 16:30:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 828335.1243190; Wed, 30 Oct 2024 16:30:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t6Baf-0002nw-GF; Wed, 30 Oct 2024 16:30:37 +0000
Received: by outflank-mailman (input) for mailman id 828335;
 Wed, 30 Oct 2024 16:30:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rOPv=R2=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1t6Bad-0002nq-ND
 for xen-devel@lists.xenproject.org; Wed, 30 Oct 2024 16:30:35 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 47dfbcb1-96dc-11ef-a0c3-8be0dac302b0;
 Wed, 30 Oct 2024 17:30:32 +0100 (CET)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-a99ebb390a5so206023066b.1
 for <xen-devel@lists.xenproject.org>; Wed, 30 Oct 2024 09:30:32 -0700 (PDT)
Received: from localhost ([213.195.115.182]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9b3a07f804sm581381166b.188.2024.10.30.09.30.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Oct 2024 09:30:30 -0700 (PDT)
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
X-Inumbo-ID: 47dfbcb1-96dc-11ef-a0c3-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo2MzIiLCJoZWxvIjoibWFpbC1lajEteDYzMi5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjQ3ZGZiY2IxLTk2ZGMtMTFlZi1hMGMzLThiZTBkYWMzMDJiMCIsInRzIjoxNzMwMzA1ODMyLjA2NTI4Miwic2VuZGVyIjoicm9nZXIucGF1QGNsb3VkLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1730305831; x=1730910631; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2PUkZIdOinA7Whpj0V0Ve+QM+yNTkP+c5sGRcWHa3O4=;
        b=J6YwYJCXwiUEXs3iRsGpAQiqkhwGstkL+bzqyVF0lJIgiPInJRJnI2yagC2ieYjPjO
         tBZ7KR4nvzv7vc1GweJ6H0FTfXcKpBMZ+29MdbNUadSdhwYH9RaBSSvTNgaqHaAsZjpT
         PRVPmIQhgT86ii1CaL3OSSy1Ylbohp5/u2CMs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730305831; x=1730910631;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2PUkZIdOinA7Whpj0V0Ve+QM+yNTkP+c5sGRcWHa3O4=;
        b=UwqtiRvu0+bzzIQCRJ7ViZPkkV151atIsQ2zddUXpH+EMfIW/pt5BbI2TtCmhbPF7i
         s7NkVDYarlHU4a/i94vMrNhx/96Sf0ENO1oFwPUZUP27fBQ5uVIzSbKWf0rIYn4dU3rC
         /b7oG3F+fTLih0lVciWOhMUu5jLbjOshgCX/UHuKk1U7+Klz86tbMO2RqmDsg9sg40bB
         54JscMqRTs45+XAYrfMZiqGe6jiN1Nvk98DABTjEjmUutiQP9pJUQyEIvrMqk9bXTAl5
         J0XlZfWZtxKuZSzE4be3gh0aan8VoXEutU6a1pcrIfVLIDK41/pSe3wo/FyzGB97jdYC
         jKBA==
X-Forwarded-Encrypted: i=1; AJvYcCWmnN7rm28tP9LbXFWlAWG9yEvraXPjcjfSrwMNmMXSaA5UfUkwtGRP57xr6XNv+CljUfz1RTegzIU=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw7bbfXyBbgJyPqGoH3zwpsmZLQULccdyKjHWDlDbIfTEfuZFAh
	oEi+Ru5a1BJd/uigXWGk1NFe3UwyIRRc5iFub4vLwa4zDVcTsKWDSESRNpIwVDg=
X-Google-Smtp-Source: AGHT+IFWuoR7rs+V9qpDusYF3YcVnJJXj6m4HCK+/XyeFC0N695oCy7sraqbd+g2/QIgxkK9jEsX4Q==
X-Received: by 2002:a17:907:3f19:b0:a9a:babb:b916 with SMTP id a640c23a62f3a-a9e2b5a151bmr703249166b.15.1730305830877;
        Wed, 30 Oct 2024 09:30:30 -0700 (PDT)
Date: Wed, 30 Oct 2024 17:30:28 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Xen-devel <xen-devel@lists.xenproject.org>,
	Jan Beulich <JBeulich@suse.com>
Subject: Re: [PATCH] x86/cpu-policy: Extend the guest max policy max
 leaf/subleaves
Message-ID: <ZyJfJD-kxq_lwB7Z@macbook>
References: <20241029175505.2698661-1-andrew.cooper3@citrix.com>
 <ZyH1az6sb2wnVxgu@macbook>
 <f6494fa2-6de0-4ded-864a-9c011d9ad5f2@citrix.com>
 <ZyISitvz_K_XtvL5@macbook>
 <3effac8c-b4cf-4d96-a5f6-99def9f7ec1c@citrix.com>
 <ZyJM_DLUkqolD7mD@macbook>
 <D599K64G9G59.3CGHQABTLBI4B@cloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <D599K64G9G59.3CGHQABTLBI4B@cloud.com>

On Wed, Oct 30, 2024 at 03:59:12PM +0000, Alejandro Vallejo wrote:
> On Wed Oct 30, 2024 at 3:13 PM GMT, Roger Pau Monné wrote:
> > On Wed, Oct 30, 2024 at 02:45:19PM +0000, Andrew Cooper wrote:
> > > On 30/10/2024 11:03 am, Roger Pau Monné wrote:
> > > > On Wed, Oct 30, 2024 at 10:39:12AM +0000, Andrew Cooper wrote:
> > > >> On 30/10/2024 8:59 am, Roger Pau Monné wrote:
> > > >>> On Tue, Oct 29, 2024 at 05:55:05PM +0000, Andrew Cooper wrote:
> > > >>>> diff --git a/xen/arch/x86/cpu-policy.c b/xen/arch/x86/cpu-policy.c
> > > >>>> index b6d9fad56773..78bc9872b09a 100644
> > > >>>> --- a/xen/arch/x86/cpu-policy.c
> > > >>>> +++ b/xen/arch/x86/cpu-policy.c
> > > >>>> @@ -391,6 +391,27 @@ static void __init calculate_host_policy(void)
> > > >>>>      p->platform_info.cpuid_faulting = cpu_has_cpuid_faulting;
> > > >>>>  }
> > > >>>>  
> > > >>>> +/*
> > > >>>> + * Guest max policies can have any max leaf/subleaf within bounds.
> > > >>>> + *
> > > >>>> + * - Some incoming VMs have a larger-than-necessary feat max_subleaf.
> > > >>>> + * - Some VMs we'd like to synthesise leaves not present on the host.
> > > >>>> + */
> > > >>>> +static void __init guest_common_max_leaves(struct cpu_policy *p)
> > > >>>> +{
> > > >>>> +    p->basic.max_leaf       = ARRAY_SIZE(p->basic.raw) - 1;
> > > >>>> +    p->feat.max_subleaf     = ARRAY_SIZE(p->feat.raw) - 1;
> > > >>>> +    p->extd.max_leaf        = 0x80000000U + ARRAY_SIZE(p->extd.raw) - 1;
> > > >>>> +}
> > > >>>> +
> > > >>>> +/* Guest default policies inherit the host max leaf/subleaf settings. */
> > > >>>> +static void __init guest_common_default_leaves(struct cpu_policy *p)
> > > >>>> +{
> > > >>>> +    p->basic.max_leaf       = host_cpu_policy.basic.max_leaf;
> > > >>>> +    p->feat.max_subleaf     = host_cpu_policy.feat.max_subleaf;
> > > >>>> +    p->extd.max_leaf        = host_cpu_policy.extd.max_leaf;
> > > >>>> +}
> > > >>> I think this what I'm going to ask is future work.  After the
> > > >>> modifications done to the host policy by max functions
> > > >>> (calculate_{hvm,pv}_max_policy()) won't the max {sub,}leaf adjustments
> > > >>> better be done taking into account the contents of the policy, rather
> > > >>> than capping to the host values?
> > > >>>
> > > >>> (note this comment is strictly for guest_common_default_leaves(), the
> > > >>> max version is fine using ARRAY_SIZE).
> > > >> I'm afraid I don't follow.
> > > >>
> > > >> calculate_{pv,hvm}_max_policy() don't modify the host policy.
> > > > Hm, I don't think I've expressed myself clearly, sorry.  Let me try
> > > > again.
> > > >
> > > > calculate_{hvm,pv}_max_policy() extends the host policy by possibly
> > > > setting new features, and such extended policy is then used as the
> > > > base for the PV/HVM default policies.
> > > >
> > > > Won't the resulting policy in calculate_{hvm,pv}_def_policy() risks
> > > > having bits set past the max {sub,}leaf in the host policy, as it's
> > > > based in {hvm,pv}_def_cpu_policy that might have such bits set?
> > > 
> > > Oh, right.
> > > 
> > > This patch doesn't change anything WRT that.
> >
> > Indeed, didn't intend my comment to block it, just that I think at
> > some point the logic in guest_common_default_leaves() will need to be
> > expanded.
> >
> > > But I think you're right that we do risk getting into that case (in
> > > principle at least) because of how guest_common_*_feature_adjustment() work.
> > > 
> > > Furthermore, the bug will typically get hidden because we serialise
> > > based on the max_leaf/subleaf, and will discard feature words outside of
> > > the max_leaf/subleaf bounds.
> >
> > Yes, once we serialize it for toolstack consumption the leafs will be
> > implicitly zeroed.
> >
> > > I suppose we probably want a variation of x86_cpu_featureset_to_policy()
> > > which extends the max_leaf/subleaf based on non-zero values in leaves. 
> > > (This already feels like it's going to be an ugly algorithm.)
> >
> > Hm, I was thinking that we would need to adjust
> > guest_common_default_leaves() to properly shrink the max {sub,}leaf
> > fields from the max policies.
> 
> That would be tricky in case we end up with subleafs that are strictly
> populated at runtime.

Maybe we need a way to expose {sub,}leaf minimum value requirements in
the gen-cpuid.py logic, so we can tie minimum required {sub,}leaf
values to features?

I would like to think that those run-time populated leafs will be tied
to features, as to have a way to account for them.

> Xen would have no way of knowing whether that's meant to
> be implemented or not. It seems safer to raise the max if we find a non-zero
> leaves higher than the current max.

Raising might be better, TBH I didn't give the exact solution much
though.  But we need to be aware that setting it to the host value is
likely something we should look into fixing, otherwise subtle bugs
might occur.

Maybe add a comment to guest_common_default_leaves() in that regard?

Thanks, Roger.

