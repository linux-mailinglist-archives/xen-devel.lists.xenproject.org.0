Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C761BA456BF
	for <lists+xen-devel@lfdr.de>; Wed, 26 Feb 2025 08:33:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.896204.1304888 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnBv8-00060W-Q2; Wed, 26 Feb 2025 07:33:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 896204.1304888; Wed, 26 Feb 2025 07:33:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnBv8-0005yM-NJ; Wed, 26 Feb 2025 07:33:30 +0000
Received: by outflank-mailman (input) for mailman id 896204;
 Wed, 26 Feb 2025 07:33:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=J4Ti=VR=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tnBv7-0005yG-QU
 for xen-devel@lists.xenproject.org; Wed, 26 Feb 2025 07:33:29 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f823dbe9-f413-11ef-9897-31a8f345e629;
 Wed, 26 Feb 2025 08:33:27 +0100 (CET)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-4397e5d5d99so40451605e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 25 Feb 2025 23:33:27 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43aba5442c0sm11324255e9.32.2025.02.25.23.33.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Feb 2025 23:33:26 -0800 (PST)
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
X-Inumbo-ID: f823dbe9-f413-11ef-9897-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1740555207; x=1741160007; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=rG2N8pH2CQrEOUyMlGi7i2QjnxYZk/xRFlWMOdTXN3g=;
        b=LSwJlZ7z7kRYE4V7oIor2oK0LwxnFBW+8hLLRjXfb+4w8KB+E5WmpNtvct+dmEjwak
         R7WK2+1sy/HeatQpKEWlUDA7tZPrunlPVxdTfRU9DUqzz7TT1ulP7b55QiNXQP+uG+cL
         zqsagcP6crO+p/PrnRMzAx6c2lhJq73FhaiIhjrZ+mo/DjvlVhy/STx35SgSvD18RFzr
         1FhivcKr+OGDCaLvxfzxmVr7F8s8lLKFWEP+q92rnu/XDzIAqoMUFub2pw9/2nSP1dwq
         qKRXj0zjgNW2y+o4Mnx+mErNpaK7USZYMfayD/h5uX1KsbGyAC2njsYgxw4AfgPb04fN
         qCyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740555207; x=1741160007;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rG2N8pH2CQrEOUyMlGi7i2QjnxYZk/xRFlWMOdTXN3g=;
        b=iMLbGNGv3XE+m552CNX2/2MMunkRyUsI+xzubEn83NYnqrCXD68SgOqtISBOHeXbOD
         NKoCkyy9jRiEFlCe2gcg4dbjNg5/MRTnvK7Jh9SWAQo6Ze6gCeZsKku7X2aWzk2U7/Js
         aMLYFzBNvQEANc+RS2Cygqzw2orP0286NTfdUeEBj8/5dpg1p92Ei4ljhrX7gqPkhdEF
         CdL2aidOt6vF4+GXF1eEnX7q9jgEZQ/vYGgb6ZflilcqOzZb6EE+v6XCJbQdTl+5SkG8
         MP3nv3PgQjX3rnWF4CgjT8nqjiiGVNizfnhFUJa/ke/iSj24gxtE2zljuIhGofGgfBA1
         2BXQ==
X-Forwarded-Encrypted: i=1; AJvYcCX7u13A4O96AbjWR+CSaS7VIm39g+JHGXk9IhrZ+0AowgSwdqjGd8JbBK9Z5ZoPMQ/8Q1w6+u4mLXQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzQM4ZZKkNvsGji1lMQaM0wa//dYvehV4avCpQMBRB5JQKsvEQ2
	KQc0i7Izg+eV0SeXPtjUKq3IXY1sGTNttgrXyWdIdWbC3Z6uB8C4TEu4I8Alqg==
X-Gm-Gg: ASbGncuwMSsTgdTlSqwihLxBiYtp8+2RhSNV02w3+UgSjfyvkQDm04PbcxgQ4xpF+/C
	yR+MsQ5ZW/b/+UcEZpynyTTj0c7C9vyr3RKUFN3E1CksEU8n/mUuACGuj2vJ1QaUN06g7xhSKs7
	qt0hKs8hE75ow8hPjRnRLnwcjyy5liJzmWh5OLe3mSWUj49/XqWAD4Pvlw9+hbtAXRHUI/OEilU
	bxgupu7yZLunwK5tM621tuxSqYnEp4Nfrt8Iax6LoCpsfJX9KqAbS/20Fj2zh/HxJ6OYuUwPDVp
	U496B3xxko2BmLRx0pEmqnayEkP4Xq31qBntdVypGWPH3dlaEkOa/h1Tii8oqIK4xqY6MOs2Ujz
	ohNSKL/kzFT4=
X-Google-Smtp-Source: AGHT+IGA8AsjlF54leAfnOAAbu+obDoUx23ef4wBVc35+jP4RQo3a+XbCB5Yus7C2geIln9U10mnjg==
X-Received: by 2002:a05:600c:3114:b0:439:9e13:2dd0 with SMTP id 5b1f17b1804b1-43ab0f255b5mr49519995e9.6.1740555207133;
        Tue, 25 Feb 2025 23:33:27 -0800 (PST)
Message-ID: <7e77dceb-489b-4022-a665-2a008ddfe844@suse.com>
Date: Wed, 26 Feb 2025 08:33:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen: Don't cast away const-ness in vcpu_show_registers()
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250225230213.1248136-1-andrew.cooper3@citrix.com>
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
In-Reply-To: <20250225230213.1248136-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 26.02.2025 00:02, Andrew Cooper wrote:
> The final hunk is `(struct vcpu *)v` in disguise, expressed using a runtime
> pointer chase through memory and a technicality of the C type system to work
> around the fact that get_hvm_registers() strictly requires a mutable pointer.
> 
> For anyone interested, this is one reason why C cannot optimise any reads
> across sequence points, even for a function purporting to take a const object.
> 
> Anyway, have the function correctly state that it needs a mutable vcpu.  All
> callers have a mutable vCPU to hand, and it removes the runtime pointer chase
> in x86.
> 
> Make one style adjustment in ARM while adjusting the parameter type.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Anthony PERARD <anthony.perard@vates.tech>
> CC: Michal Orzel <michal.orzel@amd.com>
> CC: Jan Beulich <jbeulich@suse.com>
> CC: Julien Grall <julien@xen.org>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
> CC: Bertrand Marquis <bertrand.marquis@arm.com>
> 
> RISC-V and PPC don't have this helper yet, not even in stub form.
> 
> I expect there will be one objection to this patch.  Since the last time we
> fought over this, speculative vulnerabilities have demonstrated how dangerous
> pointer chases are, and this is a violation of Misra Rule 11.8, even if it's
> not reasonable for Eclair to be able to spot and reject it.

On these grounds
Acked-by: Jan Beulich <jbeulich@suse.com>
irrespective of the fact that a function of this name and purpose really, really
should be taking a pointer-to-const.

Considering ...

> --- a/xen/arch/arm/include/asm/domain.h
> +++ b/xen/arch/arm/include/asm/domain.h
> @@ -243,7 +243,7 @@ struct arch_vcpu
>  
>  }  __cacheline_aligned;
>  
> -void vcpu_show_registers(const struct vcpu *v);
> +void vcpu_show_registers(struct vcpu *v);

... this and ...

> --- a/xen/arch/x86/include/asm/domain.h
> +++ b/xen/arch/x86/include/asm/domain.h
> @@ -688,7 +688,7 @@ bool update_secondary_system_time(struct vcpu *v,
>  void force_update_secondary_system_time(struct vcpu *v,
>                                          struct vcpu_time_info *map);
>  
> -void vcpu_show_registers(const struct vcpu *v);
> +void vcpu_show_registers(struct vcpu *v);

... this are the same, and there's nothing different to expect for other
architectures, centralizing the declaration and then adding a comment to
cover the non-const property may be desirable. Else people like me might
forget that there was this change, and try to re-add the seemingly
missing const.

Jan

