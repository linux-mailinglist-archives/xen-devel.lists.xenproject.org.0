Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 974F3669636
	for <lists+xen-devel@lfdr.de>; Fri, 13 Jan 2023 12:56:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.477236.739863 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pGIei-0003V8-PG; Fri, 13 Jan 2023 11:55:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 477236.739863; Fri, 13 Jan 2023 11:55:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pGIei-0003SH-MN; Fri, 13 Jan 2023 11:55:32 +0000
Received: by outflank-mailman (input) for mailman id 477236;
 Fri, 13 Jan 2023 11:55:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3K7w=5K=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1pGIeg-0003RT-NX
 for xen-devel@lists.xenproject.org; Fri, 13 Jan 2023 11:55:30 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2c3291cb-9339-11ed-b8d0-410ff93cb8f0;
 Fri, 13 Jan 2023 12:55:28 +0100 (CET)
Received: by mail-ej1-x632.google.com with SMTP id qk9so51791285ejc.3
 for <xen-devel@lists.xenproject.org>; Fri, 13 Jan 2023 03:55:28 -0800 (PST)
Received: from [192.168.1.93] (adsl-67.109.242.138.tellas.gr. [109.242.138.67])
 by smtp.gmail.com with ESMTPSA id
 lb21-20020a170907785500b0084c4657120fsm8512626ejc.55.2023.01.13.03.55.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Jan 2023 03:55:27 -0800 (PST)
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
X-Inumbo-ID: 2c3291cb-9339-11ed-b8d0-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=a367pTAZQ7WMXu5GdIE3oLyzRGZq0cQOvYB//vuBT5k=;
        b=p1LETkqnjUgeKdzVH8r4751UQgcGd/gsgcatdeVDgMhhCOWaLETzwnO9Gyimz7Q1zl
         Hf0hGuwiJOvhL4HxwCYjHygHUirTOF5PghZ2/58CdgUxbEbDDpGRCVDpOa2YzIiN7rAJ
         2vlB6llD2iFsE5bODeUWQoBiok2ldxAH7YNZOF72Rz/omCJ/z3PpA9EOyDoYDzKds5oF
         vZ+rZU/c2M3zHhbZlbbaIsGPuB09wXZTnDz6Dn4gkrg765vOrQr9ePoERtBB8Di7oQTn
         MwsgixjSidXMftLc0KiqQx1v3Vdlw5J2tMi5DjPrsITvc6BpAbCM546+LtqEReMCjNJX
         uTHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=a367pTAZQ7WMXu5GdIE3oLyzRGZq0cQOvYB//vuBT5k=;
        b=QPH6lNJ56K4OCZ3Ta3XXm3i1eIVZ1Clkqt/FENxbGgySw+xls2YkrlwK/yL+a78EEK
         tsEm8Yjih1WjFM7p89Qc3VGineZziyQWmB5O6f1Xk2M/IyGFT8DH9jKu2elCgWfgcNJT
         D6LEClDYoyvpcQdivBauS++64sP+bVksacagLREyl5CwSmKNK8F8lCLayjgKARoUX3WT
         KsW6TdzzW9/KDJcuQ7mF9Y0tRA+80difECtXeMt4LSFCRRe9hfFmifrUDBAkcqNUigVh
         1hoLmTUTJhNwBi49REtKWKlz0ZsOmukpzZ1B1qV08UYgq11QXmUJVyOPl9jA9mb5A8SD
         ArTw==
X-Gm-Message-State: AFqh2krqBNIDupuWdK2Kf1yP6qwwxx2pToUulw2FhgLEW6en8qqzlyWK
	/BZWZENt/nhFYtcjxW5pHcg=
X-Google-Smtp-Source: AMrXdXuj2FoXQ5mSwuJ6G/ZNIhiPb5aHDslclu1zQluVNqMf9Rz0ODW+D1EtIj6I4mkUX5DGgy156Q==
X-Received: by 2002:a17:906:6dcb:b0:7c0:d60b:2887 with SMTP id j11-20020a1709066dcb00b007c0d60b2887mr69199941ejt.69.1673610927849;
        Fri, 13 Jan 2023 03:55:27 -0800 (PST)
Message-ID: <b76a7834-9868-c5c2-e058-89911a552c80@gmail.com>
Date: Fri, 13 Jan 2023 13:55:25 +0200
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
From: Xenia Ragiadakou <burzalodowa@gmail.com>
In-Reply-To: <88e3ec77-587a-ae68-a634-fed1fa917cd7@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

(CC Paul as well)

On 1/13/23 11:53, Jan Beulich wrote:
> On 13.01.2023 10:34, Xenia Ragiadakou wrote:
>>
>> On 1/13/23 10:47, Jan Beulich wrote:
>>> First of all the variable is meaningful only when an IOMMU is in use for
>>> a guest. Qualify the check accordingly, like done elsewhere. Furthermore
>>> the controlling command line option is supposed to take effect on VT-d
>>> only. Since command line parsing happens before we know whether we're
>>> going to use VT-d, force the variable back to set when instead running
>>> with AMD IOMMU(s).
>>>
>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>> ---
>>> I was first considering to add the extra check to the outermost
>>> enclosing if(), but I guess that would break the (questionable) case of
>>> assigning MMIO ranges directly by address. The way it's done now also
>>> better fits the existing checks, in particular the ones in p2m-ept.c.
>>>
>>> Note that the #ifndef is put there in anticipation of iommu_snoop
>>> becoming a #define when !IOMMU_INTEL (see
>>> https://lists.xen.org/archives/html/xen-devel/2023-01/msg00103.html
>>> and replies).
>>>
>>> In _sh_propagate() I'm further puzzled: The iomem_access_permitted()
>>> certainly suggests very bad things could happen if it returned false
>>> (i.e. in the implicit "else" case). The assumption looks to be that no
>>> bad "target_mfn" can make it there. But overall things might end up
>>> looking more sane (and being cheaper) when simply using "mmio_mfn"
>>> instead.
>>>
>>> --- a/xen/arch/x86/mm/shadow/multi.c
>>> +++ b/xen/arch/x86/mm/shadow/multi.c
>>> @@ -571,7 +571,7 @@ _sh_propagate(struct vcpu *v,
>>>                                gfn_to_paddr(target_gfn),
>>>                                mfn_to_maddr(target_mfn),
>>>                                X86_MT_UC);
>>> -                else if ( iommu_snoop )
>>> +                else if ( is_iommu_enabled(d) && iommu_snoop )
>>>                        sflags |= pat_type_2_pte_flags(X86_MT_WB);
>>>                    else
>>>                        sflags |= get_pat_flags(v,
>>> --- a/xen/drivers/passthrough/x86/iommu.c
>>> +++ b/xen/drivers/passthrough/x86/iommu.c
>>> @@ -56,6 +56,13 @@ void __init acpi_iommu_init(void)
>>>        if ( !acpi_disabled )
>>>        {
>>>            ret = acpi_dmar_init();
>>> +
>>> +#ifndef iommu_snoop
>>> +        /* A command line override for snoop control affects VT-d only. */
>>> +        if ( ret )
>>> +            iommu_snoop = true;
>>> +#endif
>>> +
>>
>> Why here iommu_snoop is forced when iommu is not enabled?
>> This change is confusing because later on, in iommu_setup, iommu_snoop
>> will be set to false in the case of !iommu_enabled.
> 
> Counter question: Why is it being set to false there? I see no reason at
> all. On the same basis as here, I'd actually expect it to be set back to
> true in such a case.Which, however, would be a benign change now that
> all uses of the variable are properly qualified. Which in turn is why I
> thought I'd leave that other place alone.

I think I got confused... AFAIU with disabled iommu snooping cannot be 
enforced i.e iommu_snoop=true translates to snooping is enforced by the 
iommu (that's why we need to check that the iommu is enabled for the 
guest). So if the iommu is disabled how can iommu_snoop be true?

Also, in vmx_do_resume(), iommu_snoop is used without checking if the 
iommu is enabled.

-- 
Xenia

