Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 11475A15592
	for <lists+xen-devel@lfdr.de>; Fri, 17 Jan 2025 18:15:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.874229.1285039 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tYpwT-0001Kc-FA; Fri, 17 Jan 2025 17:15:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 874229.1285039; Fri, 17 Jan 2025 17:15:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tYpwT-0001IF-Bd; Fri, 17 Jan 2025 17:15:33 +0000
Received: by outflank-mailman (input) for mailman id 874229;
 Fri, 17 Jan 2025 17:15:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=F0h2=UJ=flex--seanjc.bounces.google.com=3MJCKZwYKCb0vhdqmfjrrjoh.frp0hq-ghyhoolvwv.0hqsurmhfw.ruj@srs-se1.protection.inumbo.net>)
 id 1tYpwS-0001I9-CP
 for xen-devel@lists.xenproject.org; Fri, 17 Jan 2025 17:15:32 +0000
Received: from mail-pl1-x64a.google.com (mail-pl1-x64a.google.com
 [2607:f8b0:4864:20::64a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a6e23de2-d4f6-11ef-a0e2-8be0dac302b0;
 Fri, 17 Jan 2025 18:15:31 +0100 (CET)
Received: by mail-pl1-x64a.google.com with SMTP id
 d9443c01a7336-2166a1a5cc4so43079535ad.3
 for <xen-devel@lists.xenproject.org>; Fri, 17 Jan 2025 09:15:31 -0800 (PST)
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
X-Inumbo-ID: a6e23de2-d4f6-11ef-a0e2-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1737134129; x=1737738929; darn=lists.xenproject.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=/pcx17eniD+ASjh3teIfjrJN/d55a+1SMCIjE05N6Y0=;
        b=zJ8hUFM3xBr+KdxjyAxaSg5zYRmUp8FbyB6p1l1qiWNc5Nb00nrDTzNT1+LPKO5WIc
         AVhJWHY8dI5Eb96UTAoSBVnp2JkcHJphRSGuHexHukaSGEfBGyXhHgMQ1aE+NbRSu6sT
         Ufj9Wbx4foaHoczOdeZN7v6ouYMRhX5nd+9K+NRe2oWHEM6cc06v4eRRtpb9+Dd4h36y
         9gPmEhAda9Vdry0IPzVbaTSqiQ3ihpc0/h4JqXnFJzvxfw2wv5AoDx3aG6MWxa+mXcjD
         Dya1jww6jWtBs6hOiF8CEM/ERMi+V2gdAoaszJOSXyCP6RvRMcP0Oa5bKUmFgcxtaY1Y
         v8jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737134129; x=1737738929;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/pcx17eniD+ASjh3teIfjrJN/d55a+1SMCIjE05N6Y0=;
        b=NUbIMsitx8TcFBO9MXvmUdijDhrjCZ5FMAOGTAru3qNp30/ObxV4u8aN2mdfhK/QJv
         9q31TChOfEa6Gh4dbeFjQTGz7xaSs58YxC1++13jF1IFeU9pWbjRUMqhA3bQhTh509bH
         firrh1+d/g17jirooib9T2+rRK+NHqnPZ96Si5Ci92/SVcdNk/MUrxdxUXCZy3G/J3Wd
         ZJpToHYX6ijLaDmDLfocQMyJ/lcZtPDBxMCF0tZxstZojcPVPwYJjk10gpoGYi9g5BFd
         sJtGXakuNpSqnV6eIH6saSE/k+vWwmQ0mNY803HmyD1s/t3gllcolbgtWDoK5l7WCozT
         yIZg==
X-Forwarded-Encrypted: i=1; AJvYcCWsFPcNbhqRmtdc8pEp1E/Xqr9v3YXSceLeo1sIa0qXI2q1yaJmMKmfCrZGKDI/3/vY9AUiFzon5QY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwZZH3Qz65fUGsqjSZfL4wmnDFZLyE5KNX5brNcT1l8X9UN4+Nu
	t7P+WELT8ZIWgQHt06RXTD1JyLVu3fVnORZT1cDtbREGppngzlmmUDrozRjOTCzoBZRltozQE6l
	jHw==
X-Google-Smtp-Source: AGHT+IFBt8EUJmCBrYJSR6SbgIXxnZj6fm10TNGjaAj4XRK+x0dRIzGirCE9VGAaKkDPtl0zEYTqCFRnILs=
X-Received: from pfbcv2.prod.google.com ([2002:a05:6a00:44c2:b0:725:a760:4c72])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:148d:b0:725:eb85:f802
 with SMTP id d2e1a72fcca58-72daf930e3cmr5815077b3a.2.1737134128872; Fri, 17
 Jan 2025 09:15:28 -0800 (PST)
Date: Fri, 17 Jan 2025 09:15:27 -0800
In-Reply-To: <xhsmhed11hiuy.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
Mime-Version: 1.0
References: <20250114175143.81438-1-vschneid@redhat.com> <20250114175143.81438-26-vschneid@redhat.com>
 <Z4bTlZkqihaAyGb4@google.com> <xhsmhed11hiuy.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
Message-ID: <Z4qQL89GZ_gk0vpu@google.com>
Subject: Re: [PATCH v4 25/30] context_tracking,x86: Defer kernel text patching IPIs
From: Sean Christopherson <seanjc@google.com>
To: Valentin Schneider <vschneid@redhat.com>
Cc: linux-kernel@vger.kernel.org, x86@kernel.org, 
	virtualization@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	loongarch@lists.linux.dev, linux-riscv@lists.infradead.org, 
	linux-perf-users@vger.kernel.org, xen-devel@lists.xenproject.org, 
	kvm@vger.kernel.org, linux-arch@vger.kernel.org, rcu@vger.kernel.org, 
	linux-hardening@vger.kernel.org, linux-mm@kvack.org, 
	linux-kselftest@vger.kernel.org, bpf@vger.kernel.org, 
	bcm-kernel-feedback-list@broadcom.com, Peter Zijlstra <peterz@infradead.org>, 
	Nicolas Saenz Julienne <nsaenzju@redhat.com>, Juergen Gross <jgross@suse.com>, 
	Ajay Kaher <ajay.kaher@broadcom.com>, Alexey Makhalov <alexey.amakhalov@broadcom.com>, 
	Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Thomas Gleixner <tglx@linutronix.de>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Kan Liang <kan.liang@linux.intel.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Pawan Gupta <pawan.kumar.gupta@linux.intel.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Andy Lutomirski <luto@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
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
	Geert Uytterhoeven <geert@linux-m68k.org>, Yosry Ahmed <yosryahmed@google.com>, 
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, 
	"Masami Hiramatsu (Google)" <mhiramat@kernel.org>, Jinghao Jia <jinghao7@illinois.edu>, 
	Luis Chamberlain <mcgrof@kernel.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Tiezhu Yang <yangtiezhu@loongson.cn>
Content-Type: text/plain; charset="us-ascii"

On Fri, Jan 17, 2025, Valentin Schneider wrote:
> On 14/01/25 13:13, Sean Christopherson wrote:
> > On Tue, Jan 14, 2025, Valentin Schneider wrote:
> >> +/**
> >> + * is_kernel_noinstr_text - checks if the pointer address is located in the
> >> + *                    .noinstr section
> >> + *
> >> + * @addr: address to check
> >> + *
> >> + * Returns: true if the address is located in .noinstr, false otherwise.
> >> + */
> >> +static inline bool is_kernel_noinstr_text(unsigned long addr)
> >> +{
> >> +	return addr >= (unsigned long)__noinstr_text_start &&
> >> +	       addr < (unsigned long)__noinstr_text_end;
> >> +}
> >
> > This doesn't do the right thing for modules, which matters because KVM can be
> > built as a module on x86, and because context tracking understands transitions
> > to GUEST mode, i.e. CPUs that are running in a KVM guest will be treated as not
> > being in the kernel, and thus will have IPIs deferred.  If KVM uses a static key
> > or branch between guest_state_enter_irqoff() and guest_state_exit_irqoff(), the
> > patching code won't wait for CPUs to exit guest mode, i.e. KVM could theoretically
> > use the wrong static path.
> 
> AFAICT guest_state_{enter,exit}_irqoff() are only used in noinstr functions
> and thus such a static key usage should at the very least be caught and
> warned about by objtool - when this isn't built as a module.

That doesn't magically do the right thing though.  If KVM is built as a module,
is_kernel_noinstr_text() will get false negatives even for static keys/branches
that are annotaed as NOINSTR.

