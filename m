Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 41EC6A3C4BC
	for <lists+xen-devel@lfdr.de>; Wed, 19 Feb 2025 17:18:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.893219.1302138 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkmmQ-0002lw-2Y; Wed, 19 Feb 2025 16:18:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 893219.1302138; Wed, 19 Feb 2025 16:18:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkmmP-0002ix-VZ; Wed, 19 Feb 2025 16:18:33 +0000
Received: by outflank-mailman (input) for mailman id 893219;
 Wed, 19 Feb 2025 16:18:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ETXj=VK=redhat.com=vschneid@srs-se1.protection.inumbo.net>)
 id 1tkmmO-0002iY-OZ
 for xen-devel@lists.xenproject.org; Wed, 19 Feb 2025 16:18:32 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 26ddd1b5-eedd-11ef-9aa8-95dc52dad729;
 Wed, 19 Feb 2025 17:18:29 +0100 (CET)
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-327-i1Ua3JuUPhqkSmU5V0Ksvw-1; Wed, 19 Feb 2025 11:18:21 -0500
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-4394b2c19ccso58314895e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 19 Feb 2025 08:18:20 -0800 (PST)
Received: from vschneid-thinkpadt14sgen2i.remote.csb
 (213-44-141-166.abo.bbox.fr. [213.44.141.166])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38f2591570esm18461449f8f.59.2025.02.19.08.18.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Feb 2025 08:18:17 -0800 (PST)
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
X-Inumbo-ID: 26ddd1b5-eedd-11ef-9aa8-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1739981908;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/+vVVMJTXnY0V8Ji7GQili3vpyK+jYVcqRgGTJ9UsZo=;
	b=UKga9mUoCpSpm9m8ryLEIamZjiFGQsO4V6QMxtcFKq6IEGgpgeP3XyxXEl4G7iGnnSllf6
	GGJLD3dJeqOnIY6P+AfKUh1Sko8XkPjqZ5OsLpgI0h2sftrfIa9N/qNSBEp4z4Ql89vkf8
	Q0qso7k0+XCAHrHhqY+Odr2IZKIr6V4=
X-MC-Unique: i1Ua3JuUPhqkSmU5V0Ksvw-1
X-Mimecast-MFC-AGG-ID: i1Ua3JuUPhqkSmU5V0Ksvw_1739981900
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739981899; x=1740586699;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b38N2G5pI18KXCo6dYoQ0A/4T04VhxVdQ6rNeU31Ph8=;
        b=uYOUXczkH2uUIb1rG28Mhhe9glLPvWKi7t3PN9b0UYuQZbaD1bCmyn6yxYDlYCONvX
         MybuxJzgOc3J8xq2+s/mTNnLopBimq7kW1fl+bQNHYDe3wPSuvGKzSldcxbc+bWecK23
         K9ULEUe97mZyzThvJrJEvURns9nuQhC90xfOhwKS2YhAtQtJsco3UTAyJluIL3R05GYd
         Yn1phPDmkvOamkxe0LnOaBFhLmgPxxiKmjGWR/Nnq1vq0dKc/qyu4k4r5EKYoVp+gzZT
         gsmBmxpHWeFIHgY3Q+u7irrxBhezwKjh6TkKKoaLnaUqEr+JE05ZkUapp3hNXhmjqPOG
         bEJQ==
X-Forwarded-Encrypted: i=1; AJvYcCUC3FoYAQO3ZnaRMUpz9z6hxdYrbk/sTcy2JdIHP0GoonRNTdUX1cFQYkwWo3yfGZ4Moq16DvDEDCw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyuNW2weAnY7yAz79EFpHWdunV78hGCAhpXtpI1yfVYsLzSCY8P
	mWF1qEFcLVodx1P79hEp+qJaHwbRDW/VQvJx72x2/iVXkg1wPe910OsBii0we10lQJi/jkAgARR
	+r/z58iWJ4BRmzb3m65tyBxVWL1OhyshXGfzmOffTwcRbweB0xHvQxlJLmWiLtOUw
X-Gm-Gg: ASbGncutEoYFALfmgEbB3u77X5zjNw7LMOWrSpniZvRZWVrULWBM/fU3K6DE+/Lv1t/
	XPbx9YoJHFIlOvVQphznOj3VqG8I5fkJPHNN+FXj5Db/h1Z08tNyC4X5VxObHql1rB5v59j0jUl
	90sERRVB4yULa5SBL0wZADvZUXBb4eGxQfZB7GNm7gX8gEQlvW2to8TXNGmtEeg5M+mZHQx1Aty
	RR5qbNEpV3Ofo+2pwNILDnESBIW0ihyY0nog17EQgl/BE6bRH+Hh3kF3oKaUEDZZsQFT4H2kGSU
	hlMpYqHLhRacw0DL//qT+lHOwVwiniMpU1Q8ss+IKkwoQYsdkqgiX0ktix3pb7L7jg==
X-Received: by 2002:a05:600c:5246:b0:439:9d75:9e92 with SMTP id 5b1f17b1804b1-4399d75b257mr27951895e9.28.1739981899417;
        Wed, 19 Feb 2025 08:18:19 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGrgaKWzB18Ksr+NPSQeT1o3+i2kAVUfh7lIILUz6n7wULpVTIiD8VAP1UIlBXohEkgY6+FYQ==
X-Received: by 2002:a05:600c:5246:b0:439:9d75:9e92 with SMTP id 5b1f17b1804b1-4399d75b257mr27950675e9.28.1739981898863;
        Wed, 19 Feb 2025 08:18:18 -0800 (PST)
From: Valentin Schneider <vschneid@redhat.com>
To: Joel Fernandes <joelagnelf@nvidia.com>
Cc: Jann Horn <jannh@google.com>, linux-kernel@vger.kernel.org,
 x86@kernel.org, virtualization@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
 linux-riscv@lists.infradead.org, linux-perf-users@vger.kernel.org,
 xen-devel@lists.xenproject.org, kvm@vger.kernel.org,
 linux-arch@vger.kernel.org, rcu@vger.kernel.org,
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
In-Reply-To: <20250219145302.GA480110@joelnvbox>
References: <20250114175143.81438-1-vschneid@redhat.com>
 <20250114175143.81438-30-vschneid@redhat.com>
 <CAG48ez1Mh+DOy0ysOo7Qioxh1W7xWQyK9CLGNU9TGOsLXbg=gQ@mail.gmail.com>
 <xhsmh34hhh37q.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
 <CAG48ez3H8OVP1GxBLdmFgusvT1gQhwu2SiXbgi8T9uuCYVK52w@mail.gmail.com>
 <xhsmhzfjpfkky.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
 <20250219145302.GA480110@joelnvbox>
Date: Wed, 19 Feb 2025 17:18:14 +0100
Message-ID: <xhsmhecztj4c9.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: YDTPOg_W-fF2p2736R88vbKW8b4W7c7S3qsrnx2wEEo_1739981900
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 19/02/25 10:05, Joel Fernandes wrote:
> On Fri, Jan 17, 2025 at 05:53:33PM +0100, Valentin Schneider wrote:
>> On 17/01/25 16:52, Jann Horn wrote:
>> > On Fri, Jan 17, 2025 at 4:25=E2=80=AFPM Valentin Schneider <vschneid@r=
edhat.com> wrote:
>> >> On 14/01/25 19:16, Jann Horn wrote:
>> >> > On Tue, Jan 14, 2025 at 6:51=E2=80=AFPM Valentin Schneider <vschnei=
d@redhat.com> wrote:
>> >> >> vunmap()'s issued from housekeeping CPUs are a relatively common s=
ource of
>> >> >> interference for isolated NOHZ_FULL CPUs, as they are hit by the
>> >> >> flush_tlb_kernel_range() IPIs.
>> >> >>
>> >> >> Given that CPUs executing in userspace do not access data in the v=
malloc
>> >> >> range, these IPIs could be deferred until their next kernel entry.
>> >> >>
>> >> >> Deferral vs early entry danger zone
>> >> >> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> >> >>
>> >> >> This requires a guarantee that nothing in the vmalloc range can be=
 vunmap'd
>> >> >> and then accessed in early entry code.
>> >> >
>> >> > In other words, it needs a guarantee that no vmalloc allocations th=
at
>> >> > have been created in the vmalloc region while the CPU was idle can
>> >> > then be accessed during early entry, right?
>> >>
>> >> I'm not sure if that would be a problem (not an mm expert, please do
>> >> correct me) - looking at vmap_pages_range(), flush_cache_vmap() isn't
>> >> deferred anyway.
>> >
>> > flush_cache_vmap() is about stuff like flushing data caches on
>> > architectures with virtually indexed caches; that doesn't do TLB
>> > maintenance. When you look for its definition on x86 or arm64, you'll
>> > see that they use the generic implementation which is simply an empty
>> > inline function.
>> >
>> >> So after vmapping something, I wouldn't expect isolated CPUs to have
>> >> invalid TLB entries for the newly vmapped page.
>> >>
>> >> However, upon vunmap'ing something, the TLB flush is deferred, and th=
us
>> >> stale TLB entries can and will remain on isolated CPUs, up until they
>> >> execute the deferred flush themselves (IOW for the entire duration of=
 the
>> >> "danger zone").
>> >>
>> >> Does that make sense?
>> >
>> > The design idea wrt TLB flushes in the vmap code is that you don't do
>> > TLB flushes when you unmap stuff or when you map stuff, because doing
>> > TLB flushes across the entire system on every vmap/vunmap would be a
>> > bit costly; instead you just do batched TLB flushes in between, in
>> > __purge_vmap_area_lazy().
>> >
>> > In other words, the basic idea is that you can keep calling vmap() and
>> > vunmap() a bunch of times without ever doing TLB flushes until you run
>> > out of virtual memory in the vmap region; then you do one big TLB
>> > flush, and afterwards you can reuse the free virtual address space for
>> > new allocations again.
>> >
>> > So if you "defer" that batched TLB flush for CPUs that are not
>> > currently running in the kernel, I think the consequence is that those
>> > CPUs may end up with incoherent TLB state after a reallocation of the
>> > virtual address space.
>> >
>>
>> Ah, gotcha, thank you for laying this out! In which case yes, any vmallo=
c
>> that occurred while an isolated CPU was NOHZ-FULL can be an issue if sai=
d
>> CPU accesses it during early entry;
>
> So the issue is:
>
> CPU1: unmappes vmalloc page X which was previously mapped to physical pag=
e
> P1.
>
> CPU2: does a whole bunch of vmalloc and vfree eventually crossing some la=
zy
> threshold and sending out IPIs. It then goes ahead and does an allocation
> that maps the same virtual page X to physical page P2.
>
> CPU3 is isolated and executes some early entry code before receving said =
IPIs
> which are supposedly deferred by Valentin's patches.
>
> It does not receive the IPI becuase it is deferred, thus access by early
> entry code to page X on this CPU results in a UAF access to P1.
>
> Is that the issue?
>

Pretty much so yeah. That is, *if* there such a vmalloc'd address access in
early entry code - testing says it's not the case, but I haven't found a
way to instrumentally verify this.


