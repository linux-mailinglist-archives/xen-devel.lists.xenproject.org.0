Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F1A3182BEB5
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jan 2024 11:44:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.666786.1037665 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rOF1A-0006jz-Ju; Fri, 12 Jan 2024 10:44:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 666786.1037665; Fri, 12 Jan 2024 10:44:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rOF1A-0006hp-Gb; Fri, 12 Jan 2024 10:44:04 +0000
Received: by outflank-mailman (input) for mailman id 666786;
 Fri, 12 Jan 2024 10:44:03 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rOF19-0006gS-5D
 for xen-devel@lists.xenproject.org; Fri, 12 Jan 2024 10:44:03 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rOF18-0006pW-QI; Fri, 12 Jan 2024 10:44:02 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rOF18-0006RG-JX; Fri, 12 Jan 2024 10:44:02 +0000
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
	bh=SorHYVzhbrvPQmwWtQnn8ZZLBM1LEpnc2+bkg5dKssE=; b=u1Lpt3XJ71O/Amnbg3XHD9wR8v
	lWUKQLo/KUTgM5WmI9r6fKIMSMMCDr205bfpDqRX74ZVqXzIogMtOiOsmmIl0BSoYcQxqyvg1MElg
	ot+wpN0rTYlrnfOJs3ijwlFGAtlWkOqt/n+nQGmFnGCUzQI4M419O1+8+IQSKYE9w2e0=;
Message-ID: <05cd75c4-5e67-4902-b3a5-1ec7701684ff@xen.org>
Date: Fri, 12 Jan 2024 10:44:00 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] xen/arm32: head: Rework how the fixmap and early
 UART mapping are prepared
Content-Language: en-GB
To: Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org
Cc: Julien Grall <jgrall@amazon.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20240111183410.45566-1-julien@xen.org>
 <20240111183410.45566-2-julien@xen.org>
 <a079dabf-b938-431b-bbde-1f15b3a9a757@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <a079dabf-b938-431b-bbde-1f15b3a9a757@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Michal,

On 12/01/2024 07:46, Michal Orzel wrote:
> On 11/01/2024 19:34, Julien Grall wrote:
>>
>>
>> From: Julien Grall <jgrall@amazon.com>
>>
>> Since commit 5e213f0f4d2c ("xen/arm32: head: Widen the use of the
>> temporary mapping"), boot_second (used to cover regions like Xen and
>> the fixmap) will not be mapped if the identity mapping overlap.
>>
>> So it is ok to prepare the fixmap table and link it in boot_second
>> earlier. With that, the fixmap can also be used earlier via the
>> temporary mapping.
>>
>> Therefore split setup_fixmap() in two:
>>      * The table is now linked in create_page_tables() because
>>        the boot page tables needs to be recreated for every CPU.
>>      * The early UART mapping is only added for the boot CPU0 as the
>>        fixmap table is not cleared when secondary CPUs boot.
>>
>> Signed-off-by: Julien Grall <jgrall@amazon.com>
> Reviewed-by: Michal Orzel <michal.orzel@amd.com>

Thanks.

> 
> with below 2 adjustments:

I will address them on commit.

>> +         */
>> +        mov_w r0, EARLY_UART_VIRTUAL_ADDRESS
>> +        create_mapping_entry xen_fixmap, r0, r11, type=PT_DEV_L3
> Would you mind listing r11 in the Input section of a comment?

I have added:

r11: UART physical address

> 
> ~Michal

-- 
Julien Grall

