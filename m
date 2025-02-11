Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EADCA310C3
	for <lists+xen-devel@lfdr.de>; Tue, 11 Feb 2025 17:10:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.885738.1295547 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1thsqU-0003oK-Dx; Tue, 11 Feb 2025 16:10:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 885738.1295547; Tue, 11 Feb 2025 16:10:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1thsqU-0003lh-AF; Tue, 11 Feb 2025 16:10:46 +0000
Received: by outflank-mailman (input) for mailman id 885738;
 Tue, 11 Feb 2025 16:10:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tUK+=VC=redhat.com=vschneid@srs-se1.protection.inumbo.net>)
 id 1thsqT-0003hT-NL
 for xen-devel@lists.xenproject.org; Tue, 11 Feb 2025 16:10:45 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bee4818d-e892-11ef-a075-877d107080fb;
 Tue, 11 Feb 2025 17:10:44 +0100 (CET)
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-96-3PXp853FM2uvToPWYr0png-1; Tue, 11 Feb 2025 11:10:42 -0500
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-4393ed818ccso19010885e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 11 Feb 2025 08:10:41 -0800 (PST)
Received: from vschneid-thinkpadt14sgen2i.remote.csb
 (213-44-141-166.abo.bbox.fr. [213.44.141.166])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38dc9ef8ac6sm12561610f8f.27.2025.02.11.08.10.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Feb 2025 08:10:39 -0800 (PST)
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
X-Inumbo-ID: bee4818d-e892-11ef-a075-877d107080fb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1739290243;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DkXKKRZIZ3B6nMXAUQwqba2hAbiJWDhaRaBNOU6/fJw=;
	b=i1HUBeytVZQfuTjrexbgjP7YEuXhfQTbb6pRe91MQPsrHrNvdDzSOfyC/EERd6n8ZWPDjF
	+lZ5tsIl54r4itAaxVJ7JLggTgV7punI/95D8cHSFkAUzbdWyJUgYCJxsfKBbdpQAXbDp7
	n1YwDMda2zzuC6MFCw8XkhNYDMwIpOc=
X-MC-Unique: 3PXp853FM2uvToPWYr0png-1
X-Mimecast-MFC-AGG-ID: 3PXp853FM2uvToPWYr0png
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739290241; x=1739895041;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DkXKKRZIZ3B6nMXAUQwqba2hAbiJWDhaRaBNOU6/fJw=;
        b=TFjsJEXC2mW1rfvP2FVLGn8S9nevDcS502nDnJtYhKn3VPeFdR1gZGcNPbZMrIt//f
         LzGU7oNDJ+z5k3XI83Bb0iM5LPClPhc5+RzRYp44qhW5pBzjZzCc2VpzyHJN3ZOUsigK
         OrOWV37uOojM3DsSJKPl7KfrvxCkJSXoPqSY+e0Vh2dCZevDAiWUNK/FYAoBWqbl7GBD
         0UkSbRtMO7+iamuUvrqiia1DoYqxsKOIgcbmDN8XUu6jKgQU9Q7ROW6aNlkBnqoZ27O9
         Z8t3U1wWeaKKyiFZuVK/Z8yg/bLzaN8+INiF4GDBTkMQ4imVod8JPxzopLticI1NSvjE
         CqZA==
X-Forwarded-Encrypted: i=1; AJvYcCVOrm9WEnCt9WGC3ZHwUeRFTg24EnCgQA/QZIx82o+RWio4Ep1+EFFKY5teQrWXP2HwmG0++2/FVe0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxNsofcmXJPfoWHcP+qyGJlj6gyza7tovKjfDP14Hr1ebl857RM
	ed96ocNc/y1nD1yvRS67HYMSog+/+ECAGH7DxFT4+bWIz16p1lP9c9HJv/iI7kkEQUPbm1m9XHg
	jzKrtQVETuVZidvU0WnP9Ki8zwNpR/b36HWuSjEie4YK4DypDQAU+yxC5FP/FKcvU
X-Gm-Gg: ASbGncv3riZTvZMI69nUBCnKjXhpBKN0/88RMoQG5dxVCG7k73GOIFCNTgiWAJqwpt7
	4iqvvvyps8/K3ctb+U7lyI3FviKdHQQFWZAN6iznKZJH1y55fRwXZU22fDqZGv8UpKkUPrXUiV5
	5rJ78VJxpfWcfwrmKh5mAQx+V/duk5fhcS28NJ198PVqixiNAb8zxKQXS2RmW31SHL9r3T7cMbW
	IpJKkPT00eiW/OqxzWO2yNdssO5OeSkCcfoTJkZEnCVaq8aMcHs7w9ZeHKLHGb2RaTjJK7b4tO/
	RtcZL0trcAk3AGmUeZQlr134J7T2LsT9Tb1FdlHY//FjmRwu/SLCbqh03pcUlreazw==
X-Received: by 2002:a05:600c:500b:b0:439:48d9:d8b0 with SMTP id 5b1f17b1804b1-43948d9dd41mr73108605e9.16.1739290240851;
        Tue, 11 Feb 2025 08:10:40 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGxNXfn5PLr2I3O9shVB9BLvMIo6l6XNn4GHuv5+NRtXPlNDWEKqGeQnOp/tv15slnT46loqA==
X-Received: by 2002:a05:600c:500b:b0:439:48d9:d8b0 with SMTP id 5b1f17b1804b1-43948d9dd41mr73107295e9.16.1739290240325;
        Tue, 11 Feb 2025 08:10:40 -0800 (PST)
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
In-Reply-To: <352317e3-c7dc-43b4-b4cb-9644489318d0@intel.com>
References: <20250114175143.81438-1-vschneid@redhat.com>
 <20250114175143.81438-30-vschneid@redhat.com>
 <CAG48ez1Mh+DOy0ysOo7Qioxh1W7xWQyK9CLGNU9TGOsLXbg=gQ@mail.gmail.com>
 <xhsmh34hhh37q.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
 <CAG48ez3H8OVP1GxBLdmFgusvT1gQhwu2SiXbgi8T9uuCYVK52w@mail.gmail.com>
 <xhsmh5xlhk5p2.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
 <CAG48ez1EAATYcX520Nnw=P8XtUDSr5pe+qGH1YVNk3xN2LE05g@mail.gmail.com>
 <xhsmh34gkk3ls.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
 <352317e3-c7dc-43b4-b4cb-9644489318d0@intel.com>
Date: Tue, 11 Feb 2025 17:10:36 +0100
Message-ID: <xhsmhv7tgihs3.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: uZdS4-W5AdLMVCZfmpznoUW1HwL_zvSncLAfZveAXwc_1739290241
X-Mimecast-Originator: redhat.com
Content-Type: text/plain

On 11/02/25 06:22, Dave Hansen wrote:
> On 2/11/25 05:33, Valentin Schneider wrote:
>>> 2. It's wrong to assume that TLB entries are only populated for
>>> addresses you access - thanks to speculative execution, you have to
>>> assume that the CPU might be populating random TLB entries all over
>>> the place.
>> Gotta love speculation. Now it is supposed to be limited to genuinely
>> accessible data & code, right? Say theoretically we have a full TLBi as
>> literally the last thing before doing the return-to-userspace, speculation
>> should be limited to executing maybe bits of the return-from-userspace
>> code?
>
> In practice, it's mostly limited like that.
>
> Architecturally, there are no promises from the CPU. It is within its
> rights to cache anything from the page tables at any time. If it's in
> the CR3 tree, it's fair game.
>
>> Furthermore, I would hope that once a CPU is executing in userspace, it's
>> not going to populate the TLB with kernel address translations - AIUI the
>> whole vulnerability mitigation debacle was about preventing this sort of
>> thing.
>
> Nope, unfortunately. There's two big exception to this. First, "implicit
> supervisor-mode accesses". There are structures for which the CPU gets a
> virtual address and accesses it even while userspace is running. The LDT
> and GDT are the most obvious examples, but there are some less
> ubiquitous ones like the buffers for PEBS events.
>
> Second, remember that user versus supervisor is determined *BY* the page
> tables. Before Linear Address Space Separation (LASS), all virtual
> memory accesses walk the page tables, even userspace accesses to kernel
> addresses.  The User/Supervisor bit is *in* the page tables, of course.
>
> A userspace access to a kernel address results in a page walk and the
> CPU is completely free to cache all or part of that page walk. A
> Meltdown-style _speculative_ userspace access to kernel memory won't
> generate a fault either. It won't leak data like it used to, of course,
> but it can still walk the page tables. That's one reason LASS is needed.

Bummer, now I have at least two architectures proving me wrong :-) Thank
you as well for the education, I really appreciate it.


