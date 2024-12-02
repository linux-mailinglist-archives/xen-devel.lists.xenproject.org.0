Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A95A29E0D5F
	for <lists+xen-devel@lfdr.de>; Mon,  2 Dec 2024 21:53:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.847096.1262231 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tIDQD-00015D-Ig; Mon, 02 Dec 2024 20:53:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 847096.1262231; Mon, 02 Dec 2024 20:53:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tIDQD-00013S-G7; Mon, 02 Dec 2024 20:53:33 +0000
Received: by outflank-mailman (input) for mailman id 847096;
 Mon, 02 Dec 2024 20:53:32 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1tIDQC-00013M-Mg
 for xen-devel@lists.xenproject.org; Mon, 02 Dec 2024 20:53:32 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1tIDQB-000P28-31;
 Mon, 02 Dec 2024 20:53:32 +0000
Received: from [2a02:8012:3a1:0:c6e:c614:26eb:b495]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1tIDQC-00BA1Q-07;
 Mon, 02 Dec 2024 20:53:32 +0000
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
	bh=pdua7B8mNdKb+SIbBcojmnt/LkJXGdP3vi9aKM8Zp1o=; b=aJPigXqoiiTUnA8M6DMN9h41oG
	ROx5/LD129mZ9G8vFCYVnhhZOeKdJpwgQgRk6mdQtoq/p9VeM4V3TeetTZwVL3XZfe2gqBbNPthKu
	wqIxpDDdOjg5SrCcfH0g8pAk8BXPFQ12h7n3waQv6yxrG38yjgCM4/A98o3K10oJXMpk=;
Message-ID: <c44686fc-f4c0-428a-8a3f-ce17a7c589ae@xen.org>
Date: Mon, 2 Dec 2024 20:53:30 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] xen/mpu: Map early uart when earlyprintk on
Content-Language: en-GB
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
 xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20241127183906.485824-1-ayan.kumar.halder@amd.com>
 <20241127183906.485824-2-ayan.kumar.halder@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20241127183906.485824-2-ayan.kumar.halder@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Ayan,

On 27/11/2024 18:39, Ayan Kumar Halder wrote:
> CONFIG_EARLY_UART_SIZE is introduced to let user provide physical size of
> early UART. Unlike MMU where we map a page in the virtual address space,
> here we need to know the exact physical size to be mapped.
> As VA == PA in case of MPU, the memory layout follows exactly the hardware
> configuration. As a consequence, we set  EARLY_UART_VIRTUAL_ADDRESS as physical
> address.
> 
> EARLY_UART_BASE_ADDRESS and EARLY_UART_SIZE should be aligned to the minimum
> size of MPU region (ie 64 bits) as per the hardware restrictions. Refer ARM
> DDI 0600A.d ID120821 A1.3 "A minimum protection region size of 64 bytes.".
> 
> UART is mapped as nGnRE region (as specified by ATTR=100 , refer G1.3.13,
> MAIR_EL2, "---0100 Device memory nGnRE") and Doc ID - 102670_0101_02_en

I can't find the Doc you point online. Do you have a link?

> Table 4-3, Armv8 architecture memory types (nGnRE - Corresponds to Device in
> Armv7 architecture). Also, it is mapped as outer shareable, RW at EL2 only

I don't quite understand why you mention Armv7 here. The code you modify 
below is 64-bit so Armv8 only.

The code itself LGTM.

Cheers,

-- 
Julien Grall


