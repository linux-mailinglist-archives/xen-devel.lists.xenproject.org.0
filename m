Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB801A7132A
	for <lists+xen-devel@lfdr.de>; Wed, 26 Mar 2025 09:56:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.927304.1330060 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txMYb-0007LX-6v; Wed, 26 Mar 2025 08:56:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 927304.1330060; Wed, 26 Mar 2025 08:56:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txMYb-0007IP-3j; Wed, 26 Mar 2025 08:56:17 +0000
Received: by outflank-mailman (input) for mailman id 927304;
 Wed, 26 Mar 2025 08:56:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YO5L=WN=redhat.com=vschneid@srs-se1.protection.inumbo.net>)
 id 1txMYa-0007IJ-2c
 for xen-devel@lists.xenproject.org; Wed, 26 Mar 2025 08:56:16 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2b3841cf-0a20-11f0-9ea3-5ba50f476ded;
 Wed, 26 Mar 2025 09:56:13 +0100 (CET)
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-563-5tAdzoicM3OdfuI1vvuPYg-1; Wed, 26 Mar 2025 04:56:11 -0400
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-43d00017e9dso41723845e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 26 Mar 2025 01:56:11 -0700 (PDT)
Received: from vschneid-thinkpadt14sgen2i.remote.csb
 (213-44-141-166.abo.bbox.fr. [213.44.141.166])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39ac67970a2sm5909443f8f.16.2025.03.26.01.56.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Mar 2025 01:56:08 -0700 (PDT)
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
X-Inumbo-ID: 2b3841cf-0a20-11f0-9ea3-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1742979372;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ctJ2iKS2diL395+WMoYK5u4EcCy52/qwtJ7bficlTlI=;
	b=Yfhi5Fezki67ljs+vfIlE/81Mso6xrv5nuZ7fPeDMK6fu7mYlLHIo9iF3mg3xgQKjY1yk1
	E6/zZwNvVWzbt+iBbMXz3X0SSRHG9FqnZ7aEsdMBo0H9uOLR6LjzHwbOHKoP0fae0k0K2u
	p/gGMSK+IreznDYsmXWDdt3ikTiZlDU=
X-MC-Unique: 5tAdzoicM3OdfuI1vvuPYg-1
X-Mimecast-MFC-AGG-ID: 5tAdzoicM3OdfuI1vvuPYg_1742979370
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742979370; x=1743584170;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ctJ2iKS2diL395+WMoYK5u4EcCy52/qwtJ7bficlTlI=;
        b=S3EFF1cq35IIKX0RbeN71raE36hLQrJGawDcwwUfONyxJm76i1KimoZGRZllAK2QY8
         o43Ra29ghuUi9X/wAyrzN1AO3ZeNC9rzlf2E+MPzQi3W0GBweO41A2FSxr02pNWAHqE/
         Dc4NkoWNJdjomRlqzaRhTwTgFmAeiLU2lmr19NOCb7J2KebJ/p2mrZahJQv83AhGUzT/
         MLpYBDZBLbG6xe40yKkp8QFGgw00mw1cYcroLS9YvxitsC2ZUCQRmVBb34tDXUEagrKA
         z2t3QlW72q3UWJASDhBJZp7Rdbh6gaPbtISQzDk5lLTSx+FkE+OxSiWwbOBb2GXYzmCp
         v6JQ==
X-Forwarded-Encrypted: i=1; AJvYcCXct3dfBWBq9qT3zryxTSilUvLHB99wY7A341fOxuDwYOH+ESZnDHTY5CLgoXEglpjlxeYUJ6yN5xc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzF07lghRWfWpfpFcn1K6QNr+qzfWxVi6pkfQTz/DaAzEYWvvlG
	mWaPtiy8JLcwi8AS2VQDv9oXsC+RPFrvadZ/KvUQkpZER8MdVEvAxQmKhKbrI9dLQ3PKQupsj5V
	5V5yhoDaLEYynXQ51vRPgHBMjpTFdiTifl3pSvpKKaBNl5I6NIryqd1YatlTVH9Zn
X-Gm-Gg: ASbGnctO6FtjtfeHj+IBTVmzvsO0aW579AUbIfFrzU/Q2MX4uBbCPDhLlcn3NhEKE0V
	WdwPwwt+y87OpIxNqDpogYgU27T/pRfgMnFLHf7G4M7JPrVR2jbAvalgJp+0A5Gj97uz0qR8cDq
	toNimzYw912xdUtAPn9yVHK2VW6JHfDFjkRDMEQBeVeBfCLhppSR2xIjEkeQxB+7H+CAUqguDhw
	sKxZMMlAWpjhMl8KKTSeSJefkl+7uY0I+fEHnZLjQLxWRzeN/25KxfwdL+/fJ2STyzpEFzXHPCP
	bCFFKg1liJ/v/NLSPuDclxqpsNcIQmepmwLeHLoZ9C6Hoj+KZq2mTOsycLXRNwrieEw3+7ReKxu
	+
X-Received: by 2002:a05:600c:5025:b0:43d:300f:fa51 with SMTP id 5b1f17b1804b1-43d509ea850mr177277985e9.9.1742979369935;
        Wed, 26 Mar 2025 01:56:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGmtDcswSiHFvojL/8/X8XbIAG8pFv35YFW9PLdaiNFn4jtJsKwcY6xoArge3H5jo1mJzUGFA==
X-Received: by 2002:a05:600c:5025:b0:43d:300f:fa51 with SMTP id 5b1f17b1804b1-43d509ea850mr177277375e9.9.1742979369446;
        Wed, 26 Mar 2025 01:56:09 -0700 (PDT)
From: Valentin Schneider <vschneid@redhat.com>
To: Jann Horn <jannh@google.com>, Rik van Riel <riel@surriel.com>
Cc: Dave Hansen <dave.hansen@intel.com>, linux-kernel@vger.kernel.org,
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
In-Reply-To: <CAG48ez2bSh6=J8cXJhqYX=Y8pXcGsFgC05HsGcF0b1sJK2VH7A@mail.gmail.com>
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
 <xhsmhy0wtngkd.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
 <CAG48ez2bSh6=J8cXJhqYX=Y8pXcGsFgC05HsGcF0b1sJK2VH7A@mail.gmail.com>
Date: Wed, 26 Mar 2025 09:56:06 +0100
Message-ID: <xhsmhv7rwnpax.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: K2rZ59h2u7-YSLNcUGfb048xgJS5eu6YjfGtFEl_gcg_1742979370
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 25/03/25 19:41, Jann Horn wrote:
> On Tue, Mar 25, 2025 at 6:52=E2=80=AFPM Valentin Schneider <vschneid@redh=
at.com> wrote:
>> On 20/02/25 09:38, Dave Hansen wrote:
>> > But, honestly, I'm still not sure this is worth all the trouble. If
>> > folks want to avoid IPIs for TLB flushes, there are hardware features
>> > that *DO* that. Just get new hardware instead of adding this complicat=
ed
>> > pile of software that we have to maintain forever. In 10 years, we'll
>> > still have this software *and* 95% of our hardware has the hardware
>> > feature too.
>>
>> Sorry, you're going to have to deal with my ignorance a little bit longe=
r...
>>
>> Were you thinking x86 hardware specifically, or something else?
>> AIUI things like arm64's TLBIVMALLE1IS can do what is required without a=
ny
>> IPI:
>>
>> C5.5.78
>> """
>> The invalidation applies to all PEs in the same Inner Shareable shareabi=
lity domain as the PE that
>> executes this System instruction.
>> """
>>
>> But for (at least) these architectures:
>>
>>   alpha
>>   x86
>>   loongarch
>>   mips
>>   (non-freescale 8xx) powerpc
>>   riscv
>>   xtensa
>>
>> flush_tlb_kernel_range() has a path with a hardcoded use of on_each_cpu(=
),
>> so AFAICT for these the IPIs will be sent no matter the hardware.
>
> On X86, both AMD and Intel have some fairly recently introduced CPU
> features that can shoot down TLBs remotely.
>
> The patch series
> <https://lore.kernel.org/all/20250226030129.530345-1-riel@surriel.com/>
> adds support for the AMD flavor; that series landed in the current
> merge window (it's present in the mainline git repository now and should
> be part of 6.15). I think support for the Intel flavor has not yet
> been implemented, but the linked patch series mentions a plan to look
> at the Intel flavor next.

Thanks for the info!


