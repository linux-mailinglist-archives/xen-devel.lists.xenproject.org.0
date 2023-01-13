Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A45F669A9D
	for <lists+xen-devel@lfdr.de>; Fri, 13 Jan 2023 15:36:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.477398.740105 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pGLAH-0006ms-BL; Fri, 13 Jan 2023 14:36:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 477398.740105; Fri, 13 Jan 2023 14:36:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pGLAH-0006kU-8X; Fri, 13 Jan 2023 14:36:17 +0000
Received: by outflank-mailman (input) for mailman id 477398;
 Fri, 13 Jan 2023 14:36:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3K7w=5K=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1pGLAG-0006kO-B9
 for xen-devel@lists.xenproject.org; Fri, 13 Jan 2023 14:36:16 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a23d161a-934f-11ed-91b6-6bf2151ebd3b;
 Fri, 13 Jan 2023 15:36:15 +0100 (CET)
Received: by mail-ej1-x62a.google.com with SMTP id l22so23062409eja.12
 for <xen-devel@lists.xenproject.org>; Fri, 13 Jan 2023 06:36:15 -0800 (PST)
Received: from [192.168.1.93] (adsl-67.109.242.138.tellas.gr. [109.242.138.67])
 by smtp.gmail.com with ESMTPSA id
 lb24-20020a170907785800b008448d273670sm8503172ejc.49.2023.01.13.06.36.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Jan 2023 06:36:14 -0800 (PST)
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
X-Inumbo-ID: a23d161a-934f-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oD80ua/UgcDwNcyC3REtSAvnr2fpx4MhN6KWkEIZTAE=;
        b=EdjevcdK+FfjVH3S+nr2N1t7CaIEfprmeVsYKKDmQQWTfdmDGA1NP94MMGXMSe9esY
         re7NHB04ouGCsLRuwexM3YkZwVnUEeh1PkKXe30Sc5SnpdxV/8pCGtU2mYb5VsE4uivX
         x9etR6evm0ri+12eEpDeyNFwq+t5xm677Wg3yBsogcrWCsI9Pe4TWYtt+cAdTZlFXBRk
         Tyhgl+2Lw/4W8vidFYZKamN7BJKiTscL+T0S5WC2pTvf98YNreISow0PiDHJRXmRgKzq
         nszAqGyzru+jtFbsHY2XPlzSjFga4SYaIKb14tJiozlLmy32wQzo4g7grgiHGkvkjEF7
         a1FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oD80ua/UgcDwNcyC3REtSAvnr2fpx4MhN6KWkEIZTAE=;
        b=h3LUKBIWuwAS9jvNv0WK7DNWPONNuI9AQZr9V7qGYpMxuLjrnDomL4MXoSyQ0ikkbT
         oZlEnebyE3zxwumYgvT4Gscm/gEi5Gf8VE5Vv/wklvFp9O4H97FrolsfdanYY+eF5t6R
         kOIvT+TXkUWrurVHe31cwkpRsnLt7F9cWj/1GnlAbzF5FYtKyHA0946LXmiS5fKUlNa0
         ocDWEQ4yIzr51aYvFRoE/jbqHzNjsAxfNAjyJMBZCHq2UP198NXFw5M6h2uwf7yi9VNr
         DgruRRIIJG8a6yMAbBdlUxuChKzDPNeieSa4wvCCSBfydikSM0IlseEZt8ftW/FMkLdV
         4qNg==
X-Gm-Message-State: AFqh2krSK6hb7SPCN7EfCa9He5YL9qXCoHJldFYHWUXvukDi3daHkdzL
	KlfuRpCpe7NqaVarQUjgAnQ=
X-Google-Smtp-Source: AMrXdXvAwcthKfrt+Z/78ld8JbEsSbArM7Sd9XbxldudvnyyHPQE/uDizs2CC0nX4n3G/Gi/z8nQEg==
X-Received: by 2002:a17:907:a485:b0:7c1:709d:fa49 with SMTP id vp5-20020a170907a48500b007c1709dfa49mr88074670ejc.18.1673620574763;
        Fri, 13 Jan 2023 06:36:14 -0800 (PST)
Message-ID: <9c7cd0e7-c1b5-322e-b89b-b4927ea568bd@gmail.com>
Date: Fri, 13 Jan 2023 16:36:12 +0200
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
 <4f1d289a-7c3b-c4a1-34bc-1e8bd62a416a@gmail.com>
 <da973e5a-3a1b-3e99-ebf9-e462915eb338@suse.com>
 <8e1ecdf9-c5b2-2977-b4fc-a64cf04c765b@gmail.com>
 <1fc41018-b27f-61f5-632d-3a36e5460590@suse.com>
From: Xenia Ragiadakou <burzalodowa@gmail.com>
In-Reply-To: <1fc41018-b27f-61f5-632d-3a36e5460590@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 1/13/23 16:22, Jan Beulich wrote:
> On 13.01.2023 14:53, Xenia Ragiadakou wrote:
>> On 1/13/23 15:24, Jan Beulich wrote:
>>> On 13.01.2023 14:07, Xenia Ragiadakou wrote:
>>>> On 1/13/23 14:12, Jan Beulich wrote:
>>>>> On 13.01.2023 12:55, Xenia Ragiadakou wrote:
>>>>>> On 1/13/23 11:53, Jan Beulich wrote:
>>>>>>> On 13.01.2023 10:34, Xenia Ragiadakou wrote:
>>>>>>>> On 1/13/23 10:47, Jan Beulich wrote:
>>>>>>>>> --- a/xen/drivers/passthrough/x86/iommu.c
>>>>>>>>> +++ b/xen/drivers/passthrough/x86/iommu.c
>>>>>>>>> @@ -56,6 +56,13 @@ void __init acpi_iommu_init(void)
>>>>>>>>>           if ( !acpi_disabled )
>>>>>>>>>           {
>>>>>>>>>               ret = acpi_dmar_init();
>>>>>>>>> +
>>>>>>>>> +#ifndef iommu_snoop
>>>>>>>>> +        /* A command line override for snoop control affects VT-d only. */
>>>>>>>>> +        if ( ret )
>>>>>>>>> +            iommu_snoop = true;
>>>>>>>>> +#endif
>>>>>>>>> +
>>>>>>>>
>>>>>>>> Why here iommu_snoop is forced when iommu is not enabled?
>>>>>>>> This change is confusing because later on, in iommu_setup, iommu_snoop
>>>>>>>> will be set to false in the case of !iommu_enabled.
>>>>>>>
>>>>>>> Counter question: Why is it being set to false there? I see no reason at
>>>>>>> all. On the same basis as here, I'd actually expect it to be set back to
>>>>>>> true in such a case.Which, however, would be a benign change now that
>>>>>>> all uses of the variable are properly qualified. Which in turn is why I
>>>>>>> thought I'd leave that other place alone.
>>>>>>
>>>>>> I think I got confused... AFAIU with disabled iommu snooping cannot be
>>>>>> enforced i.e iommu_snoop=true translates to snooping is enforced by the
>>>>>> iommu (that's why we need to check that the iommu is enabled for the
>>>>>> guest). So if the iommu is disabled how can iommu_snoop be true?
>>>>>
>>>>> For a non-existent (or disabled) IOMMU the value of this boolean simply
>>>>> is irrelevant. Or to put it in other words, when there's no active
>>>>> IOMMU, it doesn't matter whether it would actually snoop.
>>>>
>>>> The variable iommu_snoop is initialized to true.
>>>> Also, the above change does not prevent it from being overwritten
>>>> through the cmdline iommu param in iommu_setup().
>>>
>>> Command line parsing happens earlier (and in parse_iommu_param(), not in
>>> iommu_setup()). iommu_setup() can further overwrite it on its error path,
>>> but as said that's benign then.
>>
>> You are right. I misunderstood.
>>
>>>
>>>> I m afraid I still cannot understand why the change above is needed.
>>>
>>> When using an AMD IOMMU, with how things work right now the variable ought
>>> to always be true (hence why I've suggested that when !INTEL_IOMMU, this
>>> simply become a #define to true). See also Andrew's comments here and/or
>>> on your patch.
>>
>> Ok I see, so this change is specific to AMD iommu and when iommu_snoop
>> becomes a #define, this change won't be needed anymore, right?
> 
> Well the (source) code change will still be needed; it'll simply be
> compiled out for the case where iommu_snoop is a #define (which it
> looks like we agree it will be when !INTEL_IOMMU).

Yes. Actually, I was thinking to move the setup of iommu_snoop out of 
the X86 #ifdef and to make it depend only on INTEL_IOMMU since for !X86 
only matters to be defined.

-- 
Xenia

