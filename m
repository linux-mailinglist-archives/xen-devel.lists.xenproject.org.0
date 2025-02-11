Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BC54A30D0E
	for <lists+xen-devel@lfdr.de>; Tue, 11 Feb 2025 14:34:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.885548.1295354 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1thqOu-0004iJ-Qd; Tue, 11 Feb 2025 13:34:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 885548.1295354; Tue, 11 Feb 2025 13:34:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1thqOu-0004g9-No; Tue, 11 Feb 2025 13:34:08 +0000
Received: by outflank-mailman (input) for mailman id 885548;
 Tue, 11 Feb 2025 13:34:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tUK+=VC=redhat.com=vschneid@srs-se1.protection.inumbo.net>)
 id 1thqOt-0004g3-FI
 for xen-devel@lists.xenproject.org; Tue, 11 Feb 2025 13:34:07 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d976d05d-e87c-11ef-b3ef-695165c68f79;
 Tue, 11 Feb 2025 14:34:00 +0100 (CET)
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-83-R7ZTYGJOMTujklbUI5jDdw-1; Tue, 11 Feb 2025 08:33:57 -0500
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-4394b2c19ccso11910735e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 11 Feb 2025 05:33:57 -0800 (PST)
Received: from vschneid-thinkpadt14sgen2i.remote.csb
 (213-44-141-166.abo.bbox.fr. [213.44.141.166])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38dcb88d5e6sm11688621f8f.1.2025.02.11.05.33.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Feb 2025 05:33:55 -0800 (PST)
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
X-Inumbo-ID: d976d05d-e87c-11ef-b3ef-695165c68f79
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1739280839;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kiPSr3n7+xyd4jM/lLYprUxePjslA+jL9wOlKC/+QfI=;
	b=GYQeNyL4znWp0r3z23ns2fzNmk/53xyuAy//AC3+DtFJhkDv/vwVQWBWshe9YWKjt6MUgf
	Qa+SPxW+QVqBhbCCLaFpdFopdfAgifzHy8rFmTEIiEe33qv3BEuLEaXzyPP52BBYFby5nT
	6UGo0yTixeaOqNeckMgsGB6UbCt6gvE=
X-MC-Unique: R7ZTYGJOMTujklbUI5jDdw-1
X-Mimecast-MFC-AGG-ID: R7ZTYGJOMTujklbUI5jDdw
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739280836; x=1739885636;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I6rYC3Ttea935cxDKXU7eGhmr1cWrMQ3SYanZpPc/20=;
        b=nRZucd+nYoTbAtUbOAZc2Qf53cg2c3wyogu/oapP4oGCeO/Wu54MiG6/y13AmRks/m
         +aW+bljOHj1cDU36sCn5OmGa6UqDTtyRiWVUL2mgzhFcjLtVM0PtIzBuSgiO2U7s17Kr
         9AmpSw48kx9XqknYnLlCMgUv6kp9RMm1pROIJXhU3jAjFv3KeZETPxib7+7gyGojFahK
         AsDz7G/0Q04QWB57uxq3GrcQJzTBUwrOjfrDmdv563o5rU2kpuyO7Dtzf6n7qU+QWq41
         ArokbVndIPdgQzDfgkRFTS7R+f5GZczN8n2ulZzyBvppske+ooc1sgp+dxvnZJsIl2iS
         e5+Q==
X-Forwarded-Encrypted: i=1; AJvYcCXTDfaw4f/x5EzQTZu5CRV6yRKJw56Jb71JYSAwq1atziKz2WIwnU7LoBcm0mbg408D75rat/mP2qw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxdZo/7NLcUFylnUYlj3WGeiJndHxwxF/JtDmmozD+qkUKZ6C8p
	6Gof7lIHBTDJqdeyCQd8AKWePfDU1O23kvbjFIEvSC3I+VcYhwgnCrOlRpYm83QnscIXkHouzjX
	XtXrE448t9sgAnzWjv1CjlSGZxW3QFz0hTHRkZGOCA0uoFSlu7udMHCoOiLGMGW4v
X-Gm-Gg: ASbGncsZ5B+M0lwIc6x68S063kPwju6+nKBIOkJUIUV/n42pRA9dvhxmOEhypneUlGv
	8sOwo2gKc6Tb/pYvv810O4Fe+f5XQrW8o+4vOQLbaMejUtipYNVVJzBxR63jpjLtJWBnXK0q6iB
	jVYphcgUquIgtSGyF97tqly1rAhWNybNQYsR11prmjJYbJTAZaSH4i5BdOG+0TXuc0pUXx1Us+D
	EKUSFOqTsny9DuE1uit6zRSiuq6v6wY7O5xAT3frtArMsyBou/OaYFJcFcr/K2noD/retnEP1bW
	1LLlXbSlOt10adjDtuFio4ShQNa/3m6xOFS3apcfJho/d4LYCgoJGpVHTObwcGFHpQ==
X-Received: by 2002:a05:600c:384c:b0:439:554f:f64f with SMTP id 5b1f17b1804b1-439554ffb3bmr21891405e9.0.1739280836464;
        Tue, 11 Feb 2025 05:33:56 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHLaJ199QatUt+F367q7Ky9NspQydjwYuxDlEpx56Dm3c1ApLy01ntC7qxuc1s/8cawIiMmnw==
X-Received: by 2002:a05:600c:384c:b0:439:554f:f64f with SMTP id 5b1f17b1804b1-439554ffb3bmr21890805e9.0.1739280836017;
        Tue, 11 Feb 2025 05:33:56 -0800 (PST)
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
In-Reply-To: <CAG48ez1EAATYcX520Nnw=P8XtUDSr5pe+qGH1YVNk3xN2LE05g@mail.gmail.com>
References: <20250114175143.81438-1-vschneid@redhat.com>
 <20250114175143.81438-30-vschneid@redhat.com>
 <CAG48ez1Mh+DOy0ysOo7Qioxh1W7xWQyK9CLGNU9TGOsLXbg=gQ@mail.gmail.com>
 <xhsmh34hhh37q.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
 <CAG48ez3H8OVP1GxBLdmFgusvT1gQhwu2SiXbgi8T9uuCYVK52w@mail.gmail.com>
 <xhsmh5xlhk5p2.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
 <CAG48ez1EAATYcX520Nnw=P8XtUDSr5pe+qGH1YVNk3xN2LE05g@mail.gmail.com>
Date: Tue, 11 Feb 2025 14:33:51 +0100
Message-ID: <xhsmh34gkk3ls.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: P99s6T4WAlhdtPt47daPnjTxlAZA9h0-Q0DBlokGqww_1739280837
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 10/02/25 23:08, Jann Horn wrote:
> On Mon, Feb 10, 2025 at 7:36=E2=80=AFPM Valentin Schneider <vschneid@redh=
at.com> wrote:
>> What if isolated CPUs unconditionally did a TLBi as late as possible in
>> the stack right before returning to userspace? This would mean that upon
>> re-entering the kernel, an isolated CPU's TLB wouldn't contain any kerne=
l
>> range translation - with the exception of whatever lies between the
>> last-minute flush and the actual userspace entry, which should be feasib=
le
>> to vet? Then AFAICT there wouldn't be any work/flush to defer, the IPI
>> could be entirely silenced if it targets an isolated CPU.
>
> Two issues with that:
>

Firstly, thank you for entertaining the idea :-)

> 1. I think the "Common not Private" feature Will Deacon referred to is
> incompatible with this idea:
> <https://developer.arm.com/documentation/101811/0104/Address-spaces/Commo=
n-not-Private>
> says "When the CnP bit is set, the software promises to use the ASIDs
> and VMIDs in the same way on all processors, which allows the TLB
> entries that are created by one processor to be used by another"
>


Sorry for being obtuse - I can understand inconsistent TLB states (old vs
new translations being present in separate TLBs) due to not sending the
flush IPI causing an issue with that, but not "flushing early". Even if TLB
entries can be shared/accessed between CPUs, a CPU should be allowed not to
have a shared entry in its TLB - what am I missing?

> 2. It's wrong to assume that TLB entries are only populated for
> addresses you access - thanks to speculative execution, you have to
> assume that the CPU might be populating random TLB entries all over
> the place.

Gotta love speculation. Now it is supposed to be limited to genuinely
accessible data & code, right? Say theoretically we have a full TLBi as
literally the last thing before doing the return-to-userspace, speculation
should be limited to executing maybe bits of the return-from-userspace
code?

Furthermore, I would hope that once a CPU is executing in userspace, it's
not going to populate the TLB with kernel address translations - AIUI the
whole vulnerability mitigation debacle was about preventing this sort of
thing.


