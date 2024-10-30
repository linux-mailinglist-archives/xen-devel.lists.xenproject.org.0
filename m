Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 491409B6710
	for <lists+xen-devel@lfdr.de>; Wed, 30 Oct 2024 16:13:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.828295.1243170 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t6ANg-0008Dt-Uo; Wed, 30 Oct 2024 15:13:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 828295.1243170; Wed, 30 Oct 2024 15:13:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t6ANg-0008As-RV; Wed, 30 Oct 2024 15:13:08 +0000
Received: by outflank-mailman (input) for mailman id 828295;
 Wed, 30 Oct 2024 15:13:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rOPv=R2=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1t6ANf-0008Am-IN
 for xen-devel@lists.xenproject.org; Wed, 30 Oct 2024 15:13:07 +0000
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [2a00:1450:4864:20::536])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 75756673-96d1-11ef-a0c3-8be0dac302b0;
 Wed, 30 Oct 2024 16:13:03 +0100 (CET)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-5c9428152c0so7895624a12.1
 for <xen-devel@lists.xenproject.org>; Wed, 30 Oct 2024 08:13:03 -0700 (PDT)
Received: from localhost ([213.195.115.182]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5cbb62c9e60sm5097824a12.57.2024.10.30.08.13.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Oct 2024 08:13:02 -0700 (PDT)
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
X-Inumbo-ID: 75756673-96d1-11ef-a0c3-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo1MzYiLCJoZWxvIjoibWFpbC1lZDEteDUzNi5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6Ijc1NzU2NjczLTk2ZDEtMTFlZi1hMGMzLThiZTBkYWMzMDJiMCIsInRzIjoxNzMwMzAxMTgzLjY2NzgwMSwic2VuZGVyIjoicm9nZXIucGF1QGNsb3VkLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1730301183; x=1730905983; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VV5Hqfa2BU8MV42PML0suguD/3iV++TqZvLhao7mF9M=;
        b=CAdqs0ijiYnQRGMQGnkkZZ003IfmWdlUzSfBJ2olhTe8W0bnGV3uKa3DG2F6wzz+RN
         p7vdJKFR3aeqvTUvZI/bW7pDoPAIV/5qKHsvG6PcE36+D7Ptf0GCh3A7KH6rKb/lxPYm
         0/waFRv/kgWqXgEOa9wb+doEEUrYI0WLxPs/w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730301183; x=1730905983;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VV5Hqfa2BU8MV42PML0suguD/3iV++TqZvLhao7mF9M=;
        b=puPHf3FLMj+W9xgUamx62AlrO4kEhfLMP0Sd6spMwJ8JOpGpTOufbVNkIWiVRj4j0P
         I3EBGteghscplHbS0VNWqtEdIlkAbG4zA9jMwmO0LvM2WDdUhXiOHsUcNYIug107Df7h
         lmE/LB69R4qksXjFqMSzIGOGgsQaP4c+Zwd2KpNc7DDr++lFVz4cPTA73512Shg0n0hz
         oIwXl3A1IFJsruUfWUrZMcJVQffGQO1R7yCkK7yz34h5NhqnrBbiWsIAquomOMroRWKK
         pGqS/oNuqusTbG13adqBArZg8E2UUdTITIb5PlPsJi/FOB0LOh8kRc7Zd/ZzRO3DZM0r
         5wpA==
X-Gm-Message-State: AOJu0Yz1MmBJb+AJHgsF+oEneEekqYV7j5zOO/4yhnVdzR36WbnbXDqK
	dn2Dmzdqc9yfkL9r9YL68gfwC2g0wPy9bqVu1p7f5C8m/vQKvhnSm02LLIumgQk=
X-Google-Smtp-Source: AGHT+IFT+mdONLG87tyd1oYijy2z4n5YLMt34KgcINFPM6hNVxh6d43TgxLfzY37CztkuElpwtKc6g==
X-Received: by 2002:a05:6402:26ca:b0:5cb:b80a:2283 with SMTP id 4fb4d7f45d1cf-5cbbf949eadmr13152774a12.26.1730301182869;
        Wed, 30 Oct 2024 08:13:02 -0700 (PDT)
Date: Wed, 30 Oct 2024 16:13:00 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Jan Beulich <JBeulich@suse.com>,
	Alejandro Vallejo <alejandro.vallejo@cloud.com>
Subject: Re: [PATCH] x86/cpu-policy: Extend the guest max policy max
 leaf/subleaves
Message-ID: <ZyJM_DLUkqolD7mD@macbook>
References: <20241029175505.2698661-1-andrew.cooper3@citrix.com>
 <ZyH1az6sb2wnVxgu@macbook>
 <f6494fa2-6de0-4ded-864a-9c011d9ad5f2@citrix.com>
 <ZyISitvz_K_XtvL5@macbook>
 <3effac8c-b4cf-4d96-a5f6-99def9f7ec1c@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3effac8c-b4cf-4d96-a5f6-99def9f7ec1c@citrix.com>

On Wed, Oct 30, 2024 at 02:45:19PM +0000, Andrew Cooper wrote:
> On 30/10/2024 11:03 am, Roger Pau Monné wrote:
> > On Wed, Oct 30, 2024 at 10:39:12AM +0000, Andrew Cooper wrote:
> >> On 30/10/2024 8:59 am, Roger Pau Monné wrote:
> >>> On Tue, Oct 29, 2024 at 05:55:05PM +0000, Andrew Cooper wrote:
> >>>> diff --git a/xen/arch/x86/cpu-policy.c b/xen/arch/x86/cpu-policy.c
> >>>> index b6d9fad56773..78bc9872b09a 100644
> >>>> --- a/xen/arch/x86/cpu-policy.c
> >>>> +++ b/xen/arch/x86/cpu-policy.c
> >>>> @@ -391,6 +391,27 @@ static void __init calculate_host_policy(void)
> >>>>      p->platform_info.cpuid_faulting = cpu_has_cpuid_faulting;
> >>>>  }
> >>>>  
> >>>> +/*
> >>>> + * Guest max policies can have any max leaf/subleaf within bounds.
> >>>> + *
> >>>> + * - Some incoming VMs have a larger-than-necessary feat max_subleaf.
> >>>> + * - Some VMs we'd like to synthesise leaves not present on the host.
> >>>> + */
> >>>> +static void __init guest_common_max_leaves(struct cpu_policy *p)
> >>>> +{
> >>>> +    p->basic.max_leaf       = ARRAY_SIZE(p->basic.raw) - 1;
> >>>> +    p->feat.max_subleaf     = ARRAY_SIZE(p->feat.raw) - 1;
> >>>> +    p->extd.max_leaf        = 0x80000000U + ARRAY_SIZE(p->extd.raw) - 1;
> >>>> +}
> >>>> +
> >>>> +/* Guest default policies inherit the host max leaf/subleaf settings. */
> >>>> +static void __init guest_common_default_leaves(struct cpu_policy *p)
> >>>> +{
> >>>> +    p->basic.max_leaf       = host_cpu_policy.basic.max_leaf;
> >>>> +    p->feat.max_subleaf     = host_cpu_policy.feat.max_subleaf;
> >>>> +    p->extd.max_leaf        = host_cpu_policy.extd.max_leaf;
> >>>> +}
> >>> I think this what I'm going to ask is future work.  After the
> >>> modifications done to the host policy by max functions
> >>> (calculate_{hvm,pv}_max_policy()) won't the max {sub,}leaf adjustments
> >>> better be done taking into account the contents of the policy, rather
> >>> than capping to the host values?
> >>>
> >>> (note this comment is strictly for guest_common_default_leaves(), the
> >>> max version is fine using ARRAY_SIZE).
> >> I'm afraid I don't follow.
> >>
> >> calculate_{pv,hvm}_max_policy() don't modify the host policy.
> > Hm, I don't think I've expressed myself clearly, sorry.  Let me try
> > again.
> >
> > calculate_{hvm,pv}_max_policy() extends the host policy by possibly
> > setting new features, and such extended policy is then used as the
> > base for the PV/HVM default policies.
> >
> > Won't the resulting policy in calculate_{hvm,pv}_def_policy() risks
> > having bits set past the max {sub,}leaf in the host policy, as it's
> > based in {hvm,pv}_def_cpu_policy that might have such bits set?
> 
> Oh, right.
> 
> This patch doesn't change anything WRT that.

Indeed, didn't intend my comment to block it, just that I think at
some point the logic in guest_common_default_leaves() will need to be
expanded.

> But I think you're right that we do risk getting into that case (in
> principle at least) because of how guest_common_*_feature_adjustment() work.
> 
> Furthermore, the bug will typically get hidden because we serialise
> based on the max_leaf/subleaf, and will discard feature words outside of
> the max_leaf/subleaf bounds.

Yes, once we serialize it for toolstack consumption the leafs will be
implicitly zeroed.

> I suppose we probably want a variation of x86_cpu_featureset_to_policy()
> which extends the max_leaf/subleaf based on non-zero values in leaves. 
> (This already feels like it's going to be an ugly algorithm.)

Hm, I was thinking that we would need to adjust
guest_common_default_leaves() to properly shrink the max {sub,}leaf
fields from the max policies.

Thanks, Roger.

