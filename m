Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B01A4A1D530
	for <lists+xen-devel@lfdr.de>; Mon, 27 Jan 2025 12:17:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.877741.1287888 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tcN7D-0006J3-L4; Mon, 27 Jan 2025 11:17:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 877741.1287888; Mon, 27 Jan 2025 11:17:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tcN7D-0006Gk-Gs; Mon, 27 Jan 2025 11:17:15 +0000
Received: by outflank-mailman (input) for mailman id 877741;
 Mon, 27 Jan 2025 11:17:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9dXK=UT=redhat.com=vschneid@srs-se1.protection.inumbo.net>)
 id 1tcN7B-0006Ga-Ms
 for xen-devel@lists.xenproject.org; Mon, 27 Jan 2025 11:17:13 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3ff4dc6a-dca0-11ef-99a4-01e77a169b0f;
 Mon, 27 Jan 2025 12:17:10 +0100 (CET)
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-424-6qqBBGn8Ow-TmUI9ZILVYw-1; Mon, 27 Jan 2025 06:17:08 -0500
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-4388eee7073so25119425e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 27 Jan 2025 03:17:07 -0800 (PST)
Received: from vschneid-thinkpadt14sgen2i.remote.csb
 (213-44-141-166.abo.bbox.fr. [213.44.141.166])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438bd48a145sm128093025e9.16.2025.01.27.03.17.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jan 2025 03:17:05 -0800 (PST)
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
X-Inumbo-ID: 3ff4dc6a-dca0-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1737976629;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0llw80E8nAjg6kMfEOzoPei4nanpbue7YefsY9gW++w=;
	b=COsELM3dgMzqvxES3yiE/1iCKTW6mckRJV7B8/AVvEmfEs3SAt58Asoo0IgFILoNYu5k29
	fBFSTjEQXJS4MWwknSPRBkiv8c2Xy/Cc+zdBfzbAHLOzoyM7Z/f6FRWzeb8BFXztoPRlie
	qe9GX2oHEkEnaCuf0iM8NV5Gi4TtJI8=
X-MC-Unique: 6qqBBGn8Ow-TmUI9ZILVYw-1
X-Mimecast-MFC-AGG-ID: 6qqBBGn8Ow-TmUI9ZILVYw
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737976627; x=1738581427;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0llw80E8nAjg6kMfEOzoPei4nanpbue7YefsY9gW++w=;
        b=jzwhF9MzKwzEPGZI2D/tLlSeU0PZelpLnn8vs68+apPz5tmj7fllW5mBmErshj4OvL
         o9SOJAZXiO8h6A0Je42I+9s4WCNKP8TSTHbweRAMDhTEPuXua9m8+Iek29W0sooPHV2O
         lCRFUVtRnz+k+OB7S2jR1ztZCOhr+Qk9qmJJ5YhOYt25McgMh52AJSlNfKRn9kMNHgcX
         HdmSE9MxAklzr3xlt4UbL4P6I8RX8D6FP6i35zazQb22YShPn5bLw1pMsVGdyuTFPJkc
         qr7yJ+eZtkrMynUtwBEjB2tVXPjyKE4klcuXA5nlo1UBXmUcs0HqGshkzmfyDfI+ARSG
         Nftg==
X-Forwarded-Encrypted: i=1; AJvYcCXyNxa2alMeeRo3IGslcgveFarX/Qgo4JF6yNYuBewJlvGMfTL9Mi9x69nZjOFSpnL5cwQlM48Be3k=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzJHrsRrDpNZ7vsR68n32unqrLpAQB254JiSh2XNbbVvZP7g29p
	mO3oSLSiL74Q1ey96DPtXDNp9DU7lYgsNRvXh8ewER4t5Y9dgmyAlQlj03xz5fWQTtzhd+e6VGJ
	5oonGeWP2nUUD+1fBdDBhl1SX7dxiiqPnMPZN3PS7Ph8McuVZO9sXPWlzKMty1NX8
X-Gm-Gg: ASbGncvoi14cX1uqGPKSbYvxUhDOmg7CNWJwPgExUKwFTCg3g5mgti9mfRKFuiqV1Vg
	fRw2CND2EumO2R3veuqbdmjZ5vbXA/FYPCMtjTFnDi5od7T47WGxoUUZLMIHCRujVAMvuYxMCvE
	1OOBzCfCTLUSZYpQNG/G/NAjhgpRJ51vfZuwl/x2nCmfhsE0Oi68FS9qX0pI8rTYkaO2avPeJT6
	84E4Dv/TK/hbaNenAzTaD34cI50fbOZ29RpHjAiv8u+K2ZwihF7fPj7Lr/AVDJ4/AlVT7lx5v5Q
	+po6bITiOK0BXmuHS6f3rlu/TkIqU5oL4sSVrnREP4h8FiSF4U5a20Q7FaeJ1U6lsA==
X-Received: by 2002:a05:600c:6d46:b0:434:92f8:54a8 with SMTP id 5b1f17b1804b1-438bcfd440dmr101053225e9.0.1737976626882;
        Mon, 27 Jan 2025 03:17:06 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE5ZBkhc7Mo57S55YqkWjUaKcE0DvJ7v1EsH72AA8CbL1E0vvN/eQHzrpNG4sI4i71C/vJTUQ==
X-Received: by 2002:a05:600c:6d46:b0:434:92f8:54a8 with SMTP id 5b1f17b1804b1-438bcfd440dmr101052395e9.0.1737976626396;
        Mon, 27 Jan 2025 03:17:06 -0800 (PST)
From: Valentin Schneider <vschneid@redhat.com>
To: Frederic Weisbecker <frederic@kernel.org>
Cc: linux-kernel@vger.kernel.org, x86@kernel.org,
 virtualization@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 loongarch@lists.linux.dev, linux-riscv@lists.infradead.org,
 linux-perf-users@vger.kernel.org, xen-devel@lists.xenproject.org,
 kvm@vger.kernel.org, linux-arch@vger.kernel.org, rcu@vger.kernel.org,
 linux-hardening@vger.kernel.org, linux-mm@kvack.org,
 linux-kselftest@vger.kernel.org, bpf@vger.kernel.org,
 bcm-kernel-feedback-list@broadcom.com, Juergen Gross <jgross@suse.com>,
 Ajay Kaher <ajay.kaher@broadcom.com>, Alexey Makhalov
 <alexey.amakhalov@broadcom.com>, Russell King <linux@armlinux.org.uk>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, Paul
 Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave
 Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>,
 Peter Zijlstra <peterz@infradead.org>, Arnaldo Carvalho de Melo
 <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Mark Rutland
 <mark.rutland@arm.com>, Alexander Shishkin
 <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, Ian
 Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>,
 "Liang, Kan" <kan.liang@linux.intel.com>, Boris Ostrovsky
 <boris.ostrovsky@oracle.com>, Josh Poimboeuf <jpoimboe@kernel.org>, Pawan
 Gupta <pawan.kumar.gupta@linux.intel.com>, Sean Christopherson
 <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, Andy Lutomirski
 <luto@kernel.org>, Arnd Bergmann <arnd@arndb.de>, "Paul E. McKenney"
 <paulmck@kernel.org>, Jason Baron <jbaron@akamai.com>, Steven Rostedt
 <rostedt@goodmis.org>, Ard Biesheuvel <ardb@kernel.org>, Neeraj Upadhyay
 <neeraj.upadhyay@kernel.org>, Joel Fernandes <joel@joelfernandes.org>,
 Josh Triplett <josh@joshtriplett.org>, Boqun Feng <boqun.feng@gmail.com>,
 Uladzislau Rezki <urezki@gmail.com>, Mathieu Desnoyers
 <mathieu.desnoyers@efficios.com>, Lai Jiangshan <jiangshanlai@gmail.com>,
 Zqiang <qiang.zhang1211@gmail.com>, Juri Lelli <juri.lelli@redhat.com>,
 Clark Williams <williams@redhat.com>, Yair Podemsky <ypodemsk@redhat.com>,
 Tomas Glozar <tglozar@redhat.com>, Vincent Guittot
 <vincent.guittot@linaro.org>, Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, Kees Cook
 <kees@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Christoph
 Hellwig <hch@infradead.org>, Shuah Khan <shuah@kernel.org>, Sami Tolvanen
 <samitolvanen@google.com>, Miguel Ojeda <ojeda@kernel.org>, Alice Ryhl
 <aliceryhl@google.com>, "Mike Rapoport (Microsoft)" <rppt@kernel.org>,
 Samuel Holland <samuel.holland@sifive.com>, Rong Xu <xur@google.com>,
 Nicolas Saenz Julienne <nsaenzju@redhat.com>, Geert Uytterhoeven
 <geert@linux-m68k.org>, Yosry Ahmed <yosryahmed@google.com>, "Kirill A.
 Shutemov" <kirill.shutemov@linux.intel.com>, "Masami Hiramatsu (Google)"
 <mhiramat@kernel.org>, Jinghao Jia <jinghao7@illinois.edu>, Luis
 Chamberlain <mcgrof@kernel.org>, Randy Dunlap <rdunlap@infradead.org>,
 Tiezhu Yang <yangtiezhu@loongson.cn>
Subject: Re: [PATCH v4 22/30] context_tracking: Exit CT_STATE_IDLE upon
 irq/nmi entry
In-Reply-To: <Z5A6NPqVGoZ32YsN@pavilion.home>
References: <20250114175143.81438-1-vschneid@redhat.com>
 <20250114175143.81438-23-vschneid@redhat.com>
 <Z5A6NPqVGoZ32YsN@pavilion.home>
Date: Mon, 27 Jan 2025 12:17:03 +0100
Message-ID: <xhsmh5xm0pkuo.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 9me6uozEWVqStNDV69xWT4h7W4jVdvPAoK3C5jluVxA_1737976627
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 22/01/25 01:22, Frederic Weisbecker wrote:
> Le Tue, Jan 14, 2025 at 06:51:35PM +0100, Valentin Schneider a =C3=A9crit=
 :
>> ct_nmi_{enter, exit}() only touches the RCU watching counter and doesn't
>> modify the actual CT state part context_tracking.state. This means that
>> upon receiving an IRQ when idle, the CT_STATE_IDLE->CT_STATE_KERNEL
>> transition only happens in ct_idle_exit().
>>
>> One can note that ct_nmi_enter() can only ever be entered with the CT st=
ate
>> as either CT_STATE_KERNEL or CT_STATE_IDLE, as an IRQ/NMI happenning in =
the
>> CT_STATE_USER or CT_STATE_GUEST states will be routed down to ct_user_ex=
it().
>
> Are you sure? An NMI can fire between guest_state_enter_irqoff() and
> __svm_vcpu_run().

Urgh, you're quite right.

> And NMIs interrupting userspace don't call
> enter_from_user_mode(). In fact they don't call irqentry_enter_from_user_=
mode()
> like regular IRQs but irqentry_nmi_enter() instead. Well that's for archs
> implementing common entry code, I can't speak for the others.
>

That I didn't realize, so thank you for pointing it out. Having another
look now, I mistook DEFINE_IDTENTRY_RAW(exc_int3) for the general case
when it really isn't :(

> Unifying the behaviour between user and idle such that the IRQs/NMIs exit=
 the
> CT_STATE can be interesting but I fear this may not come for free. You wo=
uld
> need to save the old state on IRQ/NMI entry and restore it on exit.
>

That's what I tried to avoid, but it sounds like there's no nice way around=
 it.

> Do we really need it?
>

Well, my problem with not doing IDLE->KERNEL transitions on IRQ/NMI is that
this leads the IPI deferral logic to observe a technically-out-of-sync sate
for remote CPUs. Consider:

  CPUx            CPUy
                    state :=3D CT_STATE_IDLE
                    ...
                    ~>IRQ
                    ...
                    ct_nmi_enter()
                    [in the kernel proper by now]

  text_poke_bp_batch()
    ct_set_cpu_work(CPUy, CT_WORK_SYNC)
      READ CPUy ct->state
      `-> CT_IDLE_STATE
      `-> defer IPI


I thought this meant I would need to throw out the "defer IPIs if CPU is
idle" part, but AIUI this also affects CT_STATE_USER and CT_STATE_GUEST,
which is a bummer :(


