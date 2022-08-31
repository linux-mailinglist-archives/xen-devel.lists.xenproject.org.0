Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3599A5A8697
	for <lists+xen-devel@lfdr.de>; Wed, 31 Aug 2022 21:17:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.396018.635963 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTTDX-0004s5-55; Wed, 31 Aug 2022 19:17:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 396018.635963; Wed, 31 Aug 2022 19:17:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTTDX-0004pZ-2J; Wed, 31 Aug 2022 19:17:39 +0000
Received: by outflank-mailman (input) for mailman id 396018;
 Wed, 31 Aug 2022 19:17:37 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oTTDV-0004pT-H2
 for xen-devel@lists.xenproject.org; Wed, 31 Aug 2022 19:17:37 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oTTDV-0005PS-9O; Wed, 31 Aug 2022 19:17:37 +0000
Received: from gw1.octic.net ([81.187.162.82] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oTTDV-00046X-38; Wed, 31 Aug 2022 19:17:37 +0000
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
	bh=FqeARjdiNwcgmIexWCKngf9wAsH08y978w0gryCe9NE=; b=o+Gesaz2lmL21Cb+QoL3wmwQOq
	n7B4F+LAIHV1CKTj6srrN3Sl034f4HAEsPKaLfmCNCu3VaYQU20SoGaAC4kIjFeMGTh90Y5i9+qe8
	pyjU0oyLCy7118xpOawmw8ZS0uwvdEZ6R8HlpFZXlMT+dLIbaHW1y52y09XAXML/J0E8=;
Message-ID: <0fdc3ff0-a524-0c2a-bc2f-618e3d6061f7@xen.org>
Date: Wed, 31 Aug 2022 20:17:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.12.0
Subject: Re: [PATCH 7/7] xen/arm32: traps: Dump more information for
 hypervisor data abort
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 Julien Grall <jgrall@amazon.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20220812192448.43016-1-julien@xen.org>
 <20220812192448.43016-9-julien@xen.org>
 <C817E0AC-5A5F-46AD-8D1C-A472F9C004CF@arm.com>
 <8d60c472-8ac0-bc45-4eef-6f14d2afa668@xen.org>
 <73D6802A-8557-42A7-94F2-9F696919283D@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <73D6802A-8557-42A7-94F2-9F696919283D@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 16/08/2022 08:28, Bertrand Marquis wrote:
> Hi Julien,

Hi Bertrand,


>> On 15 Aug 2022, at 18:04, Julien Grall <julien@xen.org> wrote:
>>
>>
>>
>> On 15/08/2022 17:39, Bertrand Marquis wrote:
>>> Hi Julien,
>>
>> Hi Bertrand,
>>
>>>> On 12 Aug 2022, at 20:24, Julien Grall <julien@xen.org> wrote:
>>>>
>>>> From: Julien Grall <jgrall@amazon.com>
>>>>
>>>> Unlike arm64, on arm32 there are no extra information dumped (e.g.
>>>> page table walk) for hypervisor data abort.
>>> The code in arch/arm/traps.c has nothing arm32 specific like that so
>>> could you explain this statement ?
>>> Here the arm32 code will call the generic function which has only
>>> something specific for BRK handling but the rest is generic.
>>
>> The statement is not related to the code but the console output. On arm64, a data abort will decode the HSR and provide a dump of the page-table walk.
>>
>> This doesn't happen on arm32 because Xen will call do_unexpected_trap(). So the only information we have is the HSR and FAR. This is not very helpful for debugging page-table walk.
>>
>> After this patch, the same information will be printed on arm32 and arm64.
> 
> Ok then this is what I understood. Your commit message is maybe a bit unclear.
> 
> I would add a sentence like that: Call do_trap_hyp_sync for hypervisor data aborts on arm32 to have the same information than on arm64.

Below the new commit message:

     Unlike arm64, on arm32 there are no extra information dumped (e.g.
     page table walk) for hypervisor data abort.

     For data abort, the HSR will be set properly and so call
     do_trap_hyp_sync() instead of do_unexpected_trap() on arm32 to have
     the print the same information as arm64.


> 
> This can be done on commit so feel free to add my:
> 
> Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Thanks! I have committed the series.

Cheers,

-- 
Julien Grall

