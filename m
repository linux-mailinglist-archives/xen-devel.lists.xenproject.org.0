Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B1FC66A80A7
	for <lists+xen-devel@lfdr.de>; Thu,  2 Mar 2023 12:02:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.504851.777277 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXgh8-0003jU-RH; Thu, 02 Mar 2023 11:01:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 504851.777277; Thu, 02 Mar 2023 11:01:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXgh8-0003gk-NT; Thu, 02 Mar 2023 11:01:54 +0000
Received: by outflank-mailman (input) for mailman id 504851;
 Thu, 02 Mar 2023 11:01:53 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pXgh7-0003ge-1k
 for xen-devel@lists.xenproject.org; Thu, 02 Mar 2023 11:01:53 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pXgh3-0006fP-FY; Thu, 02 Mar 2023 11:01:49 +0000
Received: from [15.248.2.148] (helo=[10.24.67.20])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pXgh3-0001oe-9R; Thu, 02 Mar 2023 11:01:49 +0000
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
	bh=HGulaKZoXZdnFCcbKBY1voc3LARWb9NX3FCIoC9GUNo=; b=3B/3wAgbUF43WueQQZqS6PFxnu
	hkKwCQYXL+De32PuDmCXKVyB6YBVchStrBlk8ZN3pRRyNQ3HBhcOuzHhaz1Mzi92Ypj91ZXy3ujYq
	VFQbrl3SqMyUCRBRXrcid2CSFQFn7v8oMd/4BhkQacKpy3eoUqKG1mRup3dD0RrtJEto=;
Message-ID: <7e69d61b-60ca-b93a-36d3-77a1a3e550ec@xen.org>
Date: Thu, 2 Mar 2023 11:01:46 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v1] xen/arm: align *(.proc.info) in the linker script
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>, Oleksii <oleksii.kurochko@gmail.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org
References: <74973920d8722df3ce533979314564f331acf16e.1677687247.git.oleksii.kurochko@gmail.com>
 <370809af-75e6-546a-53e4-71a76444f367@xen.org>
 <a9c2638cd8620d74ec719845132ef65f08b4c934.camel@gmail.com>
 <cf15b113-ac6f-e115-6c38-38b25a265934@xen.org>
 <f2f6544a-a59e-2e10-0b8f-080f91708459@xen.org>
 <9e34f587-d42d-3709-9c64-b5e50afdd046@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <9e34f587-d42d-3709-9c64-b5e50afdd046@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 02/03/2023 09:45, Jan Beulich wrote:
> On 01.03.2023 21:38, Julien Grall wrote:
>> On 01/03/2023 17:50, Julien Grall wrote:
>>> I got the answer. The problem now is gitlab only keep the artifact for
>>> the latest build and it only provide a zImage (having the ELF would be
>>> easier).
>>>
>>> I will try to reproduce the error on my end.
>>
>> I managed to reproduce it. It looks like that after your bug patch,
>> *(.rodata.*) will not be end on a 4-byte boundary. Before your patch,
>> all the messages will be in .rodata.str. Now they are in .bug_frames.*,
>> so there some difference in .rodata.*.
> 
> Strings in .bug_frames.*? This sounds like a mistake, which - if indeed
> the case - will want investigating before the conversion series is
> actually considered for committing.

No. I misread the code. But there are definitely a difference in size:

Before:

Section Headers:
   [Nr] Name              Type            Addr     Off    Size   ES Flg 
Lk Inf Al
   [ 0]                   NULL            00000000 000000 000000 00 
0   0  0
   [ 1] .text             PROGBITS        00200000 008000 07e7a8 00 WAX 
0   0 32
   [ 2] .rodata           PROGBITS        0027f000 087000 02acc8 00   A 
0   0 16
   [ 3] .note.gnu.build-i NOTE            002a9cc8 0b1cc8 000024 00   A 
0   0  4
   [ 4] .data.ro_after_in PROGBITS        002aa000 0b2000 001000 00  WA 
0   0  8
   [ 5] .data.read_mostly PROGBITS        002ab000 0b3000 001118 00  WA 
0   0  8
   [ 6] .data             PROGBITS        002ad000 0b5000 006ca8 00  WA 
0   0 4096
   [ 7] .arch.info        PROGBITS        002b3ca8 0bbca8 000208 00   A 
0   0  4
   [ 8] .dev.info         PROGBITS        002b3eb0 0bbeb0 000070 00   A 
0   0  4
   [ 9] .init.text        PROGBITS        002b4000 0bc000 016054 00  AX 
0   0  8
   [10] .init.data        PROGBITS        002d0000 0d8000 030008 00  WA 
0   0 32768
   [11] .bss              NOBITS          00308000 108008 0394c0 00  WA 
0   0 4096
   [12] .debug_abbrev     PROGBITS        00000000 108008 03006e 00 
0   0  1
   [13] .debug_info       PROGBITS        00000000 138076 27b6b5 00 
0   0  1
   [14] .debug_str        PROGBITS        00000000 3b372b 01a123 01  MS 
0   0  1
   [15] .debug_line       PROGBITS        00000000 3cd84e 0a59e6 00 
0   0  1
   [16] .debug_frame      PROGBITS        00000000 473234 018cc8 00 
0   0  4
   [17] .debug_loc        PROGBITS        00000000 48befc 108473 00 
0   0  1
   [18] .debug_ranges     PROGBITS        00000000 594370 031450 00 
0   0  8
   [19] .debug_aranges    PROGBITS        00000000 5c57c0 004dd0 00 
0   0  8
   [20] .comment          PROGBITS        00000000 5ca590 00005d 01  MS 
0   0  1
   [21] .ARM.attributes   ARM_ATTRIBUTES  00000000 5ca5ed 000037 00 
0   0  1
   [22] .symtab           SYMTAB          00000000 5ca624 022d60 10 
23 7573  4
   [23] .strtab           STRTAB          00000000 5ed384 00c631 00 
0   0  1
   [24] .shstrtab         STRTAB          00000000 5f99b5 00010b 00 
0   0  1

After:

   [Nr] Name              Type            Addr     Off    Size   ES Flg 
Lk Inf Al
   [ 0]                   NULL            00000000 000000 000000 00 
0   0  0
   [ 1] .text             PROGBITS        00200000 008000 07e670 00 WAX 
0   0 32
   [ 2] .rodata           PROGBITS        0027f000 087000 02b3e8 00   A 
0   0 16
   [ 3] .note.gnu.build-i NOTE            002aa3e8 0b23e8 000024 00   A 
0   0  4
   [ 4] .data.ro_after_in PROGBITS        002ab000 0b3000 001000 00  WA 
0   0  8
   [ 5] .data.read_mostly PROGBITS        002ac000 0b4000 001118 00  WA 
0   0  8
   [ 6] .data             PROGBITS        002ae000 0b6000 006ca8 00  WA 
0   0 4096
   [ 7] .arch.info        PROGBITS        002b4ca8 0bcca8 000208 00   A 
0   0  4
   [ 8] .dev.info         PROGBITS        002b4eb0 0bceb0 000070 00   A 
0   0  4
   [ 9] .init.text        PROGBITS        002b5000 0bd000 016054 00  AX 
0   0  8
   [10] .init.data        PROGBITS        002d0000 0d8000 030008 00  WA 
0   0 32768
   [11] .bss              NOBITS          00308000 108008 0394c0 00  WA 
0   0 4096
   [12] .debug_abbrev     PROGBITS        00000000 108008 02fe48 00 
0   0  1
   [13] .debug_info       PROGBITS        00000000 137e50 27ac8f 00 
0   0  1
   [14] .debug_str        PROGBITS        00000000 3b2adf 01a107 01  MS 
0   0  1
   [15] .debug_line       PROGBITS        00000000 3ccbe6 0a590e 00 
0   0  1
   [16] .debug_frame      PROGBITS        00000000 4724f4 018da0 00 
0   0  4
   [17] .debug_loc        PROGBITS        00000000 48b294 10822c 00 
0   0  1
   [18] .debug_ranges     PROGBITS        00000000 5934c0 031028 00 
0   0  8
   [19] .debug_aranges    PROGBITS        00000000 5c44e8 004dd8 00 
0   0  8
   [20] .comment          PROGBITS        00000000 5c92c0 00005d 01  MS 
0   0  1
   [21] .ARM.attributes   ARM_ATTRIBUTES  00000000 5c931d 000037 00 
0   0  1
   [22] .symtab           SYMTAB          00000000 5c9354 0220f0 10 
23 7374  4
   [23] .strtab           STRTAB          00000000 5eb444 00c677 00 
0   0  1
   [24] .shstrtab         STRTAB          00000000 5f7abb 00010b 00 
0   0  1

It is not entirely clear why. Anyway, it doesn't matter too much.

Note that the size of Xen grew a little bit on Arm (+0.03%). I am not 
too concerned though as we now consolidated the BUG infrastructure. So 
that's a plus.

> 
>> That said, it is not entirely clear why we never seen the issue before
>> because my guessing there are no guarantee that .rodata.* will be
>> suitably aligned.
>>
>> Anyway, here a proposal for the commit message:
>>
>> "
>> xen/arm: Ensure the start *(.proc.info) of is 4-byte aligned
>>
>> The entries in *(.proc.info) are expected to be 4-byte aligned and the
>> compiler will access them using 4-byte load instructions. On Arm32, the
>> alignment is strictly enforced by the processor and will result to a
>> data abort if it is not correct.
>>
>> However, the linker script doesn't encode this requirement. So we are at
>> the mercy of the compiler/linker to have aligned the previous sections
>> suitably.
> 
> May I suggest "aligned/padded", because it's really the tail of the
> previous section which matters?

Sure.

Cheers,

-- 
Julien Grall

