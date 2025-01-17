Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AA880A150D0
	for <lists+xen-devel@lfdr.de>; Fri, 17 Jan 2025 14:46:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.874061.1284932 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tYmeq-0007mb-8K; Fri, 17 Jan 2025 13:45:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 874061.1284932; Fri, 17 Jan 2025 13:45:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tYmeq-0007kT-58; Fri, 17 Jan 2025 13:45:08 +0000
Received: by outflank-mailman (input) for mailman id 874061;
 Fri, 17 Jan 2025 13:45:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qJiU=UJ=redhat.com=vschneid@srs-se1.protection.inumbo.net>)
 id 1tYmeo-0007kN-AO
 for xen-devel@lists.xenproject.org; Fri, 17 Jan 2025 13:45:06 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3f5f4f1a-d4d9-11ef-99a4-01e77a169b0f;
 Fri, 17 Jan 2025 14:45:01 +0100 (CET)
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-504-dO1CuvSTPOqOCtjIYYFVbA-1; Fri, 17 Jan 2025 08:44:57 -0500
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-46798d74f0cso43648521cf.0
 for <xen-devel@lists.xenproject.org>; Fri, 17 Jan 2025 05:44:57 -0800 (PST)
Received: from vschneid-thinkpadt14sgen2i.remote.csb
 (213-44-141-166.abo.bbox.fr. [213.44.141.166])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-46e1042ef63sm11228641cf.71.2025.01.17.05.44.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jan 2025 05:44:55 -0800 (PST)
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
X-Inumbo-ID: 3f5f4f1a-d4d9-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1737121500;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=HEKKhsO2kOL/qF9SHnIE9a8dcD47/tUh4wLid3vzvOo=;
	b=a51vRx2QsdZszzMXf+neqOLckjs1ZNq5QSO3L01C7glmUK9RzGB27lCc3ukQTVuMwOJisy
	1+OuvjOqVCUPdl02sJLiT5+PAOsjVCpfVrcA6SgKdGPs26r7t4mugWAom0mnglOxajvYVo
	yfcVWexUV1OlB/UaPLu6P89mG/wIIY8=
X-MC-Unique: dO1CuvSTPOqOCtjIYYFVbA-1
X-Mimecast-MFC-AGG-ID: dO1CuvSTPOqOCtjIYYFVbA
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737121496; x=1737726296;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HEKKhsO2kOL/qF9SHnIE9a8dcD47/tUh4wLid3vzvOo=;
        b=OGLA0Jg6n6IWTXX4Lob4yG7F7UMYrXfnmgJROPpt2Km6cGUFq9pnK0PzmRyxAdIia1
         b5cbjiPBqtuoEKIcI/lIqFKCYWgw0rB/gRiNBGXoa/mcNzrsDewxq9rfqzZaozdl3Lmr
         W9+4iYEC/6UaLlKJoccqudQRAYtzhiHCAPKiqLLUKDq8LNmHxfeXrJ8i/yEpfvm2LDJI
         lG9vakOO+u3H5bApgtSY6xSCXrdvNuWsJam52wRswr5LI5NBGWs/Ais8YKFl8Vv9nvau
         5WJAjJ7CMlraVz9YPTtM2ypmrFNCYqalbCFUYfC6unX7f2fkl2zrc16TMnaNmAlqITMm
         yUyA==
X-Forwarded-Encrypted: i=1; AJvYcCWjbTdOJN3N6WQXriXmXYFOB5pXdkVGd3sm4IFwqIHpSu0RcovBWrhlM1DhdlY6SgCuDRGZdUQp/44=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzevS3QuQ8RqNW/kpS58OVQWLCi2skLiMv8sU8RFSeuC99H1LrG
	FBxwlGI3wJA9Cx8ZT1g7y13SSg2Y1pJUObaZzZ1JX8XiVUdodA3X8OJwB0o6vwHj0Kf5Ur790QS
	G5nr49iX55e6t4jKDXhiwhwPhyZ5VhQiZw3x+/GD/3qcWegCQ/skqHwYG+IjoKpfO
X-Gm-Gg: ASbGncs55ZWleEt90HCUbbyoHLmCr7qvanmWkvgsaOe8woxPCKYJTV4jtJMxnzPtGPn
	DZChH4+GdwzSe0+GHAzN6NbW+kZFkGLh4teg4phuLDZKMKxGkuOxrdTjPjqQVvzamm0zq6EPM5N
	cjq8imJX5Ws50cG/is3CbOa5FDpQhb0Is4VSeHPl4EUuoEUquJ4P6sdAXdLEt01Qd64PuVmTgQp
	BOhwhG1amAPdHE69fdMCQPhHH2QKPkVmSX+XLdfwKj1zrTbOz5s2hmWU1h/Z8ilyIuhvBTTJ7hX
	OOTIBBJ4zQjmBHjX5/JXjh15COUpLqHIY98Qyz4GiA==
X-Received: by 2002:a05:622a:1387:b0:467:674d:237f with SMTP id d75a77b69052e-46e12ad5f7bmr40518901cf.11.1737121496627;
        Fri, 17 Jan 2025 05:44:56 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHmIl4MCDkHkFsxi8fUyXS99BtrKRZsY+6w06Ii3eQgKuqou3xcsKirOxy10aWGIFujuL9O5w==
X-Received: by 2002:a05:622a:1387:b0:467:674d:237f with SMTP id d75a77b69052e-46e12ad5f7bmr40518371cf.11.1737121496270;
        Fri, 17 Jan 2025 05:44:56 -0800 (PST)
From: Valentin Schneider <vschneid@redhat.com>
To: Dave Hansen <dave.hansen@intel.com>, linux-kernel@vger.kernel.org,
 x86@kernel.org, virtualization@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
 linux-riscv@lists.infradead.org, linux-perf-users@vger.kernel.org,
 xen-devel@lists.xenproject.org, kvm@vger.kernel.org,
 linux-arch@vger.kernel.org, rcu@vger.kernel.org,
 linux-hardening@vger.kernel.org, linux-mm@kvack.org,
 linux-kselftest@vger.kernel.org, bpf@vger.kernel.org,
 bcm-kernel-feedback-list@broadcom.com
Cc: Peter Zijlstra <peterz@infradead.org>, Juergen Gross <jgross@suse.com>,
 Ajay Kaher <ajay.kaher@broadcom.com>, Alexey Makhalov
 <alexey.amakhalov@broadcom.com>, Russell King <linux@armlinux.org.uk>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, Paul
 Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave
 Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>,
 Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim
 <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Alexander
 Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa
 <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, Adrian Hunter
 <adrian.hunter@intel.com>, "Liang, Kan" <kan.liang@linux.intel.com>, Boris
 Ostrovsky <boris.ostrovsky@oracle.com>, Josh Poimboeuf
 <jpoimboe@kernel.org>, Pawan Gupta <pawan.kumar.gupta@linux.intel.com>,
 Sean Christopherson <seanjc@google.com>, Paolo Bonzini
 <pbonzini@redhat.com>, Andy Lutomirski <luto@kernel.org>, Arnd Bergmann
 <arnd@arndb.de>, Frederic Weisbecker <frederic@kernel.org>, "Paul E.
 McKenney" <paulmck@kernel.org>, Jason Baron <jbaron@akamai.com>, Steven
 Rostedt <rostedt@goodmis.org>, Ard Biesheuvel <ardb@kernel.org>, Neeraj
 Upadhyay <neeraj.upadhyay@kernel.org>, Joel Fernandes
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
 <samuel.holland@sifive.com>, Rong Xu <xur@google.com>, Nicolas Saenz
 Julienne <nsaenzju@redhat.com>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Yosry Ahmed <yosryahmed@google.com>, "Kirill A. Shutemov"
 <kirill.shutemov@linux.intel.com>, "Masami Hiramatsu (Google)"
 <mhiramat@kernel.org>, Jinghao Jia <jinghao7@illinois.edu>, Luis
 Chamberlain <mcgrof@kernel.org>, Randy Dunlap <rdunlap@infradead.org>,
 Tiezhu Yang <yangtiezhu@loongson.cn>
Subject: Re: [PATCH v4 26/30] x86,tlb: Make __flush_tlb_global()
 noinstr-compliant
In-Reply-To: <52311c3d-83cf-4dc4-bbcb-5fbca8eb249c@intel.com>
References: <20250114175143.81438-1-vschneid@redhat.com>
 <20250114175143.81438-27-vschneid@redhat.com>
 <52311c3d-83cf-4dc4-bbcb-5fbca8eb249c@intel.com>
Date: Fri, 17 Jan 2025 14:44:42 +0100
Message-ID: <xhsmh5xmdh7w5.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: oBlO9Yyi-gG1te7VPLjuQergYRA_PHWP-bbKSsUFZwA_1737121496
X-Mimecast-Originator: redhat.com
Content-Type: text/plain

On 14/01/25 13:45, Dave Hansen wrote:
> On 1/14/25 09:51, Valentin Schneider wrote:
>> +	cr4 = this_cpu_read(cpu_tlbstate.cr4);
>> +	asm volatile("mov %0,%%cr4": : "r" (cr4 ^ X86_CR4_PGE) : "memory");
>> +	asm volatile("mov %0,%%cr4": : "r" (cr4) : "memory");
>> +	/*
>> +	 * In lieu of not having the pinning crap, hard fail if CR4 doesn't
>> +	 * match the expected value. This ensures that anybody doing dodgy gets
>> +	 * the fallthrough check.
>> +	 */
>> +	BUG_ON(cr4 != this_cpu_read(cpu_tlbstate.cr4));
>
> Let's say someone managed to write to cpu_tlbstate.cr4 where they
> cleared one of the pinned bits.
>
> Before this patch, CR4 pinning would WARN_ONCE() about it pretty quickly
> and also reset the cleared bits.
>
> After this patch, the first native_flush_tlb_global() can clear pinned
> bits, at least until native_write_cr4() gets called the next time. That
> seems like it'll undermine CR4 pinning at least somewhat.
>

The BUG_ON() should still catch any pinned bit mishandling, however...

> What keeps native_write_cr4() from being noinstr-compliant now? Is it
> just the WARN_ONCE()?
>

I don't think that's even an issue since __WARN_printf() wraps the print in
instrumentation_{begin,end}(). In v3 I made native_write_cr4() noinstr and
added a non-noinstr wrapper to be used in existing callsites.

AFAICT if acceptable we could make the whole thing noinstr and stick with
that; Peter, is there something I missed that made you write the handmade
noinstr CR4 RMW?


