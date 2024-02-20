Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF60585B8EE
	for <lists+xen-devel@lfdr.de>; Tue, 20 Feb 2024 11:22:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.683366.1062840 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rcNFv-0008W6-Uj; Tue, 20 Feb 2024 10:21:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 683366.1062840; Tue, 20 Feb 2024 10:21:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rcNFv-0008US-Rq; Tue, 20 Feb 2024 10:21:43 +0000
Received: by outflank-mailman (input) for mailman id 683366;
 Tue, 20 Feb 2024 10:21:42 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rcNFu-0008UM-Fd
 for xen-devel@lists.xenproject.org; Tue, 20 Feb 2024 10:21:42 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rcNFs-0007nw-SU; Tue, 20 Feb 2024 10:21:40 +0000
Received: from [15.248.2.238] (helo=[10.24.67.30])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rcNFs-0005vo-Hk; Tue, 20 Feb 2024 10:21:40 +0000
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
	bh=lPQQ7pGZQgBX+xw8nWCo+MNrxRJU7VJJ+DNGT807UYo=; b=v8aoqx8okU3InnrFE2Me5trZ4X
	n4covUpZywuwf0SIUSd7LQrZKY6Ho0imO4e4VyVZQubaDvkKRawnHb0oJ7kCaHaTD5GDQI7G4o9xS
	KZgnJ21KvBlXOY/QvNhMHoiQTG02ysxYCV0JKE/T2xhImB4AEPlb/eTiNGVvvaek3KSY=;
Message-ID: <814e35c2-ce8b-4e04-b419-a79be9ee445a@xen.org>
Date: Tue, 20 Feb 2024 10:21:37 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 02/15] xen/arm: add initial support for LLC coloring on
 arm64
Content-Language: en-GB
To: Carlo Nonato <carlo.nonato@minervasys.tech>
Cc: Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org,
 andrea.bastoni@minervasys.tech, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Marco Solieri <marco.solieri@minervasys.tech>
References: <20240129171811.21382-1-carlo.nonato@minervasys.tech>
 <20240129171811.21382-3-carlo.nonato@minervasys.tech>
 <bb28c8a2-c2bd-4e1d-ad28-9bc632e3e474@amd.com>
 <CAG+AhRXsZC7Pjdce42yYTvBy7MyjS1axrDGsY0U=o+APNyxdYA@mail.gmail.com>
 <5d2f6be2-020d-4003-ad47-b20ef07ffefc@xen.org>
 <CAG+AhRX96RBCc0n750K3t+c3j_fKQLrg1K5kLceHig401wS+Ng@mail.gmail.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <CAG+AhRX96RBCc0n750K3t+c3j_fKQLrg1K5kLceHig401wS+Ng@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Carlo,

On 20/02/2024 09:16, Carlo Nonato wrote:
> Hi Julien
> 
> On Tue, Feb 20, 2024 at 12:06 AM Julien Grall <julien@xen.org> wrote:
>>
>> Hi,
>>
>> On 14/02/2024 13:52, Carlo Nonato wrote:
>>> On Wed, Feb 14, 2024 at 11:14 AM Michal Orzel <michal.orzel@amd.com> wrote:
>>>>> diff --git a/xen/arch/arm/include/asm/processor.h b/xen/arch/arm/include/asm/processor.h
>>>>> index 8e02410465..336933ee62 100644
>>>>> --- a/xen/arch/arm/include/asm/processor.h
>>>>> +++ b/xen/arch/arm/include/asm/processor.h
>>>>> @@ -18,6 +18,22 @@
>>>>>    #define CTR_IDC_SHIFT       28
>>>>>    #define CTR_DIC_SHIFT       29
>>>>>
>>>>> +/* CCSIDR Current Cache Size ID Register */
>>>>> +#define CCSIDR_LINESIZE_MASK            _AC(0x7, ULL)
>>>> Why ULL and not UL? ccsidr is of register_t type
>>>
>>> Julien, while reviewing an earlier version:
>>>
>>>> Please use ULL here otherwise someone using MASK << SHIFT will have the
>>>> expected result.
>>>
>>> https://patchew.org/Xen/20220826125111.152261-1-carlo.nonato@minervasys.tech/20220826125111.152261-2-carlo.nonato@minervasys.tech/#08956082-c194-8bae-cb25-44e4e3227689@xen.org
>>
>> Michal is right. This should be UL. Not sure why I suggested ULL back
>> then. Sorry.
> 
> No problem.
> 
> If there aren't any other comments I will proceed with sending the v7.
> Do you guys want to add something on the arm part?

I haven't yet had the chance to fully review the series. It is in my 
TODO list though.

Cheers,

-- 
Julien Grall

