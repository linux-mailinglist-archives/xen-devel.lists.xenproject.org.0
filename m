Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1272586E9AD
	for <lists+xen-devel@lfdr.de>; Fri,  1 Mar 2024 20:36:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.687781.1071568 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rg8eV-0003eH-PJ; Fri, 01 Mar 2024 19:34:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 687781.1071568; Fri, 01 Mar 2024 19:34:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rg8eV-0003ba-M9; Fri, 01 Mar 2024 19:34:39 +0000
Received: by outflank-mailman (input) for mailman id 687781;
 Fri, 01 Mar 2024 19:34:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jGsc=KH=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rg8eU-0003bU-Vh
 for xen-devel@lists.xenproject.org; Fri, 01 Mar 2024 19:34:38 +0000
Received: from mail-qk1-x733.google.com (mail-qk1-x733.google.com
 [2607:f8b0:4864:20::733])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bd3a91dd-d802-11ee-afd8-a90da7624cb6;
 Fri, 01 Mar 2024 20:34:37 +0100 (CET)
Received: by mail-qk1-x733.google.com with SMTP id
 af79cd13be357-787be5d999aso142997685a.1
 for <xen-devel@lists.xenproject.org>; Fri, 01 Mar 2024 11:34:37 -0800 (PST)
Received: from localhost ([213.195.118.74]) by smtp.gmail.com with ESMTPSA id
 pi36-20020a05620a37a400b00787c0e4ac78sm1906898qkn.106.2024.03.01.11.34.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Mar 2024 11:34:36 -0800 (PST)
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
X-Inumbo-ID: bd3a91dd-d802-11ee-afd8-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1709321676; x=1709926476; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fMQdHcvbxGC2jwRGC5Iz1SyyBLW84FARfW5oDCxczfY=;
        b=gjFxvRAmelwi4OrpzxUeCnRAnAnIkStMJPRukf+SfAQGk+6udO9D7QEtJfrnk65285
         sJBnsfwOT3cFObsHygS9MdvUAi9eIMHJeAz6hIFQC1Q4ZglqyrKSISgRdKENzB8LEYO+
         OKgqA7DVJU1I+JqJMTartI/pWlArkha4yTbrs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709321676; x=1709926476;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fMQdHcvbxGC2jwRGC5Iz1SyyBLW84FARfW5oDCxczfY=;
        b=dpwwErM5DTxbSF9parp+ZIU/7L+gYYYHagKSVwD9Fqbjjio5jnKWeTmdrcPMT704xD
         LpqSuZI2FYXfO3FQailtVKIqYaoK87LgxRHvO6zflMj62gOqV5MMFLSufnYmtEkRWhp9
         ePDSC8vnNYP9UQo2wVXzC3Y6l1orTEk+9YXIQHtADjVcm1YzzkD2dWQERgh6qR+vMCYA
         Otdkx2QAlWoXQINK5AjiZA6nQ9kfEIncQ7w937QzsPKF/tanU+HUCTfavGDyTew8ET88
         IFEpGgRJtvDMOwrUGUkAJ1VYEJSXR6L9J63Zpe8HNKMPRvVbQB5an68/3uRYN1c4jYOY
         9knQ==
X-Gm-Message-State: AOJu0YxYs4ud5Yn7ouZX80NzOTnP/m+CeTYkzzveEibsn7lDNW4/p00S
	yGDUcRduZBxhZ0sGkiLxHzN3cTs47BNiYQJINuDrnW4l8KnP9skGUdZGvPYev5ugNiOWDtX6tlN
	l
X-Google-Smtp-Source: AGHT+IE/h938XBq/f2KOxuRU75sgc+1ZZkRcni6fmcTP3VLnSd81CRRLViD8FTmYf6Y5yPFWiv4ypQ==
X-Received: by 2002:a05:620a:190f:b0:788:4ef:1182 with SMTP id bj15-20020a05620a190f00b0078804ef1182mr3778150qkb.50.1709321676682;
        Fri, 01 Mar 2024 11:34:36 -0800 (PST)
Date: Fri, 1 Mar 2024 20:34:34 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Jan Beulich <JBeulich@suse.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH] x86/cpu-policy: Allow for levelling of VERW side effects
Message-ID: <ZeItyorCCVHsL-M-@macbook>
References: <20240229181354.2560819-1-andrew.cooper3@citrix.com>
 <ZeHYCzDGAsbVmSLY@macbook>
 <4fedcd61-94e1-4869-b620-27c48e8dafef@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4fedcd61-94e1-4869-b620-27c48e8dafef@citrix.com>

On Fri, Mar 01, 2024 at 03:01:36PM +0000, Andrew Cooper wrote:
> On 01/03/2024 1:28 pm, Roger Pau Monné wrote:
> > On Thu, Feb 29, 2024 at 06:13:54PM +0000, Andrew Cooper wrote:
> >> MD_CLEAR and FB_CLEAR need OR-ing across a migrate pool.  Allow this, by
> >> having them unconditinally set in max, with the host values reflected in
> >> default.  Annotate the bits as having special properies.
> >>
> >> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> >> ---
> >> CC: Jan Beulich <JBeulich@suse.com>
> >> CC: Roger Pau Monné <roger.pau@citrix.com>
> >> CC: Wei Liu <wl@xen.org>
> >> ---
> >>  xen/arch/x86/cpu-policy.c                   | 24 +++++++++++++++++++++
> >>  xen/include/public/arch-x86/cpufeatureset.h |  4 ++--
> >>  2 files changed, 26 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/xen/arch/x86/cpu-policy.c b/xen/arch/x86/cpu-policy.c
> >> index f3ed2d3a3227..41123e6cf778 100644
> >> --- a/xen/arch/x86/cpu-policy.c
> >> +++ b/xen/arch/x86/cpu-policy.c
> >> @@ -442,6 +442,16 @@ static void __init guest_common_max_feature_adjustments(uint32_t *fs)
> >>          __set_bit(X86_FEATURE_RSBA, fs);
> >>          __set_bit(X86_FEATURE_RRSBA, fs);
> >>  
> >> +        /*
> >> +         * These bits indicate that the VERW instruction may have gained
> >> +         * scrubbing side effects.  With pooling, they mean "you might migrate
> >> +         * somewhere where scrubbing is necessary", and may need exposing on
> >> +         * unaffected hardware.  This is fine, because the VERW instruction
> >> +         * has been around since the 286.
> >> +         */
> >> +        __set_bit(X86_FEATURE_MD_CLEAR, fs);
> >> +        __set_bit(X86_FEATURE_FB_CLEAR, fs);
> >> +
> >>          /*
> >>           * The Gather Data Sampling microcode mitigation (August 2023) has an
> >>           * adverse performance impact on the CLWB instruction on SKX/CLX/CPX.
> >> @@ -476,6 +486,20 @@ static void __init guest_common_default_feature_adjustments(uint32_t *fs)
> >>               cpu_has_rdrand && !is_forced_cpu_cap(X86_FEATURE_RDRAND) )
> >>              __clear_bit(X86_FEATURE_RDRAND, fs);
> >>  
> >> +        /*
> >> +         * These bits indicate that the VERW instruction may have gained
> >> +         * scrubbing side effects.  The max policy has them set for migration
> >> +         * reasons, so reset the default policy back to the host values in
> >> +         * case we're unaffected.
> >> +         */
> >> +        fs[FEATURESET_7d0]   &= ~cpufeat_mask(X86_FEATURE_MD_CLEAR);
> >> +        fs[FEATURESET_m10Al] &= ~cpufeat_mask(X86_FEATURE_FB_CLEAR);
> >> +
> >> +        fs[FEATURESET_7d0]   |= (boot_cpu_data.x86_capability[FEATURESET_7d0] &
> >> +                                 cpufeat_mask(X86_FEATURE_MD_CLEAR));
> >> +        fs[FEATURESET_m10Al] |= (boot_cpu_data.x86_capability[FEATURESET_m10Al] &
> >> +                                 cpufeat_mask(X86_FEATURE_FB_CLEAR));
> > This seems quite convoluted, why not use:
> >
> > __clear_bit(X86_FEATURE_MD_CLEAR, fs);
> > if ( boot_cpu_has(X86_FEATURE_MD_CLEAR) )
> >     __set_bit(X86_FEATURE_MD_CLEAR, fs);
> >
> > And the same for FB_CLEAR. I think that's quite easier to read.
> 
> This better?
> 
> +        /*
> +         * These bits indicate that the VERW instruction may have gained
> +         * scrubbing side effects.  The max policy has them set for
> migration
> +         * reasons, so reset the default policy back to the host values in
> +         * case we're unaffected.
> +         */
> +        __clear_bit(X86_FEATURE_MD_CLEAR);
> +        if ( cpu_has_md_clear )
> +            __set_bit(X86_FEATURE_MD_CLEAR);
> +
> +        __clear_bit(X86_FEATURE_FB_CLEAR);
> +        if ( cpu_has_fb_clear )
> +            __set_bit(X86_FEATURE_FB_CLEAR);

Sure, with that please add my:

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

