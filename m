Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B48A65FF46B
	for <lists+xen-devel@lfdr.de>; Fri, 14 Oct 2022 22:15:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.423120.669599 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ojR5l-0007BF-7N; Fri, 14 Oct 2022 20:15:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 423120.669599; Fri, 14 Oct 2022 20:15:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ojR5l-00078r-4g; Fri, 14 Oct 2022 20:15:37 +0000
Received: by outflank-mailman (input) for mailman id 423120;
 Fri, 14 Oct 2022 20:15:36 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1ojR5k-00078e-4o
 for xen-devel@lists.xenproject.org; Fri, 14 Oct 2022 20:15:36 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ojR5h-0000mB-4D; Fri, 14 Oct 2022 20:15:33 +0000
Received: from gw1.octic.net ([81.187.162.82] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ojR5g-0004Pi-V7; Fri, 14 Oct 2022 20:15:33 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:Subject:
	From:References:Cc:To:MIME-Version:Date:Message-ID;
	bh=wNWWhMBvBmeb140clZPL3vn64juCKjyuEISDfRUrMN4=; b=JtfRn1eRfkntpwsZtOLE1c5tQK
	D4ec9XrbVunfizm/b2iM/EWkYvem8HGHCU9i5Qlf8oZGHF6gEj4IcNs8Y9NrL+Gqg/gGmeWfJv0dX
	wuEu+A4YRqeOwKk1vdnDOzL8jB64vEOF/noY0xuM0FGEu1nvsrknpzIlzWGL7WVMR/aY=;
Message-ID: <456e5a86-a875-bc30-cf8b-e4497afc530d@xen.org>
Date: Fri, 14 Oct 2022 21:15:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.2
To: Stewart Hildebrand <stewart.hildebrand@amd.com>,
 Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Henry Wang <Henry.Wang@arm.com>, xen-devel@lists.xenproject.org
References: <20221014025354.30248-1-stewart.hildebrand@amd.com>
 <0ade954c-5741-754c-fc59-177feb67ddf4@suse.com>
 <5f985e76-e817-5d44-3463-ffc0a98c407c@xen.org>
 <728f2beb-dc28-9140-0fec-0a67bc49f3f4@amd.com>
From: Julien Grall <julien@xen.org>
Subject: Re: [PATCH] xen/arm: mark handle_linux_pci_domain() __init
In-Reply-To: <728f2beb-dc28-9140-0fec-0a67bc49f3f4@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Stewart,

On 14/10/2022 20:23, Stewart Hildebrand wrote:
> On 10/14/22 04:22, Julien Grall wrote:
>> Hi,
>>
>> On 14/10/2022 08:16, Jan Beulich wrote:
>>> On 14.10.2022 04:53, Stewart Hildebrand wrote:
>>>> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
>>>
>>> I guess a non-empty description and a Fixes: tag would be nice.
> 
> Okay, I will send a v2 with the following description:
> All functions in domain_build.c should be marked __init. This was 
> spotted when building the hypervisor with -Og.
> 
> Fixes: 1050a7b91c xen/arm: add pci-domain for disabled devices
> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
> 
>> +1. I am actually quite interested to understand how this was spotted.
>>
>> The build system should check that any function/data in domain_build.c
>> are part of the __init section. So I guess the compiler you are using
>> doesn't inline the function?
>>
>> If so, I am actually surprised you are the first one spotted this... We
>> are building on various distribution without any issues (?). I would be
>> interested to know the compiler version and maybe we could add it in the
>> CI.
> 
> I added -Og to the make command line so it takes precedence over the 
> default -O1/-O2:
> 
> $ make EXTRA_CFLAGS_XEN_CORE="-Og" XEN_TARGET_ARCH=arm64 
> CROSS_COMPILE=aarch64-none-linux-gnu- dist-xen -j $(nproc)
> 
> Indeed, I did observe the build error:
> Error: size of arch/arm/domain_build.o:.text is 0x00000008
> 
> I used this rune to reveal the culprit:
> 
> $ aarch64-none-linux-gnu-objdump -d xen/arch/arm/domain_build.o | head
> 
> xen/arch/arm/domain_build.o:     file format elf64-littleaarch64
> 
> 
> Disassembly of section .text:
> 
> 0000000000000000 <handle_linux_pci_domain>:
>      0:   52800000        mov     w0, #0x0                        // #0
>      4:   d65f03c0        ret
> 
> I am using this toolchain: 
> https://developer.arm.com/-/media/Files/downloads/gnu/11.3.rel1/binrel/arm-gnu-toolchain-11.3.rel1-x86_64-aarch64-none-linux-gnu.tar.xz

Thanks for the details. I guess the '-Og' is the culprint.

> 
> Further, there were two more build errors observed when building with -Og:
> arch/arm/domain_build.c: In function ‘make_cpus_node’:
> arch/arm/domain_build.c:2013:12: error: ‘clock_valid’ may be used 
> uninitialized in this function [-Werror=maybe-uninitialized]
>   2013 |         if ( clock_valid )
>        |            ^

I think this is a false positive because 'clock_valid' is set at the 
same time as 'compatible'. The latter is check that is not NULL just 
after it is set.

In general, I tend to prefer if variable are not initialized (unless 
strictly necessary) because we can take advantage of the compiler to 
spot any issue.

In this case, it should not be a big problem because the default value 
(false) would be sensible here.

> 
> arch/arm/efi/boot.c: In function ‘efi_start’:
> arch/arm/efi/boot.c:1464:9: error: ‘argc’ may be used uninitialized in 
> this function [-Werror=maybe-uninitialized]
>   1464 |         efi_arch_handle_cmdline(argc ? *argv : NULL, options, 
> name.s);
>        | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

I am a bit puzzled why it warn on this line but not few lines above 
where it is already used.

This function is a bit difficult to read. AFAIU, the code look like:

if ( use_cfg_file )
{
    argc = ...
}

/* do something common */

if ( use_cfg_file )
   efi_arch_handle_cmd(argc, ...);

The GCC with -Og is probably not capable to detect that argc will always 
be used when 'use_cfg_file'.

The "do something common" is two lines. So I am tempted to suggest to 
just duplicate those two lines. This could also allow us to move all the 
code in the ifs (nearly 100 lines over the two ifs!) in a separate function.

But I think Jan (the maintainer of the code) may not be happy with 
that). So short of a second better suggestion, initializing 'argc' to 0 
(?) and a comment explaining this is to silence the compiler may be the 
way to go.

Cheers,

-- 
Julien Grall

