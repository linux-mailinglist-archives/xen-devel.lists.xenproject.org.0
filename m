Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E3C2B6CF561
	for <lists+xen-devel@lfdr.de>; Wed, 29 Mar 2023 23:29:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.516397.800423 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phdM4-0006p9-1b; Wed, 29 Mar 2023 21:29:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 516397.800423; Wed, 29 Mar 2023 21:29:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phdM3-0006nF-V7; Wed, 29 Mar 2023 21:29:15 +0000
Received: by outflank-mailman (input) for mailman id 516397;
 Wed, 29 Mar 2023 21:29:14 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1phdM1-0006n9-Ve
 for xen-devel@lists.xenproject.org; Wed, 29 Mar 2023 21:29:14 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1phdM1-0008JL-5l; Wed, 29 Mar 2023 21:29:13 +0000
Received: from 54-240-197-238.amazon.com ([54.240.197.238]
 helo=[192.168.25.70]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1phdM0-0000kb-Q1; Wed, 29 Mar 2023 21:29:13 +0000
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
	bh=t1FRKr2C3D04nOxJ1GWwajBy5sm9zi8gqKVC64a2b74=; b=FwS6SK8ysBJWYtdkqN+yyyLBiB
	bwGkT6kJHboIgzLnNcNyfWGve4n7UN2qGbTpxDdjHichz+ADMXZB/mKi4yXirryadsuusk7/f77p8
	aGJXgnWWCuB7c/AjVCLozG+Oh/vmeSiWD9OQg80xr1DbXJzeCReA/LTtSQrKGajEvBkY=;
Message-ID: <0241a223-e717-b59f-845b-21a0985a1d74@xen.org>
Date: Wed, 29 Mar 2023 22:29:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.0
Subject: Re: [RFC PATCH v2 2/2] tools/misc: Add xen-vcpus-stats tool
Content-Language: en-US
To: Matias Ezequiel Vara Larsen <matiasevara@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel@lists.xenproject.org,
 Matias Ezequiel Vara Larsen <matias.vara@vates.fr>, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>
References: <cover.1665138677.git.matias.vara@vates.fr>
 <df706d6dcfba965909d776dda163fdb261d1a0ea.1665138677.git.matias.vara@vates.fr>
 <f71bbf79-e452-f2d6-58f9-0f2cf019c7b6@citrix.com>
 <70651f5d-12b9-c7b1-9b69-fc0177f4a1ba@xen.org>
 <20230317110110.GA591920@horizon>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230317110110.GA591920@horizon>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

Sorry for the late reply.

On 17/03/2023 11:01, Matias Ezequiel Vara Larsen wrote:
> On Thu, Feb 23, 2023 at 08:31:29PM +0000, Julien Grall wrote:
>>>> +#define rmb()   asm volatile("lfence":::"memory")
>>>
>>> This is rmb(), but rmb() isn't what you want.
>>>
>>> You want smp_rmb(), which is
>>>
>>> #define smp_rmb() asm volatile ("" ::: "memory")
>>
>>  From the generic PoV, I find smp_rmb() a bit misleading because it is not
>> clear in this context whether we are referring to the SMP-ness of the
>> hypervisor or the tools domain.
>>
>> If the latter, then technically it could be uniprocessor domain and one
>> could argue that for Arm it could be downgraded to just a compiler barrier.
>>
>> AFAICT, this would not be the case here because we are getting data from
>> Xen. So we always need a "dmb ish".
>>
>> So, I would suggest to name it virt_*() (to match Linux's naming).
>>
>> Also, is this tool meant to be arch-agnostic? If so, then we need to
>> introduce the proper barrier for the other arch.
>>
> Thanks Julien for the comment. Is it `xen_rmb()` meant for that?

I believe so.

> 
> Matias

-- 
Julien Grall

