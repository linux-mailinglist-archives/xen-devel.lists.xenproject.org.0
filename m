Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F3CFEA494C0
	for <lists+xen-devel@lfdr.de>; Fri, 28 Feb 2025 10:22:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.898549.1307080 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnwZV-00040Z-SZ; Fri, 28 Feb 2025 09:22:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 898549.1307080; Fri, 28 Feb 2025 09:22:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnwZV-0003yP-PP; Fri, 28 Feb 2025 09:22:17 +0000
Received: by outflank-mailman (input) for mailman id 898549;
 Fri, 28 Feb 2025 09:22:16 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1tnwZU-0003yJ-EQ
 for xen-devel@lists.xenproject.org; Fri, 28 Feb 2025 09:22:16 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1tnwZU-00AESX-1D;
 Fri, 28 Feb 2025 09:22:16 +0000
Received: from [2a02:8012:3a1:0:493f:83e7:39ed:f66c]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1tnwZT-00EeAw-33;
 Fri, 28 Feb 2025 09:22:16 +0000
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
	bh=h0ri3DJMQKdeoBFOOcA4OhAheGJd7xyUQiCH7qTo24A=; b=ITiQjf5TgmJEhLDes00ODB+pyg
	2ID3Oq1pnMtidnTjA7jmTt67L0SM1HyQ1fcxrutmyGHLN1RhVcI6cBkZ1AGJDdrN4RnByrIZHezp5
	4PCA9HMzY92eZ1fn6ZtPbxjP8NQNCkAvaUhPeYyLAkZmFiN+zANK16eUjASXgxsBuljM=;
Message-ID: <9f5f044f-447e-41f8-b981-3aa2a848d458@xen.org>
Date: Fri, 28 Feb 2025 09:22:14 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] xen/arm: mpu: Move some of the definitions to common
 file
Content-Language: en-GB
To: Luca Fancellu <Luca.Fancellu@arm.com>
Cc: Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20250204192357.1862264-1-ayan.kumar.halder@amd.com>
 <20250204192357.1862264-4-ayan.kumar.halder@amd.com>
 <18E074A3-A76B-4C9E-A8B4-8E23B07CB7B7@arm.com>
 <a593bbed-24de-464e-9fea-db988cc61f7b@xen.org>
 <CFF70353-90F6-4ED4-AEE7-155C4480AF98@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <CFF70353-90F6-4ED4-AEE7-155C4480AF98@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 26/02/2025 08:28, Luca Fancellu wrote:
> Hi Julien,

Hi Luca,

> 
>>>>
>>>> #ifdef CONFIG_EARLY_PRINTK
>>>> diff --git a/xen/arch/arm/include/asm/arm64/mpu.h b/xen/arch/arm/include/asm/mpu.h
>>> Why not in include/mpu/ ?
>>
>> Do you mean include/asm/mpu? or something different?
> 
> Yes, sorry typo, I mean include/asm/mpu/mpu.h

Thanks for the clarification. I don't have a strong opinion either way. 
I will let Ayan decide.

Cheers,

-- 
Julien Grall


