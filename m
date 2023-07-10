Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA30974DFCE
	for <lists+xen-devel@lfdr.de>; Mon, 10 Jul 2023 22:47:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.561401.877832 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qIxmB-0006gM-My; Mon, 10 Jul 2023 20:46:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 561401.877832; Mon, 10 Jul 2023 20:46:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qIxmB-0006du-Jt; Mon, 10 Jul 2023 20:46:31 +0000
Received: by outflank-mailman (input) for mailman id 561401;
 Mon, 10 Jul 2023 20:46:30 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qIxmA-0006do-Fa
 for xen-devel@lists.xenproject.org; Mon, 10 Jul 2023 20:46:30 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qIxm8-0001Tf-Sw; Mon, 10 Jul 2023 20:46:28 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qIxm8-00041T-Kn; Mon, 10 Jul 2023 20:46:28 +0000
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
	bh=D8mFncSuiOb0SNdC84qMjnH1owlFYEwJJzFDGKB9AUQ=; b=sbgMsnwYHj1psGl99B+TPDPLxS
	8sOCkceN85tv0CgBjGmgeO+f77hIPiULjv7w8i1LCMG/SU5HivlZbXofxlUGU0Mk+lI1K+e07HAUk
	fM9vILlyT8wYJFAYC4G0am4/9K5BVeS1289GT8A4H9Jw8EikKw4iH+nfeEUQ4dUpD27c=;
Message-ID: <4ea37c25-c4b0-7cc7-725b-4ea10c727743@xen.org>
Date: Mon, 10 Jul 2023 21:46:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH v2 1/2] restrict concept of pIRQ to x86
To: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>
References: <85e59fd5-9a06-48b4-ba7e-81865d44e332@suse.com>
 <98f51b96-8a1c-7f33-b4d3-1744174df465@suse.com>
 <ZFNiS8oxfozlxCz6@Air-de-Roger>
 <2a46c7df-b380-cc41-5582-70b4829d7f47@suse.com>
 <ZFNpI929Zk61sZ5X@Air-de-Roger>
 <cf8bb56f-8fc5-77a6-40c1-a2f10970a094@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <cf8bb56f-8fc5-77a6-40c1-a2f10970a094@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 04/05/2023 09:21, Jan Beulich wrote:
> On 04.05.2023 10:13, Roger Pau Monné wrote:
>> On Thu, May 04, 2023 at 09:50:27AM +0200, Jan Beulich wrote:
>>> On 04.05.2023 09:44, Roger Pau Monné wrote:
>>>> On Wed, May 03, 2023 at 05:33:05PM +0200, Jan Beulich wrote:
>>>>> --- a/xen/include/xen/sched.h
>>>>> +++ b/xen/include/xen/sched.h
>>>>> @@ -438,12 +438,14 @@ struct domain
>>>>>   
>>>>>       struct grant_table *grant_table;
>>>>>   
>>>>> +#ifdef CONFIG_HAS_PIRQ
>>>>>       /*
>>>>>        * Interrupt to event-channel mappings and other per-guest-pirq data.
>>>>>        * Protected by the domain's event-channel spinlock.
>>>>>        */
>>>>>       struct radix_tree_root pirq_tree;
>>>>>       unsigned int     nr_pirqs;
>>>>> +#endif
>>>>
>>>> Won't it be cleaner to just move this into arch_domain and avoid a
>>>> bunch of the ifdefary? As the initialization of the fields would be
>>>> moved to arch_domain_create() also.
>>>
>>> That's hard to decide without knowing what e.g. RISC-V is going to
>>> want. Taking (past) IA-64 into consideration - that would likely
>>> have wanted to select this new HAS_PIRQ, and hence keeping these
>>> pieces where they are imo makes sense.
>>
>> I'm kind of confused, what does Arm do here?  AFAICT the pirq_tree is
>> used by both PV and HVM guests in order to store the native interrupt
>> -> guest interrupt translation, doesn't Arm also need something
>> similar?
> 
> According to [1] they don't, hence the (new in v2) change here. Aiui
> they simply map IRQ to pIRQ 1:1.

The vGIC is able to cope with vIRQ != pIRQ. But so far, we only allow a 
domain to map 1:1.

For that we are storing the pIRQ to vIRQ mapping in the IRQ desc and 
have a pointer to the desc in the vIRQ information.

So no need to a PIRQ tree on the Arm side.

Cheers,

-- 
Julien Grall

