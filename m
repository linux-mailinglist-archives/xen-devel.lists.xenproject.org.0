Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 73DABCC8902
	for <lists+xen-devel@lfdr.de>; Wed, 17 Dec 2025 16:48:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1188885.1509903 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vVtlA-0000CS-3e; Wed, 17 Dec 2025 15:48:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1188885.1509903; Wed, 17 Dec 2025 15:48:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vVtlA-0000A7-0a; Wed, 17 Dec 2025 15:48:16 +0000
Received: by outflank-mailman (input) for mailman id 1188885;
 Wed, 17 Dec 2025 15:48:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oGgt=6X=gmail.com=ritesh.list@srs-se1.protection.inumbo.net>)
 id 1vVtl9-00009y-1N
 for xen-devel@lists.xenproject.org; Wed, 17 Dec 2025 15:48:15 +0000
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [2607:f8b0:4864:20::632])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cb481f73-db5f-11f0-b15b-2bf370ae4941;
 Wed, 17 Dec 2025 16:48:13 +0100 (CET)
Received: by mail-pl1-x632.google.com with SMTP id
 d9443c01a7336-2a1388cdac3so20239905ad.0
 for <xen-devel@lists.xenproject.org>; Wed, 17 Dec 2025 07:48:13 -0800 (PST)
Received: from dw-tp ([171.76.225.126]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-29eea016ef4sm207003795ad.56.2025.12.17.07.47.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Dec 2025 07:48:11 -0800 (PST)
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
X-Inumbo-ID: cb481f73-db5f-11f0-b15b-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765986492; x=1766591292; darn=lists.xenproject.org;
        h=mime-version:references:message-id:date:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=k7g6szJSc9qKXraE1vzVnFUR39QDkw3X32snO8YJ7Qo=;
        b=T6IDa2yJLf4MIUrjPA+tKRNlbysG4qHGAVGgpFKL5rGcw30KTZo4efvHzBv43pM6Zw
         pT0sSE493Sh+UUOYik4uPCSs3W/kZWYYGETyZ35pBAclzDcF5aRXu+IgaoW1YCw1AWuF
         mYK60YUCvPGXuWJ2QtYjUjG/v8nQSGpLLmeJunNSkcuZ7hdYnk+VSEq6ePCfe/xNfN3y
         Vw6sVduC6rggVYQE3E70UkOpSfGnfnozOemNhwy5hEYpIx6oJUO9U0zYuxJDLXXeh65/
         dFZ9//F27AwyhktlCMXMwK/4kiC3p425yGLsYHDy5yqBHA2ggIQalM//PVBoi3kvThPL
         NGPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765986492; x=1766591292;
        h=mime-version:references:message-id:date:in-reply-to:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k7g6szJSc9qKXraE1vzVnFUR39QDkw3X32snO8YJ7Qo=;
        b=tnHDYIKYe+4Cb1yJyV1PlEKS9CJwszHSkfbIDCAlBP4NpEbE9qEkIRN9Z7k+dob1di
         oelV7yWWsX/MIBl7E0pFAglfOp41vzU41V/D3K2tCv9n3zml8u/aaxGYQn+jFX6ZasV6
         njAgARIs/vTTCU//+D31EFeMa1fi8SM0CHcnOqFjHbnlFRswfroH5O08/CZuaUceicx7
         8ra4qEsNuHoJhUAdqhPRTmZ1PD94Zw84p1b65bEQl18HDnRhQr/y0Ci9Bo/bhHgb0SuG
         UV6Sx4D/7eYBKM7unnECB2LJ0L3KSzBkDKfEARL6MmR3laKtuw2bvELZF940t1gl5yjN
         nJUA==
X-Forwarded-Encrypted: i=1; AJvYcCWWtvRScI4WMhrPlwdRMGV1FrOcS8EFAd5HNhRcUK9W9dfRekYIelzdIoGDRXBfpTBAfuKlxwNrfsQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxbmpiemxaXyBVq2jJ4e31LcEJNvcoKt3Lo8daDmsmh+BU9m4yI
	OqTGiB8ZU0HZ2tCsz29TlrbkX3l3FrpRIT/e/YETO1jT5+y6jEasAmbd
X-Gm-Gg: AY/fxX5F5v++SpNDujZ9HOXBw5V5xD3TdG7EmdzgsVZ5ozfyC8xRUc4VkkSczrX7o52
	Ji9TeVc/wSz7PYVBc4z7wt5vtiGUslnioCveFoNMkafyqoL6Op5PH1RehHLLyziCzwvE8Bg3eQO
	qLGoTcIAPqWbpUo4+jbN9rHvZyxg8QtVn+GJs4MW3aKVXyzWMZgoqXCtsV+B3C043Tni9wLbNSN
	ePPM19UvA2bR/dyaqXbU7+vqTZuRxBw/Britj9NoPzU/AN/ibqvsa41kEz1r6szcGJNr+nvtmoM
	gP/VbnJv7PEcCz8Vxn0pD/CLDBuXPYSoVUvtkJfKfI+raHvqwSGuGEu7WiMoTGfHaV7MmScI2nG
	JENlAlSiLXdfWJUr9sRqaBIdlForyFsnbKFdpe+vbCdVR3gOqmiyHYAwariLQJ5pupBh3DIEkXL
	NrrBCYHgLCiYSZnegb
X-Google-Smtp-Source: AGHT+IGzrC8xHoSohluxl3TB8gicGFdkGjx48ZJyAE+fsjdi1rZJJgtl3YetY/wOPW+z2c4mkNcmfA==
X-Received: by 2002:a17:902:cf03:b0:2a0:bb05:df4f with SMTP id d9443c01a7336-2a0bb05e314mr123346515ad.44.1765986491997;
        Wed, 17 Dec 2025 07:48:11 -0800 (PST)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: Ryan Roberts <ryan.roberts@arm.com>, Kevin Brodsky <kevin.brodsky@arm.com>, Andrew Morton <akpm@linux-foundation.org>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Andreas Larsson <andreas@gaisler.com>, 
	Anshuman Khandual <anshuman.khandual@arm.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, 
	Borislav Petkov <bp@alien8.de>, Catalin Marinas <catalin.marinas@arm.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Dave Hansen <dave.hansen@linux.intel.com>, 
	David Hildenbrand <david@redhat.com>, "David S. Miller" <davem@davemloft.net>, 
	David Woodhouse <dwmw2@infradead.org>, "H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>, 
	Jann Horn <jannh@google.com>, Juergen Gross <jgross@suse.com>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, Michal Hocko <mhocko@suse.com>, 
	Mike Rapoport <rppt@kernel.org>, Nicholas Piggin <npiggin@gmail.com>, 
	Peter Zijlstra <peterz@infradead.org>, Suren Baghdasaryan <surenb@google.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Venkat Rao Bagalkote <venkat88@linux.ibm.com>, 
	Vlastimil Babka <vbabka@suse.cz>, Will Deacon <will@kernel.org>, Yeoreum Yun <yeoreum.yun@arm.com>, 
	linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, 
	sparclinux@vger.kernel.org, xen-devel@lists.xenproject.org, x86@kernel.org
Subject: Re: [PATCH v6 14/14] mm: Add basic tests for lazy_mmu
In-Reply-To: <ca0da7fd-245c-4d52-8f4d-f8fce4717494@arm.com>
Date: Wed, 17 Dec 2025 21:16:14 +0530
Message-ID: <87a4zhkt6h.ritesh.list@gmail.com>
References: <20251215150323.2218608-1-kevin.brodsky@arm.com> <20251215150323.2218608-15-kevin.brodsky@arm.com> <20251216201403.4647a4f9861d3122ee9e90d7@linux-foundation.org> <f9550d22-8810-4145-aaa8-48961f6ea35e@arm.com> <ca0da7fd-245c-4d52-8f4d-f8fce4717494@arm.com>
MIME-Version: 1.0
Content-Type: text/plain

Ryan Roberts <ryan.roberts@arm.com> writes:

> On 17/12/2025 09:26, Kevin Brodsky wrote:
>> On 17/12/2025 05:14, Andrew Morton wrote:
>>> On Mon, 15 Dec 2025 15:03:23 +0000 Kevin Brodsky <kevin.brodsky@arm.com> wrote:
>>>
>>>> Add basic KUnit tests for the generic aspects of the lazy MMU mode:
>>>> ensure that it appears active when it should, depending on how
>>>> enable/disable and pause/resume pairs are nested.
>>> I needed this for powerpc allmodconfig;
>>>
>>> --- a/arch/powerpc/mm/book3s64/hash_tlb.c~mm-add-basic-tests-for-lazy_mmu-fix
>>> +++ a/arch/powerpc/mm/book3s64/hash_tlb.c
>>> @@ -30,6 +30,7 @@
>>>  #include <trace/events/thp.h>
>>>  
>>>  DEFINE_PER_CPU(struct ppc64_tlb_batch, ppc64_tlb_batch);
>>> +EXPORT_SYMBOL_GPL(ppc64_tlb_batch);
>>>  
>>>  /*
>>>   * A linux PTE was changed and the corresponding hash table entry
>>> @@ -154,6 +155,7 @@ void __flush_tlb_pending(struct ppc64_tl
>>>  		flush_hash_range(i, local);
>>>  	batch->index = 0;
>>>  }
>>> +EXPORT_SYMBOL_GPL(__flush_tlb_pending);
>>>  
>>>  void hash__tlb_flush(struct mmu_gather *tlb)
>>>  {
>>> _
>> 
>> Oh indeed I hadn't considered that arch_{enter,leave}_lazy_mmu_mode()
>> refer to those symbols on powerpc... Maybe a bit overkill to export
>> those just for a test module, but I'm not sure there's a good
>> alternative. Forcing LAZY_MMU_MODE_KUNIT_TEST=y is ugly as it would also
>> force KUNIT=y. Alternatively we could depend on !PPC, not pretty either.
>
> Does EXPORT_SYMBOL_IF_KUNIT() help?
>

yes, that make sense. Thanks for the suggestion!
I guess we will need a diff like this in that case -


diff --git a/arch/powerpc/mm/book3s64/hash_tlb.c b/arch/powerpc/mm/book3s64/hash_tlb.c
index fbdeb8981ae7..ec2941cec815 100644
--- a/arch/powerpc/mm/book3s64/hash_tlb.c
+++ b/arch/powerpc/mm/book3s64/hash_tlb.c
@@ -25,11 +25,12 @@
 #include <asm/tlb.h>
 #include <asm/bug.h>
 #include <asm/pte-walk.h>
-
+#include <kunit/visibility.h>
 
 #include <trace/events/thp.h>
 
 DEFINE_PER_CPU(struct ppc64_tlb_batch, ppc64_tlb_batch);
+EXPORT_SYMBOL_IF_KUNIT(ppc64_tlb_batch);
 
 /*
  * A linux PTE was changed and the corresponding hash table entry
@@ -154,6 +155,7 @@ void __flush_tlb_pending(struct ppc64_tlb_batch *batch)
                flush_hash_range(i, local);
        batch->index = 0;
 }
+EXPORT_SYMBOL_IF_KUNIT(__flush_tlb_pending);
 
 void hash__tlb_flush(struct mmu_gather *tlb)
 {
diff --git a/mm/tests/lazy_mmu_mode_kunit.c b/mm/tests/lazy_mmu_mode_kunit.c
index 2720eb995714..340d7cda9096 100644
--- a/mm/tests/lazy_mmu_mode_kunit.c
+++ b/mm/tests/lazy_mmu_mode_kunit.c
@@ -69,3 +69,4 @@ kunit_test_suite(lazy_mmu_mode_test_suite);
 
 MODULE_DESCRIPTION("Tests for the lazy MMU mode");
 MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS("EXPORTED_FOR_KUNIT_TESTING");


-ritesh

