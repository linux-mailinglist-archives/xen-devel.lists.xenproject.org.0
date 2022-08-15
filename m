Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CE1EE5933CC
	for <lists+xen-devel@lfdr.de>; Mon, 15 Aug 2022 19:04:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.387741.624108 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oNdW5-0000zn-6V; Mon, 15 Aug 2022 17:04:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 387741.624108; Mon, 15 Aug 2022 17:04:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oNdW5-0000xn-3n; Mon, 15 Aug 2022 17:04:41 +0000
Received: by outflank-mailman (input) for mailman id 387741;
 Mon, 15 Aug 2022 17:04:40 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oNdW4-0000xh-A7
 for xen-devel@lists.xenproject.org; Mon, 15 Aug 2022 17:04:40 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oNdW3-0001d0-TT; Mon, 15 Aug 2022 17:04:39 +0000
Received: from 54-240-197-225.amazon.com ([54.240.197.225]
 helo=[10.95.149.129]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oNdW3-00066z-MG; Mon, 15 Aug 2022 17:04:39 +0000
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
	bh=cE1RpxdPKx/eVcQPE2LtrNlGjvwUjN3BH3X1iquWWZA=; b=5f9CvSM8c8ZLH+ZaXwxs/3nuMP
	O1LAHmbXN8GUpNBX1vVesjzhb0AKmlf/UpjR4hwA7A9hZvg4ZGh91fAr0iYmceROSTvPeYTyrTU82
	4McCW4O8oaR+qXEuVJc+tplkaa0/WyupvkgF1y9irfwv7vpoxORApNRpea++DV/hwAkM=;
Message-ID: <8d60c472-8ac0-bc45-4eef-6f14d2afa668@xen.org>
Date: Mon, 15 Aug 2022 18:04:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.1.2
Subject: Re: [PATCH 7/7] xen/arm32: traps: Dump more information for
 hypervisor data abort
Content-Language: en-US
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 Julien Grall <jgrall@amazon.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20220812192448.43016-1-julien@xen.org>
 <20220812192448.43016-9-julien@xen.org>
 <C817E0AC-5A5F-46AD-8D1C-A472F9C004CF@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <C817E0AC-5A5F-46AD-8D1C-A472F9C004CF@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 15/08/2022 17:39, Bertrand Marquis wrote:
> Hi Julien,

Hi Bertrand,

>> On 12 Aug 2022, at 20:24, Julien Grall <julien@xen.org> wrote:
>>
>> From: Julien Grall <jgrall@amazon.com>
>>
>> Unlike arm64, on arm32 there are no extra information dumped (e.g.
>> page table walk) for hypervisor data abort.
> 
> The code in arch/arm/traps.c has nothing arm32 specific like that so
> could you explain this statement ?
> 
> Here the arm32 code will call the generic function which has only
> something specific for BRK handling but the rest is generic.

The statement is not related to the code but the console output. On 
arm64, a data abort will decode the HSR and provide a dump of the 
page-table walk.

This doesn't happen on arm32 because Xen will call do_unexpected_trap(). 
So the only information we have is the HSR and FAR. This is not very 
helpful for debugging page-table walk.

After this patch, the same information will be printed on arm32 and arm64.

Cheers,

-- 
Julien Grall

