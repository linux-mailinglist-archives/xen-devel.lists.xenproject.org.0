Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C6B6E6A68A7
	for <lists+xen-devel@lfdr.de>; Wed,  1 Mar 2023 09:16:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.503877.776251 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXHdJ-0005o8-6h; Wed, 01 Mar 2023 08:16:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 503877.776251; Wed, 01 Mar 2023 08:16:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXHdJ-0005mQ-46; Wed, 01 Mar 2023 08:16:17 +0000
Received: by outflank-mailman (input) for mailman id 503877;
 Wed, 01 Mar 2023 08:16:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+Yld=6Z=redhat.com=david@srs-se1.protection.inumbo.net>)
 id 1pXHdH-0005mK-2H
 for xen-devel@lists.xenproject.org; Wed, 01 Mar 2023 08:16:15 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 53dde2cf-b809-11ed-a550-8520e6686977;
 Wed, 01 Mar 2023 09:16:13 +0100 (CET)
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-182-v0u6o8euP9i7c_-pKccnsA-1; Wed, 01 Mar 2023 03:16:10 -0500
Received: by mail-wm1-f69.google.com with SMTP id
 e17-20020a05600c219100b003e21fa60ec1so5032571wme.2
 for <xen-devel@lists.xenproject.org>; Wed, 01 Mar 2023 00:16:10 -0800 (PST)
Received: from ?IPV6:2a09:80c0:192:0:5dac:bf3d:c41:c3e7?
 ([2a09:80c0:192:0:5dac:bf3d:c41:c3e7])
 by smtp.gmail.com with ESMTPSA id
 m15-20020a5d6a0f000000b002c707785da4sm11739026wru.107.2023.03.01.00.16.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Mar 2023 00:16:08 -0800 (PST)
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
X-Inumbo-ID: 53dde2cf-b809-11ed-a550-8520e6686977
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1677658571;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qQIo0hNE1IdmdTJeAfVSWSJHdp/A2L81MbqwgQGi7/s=;
	b=Lgx4494Ki92A8P7KBec9GZ+oniD/so9S6s376pXCBfwIZbpFryYzm7VuUbDCudOmPpuazJ
	BZlYjiR+awKb7+/obJJdaVaNJPlnbEr8EXFHhRoDxhAjgvdnre76/wb2aZFcUicW5ld7qE
	AjRVQKfqtaApCJ9VvbYhapBkNy2Iiis=
X-MC-Unique: v0u6o8euP9i7c_-pKccnsA-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:subject:organization:from
         :content-language:references:cc:to:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qQIo0hNE1IdmdTJeAfVSWSJHdp/A2L81MbqwgQGi7/s=;
        b=NOPIa9wyCJDrIv0DI50vwBeYWvzFwwrlYpe4CpjNUf8QvyCY/wgzGvLWDt5xIoXtVE
         9UFwh0Zfy14RVJfNwRwoDcLhwBLgo32r11/4p1i0RPvQYcPyZLsN/s5v0t7ZsHNYT1Ei
         t6yTDEd7ISxxJMO2yqCVj3tyIsUqk2s4vUoWAjwpav6H1dR/7W2f/tiUvakIxJivbmSx
         d9CNZA+GDT3HcQFd67eyqY3M6sMq8E6utBQDIEhxcY6cJFmXkR8p3wS0NgiXgnTFVp0S
         BRKsqRSBzUl7bFBw7Lf3N4U4+ITeGNDpEuFTc9FKxL5ki1yRA15l8+B8S+FecGV4G6FR
         ghGw==
X-Gm-Message-State: AO0yUKXYNC3TN66ofPYlEXEnLdijI1BxS7YBM2zvGx1Rp6NXQb81H39P
	ITP+zavl/XFTHbPN3DzeH8xub5DMr94n/mUI22wryI9pGahqIsEQFkDDJHqphevoR4PrV82ewqk
	oJX6sd8gPCrCMZnBFOjCP+OJXPQA=
X-Received: by 2002:adf:fa42:0:b0:2c8:9cfe:9e29 with SMTP id y2-20020adffa42000000b002c89cfe9e29mr3673935wrr.38.1677658569269;
        Wed, 01 Mar 2023 00:16:09 -0800 (PST)
X-Google-Smtp-Source: AK7set/Zcp0KDYd3P+ttMa1nxfZFskB2aS7FMY5A6AFDn91vWMJGTRwO0n5U4FI/yi5+QKrlOm4zVQ==
X-Received: by 2002:adf:fa42:0:b0:2c8:9cfe:9e29 with SMTP id y2-20020adffa42000000b002c89cfe9e29mr3673883wrr.38.1677658568881;
        Wed, 01 Mar 2023 00:16:08 -0800 (PST)
Message-ID: <550c6035-6dd0-d215-226b-1a82dafa05d6@redhat.com>
Date: Wed, 1 Mar 2023 09:16:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 Rick Edgecombe <rick.p.edgecombe@intel.com>, "x86@kernel.org"
 <x86@kernel.org>, "H . Peter Anvin" <hpa@zytor.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>,
 "linux-api@vger.kernel.org" <linux-api@vger.kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Andy Lutomirski <luto@kernel.org>,
 Balbir Singh <bsingharora@gmail.com>, Borislav Petkov <bp@alien8.de>,
 Cyrill Gorcunov <gorcunov@gmail.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Eugene Syromiatnikov <esyr@redhat.com>, Florian Weimer <fweimer@redhat.com>,
 "H . J . Lu" <hjl.tools@gmail.com>, Jann Horn <jannh@google.com>,
 Jonathan Corbet <corbet@lwn.net>, Kees Cook <keescook@chromium.org>,
 Mike Kravetz <mike.kravetz@oracle.com>, Nadav Amit <nadav.amit@gmail.com>,
 Oleg Nesterov <oleg@redhat.com>, Pavel Machek <pavel@ucw.cz>,
 Peter Zijlstra <peterz@infradead.org>, Randy Dunlap <rdunlap@infradead.org>,
 Weijiang Yang <weijiang.yang@intel.com>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
 John Allen <john.allen@amd.com>, "kcc@google.com" <kcc@google.com>,
 "eranian@google.com" <eranian@google.com>, "rppt@kernel.org"
 <rppt@kernel.org>,
 "jamorris@linux.microsoft.com" <jamorris@linux.microsoft.com>,
 "dethoma@microsoft.com" <dethoma@microsoft.com>,
 "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
 "Andrew.Cooper3@citrix.com" <Andrew.Cooper3@citrix.com>,
 "christina.schimpe@intel.com" <christina.schimpe@intel.com>,
 "debug@rivosinc.com" <debug@rivosinc.com>
Cc: "linux-alpha@vger.kernel.org" <linux-alpha@vger.kernel.org>,
 "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>,
 "linux-hexagon@vger.kernel.org" <linux-hexagon@vger.kernel.org>,
 "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>,
 "loongarch@lists.linux.dev" <loongarch@lists.linux.dev>,
 "linux-m68k@lists.linux-m68k.org" <linux-m68k@lists.linux-m68k.org>,
 Michal Simek <monstr@monstr.eu>, Dinh Nguyen <dinguyen@kernel.org>,
 "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 "linux-openrisc@vger.kernel.org" <linux-openrisc@vger.kernel.org>,
 "linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
 "linux-sh@vger.kernel.org" <linux-sh@vger.kernel.org>,
 "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>,
 "linux-um@lists.infradead.org" <linux-um@lists.infradead.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20230227222957.24501-1-rick.p.edgecombe@intel.com>
 <20230227222957.24501-14-rick.p.edgecombe@intel.com>
 <1f8b78b6-9f34-b646-68f2-eac62136b9f4@csgroup.eu>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [PATCH v7 13/41] mm: Make pte_mkwrite() take a VMA
In-Reply-To: <1f8b78b6-9f34-b646-68f2-eac62136b9f4@csgroup.eu>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 01.03.23 08:03, Christophe Leroy wrote:
> 
> 
> Le 27/02/2023 à 23:29, Rick Edgecombe a écrit :
>> The x86 Control-flow Enforcement Technology (CET) feature includes a new
>> type of memory called shadow stack. This shadow stack memory has some
>> unusual properties, which requires some core mm changes to function
>> properly.
>>
>> One of these unusual properties is that shadow stack memory is writable,
>> but only in limited ways. These limits are applied via a specific PTE
>> bit combination. Nevertheless, the memory is writable, and core mm code
>> will need to apply the writable permissions in the typical paths that
>> call pte_mkwrite().
>>
>> In addition to VM_WRITE, the shadow stack VMA's will have a flag denoting
>> that they are special shadow stack flavor of writable memory. So make
>> pte_mkwrite() take a VMA, so that the x86 implementation of it can know to
>> create regular writable memory or shadow stack memory.
>>
>> Apply the same changes for pmd_mkwrite() and huge_pte_mkwrite().
> 
> I'm not sure it is a good idea to add a second argument to
> pte_mkwrite(). All pte_mkxxxx() only take a pte and nothing else.

We touched on this in previous revisions and so far there was no strong 
push back. This turned out to be cleaner and easier than the 
alternatives we evaluated.

pte_modify(), for example, takes another argument. Sure, we could try 
thinking about passing something else than a VMA to identify the 
writability type, but I am not convinced that will look particularly better.

> 
> I think you should do the same as commit d9ed9faac283 ("mm: add new
> arch_make_huge_pte() method for tile support")
> 

We already have 3 architectures intending to support shadow stacks in 
one way or the other. Replacing all pte_mkwrite() with 
arch_pte_mkwrite() doesn't sound particularly appealing to me.


-- 
Thanks,

David / dhildenb


