Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C9583C3CA84
	for <lists+xen-devel@lfdr.de>; Thu, 06 Nov 2025 17:59:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1157178.1486070 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vH3K0-0002cp-OU; Thu, 06 Nov 2025 16:58:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1157178.1486070; Thu, 06 Nov 2025 16:58:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vH3K0-0002b2-Lm; Thu, 06 Nov 2025 16:58:52 +0000
Received: by outflank-mailman (input) for mailman id 1157178;
 Thu, 06 Nov 2025 16:58:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DBCD=5O=gmail.com=ritesh.list@srs-se1.protection.inumbo.net>)
 id 1vH3Jz-0002aw-Iu
 for xen-devel@lists.xenproject.org; Thu, 06 Nov 2025 16:58:51 +0000
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com
 [2607:f8b0:4864:20::630])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dda7d854-bb31-11f0-9d17-b5c5bf9af7f9;
 Thu, 06 Nov 2025 17:58:50 +0100 (CET)
Received: by mail-pl1-x630.google.com with SMTP id
 d9443c01a7336-2957850c63bso13823485ad.0
 for <xen-devel@lists.xenproject.org>; Thu, 06 Nov 2025 08:58:50 -0800 (PST)
Received: from dw-tp ([171.76.85.117]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-ba8f8c880c5sm3013244a12.6.2025.11.06.08.58.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Nov 2025 08:58:47 -0800 (PST)
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
X-Inumbo-ID: dda7d854-bb31-11f0-9d17-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762448329; x=1763053129; darn=lists.xenproject.org;
        h=mime-version:references:message-id:date:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=+mwdpEtZUkKLd4HieJ0n4xeeNKNrAgrCllkk+QdYNeo=;
        b=EXFAq5FC6EiJdyXngOQGFtEqWhqQHAxEp+L8+TzFOp/Gfbx48kEDRrmGlc10gkennq
         tIpqr7UNa5cUW818kSEk5Waw/QOIpAqwdsZHsjk9sPVEVAEllP9eDeIabNI+rsRAkE2L
         26DS+jpXKjam5OEYuEZK7UgCMrtVB8v9XD1mCYZSWeQyaLUwbPUOTj6VDILdaTRPy1lJ
         bvf2rdymeA/2LwYpq8wFrGGugB9mQK+4CWM3WOlQuVZnjvdwomZdePSVemgObkuLyjvO
         dU4BhyS7X9nrrD78p4cAYRP3DZT2yG0Nwyhi0XFlLwEnnxaLx0HUkjOh9reHEmGiJMGo
         RyKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762448329; x=1763053129;
        h=mime-version:references:message-id:date:in-reply-to:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+mwdpEtZUkKLd4HieJ0n4xeeNKNrAgrCllkk+QdYNeo=;
        b=trcFTDK32mAYi2kDHyDEZ+QJ6C48wFlHGLE77/+wHlGM3FT0l9/vkRGm+zw42HKU06
         yzSFgO4S7PkA9AUHedZq/h67OpxRn+VwlP0s1FtUDYryBpB9YfAoA1nYAiIvNLT7wrR+
         bqvFrCLHS9l2ZnuI4YC+mpi/nIzgQvvkfxJeltZXLWc3HINrSDD02Dzt0FfqWXUQCXNE
         pxYFqc336HuAq43qH3kqmrldhhQRf6OHnvyEzCFUPhp2BdCZW0+8Sezso/SkkIxni9ME
         MpFhVm5J5i0PDnFr+SNB3Xy75PkgxS4/1uTlG7g9r/9qhDxMIeZdItDynJXNRzt43yGk
         oDMA==
X-Forwarded-Encrypted: i=1; AJvYcCWsPACbMlPdnGNsFVi1I3LyWLlEDPDW3AtvZurAusZkKQXwzcjlNBX0+xfrs65aMOk6WeC2JWLiD34=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzbEwAHWmDS0+4lPyXdnnszQhaRp5YhG2sFTxExkxhCUDJIq7CK
	/wlSWjiJjrj1C+NHqafNg3CK0uFIFcAybybSmKX1+k0VKaYvFC2Hv2B1
X-Gm-Gg: ASbGncuHandJ6Y7aaKktKaimlpumxt6wmZICkV+RBFdVDyyzZLSAIXftZc9YFmMGFpL
	12JV9VIGExHFlJj4APuEOV7dyPtsNrA61aT2bsZG+fI0Ays7nGnkwF9EgJilv+nITQHj85kby2q
	Tk197KA+aE3XAmvWdijVQovsfPvl9tKf8WDzG71ZLnXdLk1In+kdPB+flNk9fxMowhkhFs02w+v
	xANcqWp0T3wzXCZpBI48Qm916/64lIVs5izjZmzvrx0RXH7hr5Wvqqa0yFjZ7giNrGoCe642SMh
	CbEFpS727lR3S/NHbbZxO+RtMQhvJIoH4yMkSoM97bUAYf/dNcIhCruBUifOPZd2NGqT0mLtTq3
	hnTsQGMklHLfwOQVm5G2uGUaAQyZvpTZCexYOEQCEfiW/oVzeDwFeK19/2O5nCRXX4i9z5g==
X-Google-Smtp-Source: AGHT+IEmGC1fJcE4OAtV0Owu2fNKpRqQY3VzTeskRzxNQPbLVeyWOXOzToL4xIfj+nPDKGb1lmA/VA==
X-Received: by 2002:a17:902:ce07:b0:295:50f5:c0e3 with SMTP id d9443c01a7336-297c00b9141mr3517035ad.14.1762448328641;
        Thu, 06 Nov 2025 08:58:48 -0800 (PST)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: Alexander Gordeev <agordeev@linux.ibm.com>
Cc: Kevin Brodsky <kevin.brodsky@arm.com>, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	Andreas Larsson <andreas@gaisler.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Boris Ostrovsky <boris.ostrovsky@oracle.com>, Borislav Petkov <bp@alien8.de>, 
	Catalin Marinas <catalin.marinas@arm.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Dave Hansen <dave.hansen@linux.intel.com>, David Hildenbrand <david@redhat.com>, 
	"David S. Miller" <davem@davemloft.net>, David Woodhouse <dwmw2@infradead.org>, 
	"H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>, Jann Horn <jannh@google.com>, 
	Juergen Gross <jgross@suse.com>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Michal Hocko <mhocko@suse.com>, Mike Rapoport <rppt@kernel.org>, 
	Nicholas Piggin <npiggin@gmail.com>, Peter Zijlstra <peterz@infradead.org>, 
	Ryan Roberts <ryan.roberts@arm.com>, Suren Baghdasaryan <surenb@google.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Vlastimil Babka <vbabka@suse.cz>, Will Deacon <will@kernel.org>, 
	Yeoreum Yun <yeoreum.yun@arm.com>, linux-arm-kernel@lists.infradead.org, 
	linuxppc-dev@lists.ozlabs.org, sparclinux@vger.kernel.org, 
	xen-devel@lists.xenproject.org, x86@kernel.org
Subject: Re: [PATCH v4 07/12] mm: enable lazy_mmu sections to nest
In-Reply-To: <50d1b63a-88d7-4484-82c0-3bde96e3207d-agordeev@linux.ibm.com>
Date: Thu, 06 Nov 2025 22:02:39 +0530
Message-ID: <87ikfn3yvs.ritesh.list@gmail.com>
References: <20251029100909.3381140-1-kevin.brodsky@arm.com> <20251029100909.3381140-8-kevin.brodsky@arm.com> <87ms5050g0.ritesh.list@gmail.com> <50d1b63a-88d7-4484-82c0-3bde96e3207d-agordeev@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain

Alexander Gordeev <agordeev@linux.ibm.com> writes:

> On Wed, Nov 05, 2025 at 02:19:03PM +0530, Ritesh Harjani wrote:
>> > + * in_lazy_mmu_mode() can be used to check whether the lazy MMU mode is
>> > + * currently enabled.
>> >   */
>> >  #ifdef CONFIG_ARCH_HAS_LAZY_MMU_MODE
>> >  static inline void lazy_mmu_mode_enable(void)
>> >  {
>> > -	arch_enter_lazy_mmu_mode();
>> > +	struct lazy_mmu_state *state = &current->lazy_mmu_state;
>> > +
>> > +	VM_WARN_ON_ONCE(state->nesting_level == U8_MAX);
>> > +	/* enable() must not be called while paused */
>> > +	VM_WARN_ON(state->nesting_level > 0 && !state->active);
>> > +
>> > +	if (state->nesting_level++ == 0) {
>> > +		state->active = true;
>> > +		arch_enter_lazy_mmu_mode();
>> > +	}
>> >  }
>> 
>> Some architectures disables preemption in their
>> arch_enter_lazy_mmu_mode(). So shouldn't the state->active = true should
>> happen after arch_enter_lazy_mmu_mode() has disabled preemption()? i.e.
>
> Do you have some scenario in mind that could cause an issue?
>
No not really. But that's a deviation from what previous arch hooks were
expecting. Although thinking this through - I don't have any usecase
where this can be a problem. 

But let me re-visit some of the code paths on ppc64 lazy mmu... 

Looking at the arch specific usecase I see we always do get_cpu_var()
for accessing the per-cpu batch array which disables preemption before
accessing the per-cpu structure.. This per-cpu structure is where we
batch pte updates... 

For e.g... 
  
    arch_enter_lazy_mmu_mode()
        hpte_need_flush()
            get_cpu_var()   // this takes care of preempt_disable() 
            adds vpns to per-cpu batch[i]
            put_cpu_var()   // 
    arch_leave_lazy_mmu_mode()

> IOW, what could go wrong if the process is scheduled to another
> CPU before preempt_disable() is called?

So from above - I don't think your sequence to update
   state->active = true 
before calling arch_enter hook should be a problem.
Based on above this looks mostly ok to me.

-ritesh

