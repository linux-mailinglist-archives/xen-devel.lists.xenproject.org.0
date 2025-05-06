Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B54B4AAC6F7
	for <lists+xen-devel@lfdr.de>; Tue,  6 May 2025 15:52:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.977293.1364325 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCIiJ-0006Ce-On; Tue, 06 May 2025 13:52:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 977293.1364325; Tue, 06 May 2025 13:52:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCIiJ-0006AW-MF; Tue, 06 May 2025 13:52:03 +0000
Received: by outflank-mailman (input) for mailman id 977293;
 Tue, 06 May 2025 13:52:02 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1uCIiI-0006AO-8r
 for xen-devel@lists.xenproject.org; Tue, 06 May 2025 13:52:02 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1uCIiH-00CiYm-2O;
 Tue, 06 May 2025 13:52:01 +0000
Received: from [2a02:8012:3a1:0:7157:32ca:2aea:33a3]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1uCIiH-001aEP-1f;
 Tue, 06 May 2025 13:52:01 +0000
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
	bh=LR6oFWnOrbso5QWX3Jmg1qf7AUc53JJNJlxQe3cQpss=; b=OfQ7PRdweNTWxR0NdPQW7q4RtL
	uBC67kfQcsmZSXfw2RAbCRacA3DVRfex43ASoWguCdvGJzowlbrO+KvgX0ONu6z/jgikn+4LJuNJV
	87OZmWdOaHFR90NUDiLxAcWbGxriNMkE/YrFDIe+IuMI6aWY+qCE/kBNGZmOw9E8IHOg=;
Message-ID: <02fde9e1-7833-4b22-ae56-e42687c1c26a@xen.org>
Date: Tue, 6 May 2025 14:51:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 6/7] arm/mpu: Provide a constructor for pr_t type
Content-Language: en-GB
To: Luca Fancellu <Luca.Fancellu@arm.com>,
 "Orzel, Michal" <Michal.Orzel@amd.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20250429152057.2380536-1-luca.fancellu@arm.com>
 <20250429152057.2380536-7-luca.fancellu@arm.com>
 <42eab292-f9f6-4bc1-a011-c657544ebaf5@amd.com>
 <23A4DA59-A279-45ED-B81C-3EEE72B79DE8@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <23A4DA59-A279-45ED-B81C-3EEE72B79DE8@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Luca,

On 06/05/2025 13:56, Luca Fancellu wrote:
>>> +/*
>>> + * Creates a pr_t structure describing a protection region.
>>> + *
>>> + * @base: base address as base of the protection region.
>>> + * @limit: exclusive address as limit of the protection region.
>>> + * @attr: attribute index for the memory type.
>>> + * @return: pr_t structure describing a protection region.
>>> + */
>>> +extern pr_t pr_of_xenaddr(paddr_t base, paddr_t limit, unsigned int attr_idx);
>> here. Please don't use extern in prototypes. It's not needed.
> 
> I see we have a mixed usage of this in arch/arm and it’s not documented to do otherwise
> in the code style, in this case I would prefer to be explicit unless it’s a strong objection on your side,
> let me know.

Old Arm code is using "extern". But new code should avoid it for prototypes.

Cheers,

-- 
Julien Grall


