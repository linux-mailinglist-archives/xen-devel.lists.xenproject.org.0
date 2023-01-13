Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 87503669810
	for <lists+xen-devel@lfdr.de>; Fri, 13 Jan 2023 14:08:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.477311.739964 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pGJmt-0007Vq-Jp; Fri, 13 Jan 2023 13:08:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 477311.739964; Fri, 13 Jan 2023 13:08:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pGJmt-0007SX-Go; Fri, 13 Jan 2023 13:08:03 +0000
Received: by outflank-mailman (input) for mailman id 477311;
 Fri, 13 Jan 2023 13:08:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3K7w=5K=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1pGJmr-0007SR-Qe
 for xen-devel@lists.xenproject.org; Fri, 13 Jan 2023 13:08:01 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4d9d7d52-9343-11ed-b8d0-410ff93cb8f0;
 Fri, 13 Jan 2023 14:07:59 +0100 (CET)
Received: by mail-ej1-x62f.google.com with SMTP id hw16so40350568ejc.10
 for <xen-devel@lists.xenproject.org>; Fri, 13 Jan 2023 05:07:59 -0800 (PST)
Received: from [192.168.1.93] (adsl-67.109.242.138.tellas.gr. [109.242.138.67])
 by smtp.gmail.com with ESMTPSA id
 wl21-20020a170907311500b0084d37cc06fesm7394568ejb.94.2023.01.13.05.07.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Jan 2023 05:07:58 -0800 (PST)
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
X-Inumbo-ID: 4d9d7d52-9343-11ed-b8d0-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VuxQZ7FgmOJvvrVC6Ru26nnBHcxEDI0Y+X12Abvxeng=;
        b=orgSNKVdnxz+JDTWjBIXHdCPuIhTmaGUeEK7NQhj2IRomba1ByatSWzO4GeEO8uPRa
         W8zZuJ279gOlistsbhUqt3C4rmcRrKVXZsj2+MBRL0VFQSMVBeN6lQZ9Ckuz4jys7/Xe
         imbaDm2Y/rT4AmaLfugzUNKHqjUuv1b1pw/gp9TAuFaKqTjXbwsYc3Xvw59FCVuGtSNx
         6uBdOmAVJjbKtIveJHTyj6rAdLqiZviXDYZI9vry+ddc0SV7lShpWk7GIAxWV/bQ3aSc
         +KMP0RATzaVRQOgq6maVySO7rWftHy5ppHiD/tnHHQElCI2iUYc9GESgKVD5lm0+T3jR
         5low==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VuxQZ7FgmOJvvrVC6Ru26nnBHcxEDI0Y+X12Abvxeng=;
        b=49GGjrLo/sWqPDQHnL/HLBhw4O8zdhZ60tY87B1EEbrtEV2oe5q//9BIUxf82yfkjo
         hvnMcqnWozIXuoj97OIspczO9zNpxAv0/CTH0Dc9svTwVxnqK9bi7Q+yKjOsfEcMNFkR
         5qXyiqtesKf04pROO5sQlUTdPAQGwuTvGZ4ZJ+dPhq4Yo6JslkYS8mgDgd3QbC09B/RO
         4JvnMzf9qy5fcv6vKdxs0KrL6wn/by6BeFsUoxfnP8I4v1Gf25v6SlkEw/WThZFh9NQh
         7Fa2CHkMV5BS7LJDVCe6Ss33Oo7dV12oDbxOYuW7tvffSw/c/XTVRYBpYyrd2xbVnYtT
         us9A==
X-Gm-Message-State: AFqh2kqc8WkPxZF/PjvbMTkIDvFt5N/IFRWnWZzKrrc8doDNABWNMU4p
	aHiClBIn3BlnokGYKDh/4I4=
X-Google-Smtp-Source: AMrXdXuBMZh09UTp1bUaSAGR4FoZAxgVtLjnZD+8vRZvxCRq/+Ln0mnrX6GJKdjWzta7jXxUUhrslA==
X-Received: by 2002:a17:907:3fa8:b0:831:a76:90c0 with SMTP id hr40-20020a1709073fa800b008310a7690c0mr4153114ejc.32.1673615278828;
        Fri, 13 Jan 2023 05:07:58 -0800 (PST)
Message-ID: <4f1d289a-7c3b-c4a1-34bc-1e8bd62a416a@gmail.com>
Date: Fri, 13 Jan 2023 15:07:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 1/2] x86/shadow: sanitize iommu_snoop usage
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Tim Deegan <tim@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Paul Durrant <paul@xen.org>
References: <01756703-efc8-e342-295c-a40a286ad5f1@suse.com>
 <cf0ed06f-4d49-0f73-cfd9-eb49e951048c@suse.com>
 <6596d648-6400-7907-bc21-8074dc244247@gmail.com>
 <88e3ec77-587a-ae68-a634-fed1fa917cd7@suse.com>
 <b76a7834-9868-c5c2-e058-89911a552c80@gmail.com>
 <512d8768-28f6-d9d6-c1cc-18c5fbf2a636@suse.com>
From: Xenia Ragiadakou <burzalodowa@gmail.com>
In-Reply-To: <512d8768-28f6-d9d6-c1cc-18c5fbf2a636@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 1/13/23 14:12, Jan Beulich wrote:
> On 13.01.2023 12:55, Xenia Ragiadakou wrote:
>> On 1/13/23 11:53, Jan Beulich wrote:
>>> On 13.01.2023 10:34, Xenia Ragiadakou wrote:
>>>> On 1/13/23 10:47, Jan Beulich wrote:
>>>>> --- a/xen/drivers/passthrough/x86/iommu.c
>>>>> +++ b/xen/drivers/passthrough/x86/iommu.c
>>>>> @@ -56,6 +56,13 @@ void __init acpi_iommu_init(void)
>>>>>         if ( !acpi_disabled )
>>>>>         {
>>>>>             ret = acpi_dmar_init();
>>>>> +
>>>>> +#ifndef iommu_snoop
>>>>> +        /* A command line override for snoop control affects VT-d only. */
>>>>> +        if ( ret )
>>>>> +            iommu_snoop = true;
>>>>> +#endif
>>>>> +
>>>>
>>>> Why here iommu_snoop is forced when iommu is not enabled?
>>>> This change is confusing because later on, in iommu_setup, iommu_snoop
>>>> will be set to false in the case of !iommu_enabled.
>>>
>>> Counter question: Why is it being set to false there? I see no reason at
>>> all. On the same basis as here, I'd actually expect it to be set back to
>>> true in such a case.Which, however, would be a benign change now that
>>> all uses of the variable are properly qualified. Which in turn is why I
>>> thought I'd leave that other place alone.
>>
>> I think I got confused... AFAIU with disabled iommu snooping cannot be
>> enforced i.e iommu_snoop=true translates to snooping is enforced by the
>> iommu (that's why we need to check that the iommu is enabled for the
>> guest). So if the iommu is disabled how can iommu_snoop be true?
> 
> For a non-existent (or disabled) IOMMU the value of this boolean simply
> is irrelevant. Or to put it in other words, when there's no active
> IOMMU, it doesn't matter whether it would actually snoop.

The variable iommu_snoop is initialized to true.
Also, the above change does not prevent it from being overwritten 
through the cmdline iommu param in iommu_setup().
I m afraid I still cannot understand why the change above is needed.

> 
>> Also, in vmx_do_resume(), iommu_snoop is used without checking if the
>> iommu is enabled.
> 
> It only looks to be - a domain having a PCI device implies it having
> IOMMU enabled for it. And indeed in that case we'd like to avoid the
> effort for domains which have IOMMU support enabled for them, but which
> have no devices assigned to them.
> 
> Jan

-- 
Xenia

