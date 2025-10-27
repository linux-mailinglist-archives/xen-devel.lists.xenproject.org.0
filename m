Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA10CC0D852
	for <lists+xen-devel@lfdr.de>; Mon, 27 Oct 2025 13:29:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1151586.1482103 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vDMLw-0003j7-D4; Mon, 27 Oct 2025 12:29:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1151586.1482103; Mon, 27 Oct 2025 12:29:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vDMLw-0003gp-AD; Mon, 27 Oct 2025 12:29:36 +0000
Received: by outflank-mailman (input) for mailman id 1151586;
 Mon, 27 Oct 2025 12:29:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=v/7+=5E=redhat.com=david@srs-se1.protection.inumbo.net>)
 id 1vDMLv-0003gh-30
 for xen-devel@lists.xenproject.org; Mon, 27 Oct 2025 12:29:35 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 94dab937-b330-11f0-980a-7dc792cee155;
 Mon, 27 Oct 2025 13:29:29 +0100 (CET)
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-554-Znzyrz1qN2OBa2YMfguy-Q-1; Mon, 27 Oct 2025 08:29:26 -0400
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-47496b3c1dcso33871425e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 27 Oct 2025 05:29:26 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f3f:4b00:ee13:8c22:5cc5:d169?
 (p200300d82f3f4b00ee138c225cc5d169.dip0.t-ipconnect.de.
 [2003:d8:2f3f:4b00:ee13:8c22:5cc5:d169])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429952db99asm14109118f8f.32.2025.10.27.05.29.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Oct 2025 05:29:24 -0700 (PDT)
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
X-Inumbo-ID: 94dab937-b330-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1761568168;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=MxqhGs+kErj9QojSUYfqhMME1C+HzYz58U9mBz2oLoo=;
	b=GjzL7CDj0S0BLc5W69u1/FuWZP+xXmM0qsQ+oWjgr07ChdsV2F/b3jTNxuBUL6QHHgCelZ
	VLDaz/WWXZURQtMj2RN7LzIXgDso00pMrUat2qCbJ5oxy6Fs0IuzdP7yXHugMpLoCclouv
	QKCKBey16vgVRZWgmpx9u/rIram8z1E=
X-MC-Unique: Znzyrz1qN2OBa2YMfguy-Q-1
X-Mimecast-MFC-AGG-ID: Znzyrz1qN2OBa2YMfguy-Q_1761568166
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761568165; x=1762172965;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MxqhGs+kErj9QojSUYfqhMME1C+HzYz58U9mBz2oLoo=;
        b=BvLbNY6Z63XTwYWhK5SXf6Zq1TEb3C6KouaAqIsRKBi08l1WFma/yW9FHeGrpmafIn
         s88iyXQ6t2xUcZePOP94owmKzulVR3bpq94dvLjRY3ybF7bbQsSrDvjXuT1JJhZ0iipL
         01Ce9mgMiXL9eGB5JOKBv3nko4emHI6FCdUnuPPKM4uPY0JmE0KLPV/qtU8/r7t+iyDe
         zDsrivmp1ff6eztROlBZTgGUPgNAMQMeEbwqBxyWEMdFFJqaKdet5bzDylj2Cid0yMbE
         FJzZiMnN7HNwhWO9c/pahHG6MNFjdIcpAB8zznnuWzPPYm4ashbJKYRqjFM3U3Y0AvT4
         RFxA==
X-Forwarded-Encrypted: i=1; AJvYcCUAMncNnSkXufx6Y52iGiiVVS69tzrh0cuFrzdlrFWdw//VCIVAbeewQ2pRi+gaFAGiy8oejSFu2A4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxHNmU5phDF+gEI9zq5WZGG/vBi2iRmlR9bMqKpYIYXYcBq7t22
	2tzv+8gtb8pf6tZ//T8T+Z6WNfLFZ4HUvusHyElHeje2oVC9oX4FQvu6/VYb4u4WhAwh5Dt1N7t
	8Fx/VbRjdvfcdVDxqLy8RFSOI0vy8p0H9anlKnGniF+e2/7YmQZvTUggu1MAmwP15YgRK
X-Gm-Gg: ASbGncuMhpmWhNtXvuTiVXxPKDOSRvS6lWyfQxXR6ER6J4gua2K3Cy9z6wq5JTK2Mz9
	Lh6sVHHRinsdlOUyz8gpiLQp5kJjmlyOZcJjL3Rz+JavI12wSodOnQPEqPl0Dxbvw/5lJ0F9l5b
	jC6ZVjKeKrixFP4TGI9riibU09g3oeQC52tv2tFmH9IBte4xKDouVMeWNcsP7dt52F0Ds9WIk0o
	XqpejVmbN2SSPRZ4rlQwP8IGfd3c8810vreeQEtNUwMcQZAP2zqGyUMv7dMXMc1SPsb5qcrZh3N
	PoWAxlD1u2QYf4ioHZlHAIqyBvFyk0AFhkoa8PFB/IrGgGYnjaiDORtocnWqMGZTbrVw2jpGWds
	lKRICzfG0t54HhW2vgV8zq1OYvcIKbvzPMZoMGFoyR3lAKnjmC7fpHpHHtkOxnoVYVGb0ITYdQ2
	I6q4McV69WEt5SiDK2eqEaJvp1kxs=
X-Received: by 2002:a05:600c:6814:b0:46d:b665:1d95 with SMTP id 5b1f17b1804b1-475d2ed2703mr122459175e9.32.1761568165610;
        Mon, 27 Oct 2025 05:29:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IERhDOSgpdu7IOhGUhd5vG2oGfH+FtLLHQ8h3X53cAF/bER/zOT53Nw9I8J5TYzsbcubMUbyA==
X-Received: by 2002:a05:600c:6814:b0:46d:b665:1d95 with SMTP id 5b1f17b1804b1-475d2ed2703mr122458775e9.32.1761568165180;
        Mon, 27 Oct 2025 05:29:25 -0700 (PDT)
Message-ID: <6c9bd0c6-0968-41ac-b0b4-53c881748cfb@redhat.com>
Date: Mon, 27 Oct 2025 13:29:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 11/13] x86/xen: use lazy_mmu_state when
 context-switching
To: Demi Marie Obenour <demiobenour@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, Kevin Brodsky
 <kevin.brodsky@arm.com>, linux-mm@kvack.org
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
 <f0067f35-1048-4788-8401-f71d297f56f3@redhat.com>
 <348e5f1c5a90e4ab0f14b4d997baf7169745bf04.camel@infradead.org>
 <70723f4a-f42b-4d94-9344-5824e48bfad1@redhat.com>
 <3ff4aaeb-61ce-4b72-ba90-1b66374b1b95@gmail.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 qIws/H2t
In-Reply-To: <3ff4aaeb-61ce-4b72-ba90-1b66374b1b95@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: jUcsipX9gdz5L_CX9KytUejwCd-w-RVWi_2j7Am57FM_1761568166
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 25.10.25 00:52, Demi Marie Obenour wrote:
> On 10/24/25 10:51, David Hildenbrand wrote:
>> On 24.10.25 16:47, David Woodhouse wrote:
>>> On Thu, 2025-10-23 at 22:06 +0200, David Hildenbrand wrote:
>>>> On 15.10.25 10:27, Kevin Brodsky wrote:
>>>>> We currently set a TIF flag when scheduling out a task that is in
>>>>> lazy MMU mode, in order to restore it when the task is scheduled
>>>>> again.
>>>>>
>>>>> The generic lazy_mmu layer now tracks whether a task is in lazy MMU
>>>>> mode in task_struct::lazy_mmu_state. We can therefore check that
>>>>> state when switching to the new task, instead of using a separate
>>>>> TIF flag.
>>>>>
>>>>> Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
>>>>> ---
>>>>
>>>>
>>>> Looks ok to me, but I hope we get some confirmation from x86 / xen
>>>> folks.
>>>
>>>
>>> I know tglx has shouted at me in the past for precisely this reminder,
>>> but you know you can test Xen guests under QEMU/KVM now and don't need
>>> to actually run Xen? Has this been boot tested?
>>
>> And after that, boot-testing sparc as well? :D
>>
>> If it's easy, why not. But other people should not suffer for all the
>> XEN hacks we keep dragging along.
> 
> Which hacks?  Serious question.  Is this just for Xen PV or is HVM
> also affected?

In the context of this series, XEN_LAZY_MMU.

Your question regarding PV/HVM emphasizes my point: how is a submitter 
supposed to know which XEN combinations to test (and how to test them), 
to not confidentially break something here.

We really need guidance+help from the XEN folks here.

-- 
Cheers

David / dhildenb


