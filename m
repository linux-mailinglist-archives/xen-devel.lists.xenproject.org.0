Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E2DDCC0354A
	for <lists+xen-devel@lfdr.de>; Thu, 23 Oct 2025 22:11:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1149689.1481259 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vC1e5-0005xr-Vz; Thu, 23 Oct 2025 20:10:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1149689.1481259; Thu, 23 Oct 2025 20:10:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vC1e5-0005vi-TG; Thu, 23 Oct 2025 20:10:49 +0000
Received: by outflank-mailman (input) for mailman id 1149689;
 Thu, 23 Oct 2025 20:10:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=MccR=5A=redhat.com=david@srs-se1.protection.inumbo.net>)
 id 1vC1e4-0005vb-6z
 for xen-devel@lists.xenproject.org; Thu, 23 Oct 2025 20:10:48 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5c6a40ed-b04c-11f0-9d15-b5c5bf9af7f9;
 Thu, 23 Oct 2025 22:10:47 +0200 (CEST)
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-284-17Rt_d00PyK_kZ6BZMNE3Q-1; Thu, 23 Oct 2025 16:10:44 -0400
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-475c422fd70so7478675e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 23 Oct 2025 13:10:44 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f4e:3200:c99d:a38b:3f3a:d4b3?
 (p200300d82f4e3200c99da38b3f3ad4b3.dip0.t-ipconnect.de.
 [2003:d8:2f4e:3200:c99d:a38b:3f3a:d4b3])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429898cceebsm5532934f8f.37.2025.10.23.13.10.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Oct 2025 13:10:42 -0700 (PDT)
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
X-Inumbo-ID: 5c6a40ed-b04c-11f0-9d15-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1761250246;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=vF8Hb3hnoXfLSdgr9uXEesJUum0OfpN/YlQIs62F7QU=;
	b=h/LiE1VLs76LoKbFzr32dVFOaHAicbQTFrMx7VjHQvFzjSLnZZlN3mCT7kVMnKE+2Ji+6Q
	Zk8ofKlt4iffiKUoeL8WbmY5j9rEe1mqHBeG5regsDPXCfT/Rs14xBgZMTCK7Ihlc7xOPE
	E92aNOSvYX1DuHMegPx3Es8RSpikEQY=
X-MC-Unique: 17Rt_d00PyK_kZ6BZMNE3Q-1
X-Mimecast-MFC-AGG-ID: 17Rt_d00PyK_kZ6BZMNE3Q_1761250243
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761250243; x=1761855043;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vF8Hb3hnoXfLSdgr9uXEesJUum0OfpN/YlQIs62F7QU=;
        b=xPpHPVMc+keshkY/6/i5riNCNH9uz/Atk8lJrZGZ2j0fBG1GCOdRIuWQOa4fkjRp19
         4qydBy9U0eWcw7ltT/bDhc4Oy7J/9XYCoyCJ348aj8DJ53a/dx3EGpr5obGsKixyotzT
         /Wx5OMaCsNCespZu5aQy7OS/RKIoAranOmopmqjN8I4ErmXoaY6kn+lfKm1JrybgWxdA
         2Xn9VzLuOU/DPj3gSmPv8wJbP0pHoy+uyqjDJOVu0ADVo7oTVyIPQ9kaIfyUx7hOVcqw
         AJ+Os7rdkZ+ZVtDsE1PW9N5/53J8jHlMe5SEQINB8kJ8Jdm2pUXNWfmMJoE5tHzBvafU
         lLlg==
X-Forwarded-Encrypted: i=1; AJvYcCVfKD2OHvI0ZZb2UV+IAh+jbYylb1dmSc1IccRjc1ju5KtwbvX8mBSNyxmwHE7Y+LT2ZREZ1PJJJFg=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy6oJUBiKbpeYmp54/6D/VgVgRX7hLtkltzpocJznYKm6wGNBZV
	qtFqfokQpfEMioVeZNglbSsPT6Fp97Dw2+zBtBiaICdf5ARFIeoy1kqORzPM1RW/lcEiUTtBkpP
	RqhvQxRxGKcnQJa6rCWV8YwnAX74l8mpg9npvek/Y4N3b36o3hgrW6imEhMa+yy5b/tvU
X-Gm-Gg: ASbGncvszg+GUI3mU6FpocIL1VhunwttsfZwGGslJHMCoA6tlfaGBFB7EN4ay528Hs+
	C0yyDD8YwaoZOeqYR1TDh0S4kZsVFWOkML07kxTzyglek9DlqZ6+JS7Hv8IKLWG4/9kPQfEARtx
	Kaqf9w3BLXQkGqD5FvhbRmaZ/4X1twVOdzKob1FUrWP68+lHpfeijXEjJuVGSAsjQSwm0ASESrX
	6xG1duaWDnfQ1uEup2KerkXC41DvyHD0m9cQBv0dGMr3gAx3jM72Dkv0MflOn401cLRlLLHo9U3
	kIbx0CLc5JfvpYUxCHKxaGgFfAN0y7vh0nbwk8TMC6/2z4h9cYiyhVrjlgDDgKRsTc9itEslTKj
	7Zy+teQXZXv0DDD+bnAvm66Z0Py9IMFyJ4Yc/O34D4ppnryx3CMnZzztdL+dpm3lS5cV/XvpLo8
	OjJGNVAJxUmKWZA5tPae1HFoavnrA=
X-Received: by 2002:a05:600c:6291:b0:471:a43:123f with SMTP id 5b1f17b1804b1-471178a6882mr200628425e9.9.1761250243297;
        Thu, 23 Oct 2025 13:10:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEznsO/mZG7bXXGeVpf9lUsRK7DtoSEnI7rqyr8WVIAgGuBjLQ7Sb3p9c9Pj2m7/SEml5RHBQ==
X-Received: by 2002:a05:600c:6291:b0:471:a43:123f with SMTP id 5b1f17b1804b1-471178a6882mr200628295e9.9.1761250242917;
        Thu, 23 Oct 2025 13:10:42 -0700 (PDT)
Message-ID: <3d6bba2d-9739-41d0-8f3a-f8b11620c33f@redhat.com>
Date: Thu, 23 Oct 2025 22:10:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 13/13] mm: introduce arch_wants_lazy_mmu_mode()
To: Kevin Brodsky <kevin.brodsky@arm.com>, linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>,
 Andreas Larsson <andreas@gaisler.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Borislav Petkov
 <bp@alien8.de>, Catalin Marinas <catalin.marinas@arm.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 "David S. Miller" <davem@davemloft.net>, "H. Peter Anvin" <hpa@zytor.com>,
 Ingo Molnar <mingo@redhat.com>, Jann Horn <jannh@google.com>,
 Juergen Gross <jgross@suse.com>, "Liam R. Howlett"
 <Liam.Howlett@oracle.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Michal Hocko <mhocko@suse.com>,
 Mike Rapoport <rppt@kernel.org>, Nicholas Piggin <npiggin@gmail.com>,
 Peter Zijlstra <peterz@infradead.org>, Ryan Roberts <ryan.roberts@arm.com>,
 Suren Baghdasaryan <surenb@google.com>, Thomas Gleixner
 <tglx@linutronix.de>, Vlastimil Babka <vbabka@suse.cz>,
 Will Deacon <will@kernel.org>, Yeoreum Yun <yeoreum.yun@arm.com>,
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 sparclinux@vger.kernel.org, xen-devel@lists.xenproject.org, x86@kernel.org
References: <20251015082727.2395128-1-kevin.brodsky@arm.com>
 <20251015082727.2395128-14-kevin.brodsky@arm.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 qIws/H2t
In-Reply-To: <20251015082727.2395128-14-kevin.brodsky@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 6AZQW4GNRISbOzf_of-gdEGKRB2sWcVyF0Rihm-8ifI_1761250243
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 15.10.25 10:27, Kevin Brodsky wrote:
> powerpc decides at runtime whether the lazy MMU mode should be used.
> 
> To avoid the overhead associated with managing
> task_struct::lazy_mmu_state if the mode isn't used, introduce
> arch_wants_lazy_mmu_mode() and bail out of lazy_mmu_mode_* if it
> returns false. Add a default definition returning true, and an
> appropriate implementation for powerpc.
> 
> Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
> ---
> This patch seemed like a good idea to start with, but now I'm not so
> sure that the churn added to the generic layer is worth it.

Exactly my thoughts :)

I think we need evidence that this is really worth it for optimizing out 
basically a counter update on powerpc.

-- 
Cheers

David / dhildenb


