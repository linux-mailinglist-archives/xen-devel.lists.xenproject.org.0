Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C612B49E2E5
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jan 2022 13:56:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.261465.452754 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nD4KK-0004fz-Fd; Thu, 27 Jan 2022 12:56:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 261465.452754; Thu, 27 Jan 2022 12:56:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nD4KK-0004dW-C8; Thu, 27 Jan 2022 12:56:36 +0000
Received: by outflank-mailman (input) for mailman id 261465;
 Thu, 27 Jan 2022 12:56:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NFuB=SL=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1nD4KJ-0004dL-6n
 for xen-devel@lists.xenproject.org; Thu, 27 Jan 2022 12:56:35 +0000
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [2a00:1450:4864:20::131])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8da4cf63-7f70-11ec-8f75-fffcc8bd4f1a;
 Thu, 27 Jan 2022 13:56:33 +0100 (CET)
Received: by mail-lf1-x131.google.com with SMTP id a28so5135120lfl.7
 for <xen-devel@lists.xenproject.org>; Thu, 27 Jan 2022 04:56:33 -0800 (PST)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id t17sm1876135lja.132.2022.01.27.04.56.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Jan 2022 04:56:32 -0800 (PST)
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
X-Inumbo-ID: 8da4cf63-7f70-11ec-8f75-fffcc8bd4f1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=sIK+HPr2dbtcAxBYALkkWoHzFT6nz1wIP0aIR9+EnKc=;
        b=Y0YRF+OI1bweq0fCTJRzQ88tf02SpUfduD8cGlmt+Gu0soc6Rfhd1+yJ9YGUxHeXha
         XKYvlOl12sQQL4ozhp39fWRdGU2JAfvKb9QIIeSEt7V7XYuAg53u0xAvIGoScQo/boJi
         LaHAPiGj8KEPDDEzS14V2h8VFjAQyUrL1D0T+k06LDDqIPDD1lktVuS40DBg/dviH06R
         LP3NXFpe5nAe2P2K2zpP9vZ54pJKILHDGg7VwXgHBVPjzcB1Qud6ZWnxm1vefstDM63e
         RYY65NIN9uq3qbdaDvj4emTMfAv7yMCpzmkc2AYTMw+dLOTaqnop6T/riBfWBIXjv5lP
         8guQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=sIK+HPr2dbtcAxBYALkkWoHzFT6nz1wIP0aIR9+EnKc=;
        b=s0g5LzoRcNOrBktsE2Gw3L70DC8a9aXNS38x9Ost+vvY/McMD7LMX03NDbMDkDWFMn
         0GnLAFRJ8XQ/Q/O/a8g9evijT6NDwJMuhJpVrAoOr3n3sCNo/N5ubfiYnLP6E2KIMao7
         hbYWndxkrkgVObclA7qp+b9nQo6z///PpZ5+p74e1RzWn6wZ0FNgNTV3ZTGIf/clQNGE
         78B0Vl018kH9NyiXWE3K0QwUBGCmGZcTavso/ie4wPkKiPQHvq7ojNeh9EHMT6DXb6Yu
         zuiltkyBOAa0nqKLF3YLM9ku7Bl7vejcAwtJ4anYmQTA0tDvv1hWcvj1VPHo5o4dx79A
         eZcA==
X-Gm-Message-State: AOAM533cjvyklrJB67JJsIXH+o+jRlB2z7BW49jHmaEDU8O24GGbKpr7
	B4/JJBcX7Knxkq/+AyZh2ho=
X-Google-Smtp-Source: ABdhPJyubd/NF4cgzD8ROo/1cFgiy+l8yg/gAAS5lMmQDy161rGB1U+fvacqGdvVB+I5ty8fkHKWJg==
X-Received: by 2002:a19:c210:: with SMTP id l16mr2908437lfc.362.1643288192625;
        Thu, 27 Jan 2022 04:56:32 -0800 (PST)
Subject: Re: [PATCH V2 00/10] Add support for Renesas R-Car S4 IPMMU and other
 misc changes
To: Julien Grall <julien@xen.org>
Cc: xen-devel@lists.xenproject.org,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>, Jan Beulich
 <jbeulich@suse.com>, Paul Durrant <paul@xen.org>,
 Rahul Singh <rahul.singh@arm.com>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
References: <1640034957-19764-1-git-send-email-olekstysh@gmail.com>
 <485dd117-f8f0-e0fc-e3bc-7e430813648e@xen.org>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <f08ebfc0-a208-88d7-e442-18a2603a6728@gmail.com>
Date: Thu, 27 Jan 2022 14:56:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <485dd117-f8f0-e0fc-e3bc-7e430813648e@xen.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US


On 27.01.22 14:36, Julien Grall wrote:
> Hi,


Hi Julien


>
> On 20/12/2021 21:15, Oleksandr Tyshchenko wrote:
>> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>>
>> Hello all.
>>
>> You can find the V1 patch series at [1].
>>
>> The R-Car S4 is an automotive System-on-Chip (SoC) for Car 
>> Server/Communication
>> Gateway and is one of the first products in Renesas’ 4th-generation 
>> R-Car Family.
>>
>> The integrated IOMMU HW is also VMSA-compatible and supports stage 2 
>> translation
>> table format, therefore can be used with current R-Car Gen3 driver 
>> with slight
>> modifications.
>>
>> In the context of Xen driver the main differences between Gen3 and 
>> Gen4 are
>> the following:
>>   - HW capacity was enlarged to support up to 16 IPMMU contexts (sets 
>> of page table)
>>     and up to 64 micro-TLBs per IPMMU device
>>   - the memory mapped registers have different bases and offset
>>
>> The first part (commits #1-6) is a non-verbatim port of Linux 
>> upstream commits
>> needed to add support for S4 series easily (prereq work).
>> The second part (commits #7-8) is based on the code from the Renesas 
>> BSP and
>> actually introduces support for R-Car S4 IPMMU.
>> The third part (commits #9-10) is misc changes I have locally.
>>
>> The patch series is based on the latest staging branch
>> "f3999bc2e099 arm/efi: Handle Xen bootargs from both xen.cfg and DT"
>> and also available at [2].
>>
>> Tested on Renesas Salvator-X board with H3 ES3.0 SoC (Gen3) and 
>> Renesas Spider
>> board with S4 SoC (Gen4).
>>
>> [1] 
>> https://lore.kernel.org/all/1638035505-16931-1-git-send-email-olekstysh@gmail.com/
>> [2] https://github.com/otyshchenko1/xen/commits/s4_ipmmu_ml2
>>
>>
>> Oleksandr Tyshchenko (10):
>>    iommu/ipmmu-vmsa: Remove all unused register definitions
>>    iommu/ipmmu-vmsa: Add helper functions for MMU "context" registers
>>    iommu/ipmmu-vmsa: Add helper functions for "uTLB" registers
>>    iommu/ipmmu-vmsa: Add light version of Linux's ipmmu_features
>>    iommu/ipmmu-vmsa: Calculate context registers' offset instead of a
>>      macro
>>    iommu/ipmmu-vmsa: Add utlb_offset_base
>>    iommu/ipmmu-vmsa: Add Renesas R8A779F0 (R-Car S4) support
>>    iommu/ipmmu-vmsa: Set IPMMU bit IMSCTLR_USE_SECGRP to 0
>
> For the first 8 patches:
>
> Acked-by: Julien Grall <jgrall@amazon.com>

Thank you!


>
> I have also committed them. The last..
>
>>    iommu/ipmmu-vmsa: Use refcount for the micro-TLBs
>>    iommu/arm: Remove code duplication in all IOMMU drivers
>
> ... 2 patches have some comments. So I have committed them yet.

ok, I will update them and re-push probably today.


>
>
> Cheers,
>
-- 
Regards,

Oleksandr Tyshchenko


