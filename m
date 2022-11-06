Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ACF1761E52F
	for <lists+xen-devel@lfdr.de>; Sun,  6 Nov 2022 18:59:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.438602.692617 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1orjvR-0007Vv-FQ; Sun, 06 Nov 2022 17:59:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 438602.692617; Sun, 06 Nov 2022 17:59:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1orjvR-0007TD-Ck; Sun, 06 Nov 2022 17:59:17 +0000
Received: by outflank-mailman (input) for mailman id 438602;
 Sun, 06 Nov 2022 17:59:16 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1orjvQ-0007T7-3A
 for xen-devel@lists.xenproject.org; Sun, 06 Nov 2022 17:59:16 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1orjvP-0004vm-9N; Sun, 06 Nov 2022 17:59:15 +0000
Received: from gw1.octic.net ([81.187.162.82] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1orjvP-0008Gd-4A; Sun, 06 Nov 2022 17:59:15 +0000
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
	bh=tGh41GQgcc9yOm1RfvIM0/hGRxq3kMn+34p7V0eU9SM=; b=bLcAqnZfWX6Qe/k/n3UyuOtXK1
	yyiX0ZBaoZK7nYnXiIG29G8BPmTiTKPpiwS/OsF+VJga4NkKQ5zTm3S+CRDQvw75cGDYjBKMXvmsl
	9yUrTmwjPQbFhqiobKjBYaku4QTq1aIeQe+b6Mve9TmKZxKqxESte2y84VvMdPUJNF00=;
Message-ID: <4aa5f449-a656-8df2-7bdd-c2dcf166c8b2@xen.org>
Date: Sun, 6 Nov 2022 17:59:13 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.1
Subject: Re: [XEN v2 02/12] xen/Arm: GICv3: Move the macros to compute the
 affnity level to arm64/arm32
To: Xenia Ragiadakou <burzalodowa@gmail.com>,
 Ayan Kumar Halder <ayankuma@amd.com>, xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, stefanos@xilinx.com, Volodymyr_Babchuk@epam.com,
 bertrand.marquis@arm.com
References: <20221031151326.22634-1-ayankuma@amd.com>
 <20221031151326.22634-3-ayankuma@amd.com>
 <d791158a-4f1b-9d6a-6bd4-8792da2217b2@xen.org>
 <8e36fec2-6df5-835c-f75a-f530c1a678e3@gmail.com>
 <9c4ca761-6ef4-d0e9-f496-27e0acaba95c@xen.org>
 <2cf591c5-df8c-d231-8862-e5c00b9a3698@gmail.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <2cf591c5-df8c-d231-8862-e5c00b9a3698@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Xenia,

On 02/11/2022 10:36, Xenia Ragiadakou wrote:
> Hi Julien,
> 
> On 11/2/22 12:10, Julien Grall wrote:
>> Hi Xenia,
>>
>> On 02/11/2022 09:57, Xenia Ragiadakou wrote:
>>>
>>> On 11/2/22 10:46, Julien Grall wrote:
>>>> Hi,
>>>>
>>>> Title: The macros you are moving are not GICv3 specific.
>>>>
>>>> On 31/10/2022 15:13, Ayan Kumar Halder wrote:
>>>>> Refer https://elixir.bootlin.com/linux/v6.1-rc1/source/arch/arm64/ \
>>>>> include/asm/cputype.h#L14 , for the macros specific for arm64.
>>>>>
>>>>> Refer 
>>>>> https://elixir.bootlin.com/linux/v6.1-rc1/source/arch/arm/include/ \
>>>>> asm/cputype.h#L54  , for the macros specific for arm32.
>>>>>
>>>>> MPIDR_LEVEL_SHIFT() differs between 64 and 32 bit. > For 64 bit :-
>>>>>
>>>>>   aff_lev3          aff_lev2 aff_lev1 aff_lev0
>>>>> |________|________|________|________|________|
>>>>> 40       32       24       16       8        0
>>>>>
>>>>> For 32 bit :-
>>>>>
>>>>>   aff_lev3 aff_lev2 aff_lev1 aff_lev0
>>>>> |________|________|________|________|
>>>>> 32       24       16       8        0
>>>>
>>>> As discussed with Michal, AFF3 doesn't exist for 32-bit. So it is 
>>>> not clear to me what we are gaining by moving the macros.
>>>>
>>>
>>> I cannot understand what do you mean by "what we are gaining by 
>>> moving the macros".
>>  >
>>> IIUC, when identifying the cpu topology, a mask is applied to the 
>>> value of MPIDR_EL1
>>> #ifdef CONFIG_ARM_64
>>> #define MPIDR_HWID_MASK     _AC(0xff00ffffff,UL)
>>> #else
>>> #define MPIDR_HWID_MASK     _AC(0xffffff,U)
>>> #endif
>>> So, for arm32, the affinity at level 3 is considered to be 0.
>>>
>>> Do you mean, what we are gaining by defining the MPIDR_LEVEL_SHIFT in 
>>> a different way for arm32 and for arm64?
>>
>> Yes. There are nothing justifying the move so far.
>>
>>>
>>> IMO, we need to do so, because the shift, used to retrieve the 
>>> affinity at each level, cannot be calculated using the same logic i.e
>>> (((1 << (level)) >> 1) << MPIDR_LEVEL_BITS_SHIFT)
>>>
>>> For arm32 the affinity at each level is calculated as follows
>>> ((level) << MPIDR_LEVEL_BITS_SHIFT)
>>
>> I understand they are written differently. But if you look at the 
>> layout, AFF0, AFF1, AFF2 are in the same position. AFF3 doesn't exist 
>> for arm32 and, AFAICT, the shift will not matter because the bits 
>> 40:32 will be zeroed in any case.
>>
>> So I don't see the problem of using the arm64 version.
> 
> Now I see :) ... IIUC you are proposing to just cast the mpidr in 
> MPIDR_AFFINITY_LEVEL(mpidr, level) to uint64_t?

Not necessarilly. The other approach is to make sure that no arm32 code 
is calling AFFINITY_MASK() with a level >= 3 (see vpsci.c for instance).

Cheers,

-- 
Julien Grall

