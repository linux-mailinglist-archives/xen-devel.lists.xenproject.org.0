Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 38C7D9B60F8
	for <lists+xen-devel@lfdr.de>; Wed, 30 Oct 2024 12:04:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.828077.1242899 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t66UK-0007SF-9M; Wed, 30 Oct 2024 11:03:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 828077.1242899; Wed, 30 Oct 2024 11:03:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t66UK-0007P5-6f; Wed, 30 Oct 2024 11:03:44 +0000
Received: by outflank-mailman (input) for mailman id 828077;
 Wed, 30 Oct 2024 11:03:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rOPv=R2=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1t66UI-0007Ow-L7
 for xen-devel@lists.xenproject.org; Wed, 30 Oct 2024 11:03:42 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9e53a34a-96ae-11ef-a0c3-8be0dac302b0;
 Wed, 30 Oct 2024 12:03:39 +0100 (CET)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-a9a0c40849cso1063623666b.3
 for <xen-devel@lists.xenproject.org>; Wed, 30 Oct 2024 04:03:39 -0700 (PDT)
Received: from localhost ([213.195.115.182]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9b1f0679bdsm556937766b.91.2024.10.30.04.03.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Oct 2024 04:03:38 -0700 (PDT)
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
X-Inumbo-ID: 9e53a34a-96ae-11ef-a0c3-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo2MjkiLCJoZWxvIjoibWFpbC1lajEteDYyOS5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjllNTNhMzRhLTk2YWUtMTFlZi1hMGMzLThiZTBkYWMzMDJiMCIsInRzIjoxNzMwMjg2MjE5LjgxNzA0Miwic2VuZGVyIjoicm9nZXIucGF1QGNsb3VkLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1730286219; x=1730891019; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MnDB8ZQEYc36yz3rtDIZyC1c9g61W2OKUWC5eAMGLNU=;
        b=gkVC0s1RYlRf+FtykkFr0Px572of+lxGiBo/+oFg3s1F1d7yb5sRs8VT8vIt+/CVJC
         3YjTZ4l8McOJgVV8wQ6aBJDlaC5/wewZnNKvZgg5uE1zyFDGPhR/BcUoVREYaEuGwfK5
         5xkD3WGpMaKrWI75Zq03ZyCm4l5iXDNDNEfRs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730286219; x=1730891019;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MnDB8ZQEYc36yz3rtDIZyC1c9g61W2OKUWC5eAMGLNU=;
        b=kfYtcIBjoQ+QIDKgZfI94BHQXe5pWY+eSCpIohWeHnqPcyjySMkKi7Zw0s0uxYPbnx
         brN4Gz7VbKZckgcWb9s9JHUV3FuZXwUofxtcGxgOBZsZeR5TctN8uKiIIrbcHpnnqMCA
         tDu8o4T++vQ3AShKHqATPgbrZuwxWsDWCxW5130hhiPfUNLKRZpMk5T2bRh1n0ydajgh
         7IioDHtNLKpoNuWXO0T6KsMRljB1teXIcppbRgAJD3d/S4fcN4e10RGciQ8jCHG8zZng
         KugaayzucwT6k+2fkj9f4NJ7EeKqF0QbOoRJKxbMGBKo+xc2bGnxpr1mk81OHsB3dlZ8
         e4mg==
X-Gm-Message-State: AOJu0YzfxA4NFgaKPdqF1DbdfEeO0ubwI0PGFVkbOz3VnBCUAI86UITJ
	wBNEsUS4e25ksurZkQfP/HRLZB/MLYUyx4y5ZWQbUy/ccioTl88wguIWl5Ox5yM=
X-Google-Smtp-Source: AGHT+IHlKz7rDMIf1YsMdKaWW8HPEbjAcxN5ttO59ROjH9myEzlNYErmnQPk8BUhogB+NwUhXXKJ1Q==
X-Received: by 2002:a17:907:970e:b0:a9a:2a56:91e with SMTP id a640c23a62f3a-a9e3a574f2cmr255399066b.6.1730286219224;
        Wed, 30 Oct 2024 04:03:39 -0700 (PDT)
Date: Wed, 30 Oct 2024 12:03:38 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Jan Beulich <JBeulich@suse.com>,
	Alejandro Vallejo <alejandro.vallejo@cloud.com>
Subject: Re: [PATCH] x86/cpu-policy: Extend the guest max policy max
 leaf/subleaves
Message-ID: <ZyISitvz_K_XtvL5@macbook>
References: <20241029175505.2698661-1-andrew.cooper3@citrix.com>
 <ZyH1az6sb2wnVxgu@macbook>
 <f6494fa2-6de0-4ded-864a-9c011d9ad5f2@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f6494fa2-6de0-4ded-864a-9c011d9ad5f2@citrix.com>

On Wed, Oct 30, 2024 at 10:39:12AM +0000, Andrew Cooper wrote:
> On 30/10/2024 8:59 am, Roger Pau Monné wrote:
> > On Tue, Oct 29, 2024 at 05:55:05PM +0000, Andrew Cooper wrote:
> >> diff --git a/xen/arch/x86/cpu-policy.c b/xen/arch/x86/cpu-policy.c
> >> index b6d9fad56773..78bc9872b09a 100644
> >> --- a/xen/arch/x86/cpu-policy.c
> >> +++ b/xen/arch/x86/cpu-policy.c
> >> @@ -391,6 +391,27 @@ static void __init calculate_host_policy(void)
> >>      p->platform_info.cpuid_faulting = cpu_has_cpuid_faulting;
> >>  }
> >>  
> >> +/*
> >> + * Guest max policies can have any max leaf/subleaf within bounds.
> >> + *
> >> + * - Some incoming VMs have a larger-than-necessary feat max_subleaf.
> >> + * - Some VMs we'd like to synthesise leaves not present on the host.
> >> + */
> >> +static void __init guest_common_max_leaves(struct cpu_policy *p)
> >> +{
> >> +    p->basic.max_leaf       = ARRAY_SIZE(p->basic.raw) - 1;
> >> +    p->feat.max_subleaf     = ARRAY_SIZE(p->feat.raw) - 1;
> >> +    p->extd.max_leaf        = 0x80000000U + ARRAY_SIZE(p->extd.raw) - 1;
> >> +}
> >> +
> >> +/* Guest default policies inherit the host max leaf/subleaf settings. */
> >> +static void __init guest_common_default_leaves(struct cpu_policy *p)
> >> +{
> >> +    p->basic.max_leaf       = host_cpu_policy.basic.max_leaf;
> >> +    p->feat.max_subleaf     = host_cpu_policy.feat.max_subleaf;
> >> +    p->extd.max_leaf        = host_cpu_policy.extd.max_leaf;
> >> +}
> > I think this what I'm going to ask is future work.  After the
> > modifications done to the host policy by max functions
> > (calculate_{hvm,pv}_max_policy()) won't the max {sub,}leaf adjustments
> > better be done taking into account the contents of the policy, rather
> > than capping to the host values?
> >
> > (note this comment is strictly for guest_common_default_leaves(), the
> > max version is fine using ARRAY_SIZE).
> 
> I'm afraid I don't follow.
> 
> calculate_{pv,hvm}_max_policy() don't modify the host policy.

Hm, I don't think I've expressed myself clearly, sorry.  Let me try
again.

calculate_{hvm,pv}_max_policy() extends the host policy by possibly
setting new features, and such extended policy is then used as the
base for the PV/HVM default policies.

Won't the resulting policy in calculate_{hvm,pv}_def_policy() risks
having bits set past the max {sub,}leaf in the host policy, as it's
based in {hvm,pv}_def_cpu_policy that might have such bits set?

Thanks, Roger.

