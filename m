Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D380B3FB9EB
	for <lists+xen-devel@lfdr.de>; Mon, 30 Aug 2021 18:14:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.175196.319245 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mKjvj-0006PU-QM; Mon, 30 Aug 2021 16:14:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 175196.319245; Mon, 30 Aug 2021 16:14:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mKjvj-0006NC-NF; Mon, 30 Aug 2021 16:14:39 +0000
Received: by outflank-mailman (input) for mailman id 175196;
 Mon, 30 Aug 2021 16:14:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Nzk9=NV=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1mKjvi-0006N6-Dd
 for xen-devel@lists.xenproject.org; Mon, 30 Aug 2021 16:14:38 +0000
Received: from mail-lj1-x229.google.com (unknown [2a00:1450:4864:20::229])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 57465d24-3867-4e13-83b1-babfebdb5f38;
 Mon, 30 Aug 2021 16:14:37 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id f2so26889841ljn.1
 for <xen-devel@lists.xenproject.org>; Mon, 30 Aug 2021 09:14:37 -0700 (PDT)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id e24sm1431549lfs.212.2021.08.30.09.14.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Aug 2021 09:14:35 -0700 (PDT)
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
X-Inumbo-ID: 57465d24-3867-4e13-83b1-babfebdb5f38
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=R2ct2esXV6R7RIMbBAcf4V8v15YVg4kbeBebvMA4nHY=;
        b=iRDUZFvnGrPvguw0UEPb9zhIvSIRFZTPGPBkHyvl3HFYdLya2zFkjrtHii27UvEQ2n
         lsebYqexpHy2Z39FoTclq1CRP1NiCNUCQFei45KFhAyQxs47tq8cJjKQGJVu9tn9Usf2
         IktdzzZBZmVpGYTXbRpvhvBZTQW1NYpvTMKfShmoYkpTQGurrgnA4ITHcOeJhZ35qdxs
         nypdvKbpAgMYk/OxttMY+56ER68/kSqnXlIrhZfSANReIRazdL+VdFFl63tNNMMQ5RMc
         /0SJsMNdEHs/zprCG1J1lVZ4pwVpZPx/rTv7LaDFnHhEheF+Od2lJka/z1kk13YZaPoT
         ANAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=R2ct2esXV6R7RIMbBAcf4V8v15YVg4kbeBebvMA4nHY=;
        b=bVWwKW9ZrLkvA2qU8aaT+OLOc81S66He+p1BVK7afgNOG5WSlLTuRFSuyVvkPo1zgY
         wQy6BODduSNDeK/de7rL3XFSg7UHgwiSrWyWvJhoEyTB6/q4Axfn/9zc7Q3mOL087gdX
         ndOoq4o8WaWwGRhvO8hq0mdQRlcvCob7NJCR08ATK4B/HP4hm8616Ok967+TDmHyYDVM
         CYa7/dGzR8eYUPLv/cIrFhVEV3SCOxDIxMnGUf1HDHklDxLRqQXFH4lY8mayT3Qbpkde
         /e79HLme84QKuTlaJCvIVSZD5vPFcTDsZhf9DvUYo46Ug+za36KLHHUeqfrFGEp91Zig
         6fzw==
X-Gm-Message-State: AOAM532BWS/S5n+Pt8+oS69bTurks91GqftGTVq6pwPeCoJsT47yKmWq
	Rm3GldlFnuIoMQa659ombZ0d+ipdQYY=
X-Google-Smtp-Source: ABdhPJzpLsCkj80WBFG2OJG4L8Fd1oXJUSQjLXEfKba9d8eNOs+cuLLIbS878DPirtnETSt+zSaz1w==
X-Received: by 2002:a2e:8014:: with SMTP id j20mr21175648ljg.228.1630340075674;
        Mon, 30 Aug 2021 09:14:35 -0700 (PDT)
Subject: Re: [RFC PATCH] xen: Introduce arch specific field to
 XEN_SYSCTL_physinfo
To: Jan Beulich <jbeulich@suse.com>
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Juergen Gross
 <jgross@suse.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <1628897304-20793-1-git-send-email-olekstysh@gmail.com>
 <908e2d59-41f0-3bad-6030-b2889d9c5cc2@suse.com>
 <8c622f4f-1931-3e2c-4f6e-9b832e8e435e@gmail.com>
 <cdfe8217-3d7a-cc56-2a61-bfea02a348cf@suse.com>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <77bd9473-c7e4-51a9-c66d-7dd4d62c0368@gmail.com>
Date: Mon, 30 Aug 2021 19:14:34 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <cdfe8217-3d7a-cc56-2a61-bfea02a348cf@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 30.08.21 16:16, Jan Beulich wrote:

Hi Jan

> On 29.08.2021 22:28, Oleksandr wrote:
>> On 16.08.21 10:33, Jan Beulich wrote:
>>> On 14.08.2021 01:28, Oleksandr Tyshchenko wrote:
>>>> --- a/xen/include/public/arch-arm.h
>>>> +++ b/xen/include/public/arch-arm.h
>>>> @@ -332,6 +332,11 @@ struct xen_arch_domainconfig {
>>>>         */
>>>>        uint32_t clock_frequency;
>>>>    };
>>>> +
>>>> +struct arch_physinfo {
>>>> +    /* Holds the bit size of IPAs in p2m tables. */
>>>> +    uint32_t p2m_ipa_bits;
>>>> +};
>>>>    #endif /* __XEN__ || __XEN_TOOLS__ */
>>>>    
>>>>    struct arch_vcpu_info {
>>>> --- a/xen/include/public/arch-x86/xen.h
>>>> +++ b/xen/include/public/arch-x86/xen.h
>>>> @@ -346,6 +346,8 @@ typedef struct xen_msr_entry {
>>>>    } xen_msr_entry_t;
>>>>    DEFINE_XEN_GUEST_HANDLE(xen_msr_entry_t);
>>>>    
>>>> +struct arch_physinfo {
>>>> +};
>>>>    #endif /* !__ASSEMBLY__ */
>>> While the term "p2m_ipa_bits" surely isn't arch-agnostic, I wonder
>>> whether the expressed information is (the x86 equivalent being
>>> hap_paddr_bits, at a guess), and hence whether this really ought
>>> to live in an arch-specific sub-struct.
>> Well, on Arm we calculate the number of the IPA bits based on the number
>> of PA bits when setting Stage 2 address translation.
>> I might mistake, but what we currently have on Arm is "ipa_bits ==
>> pa_bits". So, this means that information we need at the toolstack side
>> isn't really arch-specific and
>> we could probably avoid introducing arch-specific sub-struct by suitable
>> renaming the field (pa_bits, paddr_bits, whatever).
>>
>> We could even name the field as hap_paddr_bits. Although, I don't know
>> whether the hap_* is purely x86-ism, but I see there are several
>> mentions in the common code (hap_pt_share, use_hap_pt, etc). Any
>> suggestions?
> Well, HAP or not - there is going to be a limit to a guest's
> address bits. So I don't see why it would matter whether HAP is
> an x86-specific term.

agree


>   If you wanted to express the guest nature
> and distinguish it from "paddr_bits", how about "gaddr_bits" or
> "gpaddr_bits"?

ok, both sound fine to me, with a little preference for gpaddr_bits. So, 
will drop arch-specific sub-struct for the next version.

Thank you.


>
> Jan
>
-- 
Regards,

Oleksandr Tyshchenko


