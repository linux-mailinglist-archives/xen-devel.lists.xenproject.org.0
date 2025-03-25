Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F06EA7088D
	for <lists+xen-devel@lfdr.de>; Tue, 25 Mar 2025 18:53:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.926896.1329729 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tx8SJ-0000xZ-N5; Tue, 25 Mar 2025 17:52:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 926896.1329729; Tue, 25 Mar 2025 17:52:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tx8SJ-0000vj-KQ; Tue, 25 Mar 2025 17:52:51 +0000
Received: by outflank-mailman (input) for mailman id 926896;
 Tue, 25 Mar 2025 17:52:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ir1M=WM=redhat.com=vschneid@srs-se1.protection.inumbo.net>)
 id 1tx8SH-0000s6-Tv
 for xen-devel@lists.xenproject.org; Tue, 25 Mar 2025 17:52:49 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f35648eb-09a1-11f0-9ffa-bf95429c2676;
 Tue, 25 Mar 2025 18:52:43 +0100 (CET)
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-437-oeNRTaUNPOieyw7tli1WOg-1; Tue, 25 Mar 2025 13:52:40 -0400
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-43d51bd9b41so39098545e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 25 Mar 2025 10:52:40 -0700 (PDT)
Received: from vschneid-thinkpadt14sgen2i.remote.csb
 (213-44-141-166.abo.bbox.fr. [213.44.141.166])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3997f9b409fsm14543767f8f.50.2025.03.25.10.52.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Mar 2025 10:52:37 -0700 (PDT)
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
X-Inumbo-ID: f35648eb-09a1-11f0-9ffa-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1742925162;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=58+r+FAQ5TTby/P3+2e15XArHywgR9oB31F4zzKw58o=;
	b=WVE8Y7SbIy7GCiarkc8Ix1vyXcs5XNsA8UUv/rSjiziPvEvmvjI43Jbgxc24eMjuPe7yrD
	j++JiY9quB55Ucxyr73Y4h6aS9pbxWC4B53xDyPkKwHuHpFFem3tjHdcTa4kDTXeKiGmqH
	Zfg9mE4bTYYoq6N8rtQ7ZS/ExAkDXIs=
X-MC-Unique: oeNRTaUNPOieyw7tli1WOg-1
X-Mimecast-MFC-AGG-ID: oeNRTaUNPOieyw7tli1WOg_1742925159
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742925159; x=1743529959;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=58+r+FAQ5TTby/P3+2e15XArHywgR9oB31F4zzKw58o=;
        b=v5Y9Jews694lZjefwCQqNcCGm7csshvsFHfZuUV9ZjvmCns4KFMJA1vEHWQqsP3NOH
         Z2tFxCF9pIUhOpriDzDaZ0c2sGDgLzIEHdkgaB151H3FTHwGm+Gbe/VuZqY9m3NU8d2e
         eOxQq7cJimXdIltyHKveB1MGclYe5gH7TbQuzze4gWH7oxUf0U17KJmL19Jcj5oNMdsL
         wq70ksY4HO9xs8DmeznjtJQ5ylKQKoPeysiceoVmuPJZyz6TEmmvm+qYrbP4HFEF9sFv
         k3MItAaRB9ZqcX9nnVjHA2eJ9KSDNa7R2CMG1prKOi6Ne/7ammM4dYPAJlO8HBb1xfF/
         0cEA==
X-Forwarded-Encrypted: i=1; AJvYcCVJTWJsCDoW92B6UKfzv4EZUuHtx/Z8b2BNb3/W/829F2E1QzXA6hnI3IFwvwQG4MHER7k7ahyOovQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YypEZFAIplw0itOUx4OWSUUl7rJygnI3zb2El/V5c8V8D7PB0Ef
	k4g5Jdw6GaS591yoK2ADiKKrzJ08w16yjD90tzJzOCCoiJBBiephH/RI32OAG37xkDJ/QsOV3Sl
	e0Y2RZyMMsE386MwrV9djxCYQYDLVlHbYk7ekKI3WkVcFesQBMinuZyCUt/cUkwT3
X-Gm-Gg: ASbGncur1oShElLdZ5OVinMOmmPJv9apHa4LqVWHYX2435pkzj+Ip5iDggJRVKYmNQ2
	awBIsPjKTjD2xgetJP6/GHo5VDjwgWqYrgx4Pu3zEd30Q9HwAsfhoVxw0P2zSBE+lsbA7H1qVCG
	xK3754ImOJ8w0h5sqkbxCoZvF1Yieu38a29gGOK66jL3joSNN/DcWs5yeK9k3hrlo3XiqzE5CT8
	OGeQMqJnkEj+DgI75eOwUNMxX9YcBwYOzM610oq4q1ui3ui3riNLXWMZUtV+uMrUAH3OPEVAwMB
	7u1hwNQUGuPmc7oTbIs7EXyDqqIVdP+47TTlN5EcdMUu2dT0Ez15iOABVePto1TgTHDvw/laCfW
	v
X-Received: by 2002:a05:600c:4584:b0:43c:fe85:e4ba with SMTP id 5b1f17b1804b1-43d509f4b25mr191666365e9.15.1742925159166;
        Tue, 25 Mar 2025 10:52:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFE+waNkOHjpFuU78xXxVfBVrthL7+/n2itqapsAHnKkAlkbjOyC6OGUhEtlUEcPF/6kvS3dA==
X-Received: by 2002:a05:600c:4584:b0:43c:fe85:e4ba with SMTP id 5b1f17b1804b1-43d509f4b25mr191665765e9.15.1742925158655;
        Tue, 25 Mar 2025 10:52:38 -0700 (PDT)
From: Valentin Schneider <vschneid@redhat.com>
To: Dave Hansen <dave.hansen@intel.com>, Jann Horn <jannh@google.com>
Cc: linux-kernel@vger.kernel.org, x86@kernel.org,
 virtualization@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 loongarch@lists.linux.dev, linux-riscv@lists.infradead.org,
 linux-perf-users@vger.kernel.org, xen-devel@lists.xenproject.org,
 kvm@vger.kernel.org, linux-arch@vger.kernel.org, rcu@vger.kernel.org,
 linux-hardening@vger.kernel.org, linux-mm@kvack.org,
 linux-kselftest@vger.kernel.org, bpf@vger.kernel.org,
 bcm-kernel-feedback-list@broadcom.com, Juergen Gross <jgross@suse.com>,
 Ajay Kaher <ajay.kaher@broadcom.com>, Alexey Makhalov
 <alexey.amakhalov@broadcom.com>, Russell King <linux@armlinux.org.uk>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, Paul
 Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave
 Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>,
 Peter Zijlstra <peterz@infradead.org>, Arnaldo Carvalho de Melo
 <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Mark Rutland
 <mark.rutland@arm.com>, Alexander Shishkin
 <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, Ian
 Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>,
 "Liang, Kan" <kan.liang@linux.intel.com>, Boris Ostrovsky
 <boris.ostrovsky@oracle.com>, Josh Poimboeuf <jpoimboe@kernel.org>, Pawan
 Gupta <pawan.kumar.gupta@linux.intel.com>, Sean Christopherson
 <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, Andy Lutomirski
 <luto@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Frederic Weisbecker
 <frederic@kernel.org>, "Paul E. McKenney" <paulmck@kernel.org>, Jason
 Baron <jbaron@akamai.com>, Steven Rostedt <rostedt@goodmis.org>, Ard
 Biesheuvel <ardb@kernel.org>, Neeraj Upadhyay
 <neeraj.upadhyay@kernel.org>, Joel Fernandes <joel@joelfernandes.org>,
 Josh Triplett <josh@joshtriplett.org>, Boqun Feng <boqun.feng@gmail.com>,
 Uladzislau Rezki <urezki@gmail.com>, Mathieu Desnoyers
 <mathieu.desnoyers@efficios.com>, Lai Jiangshan <jiangshanlai@gmail.com>,
 Zqiang <qiang.zhang1211@gmail.com>, Juri Lelli <juri.lelli@redhat.com>,
 Clark Williams <williams@redhat.com>, Yair Podemsky <ypodemsk@redhat.com>,
 Tomas Glozar <tglozar@redhat.com>, Vincent Guittot
 <vincent.guittot@linaro.org>, Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, Kees Cook
 <kees@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Christoph
 Hellwig <hch@infradead.org>, Shuah Khan <shuah@kernel.org>, Sami Tolvanen
 <samitolvanen@google.com>, Miguel Ojeda <ojeda@kernel.org>, Alice Ryhl
 <aliceryhl@google.com>, "Mike Rapoport (Microsoft)" <rppt@kernel.org>,
 Samuel Holland <samuel.holland@sifive.com>, Rong Xu <xur@google.com>,
 Nicolas Saenz Julienne <nsaenzju@redhat.com>, Geert Uytterhoeven
 <geert@linux-m68k.org>, Yosry Ahmed <yosryahmed@google.com>, "Kirill A.
 Shutemov" <kirill.shutemov@linux.intel.com>, "Masami Hiramatsu (Google)"
 <mhiramat@kernel.org>, Jinghao Jia <jinghao7@illinois.edu>, Luis
 Chamberlain <mcgrof@kernel.org>, Randy Dunlap <rdunlap@infradead.org>,
 Tiezhu Yang <yangtiezhu@loongson.cn>
Subject: Re: [PATCH v4 29/30] x86/mm, mm/vmalloc: Defer
 flush_tlb_kernel_range() targeting NOHZ_FULL CPUs
In-Reply-To: <408ebd8b-4bfb-4c4f-b118-7fe853c6e897@intel.com>
References: <20250114175143.81438-1-vschneid@redhat.com>
 <20250114175143.81438-30-vschneid@redhat.com>
 <CAG48ez1Mh+DOy0ysOo7Qioxh1W7xWQyK9CLGNU9TGOsLXbg=gQ@mail.gmail.com>
 <xhsmh34hhh37q.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
 <CAG48ez3H8OVP1GxBLdmFgusvT1gQhwu2SiXbgi8T9uuCYVK52w@mail.gmail.com>
 <xhsmh5xlhk5p2.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
 <CAG48ez1EAATYcX520Nnw=P8XtUDSr5pe+qGH1YVNk3xN2LE05g@mail.gmail.com>
 <xhsmh34gkk3ls.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
 <352317e3-c7dc-43b4-b4cb-9644489318d0@intel.com>
 <xhsmhjz9mj2qo.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
 <d0450bc8-6585-49ca-9cad-49e65934bd5c@intel.com>
 <xhsmhh64qhssj.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
 <eef09bdc-7546-462b-9ac0-661a44d2ceae@intel.com>
 <xhsmhfrk84k5k.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
 <408ebd8b-4bfb-4c4f-b118-7fe853c6e897@intel.com>
Date: Tue, 25 Mar 2025 18:52:34 +0100
Message-ID: <xhsmhy0wtngkd.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: vwCf7afNQxefrUIOsTOrnMAhZqT_dBd8H8hEecFo6Mo_1742925159
X-Mimecast-Originator: redhat.com
Content-Type: text/plain

On 20/02/25 09:38, Dave Hansen wrote:
> But, honestly, I'm still not sure this is worth all the trouble. If
> folks want to avoid IPIs for TLB flushes, there are hardware features
> that *DO* that. Just get new hardware instead of adding this complicated
> pile of software that we have to maintain forever. In 10 years, we'll
> still have this software *and* 95% of our hardware has the hardware
> feature too.

Sorry, you're going to have to deal with my ignorance a little bit longer...

Were you thinking x86 hardware specifically, or something else?
AIUI things like arm64's TLBIVMALLE1IS can do what is required without any
IPI:

C5.5.78
"""
The invalidation applies to all PEs in the same Inner Shareable shareability domain as the PE that
executes this System instruction.
"""

But for (at least) these architectures:

  alpha
  x86
  loongarch
  mips
  (non-freescale 8xx) powerpc
  riscv
  xtensa

flush_tlb_kernel_range() has a path with a hardcoded use of on_each_cpu(),
so AFAICT for these the IPIs will be sent no matter the hardware.



