Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 34545A46713
	for <lists+xen-devel@lfdr.de>; Wed, 26 Feb 2025 17:53:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.897073.1305797 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnKec-0002zx-C8; Wed, 26 Feb 2025 16:53:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 897073.1305797; Wed, 26 Feb 2025 16:53:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnKec-0002xA-8z; Wed, 26 Feb 2025 16:53:02 +0000
Received: by outflank-mailman (input) for mailman id 897073;
 Wed, 26 Feb 2025 16:53:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ae0M=VR=redhat.com=vschneid@srs-se1.protection.inumbo.net>)
 id 1tnKea-0002wz-UN
 for xen-devel@lists.xenproject.org; Wed, 26 Feb 2025 16:53:01 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 21550245-f462-11ef-9aae-95dc52dad729;
 Wed, 26 Feb 2025 17:52:58 +0100 (CET)
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-516-WZigUjCYOv6_zK2Nnt7VMA-1; Wed, 26 Feb 2025 11:52:55 -0500
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-4399d2a1331so338985e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 26 Feb 2025 08:52:55 -0800 (PST)
Received: from vschneid-thinkpadt14sgen2i.remote.csb
 (213-44-141-166.abo.bbox.fr. [213.44.141.166])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-390d98c0642sm2242326f8f.81.2025.02.26.08.52.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Feb 2025 08:52:53 -0800 (PST)
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
X-Inumbo-ID: 21550245-f462-11ef-9aae-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1740588777;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Qf/Qm0nkzf7U3vlvRsLDs3vQoV9ABJSWnA6WtOiN2ig=;
	b=F3p7MeKQY93rTAEtXvGAxtrVuCkWpAL6ijEGoQn6twsLWbzXpcxADa6nWMbEwv3+6zMqxV
	UAfxgl9qvH2HeMBmaPHuiek/Jrgcid5OwLAxNODHBBkWnJ1UGVIIUpvVhxrCP/6tNUvfUa
	1U9xQUNMLFujeOPpVIRnPCBO780vGRI=
X-MC-Unique: WZigUjCYOv6_zK2Nnt7VMA-1
X-Mimecast-MFC-AGG-ID: WZigUjCYOv6_zK2Nnt7VMA_1740588774
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740588774; x=1741193574;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Qf/Qm0nkzf7U3vlvRsLDs3vQoV9ABJSWnA6WtOiN2ig=;
        b=ONe9m+AF6cCfOEByxkdbX1oR/T2k8dzAReMDmaQQDIbK01q7llh341LjcFJq9PyDeS
         u5GOOYBx957aQZokKrKTehhNrKoykmpKgf0KrDaEqI2/PEPo5cR72PIGYhGoCrQyOUme
         NpXq+IpvIzOg2w1aDIvG4MvBxXiAnmYp2zpEtuz/6LQ5SH3XC1V9jhe+AbIG/RSRALb/
         RmoWkrixbnHtxgYPRljM7Kto3eJlQvAG242V+e1RVHtX79vSJXRoZYqGQETG2apekDuZ
         7ECp2ki84Xg+VUkq4xey3s96RdqfXD8dbCrHgztOH/o9O7e2tGLmCDMvtfT1MAM6ZMlo
         i4dw==
X-Forwarded-Encrypted: i=1; AJvYcCUAQbnEtJaq9QL9l04gbkIcLXovsNRB24rGPuQtkat35RHirnwRCImD7F/5oz6LxG8Vt1hDfRpL9GM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyuBCNdFdET7IEVLI8wBcNkjNruUJJf64zxwbTkvGFPXT+ClPYQ
	jWWKjT6cP93VSd3iLhO2kXKRv5JbhFN6s2oqPiTaV4f+tH0NTK8z8WKWzuGvm3R5TvSVsaLgEH7
	aFFMO2RBwwoXwFV1Tm/6150qByTwcVvPrRoSOZvolC2Yorbj/Krn1ga1L7ZpXEpES
X-Gm-Gg: ASbGncvT4mR44y8CgkyJyfAj14ZMnYn8nuPItccIJtlDKBOwm2Z8JIyo+XZa2H+glo9
	DK8Mdmg+W1r8FcwBnm/YVYdjA6diSK6KbRY5c436bedpUtOFLUjFNwPsH0nPg5k8XYLOlI0Tg4M
	o+I1kp6ICEzHH0oTakcvdp6B5EzFGk++U0TU3oe6mplRVq86VwPwx7ALNtN2p4PEsINfvt6PFpx
	fP/mIgLI4LY2IrC3KqQSEsRZyKph8t6ze14Rp7iYnikUi68u9CxqVhPwN3smt0F6KT9PcolgMIH
	TokEzzD85AH96fAXittzwWvlp1eavLCq/XvyGVGtlyVnyrIDzNSI6ropnEn14wOPKeNZDFAVUoD
	M
X-Received: by 2002:a05:600c:ca:b0:439:91c7:895a with SMTP id 5b1f17b1804b1-43afddc6489mr797545e9.7.1740588774301;
        Wed, 26 Feb 2025 08:52:54 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGWpDWParbyEFSiQubNArY/pYMHk4T+vY7Yfjqs/xu0tXoSgFv+Leti7F7TfR+hujI+3HmBjw==
X-Received: by 2002:a05:600c:ca:b0:439:91c7:895a with SMTP id 5b1f17b1804b1-43afddc6489mr797035e9.7.1740588773857;
        Wed, 26 Feb 2025 08:52:53 -0800 (PST)
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
Date: Wed, 26 Feb 2025 17:52:50 +0100
Message-ID: <xhsmhfrk0lkbh.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Ue93r7otwgf-UP8rZ_ebq2Pws1xSOnPlLFT3FyIqf64_1740588774
X-Mimecast-Originator: redhat.com
Content-Type: text/plain

On 20/02/25 09:38, Dave Hansen wrote:
> On 2/20/25 09:10, Valentin Schneider wrote:
>>> The LDT and maybe the PEBS buffers are the only implicit supervisor
>>> accesses to vmalloc()'d memory that I can think of. But those are both
>>> handled specially and shouldn't ever get zapped while in use. The LDT
>>> replacement has its own IPIs separate from TLB flushing.
>>>
>>> But I'm actually not all that worried about accesses while actually
>>> running userspace. It's that "danger zone" in the kernel between entry
>>> and when the TLB might have dangerous garbage in it.
>>>
>> So say we have kPTI, thus no vmalloc() mapped in CR3 when running
>> userspace, and do a full TLB flush right before switching to userspace -
>> could the TLB still end up with vmalloc()-range-related entries when we're
>> back in the kernel and going through the danger zone?
>
> Yes, because the danger zone includes the switch back to the kernel CR3
> with vmalloc() fully mapped. All bets are off about what's in the TLB
> the moment that CR3 write occurs.
>
> Actually, you could probably use that.
>
> If a mapping is in the PTI user page table, you can't defer the flushes
> for it. Basically the same rule for text poking in the danger zone.
>
> If there's a deferred flush pending, make sure that all of the
> SWITCH_TO_KERNEL_CR3's fully flush the TLB. You'd need something similar
> to user_pcid_flush_mask.
>

Right, that's what I (roughly) had in mind...

> But, honestly, I'm still not sure this is worth all the trouble. If
> folks want to avoid IPIs for TLB flushes, there are hardware features
> that *DO* that. Just get new hardware instead of adding this complicated
> pile of software that we have to maintain forever. In 10 years, we'll
> still have this software *and* 95% of our hardware has the hardware
> feature too.

... But yeah, it pretty much circumvents arch_context_tracking_work, or at
the very least adds an early(er) flushing of the context tracking
work... Urgh.

Thank you for grounding my wild ideas into reality. I'll try to think some
more see if I see any other way out (other than "buy hardware that does
what you want and ditch the one that doesn't").


