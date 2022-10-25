Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FDD260CB5F
	for <lists+xen-devel@lfdr.de>; Tue, 25 Oct 2022 13:57:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.429800.681063 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1onIYo-00065F-4V; Tue, 25 Oct 2022 11:57:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 429800.681063; Tue, 25 Oct 2022 11:57:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1onIYo-000623-0v; Tue, 25 Oct 2022 11:57:34 +0000
Received: by outflank-mailman (input) for mailman id 429800;
 Tue, 25 Oct 2022 11:51:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=I61z=22=minervasys.tech=andrea.bastoni@srs-se1.protection.inumbo.net>)
 id 1onISs-0004pv-JK
 for xen-devel@lists.xenproject.org; Tue, 25 Oct 2022 11:51:26 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5a02fb96-545b-11ed-91b5-6bf2151ebd3b;
 Tue, 25 Oct 2022 13:51:24 +0200 (CEST)
Received: by mail-wm1-x32b.google.com with SMTP id t4so8101840wmj.5
 for <xen-devel@lists.xenproject.org>; Tue, 25 Oct 2022 04:51:24 -0700 (PDT)
Received: from [192.168.1.23] (ip5f5be846.dynamic.kabel-deutschland.de.
 [95.91.232.70]) by smtp.gmail.com with ESMTPSA id
 m10-20020adfe0ca000000b00236627c078esm2317579wri.110.2022.10.25.04.51.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Oct 2022 04:51:23 -0700 (PDT)
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
X-Inumbo-ID: 5a02fb96-545b-11ed-91b5-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minervasys-tech.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=u7krCdkWMVVSINdeV4hrDuqG0Kg4EO+RAA3Lmlinlcc=;
        b=hYp+babfx+MDhi9xD9OfcgSyZxOjxHzI4rI/O5JSqFbWwS4Iq8bQZkhaGbH7WCO9cx
         Pera2MtsgvxwLhapUrzoUIWfQvlmhuTggLkie1rikngWeDbGxhDgvA9uJTphaKJwdfDF
         VAyZsprPNwLMfDxIkooYEZVYDoFK23H7STRux3LBEWZX+bcwEXOaugEREL1OUYrXDfMw
         9MrENeutR7YZ1JeBg1pbqdkbw106nE8mpNrvnhG0xd5mpPgNXeBSdYRdoWWbN8ga3mEk
         /RoAoV93crO+Gay7dEpudqxZl4/jptbKm8fty8rvEMS7jra4wxLD494aHRGdMP9dQ59K
         07gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=u7krCdkWMVVSINdeV4hrDuqG0Kg4EO+RAA3Lmlinlcc=;
        b=y2lfV2LJ4ujlw081iVjo9HafHMIBrUMBzAPt7c1MpGEQ8v28UyB2BdyOjBbgbpcD20
         qCKXLEhzcpqRfHY9uCVoJE0N4zVf1c3n9smHoS/YEta4TpDFbHChEU3kyP4JVnn89JXi
         C15I6Xca6O6CeFL1W+a9eBN2eZfOYkeDieMsaQFNwrydO9j24teaQnRHF6mlUJPIuuFJ
         80Re3j+bcQEHm3vgNJauNqgDG6uU1vpGjC2+ihQ6KKKc+ruwt+QtbAB8WYXbxiT6XDYm
         XwpppEbZJcOfwPcBoJ8I5i0GkgTXmklMRpROtaWxEtoFObcna+WP0WXxj9RKvPxIq3TZ
         Toyg==
X-Gm-Message-State: ACrzQf2lKjnsqWxWyvdSAmwjd4q/cHhvUfEcbkteKzFCwvNZ8BaS8WhM
	Q1pDr7a2C4HmzbICXVB2gwplPQ==
X-Google-Smtp-Source: AMsMyM7CiJlgJg7nsS109AOYTmPj+En7IYeIcfSQ97yMGD1bMsoHr/ooRQ99Nr8GDGX6OCY2ihdm/w==
X-Received: by 2002:a05:600c:538a:b0:3c6:c223:7ec5 with SMTP id hg10-20020a05600c538a00b003c6c2237ec5mr26201757wmb.37.1666698684194;
        Tue, 25 Oct 2022 04:51:24 -0700 (PDT)
Message-ID: <e72b1fb4-3baa-63f4-fb65-bc4a33a60082@minervasys.tech>
Date: Tue, 25 Oct 2022 13:51:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH 02/12] xen/arm: add cache coloring initialization for
 domains
Content-Language: en-US
To: Julien Grall <julien@xen.org>, Carlo Nonato
 <carlo.nonato@minervasys.tech>, xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, george.dunlap@citrix.com, jbeulich@suse.com,
 stefano.stabellini@amd.com, wl@xen.org, marco.solieri@unimore.it,
 lucmiccio@gmail.com, Marco Solieri <marco.solieri@minervasys.tech>,
 Jan Kiszka <jan.kiszka@siemens.com>
References: <20220826125111.152261-1-carlo.nonato@minervasys.tech>
 <20220826125111.152261-3-carlo.nonato@minervasys.tech>
 <308a7afa-a3c9-b500-06c1-3d4cbe8bbf65@xen.org>
 <CAG+AhRUT75hkaLZi0v0E_ozzyUY9QLHYGTamhXAoKfV2gZMwfg@mail.gmail.com>
 <9a996e9d-d9ce-f562-122d-1e661d25614c@xen.org>
From: Andrea Bastoni <andrea.bastoni@minervasys.tech>
In-Reply-To: <9a996e9d-d9ce-f562-122d-1e661d25614c@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Julien,

On 25/10/2022 13:15, Julien Grall wrote:
> 
> 
> On 25/10/2022 11:53, Carlo Nonato wrote:
>> Hi Julien,
>>
>> On Fri, Oct 21, 2022 at 8:02 PM Julien Grall <julien@xen.org> wrote:
>>>
>>> Hi Carlo,
>>>
>>> On 26/08/2022 13:51, Carlo Nonato wrote:
>>>> This commit adds array pointers to domains as well as to the hypercall
>>>> and configuration structure employed in domain creation. The latter is used
>>>> both by the toolstack and by Xen itself to pass configuration data to the
>>>> domain creation function, so the XEN_GUEST_HANDLE macro must be adopted to be
>>>> able to access guest memory in the first case. This implies special care for
>>>> the copy of the configuration data into the domain data, meaning that a
>>>> discrimination variable for the two possible code paths (coming from Xen or
>>>> from the toolstack) is needed.
>>>
>>> So this means that a toolstack could set from_guest. I know the
>>> toolstack is trusted... However, we should try to limit when the trust
>>> when this is possible.
>>>
>>> In this case, I would consider to modify the prototype of
>>> domain_create() to pass internal information.
>>
>> Doing as you said isn't a bit too invasive? I should also change all the call
>> sites of domain_create() and this means x86 too.
> 
> Yes there will be a few calls to modify. But this is better than hacking the 
> hypercall interface to cater for internal use.
> 
>> Isn't there an easier way to spot a guest address? Maybe just looking at the
>> address value... 
> 
> HVM/Arm guest have a separate address space. So it is not possible to 
> differentiate between guest vs hypervisor address.
> 
>> Or maybe adding an internal flag to the do_domctl() path.
> IIUC, this flag would indicate whether the XEN_GUEST_HANDLE() is an hypervisor 
> or guest address. Is that correct?
> 
> If so, I dislike it. I am not sure what the other maintainers think, but 
> personally updating domain_create() is my preferred way.
> 
> [...]
> 
>>>>    void arch_domain_shutdown(struct domain *d)
>>>> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
>>>> index 3fd1186b53..4d4cb692fc 100644
>>>> --- a/xen/arch/arm/domain_build.c
>>>> +++ b/xen/arch/arm/domain_build.c
>>>> @@ -33,6 +33,12 @@
>>>>    #include <xen/grant_table.h>
>>>>    #include <xen/serial.h>
>>>>
>>>> +#ifdef CONFIG_CACHE_COLORING
>>>> +#define XEN_DOM0_CREATE_FLAGS CDF_privileged
>>>> +#else
>>>> +#define XEN_DOM0_CREATE_FLAGS CDF_privileged | CDF_directmap
>>>> +#endif
>>>
>>> I can't remember if I asked it before and it doesn't seem to written
>>> everywhere. This check suggest that it is not possible to use the same
>>> Xen binary for coloring and non-coloring.
>>
>> If coloring is enabled, all the domains are colored (even if they use
>> zero colors
>> because of the default selection). This means that they are going to use
>> the colored allocator. Since this all-or-nothing design, if coloring is
>> enabled, dom0 is assumed to be colored, which implies removing the directmap
>> flag. So if what you mean with "same Xen binary for coloring and non-coloring"
>> is to have a way to select at runtime if a domain is colored, or if Xen
>> itself is colored, the answer is no, we don't have this right now.
> 
> [...]
> 
>>
>>> At the moment, we have been able to have all the features in the same
>>> Xen binary. So what are the reasons for this restriction?
>>
>> Not sure about the first sentence (you mean, until this patch?),
> 
> Yes.
> 
>> but the
>> restriction is just because it's simpler. For example if we have to support
>> colored and non-colored domains at the same time,
> 
> I am not asking for supporting a mix of colored and non-colored domains. What I 
> am asking is to have a runtime switch (rather than compile time) to decide 
> whether the system is colored or not.
> 
> IOW, why can't system-wide coloring be selected at runtime?
> 
>> we probably need to
>> change something in the allocator (at least reserving more memory for the
>> buddy).
> 
> This sentence picked my interesting. How do you decide the size of the buddy today?
> 
> [...]
> 
>>>> +#ifdef CONFIG_CACHE_COLORING
>>>> +    unsigned int *colors;
>>>> +    unsigned int num_colors;
>>>> +#endif >
>>>>        /* Virtual MMU */
>>>>        struct p2m_domain p2m;
>>>> diff --git a/xen/include/public/arch-arm.h b/xen/include/public/arch-arm.h
>>>> index c8b6058d3a..adf843a7a1 100644
>>>> --- a/xen/include/public/arch-arm.h
>>>> +++ b/xen/include/public/arch-arm.h
>>>> @@ -314,6 +314,8 @@ DEFINE_XEN_GUEST_HANDLE(vcpu_guest_context_t);
>>>>    #define XEN_DOMCTL_CONFIG_TEE_NONE      0
>>>>    #define XEN_DOMCTL_CONFIG_TEE_OPTEE     1
>>>>
>>>> +__DEFINE_XEN_GUEST_HANDLE(color_t, unsigned int);
>>>
>>> You don't seem to use "color_t" outside of arch-arm.h and we already
>>> define guest handle for "unsigned int". So can they be used?
>>
>> That's because the guest handle for "unsigned int" is defined later
>> (in public/xen.h).
> 
> Hmmm... And I guess we can't define "unsigned int" earlier because they rely on 
> macro defined in arch-arm.h?
> 
>> We can also think of moving the coloring fields from this
>> struct to the common one (xen_domctl_createdomain) protecting them with
>> the proper #ifdef (but we are targeting only arm64...).
> 
> Your code is targeting arm64 but fundamentally this is an arm64 specific 
> feature. IOW, this could be used in the future on other arch. So I think it 
> would make sense to define it in common without the #ifdef.

As additional information on this point, we had in the past some discussion in 
the context of cache-coloring and Jailhouse (+CC Jan):

https://groups.google.com/g/jailhouse-dev/c/K4rqZxpxa0U/m/lsvy5HXcAAAJ

x86 has CAT and RDT, and supporting software coloring was not in scope for 
Jailhouse. The discussion was more on perspective support for RISC-V.

Best,

> @x86 maintainers, what do you think?
> 
>>
>>>> +
>>>>    struct xen_arch_domainconfig {
>>>>        /* IN/OUT */
>>>>        uint8_t gic_version;
>>>> @@ -335,6 +337,12 @@ struct xen_arch_domainconfig {
>>>>         *
>>>>         */
>>>>        uint32_t clock_frequency;
>>>> +    /* IN */
>>>> +    uint8_t from_guest;
>>>
>>> There is an implicit padding here and ...
>>>> +    /* IN */
>>>> +    uint16_t num_colors;
>>>
>>> ... here. For the ABI, we are trying to have all the padding explicit.
>>> So the layout of the structure is clear.
>>
>> Isn't it true also for other fields like gic_version and tee_type?
> 
> Indeed, there is missing explicit padding after gic_version. There is no padding 
> necessary after 'tee_type'.
> 
> I am not asking you to fix the existing missing padding, however we should avoid 
> to introduce new ones.
> 
> Cheers,
> 
-- 
Thanks,
Andrea Bastoni


