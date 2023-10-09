Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A3B67BD9D5
	for <lists+xen-devel@lfdr.de>; Mon,  9 Oct 2023 13:30:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.614331.955349 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qpoT0-0000HM-5T; Mon, 09 Oct 2023 11:30:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 614331.955349; Mon, 09 Oct 2023 11:30:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qpoT0-0000FO-2J; Mon, 09 Oct 2023 11:30:30 +0000
Received: by outflank-mailman (input) for mailman id 614331;
 Mon, 09 Oct 2023 11:30:28 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qpoSy-0000FA-Ik
 for xen-devel@lists.xenproject.org; Mon, 09 Oct 2023 11:30:28 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qpoSy-0005VX-0S; Mon, 09 Oct 2023 11:30:28 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qpoSx-0001ap-Ov; Mon, 09 Oct 2023 11:30:27 +0000
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
	bh=wOW9OmiIK/DjWo6WXfbdZcIP+vtPhlOcm0qAiXzHG20=; b=VFeU9LC91jjS1RPDGKEHm/50Su
	RV0uk6sr2/LYjkHpve4N3pitb/gHAWGp3AsrXZbnq/r+nlQUREz4BoJNHme+zbpZXEz5fGYzsQKq3
	aUOesBQqwT/xkxNv/PHx85RfZA88Q/3Kus2Fkblfd9oM4Ne/WRpM4kl0uMLVKRehEpVg=;
Message-ID: <cc403bb2-2f32-4696-a248-7e8680ff4823@xen.org>
Date: Mon, 9 Oct 2023 12:30:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.18 v5] xen/pdx: Make CONFIG_PDX_COMPRESSION a common
 Kconfig option
Content-Language: en-GB
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
 Julien Grall <jgrall@amazon.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Shawn Anastasio <sanastasio@raptorengineering.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Henry Wang <Henry.Wang@arm.com>, George Dunlap
 <George.Dunlap@eu.citrix.com>, Jan Beulich <JBeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <20231006144405.1078260-1-andrew.cooper3@citrix.com>
 <efc2b22e-6650-4c1f-b4cf-9971d4d08b49@xen.org>
 <b95fa9cd-2534-4d7a-9843-2bc71695655d@citrix.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <b95fa9cd-2534-4d7a-9843-2bc71695655d@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 06/10/2023 17:01, Andrew Cooper wrote:
> On 06/10/2023 4:09 pm, Julien Grall wrote:
>>
>>
>> On 06/10/2023 15:44, Andrew Cooper wrote:
>>> From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
>>>
>>> Adds a new compile-time flag to allow disabling PDX compression and
>>> compiles out compression-related code/data. It also shorts the pdx<->pfn
>>> conversion macros and creates stubs for masking functions.
>>>
>>> While at it, removes the old arch-defined CONFIG_HAS_PDX flag.
>>> Despite the
>>> illusion of choice, it was not optional.
>>>
>>> There are ARM and PPC platforms with sparse RAM banks - leave compression
>>> active by default there.  OTOH, there are no known production x86
>>> systems with
>>> sparse RAM banks, so disable compression.  This decision can be
>>> revisited if
>>> such a platform comes along.
>>
>> (Process remarks rather than the code itself)
>>
>> Jan is away this week so I want to make sure this doesn't go in without
>> him having a say.
>>
>> While I don't particularly care about the approach taken for x86, Jan
>> voiced concerned with this approach and so far I didn't see any
>> conclusion. If there is any, then please point me to them.
>>
>> For the record, the objections from Jan are in [1]. If we want to ignore
>> them, then I think we need a vote. Possibly only from the x86 folks (?).
> 
> 
> What do you think the 2 x86 maintainer tags on this patch in this exact
> form, 

Have you actually looked at the timeline before writing this e-mail?

15:44 -> You sent the series
16:09 -> I have asked for a vote/second review
16:18 -> Roger provided a second reviewed-by

 > The vote has already concluded.

Indeed. But this was only after my e-mail was sent. I would have replied 
differently if Roger had replied before hand.

I am merely trying to make sure we are following the process and don't 
get things committed without unnaddressed objections (you likely 
remember the series I am talking about...).

Next time, I suggest to check the timeline before implying that I am 
putting roadblocks.

Cheers,

-- 
Julien Grall

