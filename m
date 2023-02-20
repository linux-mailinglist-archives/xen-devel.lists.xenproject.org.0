Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E50B69C9A5
	for <lists+xen-devel@lfdr.de>; Mon, 20 Feb 2023 12:20:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.498028.768814 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pU4D3-00070p-9c; Mon, 20 Feb 2023 11:19:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 498028.768814; Mon, 20 Feb 2023 11:19:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pU4D3-0006xk-5W; Mon, 20 Feb 2023 11:19:53 +0000
Received: by outflank-mailman (input) for mailman id 498028;
 Mon, 20 Feb 2023 11:19:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=H5V/=6Q=redhat.com=david@srs-se1.protection.inumbo.net>)
 id 1pU4D2-0006xe-8K
 for xen-devel@lists.xenproject.org; Mon, 20 Feb 2023 11:19:52 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7d472a48-b110-11ed-933d-83870f6b2ba8;
 Mon, 20 Feb 2023 12:19:51 +0100 (CET)
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-59-fQcdAjn9PaiHiwn9PynL9g-1; Mon, 20 Feb 2023 06:19:46 -0500
Received: by mail-wm1-f69.google.com with SMTP id
 bg22-20020a05600c3c9600b003e209b61ebbso396854wmb.3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Feb 2023 03:19:46 -0800 (PST)
Received: from ?IPV6:2003:cb:c705:8300:e519:4218:a8b5:5bec?
 (p200300cbc7058300e5194218a8b55bec.dip0.t-ipconnect.de.
 [2003:cb:c705:8300:e519:4218:a8b5:5bec])
 by smtp.gmail.com with ESMTPSA id
 z5-20020a5d6405000000b002c5534db60bsm713917wru.71.2023.02.20.03.19.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Feb 2023 03:19:44 -0800 (PST)
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
X-Inumbo-ID: 7d472a48-b110-11ed-933d-83870f6b2ba8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1676891989;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4Y0d/vI0Qp2mhR9IQ+0FEQIh8Qkf0r9E2FFAh9KN8Lg=;
	b=FPw99/XYfI9dw0GAndEKb/PzBONw4VcW8WwH3a15hqlI5RQ9zE+fZNTys4MFEJGSNk8oCh
	L2dO6sty/H+scfmI8o7vV0hnrzN5iMRss4pdjnEVTy6hoqAni7Sy8kwPkbd443LghbLoJc
	Srl1rvGqC8+VDgmhwPyRDg6V+neQgvA=
X-MC-Unique: fQcdAjn9PaiHiwn9PynL9g-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4Y0d/vI0Qp2mhR9IQ+0FEQIh8Qkf0r9E2FFAh9KN8Lg=;
        b=2cTb07fOrqSq7N06uppcSRc2L23FcH1TjCvExF0O3blmB84HbzC5du/kq/x6f4VnGP
         tKdtoYEmD79+y6nXM3iA/C/w13B1ggJXz+JmcG/xwCeXSiMFRDg/ScsXZzovvJasClXo
         OgiMldKlYqWt2ScG79UdzyF15rDo6kNvO1lQ4WS9tKM0AD8xx1TsIzpIpGE542vgfHev
         p37IFbal26DcEWvqP+sSV6I6rKPG88yLe3er78PPIQ3ZcPRxPv9dnOJeRG5ma1YJYKIN
         1lwL4sMPJeDuFRUmfEVwbwZHXjYREIQOyBhBeizdMUrA6QjYGDzYBe/iNyt3qI4fcvLQ
         oTSg==
X-Gm-Message-State: AO0yUKU8ew75Q58N/8Uf9PXrcfhqjSjx/TGCHZqKeWVSEG/6UmG0mJ/T
	Ntx/M3h8JS3mEZ89znJZdPjJW2ZksV49TI75PvDgQTQHQe6OhXXV6AxrUCbs0FAr53j3Vs/HcLK
	PGK1vFLFh3PxcepsKMIx2+yzDz0E=
X-Received: by 2002:a05:600c:13c3:b0:3e0:39:ec9d with SMTP id e3-20020a05600c13c300b003e00039ec9dmr667653wmg.23.1676891985217;
        Mon, 20 Feb 2023 03:19:45 -0800 (PST)
X-Google-Smtp-Source: AK7set8gwoTHdOCWEVucXLZ1cWaezJA5lkFoQjhOhQbs8nj/fdafmDMVp3INR4+sjGhG9kWSgEqR2w==
X-Received: by 2002:a05:600c:13c3:b0:3e0:39:ec9d with SMTP id e3-20020a05600c13c300b003e00039ec9dmr667628wmg.23.1676891984832;
        Mon, 20 Feb 2023 03:19:44 -0800 (PST)
Message-ID: <77f5e061-080b-f9f0-25f7-bbbe721b5e2e@redhat.com>
Date: Mon, 20 Feb 2023 12:19:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH v6 11/41] mm: Introduce pte_mkwrite_kernel()
To: Rick Edgecombe <rick.p.edgecombe@intel.com>, x86@kernel.org,
 "H . Peter Anvin" <hpa@zytor.com>, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-mm@kvack.org, linux-arch@vger.kernel.org,
 linux-api@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 Andy Lutomirski <luto@kernel.org>, Balbir Singh <bsingharora@gmail.com>,
 Borislav Petkov <bp@alien8.de>, Cyrill Gorcunov <gorcunov@gmail.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Eugene Syromiatnikov <esyr@redhat.com>, Florian Weimer <fweimer@redhat.com>,
 "H . J . Lu" <hjl.tools@gmail.com>, Jann Horn <jannh@google.com>,
 Jonathan Corbet <corbet@lwn.net>, Kees Cook <keescook@chromium.org>,
 Mike Kravetz <mike.kravetz@oracle.com>, Nadav Amit <nadav.amit@gmail.com>,
 Oleg Nesterov <oleg@redhat.com>, Pavel Machek <pavel@ucw.cz>,
 Peter Zijlstra <peterz@infradead.org>, Randy Dunlap <rdunlap@infradead.org>,
 Weijiang Yang <weijiang.yang@intel.com>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
 John Allen <john.allen@amd.com>, kcc@google.com, eranian@google.com,
 rppt@kernel.org, jamorris@linux.microsoft.com, dethoma@microsoft.com,
 akpm@linux-foundation.org, Andrew.Cooper3@citrix.com,
 christina.schimpe@intel.com, debug@rivosinc.com
Cc: linux-arm-kernel@lists.infradead.org, linux-s390@vger.kernel.org,
 xen-devel@lists.xenproject.org
References: <20230218211433.26859-1-rick.p.edgecombe@intel.com>
 <20230218211433.26859-12-rick.p.edgecombe@intel.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20230218211433.26859-12-rick.p.edgecombe@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 18.02.23 22:14, Rick Edgecombe wrote:
> The x86 Control-flow Enforcement Technology (CET) feature includes a new
> type of memory called shadow stack. This shadow stack memory has some
> unusual properties, which requires some core mm changes to function
> properly.
> 
> One of these changes is to allow for pte_mkwrite() to create different
> types of writable memory (the existing conventionally writable type and
> also the new shadow stack type). Future patches will convert pte_mkwrite()
> to take a VMA in order to facilitate this, however there are places in the
> kernel where pte_mkwrite() is called outside of the context of a VMA.
> These are for kernel memory. So create a new variant called
> pte_mkwrite_kernel() and switch the kernel users over to it. Have
> pte_mkwrite() and pte_mkwrite_kernel() be the same for now. Future patches
> will introduce changes to make pte_mkwrite() take a VMA.
> 
> Only do this for architectures that need it because they call pte_mkwrite()
> in arch code without an associated VMA. Since it will only currently be
> used in arch code, so do not include it in arch_pgtable_helpers.rst.
> 
> Cc: linux-doc@vger.kernel.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-s390@vger.kernel.org
> Cc: xen-devel@lists.xenproject.org
> Cc: linux-arch@vger.kernel.org
> Cc: linux-mm@kvack.org
> Tested-by: Pengfei Xu <pengfei.xu@intel.com>
> Suggested-by: David Hildenbrand <david@redhat.com>
> Signed-off-by: Rick Edgecombe <rick.p.edgecombe@intel.com>
>

Acked-by: David Hildenbrand <david@redhat.com>

Do we also have to care about pmd_mkwrite() ?

-- 
Thanks,

David / dhildenb


