Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 85954A1D49F
	for <lists+xen-devel@lfdr.de>; Mon, 27 Jan 2025 11:37:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.877614.1287748 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tcMUJ-0007E1-FV; Mon, 27 Jan 2025 10:37:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 877614.1287748; Mon, 27 Jan 2025 10:37:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tcMUJ-0007BZ-Ck; Mon, 27 Jan 2025 10:37:03 +0000
Received: by outflank-mailman (input) for mailman id 877614;
 Mon, 27 Jan 2025 10:37:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+2+I=UT=gmail.com=urezki@srs-se1.protection.inumbo.net>)
 id 1tcMUH-0007BR-HO
 for xen-devel@lists.xenproject.org; Mon, 27 Jan 2025 10:37:01 +0000
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [2a00:1450:4864:20::12b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a3de5d4e-dc9a-11ef-a0e6-8be0dac302b0;
 Mon, 27 Jan 2025 11:37:00 +0100 (CET)
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-540254357c8so4246814e87.1
 for <xen-devel@lists.xenproject.org>; Mon, 27 Jan 2025 02:37:00 -0800 (PST)
Received: from pc636 (host-217-213-93-172.mobileonline.telia.com.
 [217.213.93.172]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3076bc1956csm14103761fa.70.2025.01.27.02.36.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jan 2025 02:36:58 -0800 (PST)
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
X-Inumbo-ID: a3de5d4e-dc9a-11ef-a0e6-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737974220; x=1738579020; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=W4QFE15tzxGQeI7M/zW2nqDheIV1bS+m/FQTTUzpTLk=;
        b=mmAx4/qU2DG7RMX4vlPQN3+syBI0+RvKOyi4eCG27+MeArETVReUD9GX+dX/8PqmJ5
         g5d8UOcSLtBJnN5qJlUHKzTS30Zsqq5X3QMcgtOR9yhZEs+zKwjRvUxk6DP/42/uI8Q7
         5Aiq8FSZAS6UHSwoZPHLYXAE49jDFJ1Y0f6Ax7UfU76yUQms+DYYfpy3TPCCD3yNogTK
         eUxEHsOUjRMbOQaKu8X/8llowfOuft4w4GAstIuKSupVKzg3yCHmTwVmPONtHo8sI8Pv
         OrveDhOMvkD8+jfnEu11ULDHH1KKyAybqrwHsXbTD+LwL5nceJ6BfZhD2vkSITHnUmon
         a6VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737974220; x=1738579020;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W4QFE15tzxGQeI7M/zW2nqDheIV1bS+m/FQTTUzpTLk=;
        b=bcssXExDqagpgqgHzGfuKibTKdtpmiqphTnfVMQZCpU4+vbJZeA3KsdQsxkjI9gbfG
         f0Rpm//HRpPEnDS3wyQVO6GfE/BXfsNmBWU7Tk5mXSKrcXuFkbpvOuooS3LUtYTk0RcZ
         mTWIEAWbRndZu+MDgxQxwvPJpTFizZ0J5bRpHynC9vmJf2minAbrK4EZ/ODgBv5iFcYl
         rM35ARX99HFek6scsZiP7wA9/sPBeMnI+R2Ny+N8WhxB7ZGxODa/7v+NBqHud/AmFpcz
         w7Cj1kxzN0SLVSbWo8B/yv0V4ymFHWNXopT5lfKBLUbl6K02HTs+ku6u95HQj8bHeHSr
         A+zw==
X-Forwarded-Encrypted: i=1; AJvYcCXs7viVN/s9paObFX9ylzMtgnLkSNrsmoeKMio5HK7CzKHX2v5reKZdxmytDwapCGW1XMmiO0KPyr8=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yzq+7mOE1vwxcKkhaZqBUdHdF9YcMC9x4Y/oXnobsghbGav2Qw6
	DhScEKadMq5HDWBdzXwPb90blKZD6HFcQoXQ1JNskGzJ1q2uO1XP
X-Gm-Gg: ASbGncsPpU2doH5PPtcqJJ8XA/m+6/WOgI0qotCvkrOYc7uvzATJles+5fulllw6BaD
	XTiqtu6tYm1wLCnnnHjnow40n4v8YDLYYQibK7mg2LnRNXEpdX9TvDFZjHg6V+kbvAUSTJG+fDr
	CB7YKD0+9QERVVXfUIIvcr1Yt6m0JcBexVl4uRd8iQAlC1LH5DTxhvVnrc+0W5NF/ZlmlXvP49+
	7E0mGmHXKVBCUgz8dwZO5M+M+oi3vKYO9HMe+RiHIrPeczjstxHA9gPlXPpFD+HBOn5TeXP9im/
	/skaU9nCOFOqSBk6zpt0ozoSV2tuly4RNGs=
X-Google-Smtp-Source: AGHT+IEcn2mDT5d0SWT5jg0poO+BtsvQPwWj5ydN+QiFTcCpstqFwzzlc4zIAZ/gMSqSpGuiyMrqQQ==
X-Received: by 2002:a19:8c1d:0:b0:543:baa9:a48a with SMTP id 2adb3069b0e04-543baa9a4bcmr6967602e87.27.1737974219462;
        Mon, 27 Jan 2025 02:36:59 -0800 (PST)
From: Uladzislau Rezki <urezki@gmail.com>
X-Google-Original-From: Uladzislau Rezki <urezki@pc636>
Date: Mon, 27 Jan 2025 11:36:51 +0100
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
Message-ID: <Z5dhw0Ml4KGEfaUv@pc636>
References: <20250114175143.81438-1-vschneid@redhat.com>
 <20250114175143.81438-30-vschneid@redhat.com>
 <CAG48ez1Mh+DOy0ysOo7Qioxh1W7xWQyK9CLGNU9TGOsLXbg=gQ@mail.gmail.com>
 <xhsmh34hhh37q.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
 <Z4qBMqcMg16p57av@pc636>
 <xhsmhwmetfk9d.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
 <Z44wSJTXknQVKWb0@pc636>
 <xhsmhr04xfow1.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
 <Z4_Sl-zu7GprkbaL@pc636>
 <xhsmh8qr0p784.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <xhsmh8qr0p784.mognet@vschneid-thinkpadt14sgen2i.remote.csb>

On Fri, Jan 24, 2025 at 04:22:19PM +0100, Valentin Schneider wrote:
> On 21/01/25 18:00, Uladzislau Rezki wrote:
> >> >
> >> > As noted before, we defer flushing for vmalloc. We have a lazy-threshold
> >> > which can be exposed(if you need it) over sysfs for tuning. So, we can add it.
> >> >
> >>
> >> In a CPU isolation / NOHZ_FULL context, isolated CPUs will be running a
> >> single userspace application that will never enter the kernel, unless
> >> forced to by some interference (e.g. IPI sent from a housekeeping CPU).
> >>
> >> Increasing the lazy threshold would unfortunately only delay the
> >> interference - housekeeping CPUs are free to run whatever, and so they will
> >> eventually cause the lazy threshold to be hit and IPI all the CPUs,
> >> including the isolated/NOHZ_FULL ones.
> >>
> > Do you have any testing results for your workload? I mean how much
> > potentially we can allocate. Again, maybe it is just enough to back
> > and once per-hour offload it.
> >
> 
> Potentially as much as you want... In our Openshift environments, you can
> get any sort of container executing on the housekeeping CPUs and they're
> free to do pretty much whatever they want. Per CPU isolation they're not
> allowed/meant to disturb isolated CPUs, however.
> 
> > Apart of that how critical IPIing CPUs affect your workloads?
> >
> 
> If I'm being pedantic, a single IPI to an isolated CPU breaks the
> isolation. If we can't quiesce IPIs to isolated CPUs, then we can't
> guarantee that whatever is running on the isolated CPUs is actually
> isolated / shielded from third party interference.
> 
I see. I thought you are fixing some issue. I do not see a straight
forward way how to remove such "distortion". Probably we can block the
range which we defer for flushing. But it also can be problematic
because of other constraints.

Thanks!

--
Uladzislau Rezki

