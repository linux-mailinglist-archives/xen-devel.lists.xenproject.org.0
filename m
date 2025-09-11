Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F5EFB53B2B
	for <lists+xen-devel@lfdr.de>; Thu, 11 Sep 2025 20:14:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1120756.1465523 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwloH-0002tg-Nr; Thu, 11 Sep 2025 18:14:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1120756.1465523; Thu, 11 Sep 2025 18:14:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwloH-0002r5-Kz; Thu, 11 Sep 2025 18:14:17 +0000
Received: by outflank-mailman (input) for mailman id 1120756;
 Thu, 11 Sep 2025 18:14:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bW5x=3W=redhat.com=david@srs-se1.protection.inumbo.net>)
 id 1uwloG-0002qz-Gm
 for xen-devel@lists.xenproject.org; Thu, 11 Sep 2025 18:14:16 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1e524b48-8f3b-11f0-9d13-b5c5bf9af7f9;
 Thu, 11 Sep 2025 20:14:13 +0200 (CEST)
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-28-iWP038R7PQW8pLTkgu4n0w-1; Thu, 11 Sep 2025 14:14:10 -0400
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-45b920e0c25so6846275e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 11 Sep 2025 11:14:10 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f42:b000:db8b:7655:f60f:812b?
 (p200300d82f42b000db8b7655f60f812b.dip0.t-ipconnect.de.
 [2003:d8:2f42:b000:db8b:7655:f60f:812b])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45e016b5cbcsm35354055e9.11.2025.09.11.11.14.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Sep 2025 11:14:08 -0700 (PDT)
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
X-Inumbo-ID: 1e524b48-8f3b-11f0-9d13-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1757614452;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=fO/wiS6u6wjvvJi4t2wKktGS6aYq1CiRm5gJANXSAXc=;
	b=ROmY7FUr4RFL/ZaJdrsNgxHvb34/pAbXIlb5WxbBwVKDvroNMtrDVkA7rzCQcYhEqSXRQA
	0VFaqRk3jkv/sWR13uf/Zx5Uy6ZZXnT/pLJX/OgNKiWbPBcIoPslsk8bRSG1mp0j3ZqF+8
	6b5EBJooQIW0NgT5Tk70lsJr6Axak8M=
X-MC-Unique: iWP038R7PQW8pLTkgu4n0w-1
X-Mimecast-MFC-AGG-ID: iWP038R7PQW8pLTkgu4n0w_1757614449
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757614449; x=1758219249;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fO/wiS6u6wjvvJi4t2wKktGS6aYq1CiRm5gJANXSAXc=;
        b=wmeCgXvgBzUQZoAXyQHdoZKkRWGJ1Eyeu9stK5iMDLszsCdqY4fMOWHORmrySEPuj/
         XHjG8RqSytniuVTOoDFd5KjOi27Strwwy8Xv0G2arhLiRmr0svIa2X9dtM/JfWHANZB8
         QqIS/CtgGwGjS79bANBFSsDSsCCvDJWMtLOkCJWEVSn66bmQgQvMz6iKpOcqq3+05P+R
         5AkKr9vNyUe3F1u6zpSWV4IqkNSaCiI63OcDnae4WS31krEhAmKvnZRezlTRPnXm3Ko0
         XV/zcSgGnUVZj47bVetj+It5bZ0NWNNKoZk6UAdz/gpFuy2WhIvMpKJVLl9C8K3d22d6
         pZNg==
X-Forwarded-Encrypted: i=1; AJvYcCUtngg4rzCYGwZyWmpwdu4WtHXFN9U95OHLaiXyyVNx2N8/v5f5EjIBP1J1gz0w2JWBX6xFe4Aecf0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzI26KUC/v516lmO2OS+8VpSRnwZxW8QVNeUELhBb95MElOBpo7
	jD3/cBD5TGaIfij5ViGwbZEDW6b2MCiy4jbQrWI3zFBAMw/60CLYZRqsiY7tIV5i2NTv3AUxGvX
	5kIAdoGwzbFBvJj+GXfiWXa77iQSNXIUwt+Jd2OcR78J1ezrjm/wVUQ/rnWCHLoExrTAi
X-Gm-Gg: ASbGncvSPmIz94wFUCdX3ILAaEfevF3eqe7EQZ/IGDOhgxOvN2zd+QPc0POoB46U07i
	DlNNzBgkfsr8rYhRceqEpUYRQwZwtAUdBR/cUhpsxnaHXhlVg2NwBnT92jJsvxJSzLMS53ZOnDL
	WCymkvrEbRa3I/mY9tpWA2Fygrcuo7toLZaiAdTxIVBvDcJujfHV1kEdP0GBLVD/B0gi1KmZRw4
	8Dg8nzglvhL1Ns+hkStJoXPd12oPFSgLCMUatYmQoh4GmrJ4en9xTTjiyZUdjPrBcxHBbWulCKo
	q9gSl7ePdsm3AWBU5E4fp9Ao8Ln1VD2d/fjVGLjPsR8ghIObHYt5RX9e9qsseQgEKHzrxzk9pNK
	/5ZLarQgyIoOrnvZDB3wNExkbFo9NMO6ps4uOyGongvyUznzl23e3Aw68XTicmuJt5Hg=
X-Received: by 2002:a05:600c:1387:b0:45b:88d6:8ddb with SMTP id 5b1f17b1804b1-45f211fc2dbmr3761195e9.37.1757614449372;
        Thu, 11 Sep 2025 11:14:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHYPRnitXgQzHDt7U0vwEWEhdUB9NK1hJir7NlpKTdRzaPw5ybQNZDXnkL32l5S2EQ4JRmc7Q==
X-Received: by 2002:a05:600c:1387:b0:45b:88d6:8ddb with SMTP id 5b1f17b1804b1-45f211fc2dbmr3760825e9.37.1757614448886;
        Thu, 11 Sep 2025 11:14:08 -0700 (PDT)
Message-ID: <4aa28016-5678-4c66-8104-8dcc3fa2f5ce@redhat.com>
Date: Thu, 11 Sep 2025 20:14:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/7] mm: introduce local state for lazy_mmu sections
To: Kevin Brodsky <kevin.brodsky@arm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
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
 sparclinux@vger.kernel.org, xen-devel@lists.xenproject.org,
 Mark Rutland <Mark.Rutland@arm.com>
References: <20250908073931.4159362-1-kevin.brodsky@arm.com>
 <20250908073931.4159362-3-kevin.brodsky@arm.com>
 <d23ea683-cca4-4973-88b1-4f6fd9b22314@redhat.com>
 <ca2054ad-b163-4e61-8ec4-6f2e36461628-agordeev@linux.ibm.com>
 <e7acb889-1fe9-4db3-acf4-39f4960e8ccd@redhat.com>
 <2fecfae7-1140-4a23-a352-9fd339fcbae5-agordeev@linux.ibm.com>
 <e521b1f4-3f2b-48cd-9568-b9a4cf4c4830@redhat.com>
 <47ee1df7-1602-4200-af94-475f84ca8d80@arm.com>
 <29383ee2-d6d6-4435-9052-d75a263a5c45@redhat.com>
 <9de08024-adfc-421b-8799-62653468cf63@arm.com>
 <ef343405-c394-4763-a79f-21381f217b6c@redhat.com>
 <4b4971fd-0445-4d86-8f3a-6ba3d68d15b7@arm.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 qIws/H2t
In-Reply-To: <4b4971fd-0445-4d86-8f3a-6ba3d68d15b7@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 1KZCWXOQ0X7A5P57rNc__r7qj-5ZJrO6gJPkE7WvXqs_1757614449
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

>>> On the other hand, with a pagefault_disabled-like approach, there is no
>>> way to instruct call {3} to fully exit lazy_mmu regardless of the
>>> nesting level.
>>
>> Sure there is, with a better API. See below. :)
> 
> I meant while keeping the existing shape of the API but yes fair enough!

Time to do it properly I guess :)

[...]

>> Assume we store in the task_struct
>>
>> uint8_t lazy_mmu_enabled_count;
>> bool lazy_mmu_paused;
> 
> I didn't think of that approach! I can't immediately see any problem
> with it, assuming we're fine with storing arch-specific context in
> thread_struct (which seems to be the case as things stand).

Right, just to complete the picture:

a) We will have some CONFIG_ARCH_LAZY_MMU

b) Without that config, all lazy_mmu_*() functions are a nop and no 
lazy_mmu_state is stored in task_struct

struct lazy_mmu_state {
	uint8_t enabled_count;
	bool paused;
}

c) With that config, common-code lazy_mmu_*() functions implement the 
updating of the lazy_mmu_state in task_struct and call into arch code
on the transition from 0->1, 1->0 etc.

Maybe that can be done through exiting 
arch_enter_lazy_mmu_mode()/arch_leave_lazy_mmu_mode() callbacks, maybe 
we need more. I feel like
we might be able to implement that through the existing helpers.

> 
>>
>> We can do things like
>>
>> a) Sanity check that while we are paused that we get no more
>> enable/disable requests
>> b) Sanity check that while we are paused that we get no more pause
>> requests.
> 
> These are good points - and this is only possible with such global
> state. (Similarly we can check that the counter never underflows.)

Exactly.

[..]

> 
> Overall what you're proposing seems sensible to me, the additional
> fields in task_struct don't take much space and we can keep the API
> unchanged in most cases. It is also good to have the option to check
> that the API is used correctly. I'll reply to the cover letter to let
> anyone who didn't follow this thread chip in, before I go ahead and try
> out that new approach.

And on top of the proposal above we will have some

struct arch_lazy_mmu_state;

define by the architecture (could be an empty struct on most).

We can store that inside "struct lazy_mmu_state;" or if we ever have to, 
start returning only that from the enable/disable etc. functions.

For now, I'd say just store it in the task struct in the lazy_mmu_state. 
But we can always adjust later if required.

In the first (this) series we probably don't even have to introduce 
arch_lazy_mmu_state.

-- 
Cheers

David / dhildenb


