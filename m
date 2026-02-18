Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CAFEK+jOlWnjUwIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 18 Feb 2026 15:38:32 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CA4E157198
	for <lists+xen-devel@lfdr.de>; Wed, 18 Feb 2026 15:38:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1235639.1538566 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vsih5-0005FC-43; Wed, 18 Feb 2026 14:38:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1235639.1538566; Wed, 18 Feb 2026 14:38:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vsih5-0005Dj-1A; Wed, 18 Feb 2026 14:38:23 +0000
Received: by outflank-mailman (input) for mailman id 1235639;
 Wed, 18 Feb 2026 14:38:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LUrD=AW=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vsih4-0005Dd-BF
 for xen-devel@lists.xenproject.org; Wed, 18 Feb 2026 14:38:22 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 78935b69-0cd7-11f1-b164-2bf370ae4941;
 Wed, 18 Feb 2026 15:38:20 +0100 (CET)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-48336a6e932so33093645e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 18 Feb 2026 06:38:20 -0800 (PST)
Received: from [192.168.1.6] (user-109-243-67-101.play-internet.pl.
 [109.243.67.101]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483970d447fsm38675575e9.0.2026.02.18.06.38.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Feb 2026 06:38:19 -0800 (PST)
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
X-Inumbo-ID: 78935b69-0cd7-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771425500; x=1772030300; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VFEph0G2gYZCHP73LMQnpBs2z3gvoeoNFlALiuQUeeo=;
        b=QQmeZKOa0lfR2LywVSLG/Xxr4ap+aawYUUM35yr8UW0+A76Wq+KfK5ps61vvLd+Q3q
         N0Xxy1rYMekOVj4BkB5qlVoyfVasiV0W+63R++j3MdUo1pCq631LAgT2RA4zAVSKH7OU
         6jHx8l+nyreLETSShVDTCwmY62xoAZuWCPXMDq6Oz5wcjhbgqyRnw4HTaQyO2EhLKlrL
         /qxf9GS3WS6Vq2+QWkGYL7DdWdGInnDpyJr5IQ7ml4WbNDZwhT9dvLdsaUoTt/aygp1a
         4gkziFRTqDAOqXhBCSnXCMJfLykmlg0LY+OfGZKSJVpmQ14o2IcEhWCooEH555AiNX0P
         9fOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771425500; x=1772030300;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VFEph0G2gYZCHP73LMQnpBs2z3gvoeoNFlALiuQUeeo=;
        b=r9EIGOuMmhYMVjR931VZCZ00aAiMWMhgfeJcM8ct2VdmePtQPYn/SycTNLelWcp9kf
         P0x/Px84tgB9joJx/l6bQNKLMMOiX9MziOn5THexdpVw7bpEGyb3HKiIeVOIWGlW+XVA
         fU9GedFh+zGtjXhLWIgkL0+mPN/tA2E92CYFpljiuOlUa3+RNorDEOjx9cCZONWaZKKS
         TSd78Wk/Vd35ai1nNtLRqUAPQ4wYia12mRFMO+58AUy6RQ3cyiaydGHfwiP1voYKMe7+
         DZ4+EPQDi1g25aGY2qq48YMdkq7DtYAj1Xx70obDxqJ77ooi5o19h7J6TZopgzl2aZ+4
         79og==
X-Forwarded-Encrypted: i=1; AJvYcCVdXRJAcccyb3eQLK50MZfYJG+dzDoEClc2+vm8uy2mOU5wmE99JQyWgYx1JjSxlryhsGbo+/XCgm0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzpX/KRZcegL9oI9PpF2pWE3ActGR25L6QA7TsetLDpPtbSzkmZ
	ltrp37wW1y43z8SImid8UrPCEDjPt7xdORxN3Ut5i+r7ZcEddbtZ5IA3
X-Gm-Gg: AZuq6aK0Bmub7S9dBl0QnBnOmX1tfveOlFU2VnXopsJ9vbfRT3TMVi5KhoXMV8WHyLw
	uU8Wyg7XqLrEDGwc8ibhfS2ZBv52Qz1OwQlqnoxr0TikuoPDSNHL6K7DMkiIzMOkEn82joNIFpV
	R5nD+lGgqxvAvA0sltjOYvO/vXkfpPj0jx7HYB/2iQ50kKz4jjKbKtgpIwmF10xXRRCniQk38wT
	kpNmy514XiZFW7VM658JPIAbVyymrYVo76xdQcq1VOjSnWZlUIK4RgRWA2jjkiLAmLVPcKlF8VE
	2yk6C/V9R6gHdwyw2Sw09WnOn/RT0qYKSU21nORGt2ZR96k7+B5Anf9Ub562P72/yZzEJFZcdg/
	IcaEXfQnQ7c+rJB1vAoQAikYrh4FbwtL54LG8XygVctAEq01K1D0Yj8Sk1v5VAmzsCfp7fov63W
	FK16oqdmQhuysbITJe0sF1siJO0yMxHZb0sJkbJxuGjepvx+mwKSBgLLbqErli/PzHbJy7Dwd+4
	xg=
X-Received: by 2002:a05:600c:698c:b0:477:5ad9:6df1 with SMTP id 5b1f17b1804b1-48379b932b7mr271436095e9.3.1771425499982;
        Wed, 18 Feb 2026 06:38:19 -0800 (PST)
Message-ID: <ab0b7dcf-c607-43d3-bb1c-f782c3a71332@gmail.com>
Date: Wed, 18 Feb 2026 15:38:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 5/6] xen: move domain_use_host_layout() to common
 header
To: Jan Beulich <jbeulich@suse.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>
References: <cover.1770821989.git.oleksii.kurochko@gmail.com>
 <678eb53c56bc4f6147feb0bbb6c1319197d0f0df.1770821989.git.oleksii.kurochko@gmail.com>
 <522a71ce-05da-4a66-956e-5581f0c49e0e@suse.com>
 <alpine.DEB.2.22.394.2602161038120.359097@ubuntu-linux-20-04-desktop>
 <d9feffe4-c45e-4bed-bc5e-776e4547578a@suse.com>
 <5eb4ba3b-f7b6-4cfb-ab67-60198c3f8572@gmail.com>
 <0c0061ab-acdb-4ceb-92e2-ca4e591ee741@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <0c0061ab-acdb-4ceb-92e2-ca4e591ee741@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:Romain.Caritey@microchip.com,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,m:sstabellini@kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,bootlin.com:url];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 1CA4E157198
X-Rspamd-Action: no action


On 2/18/26 2:12 PM, Jan Beulich wrote:
> On 18.02.2026 13:58, Oleksii Kurochko wrote:
>> On 2/17/26 8:34 AM, Jan Beulich wrote:
>>> On 16.02.2026 19:42, Stefano Stabellini wrote:
>>>> On Mon, 16 Feb 2026, Jan Beulich wrote:
>>>>> On 12.02.2026 17:21, Oleksii Kurochko wrote:
>>>>>> domain_use_host_layout() is generic enough to be moved to the
>>>>>> common header xen/domain.h.
>>>>> Maybe, but then something DT-specific, not xen/domain.h. Specifically, ...
>>>>>
>>>>>> --- a/xen/include/xen/domain.h
>>>>>> +++ b/xen/include/xen/domain.h
>>>>>> @@ -62,6 +62,22 @@ void domid_free(domid_t domid);
>>>>>>    #define is_domain_direct_mapped(d) ((d)->cdf & CDF_directmap)
>>>>>>    #define is_domain_using_staticmem(d) ((d)->cdf & CDF_staticmem)
>>>>>>    
>>>>>> +/*
>>>>>> + * Is the domain using the host memory layout?
>>>>>> + *
>>>>>> + * Direct-mapped domain will always have the RAM mapped with GFN == MFN.
>>>>>> + * To avoid any trouble finding space, it is easier to force using the
>>>>>> + * host memory layout.
>>>>>> + *
>>>>>> + * The hardware domain will use the host layout regardless of
>>>>>> + * direct-mapped because some OS may rely on a specific address ranges
>>>>>> + * for the devices.
>>>>>> + */
>>>>>> +#ifndef domain_use_host_layout
>>>>>> +# define domain_use_host_layout(d) (is_domain_direct_mapped(d) || \
>>>>>> +                                    is_hardware_domain(d))
>>>>> ... is_domain_direct_mapped() isn't something that I'd like to see further
>>>>> proliferate in common (non-DT) code.
>>>> Hi Jan, we have a requirement for 1:1 mapped Dom0 (I should say hardware
>>>> domain) on x86 as well. In fact, we already have a working prototype,
>>>> although it is not suitable for upstream yet.
>>>>
>>>> In addition to the PSP use case that we discussed a few months ago,
>>>> where the PSP is not behind an IOMMU and therefore exchanged addresses
>>>> must be 1:1 mapped, we also have a new use case. We are running the full
>>>> Xen-based automotive stack on an Azure instance where SVM (vmentry and
>>>> vmexit) is available, but an IOMMU is not present. All virtual machines
>>>> are configured as PVH.
>>> Hmm. Then adjustments need making, for commentary and macro to be correct
>>> on x86. First and foremost none of what is there is true for PV.
>> As is_domain_direct_mapped() returns always false for x86, so
>> domain_use_host_layout macro will return incorrect value for non-hardware
>> domains (dom0?). And as PV domains are not auto_translated domains so are
>> always direct-mapped, so technically is_domain_direct_mapped() (or
>> domain_use_host_layout()) should return true in such case.
> Hmm? PV domains aren't direct-mapped. Direct-map was introduced by Arm for
> some special purpose (absence of IOMMU iirc).

I made such conclusion because of the comments in the code mentioned below:
  - https://elixir.bootlin.com/xen/v4.21.0/source/tools/libs/guest/xg_dom_x86.c#L1880
  - https://elixir.bootlin.com/xen/v4.21.0/source/xen/include/public/features.h#L107

Also, in the comment where it is introduced (d66bf122c0a "xen: introduce XENFEAT_direct_mapped and XENFEAT_not_direct_mapped")
is mentioned that:
   XENFEAT_direct_mapped is always set for not auto-translated guests.

>
>> (I assume it is also true for every domain except HVM according to the comment
>> /* HVM guests are translated.  PV guests are not. */ in xc_dom_translated and
>> the comment above definition of XENFEAT_direct_mapped: /* ...not auto_translated
>> domains (x86 only) are always direct-mapped*/).
>>
>> Is my understanding correct?
>>
>> Then isn't that a problem of how is_domain_direct_mapped() is defined
>> for x86? Shouldn't it be defined like:
>>     #define is_domain_direct_mapped(d) (!paging_mode_translate(d) || ((d)->cdf & CDF_directmap))
>>
>> Would it be better to move "!paging_mode_translate(d) || " to the definition
>> of domain_use_host_layout()?
>>
>> Could you please explain what is wrong with the comment? Probably, except:
>>     * To avoid any trouble finding space, it is easier to force using the
>>     * host memory layout.
>> everything else should be true for x86.
> "The hardware domain will use ..." isn't true for PV Dom0.

And then just pure is_hardware_domain(d) inside macros isn't correct too, right?
So it should be (... || (!is_pv_domain(d) && is_hardware_domain(d)))

~ Oleksii


