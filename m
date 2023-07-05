Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 277B17481C3
	for <lists+xen-devel@lfdr.de>; Wed,  5 Jul 2023 12:12:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.559015.873657 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGzUL-0000HK-Pk; Wed, 05 Jul 2023 10:11:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 559015.873657; Wed, 05 Jul 2023 10:11:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGzUL-0000FS-Mt; Wed, 05 Jul 2023 10:11:57 +0000
Received: by outflank-mailman (input) for mailman id 559015;
 Wed, 05 Jul 2023 10:11:56 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qGzUK-0000FM-CL
 for xen-devel@lists.xenproject.org; Wed, 05 Jul 2023 10:11:56 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qGzUJ-0004Li-Lz; Wed, 05 Jul 2023 10:11:55 +0000
Received: from [15.248.3.5] (helo=[10.24.67.21])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qGzUJ-0008BX-Fj; Wed, 05 Jul 2023 10:11:55 +0000
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
	bh=RF7JK2NR6pH+ReRWBnKCtDO2tYrvH+V8eapC7j73158=; b=VvKslTPzHzAVG0cGAQh56YLBbw
	ee7oWyvK+pzG+ZqwOaV/k+g6TvMdmkDCR8AGLQXIokFeZHeNiC/KviS7eFOQGZstlY2rHeY/MW1+Z
	bgDNPoXZ4TsqKEj1CTbbXeAAOx2vMW6V07qRmjADYlxwSIIRW/GMuUXVyEdRhxcJ9mHI=;
Message-ID: <1ca1f3d7-03cf-0bcf-2862-dad3901f116a@xen.org>
Date: Wed, 5 Jul 2023 11:11:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH v3 08/52] xen/arm64: move MMU related code from head.S to
 mmu/head.S
Content-Language: en-US
To: Penny Zheng <penny.zheng@arm.com>, xen-devel@lists.xenproject.org
Cc: Wei Chen <wei.chen@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20230626033443.2943270-1-Penny.Zheng@arm.com>
 <20230626033443.2943270-9-Penny.Zheng@arm.com>
 <39187006-6220-4b76-ada4-9e5be72b60fe@xen.org>
 <7e73b11b-ae4b-a4fb-f9bd-9a95be41d664@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <7e73b11b-ae4b-a4fb-f9bd-9a95be41d664@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 05/07/2023 05:49, Penny Zheng wrote:
> Hi Julien

Hi,

> On 2023/7/5 05:46, Julien Grall wrote:
>> Hi Penny,
>>
>> On 26/06/2023 04:33, Penny Zheng wrote:
>>> From: Wei Chen <wei.chen@arm.com>
>>>
>>> There are lots of MMU specific code in head.S. This code will not
>>> be used in MPU systems. If we use #ifdef to gate them, the code
>>> will become messy and hard to maintain. So we move MMU related
>>> code to mmu/head.S, and keep common code still in head.S. We also
>>> add .text.idmap in mmu/head.S to make all code in this new file
>>> are still in identity map page but will be linked after head.S.
>>>
>>> As "fail" in head.S is very simple and this name is too easy to
>>> be conflicted, so duplicate it in mmu/head.S instead of exporting
>>> it.
>>>
>>> And some assembly macros that will be shared by MMU and MPU later,
>>> we move them to macros.h.
>>
>> Aren't those macros already shared between head.S and mmu/head.S?
>>
> 
> Correct me if I understand wrongly, so you want to remove the mention of 
> MPU, and rephrase it to

So far, I am asking whether all the macros moved in macros.h are shared 
between mmu/head.S and head.S. If they are then...

> "
> As some assembly macros need to be shared by head.S and mmu/head.S,
> we will move them to macros.h.
> "

... yes this is the rephrase I would like to see.

Cheers,

-- 
Julien Grall

