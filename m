Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BFB24B40227
	for <lists+xen-devel@lfdr.de>; Tue,  2 Sep 2025 15:11:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1106454.1457129 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utQnS-0004xE-9V; Tue, 02 Sep 2025 13:11:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1106454.1457129; Tue, 02 Sep 2025 13:11:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utQnS-0004uY-6l; Tue, 02 Sep 2025 13:11:38 +0000
Received: by outflank-mailman (input) for mailman id 1106454;
 Tue, 02 Sep 2025 13:11:37 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1utQnR-0004uP-DR
 for xen-devel@lists.xenproject.org; Tue, 02 Sep 2025 13:11:37 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1utQnQ-002tcf-1F;
 Tue, 02 Sep 2025 13:11:36 +0000
Received: from [15.248.2.30] (helo=[10.24.67.22])
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1utQnQ-00D78H-0j;
 Tue, 02 Sep 2025 13:11:36 +0000
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
	bh=mC41VI5MEHMjOTOTJQ7W0jtVQK8dAltVIkznSrmdRbA=; b=hBNM1IMLOcHWE8g8l4KECEi6Ca
	cZU9EkJtZj0WEcrKHUg0BDpIgL7zDE48VBpHjdZp+xLaRR8AkHkmcAuHPnzyKrBMjgt5rux0Uu2F0
	HKY1lseH2baoGn2vOSR6cZt281Abysn3IJmJ326RBvvHrNKmGl4sSzBuEj49dR3MmRDw=;
Message-ID: <825ff920-7c7c-4d4b-bfa5-f7238877c246@xen.org>
Date: Tue, 2 Sep 2025 14:11:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 04/12] xen/arm/irq: add handling for IRQs in the eSPI
 range
Content-Language: en-GB
To: Leonid Komarianskyi <Leonid_Komarianskyi@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: "olekstysh@gmail.com" <olekstysh@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1756481577.git.leonid_komarianskyi@epam.com>
 <e0f76a1533332cef68bfaacbdf57fd05f27764a6.1756481577.git.leonid_komarianskyi@epam.com>
 <2e91a95a-3109-46ae-b796-1a1c50a9ac2d@xen.org>
 <4c3a2a94-7c19-4d1a-8477-c38716170c49@epam.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <4c3a2a94-7c19-4d1a-8477-c38716170c49@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 02/09/2025 09:56, Leonid Komarianskyi wrote:
>>> diff --git a/xen/arch/arm/include/asm/irq.h b/xen/arch/arm/include/
>>> asm/irq.h
>>> index 5bc6475eb4..4443799648 100644
>>> --- a/xen/arch/arm/include/asm/irq.h
>>> +++ b/xen/arch/arm/include/asm/irq.h
>>> @@ -32,6 +32,13 @@ struct arch_irq_desc {
>>>    #define SPI_MAX_INTID   1019
>>>    #define LPI_OFFSET      8192
>>> +#define ESPI_BASE_INTID 4096
>>> +#define ESPI_MAX_INTID  5119
>>> +#define NR_ESPI_IRQS    1024
>>> +
>>> +#define ESPI_INTID2IDX(intid) ((intid) - ESPI_BASE_INTID)
>>> +#define ESPI_IDX2INTID(idx)   ((idx) + ESPI_BASE_INTID)
>>
>> NIT: I would consider adding sanity check (i.e. ASSERT()) to confirm
>> that both ``intid`` and ``idx`` are within the bounds.
>>
> 
> Okay, I will add sanity check with ASSERTs in V6 (similar to
> GNTPIN_incr2oflow_mask):
> 
> #define ESPI_INTID2IDX(intid)                           \
>       ({                                                  \
>           ASSERT(((intid) >= ESPI_BASE_INTID) &&          \
>                  ((intid) <= ESPI_MAX_INTID));            \
>           ((intid) - ESPI_BASE_INTID);                    \
>       })

If you are using a macro, then you will need to stash "intid" in a local 
variable. Otherwise, it would be evaluated multiple time.

The alternative is to use a static inline helper which is usually preferred.

Cheers,

-- 
Julien Grall


