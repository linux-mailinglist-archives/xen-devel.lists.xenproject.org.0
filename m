Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 517A2342CB1
	for <lists+xen-devel@lfdr.de>; Sat, 20 Mar 2021 13:10:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.99475.189187 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lNaQK-0007XR-SJ; Sat, 20 Mar 2021 12:09:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 99475.189187; Sat, 20 Mar 2021 12:09:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lNaQK-0007X5-OW; Sat, 20 Mar 2021 12:09:44 +0000
Received: by outflank-mailman (input) for mailman id 99475;
 Sat, 20 Mar 2021 12:09:43 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lNaQJ-0007X0-1H
 for xen-devel@lists.xenproject.org; Sat, 20 Mar 2021 12:09:43 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lNaQH-0005gt-OQ; Sat, 20 Mar 2021 12:09:41 +0000
Received: from home.octic.net ([81.187.162.82]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lNaQH-0005ru-I2; Sat, 20 Mar 2021 12:09:41 +0000
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
	bh=eRwJPj+z72UMylNV3VDbMUJRhrRD3K+cnX2jCCFbNu0=; b=leXhkRYFITlJsj7rQvW4vroqpu
	J/vkv3xK9ijUdj58X1IxtL/3gfHdAg215vg0Y7X2JeV37AS5Rs/6N4g7+JrnDEMzoL8Js2R8NC2nX
	82Mz+MFh1Oqp9wCKUyh/8WPavbNWcCCW3E4Q4qq9vIeZCXaOyE7rxifyNkDeRbHXzs6Y=;
Subject: Re: [PATCH for-next v2 1/2] xen/arm: Include asm/asm-offsets.h and
 asm/macros.h on every assembly files
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Julien Grall <jgrall@amazon.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20210313160611.18665-1-julien@xen.org>
 <20210313160611.18665-2-julien@xen.org>
 <2B11BB5C-EF9B-4CE0-8477-D94091DA0870@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <311a97f6-e4ad-9f5e-cca5-301c79cae52b@xen.org>
Date: Sat, 20 Mar 2021 12:09:39 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <2B11BB5C-EF9B-4CE0-8477-D94091DA0870@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 17/03/2021 14:38, Bertrand Marquis wrote:
> Hi Julien,

Hi Bertrand,

>> On 13 Mar 2021, at 16:06, Julien Grall <julien@xen.org> wrote:
>>
>> From: Julien Grall <jgrall@amazon.com>
>>
>> In a follow-up patch we may want to automatically replace some
>> mnemonics (such as ret) with a different sequence.
>>
>> To ensure all the assembly files will include asm/macros.h it is best to
>> automatically include it on single assembly. This can be done via
>> config.h.
>>
>> It was necessary to include a few more headers as dependency:
>>   - <asm/asm_defns.h> to define sizeof_*
>>   - <xen/page-size.h> which is already a latent issue given STACK_ORDER
>>   rely on PAGE_SIZE.
>>
>> Unfortunately the build system will use -D__ASSEMBLY__ when generating
>> the linker script. A new option -D__LINKER__ is introduceed and used for
>> the linker script to avoid including headers (such as asm/macros.h) that
>> may not be compatible with the syntax.
>>
>> Lastly, take the opportunity to remove both asm/asm-offsets.h and
>> asm/macros.h from the various assembly files as they are now
>> automagically included.
>>
>> Signed-off-by: Julien Grall <jgrall@amazon.com>
> 
> Everything is now building :-)
> 
> I could not find a better then your define as filtering out or undefining __ASSEMBLY__
> is actually not working.

Yes, unfortunately the linker is also relying on __ASSEMBLY__ for a few 
macros and to also remove the definitions of structure/function from 
headers that can be included either in C or assembly.

-D__LINKER__ was the best option I could come up with.

> 
> So with the fix from offset to defns:
> 
> Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Thanks! I will resend a new version with the fix fold in this patch.

Cheers,

-- 
Julien Grall

