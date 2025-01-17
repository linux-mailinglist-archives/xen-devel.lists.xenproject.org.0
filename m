Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 57C2FA14C66
	for <lists+xen-devel@lfdr.de>; Fri, 17 Jan 2025 10:49:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.873944.1284853 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tYixO-0002yo-Lw; Fri, 17 Jan 2025 09:48:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 873944.1284853; Fri, 17 Jan 2025 09:48:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tYixO-0002wF-Ip; Fri, 17 Jan 2025 09:48:02 +0000
Received: by outflank-mailman (input) for mailman id 873944;
 Fri, 17 Jan 2025 09:48:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qJiU=UJ=redhat.com=vschneid@srs-se1.protection.inumbo.net>)
 id 1tYixM-0002w9-UD
 for xen-devel@lists.xenproject.org; Fri, 17 Jan 2025 09:48:00 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 219d00f6-d4b8-11ef-a0e2-8be0dac302b0;
 Fri, 17 Jan 2025 10:47:58 +0100 (CET)
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-113-DOgDMzT-OCm8bYKou_wLEg-1; Fri, 17 Jan 2025 04:47:55 -0500
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-4361eb83f46so13349995e9.3
 for <xen-devel@lists.xenproject.org>; Fri, 17 Jan 2025 01:47:54 -0800 (PST)
Received: from vschneid-thinkpadt14sgen2i.remote.csb
 (213-44-141-166.abo.bbox.fr. [213.44.141.166])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438904131f5sm27135155e9.11.2025.01.17.01.47.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jan 2025 01:47:52 -0800 (PST)
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
X-Inumbo-ID: 219d00f6-d4b8-11ef-a0e2-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1737107277;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=VvR9KfuLK5jT/0k1YGBwcApH+9cF5PsvBxGMV+DYi4c=;
	b=DHBRYnQclWBz29AczmtdH2psrHQWNAp2LDJjwl32uDPBUSGvi1VCdiDO7Zu95RYG4y3OpB
	9Tebjf3WoGAbLJ64WOQ9vzSA4BycUOWy/bKAHOHksNptStG7BmNFug3JbEo5RGgIFyw1yE
	ZQ5x15X5d61OUrj/+AN5FwVAZ+jtRyE=
X-MC-Unique: DOgDMzT-OCm8bYKou_wLEg-1
X-Mimecast-MFC-AGG-ID: DOgDMzT-OCm8bYKou_wLEg
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737107274; x=1737712074;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VvR9KfuLK5jT/0k1YGBwcApH+9cF5PsvBxGMV+DYi4c=;
        b=oxmTON5xHZVXjXzsSXQ6YAwA3NeW6tgVP/J6eD+Frt+OUC15fUHDDqtPrAuoQ/6sVY
         nSL1dTkkwwIr69JV3auNPbmRYoMa7/FUjH8WL5GwuCD16EDVI6yGX3GcOTIhfbLjVuAm
         vTBPa0Cgb6IwBTmkbUsippHbfr/pdZwOIJ1szl/rfvSXflNsyR2V4rMCUhLN5hD5Wrnh
         rHQ8Ifqcl5K20Fu3KJJsJ5eFpLoPf4heSL142VV5VqTHikNyyitAefZjqnVtuo6ilB1y
         nqf7eh0Tj5nY52jD3v9AL0D1WubKqITpjpwNC7QFQVV+2YYF+qGgKp+HvtmiAS6EgEsi
         uY2Q==
X-Forwarded-Encrypted: i=1; AJvYcCXh3cwGNUEUQdLwyXXUShnKcsEHUjx9ZjA8ekZMnHvdONMMyMvDuBoREsisjW/6oFyo2vN3vQarbuw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwbaKuHq6sfOQjW2kDchdHs24RSW9RTQFLm5Ba9XoN/mEEwfOPW
	BSEFiMdMA1VvPFhOBw5gQ+eFA6iiCKS8n2qXOHSfv1o3Oo2TUubumV2vNva5XgPfe0MYgVLIU2h
	VaBef8ebor18wZmiH15meXd2tY0F10/h4qhDhiEMU5lRICfUurl9/1ZwZYiFhKofj
X-Gm-Gg: ASbGncuIEhQJjh3F9Sx/4xql+G7GvuiiT0R7b506uBfIAoBZNm+lzRgk8jm9GLBoSo4
	3ZrxynI/XknVxeJObrqqaHTuH46lFhrH8xOULbGT8XF3tKaMHOeWdtwuIZvlkEb94pVs13Fm+vK
	gQaGuLFPz3rfbKFAY4HWqOONIHWvOMMfS1V3jPuM47Ko4yy4Aj2RRVGdhDCyphAZ/HHdtJXMGdY
	U8LsljYc6/WWGPCvDe4v1WhhaoFU29H9Z/caAqwR3/9dQ+R31hElTgm5BbXP+ObTrdNzVt77dFI
	AKhWfdkftWiPK1t5xsIbEcV9/NwUr585BghcyOKXIw==
X-Received: by 2002:a05:600c:9a3:b0:434:fa73:a907 with SMTP id 5b1f17b1804b1-4389191b819mr16314055e9.13.1737107273772;
        Fri, 17 Jan 2025 01:47:53 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHToHDxXT5KMOIEW1byUZUSn/LchRidR5pJg2ZFHbUxu07B2Q/njknWrWkjTXhDYHkp8NfwWQ==
X-Received: by 2002:a05:600c:9a3:b0:434:fa73:a907 with SMTP id 5b1f17b1804b1-4389191b819mr16313255e9.13.1737107273291;
        Fri, 17 Jan 2025 01:47:53 -0800 (PST)
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
In-Reply-To: <Z4bTlZkqihaAyGb4@google.com>
References: <20250114175143.81438-1-vschneid@redhat.com>
 <20250114175143.81438-26-vschneid@redhat.com>
 <Z4bTlZkqihaAyGb4@google.com>
Date: Fri, 17 Jan 2025 10:47:49 +0100
Message-ID: <xhsmhed11hiuy.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: oYi4crjaPN1tOE9tpzoh7_hiWhVzH64uureXBywV25w_1737107274
X-Mimecast-Originator: redhat.com
Content-Type: text/plain

On 14/01/25 13:13, Sean Christopherson wrote:
> On Tue, Jan 14, 2025, Valentin Schneider wrote:
>> text_poke_bp_batch() sends IPIs to all online CPUs to synchronize
>> them vs the newly patched instruction. CPUs that are executing in userspace
>> do not need this synchronization to happen immediately, and this is
>> actually harmful interference for NOHZ_FULL CPUs.
>
> ...
>
>> This leaves us with static keys and static calls.
>
> ...
>
>> @@ -2317,11 +2334,20 @@ static void text_poke_bp_batch(struct text_poke_loc *tp, unsigned int nr_entries
>>       * First step: add a int3 trap to the address that will be patched.
>>       */
>>      for (i = 0; i < nr_entries; i++) {
>> -		tp[i].old = *(u8 *)text_poke_addr(&tp[i]);
>> -		text_poke(text_poke_addr(&tp[i]), &int3, INT3_INSN_SIZE);
>> +		void *addr = text_poke_addr(&tp[i]);
>> +
>> +		/*
>> +		 * There's no safe way to defer IPIs for patching text in
>> +		 * .noinstr, record whether there is at least one such poke.
>> +		 */
>> +		if (is_kernel_noinstr_text((unsigned long)addr))
>> +			cond = NULL;
>
> Maybe pre-check "cond", especially if multiple ranges need to be checked?  I.e.
>
>               if (cond && is_kernel_noinstr_text(...))
>> +
>> +		tp[i].old = *((u8 *)addr);
>> +		text_poke(addr, &int3, INT3_INSN_SIZE);
>>      }
>>
>> -	text_poke_sync();
>> +	__text_poke_sync(cond);
>>
>>      /*
>>       * Second step: update all but the first byte of the patched range.
>
> ...
>
>> +/**
>> + * is_kernel_noinstr_text - checks if the pointer address is located in the
>> + *                    .noinstr section
>> + *
>> + * @addr: address to check
>> + *
>> + * Returns: true if the address is located in .noinstr, false otherwise.
>> + */
>> +static inline bool is_kernel_noinstr_text(unsigned long addr)
>> +{
>> +	return addr >= (unsigned long)__noinstr_text_start &&
>> +	       addr < (unsigned long)__noinstr_text_end;
>> +}
>
> This doesn't do the right thing for modules, which matters because KVM can be
> built as a module on x86, and because context tracking understands transitions
> to GUEST mode, i.e. CPUs that are running in a KVM guest will be treated as not
> being in the kernel, and thus will have IPIs deferred.  If KVM uses a static key
> or branch between guest_state_enter_irqoff() and guest_state_exit_irqoff(), the
> patching code won't wait for CPUs to exit guest mode, i.e. KVM could theoretically
> use the wrong static path.
>

AFAICT guest_state_{enter,exit}_irqoff() are only used in noinstr functions
and thus such a static key usage should at the very least be caught and
warned about by objtool - when this isn't built as a module.

I never really thought about noinstr sections for modules; I can get
objtool to warn about a non-noinstr allowed key being used in
e.g. vmx_vcpu_enter_exit() just by feeding it the vmx.o:

arch/x86/kvm/vmx/vmx.o: warning: objtool: vmx_vcpu_enter_exit.isra.0+0x0: dummykey: non-RO static key usage in noinstr

...but that requires removing a lot of code first because objtool stops
earlier in its noinstr checks as it hits functions it doesn't have full
information on, e.g.

arch/x86/kvm/vmx/vmx.o: warning: objtool: vmx_vcpu_enter_exit+0x21c: call to __ct_user_enter() leaves .noinstr.text section

__ct_user_enter() *is* noinstr, but you don't get that from just the header prototype.

> I don't expect this to ever cause problems in practice, because patching code in
> KVM's VM-Enter/VM-Exit path that has *functional* implications, while CPUs are
> actively running guest code, would be all kinds of crazy.  But I do think we
> should plug the hole.
>
> If this issue is unique to KVM, i.e. is not a generic problem for all modules (I
> assume module code generally isn't allowed in the entry path, even via NMI?), one
> idea would be to let KVM register its noinstr section for text poking.


