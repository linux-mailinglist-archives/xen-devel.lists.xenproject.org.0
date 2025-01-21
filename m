Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E833A1826D
	for <lists+xen-devel@lfdr.de>; Tue, 21 Jan 2025 18:00:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.875631.1286077 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1taHbt-0005lI-Tq; Tue, 21 Jan 2025 17:00:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 875631.1286077; Tue, 21 Jan 2025 17:00:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1taHbt-0005ij-QY; Tue, 21 Jan 2025 17:00:17 +0000
Received: by outflank-mailman (input) for mailman id 875631;
 Tue, 21 Jan 2025 17:00:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wvur=UN=gmail.com=urezki@srs-se1.protection.inumbo.net>)
 id 1taHbr-0005id-Q0
 for xen-devel@lists.xenproject.org; Tue, 21 Jan 2025 17:00:15 +0000
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [2a00:1450:4864:20::12f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2f2b1153-d819-11ef-a0e4-8be0dac302b0;
 Tue, 21 Jan 2025 18:00:14 +0100 (CET)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-53f22fd6832so6170908e87.1
 for <xen-devel@lists.xenproject.org>; Tue, 21 Jan 2025 09:00:14 -0800 (PST)
Received: from pc636 (host-217-213-93-172.mobileonline.telia.com.
 [217.213.93.172]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5439af76fe9sm1916768e87.212.2025.01.21.09.00.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jan 2025 09:00:12 -0800 (PST)
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
X-Inumbo-ID: 2f2b1153-d819-11ef-a0e4-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737478814; x=1738083614; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6O7kZyVX02YaNVvlK+AnjIGslDTljYFtI1mm3L3G+es=;
        b=MZtQqUN6VI8Z+xYY9kFNJjnjLk3DnCLkjEYBzKlS28hkExIopJp9Dz7mCw1XMYUL3H
         liXrGfPTg0iEcC6go396nNdpyGXcaweKjo5HxfCq0hsp9hymStUW7EIIHEYteekHzdBe
         SV60ILQ/YCuT6rf45KyYm+XGRwwpkkNHVUMq94J76Nwi4TgsaBZ+qo6/Gpbc3fNV35+D
         KKDN/VG7sOhtzjvqsy+552qkRhpejILhZhX2xe5+WavH2+MzQzBXQJ95DgL8UW0ahxjr
         siKj+N0FCCrvYVD4vWmrPp9imWqDvNRNsaq/u2WpYRlIxvtofciY6ZlN/0EHMSK16bsC
         axtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737478814; x=1738083614;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6O7kZyVX02YaNVvlK+AnjIGslDTljYFtI1mm3L3G+es=;
        b=HlNwhenZ7C/zgjWoWXYgWElpSlYU4rTjG4La4/D9bOXf1YlWN5JskJlbR9eG6K8hYn
         tMJWJl3Xy5nG0B32yY3QSNFV5M72y8SP+rqafnVlidngrxcllohvOC2LJy9Z3rKQccVr
         1/ASP0HEMC+XvGp8lYwh/KVRF0fNDduKI4b3keBx5LJqcmO06w5i1SmWZ550FXimPXUe
         pEeb3qt1udPw0fT+BJlMafYib/yROJjPtJSFROSt7nwENxFmSM+qpFLcTY8VnZuiDpJu
         WL3Hmwfbwyvv4L1mZsTnD6STEBvljpaOuqjZenXE2w2GKqSk/rp/TQpn2B2UsUGz66/C
         sglw==
X-Forwarded-Encrypted: i=1; AJvYcCXe2Yg88AEi0BMPtie0ef9QpWa6A/qGWe9yJ4hizZHQI7lCqVHFwEbLnBiWuCeCcO+STGawevjkJSA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzW7dAdcbg+Gax+oI4MBNhqHnvWE2vilfWSosVFdcH0QZaHCkZ0
	vBXnVBH7Cd6fJZfiyYePgv47s6wY41Es1W0GO5+xO2DFF6eOAbHF
X-Gm-Gg: ASbGnctArsRnWjYmB8lCpSqv6JWRLsU3F+59NEOP8xwE4/e3XZCHrTTmzoY8Zp3chE0
	PhZowO0DN6EFiJ5l+LcdcJ7iFjDv3Z78HW2weuSK+B8tLPksC5KutRtM84O/KvkLwpt7Yj9FTF0
	/zVA//AEMMZxtPezOko7NsJ6uXD7x5afyIxgMEHOX2cfDzarRnoim/fd2dQqOHUNRn9zkNlIl5B
	UXUBV/mGHPCGrZbrH/sW3v6+06SwAqYupLvrDBUnTHdBL/jkW3aGQ24CsCWmtcdxYFyJFwX3QVg
	kninqJiph2dfR3fplSAeNM7u
X-Google-Smtp-Source: AGHT+IGYPF71D1RmaKnbW82c+U5IMmpDPZJTk/HJCRRaq5z7S90tH0rTVzhA6Sl8Kwc0O/33Vf8jgg==
X-Received: by 2002:a05:6512:104b:b0:543:9b0f:7d39 with SMTP id 2adb3069b0e04-5439c282920mr7151519e87.32.1737478813837;
        Tue, 21 Jan 2025 09:00:13 -0800 (PST)
From: Uladzislau Rezki <urezki@gmail.com>
X-Google-Original-From: Uladzislau Rezki <urezki@pc636>
Date: Tue, 21 Jan 2025 18:00:07 +0100
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
Message-ID: <Z4_Sl-zu7GprkbaL@pc636>
References: <20250114175143.81438-1-vschneid@redhat.com>
 <20250114175143.81438-30-vschneid@redhat.com>
 <CAG48ez1Mh+DOy0ysOo7Qioxh1W7xWQyK9CLGNU9TGOsLXbg=gQ@mail.gmail.com>
 <xhsmh34hhh37q.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
 <Z4qBMqcMg16p57av@pc636>
 <xhsmhwmetfk9d.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
 <Z44wSJTXknQVKWb0@pc636>
 <xhsmhr04xfow1.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <xhsmhr04xfow1.mognet@vschneid-thinkpadt14sgen2i.remote.csb>

> >
> > As noted before, we defer flushing for vmalloc. We have a lazy-threshold
> > which can be exposed(if you need it) over sysfs for tuning. So, we can add it.
> >
> 
> In a CPU isolation / NOHZ_FULL context, isolated CPUs will be running a
> single userspace application that will never enter the kernel, unless
> forced to by some interference (e.g. IPI sent from a housekeeping CPU).
> 
> Increasing the lazy threshold would unfortunately only delay the
> interference - housekeeping CPUs are free to run whatever, and so they will
> eventually cause the lazy threshold to be hit and IPI all the CPUs,
> including the isolated/NOHZ_FULL ones.
> 
Do you have any testing results for your workload? I mean how much
potentially we can allocate. Again, maybe it is just enough to back
and once per-hour offload it.

Apart of that how critical IPIing CPUs affect your workloads?

> I was thinking maybe we could subdivide the vmap space into two regions
> with their own thresholds, but a task may allocate/vmap stuff while on a HK
> CPU and be moved to an isolated CPU afterwards, and also I still don't have
> any strong guarantee about what accesses an isolated CPU can do in its
> early entry code :(
> 
I agree this is not worth to play with a vmap space in terms of splitting it.

Sorry for later answer and thank you!

--
Uladzislau Rezki

