Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CDD66A15348
	for <lists+xen-devel@lfdr.de>; Fri, 17 Jan 2025 16:53:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.874149.1284990 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tYoeZ-0002xj-UJ; Fri, 17 Jan 2025 15:52:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 874149.1284990; Fri, 17 Jan 2025 15:52:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tYoeZ-0002vU-Rg; Fri, 17 Jan 2025 15:52:59 +0000
Received: by outflank-mailman (input) for mailman id 874149;
 Fri, 17 Jan 2025 15:52:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=atmh=UJ=google.com=jannh@srs-se1.protection.inumbo.net>)
 id 1tYoeY-0002vN-PX
 for xen-devel@lists.xenproject.org; Fri, 17 Jan 2025 15:52:58 +0000
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [2a00:1450:4864:20::52e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1ebc7f12-d4eb-11ef-a0e2-8be0dac302b0;
 Fri, 17 Jan 2025 16:52:57 +0100 (CET)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-5d0c939ab78so9596a12.0
 for <xen-devel@lists.xenproject.org>; Fri, 17 Jan 2025 07:52:57 -0800 (PST)
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
X-Inumbo-ID: 1ebc7f12-d4eb-11ef-a0e2-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1737129176; x=1737733976; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E7d+TpfXp3p6m5vGusLumGYBM9vV8hEetyox2i/2Tk8=;
        b=NnTfXfW+Z8rGhZbSJjPWOpNwlgYW8eT1U1QES5cnRgSMP+N5RJb1wHamneYkhL7mz4
         kPmgqhcfl+CwkVnl4R3Gg+fw5oZV0PmZ4mgGsfubGaV7rWdE4/s4iDKG4C+oZK8EFdIm
         te+th+e3TKpMLHvFgS3m2l5PC1SRgJMc8By14IwHYponjNTZgqC+IP6rBpOp0skHlwnS
         75LkRRrgTZNUAxK31MqBvBQrrMxL4r+rxmwyMKpplpV8YctT5Us5Y5NycAPEGuguurQd
         +hSE4que46dbrYFJVRGTuBjrTMx2CA1RnrWIB1D1g5bP0LHz4PeCnphrzzvjb6jdi0JN
         pEQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737129176; x=1737733976;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E7d+TpfXp3p6m5vGusLumGYBM9vV8hEetyox2i/2Tk8=;
        b=Whosc2vMV0SbSnxtfTSULoaJDlWRcofPeXmt6lBdds7f0FMgYAtH17nF8N1v2s8PPr
         xwcu3xl+K4ucDOiae5X0+suD0TKUXUTPjSCH2Cm6bq9q2ztPtKi2c8NN7okphgFHoq8v
         JiSm/yGShuns9M0wV2sP6P2vT84pv81pKFoTYdiAysFix33nvEerSArfF2Q4w7OTFoO6
         0/N4b0UBG/r92216WdXOwO1KrPmdx5z0s4brM6VCbnG0IxP+TLZ6C9pvnDqZXvYYb8dT
         28FXD0HNeglUqYg2DRe519dJsUNGxV7cEbqcsLmoF5IwaPJeGRF11+wvWEBGtQivV5EM
         epHQ==
X-Forwarded-Encrypted: i=1; AJvYcCXYbUWQJP3OJDGlrlilqwhbdtVzL7NnHwoJskwwZYSVkXlamNVTQsj0b/kGr65ehyAhNAO0RYms3YE=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywy4aqFeDYP4Yko2pL2xbl+CCIwL0oUkJwfnqo2qk2hNWDtA+l2
	m4XQXuRY1qRqTnPyDeQumqgTJLK8lj8TWOvbEsVhjPiroeBvE3c1luhffCTjLvGxyfpRpG7x1Bx
	iYEEarhr3n3YWJoZpRU7upw7jI1grFbY8aTnh
X-Gm-Gg: ASbGnct+8030wI/S82BrO0JKS0E1qg8H+hugdyKaPLe4AS7dIY6iGy3Ql3HKbnkKaH4
	IbaAlNaaTsJ1zpnkT4T0N4PRhsBgl+tL6KieJRjdOveG1HpLrz0Ptv21BqycVCrvpEg==
X-Google-Smtp-Source: AGHT+IEEkI7Iy2SK9FPAK0t7gLelF/8kGvCq2TFqgDI01h52pfAV4lOJlwJrdbZvw3hEJ10c/9do3FNZA9vfJuC5wNY=
X-Received: by 2002:a50:8e10:0:b0:5d0:acf3:e3a6 with SMTP id
 4fb4d7f45d1cf-5db7e2c3f9dmr75503a12.1.1737129175787; Fri, 17 Jan 2025
 07:52:55 -0800 (PST)
MIME-Version: 1.0
References: <20250114175143.81438-1-vschneid@redhat.com> <20250114175143.81438-30-vschneid@redhat.com>
 <CAG48ez1Mh+DOy0ysOo7Qioxh1W7xWQyK9CLGNU9TGOsLXbg=gQ@mail.gmail.com> <xhsmh34hhh37q.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
In-Reply-To: <xhsmh34hhh37q.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
From: Jann Horn <jannh@google.com>
Date: Fri, 17 Jan 2025 16:52:19 +0100
X-Gm-Features: AbW1kvZJ0qyEwdtkrx_UmrEU0O4aMmTblOKPsNQ-aUYqHdGS_cvMGi3arE1PehU
Message-ID: <CAG48ez3H8OVP1GxBLdmFgusvT1gQhwu2SiXbgi8T9uuCYVK52w@mail.gmail.com>
Subject: Re: [PATCH v4 29/30] x86/mm, mm/vmalloc: Defer flush_tlb_kernel_range()
 targeting NOHZ_FULL CPUs
To: Valentin Schneider <vschneid@redhat.com>
Cc: linux-kernel@vger.kernel.org, x86@kernel.org, 
	virtualization@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	loongarch@lists.linux.dev, linux-riscv@lists.infradead.org, 
	linux-perf-users@vger.kernel.org, xen-devel@lists.xenproject.org, 
	kvm@vger.kernel.org, linux-arch@vger.kernel.org, rcu@vger.kernel.org, 
	linux-hardening@vger.kernel.org, linux-mm@kvack.org, 
	linux-kselftest@vger.kernel.org, bpf@vger.kernel.org, 
	bcm-kernel-feedback-list@broadcom.com, Juergen Gross <jgross@suse.com>, 
	Ajay Kaher <ajay.kaher@broadcom.com>, Alexey Makhalov <alexey.amakhalov@broadcom.com>, 
	Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Thomas Gleixner <tglx@linutronix.de>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, 
	Peter Zijlstra <peterz@infradead.org>, Arnaldo Carvalho de Melo <acme@kernel.org>, 
	Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	"Liang, Kan" <kan.liang@linux.intel.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Pawan Gupta <pawan.kumar.gupta@linux.intel.com>, 
	Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Andy Lutomirski <luto@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Frederic Weisbecker <frederic@kernel.org>, "Paul E. McKenney" <paulmck@kernel.org>, 
	Jason Baron <jbaron@akamai.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Ard Biesheuvel <ardb@kernel.org>, Neeraj Upadhyay <neeraj.upadhyay@kernel.org>, 
	Joel Fernandes <joel@joelfernandes.org>, Josh Triplett <josh@joshtriplett.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Uladzislau Rezki <urezki@gmail.com>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Lai Jiangshan <jiangshanlai@gmail.com>, 
	Zqiang <qiang.zhang1211@gmail.com>, Juri Lelli <juri.lelli@redhat.com>, 
	Clark Williams <williams@redhat.com>, Yair Podemsky <ypodemsk@redhat.com>, 
	Tomas Glozar <tglozar@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, 
	Dietmar Eggemann <dietmar.eggemann@arm.com>, Ben Segall <bsegall@google.com>, 
	Mel Gorman <mgorman@suse.de>, Kees Cook <kees@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Christoph Hellwig <hch@infradead.org>, 
	Shuah Khan <shuah@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	"Mike Rapoport (Microsoft)" <rppt@kernel.org>, Samuel Holland <samuel.holland@sifive.com>, Rong Xu <xur@google.com>, 
	Nicolas Saenz Julienne <nsaenzju@redhat.com>, Geert Uytterhoeven <geert@linux-m68k.org>, 
	Yosry Ahmed <yosryahmed@google.com>, 
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, 
	"Masami Hiramatsu (Google)" <mhiramat@kernel.org>, Jinghao Jia <jinghao7@illinois.edu>, 
	Luis Chamberlain <mcgrof@kernel.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Tiezhu Yang <yangtiezhu@loongson.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 17, 2025 at 4:25=E2=80=AFPM Valentin Schneider <vschneid@redhat=
.com> wrote:
> On 14/01/25 19:16, Jann Horn wrote:
> > On Tue, Jan 14, 2025 at 6:51=E2=80=AFPM Valentin Schneider <vschneid@re=
dhat.com> wrote:
> >> vunmap()'s issued from housekeeping CPUs are a relatively common sourc=
e of
> >> interference for isolated NOHZ_FULL CPUs, as they are hit by the
> >> flush_tlb_kernel_range() IPIs.
> >>
> >> Given that CPUs executing in userspace do not access data in the vmall=
oc
> >> range, these IPIs could be deferred until their next kernel entry.
> >>
> >> Deferral vs early entry danger zone
> >> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >>
> >> This requires a guarantee that nothing in the vmalloc range can be vun=
map'd
> >> and then accessed in early entry code.
> >
> > In other words, it needs a guarantee that no vmalloc allocations that
> > have been created in the vmalloc region while the CPU was idle can
> > then be accessed during early entry, right?
>
> I'm not sure if that would be a problem (not an mm expert, please do
> correct me) - looking at vmap_pages_range(), flush_cache_vmap() isn't
> deferred anyway.

flush_cache_vmap() is about stuff like flushing data caches on
architectures with virtually indexed caches; that doesn't do TLB
maintenance. When you look for its definition on x86 or arm64, you'll
see that they use the generic implementation which is simply an empty
inline function.

> So after vmapping something, I wouldn't expect isolated CPUs to have
> invalid TLB entries for the newly vmapped page.
>
> However, upon vunmap'ing something, the TLB flush is deferred, and thus
> stale TLB entries can and will remain on isolated CPUs, up until they
> execute the deferred flush themselves (IOW for the entire duration of the
> "danger zone").
>
> Does that make sense?

The design idea wrt TLB flushes in the vmap code is that you don't do
TLB flushes when you unmap stuff or when you map stuff, because doing
TLB flushes across the entire system on every vmap/vunmap would be a
bit costly; instead you just do batched TLB flushes in between, in
__purge_vmap_area_lazy().

In other words, the basic idea is that you can keep calling vmap() and
vunmap() a bunch of times without ever doing TLB flushes until you run
out of virtual memory in the vmap region; then you do one big TLB
flush, and afterwards you can reuse the free virtual address space for
new allocations again.

So if you "defer" that batched TLB flush for CPUs that are not
currently running in the kernel, I think the consequence is that those
CPUs may end up with incoherent TLB state after a reallocation of the
virtual address space.

Actually, I think this would mean that your optimization is disallowed
at least on arm64 - I'm not sure about the exact wording, but arm64
has a "break before make" rule that forbids conflicting writable
address translations or something like that.

(I said "until you run out of virtual memory in the vmap region", but
that's not actually true - see the comment above lazy_max_pages() for
an explanation of the actual heuristic. You might be able to tune that
a bit if you'd be significantly happier with less frequent
interruptions, or something along those lines.)

