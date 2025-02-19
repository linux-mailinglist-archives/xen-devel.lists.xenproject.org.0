Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2551FA3C33E
	for <lists+xen-devel@lfdr.de>; Wed, 19 Feb 2025 16:13:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.893140.1302065 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkll8-0005h6-UR; Wed, 19 Feb 2025 15:13:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 893140.1302065; Wed, 19 Feb 2025 15:13:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkll8-0005eT-Rk; Wed, 19 Feb 2025 15:13:10 +0000
Received: by outflank-mailman (input) for mailman id 893140;
 Wed, 19 Feb 2025 15:13:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ETXj=VK=redhat.com=vschneid@srs-se1.protection.inumbo.net>)
 id 1tkll7-0005cq-Ly
 for xen-devel@lists.xenproject.org; Wed, 19 Feb 2025 15:13:09 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 05e0e1cc-eed4-11ef-9aa8-95dc52dad729;
 Wed, 19 Feb 2025 16:13:08 +0100 (CET)
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-356--brYs2PVN5ajwtPRdAfvow-1; Wed, 19 Feb 2025 10:13:05 -0500
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-4394c747c72so34917395e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 19 Feb 2025 07:13:05 -0800 (PST)
Received: from vschneid-thinkpadt14sgen2i.remote.csb
 (213-44-141-166.abo.bbox.fr. [213.44.141.166])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-439858ec5fasm88121225e9.29.2025.02.19.07.13.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Feb 2025 07:13:02 -0800 (PST)
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
X-Inumbo-ID: 05e0e1cc-eed4-11ef-9aa8-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1739977986;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YEDFkhBYjRhP5Z93Fy/FXNH8qcO0tYdixMhBiEsACWQ=;
	b=GW9GPyekQTHonsiuL57zD47+u+pvv3Zl7lMu41Z4O6mg0ReVmlHevyBl3eQBcru2N3jwZu
	k9R27JRRiNS53QWSMhSBaGNB9Ms8uh7mZTmLrVdVRZfz0VvxIJoPta3YcWzLr6/O0bp4GK
	9E3HzKLwpohKweKhoeD8s1HfvoR3VBA=
X-MC-Unique: -brYs2PVN5ajwtPRdAfvow-1
X-Mimecast-MFC-AGG-ID: -brYs2PVN5ajwtPRdAfvow_1739977984
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739977984; x=1740582784;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YEDFkhBYjRhP5Z93Fy/FXNH8qcO0tYdixMhBiEsACWQ=;
        b=aBdYDMCDz1Wzdd0y9zi3wS7HKk2vcO6fvy+70r4p0AsSoGLbkbmpiXhmWNn+51VS/r
         1xV4NIeZ7Wb1N+z/8czQAa1V3hI7MA3J9wfISix2bQdqgC01r5RfOJuaA3c0DnHwqxzC
         DGhe3at+1gjZDh4Wqn87MxrAbJgu/aCeltIJY3gV4Q4yENKWinP4CoINORwYBDf/PUYc
         3YgxIEOnXTLX9/+QX8+KuOcJe1M+sZMJVAUPLag8hwolSQVjUCuFPLdSmfMEAyIhCUm+
         z+2mtuXk0uzuGPjDl6U+DvlIknCq7nWsmE6v7kM/zQlnyfi5GKrsr0VVCcjF5rzjSSAu
         OCHA==
X-Forwarded-Encrypted: i=1; AJvYcCUwgrZlSBC2mgRO1Y4Ls4gdKbq1M/0mDqlH/ryy6U/sShHZpFeYN0YWPdQ9gc6cTo6T0saumxenKkA=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yzdkfw2bDol580brp0/PHlHIZ8ZMWYGf8+AYr4VP8ADZ11Ale7N
	JTMdx4V4IHHznQNc63wS8jkURB+dpfMPuAeKMNn4ms/C6OK0MFLlCIn1JLFWR9aq5BGcBFwr28p
	XpxlTiPwRP8/lrXFzx6YN5wfEvFupXcAEiIEbQHOe7WsfKqoji6562OQw9PAiti2F
X-Gm-Gg: ASbGncuEScpB4yPI5JnAKCsDlqEd5e9zKqjojEPywjt9cAFIqW9EMg4mGICutGellXJ
	aF18X55kudIejeWitC3KgV4ZERZDjpWfvgIAmOTqOlf7IRm5DHXY9DoH+w0YMy4Wyrv+e8IANBl
	JvwYVD1eMaj/iRF6UoVtBy4BTb+TF4xIrhaodFilNPJOw9Pnrc+3zQyq+G2v3EYwhLFmwEbeAbP
	MrW/bG0HjuYLdgcC4MDq9/znwT4SDkt2lk+nvNH1o+sHT2WrIWeZImMQnygCkFqD5QByuijcF9C
	2N18prQem7EBC4GBVkSTSOnqs67UZ32gSCW/UxCKZUODaroUiOJwBagEPQ5J7KJSrw==
X-Received: by 2002:a05:600c:3d0b:b0:439:88bb:d02d with SMTP id 5b1f17b1804b1-43988bbd322mr97619305e9.2.1739977984084;
        Wed, 19 Feb 2025 07:13:04 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHqXB0SvUjV4zwF8A6smqwc0vRSLTkn6r2mJurV/wBBuDlOIkQeOJi/olfCVvoVfIVGXKI8cw==
X-Received: by 2002:a05:600c:3d0b:b0:439:88bb:d02d with SMTP id 5b1f17b1804b1-43988bbd322mr97618455e9.2.1739977983617;
        Wed, 19 Feb 2025 07:13:03 -0800 (PST)
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
In-Reply-To: <d0450bc8-6585-49ca-9cad-49e65934bd5c@intel.com>
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
Date: Wed, 19 Feb 2025 16:13:00 +0100
Message-ID: <xhsmhh64qhssj.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: _rXpKad7OqOgStp7I1OYoZ_XnajUZc_DudiznU-P6uY_1739977984
X-Mimecast-Originator: redhat.com
Content-Type: text/plain

On 18/02/25 16:39, Dave Hansen wrote:
> On 2/18/25 14:40, Valentin Schneider wrote:
>>> In practice, it's mostly limited like that.
>>>
>>> Architecturally, there are no promises from the CPU. It is within its
>>> rights to cache anything from the page tables at any time. If it's in
>>> the CR3 tree, it's fair game.
>>>
>> So what if the VMEMMAP range *isn't* in the CR3 tree when a CPU is
>> executing in userspace?
>>
>> AIUI that's the case with kPTI - the remaining kernel pages should mostly
>> be .entry.text and cpu_entry_area, at least for x86.
>
> Having part of VMEMMAP not in the CR3 tree should be harmless while
> running userspace. VMEMMAP is a purely software structure; the hardware
> doesn't do implicit supervisor accesses to it. It's also not needed in
> super early entry.
>
> Maybe I missed part of the discussion though. Is VMEMMAP your only
> concern? I would have guessed that the more generic vmalloc()
> functionality would be harder to pin down.

Urgh, that'll teach me to send emails that late - I did indeed mean the
vmalloc() range, not at all VMEMMAP. IIUC *neither* are present in the user
kPTI page table and AFAICT the page table swap is done before the actual vmap'd
stack (CONFIG_VMAP_STACK=y) gets used.


