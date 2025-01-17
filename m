Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 733B7A152D9
	for <lists+xen-devel@lfdr.de>; Fri, 17 Jan 2025 16:26:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.874139.1284981 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tYoEP-0006fr-Ug; Fri, 17 Jan 2025 15:25:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 874139.1284981; Fri, 17 Jan 2025 15:25:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tYoEP-0006cn-RP; Fri, 17 Jan 2025 15:25:57 +0000
Received: by outflank-mailman (input) for mailman id 874139;
 Fri, 17 Jan 2025 15:25:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qJiU=UJ=redhat.com=vschneid@srs-se1.protection.inumbo.net>)
 id 1tYoEN-0006ch-ST
 for xen-devel@lists.xenproject.org; Fri, 17 Jan 2025 15:25:55 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 564383c3-d4e7-11ef-99a4-01e77a169b0f;
 Fri, 17 Jan 2025 16:25:53 +0100 (CET)
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-513-sKC4sGzLNkKbVaZaGvX9Pw-1; Fri, 17 Jan 2025 10:25:50 -0500
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-4361eb83f46so15909385e9.3
 for <xen-devel@lists.xenproject.org>; Fri, 17 Jan 2025 07:25:50 -0800 (PST)
Received: from vschneid-thinkpadt14sgen2i.remote.csb
 (213-44-141-166.abo.bbox.fr. [213.44.141.166])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438904621cdsm36969035e9.27.2025.01.17.07.25.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jan 2025 07:25:48 -0800 (PST)
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
X-Inumbo-ID: 564383c3-d4e7-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1737127552;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6DE9vuKFSEA1KS0VYNiNovYjAz7Lk/cPOvdu2tw3vf8=;
	b=ZKD9SAMF0FdqQu4ndh/Wo2Xlovg2Uw0ajlHS/AdumOQOZAn9AiDYzMgtNRjYOCharPikYE
	llcT8t44sI+jGA9ejcXOgmAI6/1jcxVhqi/eClUcHP4BhKJ9dZ1lmHj4NEl1SJgy7Ck1qH
	2wxAfLdZoMAtmGc9qN12FpplPdgIHkU=
X-MC-Unique: sKC4sGzLNkKbVaZaGvX9Pw-1
X-Mimecast-MFC-AGG-ID: sKC4sGzLNkKbVaZaGvX9Pw
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737127549; x=1737732349;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6DE9vuKFSEA1KS0VYNiNovYjAz7Lk/cPOvdu2tw3vf8=;
        b=Z0BUuPtSKvWk4xvx7Kx9K/MLApnMeexX92citbLwwpmEY5BdZdx66rdgt/rtW+hSRs
         mElEHiXNhvma6S8r6j1cUV4vP0kQN8XBzyJxBHWMNLepGSUuSBFmucfqYwOQXEihPdAr
         2B1KuH/pKlfMnSIpcsquAIVVEUnJj4ed+omrVFu2SJsKiCTwCtmY0RmKouZzSn/JBMfM
         SBxEE6LMx0oJqhb3qy6QjTxQc+woXI1Bw4zTUQghaZnAkM/hubHRB3MfyS46ikay1LPX
         eLSronKaMlNsPlJNohRidoUyHL81wiL42SDgHkzRilWKTbq8DYpG5wuOXIoEUvlCHYc0
         w5UA==
X-Forwarded-Encrypted: i=1; AJvYcCXpAvOlxJHVmcg5JIVnrN+e96bP70NTxmIn+O3vhBI0PrSl0+7vNYaX0xx6GmlsVzSTJHXoVpXGhWM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwfoXugEcZI5onOLiuhKX3QqRRIdOLbgYYLCOGF+Rp2fxlJNm8G
	pUJxRO8ba2WXq912FbYkfX3VWiEQMyHMoeJh+6auDxV11WfO50OqtwRfX6LM6OVDEcSlHO+CJGn
	snwyG9FgnksWqkJ9yNdDBpFVOhyckXFI4/v6ribBsBuEX22/552P/BwcTrPaUaHxw
X-Gm-Gg: ASbGncuEXUe9RhnxgSUizdvclV/pS44Zh+6M/3xCwULq7dQuxtmnXSGZj3AO3/eo4Nm
	3+xhxywNigMScrK5WSwvU57gCYjSNbV2axiZQniip/H9RLITqFRX7aAfZPRNQwpXyei3JWXJ+m3
	h2BMESpM2h+g3XgFzO1Vif+7cb2ZOdNTtamqz/PAXbrsGdXpl0A+dGq5HPDUuktxAbfRMbRidiR
	ScM7f7gLth0jDNP30fPHxa9Ut2wDFW9rYvdioP6ah2UiUW5bUIdXq6us2thZ1KC7zbX377cpCRY
	1e4CJxOopFsbMAa9FFJm+xksCF4EzAfecXD6dUbO8A==
X-Received: by 2002:a05:600c:3114:b0:434:a386:6cf with SMTP id 5b1f17b1804b1-438913bff57mr31772435e9.2.1737127549294;
        Fri, 17 Jan 2025 07:25:49 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG0gMZqDwGTwzxqPbq5mivOriCCRRTxthl4OtSHet5NBdrE0Nd7orMMIHX4tKohkjx8g0xD5Q==
X-Received: by 2002:a05:600c:3114:b0:434:a386:6cf with SMTP id 5b1f17b1804b1-438913bff57mr31771625e9.2.1737127548862;
        Fri, 17 Jan 2025 07:25:48 -0800 (PST)
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
In-Reply-To: <CAG48ez1Mh+DOy0ysOo7Qioxh1W7xWQyK9CLGNU9TGOsLXbg=gQ@mail.gmail.com>
References: <20250114175143.81438-1-vschneid@redhat.com>
 <20250114175143.81438-30-vschneid@redhat.com>
 <CAG48ez1Mh+DOy0ysOo7Qioxh1W7xWQyK9CLGNU9TGOsLXbg=gQ@mail.gmail.com>
Date: Fri, 17 Jan 2025 16:25:45 +0100
Message-ID: <xhsmh34hhh37q.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ATjCXxdmQCxVLhpOAR8DDm-s3NO7TdRw3Tpm6uMYK7Y_1737127549
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 14/01/25 19:16, Jann Horn wrote:
> On Tue, Jan 14, 2025 at 6:51=E2=80=AFPM Valentin Schneider <vschneid@redh=
at.com> wrote:
>> vunmap()'s issued from housekeeping CPUs are a relatively common source =
of
>> interference for isolated NOHZ_FULL CPUs, as they are hit by the
>> flush_tlb_kernel_range() IPIs.
>>
>> Given that CPUs executing in userspace do not access data in the vmalloc
>> range, these IPIs could be deferred until their next kernel entry.
>>
>> Deferral vs early entry danger zone
>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>
>> This requires a guarantee that nothing in the vmalloc range can be vunma=
p'd
>> and then accessed in early entry code.
>
> In other words, it needs a guarantee that no vmalloc allocations that
> have been created in the vmalloc region while the CPU was idle can
> then be accessed during early entry, right?

I'm not sure if that would be a problem (not an mm expert, please do
correct me) - looking at vmap_pages_range(), flush_cache_vmap() isn't
deferred anyway.

So after vmapping something, I wouldn't expect isolated CPUs to have
invalid TLB entries for the newly vmapped page.

However, upon vunmap'ing something, the TLB flush is deferred, and thus
stale TLB entries can and will remain on isolated CPUs, up until they
execute the deferred flush themselves (IOW for the entire duration of the
"danger zone").

Does that make sense?


