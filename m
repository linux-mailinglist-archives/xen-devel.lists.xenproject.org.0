Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C13CCC0FDE
	for <lists+xen-devel@lfdr.de>; Tue, 16 Dec 2025 06:18:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1187615.1508966 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vVNQi-0002oU-S4; Tue, 16 Dec 2025 05:17:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1187615.1508966; Tue, 16 Dec 2025 05:17:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vVNQi-0002lQ-M5; Tue, 16 Dec 2025 05:17:00 +0000
Received: by outflank-mailman (input) for mailman id 1187615;
 Tue, 16 Dec 2025 05:16:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4lhm=6W=gmail.com=ritesh.list@srs-se1.protection.inumbo.net>)
 id 1vVNQh-0002lK-Gu
 for xen-devel@lists.xenproject.org; Tue, 16 Dec 2025 05:16:59 +0000
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com
 [2607:f8b0:4864:20::42e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7014f142-da3e-11f0-9cce-f158ae23cfc8;
 Tue, 16 Dec 2025 06:16:56 +0100 (CET)
Received: by mail-pf1-x42e.google.com with SMTP id
 d2e1a72fcca58-7ba55660769so3234708b3a.1
 for <xen-devel@lists.xenproject.org>; Mon, 15 Dec 2025 21:16:56 -0800 (PST)
Received: from dw-tp ([203.81.242.64]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-c0c25a87487sm14064659a12.7.2025.12.15.21.16.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Dec 2025 21:16:53 -0800 (PST)
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
X-Inumbo-ID: 7014f142-da3e-11f0-9cce-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765862214; x=1766467014; darn=lists.xenproject.org;
        h=mime-version:references:message-id:date:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=xjD+cNbyJGOMAKpBo5e8LJBh9aFpu4/6uuuLCwZXOF0=;
        b=ZUNvAxA/vJRzB2TXHETPULp2O1/+D2Kf4cRC+JA0JZSsRilCh548D3/sCbzW25Agh+
         SlE1NDxzphXoQbGf1UrwrnYLVtu0ijh6uD6eMb+2yBAIvASX4ss6ID+hNGgSFD56Vhne
         MDwNRkjFWuMxwgslVhT5qCq6vANxIO/xmwF0amz+SUxm8BPE7ZKNNETEmO0guXcRp58K
         cdTfhMe6MpooyEEfxQedpSt8V5R5S5/H2r/IFWLMYhxqUmoWTnp6yMWa6Pk+C3PXRcl5
         K0edBnJCWt4DFFlHBYMWWq5y2UJwykD8kI/Vz2zUl9c7AodPeM3AF5GQqttHreRj003P
         x46w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765862214; x=1766467014;
        h=mime-version:references:message-id:date:in-reply-to:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xjD+cNbyJGOMAKpBo5e8LJBh9aFpu4/6uuuLCwZXOF0=;
        b=J7Ho8d9eNypBoJT1SYCk3TacAjfccmXL4cDu2pKs20muMIMhSc2YhNoRf0gXdioOba
         TmjgKVDKMM/Fr50bwS3Y3Awka92jErUzqpNsPypbBf1Own6BP1i8qD+UwELBIogpmkN/
         DzbR0jcO9JiT0mDjg0s+mxPx8u1BrEVIKnJiMNKR5GS/Xt0seS6yS1vPwPVeP0qPR0bB
         rWlF7JFTgi/tJD+VSjgq78BGYihhPDD9aBmUHQDOCxj4mNJfOYkhpAbf5HMqTZC10Ow6
         myHN2RCSxxRa+cg+51fvxLSc3CG+pl1jVq4dstimJmspFNLScXqglJ8CCmNE1VRwUere
         DeOg==
X-Forwarded-Encrypted: i=1; AJvYcCWQ5wESi2S81YoIP5bczmUUzpnjUIrp1P1wr7fH5l1yQiWU1yZ+iA+aacDczowAptyrA7s7wmFoe4M=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw5CV1NQBVSLwvhjBPurANIoixCOPdcGdXKkp4ZNIx0ZIjJzG4L
	TKGOl5GQfzQR7xUarrYyGR9Peff6cdVkSid84sSGn+9GRftAQu8QT6OA
X-Gm-Gg: AY/fxX5Dtp5NOmg5c8/jXx2PYQ4KGlrD2bjNZ9ipByizhwnRXHR2RVB3zKLdh0yn/r+
	pSHtj9gAGWZxUlmqk96X2Ij5NTvcro4MASAyHSv5dcNooS4yd9dx0uBJ7fet3LP/i2JILx5KS9X
	YBJ/D+vNoH0h2tLaXXoAwypwba20gOZwJNj3rGQaf5pCOghlLHMRjtwY1+qGMdY5xjY2wceET0G
	l14NI/z/qBe/3UqUKpbvYz+bN7JywhhWTtysTt3CxOFJYu85itekDPXB/ryzhypNDZ8C7iXoNEe
	LvtR1zJ60b4SDzxttSkQuKbqz/x9FTH6eJFD5voLTHvK0HR+T5L5RMM7a0mBp1CoIYulzxloyH1
	SmYGQsCYEn8K/lfjF3SqUUgAJ9M0LDpNYM3K1dOYVjEb/lZ7eVDpWXMkHglPB1tiJxyhf5HeXBp
	toxrMB
X-Google-Smtp-Source: AGHT+IFRNBpu36xO7SS++RmJSf+Yd0YivNXXnhzhZN3Px6CmR0fp7AX2KZRojw083jfNpLsrb718Lg==
X-Received: by 2002:a05:6a20:5491:b0:366:14b0:4b05 with SMTP id adf61e73a8af0-369afc00407mr13380900637.65.1765862214371;
        Mon, 15 Dec 2025 21:16:54 -0800 (PST)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: Kevin Brodsky <kevin.brodsky@arm.com>, linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org, Kevin Brodsky <kevin.brodsky@arm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Andreas Larsson <andreas@gaisler.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Anshuman Khandual <anshuman.khandual@arm.com>, 
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
	Thomas Gleixner <tglx@linutronix.de>, Venkat Rao Bagalkote <venkat88@linux.ibm.com>, 
	Vlastimil Babka <vbabka@suse.cz>, Will Deacon <will@kernel.org>, Yeoreum Yun <yeoreum.yun@arm.com>, 
	linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, 
	sparclinux@vger.kernel.org, xen-devel@lists.xenproject.org, x86@kernel.org
Subject: Re: [PATCH v6 03/14] powerpc/mm: implement arch_flush_lazy_mmu_mode()
In-Reply-To: <20251215150323.2218608-4-kevin.brodsky@arm.com>
Date: Tue, 16 Dec 2025 10:44:45 +0530
Message-ID: <87345b6m9m.ritesh.list@gmail.com>
References: <20251215150323.2218608-1-kevin.brodsky@arm.com> <20251215150323.2218608-4-kevin.brodsky@arm.com>
MIME-Version: 1.0
Content-Type: text/plain

Kevin Brodsky <kevin.brodsky@arm.com> writes:

> Upcoming changes to the lazy_mmu API will cause
> arch_flush_lazy_mmu_mode() to be called when leaving a nested
> lazy_mmu section.
>
> Move the relevant logic from arch_leave_lazy_mmu_mode() to
> arch_flush_lazy_mmu_mode() and have the former call the latter. The
> radix_enabled() check is required in both as
> arch_flush_lazy_mmu_mode() will be called directly from the generic
> layer in a subsequent patch.
>
> Note: the additional this_cpu_ptr() and radix_enabled() calls on the
> arch_leave_lazy_mmu_mode() path will be removed in a subsequent
> patch.
>
> Acked-by: David Hildenbrand <david@redhat.com>
> Tested-by: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
> Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
> ---
>  .../powerpc/include/asm/book3s/64/tlbflush-hash.h | 15 ++++++++++++---
>  1 file changed, 12 insertions(+), 3 deletions(-)

Sorry I was away for a while. 

Thanks for taking care of the radix path as we had discussed previously
here [1]. 

[1]: https://lore.kernel.org/all/87jz044xn4.ritesh.list@gmail.com/

The change looks good to me. So, please feel free to add:

Reviewed-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>

