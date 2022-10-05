Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 06F7D5F52CD
	for <lists+xen-devel@lfdr.de>; Wed,  5 Oct 2022 12:45:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.416047.660665 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1og1tN-0003y1-L3; Wed, 05 Oct 2022 10:44:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 416047.660665; Wed, 05 Oct 2022 10:44:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1og1tN-0003vT-I2; Wed, 05 Oct 2022 10:44:45 +0000
Received: by outflank-mailman (input) for mailman id 416047;
 Wed, 05 Oct 2022 10:44:44 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1og1tM-0003vN-Kn
 for xen-devel@lists.xenproject.org; Wed, 05 Oct 2022 10:44:44 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1og1tK-00061W-IR; Wed, 05 Oct 2022 10:44:42 +0000
Received: from [15.248.2.148] (helo=[10.24.67.30])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1og1tK-0003NP-AD; Wed, 05 Oct 2022 10:44:42 +0000
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
	bh=CYMuxihqC4AfAG0cHSQDhpXhlHLgEa1zHmWlXfgXLT8=; b=m1GfsfQ6S+5HdP9fsKGdXrH8I6
	JVj4DbEDRjZkFAjjwOolv7adeNnFXyOwNkDqdj/zy680K6TfEWMbyDrtLQFn7stJ2EsOow+0UfKVr
	X09L0wE4Qg2YeFF9yf/cVYoUrSz7vCndHpxJar496pLzY7H7TxtK8f8DB4L6DH0CkjS4=;
Message-ID: <f1a71d28-ed04-0936-47e3-aa7a9f8c6dbc@xen.org>
Date: Wed, 5 Oct 2022 11:44:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.0
Subject: Re: [PATCH][4.17] EFI: don't convert memory marked for runtime use to
 ordinary RAM
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Henry Wang <Henry.Wang@arm.com>
References: <cc0fbcb4-5ea3-178c-e691-9acb7cc9a3a7@suse.com>
 <9C12552C-0A64-433D-9F0C-5672281DD45D@arm.com>
 <73faf43d-56e2-2bbf-6336-f6420a1aa0c0@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <73faf43d-56e2-2bbf-6336-f6420a1aa0c0@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jan,

On 04/10/2022 16:58, Jan Beulich wrote:
> On 30.09.2022 14:51, Bertrand Marquis wrote:
>>> On 30 Sep 2022, at 09:50, Jan Beulich <jbeulich@suse.com> wrote:
>>>
>>> efi_init_memory() in both relevant places is treating EFI_MEMORY_RUNTIME
>>> higher priority than the type of the range. To avoid accessing memory at
>>> runtime which was re-used for other purposes, make
>>> efi_arch_process_memory_map() follow suit. While on x86 in theory the
>>> same would apply to EfiACPIReclaimMemory, we don't actually "reclaim"
>>> E820_ACPI memory there and hence that type's handling can be left alone.
>>>
>>> Fixes: bf6501a62e80 ("x86-64: EFI boot code")
>>> Fixes: facac0af87ef ("x86-64: EFI runtime code")
>>> Fixes: 6d70ea10d49f ("Add ARM EFI boot support")
>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>
>> Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com> #arm
> 
> Thanks. However ...
> 
>>> ---
>>> Partly RFC for Arm, for two reasons:
>>>
>>> On Arm I question the conversion of EfiACPIReclaimMemory, in two ways:
>>> For one like on x86 such ranges would likely better be retained, as Dom0
>>> may (will?) have a need to look at tables placed there. Plus converting
>>> such ranges to RAM even if EFI_MEMORY_WB is not set looks suspicious to
>>> me as well. I'd be inclined to make the latter adjustment right here
>>> (while the other change probably would better be separate, if there
>>> aren't actually reasons for the present behavior).
> 
> ... any views on this WB aspect at least (also Stefano or Julien)? Would be
> good to know before I send v2.

I don't quite understand what you are questioning here. Looking at the 
code, EfiACPIReclaimMemory will not be converted to RAM but added in a 
separate array.

Furthermore, all the EfiACPIReclaimMemory regions will be passed to dom0 
(see acpi_create_efi_mmap_table()).

So to me the code looks correct.

Cheers,

-- 
Julien Grall

