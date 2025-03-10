Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 08230A5A3EC
	for <lists+xen-devel@lfdr.de>; Mon, 10 Mar 2025 20:41:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.906799.1314172 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1triyz-00060P-Fu; Mon, 10 Mar 2025 19:40:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 906799.1314172; Mon, 10 Mar 2025 19:40:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1triyz-0005xv-Cs; Mon, 10 Mar 2025 19:40:13 +0000
Received: by outflank-mailman (input) for mailman id 906799;
 Mon, 10 Mar 2025 19:40:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Hcpv=V5=eik.bme.hu=balaton@srs-se1.protection.inumbo.net>)
 id 1triyy-0005xp-Qm
 for xen-devel@lists.xenproject.org; Mon, 10 Mar 2025 19:40:12 +0000
Received: from zero.eik.bme.hu (zero.eik.bme.hu [152.66.115.2])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 78ca931a-fde7-11ef-9898-31a8f345e629;
 Mon, 10 Mar 2025 20:40:08 +0100 (CET)
Received: from zero.eik.bme.hu (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 4525E4E602E;
 Mon, 10 Mar 2025 20:40:07 +0100 (CET)
Received: from zero.eik.bme.hu ([127.0.0.1])
 by zero.eik.bme.hu (zero.eik.bme.hu [127.0.0.1]) (amavisd-new, port 10028)
 with ESMTP id UKowroTsGVfA; Mon, 10 Mar 2025 20:40:04 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id EF2D94E6030; Mon, 10 Mar 2025 20:40:04 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id EC36774577C;
 Mon, 10 Mar 2025 20:40:04 +0100 (CET)
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
X-Inumbo-ID: 78ca931a-fde7-11ef-9898-31a8f345e629
X-Virus-Scanned: amavisd-new at eik.bme.hu
Date: Mon, 10 Mar 2025 20:40:04 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>
cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org, 
    Alistair Francis <alistair.francis@wdc.com>, 
    Richard Henderson <richard.henderson@linaro.org>, 
    Harsh Prateek Bora <harshpb@linux.ibm.com>, alex.bennee@linaro.org, 
    Palmer Dabbelt <palmer@dabbelt.com>, 
    Daniel Henrique Barboza <danielhb413@gmail.com>, kvm@vger.kernel.org, 
    Peter Xu <peterx@redhat.com>, Nicholas Piggin <npiggin@gmail.com>, 
    Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
    David Hildenbrand <david@redhat.com>, Weiwei Li <liwei1518@gmail.com>, 
    Paul Durrant <paul@xen.org>, 
    "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, 
    =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>, 
    Anthony PERARD <anthony@xenproject.org>, 
    Yoshinori Sato <ysato@users.sourceforge.jp>, 
    manos.pitsidianakis@linaro.org, qemu-riscv@nongnu.org, 
    Paolo Bonzini <pbonzini@redhat.com>, xen-devel@lists.xenproject.org, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH 00/16] make system memory API available for common code
In-Reply-To: <a57faa36-2e66-4438-accc-0cbfdeebf100@linaro.org>
Message-ID: <6b3e48e2-0730-09e2-55b1-35daff4ecf75@eik.bme.hu>
References: <20250310045842.2650784-1-pierrick.bouvier@linaro.org> <f231b3be-b308-56cf-53ff-1a6a7fb4da5c@eik.bme.hu> <c5b9eea9-c412-461d-b79b-0fa2f72128ee@linaro.org> <a57faa36-2e66-4438-accc-0cbfdeebf100@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed

On Mon, 10 Mar 2025, Pierrick Bouvier wrote:
> On 3/10/25 09:28, Pierrick Bouvier wrote:
>> Hi Zoltan,
>> 
>> On 3/10/25 06:23, BALATON Zoltan wrote:
>>> On Sun, 9 Mar 2025, Pierrick Bouvier wrote:
>>>> The main goal of this series is to be able to call any memory ld/st 
>>>> function
>>>> from code that is *not* target dependent.
>>> 
>>> Why is that needed?
>>> 
>> 
>> this series belongs to the "single binary" topic, where we are trying to
>> build a single QEMU binary with all architectures embedded.

Yes I get it now, I just forgot as this wasn't mentioned so the goal 
wasn't obvious.

>> To achieve that, we need to have every single compilation unit compiled
>> only once, to be able to link a binary without any symbol conflict.
>> 
>> A consequence of that is target specific code (in terms of code relying
>> of target specific macros) needs to be converted to common code,
>> checking at runtime properties of the target we run. We are tackling
>> various places in QEMU codebase at the same time, which can be confusing
>> for the community members.

Mentioning this single binary in related series may help reminding readers 
about the context.

>> This series take care of system memory related functions and associated
>> compilation units in system/.
>> 
>>>> As a positive side effect, we can
>>>> turn related system compilation units into common code.
>>> 
>>> Are there any negative side effects? In particular have you done any
>>> performance benchmarking to see if this causes a measurable slow down?
>>> Such as with the STREAM benchmark:
>>> https://stackoverflow.com/questions/56086993/what-does-stream-memory-bandwidth-benchmark-really-measure
>>> 
>>> Maybe it would be good to have some performance tests similiar to
>>> functional tests that could be run like the CI tests to detect such
>>> performance changes. People report that QEMU is getting slower and slower
>>> with each release. Maybe it could be a GSoC project to make such tests but
>>> maybe we're too late for that.
>>> 
>> 
>> I agree with you, and it's something we have mentioned during our
>> "internal" conversations. Testing performance with existing functional
>> tests would already be a first good step. However, given the poor
>> reliability we have on our CI runners, I think it's a bit doomed.
>> 
>> Ideally, every QEMU release cycle should have a performance measurement
>> window to detect potential sources of regressions.

Maybe instead of aiming for full CI like performance testing something 
simpler like a few tests that excercise some apects each like STREAM that 
tests memory access, copying a file from network and/or disk that tests 
I/O and mp3 encode with lame for example that's supposed to test floating 
point and SIMD might be simpler to do. It could be made a bootable image 
that just runs the test and reports a number (I did that before for 
qemu-system-ppc when we wanted to test an issue that on some hosts it ran 
slower). Such test could be run by somebody making changes so they could 
call these before and after their patch to quickly check if there's 
anything to improve. This may be less through then full performance 
testing but still give some insight and better than not testing anything 
for performance.

I'm bringig this topic up to try to keep awareness on this so QEMU can 
remain true to its name. (Although I'm not sure if originally the Q in the 
name stood for the time it took to write or its performance but it's 
hopefully still a goal to keep it fast.)

>> To answer to your specific question, I am trying first to get a review
>> on the approach taken. We can always optimize in next series version, in
>> case we identify it's a big deal to introduce a branch for every memory
>> related function call.

I'm not sure we can always optimise after the fact so sometimes it can be 
necessary to take performance in consideration while designing changes.

>> In all cases, transforming code relying on compile time
>> optimization/dead code elimination through defines to runtime checks
>> will *always* have an impact,

Yes, that's why it would be good to know how much impact is that.

>> even though it should be minimal in most of cases.

Hopefully but how do we know if we don't even test for it?

>> But the maintenance and compilation time benefits, as well as
>> the perspectives it opens (single binary, heterogeneous emulation, use
>> QEMU as a library) are worth it IMHO.

I'm not so sure about that. Heterogeneous emulation sounds interesting but 
is it needed most of the time? Using QEMU as a library also may not be 
common and limited by licencing. The single binary would simplify packages 
but then this binary may get huge so it's slower to load, may take more 
resources to run and more time to compile and if somebody only needs one 
architecture why do I want to include all of the others and wait for it to 
compile using up a lot of space on my disk? So in other words, while these 
are interesting and good goals could it be achieved with keeping the 
current way of building single ARCH binary as opposed to single binary 
with multiple archs and not throwing out the optimisations a single arch 
binary can use? Which one is better may depend on the use case so if 
possible it would be better to allow both keeping what we have and adding 
multi arch binary on top not replacing the current way completely.

>>> Regards,
>>> BALATON Zoltan
>> 
>> Regards,
>> Pierrick
>> 
>
> As a side note, we recently did some work around performance analysis (for 
> aarch64), as you can see here [1]. In the end, QEMU performance depends

Thank you, very interesting read.

> (roughly in this order) on:
> 1. quality of code generated by TCG
> 2. helper code to implement instructions
> 3. mmu emulation
>
> Other state of the art translators that exist are faster (fex, box64) mainly 
> by enhancing 1, and relying on various tricks to avoid translating some 
> libraries calls. But those translators are host/target specific, and the 
> ratio of instructions generated (vs target ones read) is much lower than 
> QEMU. In the experimentation listed in the blog, I observed that for 
> qemu-system-aarch64, we have an average expansion factor of around 18 (1 
> guest insn translates to 18 host ones).
>
> For users seeing performance decreases, beyond the QEMU code changes, adding 
> new target instructions may add new helpers, which may be called by the stack 
> people use, and they can sometimes observe a slower behaviour.

I'm mostly interested in emulating PPC for older and obscure OSes running 
on older hardware so there new instructions isn't a problem. Most of the 
time MMU emulation, helpers and TCG code generation is mostly dominating 
there and on PPC particularly the lack of hard float usage. Apart from 
that maybe some device emulations but that's a different topic. This is 
already slow so any overhead introduced at lowest levels just adds to 
that and target specific optimisation may only get back what's lost 
elsewhere.

Regards,
BALATON Zoltan

> There are probably some other low hanging fruits for other target 
> architectures.
>
> [1] https://www.linaro.org/blog/qemu-a-tale-of-performance-analysis/
>
>

