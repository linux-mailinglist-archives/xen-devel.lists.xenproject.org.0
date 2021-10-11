Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B4EB5428C02
	for <lists+xen-devel@lfdr.de>; Mon, 11 Oct 2021 13:27:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.205815.361218 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mZtT8-0001HY-0T; Mon, 11 Oct 2021 11:27:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 205815.361218; Mon, 11 Oct 2021 11:27:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mZtT7-0001Ee-TB; Mon, 11 Oct 2021 11:27:45 +0000
Received: by outflank-mailman (input) for mailman id 205815;
 Mon, 11 Oct 2021 11:27:44 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mZtT6-0001EF-C5
 for xen-devel@lists.xenproject.org; Mon, 11 Oct 2021 11:27:44 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mZtT5-0003qj-JA; Mon, 11 Oct 2021 11:27:43 +0000
Received: from 54-240-197-238.amazon.com ([54.240.197.238]
 helo=[192.168.17.141]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mZtT5-0005T9-DL; Mon, 11 Oct 2021 11:27:43 +0000
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
	bh=wo43l+07A3vRW/dVAD6N8tTmkv+fJZSm8PxfC68V9vg=; b=ZHnwJK14ojE8fkr5484oLhdpK+
	DOEQuHRkZNC76TP6CJKlUiczeYO7ans1WJZ3iOT3AYaZ+NxSPtkEfLFX3yygsNWUMnC6/o6lxMSoi
	m/UV0ZxB6EGkP5x0SJNgkQgPBx0D+8s7hkXNw1UF7rhNCivRwYE465VN2dMQkItKKiSw=;
Message-ID: <9fe6cda4-698b-3c87-6d9b-405405a85bbb@xen.org>
Date: Mon, 11 Oct 2021 12:27:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.2.0
Subject: Re: [PATCH V5 3/3] xen/arm: Updates for extended regions support
To: Oleksandr <olekstysh@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <1633519346-3686-1-git-send-email-olekstysh@gmail.com>
 <1633519346-3686-4-git-send-email-olekstysh@gmail.com>
 <alpine.DEB.2.21.2110061843360.3209@sstabellini-ThinkPad-T480s>
 <a5a81348-4b18-6be6-ba85-4c31172459dc@gmail.com>
 <alpine.DEB.2.21.2110071300380.414@sstabellini-ThinkPad-T480s>
 <ff6800b3-74f0-3203-6465-1547644924e2@gmail.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <ff6800b3-74f0-3203-6465-1547644924e2@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Oleksandr,

On 07/10/2021 21:29, Oleksandr wrote:
>>>>> @@ -1193,8 +1215,8 @@ static int __init make_hypervisor_node(struct 
>>>>> domain
>>>>> *d,
>>>>>            u64 start = ext_regions->bank[i].start;
>>>>>            u64 size = ext_regions->bank[i].size;
>>>>>    -        dt_dprintk("Extended region %d: %#"PRIx64"->%#"PRIx64"\n",
>>>>> -                   i, start, start + size);
>>>>> +        printk("Extended region %d: %#"PRIx64"->%#"PRIx64"\n",
>>>>> +               i, start, start + size);
>>>> Also should be PRIpaddr
>>> I thought I needed to change specifier only for variables of type 
>>> "paddr_t",
>>> but here "u64".
>> Sorry, you are right.
>>
>> I added my reviewed-by and made the small typo changes on commit.
> 
> Thanks! In case if you haven't committed the patch yet, let's please 
> wait for Julien (who asked for this follow-up) to review it.

I went through it. The change looks good to me. No need for...

> 
> In any case, I will be able to do another follow-up if needed.

... another follow-up. Thanks for sending a patch to handle my requests! :)

Cheers,

-- 
Julien Grall

