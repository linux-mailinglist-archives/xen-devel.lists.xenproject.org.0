Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6187A945EA2
	for <lists+xen-devel@lfdr.de>; Fri,  2 Aug 2024 15:26:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.771171.1181740 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZsIE-0003yk-9v; Fri, 02 Aug 2024 13:26:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 771171.1181740; Fri, 02 Aug 2024 13:26:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZsIE-0003vx-5y; Fri, 02 Aug 2024 13:26:02 +0000
Received: by outflank-mailman (input) for mailman id 771171;
 Fri, 02 Aug 2024 13:26:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FJ6P=PB=suse.com=nik.borisov@srs-se1.protection.inumbo.net>)
 id 1sZsIC-0003vr-Sx
 for xen-devel@lists.xenproject.org; Fri, 02 Aug 2024 13:26:00 +0000
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [2a00:1450:4864:20::232])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c1f470ef-50d2-11ef-bc03-fd08da9f4363;
 Fri, 02 Aug 2024 15:25:59 +0200 (CEST)
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-2eeb1ba0468so121538961fa.0
 for <xen-devel@lists.xenproject.org>; Fri, 02 Aug 2024 06:25:59 -0700 (PDT)
Received: from [192.168.0.20] (nborisov.ddns.nbis.net. [109.121.143.186])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5b83b92b970sm1125275a12.72.2024.08.02.06.25.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 02 Aug 2024 06:25:58 -0700 (PDT)
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
X-Inumbo-ID: c1f470ef-50d2-11ef-bc03-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1722605159; x=1723209959; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cJhmQirVizUqOCgmsekY21nCq2G6MWUHMhqZQdlEfZc=;
        b=MXynIDcbyaftastIns+hsE3wav89LHzmYWLr9KYn98BH8W4KURCF8KNjFmV2wpZKs8
         vvjkZwrC3mRCSIRcG041BMm3cCb+oIBRUPpJH1bWFTZQ0yeZTcWyzp8DfQB3FcIYeH1i
         zO6A/OrwYJbTXw99hU5MvzXlkM4vkRTePdbXNnpylHQ/tsc+nclkgxpkIiN3jDPMd3Hl
         75sH82xg0cRAmBqja79mUiAXGY3cwuRLqUThvLpqW/HCE0A5Zv25WumnlP69WUrJOnRQ
         v6UXbOx059hDiYYUB4KYYdulvbCTfmtmDRAVxizx7Ox3VqT/IZvuqnVAVBXOpNkkBifK
         skRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722605159; x=1723209959;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cJhmQirVizUqOCgmsekY21nCq2G6MWUHMhqZQdlEfZc=;
        b=IB8d8EGDx+Vi359viCKJmKmqGkPeVxgC5t/3Kh2asZEGYfNkZwmUc9syaTwal27My0
         HUgi/7JQjOFejgSADqjToADTdVUze/8uM2Lxf80dr3H9fvkxMAD+/7rGt495lU8iV58d
         Zmzj03B5OneeKJp/8UvlVM8AkyUa25EjiItZjB8DbqJybY9NBAWFoD0eOXTiFUmmajE3
         yahufkBY7K1MIy4NF2jEItjbbPdkr+rypOK2NIQgaKUj0eJJkCN3sa3tkBqMiAJoZRnB
         9rjqav0hyZ5hpuoQjg4A45P6QGH4GTTirhTa7mBLwbJr3qfNQUk0cfz65LjW4CzZqz7N
         Uagg==
X-Gm-Message-State: AOJu0YyZLbhCMKkU6bxKEYGsJrTXkuo2Ek2ZVxgQHNI9oAG3EDtvTPq3
	GOvezqPUSt7Jnu4TGCdSJ6fiTRzABUWAWhoSzPqpkYifX2m0jwiXdPuNVIvYvVg=
X-Google-Smtp-Source: AGHT+IHBvsYwfwOgou5WXpOcO14cjQZULKYPfbBjoNyalongwp4wd13+FAnvLOiLZkJZEUFWOqqo9w==
X-Received: by 2002:a2e:88d9:0:b0:2ef:2617:8952 with SMTP id 38308e7fff4ca-2f15aaa8480mr22670781fa.18.1722605159128;
        Fri, 02 Aug 2024 06:25:59 -0700 (PDT)
Message-ID: <824e522d-c9e2-4e24-8ce6-aca6573db06a@suse.com>
Date: Fri, 2 Aug 2024 16:25:56 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] x86/cpu: fix unbootable VMs by inlining memcmp in
 hypervisor_cpuid_base
To: Alexey Dobriyan <adobriyan@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>
Cc: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org,
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
 Juergen Gross <jgross@suse.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>
References: <a9f505a6-fd31-4cfa-a193-d21638bb14f1@p183>
 <304592cf-e4a7-4ba1-baa6-4941c60f0e3c@p183>
From: Nikolay Borisov <nik.borisov@suse.com>
Content-Language: en-US
In-Reply-To: <304592cf-e4a7-4ba1-baa6-4941c60f0e3c@p183>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 2.08.24 г. 11:50 ч., Alexey Dobriyan wrote:
> If this memcmp() is not inlined then PVH early boot code can call
> into KASAN-instrumented memcmp() which results in unbootable VMs:
> 
> 	pvh_start_xen
> 	xen_prepare_pvh
> 	xen_cpuid_base
> 	hypervisor_cpuid_base
> 	memcmp
> 
> Ubuntu's gcc version 11.4.0 (Ubuntu 11.4.0-1ubuntu1~22.04) inlines
> memcmp with patch and the bug is partially fixed.
> 
> Leave FIXME just in case someone cares enough to compare 3 pairs of
> integers like 3 pairs of integers.
> 
> Signed-off-by: Alexey Dobriyan <adobriyan@gmail.com>
> ---
> 
>   arch/x86/include/asm/cpuid.h | 15 ++++++++++++++-
>   1 file changed, 14 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/x86/include/asm/cpuid.h b/arch/x86/include/asm/cpuid.h
> index 6b122a31da06..3eca7824430e 100644
> --- a/arch/x86/include/asm/cpuid.h
> +++ b/arch/x86/include/asm/cpuid.h
> @@ -196,7 +196,20 @@ static inline uint32_t hypervisor_cpuid_base(const char *sig, uint32_t leaves)
>   	for_each_possible_hypervisor_cpuid_base(base) {
>   		cpuid(base, &eax, &signature[0], &signature[1], &signature[2]);
>   
> -		if (!memcmp(sig, signature, 12) &&
> +		/*
> +		 * FIXME rewrite cpuid comparators to accept uint32_t[3].
> +		 *
> +		 * This memcmp()
> +		 * a) is called from PVH early boot code
> +		 *    before instrumentation is set up,
> +		 * b) may be compiled to "call memcmp" (not inlined),
> +		 * c) memcmp() itself may be instrumented.
> +		 *
> +		 * Any combination of 2 is fine, but all 3 aren't.
> +		 *
> +		 * Force inline this function call.
> +		 */
> +		if (!__builtin_memcmp(sig, signature, 12) &&

Instead of putting this giant FIXME, why not simply do the comparison as 
ints, i.e ((uint32_t)&sig[0]) == signature1 && ((uitn32_t)&sig[4]) == 
signature2 && ((uint32_t)&sig[8] == signature_3  and be done with it?

>   		    (leaves == 0 || ((eax - base) >= leaves)))
>   			return base;
>   	}
> 

