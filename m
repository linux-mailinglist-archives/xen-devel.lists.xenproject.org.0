Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5669E58314C
	for <lists+xen-devel@lfdr.de>; Wed, 27 Jul 2022 19:55:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.376407.609150 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGlEw-0003FT-1b; Wed, 27 Jul 2022 17:54:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 376407.609150; Wed, 27 Jul 2022 17:54:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGlEv-0003Df-V1; Wed, 27 Jul 2022 17:54:33 +0000
Received: by outflank-mailman (input) for mailman id 376407;
 Wed, 27 Jul 2022 17:54:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0cJb=YA=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1oGlEu-0003DZ-2k
 for xen-devel@lists.xenproject.org; Wed, 27 Jul 2022 17:54:32 +0000
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [2a00:1450:4864:20::130])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2a1dc586-0dd5-11ed-bd2d-47488cf2e6aa;
 Wed, 27 Jul 2022 19:54:30 +0200 (CEST)
Received: by mail-lf1-x130.google.com with SMTP id p10so20670498lfd.9
 for <xen-devel@lists.xenproject.org>; Wed, 27 Jul 2022 10:54:30 -0700 (PDT)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id
 v19-20020a056512349300b0048a87545d8csm2131106lfr.27.2022.07.27.10.54.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Jul 2022 10:54:29 -0700 (PDT)
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
X-Inumbo-ID: 2a1dc586-0dd5-11ed-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=X+hQaMwAGilNS0iZC2ZT3X/kn1lU1jZ3sAkL6hnlqTc=;
        b=q7BO7OfJMH8XO5TbKt39Y/aRqeksAFgMjykRh12WXVsKNoM2gMPAKOsh5PFJ13iKjF
         g8+UXgXwmV7iT2EhK66wXGrHXgaF0wy2ZgfpGPaadBfDUuNoLD1aHiqHyy/1NVYKO5xb
         4KFl/sPWRNI3B4sMJ42yF8mjsBvcCV8nILS5EY5Egwc7CYLgtCLcRRWOIYD5eT4e2nYE
         FzhFLLcDOul7XEmlEOsbPhq4lhwLf/5GzXqWrnEICPvcHHB1Gxt7ZRhQL1WT1MQk+Uu3
         Kc6B+sjXC7wdPCLE5RF6ZiZvcyd0xMiARfwCIaepn1dtfDJIvn91PBeb+brEgOUEZrfX
         sVRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=X+hQaMwAGilNS0iZC2ZT3X/kn1lU1jZ3sAkL6hnlqTc=;
        b=29jivkp8gUN97g49nk/yubGwh4FkDX1vnym+/LsgbRNNmWkdhClL9TqRADe5Zd9OTr
         +B8hOfdg3E4aKVAkw7mjevrWG+JGo4bV6HSHRtQ+6dIvenU5uB2CdKbsB+FMYfOg34cb
         a+5TVQhYE605y6yONO56w9Ozlh2Wc4KQxhOH1isSbuCAni/ADUtwGyIHBU6qfYbo4m/X
         Gxv18AyKWcyrizaU8FxUoVc4oMGRvY+9Kq7ngjo9pSYnzRtXVEO5cj+1f9PBdShhIfMd
         +cbweKydqq+44Ue5fnoLBb629ohA1K7WoJB9pP/VhnkYvQsp5691nuT+Cda7Yjuvio5m
         4R5w==
X-Gm-Message-State: AJIora8xu2hA7qlIwoaKoQVj2wZnaBs4mldy0MHYKLPADUWOtqauc7gQ
	qkiAypNa7JJX7SAANk2Rsqs=
X-Google-Smtp-Source: AGRyM1tloiZkFjhDCP21u9n9erWRSDPNYCgCPJD6oQx/MgFpS9iYt0KfAoTPIyRkgFPJIzDPv8BiNQ==
X-Received: by 2002:a05:6512:33cc:b0:48a:9f6a:8bfb with SMTP id d12-20020a05651233cc00b0048a9f6a8bfbmr3395900lfg.381.1658944470003;
        Wed, 27 Jul 2022 10:54:30 -0700 (PDT)
Message-ID: <b0f69f8b-d163-f984-e5ec-88a0a158eafc@gmail.com>
Date: Wed, 27 Jul 2022 20:54:27 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH V7 10/11] xen/arm: translate virtual PCI bus topology for
 guests
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20220719174253.541965-1-olekstysh@gmail.com>
 <20220719174253.541965-11-olekstysh@gmail.com>
 <6e1a842f-e577-0f01-5046-f96c3c75db5b@suse.com>
From: Oleksandr <olekstysh@gmail.com>
In-Reply-To: <6e1a842f-e577-0f01-5046-f96c3c75db5b@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 26.07.22 18:16, Jan Beulich wrote:

Hello Jan

> On 19.07.2022 19:42, Oleksandr Tyshchenko wrote:
>> --- a/xen/arch/arm/vpci.c
>> +++ b/xen/arch/arm/vpci.c
>> @@ -41,6 +41,16 @@ static int vpci_mmio_read(struct vcpu *v, mmio_info_t *info,
>>       /* data is needed to prevent a pointer cast on 32bit */
>>       unsigned long data;
>>   
>> +    /*
>> +     * For the passed through devices we need to map their virtual SBDF
>> +     * to the physical PCI device being passed through.
>> +     */
>> +    if ( !bridge && !vpci_translate_virtual_device(v->domain, &sbdf) )
>> +    {
>> +        *r = ~0ul;
>> +        return 1;
>> +    }
> I'm probably simply lacking specific Arm-side knowledge, but it strikes
> me as odd that the need for translation would be dependent upon "bridge".


I am afraid I cannot answer immediately.

I will analyze that question and provide an answer later on.



>
>> --- a/xen/drivers/vpci/vpci.c
>> +++ b/xen/drivers/vpci/vpci.c
>> @@ -158,6 +158,32 @@ static void vpci_remove_virtual_device(const struct pci_dev *pdev)
>>       }
>>   }
>>   
>> +/*
>> + * Find the physical device which is mapped to the virtual device
>> + * and translate virtual SBDF to the physical one.
>> + */
>> +bool vpci_translate_virtual_device(struct domain *d, pci_sbdf_t *sbdf)
>> +{
>> +    struct pci_dev *pdev;
> const wherever possible please (i.e. likely also for the first function
> parameter).


ok, will do


>
>> --- a/xen/include/xen/vpci.h
>> +++ b/xen/include/xen/vpci.h
>> @@ -276,6 +276,7 @@ static inline bool __must_check vpci_process_pending(struct vcpu *v)
>>   /* Notify vPCI that device is assigned/de-assigned to/from guest. */
>>   int vpci_assign_device(struct pci_dev *pdev);
>>   void vpci_deassign_device(struct pci_dev *pdev);
>> +bool vpci_translate_virtual_device(struct domain *d, pci_sbdf_t *sbdf);
>>   #else
>>   static inline int vpci_assign_device(struct pci_dev *pdev)
>>   {
>> @@ -285,6 +286,12 @@ static inline int vpci_assign_device(struct pci_dev *pdev)
>>   static inline void vpci_deassign_device(struct pci_dev *pdev)
>>   {
>>   };
>> +
>> +static inline bool vpci_translate_virtual_device(struct domain *d,
>> +                                                 pci_sbdf_t *sbdf)
>> +{
>> +    return false;
>> +}
> Please don't add stubs which aren't really needed (which, afaict, is the
> case for this one).


I assume, this is needed if HAS_VPCI is present, but 
HAS_VPCI_GUEST_SUPPORT is not. And the author added that stub 
specifically to drop a few "#ifdef CONFIG_HAS_VPCI_GUEST_SUPPORT" from 
Arm's code.

Or I really missed something?



>
> Jan

-- 
Regards,

Oleksandr Tyshchenko


