Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 84F70A15504
	for <lists+xen-devel@lfdr.de>; Fri, 17 Jan 2025 17:54:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.874202.1285011 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tYpbQ-0005Fw-FD; Fri, 17 Jan 2025 16:53:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 874202.1285011; Fri, 17 Jan 2025 16:53:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tYpbQ-0005DJ-CB; Fri, 17 Jan 2025 16:53:48 +0000
Received: by outflank-mailman (input) for mailman id 874202;
 Fri, 17 Jan 2025 16:53:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qJiU=UJ=redhat.com=vschneid@srs-se1.protection.inumbo.net>)
 id 1tYpbO-0005DD-UI
 for xen-devel@lists.xenproject.org; Fri, 17 Jan 2025 16:53:46 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9b6ff134-d4f3-11ef-99a4-01e77a169b0f;
 Fri, 17 Jan 2025 17:53:43 +0100 (CET)
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-467-EKBD1GyOOIW1w5QFNhuGPw-1; Fri, 17 Jan 2025 11:53:38 -0500
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-38a35a65575so1875760f8f.1
 for <xen-devel@lists.xenproject.org>; Fri, 17 Jan 2025 08:53:38 -0800 (PST)
Received: from vschneid-thinkpadt14sgen2i.remote.csb
 (213-44-141-166.abo.bbox.fr. [213.44.141.166])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38bf3221db2sm2893201f8f.29.2025.01.17.08.53.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jan 2025 08:53:36 -0800 (PST)
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
X-Inumbo-ID: 9b6ff134-d4f3-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1737132822;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=N/IFo0/H4hlssGmiFiddM6Zrvy7F7bLkhW3DK1UInsM=;
	b=CU/jQxKR6Lxejify8Dv6s70MhiYLa9fQaHLYrIzNorFYcEZMbqQqI7XLQGt44XjmUZQD64
	eMRYE7dF5zBwa0KohAOQu3LEvFPc+1OiLpnbaJJLPwD1vC3zevvvnzfp8dcZkcmOrARkEQ
	HXCM7ovQjonbg6tRdnpJx5LZ3ND7WrU=
X-MC-Unique: EKBD1GyOOIW1w5QFNhuGPw-1
X-Mimecast-MFC-AGG-ID: EKBD1GyOOIW1w5QFNhuGPw
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737132817; x=1737737617;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zS2KlTiZnGu6aQKTYj9yMifWHTI073WZ1gonGb0ZMuU=;
        b=o4CnZJjk/1N61FEJaCKrH9/w4jlDSOm1ytGW1JcWsv6MUMrfyw/G5uwZM/n12YR5o7
         RsZ9d4fkVa9JzDnbTpQVeqSsEJGbqKfAxV4wW/UVMPxBserK2FBdpLKvusDYZuRPkCwk
         BKMDJMAr7UnqWQdSGIu61ysc2zWSEsC17BCVCNBVX0pj5hSBXbA4WGoh8i87SxZlNxaH
         WC5ZP7RLXMy7dIWmVa+Se1Am9Th5uoS7ySlT+bqFuTVtGIt0NK9RqzoOU+0vIwYeFnw6
         PSJbq29IMfoVBPctOe3el1vArmH9SRzCP9Ob55TDrSypAMLU1HIZjLPfNPSAGWEUr+d1
         2SPw==
X-Forwarded-Encrypted: i=1; AJvYcCWHYmyPo2r9vJio965rKDCXTGWrWhCXfDnbeZM8rM0NSz8ilF5hoimMuta3IPa+b1Pb7kVp4g14te8=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx2gsFN4IC/6Q8VX3F+P4bWTTjsxEbwa26T6OyWHbZOCdX1QtBD
	MpgJKKoh1bu3Lm+c7hHWDG5g3kPp3p99rONMyavXjDDl2YrRPjfjNaM54ggiwHBz4UuP1noDMNO
	5j25UYLSHak30MMGExI7z3+6h6/cZtSREKVnf82PRVIVwGd81AyUza64IrMPfSSrf
X-Gm-Gg: ASbGncuOEc5tVHck4jCkUnOEfFa+vxIxunKhFEMATVddu3+Vd78SLfg3bg4gk8ChDz2
	O8bRzlWnE3oXA4mxnDfDFvQ6qOkuMWCae2NfJwPVuIurmX9zksvfeKoXPH3nqH9JGa6DJgiDe+S
	SeVhHpHwCfE3eLfqi5Po4zNjOchdGB7bd8vsMbx38nZkD1TCipH1UxInvc7LXFaCHG/Z4ocXWlV
	lPSvlG2F4a0xG1NltB7UJVMYUh7mvsSXXdpkOJMD3wr/PZ4UC3WKKOGLZdFbLIT5qhBmoYadKBu
	s+vmhTKIIhN2AAXYBq2peX3oBGOhkytK2Ig5kEhcxA==
X-Received: by 2002:a5d:6da4:0:b0:38b:e32a:10a6 with SMTP id ffacd0b85a97d-38bf57a9932mr3394924f8f.41.1737132817348;
        Fri, 17 Jan 2025 08:53:37 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGgg/tn25OOVaMMDMlg+FUQ1oxKEYFZYFbhCFaXXhI5w4vXLbPHJsNwkMnyD4aTZ+GRHXAAGg==
X-Received: by 2002:a5d:6da4:0:b0:38b:e32a:10a6 with SMTP id ffacd0b85a97d-38bf57a9932mr3394815f8f.41.1737132816637;
        Fri, 17 Jan 2025 08:53:36 -0800 (PST)
From: Valentin Schneider <vschneid@redhat.com>
To: Jann Horn <jannh@google.com>
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
In-Reply-To: <CAG48ez3H8OVP1GxBLdmFgusvT1gQhwu2SiXbgi8T9uuCYVK52w@mail.gmail.com>
References: <20250114175143.81438-1-vschneid@redhat.com>
 <20250114175143.81438-30-vschneid@redhat.com>
 <CAG48ez1Mh+DOy0ysOo7Qioxh1W7xWQyK9CLGNU9TGOsLXbg=gQ@mail.gmail.com>
 <xhsmh34hhh37q.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
 <CAG48ez3H8OVP1GxBLdmFgusvT1gQhwu2SiXbgi8T9uuCYVK52w@mail.gmail.com>
Date: Fri, 17 Jan 2025 17:53:33 +0100
Message-ID: <xhsmhzfjpfkky.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: z44P9XNjjfHDsexF5_KeS0ZBe1z20L1YQHp0wxEzWKM_1737132817
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 17/01/25 16:52, Jann Horn wrote:
> On Fri, Jan 17, 2025 at 4:25=E2=80=AFPM Valentin Schneider <vschneid@redh=
at.com> wrote:
>> On 14/01/25 19:16, Jann Horn wrote:
>> > On Tue, Jan 14, 2025 at 6:51=E2=80=AFPM Valentin Schneider <vschneid@r=
edhat.com> wrote:
>> >> vunmap()'s issued from housekeeping CPUs are a relatively common sour=
ce of
>> >> interference for isolated NOHZ_FULL CPUs, as they are hit by the
>> >> flush_tlb_kernel_range() IPIs.
>> >>
>> >> Given that CPUs executing in userspace do not access data in the vmal=
loc
>> >> range, these IPIs could be deferred until their next kernel entry.
>> >>
>> >> Deferral vs early entry danger zone
>> >> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> >>
>> >> This requires a guarantee that nothing in the vmalloc range can be vu=
nmap'd
>> >> and then accessed in early entry code.
>> >
>> > In other words, it needs a guarantee that no vmalloc allocations that
>> > have been created in the vmalloc region while the CPU was idle can
>> > then be accessed during early entry, right?
>>
>> I'm not sure if that would be a problem (not an mm expert, please do
>> correct me) - looking at vmap_pages_range(), flush_cache_vmap() isn't
>> deferred anyway.
>
> flush_cache_vmap() is about stuff like flushing data caches on
> architectures with virtually indexed caches; that doesn't do TLB
> maintenance. When you look for its definition on x86 or arm64, you'll
> see that they use the generic implementation which is simply an empty
> inline function.
>
>> So after vmapping something, I wouldn't expect isolated CPUs to have
>> invalid TLB entries for the newly vmapped page.
>>
>> However, upon vunmap'ing something, the TLB flush is deferred, and thus
>> stale TLB entries can and will remain on isolated CPUs, up until they
>> execute the deferred flush themselves (IOW for the entire duration of th=
e
>> "danger zone").
>>
>> Does that make sense?
>
> The design idea wrt TLB flushes in the vmap code is that you don't do
> TLB flushes when you unmap stuff or when you map stuff, because doing
> TLB flushes across the entire system on every vmap/vunmap would be a
> bit costly; instead you just do batched TLB flushes in between, in
> __purge_vmap_area_lazy().
>
> In other words, the basic idea is that you can keep calling vmap() and
> vunmap() a bunch of times without ever doing TLB flushes until you run
> out of virtual memory in the vmap region; then you do one big TLB
> flush, and afterwards you can reuse the free virtual address space for
> new allocations again.
>
> So if you "defer" that batched TLB flush for CPUs that are not
> currently running in the kernel, I think the consequence is that those
> CPUs may end up with incoherent TLB state after a reallocation of the
> virtual address space.
>

Ah, gotcha, thank you for laying this out! In which case yes, any vmalloc
that occurred while an isolated CPU was NOHZ-FULL can be an issue if said
CPU accesses it during early entry;

> Actually, I think this would mean that your optimization is disallowed
> at least on arm64 - I'm not sure about the exact wording, but arm64
> has a "break before make" rule that forbids conflicting writable
> address translations or something like that.
>

On the bright side of things, arm64 is not as bad as x86 when it comes to
IPI'ing isolated CPUs :-) I'll add that to my notes, thanks!

> (I said "until you run out of virtual memory in the vmap region", but
> that's not actually true - see the comment above lazy_max_pages() for
> an explanation of the actual heuristic. You might be able to tune that
> a bit if you'd be significantly happier with less frequent
> interruptions, or something along those lines.)


