Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1031CA11308
	for <lists+xen-devel@lfdr.de>; Tue, 14 Jan 2025 22:27:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.872083.1283042 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tXoRA-0007gy-6W; Tue, 14 Jan 2025 21:27:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 872083.1283042; Tue, 14 Jan 2025 21:27:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tXoRA-0007dO-3y; Tue, 14 Jan 2025 21:27:00 +0000
Received: by outflank-mailman (input) for mailman id 872083;
 Tue, 14 Jan 2025 21:26:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qKc7=UG=flex--seanjc.bounces.google.com=3n9aGZwYKCaocOKXTMQYYQVO.MYWhOX-NOfOVVScdc.hOXZbYTOMd.YbQ@srs-se1.protection.inumbo.net>)
 id 1tXoR8-0007UQ-6Q
 for xen-devel@lists.xenproject.org; Tue, 14 Jan 2025 21:26:58 +0000
Received: from mail-pj1-x104a.google.com (mail-pj1-x104a.google.com
 [2607:f8b0:4864:20::104a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 478996c4-d2be-11ef-99a4-01e77a169b0f;
 Tue, 14 Jan 2025 22:26:56 +0100 (CET)
Received: by mail-pj1-x104a.google.com with SMTP id
 98e67ed59e1d1-2ee46799961so15462460a91.2
 for <xen-devel@lists.xenproject.org>; Tue, 14 Jan 2025 13:26:56 -0800 (PST)
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
X-Inumbo-ID: 478996c4-d2be-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736890015; x=1737494815; darn=lists.xenproject.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=V8zpuNawVjToL3i20ZYrbUddkmOaJHAfbCZJnZQ478w=;
        b=l/cByV5YV07DSwPirarW6Wdhb+ZbNSKN8G7fXC69yBrtZMne658PF6ItI9OtAaoFJP
         EiTkrHgvvJJCmGH6Snu79G3hUXEt3mi/M/b261oGQUlLh7gayCNGxcBAaXzD9bqVf67k
         jB/qCgmi3pxATMyVf1bdZdIRgceKcv7k0FfiVBnBeI/+s6sqgsZbhzLcSGuareMvW7cx
         vhcrkWVWk5z/i1Yj0uaMuFrtTtrXDPjUOC19CQ9jHmUNwG2mwsDZVzbLxtX4hp0WwpWW
         /poGE+xhsqYYA0w8d//ZVpRhCy7p1QkyvRa+brtw9E2Kk67Id2xMgQz5xMJ6THUY6kMq
         pVnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736890015; x=1737494815;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=V8zpuNawVjToL3i20ZYrbUddkmOaJHAfbCZJnZQ478w=;
        b=HJ5SBLPvYpq1GT4WxbG5J3cEhyPWih4TfCrwRPn1H3mUSKUdY3FTHHiEQwC2VVRbv4
         BKzGg/lNqxlf+hIzagLsJk4VE1UMaXvYGH4eYl627PNDZnsIlFThAFOBiEUQi1ZHsKRy
         z281HAuRF1LwssEwj+u4WPYLI9V9HcB8gRMEcyVTg8u1ZqahARPScza+u/xEAlHxfDc0
         aA5Rs+IA1t0n5k8+7AbtFdokjQ3rypiCrBFObYMaowgcZOarkzVLKL7RXrBjKNxXcQLe
         iUl0DAdIfHhBFAA9J/OgMbs8N7fZUY0Mb/i23bt42Q9PnjDo1ucHjWAdigN0C78p5YZN
         IcIQ==
X-Forwarded-Encrypted: i=1; AJvYcCXgSG9dQuoredaxMKOV3KOB8KzjVmFpfj1qnk5W4RsgmBddPBSAcqTkp0bL3mzKu0X/V0Iaoclx4M4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwTNq2LWtJJq+KBVqKDUDPH1jcOkXASLD1GyJoy00KydfAGildg
	vyX6pvhtiK4haVqE3VbxiJxZ8YBSKNlpdGy9LmVdlCR9F4Du4/1IP50ONmF8J1xHWrilO5KgruK
	pqA==
X-Google-Smtp-Source: AGHT+IGDv4Ej+tMoSohr/AoTazwT/WbetgA7Nr8qE8BLNxmtc1cUUDk0TRGuDLxFKlrZpHzOjZy+L7iCKdA=
X-Received: from pjbsx15.prod.google.com ([2002:a17:90b:2ccf:b0:2ef:8ef8:2701])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:544b:b0:2ee:9902:18b4
 with SMTP id 98e67ed59e1d1-2f548f61fe6mr37131771a91.27.1736890015061; Tue, 14
 Jan 2025 13:26:55 -0800 (PST)
Date: Tue, 14 Jan 2025 13:26:53 -0800
In-Reply-To: <20250114175143.81438-26-vschneid@redhat.com>
Mime-Version: 1.0
References: <20250114175143.81438-1-vschneid@redhat.com> <20250114175143.81438-26-vschneid@redhat.com>
Message-ID: <Z4bWnWYqu1LaD-JG@google.com>
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

On Tue, Jan 14, 2025, Valentin Schneider wrote:
>  static __always_inline void arch_context_tracking_work(enum ct_work work)
>  {
>  	switch (work) {
> -	case CT_WORK_n:
> -		// Do work...
> +	case CT_WORK_SYNC:
> +		sync_core();

Not your bug, but serialize() needs to be __always_inline.  Not sure what exactly
caused it to be uninlined, but this is the obvious new usage.

vmlinux.o: warning: objtool: __static_call_update_early+0x4e: call to serialize() leaves .noinstr.text section
vmlinux.o: warning: objtool: ct_work_flush+0x69: call to serialize() leaves .noinstr.text section

