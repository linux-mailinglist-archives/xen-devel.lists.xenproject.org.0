Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B0649A112CD
	for <lists+xen-devel@lfdr.de>; Tue, 14 Jan 2025 22:14:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.872049.1283013 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tXoEd-0007hN-JS; Tue, 14 Jan 2025 21:14:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 872049.1283013; Tue, 14 Jan 2025 21:14:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tXoEd-0007fA-GA; Tue, 14 Jan 2025 21:14:03 +0000
Received: by outflank-mailman (input) for mailman id 872049;
 Tue, 14 Jan 2025 21:14:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eXvd=UG=flex--seanjc.bounces.google.com=3ltOGZwYKCZsN95IE7BJJBG9.7JHS9I-89Q9GGDNON.S9IKMJE97O.JMB@srs-se1.protection.inumbo.net>)
 id 1tXoEc-0007dq-R7
 for xen-devel@lists.xenproject.org; Tue, 14 Jan 2025 21:14:02 +0000
Received: from mail-pj1-x1049.google.com (mail-pj1-x1049.google.com
 [2607:f8b0:4864:20::1049])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 78f4ff90-d2bc-11ef-a0e1-8be0dac302b0;
 Tue, 14 Jan 2025 22:14:00 +0100 (CET)
Received: by mail-pj1-x1049.google.com with SMTP id
 98e67ed59e1d1-2ee9f66cb12so10679950a91.1
 for <xen-devel@lists.xenproject.org>; Tue, 14 Jan 2025 13:14:00 -0800 (PST)
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
X-Inumbo-ID: 78f4ff90-d2bc-11ef-a0e1-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736889239; x=1737494039; darn=lists.xenproject.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=d9cRGGic7Te5o12Iwy1M3OB31drPOXRp+PHli2u04Fc=;
        b=AmmEf5wmUY4Q8eyjg0u0n+GempsHdqd743WDW2Ym8VrABy/52oRM6fRPF6yMV8wgUY
         q1bTqJ3e51I/cs0nid/dXUX1YQWlHptpoxJ50wUluMfziprPElQ08SkkQi88HqwA5/lV
         EixpOebsr2fHvjOdqHvdZxHbvuyZbocbiRv9tUtU9ftvk61DF8F+xwzMtg0OOfNwNhn9
         OjNEDRJOoAQL3Y6J9n3S1+XeqoUP5Kvw8WmWlVJKNzNp0UhsvvTkMjYhX3XGhlwkCMgn
         S59zudW/vS2RJjXByMsc4oLQhX07/3XQiNMXsU6oLPo27FewmqPWO0BcZ+nB/gZYQQeG
         Lk6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736889239; x=1737494039;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=d9cRGGic7Te5o12Iwy1M3OB31drPOXRp+PHli2u04Fc=;
        b=O3QtQcVQtYqQ1/5si7gNuGMWqBYqhBkYOAY+ViFiXdRTbIvA8NmVNz/Jy0W2Ca3Io7
         sfNTsjOAxhbAeSkHe3b7ceO9J8WvmasTAFkXta/Z5SraD7hQ5JLSOOH+DwkW+ORKdmdh
         OfIKSVTLp8RmuRoQ8ib++4bgy2YBQKtNnEeWDZKRVcEFCkqxMVag4klz+kVme1YOtit2
         9MXlZ01gO77nj5s3Cpo2VejV3PMjPT4AFRowxqb1xjSWMLPLKZfPaSRM3M/BQWhzJj1T
         0kRY8QsInHjgbsQEu3rMWTDxGNAy7ZPLQTTm5jUJsf23/q07amviG4rGNiIS6YApk0/Q
         //pQ==
X-Forwarded-Encrypted: i=1; AJvYcCXaD4bfaMBsS2NDT6/724QhpUSI0bJEE8/kFO9Wxio2RLFUqDtfqSiBl0TJO0Cnx3ZC65icPI24XCo=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxz7qfhp8obGxd5Ncc54J30Go2BIU4dOK4bmYnsZJQxdI2aTdBJ
	FKW5pqXePnBHW0QOy5YUG3f8cRV+bmW6hn+3XeuiTy6r3By/DKc5VKLNh0bh2k5NZ34MW5MSc4s
	A/A==
X-Google-Smtp-Source: AGHT+IFnD8IBYtaFLZfmn+yp8faKF4j5W1D2QQ93HaiFkyR3KITtNCKyHKA+6Vtw5k/ROipPB4Gea/5UJbQ=
X-Received: from pjbsn8.prod.google.com ([2002:a17:90b:2e88:b0:2f4:465d:5c61])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:1f8b:b0:2ee:bf84:4fe8
 with SMTP id 98e67ed59e1d1-2f548f1d44cmr36656404a91.30.1736889238866; Tue, 14
 Jan 2025 13:13:58 -0800 (PST)
Date: Tue, 14 Jan 2025 13:13:57 -0800
In-Reply-To: <20250114175143.81438-26-vschneid@redhat.com>
Mime-Version: 1.0
References: <20250114175143.81438-1-vschneid@redhat.com> <20250114175143.81438-26-vschneid@redhat.com>
Message-ID: <Z4bTlZkqihaAyGb4@google.com>
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
> text_poke_bp_batch() sends IPIs to all online CPUs to synchronize
> them vs the newly patched instruction. CPUs that are executing in userspace
> do not need this synchronization to happen immediately, and this is
> actually harmful interference for NOHZ_FULL CPUs.

...

> This leaves us with static keys and static calls.

...

> @@ -2317,11 +2334,20 @@ static void text_poke_bp_batch(struct text_poke_loc *tp, unsigned int nr_entries
>  	 * First step: add a int3 trap to the address that will be patched.
>  	 */
>  	for (i = 0; i < nr_entries; i++) {
> -		tp[i].old = *(u8 *)text_poke_addr(&tp[i]);
> -		text_poke(text_poke_addr(&tp[i]), &int3, INT3_INSN_SIZE);
> +		void *addr = text_poke_addr(&tp[i]);
> +
> +		/*
> +		 * There's no safe way to defer IPIs for patching text in
> +		 * .noinstr, record whether there is at least one such poke.
> +		 */
> +		if (is_kernel_noinstr_text((unsigned long)addr))
> +			cond = NULL;

Maybe pre-check "cond", especially if multiple ranges need to be checked?  I.e.

		if (cond && is_kernel_noinstr_text(...))
> +
> +		tp[i].old = *((u8 *)addr);
> +		text_poke(addr, &int3, INT3_INSN_SIZE);
>  	}
>  
> -	text_poke_sync();
> +	__text_poke_sync(cond);
>  
>  	/*
>  	 * Second step: update all but the first byte of the patched range.

...

> +/**
> + * is_kernel_noinstr_text - checks if the pointer address is located in the
> + *                    .noinstr section
> + *
> + * @addr: address to check
> + *
> + * Returns: true if the address is located in .noinstr, false otherwise.
> + */
> +static inline bool is_kernel_noinstr_text(unsigned long addr)
> +{
> +	return addr >= (unsigned long)__noinstr_text_start &&
> +	       addr < (unsigned long)__noinstr_text_end;
> +}

This doesn't do the right thing for modules, which matters because KVM can be
built as a module on x86, and because context tracking understands transitions
to GUEST mode, i.e. CPUs that are running in a KVM guest will be treated as not
being in the kernel, and thus will have IPIs deferred.  If KVM uses a static key
or branch between guest_state_enter_irqoff() and guest_state_exit_irqoff(), the
patching code won't wait for CPUs to exit guest mode, i.e. KVM could theoretically
use the wrong static path.

I don't expect this to ever cause problems in practice, because patching code in
KVM's VM-Enter/VM-Exit path that has *functional* implications, while CPUs are
actively running guest code, would be all kinds of crazy.  But I do think we
should plug the hole.

If this issue is unique to KVM, i.e. is not a generic problem for all modules (I
assume module code generally isn't allowed in the entry path, even via NMI?), one
idea would be to let KVM register its noinstr section for text poking.

