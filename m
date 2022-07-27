Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EACA58282B
	for <lists+xen-devel@lfdr.de>; Wed, 27 Jul 2022 16:02:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.376215.608838 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGhbw-0003V3-Ns; Wed, 27 Jul 2022 14:02:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 376215.608838; Wed, 27 Jul 2022 14:02:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGhbw-0003SS-Ku; Wed, 27 Jul 2022 14:02:04 +0000
Received: by outflank-mailman (input) for mailman id 376215;
 Wed, 27 Jul 2022 14:02:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0cJb=YA=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1oGhbu-0003SM-OD
 for xen-devel@lists.xenproject.org; Wed, 27 Jul 2022 14:02:02 +0000
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [2a00:1450:4864:20::22b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id afd69d98-0db4-11ed-bd2d-47488cf2e6aa;
 Wed, 27 Jul 2022 16:02:01 +0200 (CEST)
Received: by mail-lj1-x22b.google.com with SMTP id v21so1333650ljh.3
 for <xen-devel@lists.xenproject.org>; Wed, 27 Jul 2022 07:02:01 -0700 (PDT)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id
 bj24-20020a2eaa98000000b0025df34d252dsm2993086ljb.123.2022.07.27.07.01.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Jul 2022 07:02:00 -0700 (PDT)
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
X-Inumbo-ID: afd69d98-0db4-11ed-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=liOPwzxukm0VKCZGkJLonni9TQL8JmSo9qll0CJUb+8=;
        b=p35FIcnGqxPwZsXdKDr9NDS1Np5wAZFbpOAUPnDc5sfas6Fi+q5LhtIVqeSJQuikL/
         hR8E2HsOuKqreNgHAbvbI/vTLQOmGfpaOqrEW/T/g0q86JBIcSLxiz/9sh4jcJWI7qoe
         4eJFB77T2E+XhVuoAHimmCqcXHJBGjAc8sToJWKev6XBNxczQ2FVvPGrAANH+Jbel/Yi
         oTYtt54HTzSx9q3Jq3fzv3KEm84Gf9QzM9bWIKb9uNUeTb7fltakYW10/OMPBrp3aMTQ
         oM1m78eGo4iopo+4YUG4ZUni5XWwEYDCOai5jkK/lv3u7AwIOPd3g1jbZVj/g48GBcQZ
         V/yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=liOPwzxukm0VKCZGkJLonni9TQL8JmSo9qll0CJUb+8=;
        b=3RBUG7+BQR753IlotR5JvO9UcXziQlBHR/A8IZkpqRc8pbIxAmQPo4yJZU7KgXqgPR
         Y4PAt6vUcAbCEQ1aGbxGHx00ryNNBpVCv385rUXfXRUbaQOJGMX82c9uskTSZin+uvpQ
         ME8QcMShE5SPMbXwC9pnHAkznMPxWW0Dt6KWk9NXCCuDg4XWOV8mQDv6NV6CfexBy817
         dI+TxEdrumCSEzahDYUb4sFdFfyehvXkZCiwinwJKycpYnrb0yHR13UFRdtSeg1e8YV7
         /gn5OQXkqH9GfJ5c0Q0zlSZAJK8Lj6VYoJ1iOgMYZr503g5y/rEzZ+6dg2DZGdhDU31x
         5d8Q==
X-Gm-Message-State: AJIora9wnkzhgk8W5CcDVED4wkjctfsJaEQbfkCFHSjztwL7FDIdcMde
	i4rbARWPkpzwXo1pQxmtfr0=
X-Google-Smtp-Source: AGRyM1tPTHXR/okcSrHREDkJEjpUSNHIdi9ugZNkYUyzvtw+lHjvg3FL8p0LcvFPeUFyI5I6E++W8A==
X-Received: by 2002:a2e:a884:0:b0:25d:ea06:6a3f with SMTP id m4-20020a2ea884000000b0025dea066a3fmr7407187ljq.335.1658930520687;
        Wed, 27 Jul 2022 07:02:00 -0700 (PDT)
Message-ID: <2e0efae5-27f7-831d-6f9e-06d03374b716@gmail.com>
Date: Wed, 27 Jul 2022 17:01:58 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH V7 02/11] vpci: add hooks for PCI device assign/de-assign
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Paul Durrant <paul@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
References: <20220719174253.541965-1-olekstysh@gmail.com>
 <20220719174253.541965-3-olekstysh@gmail.com>
 <51afa25b-93ea-2685-b238-2edd9292bece@suse.com>
From: Oleksandr <olekstysh@gmail.com>
In-Reply-To: <51afa25b-93ea-2685-b238-2edd9292bece@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 27.07.22 13:03, Jan Beulich wrote:


Hello Jan


> On 19.07.2022 19:42, Oleksandr Tyshchenko wrote:
>> @@ -1558,6 +1560,7 @@ static int assign_device(struct domain *d, u16 seg, u8 bus, u8 devfn, u32 flag)
>>   {
>>       const struct domain_iommu *hd = dom_iommu(d);
>>       struct pci_dev *pdev;
>> +    uint8_t old_devfn;
> Why "old"? There's nothing "new" here. Perhaps "orig", considering ...


ok


>
>> @@ -1594,6 +1599,8 @@ static int assign_device(struct domain *d, u16 seg, u8 bus, u8 devfn, u32 flag)
>>                             pci_to_dev(pdev), flag)) )
>>           goto done;
>>   
>> +    old_devfn = devfn;
>> +
>>       for ( ; pdev->phantom_stride; rc = 0 )
>>       {
>>           devfn += pdev->phantom_stride;
> ... this updating of devfn is what you mean to deal with?

As I understand that was the intention of the author. At least I don't 
see other reasons.



> Then again
> I see no need for a separate variable in the first place. The input
> (seg,bus,devfn) tuple is translated to a pdev, so you can simply ...
>
>> @@ -1603,6 +1610,10 @@ static int assign_device(struct domain *d, u16 seg, u8 bus, u8 devfn, u32 flag)
>>                           pci_to_dev(pdev), flag);
>>       }
>>   
>> +    rc = vpci_assign_device(pdev);
>> +    if ( rc && deassign_device(d, seg, bus, old_devfn) )
> ... use pdev->devfn here.


Thanks, good point, will drop old_devfn and use pdev->devfn. I am 
wondering whether the printk after "done:" label (and other possible 
printk-s down the code) should really use pdev->devfn instead of devfn 
in PCI_SBDF construct?



>
>> +        domain_crash(d);
>> +
>>    done:
>>       if ( rc )
>>           printk(XENLOG_G_WARNING "%pd: assign (%pp) failed (%d)\n",
> This log message will want to appear _before_ the domain_crash()
> related output, or you will want to add another log message there.

I will probably add another log message before domain_crash() leaving 
this one as is.

printk(XENLOG_ERR "%pd: %pp was left partially assigned\n", d, 
&PCI_SBDF(seg, bus, devfn));


>
>> --- a/xen/drivers/vpci/vpci.c
>> +++ b/xen/drivers/vpci/vpci.c
>> @@ -92,6 +92,37 @@ int vpci_add_handlers(struct pci_dev *pdev)
>>   
>>       return rc;
>>   }
>> +
>> +#ifdef CONFIG_HAS_VPCI_GUEST_SUPPORT
>> +/* Notify vPCI that device is assigned to guest. */
>> +int vpci_assign_device(struct pci_dev *pdev)
>> +{
>> +    int rc;
>> +
>> +    ASSERT(pcidevs_write_locked());
>> +
>> +    if ( !has_vpci(pdev->domain) )
>> +        return 0;
>> +
>> +    rc = vpci_add_handlers(pdev);
>> +    if ( rc )
>> +        vpci_deassign_device(pdev);
>> +
>> +    return rc;
>> +}
>> +
>> +/* Notify vPCI that device is de-assigned from guest. */
>> +void vpci_deassign_device(struct pci_dev *pdev)
>> +{
>> +    ASSERT(pcidevs_write_locked());
>> +
>> +    if ( !has_vpci(pdev->domain) )
>> +        return;
> There's no need for this check since ...
>
>> +    vpci_remove_device(pdev);
> ... this function already has it. At which point the question is why
> a separate function needs to exist in the first place. To match with
> vpci_assign_device(), a simple #define to alias is would be enough.
> (This is one of the cases where personally I think a #define is
> superior to an inline wrapper.)


Agree, but ...


>
> Unless, of course, later patches extend this function. If so, the
> commit message giving this as justification for the introduction of
> (apparent) redundancy would be helpful.

... exactly, the later patches extend this function. I will update 
commit description.



>
> Jan

-- 
Regards,

Oleksandr Tyshchenko


