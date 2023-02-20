Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DE9BD69C997
	for <lists+xen-devel@lfdr.de>; Mon, 20 Feb 2023 12:17:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.498020.768802 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pU4Ab-0006HE-Qe; Mon, 20 Feb 2023 11:17:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 498020.768802; Mon, 20 Feb 2023 11:17:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pU4Ab-0006Ey-Nx; Mon, 20 Feb 2023 11:17:21 +0000
Received: by outflank-mailman (input) for mailman id 498020;
 Mon, 20 Feb 2023 11:17:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=H5V/=6Q=redhat.com=david@srs-se1.protection.inumbo.net>)
 id 1pU4AZ-0006Eq-Ti
 for xen-devel@lists.xenproject.org; Mon, 20 Feb 2023 11:17:20 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 21d0684e-b110-11ed-93b5-47a8fe42b414;
 Mon, 20 Feb 2023 12:17:17 +0100 (CET)
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-384-23Gxb1RVNbyAdCViX9xqDw-1; Mon, 20 Feb 2023 06:17:14 -0500
Received: by mail-wr1-f70.google.com with SMTP id
 g6-20020adfa486000000b002c55ef1ec94so96239wrb.0
 for <xen-devel@lists.xenproject.org>; Mon, 20 Feb 2023 03:17:14 -0800 (PST)
Received: from ?IPV6:2003:cb:c705:8300:e519:4218:a8b5:5bec?
 (p200300cbc7058300e5194218a8b55bec.dip0.t-ipconnect.de.
 [2003:cb:c705:8300:e519:4218:a8b5:5bec])
 by smtp.gmail.com with ESMTPSA id
 c128-20020a1c3586000000b003e21558ee9dsm331492wma.2.2023.02.20.03.17.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Feb 2023 03:17:12 -0800 (PST)
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
X-Inumbo-ID: 21d0684e-b110-11ed-93b5-47a8fe42b414
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1676891836;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4EQNfPCKlm/dnqlucYMgfhMhQeV8s6OOHLtd2gYWnSc=;
	b=bCt5/hFMgVueFQtlt9TrsPeAUpka+6urNnoT9ydQj5eb4cOYqaUEs/HKI887XEIYC5l1n9
	mCZlR94CzlcmUnHOXOrcBw8ln3H2qCCwo69HhHR/2W4ny7riYBKCQHs6X9u7Xw9O6z58E6
	kE0TJdVdItM8HQ8k30dLuJuq0KHbTYI=
X-MC-Unique: 23Gxb1RVNbyAdCViX9xqDw-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4EQNfPCKlm/dnqlucYMgfhMhQeV8s6OOHLtd2gYWnSc=;
        b=hIW92pqbJ4frvvhW6uMH9qGm6prMO/bDvAGNvlAS4LRXgXfMiXgiDyACIXN9/lpCOa
         n5PbAS/572vY9P2p5Y8iwOjlOgMNyDYsazUg8Ny8/8HhNzAIma7UAXTJO+dd+KbVg6x2
         b69bPTYUK71klI5Fqa98mqUPri/GNzO81H1kmUYau2shqvQ4CBrBQTHIa4mX2s0tYfCZ
         zM9lfn2NFlG0nG4B6Nkw8HTAbWYNzQvWo6pdfIuSWuGWgjc6kUwlOSvVIgH3XbOGpNX+
         9pVdI261I7BIVjhM1QnW4ryYm6QUm+6kTBND1tjRPkXD4iXhFsppG3UDyocDqSXI0Aq1
         ziaw==
X-Gm-Message-State: AO0yUKWdGT5U9eCrUK/BW4zXwVsUkX1HvJIYQ91M7vOv2Y3PW2kYa8+g
	C6qRONQIfXmVqPgrTltU9TDg2beMx0KFTVjg4b8cXkulAFJg+sWtoT6n2wsMpLnlfWZgliyoQYw
	Y41PWhT5DzJ0vOnE4ASQ5PP/6rME=
X-Received: by 2002:a05:600c:4d89:b0:3e0:1a9:b1e0 with SMTP id v9-20020a05600c4d8900b003e001a9b1e0mr578806wmp.25.1676891833534;
        Mon, 20 Feb 2023 03:17:13 -0800 (PST)
X-Google-Smtp-Source: AK7set8S0E2hPJcQfDWwVBHJ827trXEDgyAecAtZgO3tsbPQgMPJ2pfBI07ijKz0qUw/7N5br62ouQ==
X-Received: by 2002:a05:600c:4d89:b0:3e0:1a9:b1e0 with SMTP id v9-20020a05600c4d8900b003e001a9b1e0mr578749wmp.25.1676891833134;
        Mon, 20 Feb 2023 03:17:13 -0800 (PST)
Message-ID: <ee0ab9fa-9560-0160-f9ad-3b0ca844884c@redhat.com>
Date: Mon, 20 Feb 2023 12:17:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH v6 11/41] mm: Introduce pte_mkwrite_kernel()
To: Kees Cook <keescook@chromium.org>,
 Rick Edgecombe <rick.p.edgecombe@intel.com>
Cc: x86@kernel.org, "H . Peter Anvin" <hpa@zytor.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, linux-mm@kvack.org,
 linux-arch@vger.kernel.org, linux-api@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>, Andy Lutomirski <luto@kernel.org>,
 Balbir Singh <bsingharora@gmail.com>, Borislav Petkov <bp@alien8.de>,
 Cyrill Gorcunov <gorcunov@gmail.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Eugene Syromiatnikov <esyr@redhat.com>, Florian Weimer <fweimer@redhat.com>,
 "H . J . Lu" <hjl.tools@gmail.com>, Jann Horn <jannh@google.com>,
 Jonathan Corbet <corbet@lwn.net>, Mike Kravetz <mike.kravetz@oracle.com>,
 Nadav Amit <nadav.amit@gmail.com>, Oleg Nesterov <oleg@redhat.com>,
 Pavel Machek <pavel@ucw.cz>, Peter Zijlstra <peterz@infradead.org>,
 Randy Dunlap <rdunlap@infradead.org>, Weijiang Yang
 <weijiang.yang@intel.com>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
 John Allen <john.allen@amd.com>, kcc@google.com, eranian@google.com,
 rppt@kernel.org, jamorris@linux.microsoft.com, dethoma@microsoft.com,
 akpm@linux-foundation.org, Andrew.Cooper3@citrix.com,
 christina.schimpe@intel.com, debug@rivosinc.com,
 linux-arm-kernel@lists.infradead.org, linux-s390@vger.kernel.org,
 xen-devel@lists.xenproject.org
References: <20230218211433.26859-1-rick.p.edgecombe@intel.com>
 <20230218211433.26859-12-rick.p.edgecombe@intel.com>
 <63f288cc.a70a0220.5558c.3c92@mx.google.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <63f288cc.a70a0220.5558c.3c92@mx.google.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 19.02.23 21:38, Kees Cook wrote:
> On Sat, Feb 18, 2023 at 01:14:03PM -0800, Rick Edgecombe wrote:
>> The x86 Control-flow Enforcement Technology (CET) feature includes a new
>> type of memory called shadow stack. This shadow stack memory has some
>> unusual properties, which requires some core mm changes to function
>> properly.
>>
>> One of these changes is to allow for pte_mkwrite() to create different
>> types of writable memory (the existing conventionally writable type and
>> also the new shadow stack type). Future patches will convert pte_mkwrite()
>> to take a VMA in order to facilitate this, however there are places in the
>> kernel where pte_mkwrite() is called outside of the context of a VMA.
>> These are for kernel memory. So create a new variant called
>> pte_mkwrite_kernel() and switch the kernel users over to it. Have
>> pte_mkwrite() and pte_mkwrite_kernel() be the same for now. Future patches
>> will introduce changes to make pte_mkwrite() take a VMA.
>>
>> Only do this for architectures that need it because they call pte_mkwrite()
>> in arch code without an associated VMA. Since it will only currently be
>> used in arch code, so do not include it in arch_pgtable_helpers.rst.
>>
>> Cc: linux-doc@vger.kernel.org
>> Cc: linux-arm-kernel@lists.infradead.org
>> Cc: linux-s390@vger.kernel.org
>> Cc: xen-devel@lists.xenproject.org
>> Cc: linux-arch@vger.kernel.org
>> Cc: linux-mm@kvack.org
>> Tested-by: Pengfei Xu <pengfei.xu@intel.com>
>> Suggested-by: David Hildenbrand <david@redhat.com>
>> Signed-off-by: Rick Edgecombe <rick.p.edgecombe@intel.com>
> 
> I think it's a little weird that it's the only PTE helper taking a vma,
> but it does seem like the right approach.

Right. We could pass the vm flags instead, but not sure if that really 
improves the situation. So unless someone has a better idea, this LGTM.

-- 
Thanks,

David / dhildenb


