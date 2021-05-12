Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C41C437C064
	for <lists+xen-devel@lfdr.de>; Wed, 12 May 2021 16:39:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.126262.237668 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lgq10-0008WU-LK; Wed, 12 May 2021 14:39:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 126262.237668; Wed, 12 May 2021 14:39:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lgq10-0008Tw-Hv; Wed, 12 May 2021 14:39:10 +0000
Received: by outflank-mailman (input) for mailman id 126262;
 Wed, 12 May 2021 14:39:09 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lgq0z-0008To-Ko
 for xen-devel@lists.xenproject.org; Wed, 12 May 2021 14:39:09 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lgq0x-0004bI-Vp; Wed, 12 May 2021 14:39:07 +0000
Received: from [54.239.6.186] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lgq0x-0007qX-P5; Wed, 12 May 2021 14:39:07 +0000
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
	bh=JKodAiAsgJ7pY9dJZjJMqrEaMA+o07oCOY7DUlzndHc=; b=4KsPTKiuCAPGIMfrPho0oBbhuH
	F4zDKsNz2R4TN2IVP+R6t1/prk7hI0WY0GrjRvSQvG7amB9eUW/rvh2xR4Yygioe0TsXtgLg5Txne
	PFqfGybU7IVNfrmKfX1Z2YJoInQEtXm/HNsujgPSwnX7wfJtSmQHT7BRe9FSRHd/7WfU=;
Subject: Re: [PATCH RFCv2 03/15] xen/arm: p2m: Replace level_{orders, masks}
 arrays with LEVEL_{ORDER, MASK}
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, Wei.Chen@arm.com, Henry.Wang@arm.com,
 Penny.Zheng@arm.com, Bertrand.Marquis@arm.com,
 Julien Grall <jgrall@amazon.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20210425201318.15447-1-julien@xen.org>
 <20210425201318.15447-4-julien@xen.org>
 <alpine.DEB.2.21.2105111528180.5018@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien@xen.org>
Message-ID: <42315452-0fd3-9cc7-3fb7-89a840f94792@xen.org>
Date: Wed, 12 May 2021 15:39:05 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2105111528180.5018@sstabellini-ThinkPad-T480s>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Stefano,

On 11/05/2021 23:33, Stefano Stabellini wrote:
> On Sun, 25 Apr 2021, Julien Grall wrote:
>> From: Julien Grall <jgrall@amazon.com>
>>
>> The array level_orders and level_masks can be replaced with the
>> recently introduced macros LEVEL_ORDER and LEVEL_MASK.
>>
>> Signed-off-by: Julien Grall <jgrall@amazon.com>
> 
> So you actually planned to use LEVEL_ORDER and LEVEL_MASK in the xen/
> code. I take back the previous comment :-)
> 
> Is the 4KB size "hiding" (for the lack of a better word) done on purpose?
> 
> Let me rephrase. Are you trying to consolidate info about pages being
> 4KB in xen/include/asm-arm/lpae.h ?

THIRD_ORDER, SECOND_ORDER... is already not very 4KB specific :). In 
this case, what I am trying to do is completely removing the static 
arrays so they don't need to be global (or duplicated) when adding 
superpage support for Xen PT (see a follow-up patch).

This also has the added benefits to replace a with a couple of loads 
with only a few instructions working on immediates.

> 
> In any case:
> 
> Acked-by: Stefano Stabellini <sstabellini@kernel.org>

Thank you!

Cheers,

-- 
Julien Grall

