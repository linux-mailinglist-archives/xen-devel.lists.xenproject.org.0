Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A4B064AFD8D
	for <lists+xen-devel@lfdr.de>; Wed,  9 Feb 2022 20:35:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.269485.463597 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHsk2-00033L-CA; Wed, 09 Feb 2022 19:35:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 269485.463597; Wed, 09 Feb 2022 19:35:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHsk2-00030s-6U; Wed, 09 Feb 2022 19:35:02 +0000
Received: by outflank-mailman (input) for mailman id 269485;
 Wed, 09 Feb 2022 19:35:00 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nHsk0-00030a-4x
 for xen-devel@lists.xenproject.org; Wed, 09 Feb 2022 19:35:00 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nHsjz-0004Gi-On; Wed, 09 Feb 2022 19:34:59 +0000
Received: from 54-240-197-228.amazon.com ([54.240.197.228]
 helo=[192.168.1.215]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nHsjz-0006HT-If; Wed, 09 Feb 2022 19:34:59 +0000
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
	bh=JUppj0n6Sa3l9uCdr5NqN6JBku4hehc1JdipUhPj4+c=; b=pLn59oVhxrS65sCCx9a1eiJB49
	0tKy85A7b9GCICTIPUXT+fpI/2vUmdLmgJCO5b6Lz5BcDBoHwIWmRD5l8U3K7w6pmQYTiy5aOZxYU
	rMhJW87+xPoW6L/dgWe9bfGBOdPFQaJHAatJjzyPKawm4Z6ljUcq0kmBscQ7Md/cvZ3M=;
Message-ID: <6fcf1e16-0c9d-c871-76b7-59d9311e9db4@xen.org>
Date: Wed, 9 Feb 2022 19:34:57 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.1
Subject: Re: [RFC v2 3/8] xen/arm: Export host device-tree to hypfs
To: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>, Juergen Gross <jgross@suse.com>
References: <cover.1644341635.git.oleksii_moisieiev@epam.com>
 <e440e4f16a506ecc87078635dbb3fda2ebd45346.1644341635.git.oleksii_moisieiev@epam.com>
 <b88f6a50-6e9e-5679-8d25-89e26031e88e@xen.org>
 <20220209102037.GA1025795@EPUAKYIW015D>
 <316bd101-af8b-d2f0-1db5-ea6c583acd59@xen.org>
 <20220209185156.GA1475048@EPUAKYIW015D>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20220209185156.GA1475048@EPUAKYIW015D>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 09/02/2022 18:51, Oleksii Moisieiev wrote:
> On Wed, Feb 09, 2022 at 12:17:17PM +0000, Julien Grall wrote:
>>>>> +static HYPFS_DIR_INIT_FUNC(host_dt_dir, HOST_DT_DIR, &host_dt_dir_funcs);
>>>>> +
>>>>> +static int __init host_dtb_export_init(void)
>>>>> +{
>>>>> +    ASSERT(dt_host && (dt_host->sibling == NULL));
>>>>
>>>> dt_host can be NULL when booting on ACPI platform. So I think this wants to
>>>> be turned to a normal check and return directly.
>>>>
>>>
>>> I will replace if with
>>> if ( !acpi_disabled )
>>>       return -ENODEV;
>>>
>>>> Also could you explain why you need to check dt_host->sibling?
>>>>
>>>
>>> This is my way to check if dt_host points to the top of the device-tree.
>>> In any case I will replace it with !acpi_disabled as I mentioned
>>> earlier.
>>
>> dt_host will always points to the root of the host device-tree. I don't
>> think it is the job of hypfs to enforce it unless you expect the code to be
>> buggy if this happens. But then I would argue the code should be hardened.
>>
> 
> Hi Julien,
> 
> Unfortunatelly I can't use acpi_disabled in host_dtb_export_init because
> I've already moved host_dtb_export.c to the common folder.

I am sorry, but I don't understand why moving the code to common code 
prevents you to use !acpi_disabled. Can you clarify?

> 
> As for the host->sibling - I took the whole assert:
> ASSERT(dt_host && (dt_host->sibling == NULL));
> from the prepare_dtb_hwdom function. And this assertion was added by the
> commit b8f1c5e7039efbe1103ed3fe4caedf8c34affe13 authored by you.

I am not sure what's your point... Yes I wrote the same ASSERT() 9 years 
time. But people view evolves over the time.

There are some code I wished I had written differently (How about you? 
;)). However, I don't have the time to rewrite everything I ever wrote. 
That said, I can at least make sure they are not spread.

> 
> What do you think if I omit dt_host->sibling check and make it:
> 
> if ( !dt_host )
>      return -ENODEV;

We used to set dt_host even when booting with ACPI but that shouldn't be 
the case anymore. So I think this check should be fine.

Cheers,

-- 
Julien Grall

