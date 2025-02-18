Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 75D2BA3ABE1
	for <lists+xen-devel@lfdr.de>; Tue, 18 Feb 2025 23:41:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.892286.1301277 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkWGh-0005ah-G0; Tue, 18 Feb 2025 22:40:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 892286.1301277; Tue, 18 Feb 2025 22:40:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkWGh-0005Yz-C2; Tue, 18 Feb 2025 22:40:43 +0000
Received: by outflank-mailman (input) for mailman id 892286;
 Tue, 18 Feb 2025 22:40:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PKfC=VJ=redhat.com=vschneid@srs-se1.protection.inumbo.net>)
 id 1tkWGf-0005Ys-RB
 for xen-devel@lists.xenproject.org; Tue, 18 Feb 2025 22:40:41 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5ffb6ea1-ee49-11ef-9aa8-95dc52dad729;
 Tue, 18 Feb 2025 23:40:39 +0100 (CET)
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-680-7dA8sQ1pPWKTaearr76CeQ-1; Tue, 18 Feb 2025 17:40:36 -0500
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-4388eee7073so962385e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 18 Feb 2025 14:40:36 -0800 (PST)
Received: from vschneid-thinkpadt14sgen2i.remote.csb
 (213-44-141-166.abo.bbox.fr. [213.44.141.166])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43993847f39sm32922065e9.14.2025.02.18.14.40.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Feb 2025 14:40:34 -0800 (PST)
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
X-Inumbo-ID: 5ffb6ea1-ee49-11ef-9aa8-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1739918438;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ivyLIcXrK8i6Sm3bd5ok9RWHX3VEX/cjKUj/8oDDJcE=;
	b=IvSDRWjQdRT4NGhiLewqXrvQBjvpefMgEe0SOgJq2yYLYqH11psVSMyQzhuaeplKwQUkdE
	LBmOAI4AKSyzvglau5HjGQeUY7Cru6gGTs8WQiQUx1dBTPSitWTLr8VhR8bnOF+f1tm3na
	CRPw44/drwXLsGZnG2r5HQGa2oaOxZE=
X-MC-Unique: 7dA8sQ1pPWKTaearr76CeQ-1
X-Mimecast-MFC-AGG-ID: 7dA8sQ1pPWKTaearr76CeQ_1739918436
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739918436; x=1740523236;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ivyLIcXrK8i6Sm3bd5ok9RWHX3VEX/cjKUj/8oDDJcE=;
        b=L5QUfTsNrAyJxBOLlVDWchSdf2SHERZvZySFwb83pD/z7NYQrv9ppOzmdoMoP31Lf7
         IFnDrlpqWtEWoowW94uZ0LPpke3QAhjAms8ZD9mSC0daJtBzQP/w+T3wpiWS2x2Sr5T8
         Pvn9PN/ApdPFeasZSQkSjOj1RSpF4Mt1TVmKiq3Oxh9RUmLC8WoVT3uskCyEQHxMlaKZ
         qAxoJwmsEPR+rjQqilIFanhbvawYBZ71M5Gor1GV/AwVFkvvkiIMTY17RqnRjQN3qSQt
         /S14G4V0mopnFoWjntnG8Topvd+o5H/vO7EV5T7aPl+gZ/B9dGv8ublEK8+6n+ohHQSS
         i7vw==
X-Forwarded-Encrypted: i=1; AJvYcCWOVVa71ho7g9248gXSNbf6PtRtsQ7WsZcxO8xvJCz5qrmEu9PsOhDsNzB78A3rKfT11uzznQdyV6E=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzicV8p1sSjQFWAw9iUgmJ2D+m++v9UyDzrq9TfnP8nhf4pBfvc
	tVhNpKcOT4v9RzBloiY6wfQDRHiE8vglTjOZu0MHeAFMfTmbbcblsUNPsN53XD7pLTZKZkl21cZ
	kp8Z1qdVSJh0rkOE15ab0szGg2iUrQQ6oYXIP368OwxraryqYWjTpwgzl5CNtONLb
X-Gm-Gg: ASbGncvx1wLugO5CLelLgCq7Zje2065lEFr9qRzqa8sGV7Cvu2ATlGj3mJ/ddSJ7/zz
	SokcIqTTbNM6AJ8gl/MUZHo70BRyHGUsGleoFZlTxI/+cY1Xdr+P7swoW5x0gXy2eJWe3doAdoe
	Axfs+24dNioUcdad+Gix6x3aq4890VIAVz41jcBF9cjzuJIRjNAGuA2Bi1IIb7hr21S9U+PxMUs
	y5L1Xwk3Q3lsJi0j7J8pvmAh4t6Ku0YoDvSRLhRqFJ0b2hJcS1W28OIymA8pcaW7xjv9Nm2nUPr
	T/BMtblQTfFnnb86BI+w9g3Y9lXcuyDGWpZSVcAqrdQFMJMqk4AsTl0DVKqeddod5w==
X-Received: by 2002:a05:600c:314b:b0:439:86c4:a8d7 with SMTP id 5b1f17b1804b1-43999ae0dc8mr11798065e9.5.1739918435432;
        Tue, 18 Feb 2025 14:40:35 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEI17xveq4qpUoXVn3jaf3vZekMu127UgmikmUhaFlSZ5tyuyrG+gdqtYt1+dNUau7VWeDZUA==
X-Received: by 2002:a05:600c:314b:b0:439:86c4:a8d7 with SMTP id 5b1f17b1804b1-43999ae0dc8mr11797275e9.5.1739918434928;
        Tue, 18 Feb 2025 14:40:34 -0800 (PST)
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
Date: Tue, 18 Feb 2025 23:40:31 +0100
Message-ID: <xhsmhjz9mj2qo.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: SvwyJNQ5KpDMhVz4xxL1EGSnwGzjBInHVCWr_IIdl5Y_1739918436
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

So what if the VMEMMAP range *isn't* in the CR3 tree when a CPU is
executing in userspace?

AIUI that's the case with kPTI - the remaining kernel pages should mostly
be .entry.text and cpu_entry_area, at least for x86.

It sounds like it wouldn't do much for arm64 though, if with CnP a CPU executing in
userspace and with the user/trampoline page table installed can still use
TLB entries of another CPU executing in kernelspace with the kernel page
table installed.


