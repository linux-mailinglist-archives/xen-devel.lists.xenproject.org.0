Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 78CD1444818
	for <lists+xen-devel@lfdr.de>; Wed,  3 Nov 2021 19:17:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.221110.382647 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1miKpM-0004fP-Ky; Wed, 03 Nov 2021 18:17:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 221110.382647; Wed, 03 Nov 2021 18:17:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1miKpM-0004dE-Hu; Wed, 03 Nov 2021 18:17:36 +0000
Received: by outflank-mailman (input) for mailman id 221110;
 Wed, 03 Nov 2021 18:17:35 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1miKpL-0004d8-BA
 for xen-devel@lists.xenproject.org; Wed, 03 Nov 2021 18:17:35 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1miKpJ-0006o1-LR; Wed, 03 Nov 2021 18:17:33 +0000
Received: from [54.239.6.186] (helo=[192.168.4.55])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1miKpJ-0006rc-FH; Wed, 03 Nov 2021 18:17:33 +0000
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
	bh=7Fe2Vk7Bbp+o4e+kEkMw0HfqrGYbgOAcS/y4c7VJSU0=; b=xxviETfNVqZrgqEOgNbYj1ywd+
	rriKUIP71Qck2JIApY6AuI1p+NOgHHZX2cdk9OGJvg3qnn4XBlQ1Q8OgHPNAeAJ3W7sIwVeHoqH/U
	RCH0nLDdtgnO6UFrMJk0K2/QkK5bynB+R8YjJ8sS2M0U52uxFcq/zpFNkwIb1UH1SZPk=;
Message-ID: <568d087e-d740-47e2-173e-34915f645a76@xen.org>
Date: Wed, 3 Nov 2021 18:17:31 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.2.1
Subject: Re: [PATCH-4.16 v2] xen/arm: fix SBDF calculation for vPCI MMIO
 handlers
To: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "iwj@xenproject.org" <iwj@xenproject.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Rahul Singh <rahul.singh@arm.com>
References: <20211102112041.551369-1-andr2000@gmail.com>
 <alpine.DEB.2.21.2111021545130.18170@sstabellini-ThinkPad-T480s>
 <4559d7c6-7a03-54c0-ca93-9319cc7989d5@epam.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <4559d7c6-7a03-54c0-ca93-9319cc7989d5@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Oleksandr,

On 03/11/2021 12:08, Oleksandr Andrushchenko wrote:
> 
> 
> On 03.11.21 00:47, Stefano Stabellini wrote:
>> On Tue, 2 Nov 2021, Oleksandr Andrushchenko wrote:
>>> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
>>>
>>> While in vPCI MMIO trap handlers for the guest PCI host bridge it is not
>>> enough for SBDF translation to simply call VPCI_ECAM_BDF(info->gpa) as
>>> the base address may not be aligned in the way that the translation
>>> always work. If not adjusted with respect to the base address it may not be
>>> able to properly convert SBDF.
>>> Fix this by adjusting the gpa with respect to the host bridge base address
>>> in a way as it is done for x86.
>>>
>>> Please note, that this change is not strictly required given the current
>>> value of GUEST_VPCI_ECAM_BASE which has bits 0 to 27 clear, but could cause
>>> issues if such value is changed, or when handlers for dom0 ECAM
>>> regions are added as those will be mapped over existing hardware
>>> regions that could use non-aligned base addresses.
>>>
>>> Fixes: d59168dc05a5 ("xen/arm: Enable the existing x86 virtual PCI support for ARM")
>>>
>>> Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
>> Acked-by: Stefano Stabellini <sstabellini@kernel.org>
>>
>> Also, Ian already gave his release-ack.
> Thank you,
> Do I need to resend the patch with Acks? Or hopefully those can be applied
> on commit?

I have committed with the two tags applied.

Next time, please remember to carry Release-acked-by tag.

Cheers,

-- 
Julien Grall

