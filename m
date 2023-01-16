Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AA26666B937
	for <lists+xen-devel@lfdr.de>; Mon, 16 Jan 2023 09:43:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.478435.741628 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHL5V-0001pm-OD; Mon, 16 Jan 2023 08:43:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 478435.741628; Mon, 16 Jan 2023 08:43:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHL5V-0001nD-Kl; Mon, 16 Jan 2023 08:43:29 +0000
Received: by outflank-mailman (input) for mailman id 478435;
 Mon, 16 Jan 2023 08:43:27 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pHL5T-0001n7-J9
 for xen-devel@lists.xenproject.org; Mon, 16 Jan 2023 08:43:27 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pHL5T-0000HJ-6T; Mon, 16 Jan 2023 08:43:27 +0000
Received: from 54-240-197-230.amazon.com ([54.240.197.230] helo=[192.168.9.85])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pHL5T-0002PR-0Q; Mon, 16 Jan 2023 08:43:27 +0000
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
	bh=SyqcjB7poyYQQc1LwMdKNmAV23Qfyh7R9AJhpPATybU=; b=uRLq+IV80fGZzEZqBmxuH4PMR2
	3dWPEF9LD6Ux/2xl2mscDTzyvF+Au3xZthMUL02+Nu1mnCdyvPc/IxLVsS6lWLKIQof32OYpc7oye
	etjBcBrBBHIBYRn0MNM+QgPF64SH+VhfzCP7sNDDHrPQIkd9ymwc5w9SEI0Fwu1WN/jU=;
Message-ID: <a366d06c-d078-b19c-793d-5bfc1943b05a@xen.org>
Date: Mon, 16 Jan 2023 08:43:25 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v4 09/14] xen/arm32: head: Remove restriction where to
 load Xen
Content-Language: en-US
To: Luca Fancellu <Luca.Fancellu@arm.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Julien Grall <jgrall@amazon.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20230113101136.479-1-julien@xen.org>
 <20230113101136.479-10-julien@xen.org>
 <859E7F71-489B-4DD3-A4B2-9AD0DE19837D@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <859E7F71-489B-4DD3-A4B2-9AD0DE19837D@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Luca,

On 13/01/2023 14:58, Luca Fancellu wrote:
>> +/*
>> + * Remove the temporary mapping of Xen starting at TEMPORARY_XEN_VIRT_START.
>> + *
>> + * Clobbers r0 - r1
> 
> NIT: r0 - r3?

Yes. I have updated the version in my tree.

> 
>> + */
>> +remove_temporary_mapping:
>> +        /* r2:r3 := invalid page-table entry */
>> +        mov   r2, #0
>> +        mov   r3, #0
>> +
>> +        adr_l r0, boot_pgtable
>> +        mov_w r1, TEMPORARY_XEN_VIRT_START
>> +        get_table_slot r1, r1, 1     /* r1 := first slot */
>> +        lsl   r1, r1, #3             /* r1 := first slot offset */
>> +        strd  r2, r3, [r0, r1]
>> +
>> +        flush_xen_tlb_local r0
>> +
>> +        mov  pc, lr
>> +ENDPROC(remove_temporary_mapping)
>> +
> 
> The rest looks good to me, I’ve also built for arm64/32 and test this patch on fvp aarch32 mode,
> booting Dom0 and creating/running/destroying some guests.
> 
> Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>
> Tested-by: Luca Fancellu <luca.fancellu@arm.com>

Thanks!

Cheers,

-- 
Julien Grall

