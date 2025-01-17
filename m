Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 67F1AA14C8F
	for <lists+xen-devel@lfdr.de>; Fri, 17 Jan 2025 10:54:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.873960.1284873 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tYj3a-0005Gs-Hs; Fri, 17 Jan 2025 09:54:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 873960.1284873; Fri, 17 Jan 2025 09:54:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tYj3a-0005FP-DE; Fri, 17 Jan 2025 09:54:26 +0000
Received: by outflank-mailman (input) for mailman id 873960;
 Fri, 17 Jan 2025 09:54:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qJiU=UJ=redhat.com=vschneid@srs-se1.protection.inumbo.net>)
 id 1tYj3Y-0005FJ-Bg
 for xen-devel@lists.xenproject.org; Fri, 17 Jan 2025 09:54:24 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 06531c2c-d4b9-11ef-99a4-01e77a169b0f;
 Fri, 17 Jan 2025 10:54:22 +0100 (CET)
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-642-RRpvVdpsN1KByxlo0sVCYg-1; Fri, 17 Jan 2025 04:54:16 -0500
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-43626224274so9700805e9.0
 for <xen-devel@lists.xenproject.org>; Fri, 17 Jan 2025 01:54:16 -0800 (PST)
Received: from vschneid-thinkpadt14sgen2i.remote.csb
 (213-44-141-166.abo.bbox.fr. [213.44.141.166])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43890420412sm28393455e9.18.2025.01.17.01.54.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jan 2025 01:54:14 -0800 (PST)
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
X-Inumbo-ID: 06531c2c-d4b9-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1737107660;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=L9Oe7BkLz3ZQnhnrUC9eWHjE3nyj6wgCJoWV2O/5t40=;
	b=LE8U3DmT3gzpsSVFq0G5WDH9SYgbFj6TVLii4ma06aBuEWYVYd2eJNuxPkNLvfsYiqJuu3
	SaD/zTjPzp/QiCEAsfHKsreZ/8YCg/VmwgRRQJ/eh+c2PIGcZaqG9z/hNRVmWS1ohVGyie
	d/a/zXCy9UjF3/6QPXwk8EnEFj9v3vA=
X-MC-Unique: RRpvVdpsN1KByxlo0sVCYg-1
X-Mimecast-MFC-AGG-ID: RRpvVdpsN1KByxlo0sVCYg
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737107655; x=1737712455;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=L9Oe7BkLz3ZQnhnrUC9eWHjE3nyj6wgCJoWV2O/5t40=;
        b=ccGM+ybYAi1kNiPgSSdJp4KS7OHkGsqoY1jOqdOLhk/XvRsMxtCUsXe8snF6Q0LgTs
         wk6YxckJKrqH9JEHSaLK9djNSUBBn84vk2y68dOhOrIXsPzX9JeiPZf2kHVGxe+6IHmH
         hEnZLVTl9NkNC7se/UpfwQxkD+ez2Lubcvh90wOGXu3o45/3dnb0offnEbCKWZOxeaqy
         w8Kdkow8qj1UY8JePLB5Y4eZjnubD8VfzZC+etAdfdiLGDqLxC6RTFjS4iTPj1YmIGKu
         5soLFUMKHTT++UMGBfvkxKvA7yyoN5tI7TlCskZMpcHrInmyf7D13xLpEeT6pqhwAiGc
         Q57A==
X-Forwarded-Encrypted: i=1; AJvYcCV5kLOwfSrV002s7C2KxB1+1JqC+tpveYKjjeKYwm5/IbISm/hep36ql7/QO2UjISEuvac6WgQxScw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzHUy8UammxdIh3DOiyKpwNth+3i8TKZb1mLIRYQb1zw8SLmnqw
	fdl9Q0upL3oIK0TBaHHqxDJec/AOyhLOOJ9VwIkCSExKSO/W5CHyjzWga+qXtng339PsCS2/Ush
	9PQZ/bKwYJ/SnG0StRJV5a4yshdNm7qub4GBU6Z/KmbTRAzBNlQ6sEHLue+uk4HHZ
X-Gm-Gg: ASbGncstXdO28LOu8fC4d8qY1kq2NWqpS/gaJbrkHu37i9rOEJzy+uJ9hTusG37mGfk
	sBXSkbRv8gUOlO5d/KEzEdertz7z5yf2fG3vEtTqbq+Cx8I9esr4myBYPLZIfTqP+4QOwdFmkiX
	DQoIYUwG0SgMkli2hZ9xh7XnbMk6FuFgp1n1fFbDYbhHNbLof8c08Xd2kl0KhOrAM68XDBk3bjX
	IZiILwFuE6tJvG19xvsv7q6KDvlcwe0I0tf5PyoSP5vwWraYfpF/ImB/YedlOXoWS5UxFRB3591
	PCyIsSWnd0iE8Kv7yO2Pimzc0o30yXhyYfaYm7InBA==
X-Received: by 2002:a05:600c:450d:b0:436:840b:261c with SMTP id 5b1f17b1804b1-438914340afmr16339345e9.19.1737107655075;
        Fri, 17 Jan 2025 01:54:15 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFuw6rUkDZiEIMePly7ic4RGfvY46wjcWihk2kMpcZz3D30VqRFOYeHlJ+bekZM5WnBbSAhfQ==
X-Received: by 2002:a05:600c:450d:b0:436:840b:261c with SMTP id 5b1f17b1804b1-438914340afmr16338925e9.19.1737107654599;
        Fri, 17 Jan 2025 01:54:14 -0800 (PST)
From: Valentin Schneider <vschneid@redhat.com>
To: Sean Christopherson <seanjc@google.com>
Cc: linux-kernel@vger.kernel.org, x86@kernel.org,
 virtualization@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 loongarch@lists.linux.dev, linux-riscv@lists.infradead.org,
 linux-perf-users@vger.kernel.org, xen-devel@lists.xenproject.org,
 kvm@vger.kernel.org, linux-arch@vger.kernel.org, rcu@vger.kernel.org,
 linux-hardening@vger.kernel.org, linux-mm@kvack.org,
 linux-kselftest@vger.kernel.org, bpf@vger.kernel.org,
 bcm-kernel-feedback-list@broadcom.com, Peter Zijlstra
 <peterz@infradead.org>, Nicolas Saenz Julienne <nsaenzju@redhat.com>,
 Juergen Gross <jgross@suse.com>, Ajay Kaher <ajay.kaher@broadcom.com>,
 Alexey Makhalov <alexey.amakhalov@broadcom.com>, Russell King
 <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, Will
 Deacon <will@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui
 <kernel@xen0n.name>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer
 Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Thomas
 Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav
 Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, "H.
 Peter Anvin" <hpa@zytor.com>, Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa
 <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, Adrian Hunter
 <adrian.hunter@intel.com>, Kan Liang <kan.liang@linux.intel.com>, Boris
 Ostrovsky <boris.ostrovsky@oracle.com>, Josh Poimboeuf
 <jpoimboe@kernel.org>, Pawan Gupta <pawan.kumar.gupta@linux.intel.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Andy Lutomirski <luto@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Frederic Weisbecker <frederic@kernel.org>,
 "Paul E. McKenney" <paulmck@kernel.org>, Jason Baron <jbaron@akamai.com>,
 Steven Rostedt <rostedt@goodmis.org>, Ard Biesheuvel <ardb@kernel.org>,
 Neeraj Upadhyay <neeraj.upadhyay@kernel.org>, Joel Fernandes
 <joel@joelfernandes.org>, Josh Triplett <josh@joshtriplett.org>, Boqun
 Feng <boqun.feng@gmail.com>, Uladzislau Rezki <urezki@gmail.com>, Mathieu
 Desnoyers <mathieu.desnoyers@efficios.com>, Lai Jiangshan
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
 <samuel.holland@sifive.com>, Rong Xu <xur@google.com>, Geert Uytterhoeven
 <geert@linux-m68k.org>, Yosry Ahmed <yosryahmed@google.com>, "Kirill A.
 Shutemov" <kirill.shutemov@linux.intel.com>, "Masami Hiramatsu (Google)"
 <mhiramat@kernel.org>, Jinghao Jia <jinghao7@illinois.edu>, Luis
 Chamberlain <mcgrof@kernel.org>, Randy Dunlap <rdunlap@infradead.org>,
 Tiezhu Yang <yangtiezhu@loongson.cn>
Subject: Re: [PATCH v4 25/30] context_tracking,x86: Defer kernel text
 patching IPIs
In-Reply-To: <Z4bbwE8yfg349gBx@google.com>
References: <20250114175143.81438-1-vschneid@redhat.com>
 <20250114175143.81438-26-vschneid@redhat.com>
 <Z4bTlZkqihaAyGb4@google.com> <Z4bbwE8yfg349gBx@google.com>
Date: Fri, 17 Jan 2025 10:54:11 +0100
Message-ID: <xhsmh8qr9hikc.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: T5iBU4nXzC_W19XSNyTiNppodYyylKxNWJ8k2mPFb8Y_1737107655
X-Mimecast-Originator: redhat.com
Content-Type: text/plain

On 14/01/25 13:48, Sean Christopherson wrote:
> On Tue, Jan 14, 2025, Sean Christopherson wrote:
>> On Tue, Jan 14, 2025, Valentin Schneider wrote:
>> > +/**
>> > + * is_kernel_noinstr_text - checks if the pointer address is located in the
>> > + *                    .noinstr section
>> > + *
>> > + * @addr: address to check
>> > + *
>> > + * Returns: true if the address is located in .noinstr, false otherwise.
>> > + */
>> > +static inline bool is_kernel_noinstr_text(unsigned long addr)
>> > +{
>> > +	return addr >= (unsigned long)__noinstr_text_start &&
>> > +	       addr < (unsigned long)__noinstr_text_end;
>> > +}
>>
>> This doesn't do the right thing for modules, which matters because KVM can be
>> built as a module on x86, and because context tracking understands transitions
>> to GUEST mode, i.e. CPUs that are running in a KVM guest will be treated as not
>> being in the kernel, and thus will have IPIs deferred.  If KVM uses a static key
>> or branch between guest_state_enter_irqoff() and guest_state_exit_irqoff(), the
>> patching code won't wait for CPUs to exit guest mode, i.e. KVM could theoretically
>> use the wrong static path.
>>
>> I don't expect this to ever cause problems in practice, because patching code in
>> KVM's VM-Enter/VM-Exit path that has *functional* implications, while CPUs are
>> actively running guest code, would be all kinds of crazy.  But I do think we
>> should plug the hole.
>>
>> If this issue is unique to KVM, i.e. is not a generic problem for all modules (I
>> assume module code generally isn't allowed in the entry path, even via NMI?), one
>> idea would be to let KVM register its noinstr section for text poking.
>
> Another idea would be to track which keys/branches are tagged noinstr, i.e. generate
> the information at compile time instead of doing lookups at runtime.  The biggest
> downside I can think of is that it would require plumbing in the information to
> text_poke_bp_batch().

IIUC that's what I went for in v3:

https://lore.kernel.org/lkml/20241119153502.41361-11-vschneid@redhat.com

but, modules notwithstanding, simply checking if the patched instruction is
in .noinstr was a lot neater.


