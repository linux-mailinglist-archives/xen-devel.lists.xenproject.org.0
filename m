Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A75392E7A1
	for <lists+xen-devel@lfdr.de>; Thu, 11 Jul 2024 13:55:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.757410.1166319 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sRsNl-0000Rw-QZ; Thu, 11 Jul 2024 11:54:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 757410.1166319; Thu, 11 Jul 2024 11:54:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sRsNl-0000PE-NZ; Thu, 11 Jul 2024 11:54:41 +0000
Received: by outflank-mailman (input) for mailman id 757410;
 Thu, 11 Jul 2024 11:54:40 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1sRsNk-0000P8-TZ
 for xen-devel@lists.xenproject.org; Thu, 11 Jul 2024 11:54:40 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1sRsNj-00005x-3m; Thu, 11 Jul 2024 11:54:39 +0000
Received: from [15.248.3.91] (helo=[10.24.67.27])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1sRsNi-0006FK-RT; Thu, 11 Jul 2024 11:54:38 +0000
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
	bh=4c14mXkF5coarEc+a2hc7DKFgGUnsQvZ0Ng0SvEWVTY=; b=cX+NKEO/oJJj0KU2km5MbIXhR4
	L4DPiBoiFvDA8YB0XuATXyLZ6n3wisdhXM2FrNIb4nd5HxxwA/RitixTiMKuJtmquUbCJQbt3LgnG
	TDYBydRALTvATtXbvlZ/vui7SwhuPmn6gk07rFEGU1kvRq90nbh5O3T11aEo1eHi7bm8=;
Message-ID: <5c6fbbbf-f6bf-43b3-9628-a92c69e3adb1@xen.org>
Date: Thu, 11 Jul 2024 12:54:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 5/5] xen/riscv: map FDT
Content-Language: en-GB
To: Oleksii <oleksii.kurochko@gmail.com>, Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1720002425.git.oleksii.kurochko@gmail.com>
 <7e492df051c949744755a221c0448c740d2c681b.1720002425.git.oleksii.kurochko@gmail.com>
 <3afd94c0-25f4-4ed8-83d2-6f261b8a64b3@suse.com>
 <021d29540f8e9abec118e9ca9dcd9675310eda84.camel@gmail.com>
 <9592e857-bf1c-4e26-acd7-dfb5bb12103e@suse.com>
 <fda966116ce17b9be0b1a467bd31436a6b5ad225.camel@gmail.com>
 <e58a9128-efdd-4bff-9562-08d5605d0a13@suse.com>
 <040e6b1d9b8bbe2b316e0e5b891c2564df28335d.camel@gmail.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <040e6b1d9b8bbe2b316e0e5b891c2564df28335d.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 11/07/2024 12:28, Oleksii wrote:
> Add Julien as he asked basically the same question in another thread.

Thanks!

> 
> On Thu, 2024-07-11 at 12:50 +0200, Jan Beulich wrote:
>> On 11.07.2024 12:26, Oleksii wrote:
>>> On Thu, 2024-07-11 at 11:54 +0200, Jan Beulich wrote:
>>>> On 11.07.2024 11:40, Oleksii wrote:
>>>>> On Wed, 2024-07-10 at 14:38 +0200, Jan Beulich wrote:
>>>>>> On 03.07.2024 12:42, Oleksii Kurochko wrote:
>>> Does it make sense now?
>>
>> I think so, yet at the same time it only changes the question: Why is
>> it
>> that you absolutely need to use setup_initial_mapping()?
> There is no strict requirement to use setup_initial_mapping(). That
> function is available to me at the moment, and I haven't found a better
> option other than reusing what I currently have.

I am not very familiar with the code base for RISC-V, but looking at the 
context in the patch, it seems you will still have the identity mapping 
mapped until start_xen().

I assume we don't exactly know where the loader will put Xen in memory. 
Which means that the region may clash with your defined runtime regions 
(such as the FDT). Did I misunderstand anything?

That's one of the reason on Arm we are trying to enable the MMU very 
early. The only thing we setup is a mapping for Xen (and earlyprintk) 
all the rest will be mapped once the MMU is on.

With that, the only thing you need to take care off the runtime Xen 
address overlapping with the identity mapping.

Cheers,

-- 
Julien Grall

