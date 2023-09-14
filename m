Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E32D37A115C
	for <lists+xen-devel@lfdr.de>; Fri, 15 Sep 2023 01:01:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.602768.939505 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgvKJ-0002jw-2O; Thu, 14 Sep 2023 23:00:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 602768.939505; Thu, 14 Sep 2023 23:00:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgvKI-0002hu-UJ; Thu, 14 Sep 2023 23:00:46 +0000
Received: by outflank-mailman (input) for mailman id 602768;
 Thu, 14 Sep 2023 23:00:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oXYZ=E6=linutronix.de=tglx@srs-se1.protection.inumbo.net>)
 id 1qgvKG-0002hm-OP
 for xen-devel@lists.xenproject.org; Thu, 14 Sep 2023 23:00:45 +0000
Received: from galois.linutronix.de (galois.linutronix.de [193.142.43.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8766d148-5352-11ee-9b0d-b553b5be7939;
 Fri, 15 Sep 2023 01:00:42 +0200 (CEST)
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
X-Inumbo-ID: 8766d148-5352-11ee-9b0d-b553b5be7939
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1694732439;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Y9UPmbkXZRNuioCyvMTxakQr1LFj1kbpXONIFu2xSbU=;
	b=lg2xYIiFHmDQ94KTGhglBSA6Z0t67NpbKHOIiF7u/MK/QNmaP++hoHuiLV+K+pCpRbvrny
	3/iljaw4BlgVWi/Axp6VS4fmMqKGyXg21eMc5ZV4tP/U4RlYANeOwmzU8va1MEOljqy3TT
	btUeGlhB3sh0EMaUYvltsYDxwKSXnXEylIIdoo/fFFa9bHszzToBmfF7mWfvAeUCCTtYF7
	dLVR6DZAro2zzE9j6g8fxSwh1UCUDJaHZwjyB+5Hh3UOpHfdYzQSP58MDIwDkxgh0AroPW
	ApRPA6r3z/oN2U1ADa5bw8cimXbGYP6+gkTTb8YmUICXl2qp0JQtDGwblbFK+A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1694732439;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Y9UPmbkXZRNuioCyvMTxakQr1LFj1kbpXONIFu2xSbU=;
	b=48C9u5FtSr/8YhitFLfTJzZIuTnlSrzcd0C4TaCewwtRO7Oehv/gGi/6/V2pnG6aVMDDrx
	+xZpy5dDgM7R8iDQ==
To: andrew.cooper3@citrix.com, Xin Li <xin3.li@intel.com>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-edac@vger.kernel.org, linux-hyperv@vger.kernel.org,
 kvm@vger.kernel.org, xen-devel@lists.xenproject.org
Cc: mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com,
 x86@kernel.org, hpa@zytor.com, luto@kernel.org, pbonzini@redhat.com,
 seanjc@google.com, peterz@infradead.org, jgross@suse.com,
 ravi.v.shankar@intel.com, mhiramat@kernel.org, jiangshanlai@gmail.com
Subject: Re: [PATCH v10 03/38] x86/msr: Add the WRMSRNS instruction support
In-Reply-To: <6f5678ff-f8b1-9ada-c8c7-f32cfb77263a@citrix.com>
References: <20230914044805.301390-1-xin3.li@intel.com>
 <20230914044805.301390-4-xin3.li@intel.com>
 <6f5678ff-f8b1-9ada-c8c7-f32cfb77263a@citrix.com>
Date: Fri, 15 Sep 2023 01:00:39 +0200
Message-ID: <87y1h81ht4.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Andrew!

On Thu, Sep 14 2023 at 15:05, andrew wrote:
> On 14/09/2023 5:47 am, Xin Li wrote:
>> +static __always_inline void wrmsrns(u32 msr, u64 val)
>> +{
>> +	__wrmsrns(msr, val, val >> 32);
>> +}
>
> This API works in terms of this series where every WRMSRNS is hidden
> behind a FRED check, but it's an awkward interface to use anywhere else
> in the kernel.

Agreed.

> I fully understand that you expect all FRED capable systems to have
> WRMSRNS, but it is not a hard requirement and you will end up with
> simpler (and therefore better) logic by deleting the dependency.

According to the CPU folks FRED systems are guaranteed to have WRMSRNS -
I asked for that :). It's just not yet documented.

But that I aside, I agree that we should opt for the safe side with a
fallback like the one you have in XEN even for the places which are
strictly FRED dependent.

> As a "normal" user of the WRMSR APIs, the programmer only cares about:
>
> 1) wrmsr() -> needs to be serialising
> 2) wrmsr_ns() -> safe to be non-serialising

Correct.

> In Xen, I added something of the form:
>
> /* Non-serialising WRMSR, when available.=C2=A0 Falls back to a serialisi=
ng
> WRMSR. */
> static inline void wrmsr_ns(uint32_t msr, uint32_t lo, uint32_t hi)
> {
> =C2=A0=C2=A0=C2=A0 /*
> =C2=A0=C2=A0=C2=A0=C2=A0 * WRMSR is 2 bytes.=C2=A0 WRMSRNS is 3 bytes.=C2=
=A0 Pad WRMSR with a redundant CS
> =C2=A0=C2=A0=C2=A0=C2=A0 * prefix to avoid a trailing NOP.
> =C2=A0=C2=A0=C2=A0=C2=A0 */
> =C2=A0=C2=A0=C2=A0 alternative_input(".byte 0x2e; wrmsr",
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ".byte 0x0f,0x01,0xc=
6", X86_FEATURE_WRMSRNS,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "c" (msr), "a" (lo),=
 "d" (hi));
> }
>
> and despite what Juergen said, I'm going to recommend that you do wire
> this through the paravirt infrastructure, for the benefit of regular
> users having a nice API, not because XenPV is expecting to do something
> wildly different here.

I fundamentaly hate adding this to the PV infrastructure. We don't want
more PV ops, quite the contrary.

For the initial use case at hand, there is an explicit FRED dependency
and the code in question really wants to use WRMSRNS directly and not
through a PV function call.

I agree with your reasoning for the more generic use case where we can
gain performance independent of FRED by using WRMSRNS for cases where
the write has no serialization requirements.

But this made me look into PV ops some more. For actual performance
relevant code the current PV ops mechanics are a horrorshow when the op
defaults to the native instruction.

Let's look at wrmsrl():

wrmsrl(msr, val
 wrmsr(msr, (u32)val, (u32)val >> 32))
  paravirt_write_msr(msr, low, high)
    PVOP_VCALL3(cpu.write_msr, msr, low, high)

Which results in

	mov	$msr, %edi
	mov	$val, %rdx
	mov	%edx, %esi
	shr	$0x20, %rdx
	call	native_write_msr

and native_write_msr() does at minimum:

	mov    %edi,%ecx
	mov    %esi,%eax
	wrmsr
        ret

In the worst case 'ret' is going through the return thunk. Not to talk
about function prologues and whatever.

This becomes even more silly for trivial instructions like STI/CLI or in
the worst case paravirt_nop().

The call makes only sense, when the native default is an actual
function, but for the trivial cases it's a blatant engineering
trainwreck.

I wouldn't care at all if CONFIG_PARAVIRT_XXL would be the esoteric use
case, but AFAICT it's default enabled on all major distros.

So no. I'm fundamentally disagreeing with your recommendation. The way
forward is:

  1) Provide the native variant for wrmsrns(), i.e. rename the proposed
     wrmsrns() to native_wrmsr_ns() and have the X86_FEATURE_WRMSRNS
     safety net as you pointed out.

     That function can be used in code which is guaranteed to be not
     affected by the PV_XXL madness.

  2) Come up with a sensible solution for the PV_XXL horrorshow

  3) Implement a sane general variant of wrmsr_ns() which handles
     both X86_FEATURE_WRMSRNS and X86_MISFEATURE_PV_XXL

  4) Convert other code which benefits from the non-serializing variant
     to wrmsr_ns()

Thanks,

        tglx

