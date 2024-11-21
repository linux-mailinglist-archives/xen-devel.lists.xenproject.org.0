Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EE7669D4BD0
	for <lists+xen-devel@lfdr.de>; Thu, 21 Nov 2024 12:26:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.841393.1256881 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tE5KN-0006yW-Rr; Thu, 21 Nov 2024 11:26:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 841393.1256881; Thu, 21 Nov 2024 11:26:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tE5KN-0006wC-PE; Thu, 21 Nov 2024 11:26:27 +0000
Received: by outflank-mailman (input) for mailman id 841393;
 Thu, 21 Nov 2024 11:26:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XSdi=SQ=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tE5KM-0006w5-Mr
 for xen-devel@lists.xenproject.org; Thu, 21 Nov 2024 11:26:26 +0000
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [2a00:1450:4864:20::534])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6f3472b3-a7fb-11ef-a0cc-8be0dac302b0;
 Thu, 21 Nov 2024 12:26:21 +0100 (CET)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-5cfe5da1251so1034621a12.1
 for <xen-devel@lists.xenproject.org>; Thu, 21 Nov 2024 03:26:21 -0800 (PST)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5cff442a162sm1757172a12.0.2024.11.21.03.26.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Nov 2024 03:26:20 -0800 (PST)
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
X-Inumbo-ID: 6f3472b3-a7fb-11ef-a0cc-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo1MzQiLCJoZWxvIjoibWFpbC1lZDEteDUzNC5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjZmMzQ3MmIzLWE3ZmItMTFlZi1hMGNjLThiZTBkYWMzMDJiMCIsInRzIjoxNzMyMTg4MzgxLjgwODY2MSwic2VuZGVyIjoiYW5kcmV3LmNvb3BlckBjbG91ZC5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1732188381; x=1732793181; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Mr/uEuTuwaVtK7fPqMj1nrNWUcYuzlJf5lqdivEiiu8=;
        b=sv5WG2+SCsfDUHxwMBZGdSq05no78MpxarOMzOb/iCXLF5V1Cy7fxpJuu+DBhxHtT7
         6Cp4hgZSn2VQw1Mcl7Pa/RWn8Ml18GRK8DIRu7BLrIGkJkjzZYvtK981wNWd/B7tjLwR
         RlWX+FPzcX8YG4i9cKSKkc8XBfZk1i+B+vnYU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732188381; x=1732793181;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mr/uEuTuwaVtK7fPqMj1nrNWUcYuzlJf5lqdivEiiu8=;
        b=bF00ouNkXZOHBCV3e8O8fcWnUo5V0OELZF9fZEsjhpI2aFGl47PL6C8UwOvuMBIJsA
         JG7ZpYd3HyV52xMGIUHP8HmU0RlYCBWIPwzH9vDXCczq75UDNijp1LflB72uZktQGtk0
         2XZeEUn4Btv0qbYWbKaGXcvMO51mhh+3oJF78NcxBqjC0om+Ae5kHZ12nSlANz26FDD0
         iTZUX2rOzXJqIGCHTgx5Nir1z6TxsysN1xA8J1nzJ0vUUohCMHZONSBARH0HeYkP5CGr
         9nDVAxqYaRFwwXSNFk+lVAHkL25gv371i+1A/rCrCRr7s4vcRIkqwfz+6TekdCCzGk35
         uRkg==
X-Forwarded-Encrypted: i=1; AJvYcCUrup3XW7uYPLigoZyNWbrc9i2wr6hBg4/xQNFJSTTpTtpyQkCFqkb2aOzdlxfqw3UBditNBl+4J9I=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yze7wbI8ZGgjSwq+X4x23AbnRWr5l1eexDcQpS+hYUOpyzSgVzl
	zvs0g8oHYxw5vesR6efj3U9FJcZVkKSmrZJgSyRa9lqD7/dUdcayJ401njF3ro8=
X-Google-Smtp-Source: AGHT+IEcdmxGCSfm272Ko8HtpRoWYJdkGIxzeQjM9KMmnHs5/Ryn2EmyDypdbk4gqCDqoT41unT6Sg==
X-Received: by 2002:a05:6402:5253:b0:5cf:9cd1:1f77 with SMTP id 4fb4d7f45d1cf-5cff4c52b03mr3724929a12.8.1732188381144;
        Thu, 21 Nov 2024 03:26:21 -0800 (PST)
Message-ID: <03053e3b-c101-4cc2-9f59-604e84f92ea0@citrix.com>
Date: Thu, 21 Nov 2024 11:26:19 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/pv: limit GDT and LDT mappings areas to max number of
 vCPUs
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>
References: <20241121111218.50984-1-roger.pau@citrix.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20241121111218.50984-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 21/11/2024 11:12 am, Roger Pau Monne wrote:
> The allocation of the paging structures in the per-domain area for mapping the
> guest GDT and LDT can be limited to the maximum number of vCPUs the guest can
> have.  The maximum number of vCPUs is available at domain creation since commit
> 4737fa52ce86.
>
> Limiting to the actual number of vCPUs avoids wasting memory for paging
> structures that will never be used.  Current logic unconditionally uses 513
> pages, one page for the L3, plus 512 L1 pages.  For guests with equal or less
> than 16 vCPUs only 2 pages are used (each guest vCPU GDT/LDT can only consume
> 32 L1 slots).
>
> No functional change intended, all possible domain vCPUs should have the GDT
> and LDT paging structures allocated and setup at domain creation, just like
> before the change.
>
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Ooh, that's a optimisation I'd not considered when doing the work.

But, is it really only the the LDT/GDT area which can benefit from
this?  The XLAT area seems like another good candidate.

> ---
>  xen/arch/x86/pv/domain.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/xen/arch/x86/pv/domain.c b/xen/arch/x86/pv/domain.c
> index d5a8564c1cbe..e861e3ce71d9 100644
> --- a/xen/arch/x86/pv/domain.c
> +++ b/xen/arch/x86/pv/domain.c
> @@ -346,7 +346,7 @@ void pv_domain_destroy(struct domain *d)
>      pv_l1tf_domain_destroy(d);
>  
>      destroy_perdomain_mapping(d, GDT_LDT_VIRT_START,
> -                              GDT_LDT_MBYTES << (20 - PAGE_SHIFT));
> +                              d->max_vcpus << GDT_LDT_VCPU_SHIFT);

Probably not for this patch, but, should we really be passing in a size
here?

Don't we just want to tear down everything in the relevant slot?

>  
>      XFREE(d->arch.pv.cpuidmasks);
>  
> @@ -377,7 +377,7 @@ int pv_domain_initialise(struct domain *d)
>          goto fail;
>  
>      rc = create_perdomain_mapping(d, GDT_LDT_VIRT_START,
> -                                  GDT_LDT_MBYTES << (20 - PAGE_SHIFT),
> +                                  d->max_vcpus << GDT_LDT_VCPU_SHIFT,
>                                    NULL, NULL);

I'd suggest putting a note here saying that the maximum bound for PV
vCPUs is governed by GDT_LDT_MBYTES.

Or alternatively, we could have create_perdomain_mapping() fail if it
tries to allocate more than one slot's worth of mappings?   It feels
like an acceptable safety net.

~Andrew

