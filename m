Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 17CBEB54EB6
	for <lists+xen-devel@lfdr.de>; Fri, 12 Sep 2025 15:02:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1121989.1465941 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ux3Q2-0007NZ-RQ; Fri, 12 Sep 2025 13:02:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1121989.1465941; Fri, 12 Sep 2025 13:02:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ux3Q2-0007Lr-OX; Fri, 12 Sep 2025 13:02:26 +0000
Received: by outflank-mailman (input) for mailman id 1121989;
 Fri, 12 Sep 2025 13:02:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2Cg5=3X=redhat.com=david@srs-se1.protection.inumbo.net>)
 id 1ux3Q1-0007Lg-6c
 for xen-devel@lists.xenproject.org; Fri, 12 Sep 2025 13:02:25 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b8886cc6-8fd8-11f0-9809-7dc792cee155;
 Fri, 12 Sep 2025 15:02:22 +0200 (CEST)
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-494-DWVQDCELPrWgFuYN0iSUsQ-1; Fri, 12 Sep 2025 09:02:20 -0400
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-45dde353979so10851915e9.3
 for <xen-devel@lists.xenproject.org>; Fri, 12 Sep 2025 06:02:20 -0700 (PDT)
Received: from [192.168.3.141] (p4ff1f73f.dip0.t-ipconnect.de. [79.241.247.63])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3e7607d7c0dsm6591328f8f.47.2025.09.12.06.02.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Sep 2025 06:02:17 -0700 (PDT)
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
X-Inumbo-ID: b8886cc6-8fd8-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1757682141;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=T6pmjetwrY6Pjkps/LwmTPHSQvgSA/RNS+9TNChzIHs=;
	b=QQP0WTo/VeIyxCPCbVUe5AJXBgefOo1dAYKoVQKlcex/v0MHo3cyWnkqSllUu2HYa56l8K
	iDoQnuACefG/me47bk9o1JBWya3UaWUlf3MXdB5JW6oV5hpkVtzbLQAnuW55k4XStx3wbl
	aYbTS0n827opu30kCIeopIeavm0DR1E=
X-MC-Unique: DWVQDCELPrWgFuYN0iSUsQ-1
X-Mimecast-MFC-AGG-ID: DWVQDCELPrWgFuYN0iSUsQ_1757682139
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757682139; x=1758286939;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T6pmjetwrY6Pjkps/LwmTPHSQvgSA/RNS+9TNChzIHs=;
        b=smje0QXIUi9kDs8VkjLcGqyNNOaDedhM0jpun/NC/neoqU6wAevJJd0TKsyb/I77Eb
         EAl1ACqo0OWrck1JQw8nTGwRFPa3l997V1o67jx+u92ckYgu/bPBiqpJDaQVeLo1xnyS
         y2AXW+OIMhJSYqLKicLbAivl0BQuQCUYEhKYwGOp+2OqP7OaZ5NgTrU/cS31LPWaiWL7
         jV/987JwGqmwW5aFxTaK46zoPlepg2Re5/91IASIAvWnlJFdoqFE1igrKfT4h3kR22cV
         yDRP/afsRDKXrK80gYNOe4mCQG4owtHwQGJkfDwUfFZZbruiFEkvyqxBYF3iaanxnqHT
         Wgzg==
X-Forwarded-Encrypted: i=1; AJvYcCV8+3ksLNWz59RRCK9ZRn4GbpcbzHZaD3kjC3CzKHsqjK2nlDA6u4WGomw0ifmH8U8zuQGAFpzMbp8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YysQ7oD2LIqhleFwphGGO/w3oMjZevTheLVEbYaTOi7LR9dKvzp
	bnIgtDzmeChYC78wS/4beRpqfkKENbKOTZKMTUmmT4yWO9e85KKc4VqwTFoddl3T4f6TT3IBEEC
	+DhMPyXOYMUAzUdFUvD/o9R2KkYcRt/msnjtbxioly4ebZ5Q/B5Xn3qZy8kxrieskmmNO
X-Gm-Gg: ASbGncvRXm8zVqE1aSr4PLb4NGNObCHn3ECKdipilsghc0NLOcwJn7gaOj/ehsOOnTO
	45w5jk7nCbBhvJqhx5mL3leCtHPqTu6ABTqY2ZroqDIhyrXEnCDCrMkNu5GSlZjH1lj37xIcgmd
	msfltRpANw9ThzPgEW9ia+b7sREZ+1HfQHRpZDSJgkkX3Gyb81HOcxBnRkFlx9I8Q+HUwXzxpxK
	Gq9o0dhOpWt0yEzJHj7tOcwCLcZuFTtMZp21c41l1jCbIsTw7uXWw/thC5bYdz4Ge6YPrscmUJG
	sUgPnJ3baBKw9sfhNwD96XcGXHy1NSPB2P6iDVgw1tyovbH3fQQA3ks86dBwwszqEBDW3w==
X-Received: by 2002:a7b:c8cd:0:b0:459:e466:1bec with SMTP id 5b1f17b1804b1-45f211cb997mr19987525e9.2.1757682139297;
        Fri, 12 Sep 2025 06:02:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE8835/Sw5cx2XNXD41yV+ksXCYwqrt5aGn88DM3+Lr7h6frt33fSGmBjo6KK3fA6Iu30zVDA==
X-Received: by 2002:a7b:c8cd:0:b0:459:e466:1bec with SMTP id 5b1f17b1804b1-45f211cb997mr19986575e9.2.1757682137932;
        Fri, 12 Sep 2025 06:02:17 -0700 (PDT)
Message-ID: <b46d3430-fb84-464b-b053-490c6ea083da@redhat.com>
Date: Fri, 12 Sep 2025 15:02:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/7] mm: introduce local state for lazy_mmu sections
To: Alexander Gordeev <agordeev@linux.ibm.com>
Cc: Kevin Brodsky <kevin.brodsky@arm.com>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, Andreas Larsson <andreas@gaisler.com>,
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
 sparclinux@vger.kernel.org, xen-devel@lists.xenproject.org,
 Mark Rutland <Mark.Rutland@arm.com>
References: <9de08024-adfc-421b-8799-62653468cf63@arm.com>
 <ef343405-c394-4763-a79f-21381f217b6c@redhat.com>
 <4b4971fd-0445-4d86-8f3a-6ba3d68d15b7@arm.com>
 <4aa28016-5678-4c66-8104-8dcc3fa2f5ce@redhat.com>
 <15d01c8b-5475-442e-9df5-ca37b0d5dc04@arm.com>
 <7953a735-6129-4d22-be65-ce736630d539@redhat.com>
 <781a6450-1c0b-4603-91cf-49f16cd78c28@arm.com>
 <a17ab4e3-627a-4989-a5a5-d430eadabb86@redhat.com>
 <9ed5441f-cc03-472a-adc6-b9d3ad525664-agordeev@linux.ibm.com>
 <74d1f275-23c3-4fd8-b665-503c7fc87df0@redhat.com>
 <248b4623-8755-4323-8a44-be4af30e4856-agordeev@linux.ibm.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 qIws/H2t
In-Reply-To: <248b4623-8755-4323-8a44-be4af30e4856-agordeev@linux.ibm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: _r4a0HBnP6e6xMd4NRldpsxByO9KhGjUd3UEcQNlNLw_1757682139
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12.09.25 14:56, Alexander Gordeev wrote:
> On Fri, Sep 12, 2025 at 02:40:55PM +0200, David Hildenbrand wrote:
>> It would just be passing more context down to the architecture, right?
> 
> Yes. Namely this one would be arch-defined and arch_enter_lazy_mmu_mode()
> by default.
> 

How would that work with nesting? I feel like there is a fundamental 
problem with nesting with what you describe but I might be wrong.

-- 
Cheers

David / dhildenb


