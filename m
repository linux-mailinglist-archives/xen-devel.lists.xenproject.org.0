Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A8D38A50120
	for <lists+xen-devel@lfdr.de>; Wed,  5 Mar 2025 14:56:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.902301.1310252 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tppED-0006Vx-Vw; Wed, 05 Mar 2025 13:56:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 902301.1310252; Wed, 05 Mar 2025 13:56:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tppED-0006UV-T1; Wed, 05 Mar 2025 13:56:05 +0000
Received: by outflank-mailman (input) for mailman id 902301;
 Wed, 05 Mar 2025 13:56:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2gZc=VY=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tppEC-0006Ph-SY
 for xen-devel@lists.xenproject.org; Wed, 05 Mar 2025 13:56:04 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9355408a-f9c9-11ef-9898-31a8f345e629;
 Wed, 05 Mar 2025 14:56:02 +0100 (CET)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-43bcfa6c57fso8632675e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 05 Mar 2025 05:56:02 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43bd435c9c7sm17754145e9.38.2025.03.05.05.56.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Mar 2025 05:56:02 -0800 (PST)
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
X-Inumbo-ID: 9355408a-f9c9-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1741182962; x=1741787762; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=2Z8NB8IeaSTYCAeMX2FipNfSwuZ85aRsFafrfowAlDA=;
        b=PzpDYT51HOWORnttv6FnktKq5DmlhkHxgc+ocRg7ds8/bm8V2Ky/GCCOuUIOSERAhR
         i+9R5kjx+c24Dc3RJd0s5+AvdOHeGWkI2wwqck2b9IpTyMlDhrvXDpKbWyrtk+HeWWI1
         rYTGC7dEYDqP4ImO2tTEVHmyUPNTpzB/8KOop7sY2ZLpmtt63CoDV8Q/psmZ34nlg48N
         x6r5rIMBYRWitMAgThK0fZ7nGhqxVaVIE5TeibEs348yvx7W8XBmIDw4uaPtQqhPChOm
         XT+qkisy2VmGzIroKPJpHa7MZYOHnNdVafmLfgjlL5vToml2esvYIaxxiIRFEzcFjQrE
         rX3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741182962; x=1741787762;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2Z8NB8IeaSTYCAeMX2FipNfSwuZ85aRsFafrfowAlDA=;
        b=i3BFkHk7BzcsgyOLFD1rKuxA0bmO7D7LVdF2mcMIiUFvmzcLDIERNoZx0N24ojAH54
         BNT2mtNcMEt0EgdP3rwOlWubbQOFgxn8OzxKuOHgRwtXY3WRKzEITdzM3ykgMkzohCru
         0LTPgp1ACkGnya1cCa5msWHChux71aYKJelU/Elm6QaOtxB5P8dAjlCtgLG78cFCN8M/
         1fTODq1P6zWFdcPA05ZoAAH4mFmeLuq78deP/1eNjUDiKZeKKirNc3nbHIW8H2lNgFKj
         nN4s3fAEI8qEqaxVvWxDqY10V/fXUupHmg/UhetxvYp5258WPj9H++ABrE9xQp3ifEjz
         7NwA==
X-Forwarded-Encrypted: i=1; AJvYcCVDlwi0WcyGV0Enzk1BmXlcmSzplt1iWUrDOaVh4ctKrrdjx7vZn3mnE0/6Rkr8wquImkdBRUVPYnk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzAb9z2WHy4l8PKMEuvVlv/c6cWyrWmwAY7Wr0Thf0PbmY+9/+i
	qrB2Ks1OLFLLwJeeXjZ4D2B2XbMEzqamjnjgtElZOvGNH9M1+jWBQrMdFgzrIw==
X-Gm-Gg: ASbGncu95nH70zkhPzUvgGj1VJlDufJrV53ouVVgOthSJ4TEwI7427JTWw06ReiIlo4
	zmr/JGJkbQ11RPu/UR4u75y1y+1M3yDg2dB+SR+9KoGCZxvuQWjJSqgM3Znc3PKUZDuutJ+0pBf
	hcuKx1H3jNASwGrL2eVXYwtFSCySG7oLXZc2fzH+0VdLveYbl67sRe/sabQNxGoH28w6aB+I6GA
	xDkbNmjBbfYht+zGOH+GdoDIb6gKhadjDDSNe03HMurLfwB3jDxOfzVmdBlI+ZzOfNTWrL/2y1W
	s8VR/WbMxVjBQ0KwJvOMhUqEXdF6KdW0JZQCT6uv8Qf/d2JTWTspJMSsiGVLpwj9ec0rDHDImsd
	veTTs6ZGuChNvy3sxB2553Zl6r5hkpQ==
X-Google-Smtp-Source: AGHT+IEBkt+VhNdu8A/S1myqfVfpGH3Et5fs/BwACRwc8BbsMpOPl/7QZuAHhUZPnCQCdpqIXt611A==
X-Received: by 2002:a05:600c:1988:b0:43b:cc3c:60ca with SMTP id 5b1f17b1804b1-43bd29b4435mr21020005e9.21.1741182962268;
        Wed, 05 Mar 2025 05:56:02 -0800 (PST)
Message-ID: <a3be52ef-77a9-46f3-9f9b-1f4e230d6c29@suse.com>
Date: Wed, 5 Mar 2025 14:56:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] x86/vlapic: Drop vlapic->esr_lock
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20250303185352.86499-1-andrew.cooper3@citrix.com>
 <20250303185352.86499-3-andrew.cooper3@citrix.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
In-Reply-To: <20250303185352.86499-3-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 03.03.2025 19:53, Andrew Cooper wrote:
> The exact behaviour of LVTERR interrupt generation is implementation
> specific.
> 
>  * Newer Intel CPUs generate an interrupt when pending_esr becomes
>    nonzero.
> 
>  * Older Intel and all AMD CPUs generate an interrupt when any
>    individual bit in pending_esr becomes nonzero.
> 
> Neither vendor documents their behaviour very well.  Xen implements
> the per-bit behaviour and has done since support was added.
> 
> Importantly, the per-bit behaviour can be expressed using the atomic
> operations available in the x86 architecture, whereas the
> former (interrupt only on pending_esr becoming nonzero) cannot.
> 
> With vlapic->hw.pending_esr held outside of the main regs page, it's
> much easier to use atomic operations.
> 
> Use xchg() in vlapic_reg_write(), and *set_bit() in vlapic_error().
> 
> The only interesting change is that vlapic_error() now needs to take a
> single bit only, rather than a mask, but this fine for all current
> callers and forseable changes.
> 
> No practical change.

From a guest perspective that is.

> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

> @@ -124,15 +126,12 @@ static void vlapic_error(struct vlapic *vlapic, unsigned int errmask)
>              if ( (lvterr & APIC_VECTOR_MASK) >= 16 )
>                   inj = true;

I wouldn't, btw, mind if you also corrected this indentation screw-up of
mine along with you doing so ...

>              else
> -                 errmask |= APIC_ESR_RECVILL;
> +                set_bit(ilog2(APIC_ESR_RECVILL), &vlapic->hw.pending_esr);

... here.

Jan

