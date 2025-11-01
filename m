Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6425AC27DB3
	for <lists+xen-devel@lfdr.de>; Sat, 01 Nov 2025 13:14:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1154997.1484613 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vFAV8-0001Dj-Tc; Sat, 01 Nov 2025 12:14:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1154997.1484613; Sat, 01 Nov 2025 12:14:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vFAV8-0001Ac-QK; Sat, 01 Nov 2025 12:14:34 +0000
Received: by outflank-mailman (input) for mailman id 1154997;
 Sat, 01 Nov 2025 12:14:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VYHd=5J=redhat.com=david@srs-se1.protection.inumbo.net>)
 id 1vFAV7-0001AW-17
 for xen-devel@lists.xenproject.org; Sat, 01 Nov 2025 12:14:33 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5132833d-b71c-11f0-9d16-b5c5bf9af7f9;
 Sat, 01 Nov 2025 13:14:30 +0100 (CET)
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-384-j2sJ_wb0P3qQ-HsRoUj4Zg-1; Sat, 01 Nov 2025 08:14:26 -0400
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-475dca91610so17204645e9.3
 for <xen-devel@lists.xenproject.org>; Sat, 01 Nov 2025 05:14:26 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f3f:4b00:ee13:8c22:5cc5:d169?
 (p200300d82f3f4b00ee138c225cc5d169.dip0.t-ipconnect.de.
 [2003:d8:2f3f:4b00:ee13:8c22:5cc5:d169])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429c10ff584sm9569867f8f.2.2025.11.01.05.14.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 01 Nov 2025 05:14:24 -0700 (PDT)
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
X-Inumbo-ID: 5132833d-b71c-11f0-9d16-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1761999269;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=o048ati210LDdtQS+FOPO4jSMwtVqN57n5BUaVz6yTU=;
	b=DSwOTGalgWiWoY6Sd70gYiI+Dx7Pdx4cRI3IpmLZgS6b4a0C2O5qmWJr8/uPyFS7WkAlQP
	tHnAUj3TtStOrwecAD89zMcRjpSBI+pq2I+uGErPx8hpg6OpC2eX3SB+DpA2T3j6xqIkel
	+Pb/pOfv6KlVkNWfCwxBYbvXMZigK7c=
X-MC-Unique: j2sJ_wb0P3qQ-HsRoUj4Zg-1
X-Mimecast-MFC-AGG-ID: j2sJ_wb0P3qQ-HsRoUj4Zg_1761999265
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761999265; x=1762604065;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o048ati210LDdtQS+FOPO4jSMwtVqN57n5BUaVz6yTU=;
        b=Ncj7j611L56+1H2Xv/8wZSTyC1yC1XLflNPjxXL8bNRZR4watdu7rOh2l2Zhsxo4Rs
         GZqyNxRMeGKBz0wosCZFmBpSL9Gw0fyX0zSVR+cPa4uFE1ODSZhQJ5jqfCOkY+usJ8fj
         iLkOkayYb5/a4+tLV2mYjaOid0IwUVxrkRZepm9paiOe/uxFpIuOhvlOLQ+iVnutQPYx
         DjuC7RIOMgexhXpxT946wDpggKfeANW3nBcrjWWjRBYreIk4urViU2pnbNN576WaLE1U
         ZnPb4YTomFiMYg4IqZR6o0WTL43vhbgaMM1l+6I5nnA2Z5syYUl7M7XcNnVzN3RCeq1z
         54cw==
X-Forwarded-Encrypted: i=1; AJvYcCWdjJrSxXbO6mQZDT5KPuq0PZ3qMweQnaaDStYFK98fB4HIHrNWJCypsi3iINShH3i0wqsPfaICsBc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwTepWVKZ/5dMnewyap1CCuEaNpYb5LzpemI9uSt27ffmRzIz3j
	RrMlNJ+sWnHA9owQA3dWPAD9LeNAzNiR7zXDJbKqau65N1lz6lRAfD6mJ/uxKy7xtvZ91YQkFlp
	nRthleLoLuz7xeDB/APAJsa/7fqlsUp4MyXEl5Asjt2XxlGKluXZFuUIB+TfU/iuwaIn/
X-Gm-Gg: ASbGncvRfEax45q6I/7F80Hs6kfengTINZwCAYEVc+U6ZdGesru5cZO7xDstfPTiqFI
	FTfVHQnx6L+gFfefJztAJB0jqoPBx7h35cD936d1gzcHOcIm9Q3A4IRmMox9QH7GdF4nzw8SQFk
	2RFo26v5ZOr2d2KdxxtDXByEbG6aSo6awaCjjn1mUN/YzIp8YgxFTTpSNDN/0zVtdG4oyDEIpet
	lfJ/swmwYZhHmFyQnxv0pu5RDpnMv6ayu6lJ//qISY/DQeeu1Opigaqx4Km0fHncs7GiOBWkpTy
	hotKpJ/6dJKQexCmjtjXVsTJOcThlObdOlBFUaYV/Fpj/ZHZs5gdcshfNGVcqURof0g8C+srdru
	ctiS6tPW3fP+4k+iPI8E3ivBfZ0rAbe8JaUmlK1SHyRjn/4ND3XOGO0Dlu/psJqasm93Lumckj9
	KNeyI0cykeDoS8XM5Ehs27HBP73HE=
X-Received: by 2002:a05:6000:4006:b0:429:b1e4:1f79 with SMTP id ffacd0b85a97d-429bd6c1e9emr5632387f8f.58.1761999265118;
        Sat, 01 Nov 2025 05:14:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHUnlqEI4i/IitGbkGmSb5mhRBlBddO47B8HgBUkc3NNZF05OsloV2rMzQDwADfEurYYBklUw==
X-Received: by 2002:a05:6000:4006:b0:429:b1e4:1f79 with SMTP id ffacd0b85a97d-429bd6c1e9emr5632339f8f.58.1761999264653;
        Sat, 01 Nov 2025 05:14:24 -0700 (PDT)
Message-ID: <5a3ccb7e-9d36-4ac8-9634-c8dec3d6a47c@redhat.com>
Date: Sat, 1 Nov 2025 13:14:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 02/12] x86/xen: simplify flush_lazy_mmu()
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
 <20251029100909.3381140-3-kevin.brodsky@arm.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 qIws/H2t
In-Reply-To: <20251029100909.3381140-3-kevin.brodsky@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: lXk9cNcVmVsZLsGpx42alHLe7IuJ3tk1FQB6GIi99EY_1761999265
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 29.10.25 11:08, Kevin Brodsky wrote:
> arch_flush_lazy_mmu_mode() is called when outstanding batched
> pgtable operations must be completed immediately. There should
> however be no need to leave and re-enter lazy MMU completely. The
> only part of that sequence that we really need is xen_mc_flush();
> call it directly.
> 
> Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
> ---
>   arch/x86/xen/mmu_pv.c | 6 ++----
>   1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/x86/xen/mmu_pv.c b/arch/x86/xen/mmu_pv.c
> index 2a4a8deaf612..7a35c3393df4 100644
> --- a/arch/x86/xen/mmu_pv.c
> +++ b/arch/x86/xen/mmu_pv.c
> @@ -2139,10 +2139,8 @@ static void xen_flush_lazy_mmu(void)
>   {
>   	preempt_disable();
>   
> -	if (xen_get_lazy_mode() == XEN_LAZY_MMU) {
> -		arch_leave_lazy_mmu_mode();
> -		arch_enter_lazy_mmu_mode();
> -	}
> +	if (xen_get_lazy_mode() == XEN_LAZY_MMU)
> +		xen_mc_flush();
>   
>   	preempt_enable();
>   }

Looks like that was moved to XEN code in

commit a4a7644c15096f57f92252dd6e1046bf269c87d8
Author: Juergen Gross <jgross@suse.com>
Date:   Wed Sep 13 13:38:27 2023 +0200

     x86/xen: move paravirt lazy code


And essentially the previous implementation lived in 
arch/x86/kernel/paravirt.c:paravirt_flush_lazy_mmu(void) in an 
implementation-agnostic way:

void paravirt_flush_lazy_mmu(void)
{
        preempt_disable();

        if (paravirt_get_lazy_mode() == PARAVIRT_LAZY_MMU) {
                arch_leave_lazy_mmu_mode();
                arch_enter_lazy_mmu_mode();
        }

        preempt_enable();
}


So indeed, I assume just doing the flush here is sufficient.

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Cheers

David / dhildenb


