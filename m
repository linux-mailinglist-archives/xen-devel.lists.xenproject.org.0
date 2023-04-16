Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C2DF6E3A6D
	for <lists+xen-devel@lfdr.de>; Sun, 16 Apr 2023 19:11:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.521613.810428 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1po5uB-0001Zz-LW; Sun, 16 Apr 2023 17:11:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 521613.810428; Sun, 16 Apr 2023 17:11:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1po5uB-0001Xb-I1; Sun, 16 Apr 2023 17:11:11 +0000
Received: by outflank-mailman (input) for mailman id 521613;
 Sun, 16 Apr 2023 17:11:09 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1po5u9-0001XV-TM
 for xen-devel@lists.xenproject.org; Sun, 16 Apr 2023 17:11:09 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1po5u7-0000XK-Hz; Sun, 16 Apr 2023 17:11:07 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1po5u7-0003ro-CE; Sun, 16 Apr 2023 17:11:07 +0000
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
	bh=8AONajZKn+lv7eWrYnz+VY0D8AXJ+oMC76DLB71utPU=; b=LPbY8LEbCPX+nKFd8m+8jYugve
	usPCRCCJ4HlCmP0a+EQjKn0DaZVaFdljL82hz9wFs2WnujCuS1XgKzwFGcCZC9RODiQyV0+6P0tu+
	1WNgK9qtg16pREhXaoeAik62xA5Bl57KE/nR99mEp0VwtGs7D48dmOp4cCd68qRKEgGM=;
Message-ID: <ca8cf5b9-ac8b-f48b-50ed-0b078f29c930@xen.org>
Date: Sun, 16 Apr 2023 18:11:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.0
To: Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Bob Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Oleksii <oleksii.kurochko@gmail.com>
References: <20230315185121.665635-1-andrew.cooper3@citrix.com>
 <4b50bbf0-96f7-c0ad-2bd4-cb204e8daef1@suse.com>
From: Julien Grall <julien@xen.org>
Subject: Re: [PATCH] xen/riscv: Fix build with GCC 10
In-Reply-To: <4b50bbf0-96f7-c0ad-2bd4-cb204e8daef1@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 16/03/2023 07:21, Jan Beulich wrote:
> On 15.03.2023 19:51, Andrew Cooper wrote:
>>    riscv64-linux-gnu-gcc -MMD -MP -MF arch/riscv/.early_printk.o.d -DBUILD_ID -fno-strict-aliasing -std=gnu99 -Wall -Wstrict-prototypes -Wdeclaration-after-statement -Wno-unused-but-set-variable -Wno-unused-local-typedefs   -O1 -fno-omit-frame-pointer -nostdinc -fno-builtin -fno-common -Werror -Wredundant-decls -Wno-pointer-arith -Wvla -pipe -D__XEN__ -include ./include/xen/config.h -Wa,--strip-local-absolute -g -mabi=lp64  -I./include -I./arch/riscv/include -march=rv64gc -mstrict-align -mcmodel=medany   -c arch/riscv/early_printk.c -o arch/riscv/early_printk.o
>>    arch/riscv/early_printk.c:18:2: error: #error "early_*() can be called from head.S with MMU-off"
>>       18 | #error "early_*() can be called from head.S with MMU-off"
>>          |  ^~~~~
>>
>>    $ riscv64-linux-gnu-gcc --version
>>    riscv64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110
>>
>> The binary is otherwise correct, so remove the incorrect check.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> 
> I'm with Julien here - this needs further explaining: The compiler (even 8.2)
> clearly provides this definition with the given set of command line options,
> as supported by trying it out om godbolt. So there must be more to this -
> could be a bad patch in Debian's build, could be some odd interaction of
> command line options which for whatever reason only triggers with certain
> builds, or about anything else.

I have tried to build RISC-v on my Debian Bulleyes machine today. The 
build failed with the same reason.

The Linux kernel (which has the exact same check) could be built. So I 
decided to dig why this happens.

I got a below code compiled when both -mcmodel=medany and -fno-pie are 
passed to the GCC command line:

#ifndef __riscv_cmodel_medany
#error "medany not enabled"
#endif

I am guessing that's because GCC on Debian has PIE enabled by default.
Now, Xen is meant to be built with -fno-pie, but this is not on the 
command line. So does any flags from EMBEDDED_EXTRA_CFLAGS.

Skimming through xen-devel, there is already a patch from Oleksii to add 
the cflags (see [1]). So with that in place, this patch becomes 
unnecessary to build Xen RISC-v on Debian.

Cheers,

[1] 
https://lore.kernel.org/all/2785518800dce64fafb3096480a5ae4c4e026bcb.1678970065.git.oleksii.kurochko@gmail.com/

-- 
Julien Grall

