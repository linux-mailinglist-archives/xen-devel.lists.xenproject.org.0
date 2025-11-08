Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A0694C424EE
	for <lists+xen-devel@lfdr.de>; Sat, 08 Nov 2025 03:34:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1157947.1486500 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vHYlq-0000MY-C1; Sat, 08 Nov 2025 02:33:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1157947.1486500; Sat, 08 Nov 2025 02:33:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vHYlq-0000Kq-8d; Sat, 08 Nov 2025 02:33:42 +0000
Received: by outflank-mailman (input) for mailman id 1157947;
 Sat, 08 Nov 2025 02:33:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sm31=5Q=gmail.com=ritesh.list@srs-se1.protection.inumbo.net>)
 id 1vHYlp-0000Kk-Hx
 for xen-devel@lists.xenproject.org; Sat, 08 Nov 2025 02:33:41 +0000
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com
 [2607:f8b0:4864:20::532])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 55812537-bc4b-11f0-9d18-b5c5bf9af7f9;
 Sat, 08 Nov 2025 03:33:40 +0100 (CET)
Received: by mail-pg1-x532.google.com with SMTP id
 41be03b00d2f7-b98983bae8eso819301a12.0
 for <xen-devel@lists.xenproject.org>; Fri, 07 Nov 2025 18:33:40 -0800 (PST)
Received: from dw-tp ([171.76.85.117]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-ba8f8d7eedcsm6587378a12.2.2025.11.07.18.33.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Nov 2025 18:33:37 -0800 (PST)
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
X-Inumbo-ID: 55812537-bc4b-11f0-9d18-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762569218; x=1763174018; darn=lists.xenproject.org;
        h=mime-version:references:message-id:date:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=8bKq5Kbap+TGIzkU08hwTVasn8Atv2TAiFfbpOuCLu4=;
        b=inXNbaN0kxEE6pD1gvDIUGSLCAiR2dnSYvguT1eh9Xb9TtaToFkRc0AiG3xxwzAXU6
         1faSKcMBwmSPooVCvSUcI8vuE7tpn6cRCrMEWrSQ9j+3v03jQyKGZ+xV/0KE/BbFvv68
         S3DL434WUVov0jrQiCapDIjfi/cGYqVR7ZYBoz0E2ERgjHNOxfZkW/E6kJk7V+jqfcha
         +vHICJxOz9pWnNeHPwUy2QBz2JE5fzlXnjfdSIaIjvNdMvYZMlSz9KCPEhHrijpPe0pl
         UBnn5X69c4vnlDp/Vz7UBY809POkGxCc5lWBo9sRmfmpi0w2rqvLmo5ruAokzucINhY3
         AIQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762569218; x=1763174018;
        h=mime-version:references:message-id:date:in-reply-to:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8bKq5Kbap+TGIzkU08hwTVasn8Atv2TAiFfbpOuCLu4=;
        b=gNq+Zo3fxJax1mqHCNZdyXqpzxsfSSfiABbjc7IKr45GLlsC87GlJQjYgVgux3XsBZ
         eEQQEdlpfECk9dSBX/2ju0Lq4GhCyaLfeKaF4VuoSBUJHz/U2EIxEAcp39euCR4NxynP
         5NiZhkAYiSPjXaiQP8g0i8ze9CMsDXpBI/EMcH1XFW/NXVA9++kKWgqkxMYLOfbTa3lA
         VQLGhC4PIHbXKKz4kEKzUB+VNlEr6Kpga7fxi30j1E2sISOBaZiDG3wNg7pvcuy86Uis
         JdO6NIc0ORxfexNcaP9s+x8ywec/O0vLGC3Pe5ni0XwCnb8mfiMSjuEp3XmsSH/9Acbe
         jgRQ==
X-Forwarded-Encrypted: i=1; AJvYcCXVC155MfcuLlNZ/pbdkBdUtSTminB/AfNrYirjcFx5HludaK+wGVdnPN9x06Vmxzlik4/DlpqIUN8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwKsgyxPW8maCVUXR36YEFa7XI1RrqzD8k0GfcCpKjUFE9i4jfd
	L3fsEMt/JgIRPW9zeOxCdNX+XYktH2j70PJFQWkb9tji+HfRZHByFRvU
X-Gm-Gg: ASbGncta1G/e38V/PZ+53haESZ5h0XYEOTr8Ut5ilMZDeNA/RmVsadVgLcb6aiqDMTw
	+hioUJMECIT9VViH6GC+KBODN7dMsZ0Ael5jRc/q6DCDh9nrn0VJpWFXc7ULpoGsgrZALn4lnC2
	MP8J4RBGpyQ2e1V8k5Oxjw0mdOwqHV2AdMzNyzntsphVv6CZ8M+Yz4ZY1RXHWkZApU3N7rZ3TWC
	6r88Iugt26RVKMpnh9R6EoMVC0TS04r5y8rK3snITZIQiGEP5uWg6i2sigLE/G9MxFdAgwLAbMY
	zKsAJb5Sor+4Rc9qKGAqAKmomAkz2tYANnSLYB4coU5cm1cyzxAz38o8alcTVme347hiiGYukVs
	rKMUSssDiFqdacFqcEoPB3KQz29GIG7cmqKHuOzFwO90BAkrwx/Dv7CSjWiFdzL/o3b8WRhcTjL
	drJoPa
X-Google-Smtp-Source: AGHT+IH/Pe7wf3Ci181tpT0LHXQVq+Kf1iV5vunI2sKT5fx4KiiLBfIeJu3hgL/jAYkDOG6ZWRYxGw==
X-Received: by 2002:a05:6a20:12c5:b0:33f:9581:5d2f with SMTP id adf61e73a8af0-3539f99e63emr1740681637.3.1762569218334;
        Fri, 07 Nov 2025 18:33:38 -0800 (PST)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: Kevin Brodsky <kevin.brodsky@arm.com>, linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>, 
	Andreas Larsson <andreas@gaisler.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Boris Ostrovsky <boris.ostrovsky@oracle.com>, Borislav Petkov <bp@alien8.de>, 
	Catalin Marinas <catalin.marinas@arm.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Dave Hansen <dave.hansen@linux.intel.com>, David Hildenbrand <david@redhat.com>, 
	"David S. Miller" <davem@davemloft.net>, David Woodhouse <dwmw2@infradead.org>, 
	"H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>, Jann Horn <jannh@google.com>, 
	Juergen Gross <jgross@suse.com>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Michal Hocko <mhocko@suse.com>, Mike Rapoport <rppt@kernel.org>, 
	Nicholas Piggin <npiggin@gmail.com>, Peter Zijlstra <peterz@infradead.org>, 
	Ryan Roberts <ryan.roberts@arm.com>, Suren Baghdasaryan <surenb@google.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Vlastimil Babka <vbabka@suse.cz>, Will Deacon <will@kernel.org>, 
	Yeoreum Yun <yeoreum.yun@arm.com>, linux-arm-kernel@lists.infradead.org, 
	linuxppc-dev@lists.ozlabs.org, sparclinux@vger.kernel.org, 
	xen-devel@lists.xenproject.org, x86@kernel.org, 
	Venkat Rao Bagalkote <venkat88@linux.ibm.com>
Subject: Re: [PATCH v4 01/12] powerpc/64s: Do not re-activate batched TLB flush
In-Reply-To: <b3e4a92f-5b51-4eee-bfb8-c454add0f0d2@arm.com>
Date: Sat, 08 Nov 2025 06:05:17 +0530
Message-ID: <87cy5t4b0a.ritesh.list@gmail.com>
References: <20251029100909.3381140-1-kevin.brodsky@arm.com> <20251029100909.3381140-2-kevin.brodsky@arm.com> <87qzud42n1.ritesh.list@gmail.com> <b3e4a92f-5b51-4eee-bfb8-c454add0f0d2@arm.com>
MIME-Version: 1.0
Content-Type: text/plain

Kevin Brodsky <kevin.brodsky@arm.com> writes:

> On 05/11/2025 02:46, Ritesh Harjani (IBM) wrote:
>> Kevin Brodsky <kevin.brodsky@arm.com> writes:
>>
>>> From: Alexander Gordeev <agordeev@linux.ibm.com>
>>>
>>> Since commit b9ef323ea168 ("powerpc/64s: Disable preemption in hash
>>> lazy mmu mode") a task can not be preempted while in lazy MMU mode.
>>> Therefore, the batch re-activation code is never called, so remove it.
>>>
>>> Signed-off-by: Alexander Gordeev <agordeev@linux.ibm.com>
>>> Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
>>> ---
>>>  arch/powerpc/include/asm/thread_info.h |  2 --
>>>  arch/powerpc/kernel/process.c          | 25 -------------------------
>>>  2 files changed, 27 deletions(-)
>>>
>> Since the commit referenced in above disables the preemption in
>> arch_enter_lazy_mmu(), so the expectation is that we will never be
>> context switched while in lazy_mmu, hence the code changes in
>> switch_to() around __flush_tlb_pending() should ideally never be called.
>
> Correct, that's the idea.
>
>> With this analysis - the patch looks good to me. I will give this entire
>> patch series a try on Power HW with Hash mmu too (which uses lazy mmu and
>> let you know the results of that)!
>
> That'd be very appreciated, thanks a lot!
>

I did give this patch series a run on Power10 with Hash MMU. I ran the
following stress-ng tests and didn't observe any issues (kernel warnings) so far.

stress-ng --all 0 -t 60s --perf -v --verify \
--tlb-shootdown 0 \
--fault 0 \
--userfaultfd 0 \
--fork 0 \
--exec 0 \
--memfd 0 \
--numa 0 \
--pkey 0 \
--remap 0 \
--vm 0 \
--rmap 0 \
-x swap,pagemove
(Note not all options shown here will work with --verify)

Let me know what else I can run for validation?
Do you know of any specific tests for validation of lazy mmu feature?

>> For this patch please feel free to add:
>> Reviewed-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
>>
>>
>> CC: Venkat who also runs CI on linux Power HW for upstream testing :)
>
> Ack, will Cc you both in the next version.

Sure. Thanks!

-ritesh

