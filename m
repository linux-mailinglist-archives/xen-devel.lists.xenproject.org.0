Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AA568553425
	for <lists+xen-devel@lfdr.de>; Tue, 21 Jun 2022 16:05:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.353277.580204 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o3eVT-0004Xv-G1; Tue, 21 Jun 2022 14:05:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 353277.580204; Tue, 21 Jun 2022 14:05:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o3eVT-0004Vt-Cf; Tue, 21 Jun 2022 14:05:27 +0000
Received: by outflank-mailman (input) for mailman id 353277;
 Tue, 21 Jun 2022 14:05:26 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1o3eVS-0004Vn-C9
 for xen-devel@lists.xenproject.org; Tue, 21 Jun 2022 14:05:26 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1o3eVS-0005ia-1K; Tue, 21 Jun 2022 14:05:26 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235] helo=[192.168.3.84])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1o3eVR-0003tw-Pu; Tue, 21 Jun 2022 14:05:25 +0000
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
	References:To:Subject:MIME-Version:Date:Message-ID;
	bh=8WPV//DXzD7BGCF2jxKSwFmFoQ5RDYtBd22QB0lwcRM=; b=D4/dRwdToKmxMFBjGwtrH6ChNN
	PNgIcdxmNdYS8FSZb9+QW0YKYgUR/rHQV398ZuDjEaNIk//fEnGh0g6v+mCMj6k2ZNjQClU+JHqda
	o65d6Pxa1/GzX9d7GgRS/e5EuTBVwjRJGVPQ5fh8mQEKySRqpBtWPwA4LzCu1ApRq5cQ=;
Message-ID: <c97de57c-4812-cdfc-f329-cc2e1d950dc7@xen.org>
Date: Tue, 21 Jun 2022 15:05:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.10.0
Subject: Re: XTF-on-ARM: Bugs
To: Andrew Cooper <Andrew.Cooper3@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Michal Orzel <Michal.Orzel@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Christopher Clark <christopher.w.clark@gmail.com>,
 Daniel Smith <dpsmith@apertussolutions.com>,
 Roger Pau Monne <roger.pau@citrix.com>,
 George Dunlap <George.Dunlap@citrix.com>
References: <7f490d75-153d-7e1d-b3c0-5418ff7fdf8f@citrix.com>
 <b8f05e22-c30d-d4b2-b725-9db91ee7a09d@xen.org>
 <fd30be68-d1ac-b1bc-b3f1-cff589f338ee@citrix.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <fd30be68-d1ac-b1bc-b3f1-cff589f338ee@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Andrew,

On 21/06/2022 14:30, Andrew Cooper wrote:
> On 21/06/2022 13:07, Julien Grall wrote:
>> On 21/06/2022 12:27, Andrew Cooper wrote:
>>> Hello,
>>> I tried to have a half hour respite from security and push forward
>>> with XTF-on-ARM, but the result was a mess.
>>>
>>> https://github.com/andyhhp/xtf/commit/bc86e2d271f2107da9b1c9bc55a050dbdf07c6c6
>>> is the absolute bare minimum stub VM, which has a zImage{32,64}
>>> header, sets up the stack, makes one CONSOLEIO_write hypercall, and
>>> then a clean SCHEDOP_shutdown.
>>>
>>> There are some bugs:
>>>
>>> 1) kernel_zimage32_probe() rejects relocatable binaries, but if I
>>> skip the check it works fine.
>>
>> Hmmmm... which check are you referring to?
> 
> if ( (end - start) > size )
>      return -EINVAL;
> 
> Although now I think about it, the problem is subtly different.
> 
> Section Headers:
>    [Nr] Name              Type            Addr     Off    Size   ES Flg
> Lk Inf Al
>    [ 0]                   NULL            00000000 000000 000000 00
> 0   0  0
>    [ 1] .text             PROGBITS        40000000 010000 000094 00  AX
> 0   0  4
>    [ 2] .data             PROGBITS        40001000 011000 000000 00  WA
> 0   0  1
>    [ 3] .rodata           PROGBITS        40001000 011000 000012 00   A
> 0   0  4
>    [ 4] .bss              NOBITS          40002000 011012 001000 00  WA
> 0   0  4
> 
> end is calculated as 0x3000 which includes the bss (inc stack which is
> bss page aligned), while the raw binary size is 0x1012 because it stops
> at the end of .rodata.

Ok. I agree this is a bug. Can you send a patch?
>>> Furthermore, kernel_zimage64_probe() ignores the header and assumes
>>> the binary is relocatable.
>>
>> Are you referring to bit 3 "Kernel physical placement"?
> 
> No. This:
> 
> /* Currently there is no length in the header, so just use the size */
> start = 0;
> end = size;
> 
> Which isn't true even for the v0 header.  The field named text_offset in
> Xen's code is start, and res1 is end (or size for relocatable).

Hmmm... text_offset is not the start. But I agree that res1 is the 
effective size and should be used instead of the binary size.

>>
>>> Both probe functions fail to check the endianness marker.
>>
>> AFAIU the header is little endian. So it is not clear to me why we
>> should check the endianess marker?
> 
> Not the endieness of the header, the endianness of the image.  Both
> headers have a field which should ought to be checked for != LE seeing
> as Xen doesn't support big endian domains yet

Aside potential bugs, big endian OS should boot on Xen (PV protocol and 
hypercalls are always litte endian).

[...]

>>> (XEN) Hardware Dom0 halted: halting machine
>>>
>>> which is weird.  The CONSOLEIO_write fails to read the passed
>>> pointer, despite appearing to have a ip-relative load to find the
>>> string, while the SCHEDOP_shutdown passes its parameter fine (it's a
>>> stack relative load).
>>
>>  From a brief look, your code is still running with MMU off and Cache
>> "off" (on armv8, it is more a bypass "cache" rather than off).
>>
>> This means that you ought to be a lot more careful when
>> reading/writing value to avoid reading any stall data.
> 
> There are no relocation/etc so everything has well defined behaviour
> even when the caches are off.

The problem is you are writing to the stack and then passing a pointer 
to the stack to Xen. For hypercalls, we mandate the memory to be 
cacheable (see arch-arm.h). So Xen may read a different value than what 
you passed.
>>> Other observations:
>>>
>>> * There is no documented vCPU starting state.
>>
>> See
>> https://github.com/torvalds/linux/blob/master/Documentation/arm64/booting.rst.
> 
> What's it got to do with Xen's vCPU starting state?

Because we are following what Image defined. Anything outside is 
implementation defined and not something that an OS should rely on.

>  Also, that's
> clearly not relevant for arm32 even if the implication is "Xen only
> speaks the Linux ABI".

The interface exposed to the guest depends on the binary format used. At 
the moment, we are implementing zImage, Image and U-boot. If there were 
another, then the vCPU will be the same as defined by the new format.

> 
> It needs to be in docs/ (or public at a stretch) and not in the heads of
> the maintainers.

Patches are welcomed.

>>
>>> * Qemu is infinitely easier to to use (i.e. no messing with dtb/etc)
>>> as -kernel xen -initrd test-$foo with a oneliner change to the dtb
>>> parsing to treat ramdisk and no kernel as the dom0 kernel.  Maybe a
>>> better change would be to modify qemu to understand multiple -kernel's.
>>> * Xen can't load ELFs.
>>
>> The support was dropped in 2018 because it was bogus and not used:
>>
>> https://lists.xenproject.org/archives/html/xen-devel/2018-06/msg00242.html
>>
>>
>> Personally, I think that zImage/Image is simple enough that
>> re-introducing ELF is not worth it. But I would be OK to consider
>> patches if you feel like writing them.
> 
> There is a massive usability improvement from being able to point normal
> toolchain tools at the same binary you're trying to load.
Ditto.

Cheers,

-- 
Julien Grall

