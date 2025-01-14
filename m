Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3456EA112FF
	for <lists+xen-devel@lfdr.de>; Tue, 14 Jan 2025 22:24:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.872073.1283033 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tXoOg-0006EL-Qh; Tue, 14 Jan 2025 21:24:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 872073.1283033; Tue, 14 Jan 2025 21:24:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tXoOg-0006BI-Nq; Tue, 14 Jan 2025 21:24:26 +0000
Received: by outflank-mailman (input) for mailman id 872073;
 Tue, 14 Jan 2025 21:24:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OOos=UG=flex--seanjc.bounces.google.com=3BtaGZwYKCRE9vr40tx55x2v.t53Ev4-uvCv22z9A9.Ev46850vtA.58x@srs-se1.protection.inumbo.net>)
 id 1tXoOf-00069s-Av
 for xen-devel@lists.xenproject.org; Tue, 14 Jan 2025 21:24:25 +0000
Received: from mail-pj1-x104a.google.com (mail-pj1-x104a.google.com
 [2607:f8b0:4864:20::104a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id eca66abf-d2bd-11ef-a0e1-8be0dac302b0;
 Tue, 14 Jan 2025 22:24:24 +0100 (CET)
Received: by mail-pj1-x104a.google.com with SMTP id
 98e67ed59e1d1-2ef728e36d5so10811988a91.3
 for <xen-devel@lists.xenproject.org>; Tue, 14 Jan 2025 13:24:24 -0800 (PST)
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
X-Inumbo-ID: eca66abf-d2bd-11ef-a0e1-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736889862; x=1737494662; darn=lists.xenproject.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=8cSsXdzV+ZwQOEMikMUZ9KmnzJy+D1+up+g+W/Xr/ho=;
        b=H9a96cYICFO7kEmOsxa5Xzs9FtwiJHiV019pxSVh5nilsv/vGtaMSXk49e/D8NHbQz
         bCq/VeLAq1vsf7FL0TXwaAlOdLVjgSwUgnJBxMrDs4ZfZbYRvwmgajlRmoJKbqu5ngee
         bWmaIYwO30Ll3Dd5ndHZ0jQjnJyV3MReyy805BSn4Dg2IA1Np/ZyEB2wYrw82vmVC/rV
         +fCLIINprd4JBl6g8ZPBYb02VtSP9YgizfqRyFx/rnQCHdt1bJNdEgbGVUfptspxogdy
         V3fScghZyGIVqAyp/7duRdQqK2hN+vcsK/zmYd0zC8kM9/4pdpIqDZSNPSgfJyeWCiAf
         mMxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736889862; x=1737494662;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8cSsXdzV+ZwQOEMikMUZ9KmnzJy+D1+up+g+W/Xr/ho=;
        b=F4M+/Gkm1tb8uD2adTs4+rI5plzRQB1lSUaOlbDt3LoVITykuz9CFQLe9hcZkXXZD3
         4ThKkXWWlP+m19ezFuwsl8A9/5/LDbOoKwGOzYa73Uy0Hkg40lqbXEtZce7AiF6cQvvb
         mqJRnvRACQxvi7M8eGWK4RN1g75DAx06onHYGdUr6RXkvRLA4InPbGHp2lZylOjasJm6
         sRr/Xe8FW0at/OmgqUe368J/8fMptcKNbmOVlyx4fT0BGW9yxsIMmvk/oJiYCWIG+ypc
         rpKXKTgA9MaBXBl6eCjXdKTlecn4fg8g/76EJuiWxkj4NaOBTuhEY9KPbxeoVQwnRYz9
         JNYQ==
X-Forwarded-Encrypted: i=1; AJvYcCWGoZPQZTmbsB8/dYtcSIz1OnsVfDcE0/4eHa6qu7O1OUyuOElW5dA6QTs0zs8VocQsG41uaZNn498=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz38+Q6fT+Cn9Xr+VPtJzNDnBb/LfTsWSv89U3eIdvzb9ueRDQ2
	9IE935Pt+nE6zgmmlrUZEApAjjBcNW81CFmVV1ZZS8IoDWQLlxIjEicYiyYQA9a9QStn7GEt0Au
	VjQ==
X-Google-Smtp-Source: AGHT+IGaqEwoic7xvDyznY8cDg+F7K5+qe11MRhfXOt+1PBXtCG3HV5nSK8yv8Q3/q/HTXMyOsqLmKxvwkg=
X-Received: from pjbtc8.prod.google.com ([2002:a17:90b:5408:b0:2ef:abba:8bfd])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:2b87:b0:2ee:8031:cdbc
 with SMTP id 98e67ed59e1d1-2f548f1ec3fmr32208440a91.23.1736889862547; Tue, 14
 Jan 2025 13:24:22 -0800 (PST)
Date: Tue, 14 Jan 2025 13:24:21 -0800
In-Reply-To: <20250114175143.81438-28-vschneid@redhat.com>
Mime-Version: 1.0
References: <20250114175143.81438-1-vschneid@redhat.com> <20250114175143.81438-28-vschneid@redhat.com>
Message-ID: <Z4bWBUGUH34qLUt0@google.com>
Subject: Re: [PATCH v4 27/30] x86/tlb: Make __flush_tlb_local() noinstr-compliant
From: Sean Christopherson <seanjc@google.com>
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
	Nicolas Saenz Julienne <nsaenzju@redhat.com>, Geert Uytterhoeven <geert@linux-m68k.org>, 
	Yosry Ahmed <yosryahmed@google.com>, 
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, 
	"Masami Hiramatsu (Google)" <mhiramat@kernel.org>, Jinghao Jia <jinghao7@illinois.edu>, 
	Luis Chamberlain <mcgrof@kernel.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Tiezhu Yang <yangtiezhu@loongson.cn>
Content-Type: text/plain; charset="us-ascii"

On Tue, Jan 14, 2025, Valentin Schneider wrote:
> Later patches will require issuing a __flush_tlb_all() from noinstr code.
> This requires making both __flush_tlb_local() and __flush_tlb_global()
> noinstr-compliant.
> 
> For __flush_tlb_local(), xen_flush_tlb() has already been made noinstr, so
> it's just native_flush_tlb_global(), and simply __always_inline'ing
> invalidate_user_asid() gets us there
> 
> Signed-off-by: Valentin Schneider <vschneid@redhat.com>
> ---

...

> @@ -1206,7 +1206,7 @@ STATIC_NOPV noinstr void native_flush_tlb_global(void)
>  /*
>   * Flush the entire current user mapping
>   */
> -STATIC_NOPV void native_flush_tlb_local(void)
> +STATIC_NOPV noinstr void native_flush_tlb_local(void)

native_write_cr3() and __native_read_cr3() need to be __always_inline.

vmlinux.o: warning: objtool: native_flush_tlb_local+0x8: call to __native_read_cr3() leaves .noinstr.text section

