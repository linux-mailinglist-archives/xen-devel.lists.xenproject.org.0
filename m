Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9086D265B23
	for <lists+xen-devel@lfdr.de>; Fri, 11 Sep 2020 10:08:20 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kGe6E-00055B-Jk; Fri, 11 Sep 2020 08:08:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KiK2=CU=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1kGe6C-000556-PY
 for xen-devel@lists.xenproject.org; Fri, 11 Sep 2020 08:08:00 +0000
X-Inumbo-ID: 940e103a-2aa3-442e-9721-1306f25f946d
Received: from mail-lf1-x142.google.com (unknown [2a00:1450:4864:20::142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 940e103a-2aa3-442e-9721-1306f25f946d;
 Fri, 11 Sep 2020 08:07:59 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id y17so5026883lfa.8
 for <xen-devel@lists.xenproject.org>; Fri, 11 Sep 2020 01:07:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=Q0q+RLbysvyvYAcldhgf90jhuxqXdmAL0GncwpyL33U=;
 b=tXMeWKYgxUvztURGtbilJNj/9k1Brm5sKo/c/wcx6/2E4q6s51FygnaF/StlBHz9j7
 Xt/fTjlLSfdKyqGVhqaZnLcpIWPummhko/YVktNDMQyYEoP3BJa9bBfR54uYpKJfSzDe
 jpSELDAuu5Y5Iu1lkLJSt3pWomjf6sbNUJeR1iwShn3GK+p44aQ3skh6uxgkKysC1VSh
 olY+arvcKEqDr/Toian9uFuP4r9OLxRoyo282cJwg2SFU1SRZDiNMS4+M2HPH//hUqFJ
 Eg7LrcJHNlaUKceItsXzaHmkHT8TRL9v8eW9/m0Odzp3sIzUP8Two45esQTOvln3PjUm
 ilHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=Q0q+RLbysvyvYAcldhgf90jhuxqXdmAL0GncwpyL33U=;
 b=gmGg58XeRTpK/+hkIutTBpfqmTcxX49oJFNBiLHfqiVCRcBvYbwF+q+EMHCaZdnxAx
 ymi61NF0Pc1Gj+hywbHEYf6T2TH9PluRSIkTmL6ojZaVZ4WTOkI59MasLxd+s2Y2TMA/
 Os1F+11qqSqjALaJnDzw8AUOMx7iEyJ2g39cZXBS3fm2fF6+K15j/WwndXj5JXhj2oST
 vGlV0mU+BxGG/+W2ZAhZJDTPPL+npAtt3MRUpDASB6UEGfDfWjPI9FcLPu/E+lxzOzoB
 zAl1zhSL2mQMNUUQx4DY2kv2nQU0KysvhOEbhQTh7G+9gx32XQMqwrv7uBQqwDaf8WLD
 OqEA==
X-Gm-Message-State: AOAM530ruwsGwOFlLrFRoZMpiJklIk6ANajdLUrBFLj0hnHYXAzVskYw
 r9cu4NozC+U1vmRfQctwR8M=
X-Google-Smtp-Source: ABdhPJzkWLPQy2L/ULrVkZPdn225IGyQ54uBXcWg/8HWDf1yEP3ckU+EH1Ybo3AE7IPIXXT0gFF0jQ==
X-Received: by 2002:a19:8446:: with SMTP id g67mr366252lfd.87.1599811678472;
 Fri, 11 Sep 2020 01:07:58 -0700 (PDT)
Received: from [192.168.1.6] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id m16sm391167ljb.67.2020.09.11.01.07.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Sep 2020 01:07:57 -0700 (PDT)
Subject: Re: [PATCH v6 4/8] iommu: make map and unmap take a page count,
 similar to flush
To: paul@xen.org, "'Durrant, Paul'" <pdurrant@amazon.co.uk>
Cc: 'Bertrand Marquis' <Bertrand.Marquis@arm.com>,
 "'open list:X86'" <xen-devel@lists.xenproject.org>,
 'Jan Beulich' <jbeulich@suse.com>,
 'Andrew Cooper' <andrew.cooper3@citrix.com>, 'Wei Liu' <wl@xen.org>,
 =?UTF-8?B?J1JvZ2VyIFBhdSBNb25uw6kn?= <roger.pau@citrix.com>,
 'George Dunlap' <george.dunlap@citrix.com>,
 'Ian Jackson' <ian.jackson@eu.citrix.com>, 'Julien Grall' <julien@xen.org>,
 'Stefano Stabellini' <sstabellini@kernel.org>,
 'Jun Nakajima' <jun.nakajima@intel.com>, 'Kevin Tian' <kevin.tian@intel.com>
References: <20200910145007.14107-1-paul@xen.org>
 <20200910145007.14107-5-paul@xen.org>
 <797DD1A2-60EB-455C-943D-C515881A69CC@arm.com>
 <C9ADFBE4-D7C7-43EC-9F33-D658548CE98D@arm.com>
 <88fc2079ec3f452db02fb4148b69240a@EX13D32EUC003.ant.amazon.com>
 <CAPD2p-nop-LF4-c9DDBaG6R1c7ZknPODdjsDeyg2opNN9KTQTQ@mail.gmail.com>
 <004801d68811$84894ae0$8d9be0a0$@xen.org>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <01d5986b-1b83-9c43-5c09-f7a331735903@gmail.com>
Date: Fri, 11 Sep 2020 11:07:56 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <004801d68811$84894ae0$8d9be0a0$@xen.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


On 11.09.20 10:59, Paul Durrant wrote:

Hi

> De-htmling...
>
> -----
> From: Oleksandr Tyshchenko <olekstysh@gmail.com>
> Sent: 10 September 2020 19:20
> To: Durrant, Paul <pdurrant@amazon.co.uk>
> Cc: Bertrand Marquis <Bertrand.Marquis@arm.com>; Paul Durrant <paul@xen.org>; open list:X86 <xen-devel@lists.xenproject.org>; Jan Beulich <jbeulich@suse.com>; Andrew Cooper <andrew.cooper3@citrix.com>; Wei Liu <wl@xen.org>; Roger Pau Monné <roger.pau@citrix.com>; George Dunlap <george.dunlap@citrix.com>; Ian Jackson <ian.jackson@eu.citrix.com>; Julien Grall <julien@xen.org>; Stefano Stabellini <sstabellini@kernel.org>; Jun Nakajima <jun.nakajima@intel.com>; Kevin Tian <kevin.tian@intel.com>
> Subject: Re: [PATCH v6 4/8] iommu: make map and unmap take a page count, similar to flush
>
>
>
> On Thu, Sep 10, 2020 at 8:49 PM Durrant, Paul <mailto:pdurrant@amazon.co.uk> wrote:
>
> Hi Paul
>
> [sorry for the possible format issue]
>
>> -----Original Message-----
>> From: Bertrand Marquis <mailto:Bertrand.Marquis@arm.com>
>> Sent: 10 September 2020 17:46
>> To: Paul Durrant <mailto:paul@xen.org>
>> Cc: open list:X86 <mailto:xen-devel@lists.xenproject.org>; Durrant, Paul <mailto:pdurrant@amazon.co.uk>; Jan Beulich
>> <mailto:jbeulich@suse.com>; Andrew Cooper <mailto:andrew.cooper3@citrix.com>; Wei Liu <mailto:wl@xen.org>; Roger Pau Monné
>> <mailto:roger.pau@citrix.com>; George Dunlap <mailto:george.dunlap@citrix.com>; Ian Jackson
>> <mailto:ian.jackson@eu.citrix.com>; Julien Grall <mailto:julien@xen.org>; Stefano Stabellini
>> <mailto:sstabellini@kernel.org>; Jun Nakajima <mailto:jun.nakajima@intel.com>; Kevin Tian <mailto:kevin.tian@intel.com>
>> Subject: RE: [EXTERNAL] [PATCH v6 4/8] iommu: make map and unmap take a page count, similar to flush
>>
>> CAUTION: This email originated from outside of the organization. Do not click links or open
>> attachments unless you can confirm the sender and know the content is safe.
>>
>>
>>
>>>> diff --git a/xen/include/xen/iommu.h b/xen/include/xen/iommu.h
>>>> index 1831dc66b0..13f68dc93d 100644
>>>> --- a/xen/include/xen/iommu.h
>>>> +++ b/xen/include/xen/iommu.h
>>>> @@ -146,23 +146,23 @@ enum
>>>> #define IOMMU_FLUSHF_modified (1u << _IOMMU_FLUSHF_modified)
>>>>
>>>> int __must_check iommu_map(struct domain *d, dfn_t dfn, mfn_t mfn,
>>>> -                           unsigned int page_order, unsigned int flags,
>>>> +                           unsigned long page_count, unsigned int flags,
>>>>                            unsigned int *flush_flags);
>>>> int __must_check iommu_unmap(struct domain *d, dfn_t dfn,
>>>> -                             unsigned int page_order,
>>>> +                             unsigned long page_count,
>>>>                              unsigned int *flush_flags);
>>>>
>>>> int __must_check iommu_legacy_map(struct domain *d, dfn_t dfn, mfn_t mfn,
>>>> -                                  unsigned int page_order,
>>>> +                                  unsigned long page_count,
>>>>                                   unsigned int flags);
>>>> int __must_check iommu_legacy_unmap(struct domain *d, dfn_t dfn,
>>>> -                                    unsigned int page_order);
>>>> +                                    unsigned long page_count);
>>>>
>>>> int __must_check iommu_lookup_page(struct domain *d, dfn_t dfn, mfn_t *mfn,
>>>>                                    unsigned int *flags);
>>>>
>>>> int __must_check iommu_iotlb_flush(struct domain *d, dfn_t dfn,
>>>> -                                   unsigned int page_count,
>>>> +                                   unsigned long page_count,
>>>>                                    unsigned int flush_flags);
>>>> int __must_check iommu_iotlb_flush_all(struct domain *d,
>>>>                                        unsigned int flush_flags);
>>>> @@ -281,7 +281,7 @@ struct iommu_ops {
>>>>     void (*share_p2m)(struct domain *d);
>>>>     void (*crash_shutdown)(void);
>>>>     int __must_check (*iotlb_flush)(struct domain *d, dfn_t dfn,
>>>> -                                    unsigned int page_count,
>>>> +                                    unsigned long page_count,
>>> This change will require to change the arm smmu code to have the right type for page count:
>>> xen/drivers/passthrough/smmu.c:2536
>>> static int __must_check arm_smmu_iotlb_flush(struct domain *d, dfn_t dfn,
>>>                          unsigned int page_count,
>>>                          unsigned int flush_flags)
>>>
>>> Otherwise compilation is failing for arm.
>>>
>>> With that fixed i could compile and start an arm system with the complete serie (but not one with an
>> arm SMMU).
>>
>> I should have specified because my test system right now does not have an SMMUv1.
>>
> Thanks for spotting that; I did run a cross compilation on arm a while ago so not sure how I managed to miss this. Will fix and send v7.
>
>
>   Probably ipmmu_iotlb_flush() in ipmmu-vmsa.c needs the same update as well (I don't have the possibility to apply your series and re-check)? Please note, it is still under CONFIG_EXPERT.
> -----
>
> Oh, that's new I guess?

Not so new, AFAIR it is in mainline since v4.13 or little bit earlier, 
but still under Tech Preview.


>   I'll go check.

Thank you.


-- 
Regards,

Oleksandr Tyshchenko


