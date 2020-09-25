Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B0FB9278963
	for <lists+xen-devel@lfdr.de>; Fri, 25 Sep 2020 15:22:28 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kLnfy-000779-Eq; Fri, 25 Sep 2020 13:22:14 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/WGo=DC=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kLnfx-000773-R5
 for xen-devel@lists.xenproject.org; Fri, 25 Sep 2020 13:22:13 +0000
X-Inumbo-ID: 7dcee2b9-85b7-453e-9adc-471088b768b1
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7dcee2b9-85b7-453e-9adc-471088b768b1;
 Fri, 25 Sep 2020 13:22:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1601040133;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=zFMmj6nJyv0rsQU8Ixp2xzXyzMGqOpH6NuifI93Qw64=;
 b=WGu4Sb8A7xUqizLTX2wVzVH1EcNi1kfyB/9xtl+Ab+GzQ0kK9fox6Hk2
 TdMJ4RfinaNLFEMtZuAYCQ9dhAUpgRhA5KkRUSI9Skfpm7M7SVu0hAMmZ
 yXAEFtN/rjBS6D1uhi2e3MLUbZ9jfTKl265wvcDnu7te3sOg09AyePfAu 8=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: JwnUnj1IQzGhCMjXLBqStMHMEjq7gu/7rgtdngdUrw4KH0tTMuT2AswPzjybPmBmyR5fLkrmwP
 ip1UOITL6iBxp5AGGVREN0MoWDyhNIQu454jRWAEzCQUrSD8ClY6QQyygiivKke2S9EeibY/hT
 L4VlqwOL2lHT7ubAcZm3Fhhw641wYurfkbvllvfDnZjylhBTq5Pj+udRjTuRBCQ2StmXRVVYJU
 AE082XhG4j/9BkZuQlieSKdnyxzayi3J5ULJMrJzHbrZwjc0gA1eeOc1fzCMq3Q7nMu9pgCN9d
 6T8=
X-SBRS: None
X-MesageID: 27924035
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,302,1596513600"; d="scan'208";a="27924035"
Subject: Re: [PATCH] x86: Use LOCK ADD instead of MFENCE for smp_mb()
To: Jan Beulich <jbeulich@suse.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Ian Jackson <Ian.Jackson@citrix.com>
References: <20200921130423.8035-1-andrew.cooper3@citrix.com>
 <aaf209f6-7878-f37d-3c30-c6981e675f6c@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <b4824856-fb54-a5dd-8170-3fdf59927977@citrix.com>
Date: Fri, 25 Sep 2020 14:22:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <aaf209f6-7878-f37d-3c30-c6981e675f6c@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 FTLPEX02CL05.citrite.net (10.13.108.178)
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 21/09/2020 14:58, Jan Beulich wrote:
> On 21.09.2020 15:04, Andrew Cooper wrote:
>> MFENCE is overly heavyweight for SMP semantics on WB memory, because it also
>> orders weaker cached writes, and flushes the WC buffers.
>>
>> This technique was used as an optimisation in Java[1], and later adopted by
>> Linux[2] where it was measured to have a 60% performance improvement in VirtIO
>> benchmarks.
>>
>> The stack is used because it is hot in the L1 cache, and a -4 offset is used
>> to avoid creating a false data dependency on live data.  (For 64bit userspace,
>> the offset needs to be under the red zone to avoid false dependences).
>>
>> Fix up the 32 bit definitions in HVMLoader and libxc to avoid a false data
>> dependency.
>>
>> [1] https://shipilev.net/blog/2014/on-the-fence-with-dependencies/
>> [2] https://git.kernel.org/torvalds/c/450cbdd0125cfa5d7bbf9e2a6b6961cc48d29730
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> For the hypervisor and hvmloader part:
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
>
>> --- a/tools/libs/ctrl/include/xenctrl.h
>> +++ b/tools/libs/ctrl/include/xenctrl.h
>> @@ -68,11 +68,11 @@
>>  #define xen_barrier() asm volatile ( "" : : : "memory")
>>  
>>  #if defined(__i386__)
>> -#define xen_mb()  asm volatile ( "lock; addl $0,0(%%esp)" : : : "memory" )
> If this causes a false dependency (which I agree it does), how
> come ...
>
>> +#define xen_mb()  asm volatile ( "lock addl $0, -4(%%esp)" ::: "memory" )
>>  #define xen_rmb() xen_barrier()
>>  #define xen_wmb() xen_barrier()
>>  #elif defined(__x86_64__)
>> -#define xen_mb()  asm volatile ( "mfence" : : : "memory")
>> +#define xen_mb()  asm volatile ( "lock addl $0, -128(%%rsp)" ::: "memory" )
> ... this doesn't? It accesses the bottom 4 bytes of the redzone,
> doesn't it?

I suppose it does.  However, if anything, I'd be tempted to move it
closer, perhaps even to -32 or so.

The red-zone isn't used a great deal to start with.  It is only useful
for blocks of code with a working set marginally larger than the GPRs,
and no calls/etc.  This is far more commonly seen in number crunching
code, and rare in data-marshalling logic around a shared memory buffer.

However, you also don't want the memory operand to hit a cache line
which isn't in L1, because that will be far slower than any false data
dependency in the memory order buffer.

OTOH, this is userspace, and neither a locked access hitting DRAM, nor a
false data dependency on the bottom of the red zone are going to be the
dominating factor in overall performance.

> As a minor other thought for all of its incarnations: Is a 32-bit
> memory access really the best choice?

Yes.

> Wouldn't an 8-bit access
> further reduce (albeit not eliminate) the risk of unnecessary
> dependencies between this memory access and others in functions
> called from the users of this barrier?

Not really.  The overwhelming majority of stack accesses are full words,
and would still alias even if the memory order buffer tracks aliasing at
byte granularity (which it might not, to save silicon area).

8 or 32 bit access are probably identical, based on the arch and uarch
details I'm aware of.  However, just in case they are not, I'm
definitely going for the form in common with several other major
software projects.

> Or actually, in the hypervisor case, since the used stack slot
> would typically hold the return address of the next level's
> functions, would a 64-bit access or one further away from the
> current stack pointer not help avoid partial dependencies?

No.  The follow call instruction is a write onto the stack, and will
form a write-after-write condition, rather than a false read-after-write
dependency.

> And finally, already when Linux used this for just 32-bit I've
> always been wondering why they bother preserving the contents of
> this piece of memory. How about using NOT (saving the immediate
> byte) or XCHG (requiring a dead register instead of the saved
> arithmetic, immediate byte, and lock prefix)?

Because performance is not dictated by the instruction length.

For equivalent instructions, the shorter encoding provides a marginal
benefit in terms of reduced instruction cache space, compound
improvements such as possibly being able to relax JMP disp32 to JMP
disp8, and increased decode bandwidth to a point.  There are some code
layout patterns where the longer forms are actually faster to decode on
some microarchitectures.

However, most instructions are not equivalent.

The XCHG plan may force a register to be spilled.  Some processors
really do track zeroes all the way out into the cache[1] and make
optimisations based on this knowledge.  ADD $0 is a no-op which can be
spotted at decode time, by a sufficiently clever pipeline.

~Andrew

[1] https://travisdowns.github.io/blog/2020/05/13/intel-zero-opt.html

