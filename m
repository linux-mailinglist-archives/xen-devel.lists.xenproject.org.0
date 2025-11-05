Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 90BEEC34F24
	for <lists+xen-devel@lfdr.de>; Wed, 05 Nov 2025 10:49:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1156070.1485378 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vGa8y-0005Ip-GU; Wed, 05 Nov 2025 09:49:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1156070.1485378; Wed, 05 Nov 2025 09:49:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vGa8y-0005G5-B8; Wed, 05 Nov 2025 09:49:32 +0000
Received: by outflank-mailman (input) for mailman id 1156070;
 Wed, 05 Nov 2025 09:49:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gPfi=5N=gmail.com=ritesh.list@srs-se1.protection.inumbo.net>)
 id 1vGa8w-0005Fz-7e
 for xen-devel@lists.xenproject.org; Wed, 05 Nov 2025 09:49:30 +0000
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com
 [2607:f8b0:4864:20::52b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b7a4a58a-ba2c-11f0-980a-7dc792cee155;
 Wed, 05 Nov 2025 10:49:28 +0100 (CET)
Received: by mail-pg1-x52b.google.com with SMTP id
 41be03b00d2f7-b996c8db896so3614683a12.3
 for <xen-devel@lists.xenproject.org>; Wed, 05 Nov 2025 01:49:27 -0800 (PST)
Received: from dw-tp ([171.76.85.117]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-ba1f765f148sm5030694a12.24.2025.11.05.01.49.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Nov 2025 01:49:25 -0800 (PST)
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
X-Inumbo-ID: b7a4a58a-ba2c-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762336166; x=1762940966; darn=lists.xenproject.org;
        h=mime-version:references:message-id:date:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=KSkImeW26wxHMAXfbe7WvrT7t//6KWteMn9Q9gZQJTU=;
        b=biIpEihU1kOtXMvnGqLv121bCWWdXpCz6uXQZEoqDL4L+fjlOnFFZ2zwcR1srHP50y
         shfivhmOgzJkiZtcGmCgT5GWCtiIe5+dFyOHzX6ONj0h7Lc5fWzASK/ZAlLqylP1uBJX
         PwlJvXgctPSL4HHphyMsAU49v/aqKxZkroc1ntXzVRwKgkkl9Dfr9LxQsTFmBuLC/nIQ
         Ha5pjlk/eof0tgexd6fEMf34wmoRqrzgbu3fUdfeSzsqXzYJ9NZp5mSjU9d2f1//osFh
         AkBaZnisPXAaPPzUqQX4nqrlLDIIUhu8W4mo4qc073nlTAfom0JBiiD7iKbG4jSvjKHH
         IyaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762336166; x=1762940966;
        h=mime-version:references:message-id:date:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KSkImeW26wxHMAXfbe7WvrT7t//6KWteMn9Q9gZQJTU=;
        b=KgbBA/c6+q25CK1X+bgZDXzPZzDI9nUTscqIVvs/QSNajSXdNGQqYaboDDeFKmoS2a
         gzqH0vlDZKL/mlWe22V2owWev7BKY5NWecPIqVl+tnY+pbRz54kUHc9UKaWc7R/3ZfT/
         LguOTKqh8bEps8fk1UrLdkBkblEtF3jHmzG8FupgqvZMCZYSfIzLnqzNmxBd9W3inDq1
         UvODRAr2LJ3sEDvB5aLMTjWAVTB5TeykSxXNxE2htNcaejZ7b0dz1Tuv5/orH63H0jYi
         oWpU/IihK6DlPsox9OSHfLHZNgYZz/KyX7C25QJITyJdvZGrs15kJlJp1EYqu/zAO3Nx
         3reg==
X-Forwarded-Encrypted: i=1; AJvYcCWPo6YxpwuREYOicSaaIJSYLIh0NBt/HKsHZ8g5dbwe4wElokSo7aWNQRecK0Wtsw3+CBSQUeK0/OY=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yysg2X8f7gjju7FiC38IqW4RQD3IjZytpTR7MAUSoOrba94am1Z
	RdHmWvnhLfY/cExA7B65qX/o/Y2i5NfnigUaqVQZXzttWztsAMULLwkz
X-Gm-Gg: ASbGncteGd1kAhNjCMTvAj31MXy7/Iw0oVK8Xfs60tRFwf2Dw9ftteAjd/Jp35PWdfP
	5EXL1LyhWseKjC2+XZVfwGQzjGgX7inYEm1VoWk63cnUmPGvZaQvSEAHJhHKd3wLJuUq6MJ4QVK
	dyYRVS5OXZLhz96B7rycKuF69HZ/UFqUZ9uTLRvVzfJGoNq9A8WKaXNuIyzTyQUN5INoRz3Sq8+
	kap5dPcJavErFERG5xUqaN+jL8Qzq/72NOpOUa0Vgx1BbfUcU8lNUW7YiRb+v/LY3Ugvf6Cxqiu
	299FDBBrcOnhrBxxE9siuv+Yx7tuA1dYnQgWSF8ekl8c9VWNAH69TjKWsRNkEY9BMPWBy9ZsHIR
	a1Q6TqkwyW+PrJYvw5iOtSyc4YPjduHyVpxdM9gSE6mtq0y9FsosbQcSIl9DRj+/MCa/T9Q==
X-Google-Smtp-Source: AGHT+IGvXEix8Ale69u5jY13ojKwbWl3rHLnPywsClHEKGLTCQBX8z03LTjZkKtfW5wInDfRAomLmQ==
X-Received: by 2002:a05:6a20:7283:b0:343:88b4:a722 with SMTP id adf61e73a8af0-34f862ff4a8mr3711914637.52.1762336166397;
        Wed, 05 Nov 2025 01:49:26 -0800 (PST)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: Kevin Brodsky <kevin.brodsky@arm.com>, linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org, Kevin Brodsky <kevin.brodsky@arm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Andreas Larsson <andreas@gaisler.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, 
	Borislav Petkov <bp@alien8.de>, Catalin Marinas <catalin.marinas@arm.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Dave Hansen <dave.hansen@linux.intel.com>, 
	David Hildenbrand <david@redhat.com>, "David S. Miller" <davem@davemloft.net>, 
	David Woodhouse <dwmw2@infradead.org>, "H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>, 
	Jann Horn <jannh@google.com>, Juergen Gross <jgross@suse.com>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, Michal Hocko <mhocko@suse.com>, 
	Mike Rapoport <rppt@kernel.org>, Nicholas Piggin <npiggin@gmail.com>, 
	Peter Zijlstra <peterz@infradead.org>, Ryan Roberts <ryan.roberts@arm.com>, 
	Suren Baghdasaryan <surenb@google.com>, Thomas Gleixner <tglx@linutronix.de>, Vlastimil Babka <vbabka@suse.cz>, 
	Will Deacon <will@kernel.org>, Yeoreum Yun <yeoreum.yun@arm.com>, 
	linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, 
	sparclinux@vger.kernel.org, xen-devel@lists.xenproject.org, x86@kernel.org
Subject: Re: [PATCH v4 09/12] powerpc/mm: replace batch->active with in_lazy_mmu_mode()
In-Reply-To: <20251029100909.3381140-10-kevin.brodsky@arm.com>
Date: Wed, 05 Nov 2025 15:10:20 +0530
Message-ID: <87ldkk4y2j.ritesh.list@gmail.com>
References: <20251029100909.3381140-1-kevin.brodsky@arm.com> <20251029100909.3381140-10-kevin.brodsky@arm.com>
MIME-Version: 1.0
Content-Type: text/plain

Kevin Brodsky <kevin.brodsky@arm.com> writes:

> A per-CPU batch struct is activated when entering lazy MMU mode; its
> lifetime is the same as the lazy MMU section (it is deactivated when
> leaving the mode). Preemption is disabled in that interval to ensure
> that the per-CPU reference remains valid.
>
> The generic lazy_mmu layer now tracks whether a task is in lazy MMU
> mode. We can therefore use the generic helper in_lazy_mmu_mode()
> to tell whether a batch struct is active instead of tracking it
> explicitly.
>
> Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
> ---
>  arch/powerpc/include/asm/book3s/64/tlbflush-hash.h | 9 ---------
>  arch/powerpc/mm/book3s64/hash_tlb.c                | 2 +-
>  2 files changed, 1 insertion(+), 10 deletions(-)
>

This looks good to me.

Reviewed-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>

