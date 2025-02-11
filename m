Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A046A310BF
	for <lists+xen-devel@lfdr.de>; Tue, 11 Feb 2025 17:10:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.885730.1295536 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1thspp-0002xe-4y; Tue, 11 Feb 2025 16:10:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 885730.1295536; Tue, 11 Feb 2025 16:10:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1thspp-0002ua-2E; Tue, 11 Feb 2025 16:10:05 +0000
Received: by outflank-mailman (input) for mailman id 885730;
 Tue, 11 Feb 2025 16:10:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tUK+=VC=redhat.com=vschneid@srs-se1.protection.inumbo.net>)
 id 1thspm-0002Ky-Bk
 for xen-devel@lists.xenproject.org; Tue, 11 Feb 2025 16:10:02 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a4706934-e892-11ef-a075-877d107080fb;
 Tue, 11 Feb 2025 17:10:00 +0100 (CET)
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-643-RYa3YYQ2Mu-LpXLk8cVCCQ-1; Tue, 11 Feb 2025 11:09:55 -0500
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-38dd5031ee7so1521905f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 11 Feb 2025 08:09:54 -0800 (PST)
Received: from vschneid-thinkpadt14sgen2i.remote.csb
 (213-44-141-166.abo.bbox.fr. [213.44.141.166])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38dbde1dfaesm15387623f8f.90.2025.02.11.08.09.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Feb 2025 08:09:52 -0800 (PST)
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
X-Inumbo-ID: a4706934-e892-11ef-a075-877d107080fb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1739290199;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vlqDgCP2DAkslcpgDFYXdlhhng4EN6BqWt/KN1sHhDc=;
	b=Vb5k2lYNxi641zOqZtjHVCwzEGsqt5fNgJw+NbWxbzNOokI+oJeyM9P6fWEXaqGoWx6xen
	z2hUd97MQhEeXbnoAY3h3Yug1NRur3rKJajCUKDZ+fISujuAgwPG6IZGwwVFpo6eAeBL1u
	+vxB2bFdvSCs40cl0INNYHOxQIJjDZs=
X-MC-Unique: RYa3YYQ2Mu-LpXLk8cVCCQ-1
X-Mimecast-MFC-AGG-ID: RYa3YYQ2Mu-LpXLk8cVCCQ
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739290194; x=1739894994;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cqBw0fvuK6HvmV212DNXANVYi4ije8UDstIz77BqBKI=;
        b=BS3zUnyK1LHyZR6EtpGo/xnvY3s//boe7OzGgKuOULCjXiMOmun51XWkrF/QcSB46k
         CoUyip/XK6zyjCKIFQNq9RmELXZbkFnXeXi8JE4Y8Rl1HiBUyaSdLUqIPFeupLl3OHhL
         R+8NOsnsZ+nsG8rFCsnNOtqbPH44NscjowC0jhW/svjSHzRBXIxx8BqejCmx/VZDAxC4
         EALPwVHYpzarGrhzyUgWBYp6uib9WHzmj2K7K4Qs2VTRJ2rOkUAXUjDkCvKf5M4aC+fT
         +s76hlXDJTjsdqU8aAJh1X/rCtGEWUDg3Kz0iDC1C/1OuRx28jk6fpzfYL8qtEc4AITr
         Uhvg==
X-Forwarded-Encrypted: i=1; AJvYcCXO7u6MOSUy24X7N5UKunAMwvClKz/gHyPM1rlvbVHqEYwUvaZ4X+ruqwmg22qM2a5USDa3tunNi74=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yzy/bD7CiWKNnUsarDjen4rTMsfHzrxEX6VMAJ2Llpc1Pa0Aiy1
	Q9qVPMGfGcPER2semADyFA3p9yhUWkksZRz4qmUO/wsktRVrLdMbGsm7Kzf2YSxu4lVOd7+9FpM
	9qm7HNs5AGcDcq16sB3YuOqmKYF8pWMDPhmnUky+pcPswU4fq9r1FKN7zOXOlVLVo
X-Gm-Gg: ASbGnctTYdAZhSr1brPGUEeaDLjhEgmXKOZTs7EwYcps7dPNQgmLyNUYB+UlhXzejLX
	mZBGUYX7e7vK7Z2hM8t6pu62U2745RzNH+zHHjvhbl5UZMsjg+6krPqYCUjJTcpGi/111iHEV8M
	iCY8Lftar9qpkSnluyTA9e3Rh4mexAsUYJ0fGulw5tSU+4IcvWkCM+xdvCv2HQn78mFX/lkKNC0
	dTBlDkVt1P1asOuMb1LvbfBFFdVvqEPxDGUgo/pIgzYQbtElSW3NEGRGd4g+0rJAHnuETdVyzlE
	lNwCItEbLnut3f657OPLdvNIKio5PifOJxp13oUXl2gTjGSRUeYji7+VDBa1Knz8GA==
X-Received: by 2002:adf:b60f:0:b0:38d:b113:eb8 with SMTP id ffacd0b85a97d-38de918b920mr304847f8f.20.1739290193761;
        Tue, 11 Feb 2025 08:09:53 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHK1ASMUo9/0VqOa8FhznHehFcHh+h1fB2eK6UH8SCGRKzMX4fpRgybDSM9A1NmLLMyPAzxtg==
X-Received: by 2002:adf:b60f:0:b0:38d:b113:eb8 with SMTP id ffacd0b85a97d-38de918b920mr304770f8f.20.1739290193306;
        Tue, 11 Feb 2025 08:09:53 -0800 (PST)
From: Valentin Schneider <vschneid@redhat.com>
To: Mark Rutland <mark.rutland@arm.com>
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
 <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Alexander Shishkin
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
In-Reply-To: <Z6tYnOEBkOlT_ehp@J2N7QTR9R3>
References: <20250114175143.81438-1-vschneid@redhat.com>
 <20250114175143.81438-30-vschneid@redhat.com>
 <CAG48ez1Mh+DOy0ysOo7Qioxh1W7xWQyK9CLGNU9TGOsLXbg=gQ@mail.gmail.com>
 <xhsmh34hhh37q.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
 <CAG48ez3H8OVP1GxBLdmFgusvT1gQhwu2SiXbgi8T9uuCYVK52w@mail.gmail.com>
 <xhsmh5xlhk5p2.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
 <CAG48ez1EAATYcX520Nnw=P8XtUDSr5pe+qGH1YVNk3xN2LE05g@mail.gmail.com>
 <xhsmh34gkk3ls.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
 <Z6tYnOEBkOlT_ehp@J2N7QTR9R3>
Date: Tue, 11 Feb 2025 17:09:49 +0100
Message-ID: <xhsmhwmdwihte.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: vLHr9SzRPFYuJHw3RV9nvr03W-FMrRumN8XGkligkzs_1739290194
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 11/02/25 14:03, Mark Rutland wrote:
> On Tue, Feb 11, 2025 at 02:33:51PM +0100, Valentin Schneider wrote:
>> On 10/02/25 23:08, Jann Horn wrote:
>> > 2. It's wrong to assume that TLB entries are only populated for
>> > addresses you access - thanks to speculative execution, you have to
>> > assume that the CPU might be populating random TLB entries all over
>> > the place.
>>
>> Gotta love speculation. Now it is supposed to be limited to genuinely
>> accessible data & code, right? Say theoretically we have a full TLBi as
>> literally the last thing before doing the return-to-userspace, speculati=
on
>> should be limited to executing maybe bits of the return-from-userspace
>> code?
>
> I think it's easier to ignore speculation entirely, and just assume that
> the MMU can arbitrarily fill TLB entries from any page table entries
> which are valid/accessible in the active page tables. Hardware
> prefetchers can do that regardless of the specific path of speculative
> execution.
>
> Thus TLB fills are not limited to VAs which would be used on that
> return-to-userspace path.
>
>> Furthermore, I would hope that once a CPU is executing in userspace, it'=
s
>> not going to populate the TLB with kernel address translations - AIUI th=
e
>> whole vulnerability mitigation debacle was about preventing this sort of
>> thing.
>
> The CPU can definitely do that; the vulnerability mitigations are all
> about what userspace can observe rather than what the CPU can do in the
> background. Additionally, there are features like SPE and TRBE that use
> kernel addresses while the CPU is executing userspace instructions.
>
> The latest ARM Architecture Reference Manual (ARM DDI 0487 L.a) is fairly=
 clear
> about that in section D8.16 "Translation Lookaside Buff", where it says
> (among other things):
>
>   When address translation is enabled, if a translation table entry
>   meets all of the following requirements, then that translation table
>   entry is permitted to be cached in a TLB or intermediate TLB caching
>   structure at any time:
>   =E2=80=A2 The translation table entry itself does not generate a Transl=
ation
>     fault, an Address size fault, or an Access flag fault.
>   =E2=80=A2 The translation table entry is not from a translation regime
>     configured by an Exception level that is lower than the current
>     Exception level.
>
> Here "permitted to be cached in a TLB" also implies that the HW is
> allowed to fetch the translation tabl entry (which is what ARM call page
> table entries).
>

That's actually fairly clear all things considered, thanks for the
education and for fishing out the relevant DDI section!

> The PDF can be found at:
>
>   https://developer.arm.com/documentation/ddi0487/la/?lang=3Den
>
> Mark.


