Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 15D665311C8
	for <lists+xen-devel@lfdr.de>; Mon, 23 May 2022 18:05:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.336029.560262 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ntAYb-0002b1-MZ; Mon, 23 May 2022 16:05:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 336029.560262; Mon, 23 May 2022 16:05:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ntAYb-0002Yh-IP; Mon, 23 May 2022 16:05:21 +0000
Received: by outflank-mailman (input) for mailman id 336029;
 Mon, 23 May 2022 16:05:20 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1ntAYa-0002YI-7r
 for xen-devel@lists.xenproject.org; Mon, 23 May 2022 16:05:20 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ntAYZ-0003Cc-SJ; Mon, 23 May 2022 16:05:19 +0000
Received: from [54.239.6.190] (helo=[192.168.27.218])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ntAYZ-0006dd-Lk; Mon, 23 May 2022 16:05:19 +0000
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
	bh=KbkzlDtxUkKxdwqqoTjcWACsHCE88PfRN4/a2QFirhE=; b=FUe9tIaEOPl1EUFucYst88dcxf
	cOUUmrU/miN7iy6nuU5S0QKLGTKc+ExCzalI89Ep3ZOQdKtkSaldOZfYycJKBjdbbOODSyVCd32rR
	BWd/BfMjyUto1gwT0Ptdo6oHc9Uc+POoHjMrdHXJlWore67MhBZrx+XHzYiJn6J/jvI8=;
Message-ID: <1c7342ed-63af-e420-4f3a-938cb93021c7@xen.org>
Date: Mon, 23 May 2022 17:05:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.0
Subject: Re: [PATCH v5 4/6] xen: Switch to byteswap
To: Andrew Cooper <Andrew.Cooper3@citrix.com>,
 =?UTF-8?B?TGluIExpdSDvvIjliJjmnpfvvIk=?= <lin.liu@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 George Dunlap <George.Dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>
References: <cover.1653314499.git.lin.liu@citrix.com>
 <dcabb541d0b5ab7858ccf1c925afc334f3123ad5.1653314499.git.lin.liu@citrix.com>
 <8fcd30a6-9b93-6687-a0f5-1e035fa5f789@xen.org>
 <d77a5995-a916-70a9-4bf2-efdb2948588b@citrix.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <d77a5995-a916-70a9-4bf2-efdb2948588b@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Andrew,

On 23/05/2022 16:38, Andrew Cooper wrote:
> On 23/05/2022 15:56, Julien Grall wrote:
>> Hi,
>>
>> On 23/05/2022 15:50, Lin Liu wrote:
>>> Update to use byteswap to swap bytes
>>> be*_to_cpup(p) is short for be*to_cpu(*p), update to use latter
>>> one explictly
>>
>> But why?
> 
> Because deleting code obfuscation constructs *is* the point of the cleanup.
> 
>> I really don't have a suggestion on the comment because I disagree
>> (and AFAICT Jan as well) with the approach.
> 
> Dropping the obfuscation has uncovered pre-existing bugs in the
> hypervisor.  The series stands on its own merit.

I am guessing you mean that we don't handle unaligned access? If so, yes 
I agree this helped with that.

> 
> While I can't help if you like it or not, it really does bring an
> improvement to code quality and legibility.
> 
> If you have no technical objections, and no suggestions for how to do it
> differently while retaining the quality and legibility improvements,
> then "I don't like it" doesn't block it going in.

And you don't like the existing code :). I am willing to compromise, but 
for that I need to understand why the existing code is technically not 
correct.

So far, all the arguments you provided in v3 was either a matter of 
taste or IMHO bogus.

Your taste is nor better nor worse than mine. At which, we need someone 
else to break the tie.

If I am not mistaken, Jan is also objecting on the proposal. At which 
point, we are 2 vs 1.

So there are three choices here:
   1) You find two others maintainers (including on Arm maintainer) to 
agree with you
   2) You provide arguments that will sway one of us in your side
   3) We keep be32_cpu*() (they are simple wrapper and I am willing to 
write the code).

Cheers,

-- 
Julien Grall

