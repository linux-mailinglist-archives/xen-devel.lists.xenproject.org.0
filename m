Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 73781A18959
	for <lists+xen-devel@lfdr.de>; Wed, 22 Jan 2025 02:05:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.875748.1286173 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1taPA9-0001Bi-Ve; Wed, 22 Jan 2025 01:04:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 875748.1286173; Wed, 22 Jan 2025 01:04:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1taPA9-00019D-Sp; Wed, 22 Jan 2025 01:04:09 +0000
Received: by outflank-mailman (input) for mailman id 875748;
 Wed, 22 Jan 2025 01:04:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EKZg=UO=flex--seanjc.bounces.google.com=3BUSQZwYKCRIAws51uy66y3w.u64Fw5-vwDw330ABA.Fw57961wuB.69y@srs-se1.protection.inumbo.net>)
 id 1taPA9-000197-5R
 for xen-devel@lists.xenproject.org; Wed, 22 Jan 2025 01:04:09 +0000
Received: from mail-pl1-x64a.google.com (mail-pl1-x64a.google.com
 [2607:f8b0:4864:20::64a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c74849bc-d85c-11ef-a0e5-8be0dac302b0;
 Wed, 22 Jan 2025 02:04:07 +0100 (CET)
Received: by mail-pl1-x64a.google.com with SMTP id
 d9443c01a7336-2166a1a5cc4so114491385ad.3
 for <xen-devel@lists.xenproject.org>; Tue, 21 Jan 2025 17:04:07 -0800 (PST)
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
X-Inumbo-ID: c74849bc-d85c-11ef-a0e5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1737507846; x=1738112646; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HGAInSW7+q0vU97QD0HUaaeZu0zheatXMugXZrnQnto=;
        b=idqj0mT6TOveQhfUQx0HjC1a4MFmemiyh4H+w3QPD1+XnkqBQ2C/ArbVNTT3DEIrWU
         zefDx6opVeDq60DDyDWgNPYGZ1X6rMhLDROM4nhwtejT9R3JjAFvZ2ycDgzEIWCO5Nu6
         r2jKAlOgsvigtBSBx4yKKkf/fCKKNl7hBdxd7vhr0NrjEH9GWIYiZqnaZGHFc8aVclp/
         5Tgp3Iy5/wLOfqpYwtTBeEhBj/q8+ekL3buGuQHAOIDFSeMgSlK8K2C7n+ruaNSClCdj
         odZ5lHC1zo1lqQU11CSohMAQWRDXJvX/vrvWBRlcwAcYkAplDOYvc5h1njJffU1FzRFz
         RcOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737507846; x=1738112646;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=HGAInSW7+q0vU97QD0HUaaeZu0zheatXMugXZrnQnto=;
        b=idq07oh9ULe3taK0bC6R3nnug0LA54VGwTYxwU/3UlXkWgKn1Hh5pyTHjqiRnR318J
         WBiunvpi7Nlutqz36GXNGNA8EM1Ess1OyRe+IMh/Wrh/6nIr+L1++lrNOq3O1L2ptk4Q
         oIB8LrNkNABmYDt2ZOh8vfTAnthl7nWuJwKdBrAzKdzIktLwzlmF2o36oiDXIKRhnpk/
         Z1Jn5TCYLLLK0WyoxsOuTheQYHnXM6AyMRPqWWc6LdTevGe2yKmNXVA7Z9t+tb6dF45G
         sQ3NL4H0JxeIzBYyYtTnSgJYi+Gm/cDakQF//u3xsgaS01QXGMcK+SNjKDBBmvdjpa1T
         G9AQ==
X-Forwarded-Encrypted: i=1; AJvYcCX72pGFMLa1Cq6AIBJhk+ppt/PLzfI1eLFXKOkiENliQp6rJA7FJg0tHYIYOWcm88S+ZbjDYsjF3Lc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzhZhmPHaMqBKVd2gSeRHVbi1D1ZEGCzvLDhD0bM+SFZaF1puVF
	DleEVYaN4Ks5mwpttux5faCtUNVV74vepF8yiX8KLXdFcDHjkfDQ18Rm2pAT28WPQxv8Y6KrGQi
	i1Q==
X-Google-Smtp-Source: AGHT+IH6F+XmsAOl9kzgOVOxBLRRXT62oJJbonrrKhR+qzEndDJ3UWVtcgPMx5PJJKXl4IX7nvimBDDp9aQ=
X-Received: from pfau14.prod.google.com ([2002:a05:6a00:aa8e:b0:72d:b2a2:bed7])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:6088:b0:72a:a9b5:ed91
 with SMTP id d2e1a72fcca58-72daf99ed03mr26365241b3a.13.1737507845610; Tue, 21
 Jan 2025 17:04:05 -0800 (PST)
Date: Tue, 21 Jan 2025 17:04:04 -0800
In-Reply-To: <Z5A6NPqVGoZ32YsN@pavilion.home>
Mime-Version: 1.0
References: <20250114175143.81438-1-vschneid@redhat.com> <20250114175143.81438-23-vschneid@redhat.com>
 <Z5A6NPqVGoZ32YsN@pavilion.home>
Message-ID: <Z5BEBCWVWP_fq2zY@google.com>
Subject: Re: [PATCH v4 22/30] context_tracking: Exit CT_STATE_IDLE upon
 irq/nmi entry
From: Sean Christopherson <seanjc@google.com>
To: Frederic Weisbecker <frederic@kernel.org>
Cc: Valentin Schneider <vschneid@redhat.com>, linux-kernel@vger.kernel.org, x86@kernel.org, 
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
	Kan Liang <kan.liang@linux.intel.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Pawan Gupta <pawan.kumar.gupta@linux.intel.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Andy Lutomirski <luto@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	"Paul E. McKenney" <paulmck@kernel.org>, Jason Baron <jbaron@akamai.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Ard Biesheuvel <ardb@kernel.org>, 
	Neeraj Upadhyay <neeraj.upadhyay@kernel.org>, Joel Fernandes <joel@joelfernandes.org>, 
	Josh Triplett <josh@joshtriplett.org>, Boqun Feng <boqun.feng@gmail.com>, 
	Uladzislau Rezki <urezki@gmail.com>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Lai Jiangshan <jiangshanlai@gmail.com>, Zqiang <qiang.zhang1211@gmail.com>, 
	Juri Lelli <juri.lelli@redhat.com>, Clark Williams <williams@redhat.com>, 
	Yair Podemsky <ypodemsk@redhat.com>, Tomas Glozar <tglozar@redhat.com>, 
	Vincent Guittot <vincent.guittot@linaro.org>, Dietmar Eggemann <dietmar.eggemann@arm.com>, 
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, Kees Cook <kees@kernel.org>, 
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 22, 2025, Frederic Weisbecker wrote:
> Le Tue, Jan 14, 2025 at 06:51:35PM +0100, Valentin Schneider a =C3=A9crit=
 :
> > ct_nmi_{enter, exit}() only touches the RCU watching counter and doesn'=
t
> > modify the actual CT state part context_tracking.state. This means that
> > upon receiving an IRQ when idle, the CT_STATE_IDLE->CT_STATE_KERNEL
> > transition only happens in ct_idle_exit().
> >=20
> > One can note that ct_nmi_enter() can only ever be entered with the CT s=
tate
> > as either CT_STATE_KERNEL or CT_STATE_IDLE, as an IRQ/NMI happenning in=
 the
> > CT_STATE_USER or CT_STATE_GUEST states will be routed down to ct_user_e=
xit().
>=20
> Are you sure? An NMI can fire between guest_state_enter_irqoff() and
> __svm_vcpu_run().

Heh, technically, they can't.  On SVM, KVM clears GIF prior to svm_vcpu_ent=
er_exit(),
and restores GIF=3D1 only after it returns.  I.e. NMIs are fully blocked _o=
n SVM_.

VMX unfortunately doesn't provide GIF, and so NMIs can arrive at any time. =
 It's
infeasible for software to prevent them, so we're stuck with that.  [In the=
ory,
KVM could deliberately generate an NMI and not do IRET so that NMIs are blo=
cked,
but that would be beyond crazy].

> And NMIs interrupting userspace don't call enter_from_user_mode(). In fac=
t
> they don't call irqentry_enter_from_user_mode() like regular IRQs but
> irqentry_nmi_enter() instead. Well that's for archs implementing common e=
ntry
> code, I can't speak for the others.
>=20
> Unifying the behaviour between user and idle such that the IRQs/NMIs exit=
 the
> CT_STATE can be interesting but I fear this may not come for free. You wo=
uld
> need to save the old state on IRQ/NMI entry and restore it on exit.
>=20
> Do we really need it?
>=20
> Thanks.

