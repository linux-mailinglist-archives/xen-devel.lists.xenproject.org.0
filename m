Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 53A4EA11364
	for <lists+xen-devel@lfdr.de>; Tue, 14 Jan 2025 22:49:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.872104.1283062 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tXomN-0003PS-81; Tue, 14 Jan 2025 21:48:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 872104.1283062; Tue, 14 Jan 2025 21:48:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tXomN-0003Me-4k; Tue, 14 Jan 2025 21:48:55 +0000
Received: by outflank-mailman (input) for mailman id 872104;
 Tue, 14 Jan 2025 21:48:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yd6S=UG=flex--seanjc.bounces.google.com=3wtuGZwYKCdcL73GC59HH9E7.5HFQ7G-67O7EEBLML.Q7GIKHC75M.HK9@srs-se1.protection.inumbo.net>)
 id 1tXomL-0003MY-LP
 for xen-devel@lists.xenproject.org; Tue, 14 Jan 2025 21:48:53 +0000
Received: from mail-pj1-x104a.google.com (mail-pj1-x104a.google.com
 [2607:f8b0:4864:20::104a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5764e6c1-d2c1-11ef-99a4-01e77a169b0f;
 Tue, 14 Jan 2025 22:48:51 +0100 (CET)
Received: by mail-pj1-x104a.google.com with SMTP id
 98e67ed59e1d1-2f5538a2356so10422580a91.2
 for <xen-devel@lists.xenproject.org>; Tue, 14 Jan 2025 13:48:51 -0800 (PST)
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
X-Inumbo-ID: 5764e6c1-d2c1-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736891330; x=1737496130; darn=lists.xenproject.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=SY5ohLi34L7dYoduVlaYy23kjKtiA3foJ9V2Q6nj8Ew=;
        b=u5nWWMlvhRXnCwgbCcMadkd2WRLHOEnETc3L19fmyYljDs2qvfuke/bcVdC+xZ2997
         2v01xolJ/LjXL0gX73zTwsIVbrcR6SMPVP6Nm5FXzB1yg3HQeZYzTsgx29VQimRwUSBE
         997Fs5l5Hb1SWEyCSA+XRT5z3SPKLVYelje+oVuKH79JJpnQhuwSiIie9tEGOAw5Ij64
         Gt97dxXwB/Xx6EGJryNjGDRGdNKbL/MXncNhY1SsxUtPOUJcyebgGIGgEyDO5SyLOhFo
         psAbms9XVbgl5NsYYvo7BP8eT6yaGULYNv5oqLhP8+WLHZkEzjVCf0DMQfiwBR3hJ0NL
         cu/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736891330; x=1737496130;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SY5ohLi34L7dYoduVlaYy23kjKtiA3foJ9V2Q6nj8Ew=;
        b=ThE0gZiWruH032R3hi7IxA+Z120R6l4djeFhHaGoB6GScHlyLpQ81xTz69ElLSchZW
         rL/qMqtZihM8NxyUmTwmVTLh8XtmHjffYjiB3yWS32CsHstX2iFYM5pfJkFxp7GLylHv
         W8jyYcyNuhvO72xGqTkjlF488nxhLehquyb32rHRtUHNeHxz0oLt+W1fQxbuPS37oKkb
         yHojNhSRSqf2+a7l8/uIVU/kYgaJrnb0kApza82Bx9GqRIWgfcTjRXzwaR2g45gIUBme
         ON+JGUKHALBdlJ4fpS6JWp0RldgZrix/VYXB+/CIe8cnImuSf4fLuOFhhTgbFxAv7uXk
         viuQ==
X-Forwarded-Encrypted: i=1; AJvYcCUCJGHrRFvnPrriVJTZPgPyjEr19QWZRq3uKgQWv7hKAi6Vtp+4PPIz5dD4Zb6QpZYHNvUBGX4lOtg=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywm7lvguYzJTYAhGV133Qj1Fo6VaLsFBdaM07E2i9fh+hEW/F/x
	2eKu3dJg05L+8T44/v5ApIOZorG16KiA+j9lsBXFbsN6A5uG5VoAI3HQnbyDJrB2zTpbTA6MPCN
	iYA==
X-Google-Smtp-Source: AGHT+IGwfpH2TIl0yoCx6tHXuYKAWJYGIodcKzr2p0TmFaGwbmX4878qRqYpxqFQD7ygsze3Eu4GllOh0sY=
X-Received: from pjbtc14.prod.google.com ([2002:a17:90b:540e:b0:2f2:ea3f:34c3])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90a:d00b:b0:2ee:d63f:d8f
 with SMTP id 98e67ed59e1d1-2f548ebf53cmr37053651a91.13.1736891330040; Tue, 14
 Jan 2025 13:48:50 -0800 (PST)
Date: Tue, 14 Jan 2025 13:48:48 -0800
In-Reply-To: <Z4bTlZkqihaAyGb4@google.com>
Mime-Version: 1.0
References: <20250114175143.81438-1-vschneid@redhat.com> <20250114175143.81438-26-vschneid@redhat.com>
 <Z4bTlZkqihaAyGb4@google.com>
Message-ID: <Z4bbwE8yfg349gBx@google.com>
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

On Tue, Jan 14, 2025, Sean Christopherson wrote:
> On Tue, Jan 14, 2025, Valentin Schneider wrote:
> > +/**
> > + * is_kernel_noinstr_text - checks if the pointer address is located in the
> > + *                    .noinstr section
> > + *
> > + * @addr: address to check
> > + *
> > + * Returns: true if the address is located in .noinstr, false otherwise.
> > + */
> > +static inline bool is_kernel_noinstr_text(unsigned long addr)
> > +{
> > +	return addr >= (unsigned long)__noinstr_text_start &&
> > +	       addr < (unsigned long)__noinstr_text_end;
> > +}
> 
> This doesn't do the right thing for modules, which matters because KVM can be
> built as a module on x86, and because context tracking understands transitions
> to GUEST mode, i.e. CPUs that are running in a KVM guest will be treated as not
> being in the kernel, and thus will have IPIs deferred.  If KVM uses a static key
> or branch between guest_state_enter_irqoff() and guest_state_exit_irqoff(), the
> patching code won't wait for CPUs to exit guest mode, i.e. KVM could theoretically
> use the wrong static path.
> 
> I don't expect this to ever cause problems in practice, because patching code in
> KVM's VM-Enter/VM-Exit path that has *functional* implications, while CPUs are
> actively running guest code, would be all kinds of crazy.  But I do think we
> should plug the hole.
> 
> If this issue is unique to KVM, i.e. is not a generic problem for all modules (I
> assume module code generally isn't allowed in the entry path, even via NMI?), one
> idea would be to let KVM register its noinstr section for text poking.

Another idea would be to track which keys/branches are tagged noinstr, i.e. generate
the information at compile time instead of doing lookups at runtime.  The biggest
downside I can think of is that it would require plumbing in the information to
text_poke_bp_batch().

