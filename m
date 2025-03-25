Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C2E3CA70939
	for <lists+xen-devel@lfdr.de>; Tue, 25 Mar 2025 19:43:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.926927.1329748 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tx9EM-0006Rr-An; Tue, 25 Mar 2025 18:42:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 926927.1329748; Tue, 25 Mar 2025 18:42:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tx9EM-0006QP-87; Tue, 25 Mar 2025 18:42:30 +0000
Received: by outflank-mailman (input) for mailman id 926927;
 Tue, 25 Mar 2025 18:42:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=s9MN=WM=google.com=jannh@srs-se1.protection.inumbo.net>)
 id 1tx9EL-0006QJ-0T
 for xen-devel@lists.xenproject.org; Tue, 25 Mar 2025 18:42:29 +0000
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [2a00:1450:4864:20::52f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e6c2bb0f-09a8-11f0-9ea3-5ba50f476ded;
 Tue, 25 Mar 2025 19:42:28 +0100 (CET)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-5e50bae0f5bso2025a12.0
 for <xen-devel@lists.xenproject.org>; Tue, 25 Mar 2025 11:42:28 -0700 (PDT)
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
X-Inumbo-ID: e6c2bb0f-09a8-11f0-9ea3-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1742928147; x=1743532947; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ohWbm/UuIc3MDUKHoYt0YitrpdOZotQW09VJZwN6f+A=;
        b=ARfgUWg9h4c9Wt0bPE24HHR/tEcf1RU2pcExLik6DFCICcZy1nYUK3fQZmBl2obuMP
         4dAXD328wvqkt7Sb2muQOAUp1k1Obb3lCot7YyfuLR5IF+Omye2P90zgUwNar1mD5ZPt
         Sb/nYl04EqheTORxGxSgEauHhW/jk3qz1ywfwwQagbYSamP/xEZ5PRnRkYuVuGLyDA4Z
         q50aY0YP5lBr64VN7FfNfFwn6s5uUug/dQivq7ROsdI/Z35evLsnVX/VxC7o6S20VqgQ
         Fm8PYcxIJIkL1fHAOKzLLNlWdVvsomTMVNEdQ1IzGWNN432Fp74+RmUK277UXCLR53kB
         vzVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742928147; x=1743532947;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ohWbm/UuIc3MDUKHoYt0YitrpdOZotQW09VJZwN6f+A=;
        b=i1GmH6jvU3xxRX+FN85yvdnlyJogDZPrdJzuiVCy3KqGSsqhhk4L4x3/4zkLwYwOVH
         cRH/Gd6KSQq3DcSGtLS6TELOGACEDjlqc8b3IJuU4AzvwPd6ammw/WCnqsbTpv18JA7s
         DexS68Od0dg6XSrXi88o8Oy+7NhKtRJdhDj06Tl2V1bF0urDiFGJJsxwQ0MCg+/42etx
         G1pjJoPYs/jZbqpUUvXAt2Y5Vohb03dkLQc8t6hU8L69sA0Rg1FyH0fCV+4ZcjPXFJsk
         6g8xvpKx+ZduszCJ8BkXNX6yqmc5bG+/IDCvE2JhB4nxQbaqWuP64t1vAhDeM5l0o2Qx
         kEpQ==
X-Forwarded-Encrypted: i=1; AJvYcCXhYymPpzXvJh4pkZutg8mknUHf0M6yMXQOZMd7j158xU/05dMVkQHawPWWAA/p9BOf5ggSsmGT74Y=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyMm5JFGmPStlMK4hgxGWMebVkznwyNsnpmXtqkOQG8XHye0dSs
	DW/s+yG7sOzkwsRN06Fc3eMGwl5ZjJ9U9wltHY92ntQkaFvJQ5rg1OUP+QAxA6orpR3YvoQgQS6
	18Ida1PdwdLf+arbPipvh50K4P5Itd6pz8CZ6
X-Gm-Gg: ASbGnctWG4VfgPdDKYvcDvWVong2U7UBknHpHdKhXxJbO3Ua9Y0J/FQhvCpc6l3e5a/
	JYYPtfJbwLLn3q+Qw+Dcr8FrIoeecjnwTk5lE36rumjPmLYtEs71uN1x7p0VrKYtDQL9HRJIZiJ
	VgoTAEfKZFYkiWi6o8LR5WBOMIfYRJc2Aq9cFIo2/djB5gPxzFg1uQIOJA41QukHY1
X-Google-Smtp-Source: AGHT+IG/oxMHsUwCe/Pv38c6tGHW1E+mjtkA7yC/Fgzn+9xwryPNKquWqjWfGFAmY6c6RcrvuYp4RqLtrV1djsqY7q0=
X-Received: by 2002:a50:ed83:0:b0:5dc:ccb4:cb11 with SMTP id
 4fb4d7f45d1cf-5ed53ee96e9mr10451a12.4.1742928147101; Tue, 25 Mar 2025
 11:42:27 -0700 (PDT)
MIME-Version: 1.0
References: <20250114175143.81438-1-vschneid@redhat.com> <20250114175143.81438-30-vschneid@redhat.com>
 <CAG48ez1Mh+DOy0ysOo7Qioxh1W7xWQyK9CLGNU9TGOsLXbg=gQ@mail.gmail.com>
 <xhsmh34hhh37q.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
 <CAG48ez3H8OVP1GxBLdmFgusvT1gQhwu2SiXbgi8T9uuCYVK52w@mail.gmail.com>
 <xhsmh5xlhk5p2.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
 <CAG48ez1EAATYcX520Nnw=P8XtUDSr5pe+qGH1YVNk3xN2LE05g@mail.gmail.com>
 <xhsmh34gkk3ls.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
 <352317e3-c7dc-43b4-b4cb-9644489318d0@intel.com> <xhsmhjz9mj2qo.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
 <d0450bc8-6585-49ca-9cad-49e65934bd5c@intel.com> <xhsmhh64qhssj.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
 <eef09bdc-7546-462b-9ac0-661a44d2ceae@intel.com> <xhsmhfrk84k5k.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
 <408ebd8b-4bfb-4c4f-b118-7fe853c6e897@intel.com> <xhsmhy0wtngkd.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
In-Reply-To: <xhsmhy0wtngkd.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
From: Jann Horn <jannh@google.com>
Date: Tue, 25 Mar 2025 19:41:49 +0100
X-Gm-Features: AQ5f1Jo2l3CP6X5vd0V2T3oskBTdoXupZsoP0HqqqOWE1sDQ_J5UAMa3wCMvDAw
Message-ID: <CAG48ez2bSh6=J8cXJhqYX=Y8pXcGsFgC05HsGcF0b1sJK2VH7A@mail.gmail.com>
Subject: Re: [PATCH v4 29/30] x86/mm, mm/vmalloc: Defer flush_tlb_kernel_range()
 targeting NOHZ_FULL CPUs
To: Valentin Schneider <vschneid@redhat.com>, Rik van Riel <riel@surriel.com>
Cc: Dave Hansen <dave.hansen@intel.com>, linux-kernel@vger.kernel.org, x86@kernel.org, 
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

On Tue, Mar 25, 2025 at 6:52=E2=80=AFPM Valentin Schneider <vschneid@redhat=
.com> wrote:
> On 20/02/25 09:38, Dave Hansen wrote:
> > But, honestly, I'm still not sure this is worth all the trouble. If
> > folks want to avoid IPIs for TLB flushes, there are hardware features
> > that *DO* that. Just get new hardware instead of adding this complicate=
d
> > pile of software that we have to maintain forever. In 10 years, we'll
> > still have this software *and* 95% of our hardware has the hardware
> > feature too.
>
> Sorry, you're going to have to deal with my ignorance a little bit longer=
...
>
> Were you thinking x86 hardware specifically, or something else?
> AIUI things like arm64's TLBIVMALLE1IS can do what is required without an=
y
> IPI:
>
> C5.5.78
> """
> The invalidation applies to all PEs in the same Inner Shareable shareabil=
ity domain as the PE that
> executes this System instruction.
> """
>
> But for (at least) these architectures:
>
>   alpha
>   x86
>   loongarch
>   mips
>   (non-freescale 8xx) powerpc
>   riscv
>   xtensa
>
> flush_tlb_kernel_range() has a path with a hardcoded use of on_each_cpu()=
,
> so AFAICT for these the IPIs will be sent no matter the hardware.

On X86, both AMD and Intel have some fairly recently introduced CPU
features that can shoot down TLBs remotely.

The patch series
<https://lore.kernel.org/all/20250226030129.530345-1-riel@surriel.com/>
adds support for the AMD flavor; that series landed in the current
merge window (it's present in the mainline git repository now and should
be part of 6.15). I think support for the Intel flavor has not yet
been implemented, but the linked patch series mentions a plan to look
at the Intel flavor next.

