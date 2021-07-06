Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B3253BD836
	for <lists+xen-devel@lfdr.de>; Tue,  6 Jul 2021 16:24:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.151405.279819 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0lzv-00050A-9c; Tue, 06 Jul 2021 14:24:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 151405.279819; Tue, 06 Jul 2021 14:24:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0lzv-0004x4-6b; Tue, 06 Jul 2021 14:24:27 +0000
Received: by outflank-mailman (input) for mailman id 151405;
 Tue, 06 Jul 2021 14:24:25 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1m0lzt-0004wy-Mj
 for xen-devel@lists.xenproject.org; Tue, 06 Jul 2021 14:24:25 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1m0lzs-0002ni-Hb; Tue, 06 Jul 2021 14:24:24 +0000
Received: from [54.239.6.188] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1m0lzs-0007FN-Av; Tue, 06 Jul 2021 14:24:24 +0000
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
	bh=ePerZbtaBFYWtRtl+H/GYsuY6iX29lYBszuvuXenR6Y=; b=MCaUkTl7zabgsMK0Nhfy8eM7yq
	Vf4RjVaJoJR8Wd+4L4Ert0IyzAEqxBct0M52L+TfPl90vFdWiKpLYeMOnwD/8Wfl+NkpLDL4aeIFG
	NHToe5TOhX2ze5r2r4tscSEN0m3VwYH6ihIufgYWWOPyBQzhPS7DDvvoQmIRVpyOMR94=;
Subject: Re: [PATCH] tools/xen-foreign: Update the size for
 vcpu_guest_{core_regs, context}
To: Jan Beulich <jbeulich@suse.com>
Cc: Julien Grall <jgrall@amazon.com>, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>, michal.orzel@arm.com, olaf@aepfle.de,
 xen-devel@lists.xenproject.org
References: <20210706132000.29892-1-julien@xen.org>
 <fa29ee07-0231-378b-4f28-07d894b371f5@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <07a19e2c-161c-cb41-1023-f8b6e6a766bc@xen.org>
Date: Tue, 6 Jul 2021 15:24:22 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <fa29ee07-0231-378b-4f28-07d894b371f5@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi,

On 06/07/2021 15:07, Jan Beulich wrote:
> On 06.07.2021 15:20, Julien Grall wrote:
>> From: Julien Grall <jgrall@amazon.com>
>>
>> Commit 918b8842a852 ("arm64: Change type of hsr, cpsr, spsr_el1 to
>> uint64_t") updated the size of the structure vcpu_guest_core_regs and
>> indirectly vcpu_guest_context.
>>
>> On Arm, the two structures are only accessible to the tools and the
>> hypervisor (and therefore stable). However, they are still checked
> 
> I suppose s/stable/not stable/ and ...
> 
>> by the scripts in tools/include/xen-foreign are not able to understand
>> that.
>>
>> Ideally we should rework the scripts so we don't have to update
>> the size for non-stable structure. But I don't have limited time
> 
> ... s/don't/only/ ?

Yes I will update.

> 
>> to spend on the issue. So chose the simple solution and update
>> the size accordingly.
>>
>> Note that we need to keep vcpu_guest_core_regs around because
>> the structure is used by vcpu_guest_context and therefore the
>> scripts expects the generated header to contain it.
> 
> If vcpu_guest_context is also tools-only, why does it need keeping
> (for Arm)? IOW can't you drop vcpu_guest_core_regs from the scripts
> altogether, and mark vcpu_guest_context with valid sizes for x86
> only?
I have tried to use "-" in place of the size but the checker is still 
not happy. I didn't find another way without modifying the script...

I don't know the script and I don't have a lot of time to work on the 
bug fix. So this is not something I could do this week.

So this leave us to the following options:
   1) Someone volunteer to fix the script
   2) Revert the patch that broke the build
   3) Accept this patch

I would prefer 3) so we have more time to work on making the script a 
lot smarter.

Cheers,

-- 
Julien Grall

