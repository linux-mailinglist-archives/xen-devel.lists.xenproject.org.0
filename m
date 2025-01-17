Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A58EFA153DD
	for <lists+xen-devel@lfdr.de>; Fri, 17 Jan 2025 17:12:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.874171.1285000 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tYox2-0006sI-GI; Fri, 17 Jan 2025 16:12:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 874171.1285000; Fri, 17 Jan 2025 16:12:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tYox2-0006pc-Cf; Fri, 17 Jan 2025 16:12:04 +0000
Received: by outflank-mailman (input) for mailman id 874171;
 Fri, 17 Jan 2025 16:11:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=eQyO=UJ=gmail.com=urezki@srs-se1.protection.inumbo.net>)
 id 1tYowe-0006kM-3L
 for xen-devel@lists.xenproject.org; Fri, 17 Jan 2025 16:11:40 +0000
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [2a00:1450:4864:20::230])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id baf77065-d4ed-11ef-99a4-01e77a169b0f;
 Fri, 17 Jan 2025 17:11:38 +0100 (CET)
Received: by mail-lj1-x230.google.com with SMTP id
 38308e7fff4ca-3003d7ca01cso23310981fa.0
 for <xen-devel@lists.xenproject.org>; Fri, 17 Jan 2025 08:11:38 -0800 (PST)
Received: from pc636 (host-217-213-93-172.mobileonline.telia.com.
 [217.213.93.172]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3072a4ed4bcsm4854351fa.71.2025.01.17.08.11.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jan 2025 08:11:36 -0800 (PST)
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
X-Inumbo-ID: baf77065-d4ed-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737130297; x=1737735097; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Mwf/8xvajfVfuiw0AKepwMJBFKP0lwWuKM/onBPK6d8=;
        b=O1yQKD2+UYVjPQ2lKONAEbVFOKhcWo/CsSCSwsSiAgF5jzViZPoje6R6aXra2QLwSD
         DpQq67KJqXsQFttBnxgVAlpO8eqd95oMV8CrZ9deHOcOIeggc3z3sbfIlIYUGEyC7XaJ
         XbJGRpta+ZUP8U4BzwL8xUSiyynGfYWwHE/LUOfGm6CB3Sf0zvewhmiyi3aEL2pzrCEU
         smAQ4JGhpUSvDUp0T1GgEhzTXUulH1fP5pkbvwF/59HRB4zLqrFFYX1IaPmXzkg5oxWD
         K7cytEli4rIAOyLCHeMxRLznZBXRjzbbmQh4kT886OAwFsTz963iDLoIXLqCdYJXkQQL
         n5MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737130297; x=1737735097;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Mwf/8xvajfVfuiw0AKepwMJBFKP0lwWuKM/onBPK6d8=;
        b=AH7z2xe5O6pw9Pp+R54TH8vLus4nY2+/D4hj4eBI7Rar20hzocx39uJwOCy2OEA8Hq
         18p2XCghBlBo+RiAw3n4xDyhRMqIMb1izdhhuSV9MBhaA/PI0pDlgBzIWaucUrDFYdYF
         e91fvr+kkyR9fzGHMwSRfc9MHvAXpLUf1laomm+iQDSLDWoKiX0Fi0EAI1uZ/JguqURT
         w1cvtvRUo4C+yeHNV7bY79CuURpBR0zu+6xTevppkx5inirjjloH6MGfa9dIqVE9xU0q
         XyBQSkaKVFxetPF7dwgNoxVKxetJEY15k9ywx2rMvCC06H98OJWd8QQhPIkY5qt0KbRc
         guhw==
X-Forwarded-Encrypted: i=1; AJvYcCURGfiJrbltvkbJFqZu1JRKhQw4Y9KKh1AoUDbChbtsSh9kUpqgTO4UeVV+ZdRb/asWI0izqEbcwmc=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz6TCUKl4e2gI3Zvdaz6hHIWbTJqO0nJTz26LuM1AtBavAq8bz9
	ari6AfWKgkaFj/sHIpcN4gs0982BZ+j6hzivgiuzjlK9ize8+mn4
X-Gm-Gg: ASbGnct1dXArnQfz9vVGfiO4m0HRUpxfriQ9JZ2k5fQIeeJJNb0ttkcwv0EQWajog/+
	fKvVHY93Ma4C0hgaZyyuivf+VgdnVYgt+xXuhKeG/cxCtDPSnNrQTy7qGw1kEOobjfnt7aVTdzL
	KJFvLeX7H0KhrX8CNJPM2Er7arm9DrSAfKjtKJZuoSuN32DfatK1o+8a5k07MlNUUTs16NPbMl+
	egwbpgoJoxSfam8EGYlLHWsv+EL7RAfdkK1zuHeYvQmd4IlKWBVbZixDl8Uo1gRMwjiNjDQR1r5
	pmQEzHx1h6k=
X-Google-Smtp-Source: AGHT+IFH9kfhzB42dITXdZg9xXnIuIrCtLCGkWK8kDwmfncKlFAzifmDHoUZVUHtKkW5iC7Zz8oHDA==
X-Received: by 2002:a2e:bc27:0:b0:302:40ec:a1b3 with SMTP id 38308e7fff4ca-3072caa166amr12690871fa.21.1737130297134;
        Fri, 17 Jan 2025 08:11:37 -0800 (PST)
From: Uladzislau Rezki <urezki@gmail.com>
X-Google-Original-From: Uladzislau Rezki <urezki@pc636>
Date: Fri, 17 Jan 2025 17:11:30 +0100
To: Valentin Schneider <vschneid@redhat.com>
Cc: Jann Horn <jannh@google.com>, linux-kernel@vger.kernel.org,
	x86@kernel.org, virtualization@lists.linux.dev,
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
	Uladzislau Rezki <urezki@gmail.com>,
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
Message-ID: <Z4qBMqcMg16p57av@pc636>
References: <20250114175143.81438-1-vschneid@redhat.com>
 <20250114175143.81438-30-vschneid@redhat.com>
 <CAG48ez1Mh+DOy0ysOo7Qioxh1W7xWQyK9CLGNU9TGOsLXbg=gQ@mail.gmail.com>
 <xhsmh34hhh37q.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <xhsmh34hhh37q.mognet@vschneid-thinkpadt14sgen2i.remote.csb>

On Fri, Jan 17, 2025 at 04:25:45PM +0100, Valentin Schneider wrote:
> On 14/01/25 19:16, Jann Horn wrote:
> > On Tue, Jan 14, 2025 at 6:51 PM Valentin Schneider <vschneid@redhat.com> wrote:
> >> vunmap()'s issued from housekeeping CPUs are a relatively common source of
> >> interference for isolated NOHZ_FULL CPUs, as they are hit by the
> >> flush_tlb_kernel_range() IPIs.
> >>
> >> Given that CPUs executing in userspace do not access data in the vmalloc
> >> range, these IPIs could be deferred until their next kernel entry.
> >>
> >> Deferral vs early entry danger zone
> >> ===================================
> >>
> >> This requires a guarantee that nothing in the vmalloc range can be vunmap'd
> >> and then accessed in early entry code.
> >
> > In other words, it needs a guarantee that no vmalloc allocations that
> > have been created in the vmalloc region while the CPU was idle can
> > then be accessed during early entry, right?
> 
> I'm not sure if that would be a problem (not an mm expert, please do
> correct me) - looking at vmap_pages_range(), flush_cache_vmap() isn't
> deferred anyway.
> 
> So after vmapping something, I wouldn't expect isolated CPUs to have
> invalid TLB entries for the newly vmapped page.
> 
> However, upon vunmap'ing something, the TLB flush is deferred, and thus
> stale TLB entries can and will remain on isolated CPUs, up until they
> execute the deferred flush themselves (IOW for the entire duration of the
> "danger zone").
> 
> Does that make sense?
> 
Probably i am missing something and need to have a look at your patches,
but how do you guarantee that no-one map same are that you defer for TLB
flushing?

As noted by Jann, we already defer a TLB flushing by backing freed areas
until certain threshold and just after we cross it we do a flush.

--
Uladzislau Rezki

