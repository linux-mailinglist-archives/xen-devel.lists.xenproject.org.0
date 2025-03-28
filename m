Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 665CAA7469A
	for <lists+xen-devel@lfdr.de>; Fri, 28 Mar 2025 10:47:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.930438.1333070 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ty6IJ-0003YO-LD; Fri, 28 Mar 2025 09:46:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 930438.1333070; Fri, 28 Mar 2025 09:46:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ty6IJ-0003Wc-Hx; Fri, 28 Mar 2025 09:46:31 +0000
Received: by outflank-mailman (input) for mailman id 930438;
 Fri, 28 Mar 2025 09:46:29 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1ty6IH-0003WW-SZ
 for xen-devel@lists.xenproject.org; Fri, 28 Mar 2025 09:46:29 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1ty6IG-00Dle7-2N;
 Fri, 28 Mar 2025 09:46:28 +0000
Received: from [2a02:8012:3a1:0:9545:fe10:6ede:2324]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1ty6IG-003tu6-1l;
 Fri, 28 Mar 2025 09:46:28 +0000
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
	bh=hkblUL0C22RZWoqw1CHaYP5fzlt7y4Fkag2ZzxvYppk=; b=v0FpodijYDwBKF1IFR4Ww9XMiT
	fzTdlwDV0ih0OBkd8OzzO+1ZJ8L6/i4ynqbZUWOPQUKE2Rgo6xwsRQT5CHFoQ5L5vS/6gPhVK4are
	4e3rvON1N1SNUgXcdqbvOEddNTXoslSnfjwWuW4y+iyfAO13Dh6eDWxE0w1oHnuqBphs=;
Message-ID: <5aa9715d-db0d-4e9e-8107-94ebb1ef4325@xen.org>
Date: Fri, 28 Mar 2025 09:46:26 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/char: implement suspend/resume calls for SCIF driver
Content-Language: en-GB
To: "Orzel, Michal" <michal.orzel@amd.com>,
 Mykola Kvach <xakep.amatop@gmail.com>, xen-devel@lists.xenproject.org
Cc: Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 Mykola Kvach <mykola_kvach@epam.com>
References: <800acb5c8447153e6c451c8df316ff678fbb4087.1743114879.git.mykola_kvach@epam.com>
 <d5c15760-c6cd-4f20-b296-a9f9fd44ab0d@amd.com>
 <baf871c2-8f4e-45a4-b03e-cb0b59c8eb18@xen.org>
 <cb652d45-9beb-4385-84cd-2015f983e27e@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <cb652d45-9beb-4385-84cd-2015f983e27e@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 28/03/2025 09:13, Orzel, Michal wrote:
> 
> 
> On 28/03/2025 09:57, Julien Grall wrote:
>>
>>
>> Hi Michal,
>>
>> On 28/03/2025 08:39, Orzel, Michal wrote:
>>>
>>>
>>> On 28/03/2025 08:08, Mykola Kvach wrote:
>>>>
>>>>
>>>> From: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
>>>>
>>>> The changes have been tested only on the Renesas R-Car H3 Starter Kit board.
>>>>
>>>> Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
>>>> Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
>>>> Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
>>> I'm afraid that without a suspend feature on Arm merged, this is just
>>> introducing a dead code which we try to eliminate both for MISRA and safety.
>>> I'd prefer to wait for the suspend feature to be merged first.
>>
>> This patch is not different from the ns16550 driver which already have
>> suspend/resume callback and users. They will be used by but the caller
>> is not used on Arm yet. So you are saying the code there is not MISRA
>> compliant? If so, is this reported by ECLAIR?
> NS also works for x86 that has suspend feature. SCIF only works for Arm that
> does not have suspend feature.

I don't understand why it matters that NS16550 is used on x86. In 
previous MISRA discussion we said the violations were tracked per arch 
rather than globally.

[...]

>>
>> Regardless that, I don't think the full suspend/resume series would
>> help. AFAIR, the caller will be protected with a config (SUSPEND
>> something). So IIUC your definition, this code will still be "dead code"
>> in certain config. Therefore are you suggesting to protect everything
>> suspend specific code with SUSPEND?
> I'd say so, yes.
> 
>>
>> If the answer is yes, how about introducing the SUSPEND config now? This
>> would allow to get some of the code merged in advance.
> Better this than nothing. But in case of this patch, why would we take it anyway
> without suspend feature?

Two reasons:
   * There is nothing really preventing the SCIF to be used on x86 (yes 
I know there are only Arm HW today)
   * We will likely want to commit the series bits by bits to avoid 
dozen of patches to be sent everytime. This patch is something small 
enough and can be committed before hand.

> I'd prefer to add SUSPEND config and protect existing
> code i.e. NS that can work on x86 but not on Arm, etc.

I am fine if we want to add the SUSPEND config first.

Cheers,

-- 
Julien Grall


