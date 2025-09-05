Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D42E3B45421
	for <lists+xen-devel@lfdr.de>; Fri,  5 Sep 2025 12:10:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1111620.1460268 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uuTOX-0002Bn-TI; Fri, 05 Sep 2025 10:10:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1111620.1460268; Fri, 05 Sep 2025 10:10:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uuTOX-00029b-Pp; Fri, 05 Sep 2025 10:10:13 +0000
Received: by outflank-mailman (input) for mailman id 1111620;
 Fri, 05 Sep 2025 10:10:12 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1uuTOW-00029V-23
 for xen-devel@lists.xenproject.org; Fri, 05 Sep 2025 10:10:12 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1uuTOV-007tRl-1C;
 Fri, 05 Sep 2025 10:10:11 +0000
Received: from [2a02:8012:3a1:0:9f:253:13d3:5d9d]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1uuTOV-00Gs9s-16;
 Fri, 05 Sep 2025 10:10:11 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=SOfyh9JD2Fcl6HSxOt3lF99rAao8mJmQTxYNdIE8CvI=; b=BBa0WkEMF80NurcmZV90qlxIrb
	PlKWZzBEKSTWblj9v3WPxion7gdcUMHilAZ/BqttlVBBmI/Nb0JN1GCNYt591qww2IZlU0gfCcrZ9
	pBC/e6NlA0Sl4nvdf4HhxFR38frdsVr971LynJ127Vvijd+FvORiHycsk/v0EBl/47C0=;
Message-ID: <3ffc2a0e-b8f8-4e89-833b-8308dcdb8fbf@xen.org>
Date: Fri, 5 Sep 2025 11:10:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 04/12] xen/arm/irq: add handling for IRQs in the eSPI
 range
Content-Language: en-GB
To: Leonid Komarianskyi <Leonid_Komarianskyi@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: "olekstysh@gmail.com" <olekstysh@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1757015865.git.leonid_komarianskyi@epam.com>
 <8b43ad89380261c3a3bbd0bc943461226d9cf0ce.1757015865.git.leonid_komarianskyi@epam.com>
 <3a487f5c-0837-46b4-ad17-410a4a4bc78a@xen.org>
 <00bfaf5c-c502-4792-a426-015f72dfc2db@epam.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <00bfaf5c-c502-4792-a426-015f72dfc2db@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 05/09/2025 11:05, Leonid Komarianskyi wrote:
> On 05.09.25 10:10, Julien Grall wrote:
>> Hi Leonid,
>>
>> On 04/09/2025 21:01, Leonid Komarianskyi wrote:
>>> diff --git a/xen/arch/arm/include/asm/irq.h b/xen/arch/arm/include/
>>> asm/irq.h
>>> index 5bc6475eb4..2ff2d07d6d 100644
>>> --- a/xen/arch/arm/include/asm/irq.h
>>> +++ b/xen/arch/arm/include/asm/irq.h
>>> @@ -32,6 +32,10 @@ struct arch_irq_desc {
>>>    #define SPI_MAX_INTID   1019
>>>    #define LPI_OFFSET      8192
>>> +#define ESPI_BASE_INTID 4096
>>> +#define ESPI_MAX_INTID  5119
>>> +#define NR_ESPI_IRQS    1024
>>> +
>>>    /* LPIs are always numbered starting at 8192, so 0 is a good invalid
>>> case. */
>>>    #define INVALID_LPI     0
>>> @@ -39,7 +43,12 @@ struct arch_irq_desc {
>>>    #define INVALID_IRQ     1023
>>>    extern const unsigned int nr_irqs;
>>> +#ifdef CONFIG_GICV3_ESPI
>>> +/* This will cover the eSPI range, to allow asignmant of eSPIs to
>>> domains. */
>>
>> Typo: s/asignmant/assignment/
>>
>> [...]
>>
>>> Unless INTIDs from the eSPI
>>> + * range are mistakenly defined in Xen DTS when the appropriate
>>> config is
>>> + * disabled, this function will not be reached because is_espi will
>>> return
>>> + * false for non-eSPI INTIDs.
>>
>> I am still confused with this paragraph. How is this function can be
>> reached if it is compiled out? Surely, if the DT is misconfigured, we
>> should get an error when trying to route the interrupt. No? If so, can
>> you point me to that code?
>>
>> Cheers,
>>
> 
> Oh, sorry, the second part of the comment is redundant with the current
> implementation. It was correct when the function had an implementation
> and returned NULL. The correct comment is:
> 
> Defined as a prototype as it should not be called if
> CONFIG_GICV3_ESPI=n. Without CONFIG_GICV3_ESPI, the additional 1024 IRQ
> descriptors will not be defined, and thus, they cannot be used.
> 
> Should I prepare V8 with the comment fix, or can this be corrected on
> commit?

I should be able to update it while committing.

Cheers,

-- 
Julien Grall


