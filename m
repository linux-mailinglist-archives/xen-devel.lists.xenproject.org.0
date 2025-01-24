Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 54FEAA1B8F3
	for <lists+xen-devel@lfdr.de>; Fri, 24 Jan 2025 16:23:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.876811.1287163 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tbLWK-00062i-F7; Fri, 24 Jan 2025 15:22:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 876811.1287163; Fri, 24 Jan 2025 15:22:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tbLWK-0005zn-BF; Fri, 24 Jan 2025 15:22:56 +0000
Received: by outflank-mailman (input) for mailman id 876811;
 Fri, 24 Jan 2025 15:22:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BvlM=UQ=redhat.com=vschneid@srs-se1.protection.inumbo.net>)
 id 1tbLWI-0005zh-RY
 for xen-devel@lists.xenproject.org; Fri, 24 Jan 2025 15:22:54 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1334c407-da67-11ef-99a4-01e77a169b0f;
 Fri, 24 Jan 2025 16:22:52 +0100 (CET)
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-269-njjkiY0IMP-APjSfnuWhNg-1; Fri, 24 Jan 2025 10:22:40 -0500
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-6d8f6b89dcdso37331556d6.3
 for <xen-devel@lists.xenproject.org>; Fri, 24 Jan 2025 07:22:39 -0800 (PST)
Received: from vschneid-thinkpadt14sgen2i.remote.csb
 (213-44-141-166.abo.bbox.fr. [213.44.141.166])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6e2058c2a51sm9344776d6.109.2025.01.24.07.22.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jan 2025 07:22:32 -0800 (PST)
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
X-Inumbo-ID: 1334c407-da67-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1737732170;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DwitzjRGQEzgyZZn0UD4LNiBUZsqGx1Qrum3CBb5LtE=;
	b=KkJGm75bhFl5MMGbe9jAvgzI/cdWtjvHtDbG8bUus5oRIWXcjDmtSbb4gb03r9R5UnpU1l
	xmqILr+Soomp+sC0NCkjvI6EjXdxH4f/soE6QugHXBhTy2O7cLFJlmqBf55ORhWPE7nbIw
	KV1KU4QSKXDR7a1QZ4hXQoEEvYZe4mA=
X-MC-Unique: njjkiY0IMP-APjSfnuWhNg-1
X-Mimecast-MFC-AGG-ID: njjkiY0IMP-APjSfnuWhNg
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737732154; x=1738336954;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DwitzjRGQEzgyZZn0UD4LNiBUZsqGx1Qrum3CBb5LtE=;
        b=d+g8FfkYt7DY46+sUxTVZSFYlc49x5ICsh2uZvcnRj4hZ8e4rgaXvXL62EJJy+M25I
         e/xM7z5sqdf8KNBtaLELrsvvPEApji0+aOduiHqB04jfJb4scTsrz7bOV1MBKgV98ZVO
         09CZswIRM5IWgftVUYHMoxl2tRWlYtl/D0XP+bkZR2r/HBLWFyGGNkTbA3UPs1SmHYag
         5kGkfkDUbKVJcIRXUUkEU5Vk2oyFrOl5rZdQGIL5U2yIZAZ0CKrWtVudOmHMlYY/H684
         UD8dJAzXBMNNIjfDFId309N15n1I+SZUC+9X+KQpJMxsqtqpGdh2dXLQzoClBKld5c1K
         ktXQ==
X-Forwarded-Encrypted: i=1; AJvYcCW0U1cl7EqjcB1mV8rRGnh2JHm7l6FrcP/TnEuB1kKEpVXQSbcfjwDmKwyjmtsRQ/Flgqb7t7kPnWE=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz20JWnLT5LlFzQNNVSJgiAKLMTiUhe1QJoLgnbsULhzAiUL74a
	qkDuS01wC4WjLLpXzhAgfARk8uFfx2yoRXgmt0ZsZnhQ1zOiZRX1Pkm/RmmHNQTZ/FKPWnyGghH
	IwxvnIpj7wRbGDcFeTv/iEr904sRQL8zm12Tj5hZuv34+6PRs3kLlU2zg7+GoVYvf
X-Gm-Gg: ASbGncuaXc694TykhxDbC+GATvLoq0ll8Yui+VTdG2xQXxL2enzzoJhvNMMo/3xKTSv
	8A4q69U6iDTf6pXpYenSMA0SL80Rsd6WBpsXICYJetvBACIdKg48m/5KVbqJaMyA36w3vFybDoR
	QTt863IoUFAz0Du1JuGfBjg0zMF1YUVziKCVN3zHpdJsMNSpVIwDrdlVGv0iSugRHWxrJ1UWDy/
	5KNWLSwVj9TEytnZhkMe/vyIeNb9vFbCRM658elkO72reDsHZaEEPgHdn/cG9kak1sEBKe/b0Kp
	xVUOnAb20TGM5q3YgwiXRyqn0TkzwfBT/T8E08DrOj1rseznhDsOHf0=
X-Received: by 2002:a05:6214:1302:b0:6d8:861f:adca with SMTP id 6a1803df08f44-6e1b2235c9fmr497775216d6.42.1737732153428;
        Fri, 24 Jan 2025 07:22:33 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE5TeadQAXYF5iUiWYdZcwN/B3B0GhQEA3OgvrN+YGY06rhpOtkdAXjp93P8gBhIIoKYtqxZQ==
X-Received: by 2002:a05:6214:1302:b0:6d8:861f:adca with SMTP id 6a1803df08f44-6e1b2235c9fmr497773786d6.42.1737732152904;
        Fri, 24 Jan 2025 07:22:32 -0800 (PST)
From: Valentin Schneider <vschneid@redhat.com>
To: Uladzislau Rezki <urezki@gmail.com>
Cc: Uladzislau Rezki <urezki@gmail.com>, Jann Horn <jannh@google.com>,
 linux-kernel@vger.kernel.org, x86@kernel.org,
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
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Lai Jiangshan
 <jiangshanlai@gmail.com>, Zqiang <qiang.zhang1211@gmail.com>, Juri Lelli
 <juri.lelli@redhat.com>, Clark Williams <williams@redhat.com>, Yair
 Podemsky <ypodemsk@redhat.com>, Tomas Glozar <tglozar@redhat.com>, Vincent
 Guittot <vincent.guittot@linaro.org>, Dietmar Eggemann
 <dietmar.eggemann@arm.com>, Ben Segall <bsegall@google.com>, Mel Gorman
 <mgorman@suse.de>, Kees Cook <kees@kernel.org>, Andrew Morton
 <akpm@linux-foundation.org>, Christoph Hellwig <hch@infradead.org>, Shuah
 Khan <shuah@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, Miguel
 Ojeda <ojeda@kernel.org>, Alice Ryhl <aliceryhl@google.com>, "Mike
 Rapoport (Microsoft)" <rppt@kernel.org>, Samuel Holland
 <samuel.holland@sifive.com>, Rong Xu <xur@google.com>, Nicolas Saenz
 Julienne <nsaenzju@redhat.com>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Yosry Ahmed <yosryahmed@google.com>, "Kirill A. Shutemov"
 <kirill.shutemov@linux.intel.com>, "Masami Hiramatsu (Google)"
 <mhiramat@kernel.org>, Jinghao Jia <jinghao7@illinois.edu>, Luis
 Chamberlain <mcgrof@kernel.org>, Randy Dunlap <rdunlap@infradead.org>,
 Tiezhu Yang <yangtiezhu@loongson.cn>
Subject: Re: [PATCH v4 29/30] x86/mm, mm/vmalloc: Defer
 flush_tlb_kernel_range() targeting NOHZ_FULL CPUs
In-Reply-To: <Z4_Sl-zu7GprkbaL@pc636>
References: <20250114175143.81438-1-vschneid@redhat.com>
 <20250114175143.81438-30-vschneid@redhat.com>
 <CAG48ez1Mh+DOy0ysOo7Qioxh1W7xWQyK9CLGNU9TGOsLXbg=gQ@mail.gmail.com>
 <xhsmh34hhh37q.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
 <Z4qBMqcMg16p57av@pc636>
 <xhsmhwmetfk9d.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
 <Z44wSJTXknQVKWb0@pc636>
 <xhsmhr04xfow1.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
 <Z4_Sl-zu7GprkbaL@pc636>
Date: Fri, 24 Jan 2025 16:22:19 +0100
Message-ID: <xhsmh8qr0p784.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: l-kUtXxuky9XWFSFntE3LcI_y2tHhAQgycBZnZ82tE0_1737732158
X-Mimecast-Originator: redhat.com
Content-Type: text/plain

On 21/01/25 18:00, Uladzislau Rezki wrote:
>> >
>> > As noted before, we defer flushing for vmalloc. We have a lazy-threshold
>> > which can be exposed(if you need it) over sysfs for tuning. So, we can add it.
>> >
>>
>> In a CPU isolation / NOHZ_FULL context, isolated CPUs will be running a
>> single userspace application that will never enter the kernel, unless
>> forced to by some interference (e.g. IPI sent from a housekeeping CPU).
>>
>> Increasing the lazy threshold would unfortunately only delay the
>> interference - housekeeping CPUs are free to run whatever, and so they will
>> eventually cause the lazy threshold to be hit and IPI all the CPUs,
>> including the isolated/NOHZ_FULL ones.
>>
> Do you have any testing results for your workload? I mean how much
> potentially we can allocate. Again, maybe it is just enough to back
> and once per-hour offload it.
>

Potentially as much as you want... In our Openshift environments, you can
get any sort of container executing on the housekeeping CPUs and they're
free to do pretty much whatever they want. Per CPU isolation they're not
allowed/meant to disturb isolated CPUs, however.

> Apart of that how critical IPIing CPUs affect your workloads?
>

If I'm being pedantic, a single IPI to an isolated CPU breaks the
isolation. If we can't quiesce IPIs to isolated CPUs, then we can't
guarantee that whatever is running on the isolated CPUs is actually
isolated / shielded from third party interference.


