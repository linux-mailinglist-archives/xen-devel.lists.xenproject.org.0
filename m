Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BD7B93A19A
	for <lists+xen-devel@lfdr.de>; Tue, 23 Jul 2024 15:33:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.763188.1173438 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWFe0-0001nM-Od; Tue, 23 Jul 2024 13:33:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 763188.1173438; Tue, 23 Jul 2024 13:33:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWFe0-0001lO-Lf; Tue, 23 Jul 2024 13:33:32 +0000
Received: by outflank-mailman (input) for mailman id 763188;
 Tue, 23 Jul 2024 13:33:31 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1sWFdz-0001lG-Ar
 for xen-devel@lists.xenproject.org; Tue, 23 Jul 2024 13:33:31 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1sWFdz-0006y2-3V; Tue, 23 Jul 2024 13:33:31 +0000
Received: from [15.248.3.91] (helo=[10.24.67.27])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1sWFdy-0005A3-Sw; Tue, 23 Jul 2024 13:33:31 +0000
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
	bh=SAMK5war2TKO+z4T1Cms+6u448HsnSfz/ule6zcWtyI=; b=ErvWSPM93sg0rgPPd+B9wlGqs7
	SVoSK1b6ckDJ814Ha2WpqwSW4Z2E3m/2Iu4z0YysqL/CyD4A7apaV5Ix88VZQ/QlKuT05KjtFmGKU
	RSZ/xKFi3Jb51t3UjIf919WKhJe7DSs/H/THQa83yfOO/AW+ZowEM6a32YmoD9tDn5Oo=;
Message-ID: <23b6ffc8-6965-4a67-a809-0145821ff5f8@xen.org>
Date: Tue, 23 Jul 2024 14:33:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/8] xen/riscv: setup fixmap mapping
Content-Language: en-GB
To: oleksii.kurochko@gmail.com, xen-devel@lists.xenproject.org
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Jan Beulich <jbeulich@suse.com>, Stefano Stabellini <sstabellini@kernel.org>
References: <cover.1720799925.git.oleksii.kurochko@gmail.com>
 <b1776fb20603cb56b0aea17ef998ea951d2bbda9.1720799926.git.oleksii.kurochko@gmail.com>
 <8fd1cc2c-9dda-4e74-b242-fe8aa862955d@xen.org>
 <fad84a0af0ce578c0c9cb63131e992957ccd9eba.camel@gmail.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <fad84a0af0ce578c0c9cb63131e992957ccd9eba.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 23/07/2024 14:27, oleksii.kurochko@gmail.com wrote:
> Hello Julien,

Hi Oleksii,


> On Sun, 2024-07-21 at 09:46 +0100, Julien Grall wrote:
>>> diff --git a/xen/arch/riscv/mm.c b/xen/arch/riscv/mm.c
>>> index 7d09e781bf..d69a174b5d 100644
>>> --- a/xen/arch/riscv/mm.c
>>> +++ b/xen/arch/riscv/mm.c
>>> @@ -49,6 +49,9 @@ stage1_pgtbl_root[PAGETABLE_ENTRIES];
>>>     pte_t __section(".bss.page_aligned") __aligned(PAGE_SIZE)
>>>     stage1_pgtbl_nonroot[PGTBL_INITIAL_COUNT * PAGETABLE_ENTRIES];
>>>     
>>> +pte_t __section(".bss.page_aligned") __aligned(PAGE_SIZE)
>>> +xen_fixmap[PAGETABLE_ENTRIES];
>>
>> Can you add a BUILD_BUG_ON() to check that the number of entries in
>> the
>> fixmap will never be above PAGETABLE_ENTRIES?
> I just realized that we don't have the information about how many
> entries has been used. Am I confusing something?

I think we do. It is FIX_LAST.

Cheers,

-- 
Julien Grall

