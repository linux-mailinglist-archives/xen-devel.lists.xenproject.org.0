Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E83E1C03523
	for <lists+xen-devel@lfdr.de>; Thu, 23 Oct 2025 22:06:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1149670.1481239 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vC1Zs-0003bM-9F; Thu, 23 Oct 2025 20:06:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1149670.1481239; Thu, 23 Oct 2025 20:06:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vC1Zs-0003Z9-6H; Thu, 23 Oct 2025 20:06:28 +0000
Received: by outflank-mailman (input) for mailman id 1149670;
 Thu, 23 Oct 2025 20:06:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=MccR=5A=redhat.com=david@srs-se1.protection.inumbo.net>)
 id 1vC1Zq-0003Z3-LM
 for xen-devel@lists.xenproject.org; Thu, 23 Oct 2025 20:06:26 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c069b7e3-b04b-11f0-9d15-b5c5bf9af7f9;
 Thu, 23 Oct 2025 22:06:25 +0200 (CEST)
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-618-QOr4F48CNsOddcmQRh_HOw-1; Thu, 23 Oct 2025 16:06:19 -0400
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-4710d174c31so14786875e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 23 Oct 2025 13:06:18 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f4e:3200:c99d:a38b:3f3a:d4b3?
 (p200300d82f4e3200c99da38b3f3ad4b3.dip0.t-ipconnect.de.
 [2003:d8:2f4e:3200:c99d:a38b:3f3a:d4b3])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-475c4342946sm113034495e9.10.2025.10.23.13.06.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Oct 2025 13:06:16 -0700 (PDT)
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
X-Inumbo-ID: c069b7e3-b04b-11f0-9d15-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1761249984;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=fRPhH8Afjh5WRImY9rdVIeUYAC30QvosEDEcq3KVJj4=;
	b=dxH/QGhnkFNpaIjjhYB4GMDfjwYHov3K+iGwVim+lOHO5p0LFDStOYTs1Ufdxj2Ccw5mJo
	qehYfU2ca1d+xyMqbiGnZGuujYYzmaLD2r3BOQUAl1ww5hs8fSluJbEyVpW+VcfzCErYgq
	LHQVnOspdmbpG9a4fQTKrfVWgpigyjY=
X-MC-Unique: QOr4F48CNsOddcmQRh_HOw-1
X-Mimecast-MFC-AGG-ID: QOr4F48CNsOddcmQRh_HOw_1761249978
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761249978; x=1761854778;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fRPhH8Afjh5WRImY9rdVIeUYAC30QvosEDEcq3KVJj4=;
        b=l9CzEOpr7BVcH/yPorhWLSjZXkO41VK/xxnsWsTM81K3/owsa+mbT+Rd3+0YV8Cb0Q
         ws2aGOcDXHHrhNZn5IHGrzuzt8oVK0ycSryvE8KqL1m3V/rPXGS1d/MXX5EdpiTcmOZs
         ParTiAXkXkgNz1h9jmPxNZGo5T1gG2JbA2/Mkbpt5q1Cwbr/2N6pkq6p+mTj0zCSiC6D
         zjIXEEHmso/+a625znm7DbuN/sEhbt94ZSYNetN94sx9CTqGbDvv2QtOCCQyYKWTlp+f
         /nGsL2UfiAcPwjmTF2eUCJJqSKWZ+enr/ysdDIRz1PYrV/1x9WOi5HzvZjjvVs+LuuZ4
         4hng==
X-Forwarded-Encrypted: i=1; AJvYcCXGr/U2maKFAi9c6c+KgdzZj4jtcReNFwOTPdsZ2/yBys46SLtVG7HTkoV0HAue/KnZyDDxnpcpdWw=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz03KOJp3I2ZYNS7n7ubK7IBdUUJhsecxdApeGkP0zBgZTQfSSw
	xLbBqUQMVLJx+fZxYKzs9jS0ItWOzrdh3L8iFqI4f/qACm4+Gf3X3S0UDvlB7aJLTwQas2Uj95D
	+q5LKGMqc4Wx7NLd9ClN8mIwlVReH587AOT3pSfM5d4oyjuH1EkNxyioOpfoHbIf5KgFC
X-Gm-Gg: ASbGncuLzhz4me9//kVVSGsYnY+Mr0lyn/GvshKOcA3b1nphp+4qsY3923fR1Igh+T+
	9NB+8ovK5ESywORAigw6lKJDBT1WIQB1DsMgXvb4PqRgEQQvWkaQHwADmf5xD5pFolNU/AlfZl8
	nyxsKHixWAK0uYCCe1FNqINxVieFvpn4pufoOCFYcGae/MDYdjz1h+6ikC3Jvc1wgYzKkvmJjx9
	pI+7gbbIxJJnZcabRuXsBwBEn9VVwEhhlRyF7tcYFCPW4jZa0fCCZwuVMQDwFw6EVUUyGVOp9lS
	aO4h8ZgwgD8LqYlUZ2P11rckLpZxutZ9VHS2tdhA3iJqYCswXBomZq+8l4QPAHzsFX6SOmkofkq
	vDBgUCOOklh5q4csNAiPqeKuvR34U9Ebc81TBVIbaalUb/F84+SBbk6i3yXbmpDmPtw2q3Fu939
	9xZ+diaK+z5mrXr6lg0MMp24Cmt7E=
X-Received: by 2002:a05:600c:3494:b0:46e:4744:add7 with SMTP id 5b1f17b1804b1-47117870715mr207116385e9.7.1761249977735;
        Thu, 23 Oct 2025 13:06:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGGeb2fa1IYwsGJ0pSctmwGPF6xvoGIek/oRMhJoppZNw0DpnIDJSoz1KA7a/k0YpqsgRr1qQ==
X-Received: by 2002:a05:600c:3494:b0:46e:4744:add7 with SMTP id 5b1f17b1804b1-47117870715mr207115995e9.7.1761249977327;
        Thu, 23 Oct 2025 13:06:17 -0700 (PDT)
Message-ID: <f0067f35-1048-4788-8401-f71d297f56f3@redhat.com>
Date: Thu, 23 Oct 2025 22:06:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 11/13] x86/xen: use lazy_mmu_state when
 context-switching
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
 <20251015082727.2395128-12-kevin.brodsky@arm.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 qIws/H2t
In-Reply-To: <20251015082727.2395128-12-kevin.brodsky@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: h9r4md5Cq2TJYolFSt7B557juGcYACSSPAEwPvyjUko_1761249978
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 15.10.25 10:27, Kevin Brodsky wrote:
> We currently set a TIF flag when scheduling out a task that is in
> lazy MMU mode, in order to restore it when the task is scheduled
> again.
> 
> The generic lazy_mmu layer now tracks whether a task is in lazy MMU
> mode in task_struct::lazy_mmu_state. We can therefore check that
> state when switching to the new task, instead of using a separate
> TIF flag.
> 
> Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
> ---


Looks ok to me, but I hope we get some confirmation from x86 / xen folks.

-- 
Cheers

David / dhildenb


