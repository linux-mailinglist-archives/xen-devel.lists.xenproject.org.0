Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 257B23F6EED
	for <lists+xen-devel@lfdr.de>; Wed, 25 Aug 2021 07:46:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.171773.313452 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIliD-0002ND-Sp; Wed, 25 Aug 2021 05:44:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 171773.313452; Wed, 25 Aug 2021 05:44:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIliD-0002Jn-L5; Wed, 25 Aug 2021 05:44:33 +0000
Received: by outflank-mailman (input) for mailman id 171773;
 Wed, 25 Aug 2021 05:44:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5rb+=NQ=gmail.com=andr2000@srs-us1.protection.inumbo.net>)
 id 1mIliD-0002Jh-3c
 for xen-devel@lists.xenproject.org; Wed, 25 Aug 2021 05:44:33 +0000
Received: from mail-lf1-x130.google.com (unknown [2a00:1450:4864:20::130])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 709b37d4-75e5-42f2-8e65-fd2a5f395c6a;
 Wed, 25 Aug 2021 05:44:31 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id x27so50449985lfu.5
 for <xen-devel@lists.xenproject.org>; Tue, 24 Aug 2021 22:44:31 -0700 (PDT)
Received: from [192.168.10.179] ([185.199.97.5])
 by smtp.gmail.com with ESMTPSA id e18sm1946493ljo.105.2021.08.24.22.44.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Aug 2021 22:44:29 -0700 (PDT)
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
X-Inumbo-ID: 709b37d4-75e5-42f2-8e65-fd2a5f395c6a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=zUkB/JDpnFrSfPDFZpd6I6po66OqpBFd3TzDaAlqhaE=;
        b=hQo0Hxu0Q5pFABpyR2ZfqUhNRca29rteSGFHR3sN1xKbniVsH5DVuf5CcdpNGLu/PD
         EqyRl3SQD80vWAuYmzDyE6QDnUI85aUiYXHKzk6CqT4X+z0LcCNNpGN1M0NwZWI2JMN4
         uahJYz9qgRmGR73B2b/Rz7UnCU9GuC3OFBZ1mo7Ankr6VetckeK9h8MvMHe0b08ryWvc
         +cLHqGul8GVfnWVMTessjK39P6gTFNSRnKmQZO0o9esMBmIVjMEeXrmyRJGj1OwBJ010
         6fO3cIVSFwINfn8WK2Bm41VzdocUDY5jH6TFKppB0ufgUDDK/HYXGh1YoNiqbrUTvThe
         5DwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=zUkB/JDpnFrSfPDFZpd6I6po66OqpBFd3TzDaAlqhaE=;
        b=rn55dflck9nl6AanHBabDNiR3NfKHVDSusXwASlPFSGo/4cEoqzSI7HVHXvv0SqoIZ
         4daEqdR6A5AXgfmwb9tqlGC7lfAlKPdH70x13WItZ2SClgYMbP8kdX9nFGsNs2hmaM5V
         uJUMW/WfbNjxlNZ+5uanb0GEx0sZZ89YrFsyzUlZMzdirKJStAjMziNQVStjrmiejGT5
         /RbS/uVulLXWlcFsp6CPo3QM4AoQEprZksyAH+Gy10j6+Pdxj0hd3hw/bdiSx8jUHOfs
         EeHp3cVpIbhBYXQYuCyWQ8N0kLA9ZrfC22HqglU4k7/pphdBGudKmKH3FVsdadNOnfYl
         aPuQ==
X-Gm-Message-State: AOAM533zCT9sCQ3oZ/i7eL0urGPVil8JYGzOlceU5fQ0XCNkvU/Cts9J
	TU7aGBU7r+9Ss429Lp4jAVaSpMtVFlwfCQ==
X-Google-Smtp-Source: ABdhPJwcKXbOSqFVm1zjmbV3EJSgOJCYO9ED2QwEytWZ2GDbEpBnBm60ITC+2xtw2ZMBqKLCltQRFQ==
X-Received: by 2002:ac2:4c47:: with SMTP id o7mr18665821lfk.512.1629870270274;
        Tue, 24 Aug 2021 22:44:30 -0700 (PDT)
Subject: Re: [PATCH v1 11/14] xen/arm: Enable the existing x86 virtual PCI
 support for ARM.
To: Jan Beulich <jbeulich@suse.com>, Rahul Singh <rahul.singh@arm.com>
Cc: bertrand.marquis@arm.com, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, Paul Durrant <paul@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <cover.1629366665.git.rahul.singh@arm.com>
 <370f4f87c148eaee5ac5ec69346828e6473f0f2d.1629366665.git.rahul.singh@arm.com>
 <c4cd8072-e463-6c9b-ddb2-640108dd5d2a@suse.com>
From: Oleksandr Andrushchenko <andr2000@gmail.com>
Message-ID: <53a61aa7-499b-f21d-8f44-a4c24f270d45@gmail.com>
Date: Wed, 25 Aug 2021 08:44:25 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <c4cd8072-e463-6c9b-ddb2-640108dd5d2a@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Hi, Jan!

On 24.08.21 19:09, Jan Beulich wrote:
> On 19.08.2021 14:02, Rahul Singh wrote:
>> --- a/xen/drivers/passthrough/pci.c
>> +++ b/xen/drivers/passthrough/pci.c
>> @@ -767,6 +767,13 @@ int pci_add_device(u16 seg, u8 bus, u8 devfn,
>>       else
>>           iommu_enable_device(pdev);
>>   
>> +#ifdef CONFIG_ARM
>> +    ret = vpci_add_handlers(pdev);
>> +    if ( ret ) {
>> +        printk(XENLOG_ERR "setup of vPCI for failed: %d\n",ret);
>> +        goto out;
>> +    }
>> +#endif
>>       pci_enable_acs(pdev);
> I'm afraid I can't see why this is to be Arm-specific. The present
> placement of the existing call to vpci_add_handlers() looks to be
> sub-optimal anyway - did you look into whether it could be moved
> to a place (potentially right here) fitting everyone? If you did,
> would mind justifying the Arm-specific code in a non-Arm-specific
> file in at least a post-commit-message remark?
>
> If it were to remain like this, please add a blank line after the #endif.
>
>> --- a/xen/drivers/vpci/Makefile
>> +++ b/xen/drivers/vpci/Makefile
>> @@ -1 +1,2 @@
>> -obj-y += vpci.o header.o msi.o msix.o
>> +obj-y += vpci.o header.o
>> +obj-$(CONFIG_HAS_PCI_MSI) += msi.o msix.o
> I continue to consider this a wrong connection - HAS_PCI_MSI expresses
> (quoting text from patch 1 of this series) "code that implements MSI
> functionality to support MSI within XEN", while here we're talking of
> vPCI (i.e. guest support). I can accept that this is transiently the
> best you can do, but then please add a comment to this effect (if
> need be in multiple places), such that future readers or people
> wanting to further adjust this understand why it is the way it is.
>
> But perhaps you instead want to introduce a HAS_VPCI_MSI (or, less
> desirable because of possible ambiguity, HAS_VMSI) Kconfig option?

Eventually we'll have the code like that:

obj-y += vpci.o header.o msi.o msix.o
obj-$(CONFIG_X86) += x86/
obj-$(CONFIG_ARM) += arm/

So, this is indeed a transitional change. Will you be ok with a comment

about that then?

>
>> --- a/xen/drivers/vpci/header.c
>> +++ b/xen/drivers/vpci/header.c
>> @@ -96,8 +96,10 @@ static void modify_decoding(const struct pci_dev *pdev, uint16_t cmd,
>>        * FIXME: punching holes after the p2m has been set up might be racy for
>>        * DomU usage, needs to be revisited.
>>        */
>> +#ifdef CONFIG_HAS_PCI_MSI
>>       if ( map && !rom_only && vpci_make_msix_hole(pdev) )
>>           return;
>> +#endif
> (This would be another such place.)
>
>> --- a/xen/include/asm-arm/domain.h
>> +++ b/xen/include/asm-arm/domain.h
>> @@ -262,7 +262,10 @@ static inline void arch_vcpu_block(struct vcpu *v) {}
>>   
>>   #define arch_vm_assist_valid_mask(d) (1UL << VMASST_TYPE_runstate_update_flag)
>>   
>> -#define has_vpci(d)    ({ (void)(d); false; })
>> +/* For X86 VPCI is enabled and tested for PVH DOM0 only but
>> + * for ARM we enable support VPCI for guest domain also.
>> + */
> Comment style (/* goes on its own line).
>
>> +#define has_vpci(d) ({ (void)(d); IS_ENABLED(CONFIG_HAS_VPCI); })
> Personally I'd recommend to get away without using extensions whenever
> possible, i.e. use
>
> #define has_vpci(d) ((void)(d), IS_ENABLED(CONFIG_HAS_VPCI))
>
> here.
>
>> --- a/xen/include/asm-arm/pci.h
>> +++ b/xen/include/asm-arm/pci.h
>> @@ -27,6 +27,14 @@ struct arch_pci_dev {
>>       struct device dev;
>>   };
>>   
>> +/* Arch-specific MSI data for vPCI. */
>> +struct vpci_arch_msi {
>> +};
>> +
>> +/* Arch-specific MSI-X entry data for vPCI. */
>> +struct vpci_arch_msix_entry {
>> +};
> But isn't it that you don't support vPCI's MSI in the first place?
> Perhaps the need for these would go away with CONFIG_HAS_VCPI_MSI?
>
> Jan
>
>

