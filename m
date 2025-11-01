Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F6ADC27DC2
	for <lists+xen-devel@lfdr.de>; Sat, 01 Nov 2025 13:15:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1155007.1484631 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vFAVd-0001z5-Gf; Sat, 01 Nov 2025 12:15:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1155007.1484631; Sat, 01 Nov 2025 12:15:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vFAVd-0001wM-Dw; Sat, 01 Nov 2025 12:15:05 +0000
Received: by outflank-mailman (input) for mailman id 1155007;
 Sat, 01 Nov 2025 12:15:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VYHd=5J=redhat.com=david@srs-se1.protection.inumbo.net>)
 id 1vFAVc-0001is-3Q
 for xen-devel@lists.xenproject.org; Sat, 01 Nov 2025 12:15:04 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 64202a82-b71c-11f0-980a-7dc792cee155;
 Sat, 01 Nov 2025 13:15:02 +0100 (CET)
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-203-i4jvVQ_ONFiATUoN_lJO1A-1; Sat, 01 Nov 2025 08:14:59 -0400
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-4770c37331fso22931695e9.3
 for <xen-devel@lists.xenproject.org>; Sat, 01 Nov 2025 05:14:59 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f3f:4b00:ee13:8c22:5cc5:d169?
 (p200300d82f3f4b00ee138c225cc5d169.dip0.t-ipconnect.de.
 [2003:d8:2f3f:4b00:ee13:8c22:5cc5:d169])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429c9737830sm2218179f8f.16.2025.11.01.05.14.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 01 Nov 2025 05:14:57 -0700 (PDT)
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
X-Inumbo-ID: 64202a82-b71c-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1761999301;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=Wcrewv7OssaEm3gyvMk1iF/ClvQjL5UKQAK3UbLbS48=;
	b=fKZuXQk8rqZJ/qIysx25x3joyBTIxbXB8XcPFi4J9N2Yj5njYHqulAOsRv8iz09dipV9LP
	4J9HT7fN3PKAnu21VyLqhJLDFlpJyFJf3Yp6Vc4owm6inAA4ysdfUEsA8Ofo6Xkz/qsUjo
	GDmy51tKmV2b5sYfro/FmAi3rEkEG3w=
X-MC-Unique: i4jvVQ_ONFiATUoN_lJO1A-1
X-Mimecast-MFC-AGG-ID: i4jvVQ_ONFiATUoN_lJO1A_1761999299
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761999298; x=1762604098;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Wcrewv7OssaEm3gyvMk1iF/ClvQjL5UKQAK3UbLbS48=;
        b=C6YbaKuLB1bKZQvo7oTSIDyFme2k2gFrNsVWUjC6m2rwiA4mR8AVVK0EEd4G/EqMcH
         GdXFMMBRTjW2DdbvAuNRdl1QM42NQ82JAWz/h7q6T9XMbwQjkBUAra9zD6rGUHDfEjgR
         1aBuJJzDixPCqSGkeHoovcQ4e3NVyUmnxkqL+DpH3OaGr7HbhTDgTfxCh9vhLD+tbrM+
         vEftwsSOa2mOXKbmGJ/tT5R/V0yT12tki/JHhGBeyV5oxJdeqzzewPfz0i3ZYXW8ga5k
         OJHnlkQAEkET3pukz3m0SLhfxmiJQRD5BNuvOySkfi8QA9JW9s0JMKV0ohWwBapCIyfl
         Aamw==
X-Forwarded-Encrypted: i=1; AJvYcCXtLzUhamf2D8udX2QjB+FH5nWX645jpgn3ymfVGlxu5WAq9mt5C/1i7+cSD47p4ETJaXb1T8T4ew8=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw3eH6K9KXZb8OCwk+YgRk2VZQJpJD4jDsyVYq1C+zMRIeFzEwy
	npDnx2qAoHODTnWr+PQYMgekMgWy7c3v69M4E8/kCvH1Zu7IqZUBqNsAe9LFI3kSlYsgmCUZVQI
	394yFnzlHgLfFeY3FvUTFMj7tC0MgKEAQ7a8Bxrwl2fAeYHqaO6ohy2FiBvbppjgGlv98
X-Gm-Gg: ASbGncvA/YDeDusxVUur7DlVYgvFx3ufxMcRjfJppHsOtUeBwcYLtJTPMP4I6bPHtdu
	6F9bZ4P2UtDb4JeRqAh+wMFMhw8aDVskwberod2BPU/Q9i1MxbA13rw13VAImU9K+y8i6bcScgI
	SjE4MJZ4aZAW2bknseAEnGchN+dVMZx7lZHqi7r8rwm2MpXMbBQ9gX+39NDpBAgLOMJlfstYYMO
	SK0348LPPvJq26GKH2dJnuk+OUCj9FM9mHMFgZcpAWsL0qvTnVkCwf0uBjmGA9bngdpaAf0rrtN
	9XAvprF5kWFU9Rl612UL8ktx3q8YoXqqXnFSkpt9QDRutb8jfiwYL21OmvPa/7IHj1/mGB44Y1v
	1oYx5qL+1ztUUCsnAwMXgyS0F/+9wegz5dt0wul5rDLZPYlWfHHfBZFfwdgcr26dulvakkqclHV
	Z0PdKmRwaldkSkcRcLzTDCfN2fq/c=
X-Received: by 2002:a05:600c:64c5:b0:46e:37a7:48d1 with SMTP id 5b1f17b1804b1-477308aad21mr78192345e9.34.1761999298487;
        Sat, 01 Nov 2025 05:14:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGpoAFpg0euM+1PM4mK/KRSGv+bWD5NPrehon1oy/C0JEyB0MU730bCFNURR8O9btag493PXg==
X-Received: by 2002:a05:600c:64c5:b0:46e:37a7:48d1 with SMTP id 5b1f17b1804b1-477308aad21mr78192025e9.34.1761999298113;
        Sat, 01 Nov 2025 05:14:58 -0700 (PDT)
Message-ID: <15f832f9-b95d-4b08-8467-21a27cbf8450@redhat.com>
Date: Sat, 1 Nov 2025 13:14:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 04/12] sparc/mm: implement arch_flush_lazy_mmu_mode()
To: Kevin Brodsky <kevin.brodsky@arm.com>, linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>,
 Andreas Larsson <andreas@gaisler.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Borislav Petkov
 <bp@alien8.de>, Catalin Marinas <catalin.marinas@arm.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 "David S. Miller" <davem@davemloft.net>,
 David Woodhouse <dwmw2@infradead.org>, "H. Peter Anvin" <hpa@zytor.com>,
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
References: <20251029100909.3381140-1-kevin.brodsky@arm.com>
 <20251029100909.3381140-5-kevin.brodsky@arm.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 qIws/H2t
In-Reply-To: <20251029100909.3381140-5-kevin.brodsky@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ZCKOZI_z00QHvHRwfRyfDYrkQzsDvSFJ9UALHUKYcqI_1761999299
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 29.10.25 11:09, Kevin Brodsky wrote:
> Upcoming changes to the lazy_mmu API will cause
> arch_flush_lazy_mmu_mode() to be called when leaving a nested
> lazy_mmu section.
> 
> Move the relevant logic from arch_leave_lazy_mmu_mode() to
> arch_flush_lazy_mmu_mode() and have the former call the latter.
> 
> Note: the additional this_cpu_ptr() on the
> arch_leave_lazy_mmu_mode() path will be removed in a subsequent
> patch.
> 
> Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
> ---

Acked-by: David Hildenbrand <david@redhat.com>

-- 
Cheers

David / dhildenb


