Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 66340588E68
	for <lists+xen-devel@lfdr.de>; Wed,  3 Aug 2022 16:18:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.379964.613901 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJFCV-0001jS-Un; Wed, 03 Aug 2022 14:18:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 379964.613901; Wed, 03 Aug 2022 14:18:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJFCV-0001hU-RZ; Wed, 03 Aug 2022 14:18:19 +0000
Received: by outflank-mailman (input) for mailman id 379964;
 Wed, 03 Aug 2022 14:18:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2CMa=YH=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1oJFCT-0001hN-Qt
 for xen-devel@lists.xenproject.org; Wed, 03 Aug 2022 14:18:17 +0000
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [2a00:1450:4864:20::42c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1da9b43d-1337-11ed-bd2d-47488cf2e6aa;
 Wed, 03 Aug 2022 16:18:16 +0200 (CEST)
Received: by mail-wr1-x42c.google.com with SMTP id bv3so7841371wrb.5
 for <xen-devel@lists.xenproject.org>; Wed, 03 Aug 2022 07:18:16 -0700 (PDT)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id
 p64-20020a1c2943000000b0039c454067ddsm2549946wmp.15.2022.08.03.07.18.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Aug 2022 07:18:15 -0700 (PDT)
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
X-Inumbo-ID: 1da9b43d-1337-11ed-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=tTxVBAGojJw7FmjCfKE1NBzcNx9O4T2Im0Eg/HpwuiM=;
        b=Zrb5GqY3kJ0wzcriIv9R4a6WdRqQ+VASuOsW9f8dzeKHZJIoY3544vuNG4Et7/VfXB
         pI1/3cGwM3CEycBg21lThgN1/Bw5JvyDsOoQXOa7kyGX41aHIE5s3dwguG5U2lbkI9xW
         cniYy18YtfrQhgARAjk9NcBmRkGHgdD/5EEbUMdHkEs8ndT7QRLtlqZguskykMDPazpj
         cGglP0D1CftEkChp8Gg3QivlVHqihAP1uYwrNjak/ui20mcvkkUvTUSxKi2or6Kl0GaV
         gxDxexxwkKuJV3eLGBQqRlN0ALJxUsepw0upO2A7pyu0OioqJ1y+BecGGLAhh2v4dtkm
         NMaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=tTxVBAGojJw7FmjCfKE1NBzcNx9O4T2Im0Eg/HpwuiM=;
        b=Q/4BNFsi9iTykHJl5Sh8CbgxuWbpRan5etg7pNUOAjquM1yXIkfAEFXexd9IlM5SEV
         YFMDEW4tGI/2+z19hWyQAzWIRxp+tRtzZMSAlm7ky48+XxH2q8lTpJTcU4Ce/ciSQlMb
         UXIETsFSQidMD0nDeeMhWRFa20UTNwf31eAqwX7S3FQza+CUNOeZKHJokQS9e9Cc+/v3
         rFkhb/0kRAKWLW0oEM4Tuf1Rbd6vaF5rVwEWkpdUPoo35L03qW3cERyataC05IJviqe/
         80WR2DUqxszarE0EVv0B0RAg1yGm3XgpCQyeazSp7R6860JoXk0GCFOTdbNBREbfrcSW
         6NoQ==
X-Gm-Message-State: ACgBeo0DIMdEYsX76otaeQ//giz+lHR+IDujof93gEima1wZkB8xVUnC
	Eomce1kxWQDD5E+PhTbTGyk=
X-Google-Smtp-Source: AA6agR6xT5hhrqEIZJOI4r3bH8oBxOupMz1dsddtm4cpvyCVJVswWhpukgMV5EhylN2RFsxN4vqp5w==
X-Received: by 2002:a05:6000:c1:b0:220:5c10:5c51 with SMTP id q1-20020a05600000c100b002205c105c51mr11103143wrx.668.1659536295617;
        Wed, 03 Aug 2022 07:18:15 -0700 (PDT)
Message-ID: <6109da4c-74c7-d677-e70e-bdb519a079f8@gmail.com>
Date: Wed, 3 Aug 2022 17:18:12 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH V7 01/11] xen/pci: arm: add stub for is_memory_hole
Content-Language: en-US
To: Rahul Singh <Rahul.Singh@arm.com>
Cc: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20220719174253.541965-1-olekstysh@gmail.com>
 <20220719174253.541965-2-olekstysh@gmail.com>
 <8e912bdf-a93f-c3d8-8906-8132a8f30035@gmail.com>
 <304DD889-A643-42D9-9B60-7B34950A127D@arm.com>
From: Oleksandr <olekstysh@gmail.com>
In-Reply-To: <304DD889-A643-42D9-9B60-7B34950A127D@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 03.08.22 12:29, Rahul Singh wrote:
> Hi Oleksandr,


Hello Rahul


>
>> On 29 Jul 2022, at 5:28 pm, Oleksandr <olekstysh@gmail.com> wrote:
>>
>>
>> Hello Rahul
>>
>>
>> On 19.07.22 20:42, Oleksandr Tyshchenko wrote:
>>> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
>>>
>>> Add a stub for is_memory_hole which is required for PCI passthrough
>>> on Arm.
>>>
>>> Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
>>> ---
>>> OT: It looks like the discussion got stuck. As I understand this
>>> patch is not immediately needed in the context of current series
>>> as PCI passthrough is not enabled on Arm at the moment. So the patch
>>> could be added later on, but it is needed to allow PCI passthrough
>>> to be built on Arm for those who want to test it.
>>>
>>> Copy here some context provided by Julien:
>>>
>>> Here a summary of the discussion (+ some my follow-up thoughts):
>>>
>>> is_memory_hole() was recently introduced on x86 (see commit 75cc460a1b8c
>>> "xen/pci: detect when BARs are not suitably positioned") to check
>>> whether the BAR are positioned outside of a valid memory range. This was
>>> introduced to work-around quirky firmware.
>>>
>>> In theory, this could also happen on Arm. In practice, this may not
>>> happen but it sounds better to sanity check that the BAR contains
>>> "valid" I/O range.
>>>
>>> On x86, this is implemented by checking the region is not described is
>>> in the e820. IIUC, on Arm, the BARs have to be positioned in pre-defined
>>> ranges. So I think it would be possible to implement is_memory_hole() by
>>> going through the list of hostbridges and check the ranges.
>>>
>>> But first, I'd like to confirm my understanding with Rahul, and others.
>>
>> May I please ask about your opinion on that?
> I agree with Julien we can implement the something similar to is_memory_hole()  for ARM
> that will check that the bar is within the bridge ranges.
>
> If you are okay you can discard this patch in next version of the series and I will push the patch
> for review.

Perfect! Thank you, that would be much appreciated!


>
> Regards,
> Rahul

-- 
Regards,

Oleksandr Tyshchenko


