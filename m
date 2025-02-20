Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F813A3E1E4
	for <lists+xen-devel@lfdr.de>; Thu, 20 Feb 2025 18:10:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.894008.1302834 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tlA4D-0006PP-BR; Thu, 20 Feb 2025 17:10:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 894008.1302834; Thu, 20 Feb 2025 17:10:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tlA4D-0006NE-8X; Thu, 20 Feb 2025 17:10:29 +0000
Received: by outflank-mailman (input) for mailman id 894008;
 Thu, 20 Feb 2025 17:10:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2Knw=VL=redhat.com=vschneid@srs-se1.protection.inumbo.net>)
 id 1tlA4B-0006N8-FN
 for xen-devel@lists.xenproject.org; Thu, 20 Feb 2025 17:10:27 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 929e72c3-efad-11ef-9aa9-95dc52dad729;
 Thu, 20 Feb 2025 18:10:25 +0100 (CET)
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-78-yHbWNJYoOu2ueCQWU03ZWA-1; Thu, 20 Feb 2025 12:10:21 -0500
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-4398e841963so8773385e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 20 Feb 2025 09:10:19 -0800 (PST)
Received: from vschneid-thinkpadt14sgen2i.remote.csb
 (213-44-141-166.abo.bbox.fr. [213.44.141.166])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4395a0558e2sm247191865e9.11.2025.02.20.09.10.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Feb 2025 09:10:17 -0800 (PST)
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
X-Inumbo-ID: 929e72c3-efad-11ef-9aa9-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1740071423;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=kg7PYKt74NmqPx2oKNRGx3rLvGEcdQR61JIV5w6PyfE=;
	b=WZ6pXsfx4s47MTTi6o510jGI6xPdwxzJMKdPA2GvW/oLw+gQqsGFa5BsGQ7V9A/GZcrhGm
	IgZYQZOySU8oW4FqA6Uy/y+GJxcILOlTCVLCwytutLtdPKtXWKdV4oPLegv1vX4NY1Qt/G
	RLPrM3F8DNbnMlmUMGOKrPNFXouuODA=
X-MC-Unique: yHbWNJYoOu2ueCQWU03ZWA-1
X-Mimecast-MFC-AGG-ID: yHbWNJYoOu2ueCQWU03ZWA_1740071419
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740071419; x=1740676219;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kg7PYKt74NmqPx2oKNRGx3rLvGEcdQR61JIV5w6PyfE=;
        b=RVf6EhMGiW17QhS0zuS6nd98l5EvESXCF47RX1XbX73Bj5Jmd+RwHtMg3B1k8iXEa+
         XNRI661/gBUhpIYPYOMZMadsNN19xiyZZZ1ufJu86aElqLCgQGGgjBdQhoQoWjybeL5H
         SzpwsBB6rTAyWtVfwRQhO7kv5a6PfdvkBfpfTMrRd2ilz5YUeTWnU6zablR6SZmJ8ERs
         hxC1ozKmsBl1kUmHy8LyT6bHLuJI5QCygeT7F3TkERIZ96tVWzYyHE8V8Awy+DgL2kcD
         HE9uwjvILVEtKXPO8zus/fFQlpmwkZJgxaPWUIdSZMUygC91s+EQZnlsn6DGbXe2451e
         BUNg==
X-Forwarded-Encrypted: i=1; AJvYcCWNsiT7nIOmji5Xl/VZJn+gh0f4q9qbSvfwJXBWvdzfOa09EuAyli21Oqpyb+164QAiRdK1TRzl7JE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxQayr1BGHlJXZnRX1Ce/GRBI0R97ZCCqgjM+digTY+Hr/KzdvP
	qbj8JxEfsaIU6xnLRxbEQntzN1RD025tES9dEeKmscOm9Muja4GdgUMdtRTPirnKnJK98rGjz/A
	Na9Yea8P3WttC2sudLiMjB0ri4CS4IrvRxoyT1wozZZ9diOHoNfOyi2dodGZOidJ6
X-Gm-Gg: ASbGnctAUcJTQL19GSmPjA5aY3RlpRyha9JepCaLSEnzQs82ig5KVca4slGzAatvXFv
	NMyXsNuYG3yfMLtIVYdCoxB5zTdr/I1JI9GUD1LKENZ1FI/7T5T7ILmXTQA1V/8iF1AUiALpZ7b
	ZqRn2BCviDPrfd+acnCShn9Fbe/79lNl2tGuDYrWWZcLFcovxvs4Hj0RhimZOEuooB1ixaaRZdp
	flEIR9yibtFL5zTKrFFIeYWtfPhHZISjSh6JpTzz7wmJ1dNRcJaNCfU7jYLcGkYIGID16sxlxHx
	OWjAsgNBF28cBbwA9ndYHS08KJ1LYQ0FYZbVV7CDCxq59wDp8EpGHomEI9olpg6Kmg==
X-Received: by 2002:a05:600c:4fc2:b0:439:985b:17be with SMTP id 5b1f17b1804b1-439ae1eaa78mr176395e9.9.1740071418840;
        Thu, 20 Feb 2025 09:10:18 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFqI8Joi794bN8Kdq45efIzQ+6oEZ5Dcj9tQjLghCqHxxqvkD27DzVgOIJ2kmb/SIiCpoKjvg==
X-Received: by 2002:a05:600c:4fc2:b0:439:985b:17be with SMTP id 5b1f17b1804b1-439ae1eaa78mr175145e9.9.1740071418347;
        Thu, 20 Feb 2025 09:10:18 -0800 (PST)
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
In-Reply-To: <eef09bdc-7546-462b-9ac0-661a44d2ceae@intel.com>
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
Date: Thu, 20 Feb 2025 18:10:15 +0100
Message-ID: <xhsmhfrk84k5k.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: tmyuqI2OshJ9quk-GxseGNTssbQhH1O7VDc2yySLHF4_1740071419
X-Mimecast-Originator: redhat.com
Content-Type: text/plain

On 19/02/25 12:25, Dave Hansen wrote:
> On 2/19/25 07:13, Valentin Schneider wrote:
>>> Maybe I missed part of the discussion though. Is VMEMMAP your only
>>> concern? I would have guessed that the more generic vmalloc()
>>> functionality would be harder to pin down.
>> Urgh, that'll teach me to send emails that late - I did indeed mean the
>> vmalloc() range, not at all VMEMMAP. IIUC *neither* are present in the user
>> kPTI page table and AFAICT the page table swap is done before the actual vmap'd
>> stack (CONFIG_VMAP_STACK=y) gets used.
>
> OK, so rewriting your question... ;)
>
>> So what if the vmalloc() range *isn't* in the CR3 tree when a CPU is
>> executing in userspace?
>
> The LDT and maybe the PEBS buffers are the only implicit supervisor
> accesses to vmalloc()'d memory that I can think of. But those are both
> handled specially and shouldn't ever get zapped while in use. The LDT
> replacement has its own IPIs separate from TLB flushing.
>
> But I'm actually not all that worried about accesses while actually
> running userspace. It's that "danger zone" in the kernel between entry
> and when the TLB might have dangerous garbage in it.
>

So say we have kPTI, thus no vmalloc() mapped in CR3 when running
userspace, and do a full TLB flush right before switching to userspace -
could the TLB still end up with vmalloc()-range-related entries when we're
back in the kernel and going through the danger zone?

> BTW, I hope this whole thing is turned off on 32-bit. There, we can
> actually take and handle faults on the vmalloc() area. If you get one of
> those faults in your "danger zone", it'll start running page fault code
> which will branch out to god-knows-where and certainly isn't noinstr.

Sounds... Fun. Thanks for pointing out the landmines.


