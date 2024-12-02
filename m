Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 02C469E0AEB
	for <lists+xen-devel@lfdr.de>; Mon,  2 Dec 2024 19:24:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.846955.1262078 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tIB5B-000760-RR; Mon, 02 Dec 2024 18:23:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 846955.1262078; Mon, 02 Dec 2024 18:23:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tIB5B-00073i-Oj; Mon, 02 Dec 2024 18:23:41 +0000
Received: by outflank-mailman (input) for mailman id 846955;
 Mon, 02 Dec 2024 18:23:40 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1tIB5A-00073a-0N
 for xen-devel@lists.xenproject.org; Mon, 02 Dec 2024 18:23:40 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1tIB53-000Ls2-1D;
 Mon, 02 Dec 2024 18:23:33 +0000
Received: from [2a02:8012:3a1:0:c6e:c614:26eb:b495]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1tIB53-00AuT8-1A;
 Mon, 02 Dec 2024 18:23:33 +0000
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
	bh=Zf+CN+1FO8AbVDZckrdqTGAafV0mB3ewjuyGTquR5HE=; b=kTJurHE7h4ofFG11BGg/+W49Xx
	VrmTzaOvglrtNGBqs0g7FijGOvkAqD+H1fCOCnBft5fWhVEzQHPjmgzK/15kjV/zjNBRBCU2x02OF
	NRgEmajTjqnheEvVWKfGnc+WlHJM7Fq3Y3ikaV0uuznaAzsag8kFVdVDmEirjnEWOn7A=;
Message-ID: <71681528-6571-4d31-830c-89bbad6b55a5@xen.org>
Date: Mon, 2 Dec 2024 18:23:31 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/arm32: Get rid of __memzero()
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>
Cc: Julien Grall <jgrall@amazon.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org
References: <20241127105512.88703-1-julien@xen.org>
 <0e3ddfc0-af52-4127-a130-76299101f6ec@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <0e3ddfc0-af52-4127-a130-76299101f6ec@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jan,

On 27/11/2024 11:09, Jan Beulich wrote:
> On 27.11.2024 11:55, Julien Grall wrote:
>> From: Julien Grall <jgrall@amazon.com>
>>
>> All the code in arch/arm32/lib/ where copied from Linux 3.16
>> and never re-synced since then.
>>
>> A few years ago, Linux got rid of __memzero() because the implementation
>> is very similar to memset(p,0,n) and the current use of __memzero()
>> interferes with optimization. See full commit message from Linux below.
>>
>> So it makes sense to get rid of __memzero in Xen as well.
>>
>>      From ff5fdafc9e9702846480e0cea55ba861f72140a2 Mon Sep 17 00:00:00 2001
>>      From: Nicolas Pitre <nicolas.pitre@linaro.org>
>>      Date: Fri, 19 Jan 2018 18:17:46 +0100
>>      Subject: [PATCH] ARM: 8745/1: get rid of __memzero()
>>
>>      The __memzero assembly code is almost identical to memset's except for
>>      two orr instructions. The runtime performance of __memset(p, n) and
>>      memset(p, 0, n) is accordingly almost identical.
>>
>>      However, the memset() macro used to guard against a zero length and to
>>      call __memzero at compile time when the fill value is a constant zero
>>      interferes with compiler optimizations.
>>
>>      Arnd found tha the test against a zero length brings up some new
>>      warnings with gcc v8:
>>
>>        https://gcc.gnu.org/bugzilla/show_bug.cgi?id=82103
>>
>>      And successively rremoving the test against a zero length and the call
>>      to __memzero optimization produces the following kernel sizes for
>>      defconfig with gcc 6:
>>
>>          text     data     bss       dec       hex  filename
>>      12248142  6278960  413588  18940690   1210312  vmlinux.orig
>>      12244474  6278960  413588  18937022   120f4be  vmlinux.no_zero_test
>>      12239160  6278960  413588  18931708   120dffc  vmlinux.no_memzero
>>
>>      So it is probably not worth keeping __memzero around given that the
>>      compiler can do a better job at inlining trivial memset(p,0,n) on its
>>      own. And the memset code already handles a zero length just fine.
>>
>>      Suggested-by: Arnd Bergmann <arnd@arndb.de>
>>      Signed-off-by: Nicolas Pitre <nico@linaro.org>
>>      Acked-by: Ard Biesheuvel <ard.biesheuvel@linaro.org>
>>      Acked-by: Arnd Bergmann <arnd@arndb.de>
>>      Signed-off-by: Russell King <rmk+kernel@armlinux.org.uk>
>>
>> Origin: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git ff5fdafc9e97
>> Signed-off-by: Julien Grall <jgrall@amazon.com>
> 
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Thanks!

> with a suggestion:
> 
>> --- a/xen/arch/arm/README.LinuxPrimitives
>> +++ b/xen/arch/arm/README.LinuxPrimitives
>> @@ -108,10 +108,9 @@ linux/arch/arm/lib/memchr.S             xen/arch/arm/arm32/lib/memchr.S
>>   linux/arch/arm/lib/memcpy.S             xen/arch/arm/arm32/lib/memcpy.S
>>   linux/arch/arm/lib/memmove.S            xen/arch/arm/arm32/lib/memmove.S
>>   linux/arch/arm/lib/memset.S             xen/arch/arm/arm32/lib/memset.S
>> -linux/arch/arm/lib/memzero.S            xen/arch/arm/arm32/lib/memzero.S
>>   
>>   for i in copy_template.S memchr.S memcpy.S memmove.S memset.S \
>> -         memzero.S ; do
>> +        ; do
>>       diff -u linux/arch/arm/lib/$i xen/arch/arm/arm32/lib/$i
>>   done
> 
> Also do away with the line continuation at the same time? E.g.
> 
> for i in copy_template.S memchr.S memcpy.S memmove.S memset.S; do
>      diff -u linux/arch/arm/lib/$i xen/arch/arm/arm32/lib/$i
> done

I will go with this version because I don't expect the number of files 
to increase.

Cheers,

-- 
Julien Grall


