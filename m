Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C527B3794B3
	for <lists+xen-devel@lfdr.de>; Mon, 10 May 2021 18:58:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.125377.236000 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lg9Et-0006Km-3I; Mon, 10 May 2021 16:58:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 125377.236000; Mon, 10 May 2021 16:58:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lg9Et-0006Is-0B; Mon, 10 May 2021 16:58:39 +0000
Received: by outflank-mailman (input) for mailman id 125377;
 Mon, 10 May 2021 16:58:37 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lg9Eq-0006Im-VX
 for xen-devel@lists.xenproject.org; Mon, 10 May 2021 16:58:36 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lg9Eq-0001Yo-MM; Mon, 10 May 2021 16:58:36 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lg9Eq-0005rF-Ge; Mon, 10 May 2021 16:58:36 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=NyujeM3T0IpczxTYLEBttv+KFwnO26q5AkcjabW6pbU=; b=OREN/ysARrPiM9eWqtkZsc+N4P
	glMgsmR6O2shmX4eLGAb3JrxmGl++yjkgjw8/qGOXYd6ZMuKd+gJdnCbxwEoH+FeEOQLSYziqrmut
	ZqUTzdEVsyCAMsZy50v1y2+vLBxPGbPkHzYIklqq90bcCfNrJ2fz23Nbnabf/T8UOFRs=;
Subject: Re: Discussion of Xenheap problems on AArch64
To: Henry Wang <Henry.Wang@arm.com>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Wei Chen <Wei.Chen@arm.com>, Penny Zheng <Penny.Zheng@arm.com>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>
References: <PA4PR08MB6253F49C13ED56811BA5B64E92479@PA4PR08MB6253.eurprd08.prod.outlook.com>
 <cdde98ca-4183-c92b-adca-801330992fc5@xen.org>
 <PA4PR08MB62538BBA256E66A0415F0C7192479@PA4PR08MB6253.eurprd08.prod.outlook.com>
 <f14aa1d6-35d2-a9a3-0672-7f0d3ae3ec89@xen.org>
 <PA4PR08MB62534C4130B59CAA9A8A8BF792419@PA4PR08MB6253.eurprd08.prod.outlook.com>
 <PA4PR08MB6253FBC7F5E690DB74F2E11F92409@PA4PR08MB6253.eurprd08.prod.outlook.com>
 <2a65b8c0-fccc-2ccc-f736-7f3f666e84d1@xen.org>
 <PA4PR08MB62537A958107CD234831E0B892579@PA4PR08MB6253.eurprd08.prod.outlook.com>
From: Julien Grall <julien@xen.org>
Message-ID: <ba649865-410b-e1be-39a3-c4cac802f464@xen.org>
Date: Mon, 10 May 2021 17:58:34 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <PA4PR08MB62537A958107CD234831E0B892579@PA4PR08MB6253.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Henry,

On 07/05/2021 05:06, Henry Wang wrote:
>> From: Julien Grall <julien@xen.org>
>> On 28/04/2021 10:28, Henry Wang wrote:
>>> Hi Julien,
>>
>> Hi Henry,
>>
>>>
>>> I've done some test about the patch series in
>>> https://xenbits.xen.org/gitweb/?p=people/julieng/xen-
>> unstable.git;a=shortlog;h=refs/heads/pt/rfc-v2
>>>
>>
>> Thanks you for the testing. Some questions below.
>>
>> I am a bit confused with the output with and without my patches. Both of
>> them are showing a data abort in clear_page().
>>
>> Above, you suggested that there is a big gap between the two memory
>> banks. Are the banks still point to actual RAM?
> 
> Another sorry for the very late reply, we had a 5 day public holiday in
> China and it also took me some time to figure out how to configure the
> FVP (it turned out I have to set -C bp.secure_memory=false to access
> some parts of memory higher than 4G).

No worries. I never tried to tweak the memory layout on the FVP before. 
It is good to know it can be done to properly test memory issue :).

[...]

> when I continue booting Xen, I got following error log:
> 
> (XEN) CPU:    0
> (XEN) PC:     00000000002b5a5c alloc_boot_pages+0x94/0x98
> (XEN) LR:     00000000002ca3bc
> (XEN) SP:     00000000002ffde0
> (XEN) CPSR:   600003c9 MODE:64-bit EL2h (Hypervisor, handler)
> (XEN)
> (XEN)   VTCR_EL2: 80000000
> (XEN)  VTTBR_EL2: 0000000000000000
> (XEN)
> (XEN)  SCTLR_EL2: 30cd183d
> (XEN)    HCR_EL2: 0000000000000038
> (XEN)  TTBR0_EL2: 000000008413c000
> (XEN)
> (XEN)    ESR_EL2: f2000001
> (XEN)  HPFAR_EL2: 0000000000000000
> (XEN)    FAR_EL2: 0000000000000000
> (XEN)
> (XEN) Xen call trace:
> (XEN)    [<00000000002b5a5c>] alloc_boot_pages+0x94/0x98 (PC)
> (XEN)    [<00000000002ca3bc>] setup_frametable_mappings+0xa4/0x108 (LR)
> (XEN)    [<00000000002ca3bc>] setup_frametable_mappings+0xa4/0x108
> (XEN)    [<00000000002cb988>] start_xen+0x344/0xbcc
> (XEN)    [<00000000002001c0>] arm64/head.o#primary_switched+0x10/0x30
> (XEN)
> (XEN) ****************************************
> (XEN) Panic on CPU 0:
> (XEN) Xen BUG at page_alloc.c:432
> (XEN) ****************************************

This is happening without my patch series applied, right? If so, what 
happen if you apply it?

Cheers,

-- 
Julien Grall

