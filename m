Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FFAFA16B5B
	for <lists+xen-devel@lfdr.de>; Mon, 20 Jan 2025 12:16:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.874930.1285281 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tZpkk-0001To-2l; Mon, 20 Jan 2025 11:15:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 874930.1285281; Mon, 20 Jan 2025 11:15:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tZpkj-0001RK-VQ; Mon, 20 Jan 2025 11:15:33 +0000
Received: by outflank-mailman (input) for mailman id 874930;
 Mon, 20 Jan 2025 11:15:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/LCm=UM=gmail.com=urezki@srs-se1.protection.inumbo.net>)
 id 1tZpki-0001RE-Bx
 for xen-devel@lists.xenproject.org; Mon, 20 Jan 2025 11:15:32 +0000
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [2a00:1450:4864:20::12a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id db95f187-d71f-11ef-a0e3-8be0dac302b0;
 Mon, 20 Jan 2025 12:15:30 +0100 (CET)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-5401be44b58so4488478e87.0
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jan 2025 03:15:30 -0800 (PST)
Received: from pc636 (host-217-213-93-172.mobileonline.telia.com.
 [217.213.93.172]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5439af60936sm1298036e87.107.2025.01.20.03.15.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jan 2025 03:15:27 -0800 (PST)
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
X-Inumbo-ID: db95f187-d71f-11ef-a0e3-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737371729; x=1737976529; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2GVkq9tRDCkhxRDT/CBStGfoQ0If4+e8Z0FyGDV8QRs=;
        b=muBHzK9OGtoqhUoFdYXAVrgnerS1nJ4l/MxbPuuLduD3Rq5Ux8VwhWL6SFZPPdK1hR
         RLhPekPpZ8+6uajrGGSsIK96da11yDhnE7Lp8lefTN2z4+wfUbS3badjfNFBkN3l0wlv
         TNPNOgNVpHn9+Uk+IZlbBxyPUbQ0k8gwq8ITHSHvN/4FnO519V/XudTQ4WnUoUyeuN2r
         +Cq641zeoY1OQmcpL4D8PR3+OLjyR9j+/gQm92KKCnhCZ/j+NUCmNGmEEqZtO1rMXif1
         KpUH9gTrwlha79kSEe4VNhp71GgaUCs+ISavBkipYAVXBbiZCCqB3O8phIzlKE2l+1j0
         9dTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737371729; x=1737976529;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2GVkq9tRDCkhxRDT/CBStGfoQ0If4+e8Z0FyGDV8QRs=;
        b=K67/x9IjZ4StFMKV3Jn3NFUHmhUjFOXPwWvf3nLM8shQkVaREbEChTx44qHK/Oij7C
         vytYL1ZYTlTFYy7AAUpq4Fy7tBitCzs4zhxnxAFY0dh6FUi0iz+Xd2jWrFWRFb5aOf20
         8mKuls0AHsCst1oOgKaMibOQYmhtk+51YBuyVfXN813qHSplHXWMjhUTgykJYOZT96nI
         k9W8lozPC3ue6K9PgE34wWEfZx3mpI/o5jDomM5nKT0S+SY8IKCm8nSXVK3JgbeoZMPU
         /Lp2NI17CYqPCRXNztuXELQM819inEFLuL+7DTzyhjKbdGhzvWE2L/lIek8OvFMT0dC5
         Obow==
X-Forwarded-Encrypted: i=1; AJvYcCUd5Vimjcl0aeoF2+VVxTYwhOD/GSaFVUlYTaBo5T5JLrJ97XSoyIvb7kyuXbZ4KBP2Re1J4dJj7k8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwLvL2QKBF04rJs7rrgWTV/Qj3E4Ftp4MW4RiC/Iu84epNDtfIn
	ti6xsMme8MKeo5eIk8liJfJWFFY9khllAYyrA/Xsg0pmYiaQa3ic
X-Gm-Gg: ASbGncucYInBv4NGscMAYmx5ulOoorqT9DnX+CLcn4bc4EOr7xc8UFThPsjygcP1o4K
	CFcC4C3tCTCqUunZrnsVr77YFnRO6/HiSCQCs1VZhoRf37VxD+A6r7E1tsX9iZ2LP5ydRSXnNAh
	w1QsGjEELrUmV2E/+gqO0AWi/aND2FEn5otlzfXm5G6JEcIMeku987c90jGfCCtwbhdfidqjtm8
	7BTdPGf1Ut4rxqqqgnD71JKR0P5oYK+hXNFN/Rpsw8YkXpzjFmAISBNynmGFF5aBPGb3JA0fOPL
	CLrbjbEG/JPjzoBoxuoSSIjv
X-Google-Smtp-Source: AGHT+IHKV/b4OpTja4V+3bSeLRqiI1pV4ugkz/2qcipp1USPLcCJuF4RKlBH/zOnSXkuGgwcoGAG8A==
X-Received: by 2002:ac2:4155:0:b0:542:8cf5:a3a3 with SMTP id 2adb3069b0e04-5439c216c23mr3426183e87.5.1737371729069;
        Mon, 20 Jan 2025 03:15:29 -0800 (PST)
From: Uladzislau Rezki <urezki@gmail.com>
X-Google-Original-From: Uladzislau Rezki <urezki@pc636>
Date: Mon, 20 Jan 2025 12:15:20 +0100
To: Valentin Schneider <vschneid@redhat.com>
Cc: Uladzislau Rezki <urezki@gmail.com>, Jann Horn <jannh@google.com>,
	linux-kernel@vger.kernel.org, x86@kernel.org,
	virtualization@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
	linux-riscv@lists.infradead.org, linux-perf-users@vger.kernel.org,
	xen-devel@lists.xenproject.org, kvm@vger.kernel.org,
	linux-arch@vger.kernel.org, rcu@vger.kernel.org,
	linux-hardening@vger.kernel.org, linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org, bpf@vger.kernel.org,
	bcm-kernel-feedback-list@broadcom.com,
	Juergen Gross <jgross@suse.com>,
	Ajay Kaher <ajay.kaher@broadcom.com>,
	Alexey Makhalov <alexey.amakhalov@broadcom.com>,
	Russell King <linux@armlinux.org.uk>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	"Liang, Kan" <kan.liang@linux.intel.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Pawan Gupta <pawan.kumar.gupta@linux.intel.com>,
	Sean Christopherson <seanjc@google.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Andy Lutomirski <luto@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Jason Baron <jbaron@akamai.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Neeraj Upadhyay <neeraj.upadhyay@kernel.org>,
	Joel Fernandes <joel@joelfernandes.org>,
	Josh Triplett <josh@joshtriplett.org>,
	Boqun Feng <boqun.feng@gmail.com>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Zqiang <qiang.zhang1211@gmail.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	Clark Williams <williams@redhat.com>,
	Yair Podemsky <ypodemsk@redhat.com>,
	Tomas Glozar <tglozar@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Kees Cook <kees@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Christoph Hellwig <hch@infradead.org>,
	Shuah Khan <shuah@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	Miguel Ojeda <ojeda@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
	"Mike Rapoport (Microsoft)" <rppt@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Rong Xu <xur@google.com>,
	Nicolas Saenz Julienne <nsaenzju@redhat.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Yosry Ahmed <yosryahmed@google.com>,
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
	"Masami Hiramatsu (Google)" <mhiramat@kernel.org>,
	Jinghao Jia <jinghao7@illinois.edu>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Tiezhu Yang <yangtiezhu@loongson.cn>
Subject: Re: [PATCH v4 29/30] x86/mm, mm/vmalloc: Defer
 flush_tlb_kernel_range() targeting NOHZ_FULL CPUs
Message-ID: <Z44wSJTXknQVKWb0@pc636>
References: <20250114175143.81438-1-vschneid@redhat.com>
 <20250114175143.81438-30-vschneid@redhat.com>
 <CAG48ez1Mh+DOy0ysOo7Qioxh1W7xWQyK9CLGNU9TGOsLXbg=gQ@mail.gmail.com>
 <xhsmh34hhh37q.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
 <Z4qBMqcMg16p57av@pc636>
 <xhsmhwmetfk9d.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <xhsmhwmetfk9d.mognet@vschneid-thinkpadt14sgen2i.remote.csb>

On Fri, Jan 17, 2025 at 06:00:30PM +0100, Valentin Schneider wrote:
> On 17/01/25 17:11, Uladzislau Rezki wrote:
> > On Fri, Jan 17, 2025 at 04:25:45PM +0100, Valentin Schneider wrote:
> >> On 14/01/25 19:16, Jann Horn wrote:
> >> > On Tue, Jan 14, 2025 at 6:51 PM Valentin Schneider <vschneid@redhat.com> wrote:
> >> >> vunmap()'s issued from housekeeping CPUs are a relatively common source of
> >> >> interference for isolated NOHZ_FULL CPUs, as they are hit by the
> >> >> flush_tlb_kernel_range() IPIs.
> >> >>
> >> >> Given that CPUs executing in userspace do not access data in the vmalloc
> >> >> range, these IPIs could be deferred until their next kernel entry.
> >> >>
> >> >> Deferral vs early entry danger zone
> >> >> ===================================
> >> >>
> >> >> This requires a guarantee that nothing in the vmalloc range can be vunmap'd
> >> >> and then accessed in early entry code.
> >> >
> >> > In other words, it needs a guarantee that no vmalloc allocations that
> >> > have been created in the vmalloc region while the CPU was idle can
> >> > then be accessed during early entry, right?
> >>
> >> I'm not sure if that would be a problem (not an mm expert, please do
> >> correct me) - looking at vmap_pages_range(), flush_cache_vmap() isn't
> >> deferred anyway.
> >>
> >> So after vmapping something, I wouldn't expect isolated CPUs to have
> >> invalid TLB entries for the newly vmapped page.
> >>
> >> However, upon vunmap'ing something, the TLB flush is deferred, and thus
> >> stale TLB entries can and will remain on isolated CPUs, up until they
> >> execute the deferred flush themselves (IOW for the entire duration of the
> >> "danger zone").
> >>
> >> Does that make sense?
> >>
> > Probably i am missing something and need to have a look at your patches,
> > but how do you guarantee that no-one map same are that you defer for TLB
> > flushing?
> >
> 
> That's the cool part: I don't :')
> 
Indeed, sounds unsafe :) Then we just do not need to free areas.

> For deferring instruction patching IPIs, I (well Josh really) managed to
> get instrumentation to back me up and catch any problematic area.
> 
> I looked into getting something similar for vmalloc region access in
> .noinstr code, but I didn't get anywhere. I even tried using emulated
> watchpoints on QEMU to watch the whole vmalloc range, but that went about
> as well as you could expect.
> 
> That left me with staring at code. AFAICT the only vmap'd thing that is
> accessed during early entry is the task stack (CONFIG_VMAP_STACK), which
> itself cannot be freed until the task exits - thus can't be subject to
> invalidation when a task is entering kernelspace.
> 
> If you have any tracing/instrumentation suggestions, I'm all ears (eyes?).
> 
As noted before, we defer flushing for vmalloc. We have a lazy-threshold
which can be exposed(if you need it) over sysfs for tuning. So, we can add it.

--
Uladzislau Rezki

