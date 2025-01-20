Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA79DA16DD8
	for <lists+xen-devel@lfdr.de>; Mon, 20 Jan 2025 14:54:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.874959.1285291 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tZsDf-0004cj-RA; Mon, 20 Jan 2025 13:53:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 874959.1285291; Mon, 20 Jan 2025 13:53:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tZsDf-0004Zt-NZ; Mon, 20 Jan 2025 13:53:35 +0000
Received: by outflank-mailman (input) for mailman id 874959;
 Mon, 20 Jan 2025 13:53:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UHT9=UM=redhat.com=vschneid@srs-se1.protection.inumbo.net>)
 id 1tZsDd-0004Zl-Vv
 for xen-devel@lists.xenproject.org; Mon, 20 Jan 2025 13:53:34 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ee928ed5-d735-11ef-a0e3-8be0dac302b0;
 Mon, 20 Jan 2025 14:53:31 +0100 (CET)
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-328-TqlFYvuiOWu4g0FaAdR92A-1; Mon, 20 Jan 2025 08:53:29 -0500
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-467a3c0c8f6so85056201cf.0
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jan 2025 05:53:29 -0800 (PST)
Received: from vschneid-thinkpadt14sgen2i.remote.csb
 (213-44-141-166.abo.bbox.fr. [213.44.141.166])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-46e1030da00sm42651971cf.33.2025.01.20.05.53.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jan 2025 05:53:25 -0800 (PST)
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
X-Inumbo-ID: ee928ed5-d735-11ef-a0e3-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1737381210;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=6OUKdt6VXAQzpOTUFB26LmXUDO8O/oST+Zn2uKcAtKs=;
	b=eGDHOXeGpR0jSKvHT5MBkJQHXMkMHJjrO/ODuRg5+tdN5vwxwkP5D7crDRlIYgMqpJ/ZRH
	Mgv+dY1h8sVNw6GaDZ5g5/KruDz557TqFehXyGhq67R0z2CdocTOLD1xCXDhfTipTZGWGs
	N0NKT0mZO49sGVe0K2zIRN7scilZ6Qg=
X-MC-Unique: TqlFYvuiOWu4g0FaAdR92A-1
X-Mimecast-MFC-AGG-ID: TqlFYvuiOWu4g0FaAdR92A
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737381207; x=1737986007;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6OUKdt6VXAQzpOTUFB26LmXUDO8O/oST+Zn2uKcAtKs=;
        b=CbTUyyzxiT3lhdrkXY8ybdys8SrdadnZdlPlTiu7L2CGxYsEqexykABvJjxT/uMZ6v
         B1Z9qejckrfHgr8Zop0n9YfORA199J3wKJ4AKGYFPbUBuzoFTZTvsBrZefjIij4/xpLJ
         LpR3hXrMWx2ThTP7d2j8AdCTXqHaVijtx3H2a4cFlXJsZxo/yJsCi2ts8POeibMx8FIm
         O564aHRnIkKOqsxfTi6ue5xhitsNULnvmc6ea2+2KUKEgkveZP20sZCYneyO6SCR4kyj
         npPcv/zI07w0tMTpGoYjgURxuAkU8g80HmqzesgU5R44ZuK4glvR09CW+PJ9NnzVZlu+
         y91w==
X-Forwarded-Encrypted: i=1; AJvYcCXn1/CmquGKvk/TZJvy56S/mfPutQsYt5PQ23hSdO3A8BS2r5LX0EqNb+WMAVrwdW03gGhgAzUKgBE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyykohG3DIBKsDr5SAe1/rLC6M+/KnTxQsDL6S1lXbtmXlVtexq
	eOIrdOYo6fCbfniIaa1upbaSgNJMiRAA/ISJpv9f18MP4UfpS953ybZUUZKwTusqOKZhZK1x5j3
	QUfsctn+nKKRzYA3G2vG3DLlQze1mjgcjr8fx3skpPfPMGcUUAonzXjBxNeU1niVC
X-Gm-Gg: ASbGncv8z5oagsD9DECKb/J4iBOmamgfYLljadAShLnq4Ul4oIxpjG3rwt/17ufBAqU
	tXfySkkilHvl8Hp238zT1db+q+BnOLBm3C+b6GB7YjJ5UHdzfDMpkhyXvJzV3yTDMVC7ho+FKQs
	AvjTnbnMyNoB15XQm/wMuJTXdfPwmR2bUFzsVESkyntHPgnLnnR65lHzOJ/JQStHB393lGC2ywf
	0YX1Ql6dOyd4FWC8IOT5KZqoYEb/vvYvt81RTWRPvycgiNnjCjgG5OLXns7/CVkhj30AUEAycJj
	/YAESxYLrDm1Mf5RYr39IiFcQeA6q7z3bbKapGQShICAfEjD964TuWQ=
X-Received: by 2002:ac8:7d82:0:b0:467:5e61:c116 with SMTP id d75a77b69052e-46e12a1e36cmr160729241cf.7.1737381207225;
        Mon, 20 Jan 2025 05:53:27 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGCbxGDy6CHUSfOLqTxGL3gA1S6wKRHlUvydXAdXodFBspL8+Pdog+OKdfN6k1jzDkgqmOx+A==
X-Received: by 2002:ac8:7d82:0:b0:467:5e61:c116 with SMTP id d75a77b69052e-46e12a1e36cmr160728291cf.7.1737381206799;
        Mon, 20 Jan 2025 05:53:26 -0800 (PST)
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
In-Reply-To: <Z4qQL89GZ_gk0vpu@google.com>
References: <20250114175143.81438-1-vschneid@redhat.com>
 <20250114175143.81438-26-vschneid@redhat.com>
 <Z4bTlZkqihaAyGb4@google.com>
 <xhsmhed11hiuy.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
 <Z4qQL89GZ_gk0vpu@google.com>
Date: Mon, 20 Jan 2025 14:53:13 +0100
Message-ID: <xhsmhtt9tfv7a.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Hz6eqdwPvC4VycMOcC0wGO5K0ZeTa_NzpDiwQXN2mvU_1737381207
X-Mimecast-Originator: redhat.com
Content-Type: text/plain

On 17/01/25 09:15, Sean Christopherson wrote:
> On Fri, Jan 17, 2025, Valentin Schneider wrote:
>> On 14/01/25 13:13, Sean Christopherson wrote:
>> > On Tue, Jan 14, 2025, Valentin Schneider wrote:
>> >> +/**
>> >> + * is_kernel_noinstr_text - checks if the pointer address is located in the
>> >> + *                    .noinstr section
>> >> + *
>> >> + * @addr: address to check
>> >> + *
>> >> + * Returns: true if the address is located in .noinstr, false otherwise.
>> >> + */
>> >> +static inline bool is_kernel_noinstr_text(unsigned long addr)
>> >> +{
>> >> +	return addr >= (unsigned long)__noinstr_text_start &&
>> >> +	       addr < (unsigned long)__noinstr_text_end;
>> >> +}
>> >
>> > This doesn't do the right thing for modules, which matters because KVM can be
>> > built as a module on x86, and because context tracking understands transitions
>> > to GUEST mode, i.e. CPUs that are running in a KVM guest will be treated as not
>> > being in the kernel, and thus will have IPIs deferred.  If KVM uses a static key
>> > or branch between guest_state_enter_irqoff() and guest_state_exit_irqoff(), the
>> > patching code won't wait for CPUs to exit guest mode, i.e. KVM could theoretically
>> > use the wrong static path.
>>>
>> AFAICT guest_state_{enter,exit}_irqoff() are only used in noinstr functions
>> and thus such a static key usage should at the very least be caught and
>> warned about by objtool - when this isn't built as a module.
>
> That doesn't magically do the right thing though.  If KVM is built as a module,
> is_kernel_noinstr_text() will get false negatives even for static keys/branches
> that are annotaed as NOINSTR.

Quite so.

I've been looking at mod_mem_type & friends, I'm thinking adding a
MOD_NOINSTR_TEXT type might be overkill considering modules really
shouldn't be involved with early entry, KVM being the one exception.

Your suggestion to have a KVM-module-specific noinstr section sounds good
to me, I'll have a look at that.


