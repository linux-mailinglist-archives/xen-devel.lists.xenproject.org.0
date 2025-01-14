Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 53F81A112EA
	for <lists+xen-devel@lfdr.de>; Tue, 14 Jan 2025 22:20:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.872062.1283023 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tXoJs-00025E-8l; Tue, 14 Jan 2025 21:19:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 872062.1283023; Tue, 14 Jan 2025 21:19:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tXoJs-00022s-5b; Tue, 14 Jan 2025 21:19:28 +0000
Received: by outflank-mailman (input) for mailman id 872062;
 Tue, 14 Jan 2025 21:19:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CHe5=UG=flex--seanjc.bounces.google.com=33NSGZwYKCeMXJFSOHLTTLQJ.HTRcJS-IJaJQQNXYX.cJSUWTOJHY.TWL@srs-se1.protection.inumbo.net>)
 id 1tXoJr-00022m-CH
 for xen-devel@lists.xenproject.org; Tue, 14 Jan 2025 21:19:27 +0000
Received: from mail-pl1-x649.google.com (mail-pl1-x649.google.com
 [2607:f8b0:4864:20::649])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3b28b874-d2bd-11ef-a0e1-8be0dac302b0;
 Tue, 14 Jan 2025 22:19:26 +0100 (CET)
Received: by mail-pl1-x649.google.com with SMTP id
 d9443c01a7336-218cf85639eso161292945ad.3
 for <xen-devel@lists.xenproject.org>; Tue, 14 Jan 2025 13:19:26 -0800 (PST)
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
X-Inumbo-ID: 3b28b874-d2bd-11ef-a0e1-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736889565; x=1737494365; darn=lists.xenproject.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=XVbipT56M6kECF5Qh7elLUxboyXWurLrq3UYAkefsoQ=;
        b=1D5IPF1T1gcxEz6ccH7neY3tzgEXJ88Df7W6jKKVAoX4D0XHuIdcif9yNYdSZHBmro
         2XdMtHIKjBTzZmFW+wvYP98qQIgvYksTelCv7rXG3dssiK+ozpq1t6hvX2GLcIrbyFFJ
         QnE8CQYDcnP1B6Icmd5oKpakameZWnuStbq64xAfCMS8aUVFNAksoFivG7vLe5gpEq9Z
         h0oFOrXkr2suVxe1DGi9ZoXtsELXnHqcgX0rROk73dMvghWpwOeSJvNV+pr4hekZ/dk8
         /QhNI9UZFhNrLobP88HdtOzY7HbudN9nAND6YP+WsMhfb6cXh3j6QWmmI6zIebrlvV7A
         0KXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736889565; x=1737494365;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XVbipT56M6kECF5Qh7elLUxboyXWurLrq3UYAkefsoQ=;
        b=MFK5KjKBMGCdVjwpW7hVbJwX2X/tiXTg99EONqLZKZkv8tgOWhpHYmD5jVVWhBuirK
         BeZIjrEscRQG6STmEdQF6mA1YjEneUnP0EbToX63lng9SqqBQgva8QJNzUvpirYdST0C
         aJYA8D9v5n8KEOCBI62wwhDnuDBz9YlZSjFYthkbsV0qiJMqrVz2A1wqK3eylxtjJmOY
         U53wci36T0wNDlegyjFcUylVa8c04PoLj1rzSm4Qqh44oc+c/jmzEB8fYSI3WCcIWALv
         Z9xl8kiXaUSxsKvDIQ+cdhGI0MC1v+I4z9WxMsAlRu6davafiQtpxNAhvT86v+/Hf/wV
         pA/A==
X-Forwarded-Encrypted: i=1; AJvYcCXVBxRYMMvRd+ta4SZK5gQfHSJG5I5AIZlY30I6Ft6t+YQgyPzxQTGuP6U4VLZePHWnOJPKaaDRRaI=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw/+FAMRpb042CAJNZCUGPMSyHqMBT1SOyxKYA+qZyHpp/JjDd0
	aVQB1tJgEfJng8/2y8tg8Y7eQBZpgVdfKa0NNrfTOKgeH5ezk/EQbCciT/bA5Blf0XgI0ibWtwQ
	eFA==
X-Google-Smtp-Source: AGHT+IGTMIc2Hr+w/ebVVGGlbFAB7WFV7TbQJLIjfH34Jlhrw+YYPMlrag1B602JmLWOQ4sU4fLE9W3Pz50=
X-Received: from plap13.prod.google.com ([2002:a17:902:f08d:b0:217:8109:e87])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:cec1:b0:216:3dc5:1230
 with SMTP id d9443c01a7336-21a83ffc1dbmr401799985ad.42.1736889564696; Tue, 14
 Jan 2025 13:19:24 -0800 (PST)
Date: Tue, 14 Jan 2025 13:19:23 -0800
In-Reply-To: <20250114175143.81438-19-vschneid@redhat.com>
Mime-Version: 1.0
References: <20250114175143.81438-1-vschneid@redhat.com> <20250114175143.81438-19-vschneid@redhat.com>
Message-ID: <Z4bU2xlZXh53lgH6@google.com>
Subject: Re: [PATCH v4 18/30] x86/kvm/vmx: Mark vmx_l1d_should flush and
 vmx_l1d_flush_cond keys as allowed in .noinstr
From: Sean Christopherson <seanjc@google.com>
To: Valentin Schneider <vschneid@redhat.com>
Cc: linux-kernel@vger.kernel.org, x86@kernel.org, 
	virtualization@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	loongarch@lists.linux.dev, linux-riscv@lists.infradead.org, 
	linux-perf-users@vger.kernel.org, xen-devel@lists.xenproject.org, 
	kvm@vger.kernel.org, linux-arch@vger.kernel.org, rcu@vger.kernel.org, 
	linux-hardening@vger.kernel.org, linux-mm@kvack.org, 
	linux-kselftest@vger.kernel.org, bpf@vger.kernel.org, 
	bcm-kernel-feedback-list@broadcom.com, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Juergen Gross <jgross@suse.com>, Ajay Kaher <ajay.kaher@broadcom.com>, 
	Alexey Makhalov <alexey.amakhalov@broadcom.com>, Russell King <linux@armlinux.org.uk>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Thomas Gleixner <tglx@linutronix.de>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, 
	Peter Zijlstra <peterz@infradead.org>, Arnaldo Carvalho de Melo <acme@kernel.org>, 
	Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Kan Liang <kan.liang@linux.intel.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, 
	Pawan Gupta <pawan.kumar.gupta@linux.intel.com>, Paolo Bonzini <pbonzini@redhat.com>, 
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
Content-Type: text/plain; charset="us-ascii"

Please use "KVM: VMX:" for the scope.

On Tue, Jan 14, 2025, Valentin Schneider wrote:
> Later commits will cause objtool to warn about static keys being used in
> .noinstr sections in order to safely defer instruction patching IPIs
> targeted at NOHZ_FULL CPUs.
> 
> These keys are used in .noinstr code, and can be modified at runtime
> (/proc/kernel/vmx* write). However it is not expected that they will be
> flipped during latency-sensitive operations, and thus shouldn't be a source
> of interference wrt the text patching IPI.

This misses KVM's static key that's buried behind CONFIG_HYPERV=m|y.

vmlinux.o: warning: objtool: vmx_vcpu_enter_exit+0x241: __kvm_is_using_evmcs: non-RO static key usage in noinstr
vmlinux.o: warning: objtool: vmx_update_host_rsp+0x13: __kvm_is_using_evmcs: non-RO static key usage in noinstr

Side topic, it's super annoying that "objtool --noinstr" only runs on vmlinux.o.
I realize objtool doesn't have the visilibity to validate cross-object calls,
but couldn't objtool validates calls and static key/branch usage so long as the
target or key/branch is defined in the same object?

