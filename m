Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 442B6B25CE7
	for <lists+xen-devel@lfdr.de>; Thu, 14 Aug 2025 09:19:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1080875.1441047 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umSEe-0005K7-4p; Thu, 14 Aug 2025 07:18:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1080875.1441047; Thu, 14 Aug 2025 07:18:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umSEe-0005I0-2C; Thu, 14 Aug 2025 07:18:52 +0000
Received: by outflank-mailman (input) for mailman id 1080875;
 Thu, 14 Aug 2025 07:18:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xqZt=22=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1umSEd-0005Hu-4j
 for xen-devel@lists.xenproject.org; Thu, 14 Aug 2025 07:18:51 +0000
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [2a00:1450:4864:20::52a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ebe31ed9-78de-11f0-b898-0df219b8e170;
 Thu, 14 Aug 2025 09:18:48 +0200 (CEST)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-61868d83059so3045207a12.0
 for <xen-devel@lists.xenproject.org>; Thu, 14 Aug 2025 00:18:48 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af91a22057esm2530827566b.115.2025.08.14.00.18.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Aug 2025 00:18:47 -0700 (PDT)
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
X-Inumbo-ID: ebe31ed9-78de-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1755155928; x=1755760728; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=mklUsJ7vxGTUC2EwtB+R6sguZ1NogECxb5Z+hL4e/Xo=;
        b=G/SINh/EEuTR9eEu2cpZexfOp+B3vSWG2/FDaJ5JBNN6sUdph57lpQKmtvTBcyqltI
         tIrjWfAk9m+FZMOaC2WLoFDNt2kTgMWbSU4m3FiTIs73SRmE9u0XKBLtpo9BVSwuANBy
         lqiUaZWNM3MFwBiAzmETdF2tO/EyPWtB+oxUm7M2Ug6XiYXS0/8O2f8m8ej0+mqWVrAy
         gtiT4szTi4gDekmOes3f+uUIFONsP3QXAZuKSIuFDAhM+TaAq9/IyXcsvLO7euNI2W+l
         Bp4hDuaRdGQxocsULu/8O92Mr2e2jPRJ7E3mujSw52rpOFNPcS3Zw4G0jfmWQaJnHPjZ
         Au+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755155928; x=1755760728;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mklUsJ7vxGTUC2EwtB+R6sguZ1NogECxb5Z+hL4e/Xo=;
        b=ZklC4mG3qjOypC+dlr4w63U4snWOJK5yTJkVGpzH3ZAJ+tEwIEIAJzyAqIYQdVSdNR
         VFv8BbUovQ0CXgvpmY1OjyQNMkGXQzyhyhm1WOzCiMhpzUDXFSJVudtIIWpnxxP/laIG
         VXiobbLz4vqGYqGt8J3SkUAdaqT9LXAKgA2TPIUQQ3HruEhBJFt2Lb8k2oxsmvBH/s7K
         C1vhUWCPscziqDaco73nuSrfQomJZnkamXD7A68bFohpmsLEXAoJ0AMyg3iQ0oKVl35W
         ymmM12zlB7/qkaYJTmZaCKnEtgqa+rkKVzmW3Ubr/a0q1wwjlkpSiG/q+UVlDypPVpJC
         2qnA==
X-Forwarded-Encrypted: i=1; AJvYcCVRX8gk9NtqAhhbE50Janh11bLqjav4JRrGh7WS3XXxuaeOrblBJbOK/Ve7vVfG4/C0/mimv0GXAKA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YycVJbgg2YLK/qK0ytPSgUsLSLfa0gFueopF9QGJ9bR1pSLhS4T
	VCB1EoFj82W5b4I7pkCGPRw3ixctBaZozsq81aMyg6OetuRVS4/P9Dw8coXnST9Gaw==
X-Gm-Gg: ASbGncvEd8hG8V7T7H7cvm5ewK9Kp+5mw7fNkHtOqGpEWrEX+pOkq81TQmHQdysDvY/
	v1LgstrKx6hDiyvwPuE+RsUgE6CljuURX/e5077KyEiIqsnqxbam3lZNRw3dDw83H/rjDD+QE0y
	09Y/DqYApmARnhgje+WC5yvvoWp90gZ5eDSOzzEUTYNB1vwa+fxmm7110awL3EXlRHffpJYW2tX
	GkThu6GCitR11J007NmBViaP4Uee2OfmldFY/XbSYt19L1dBMtYPDPudMCUSvqQrch0mwfCBjlz
	YnFemdyunRHFMaD+JgmPT1OlRleAigqf+P4X8FFv4DEqRXosTxipiw4I9sJ6UYHE8l931VAlz6+
	+K0JwuoxZ9Fo6UKlOZB+c9vagEgFXDJ4a5YGFecbIMEvWAbWzSTi0YLtF9n9Drr7oRJidpB9O+u
	XXBLdemRA8tKbCDn3Y3I/PHEfHl/R8
X-Google-Smtp-Source: AGHT+IG4mDVtUBk731gRojJHAGLMdBBwSSNKler09eZui66saknVY6GhFzK3RBpuy97lhkS7c+QLFg==
X-Received: by 2002:a17:906:d54b:b0:af9:41a4:25b3 with SMTP id a640c23a62f3a-afcbd93582cmr146452466b.29.1755155927803;
        Thu, 14 Aug 2025 00:18:47 -0700 (PDT)
Message-ID: <e644c968-ab68-49f4-801e-0f161fd85f2e@suse.com>
Date: Thu, 14 Aug 2025 09:18:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] pdx: cast PAGE_SIZE value ahead of shifting
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20250813125538.78174-1-roger.pau@citrix.com>
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
In-Reply-To: <20250813125538.78174-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13.08.2025 14:55, Roger Pau Monne wrote:
> --- a/xen/common/pdx.c
> +++ b/xen/common/pdx.c
> @@ -288,7 +288,7 @@ bool __init pfn_pdx_compression_setup(paddr_t base)
>  
>      pfn_pdx_hole_shift  = hole_shift;
>      pfn_pdx_bottom_mask = (1UL << bottom_shift) - 1;
> -    ma_va_bottom_mask   = (PAGE_SIZE << bottom_shift) - 1;
> +    ma_va_bottom_mask   = ((paddr_t)PAGE_SIZE << bottom_shift) - 1;

Given

#define PAGE_SIZE           (_AC(1,L) << PAGE_SHIFT)

this shouldn't be needed, except maybe for Arm32. There, however, ...

>      pfn_hole_mask       = ((1UL << hole_shift) - 1) << bottom_shift;

... this and the shift immediately ahead would also be a problem afaict,
which makes me conclude this isn't what Coverity has looked at. I expect
the problem is with the toolstack side definition of PAGE_SIZE, which imo
would rather be addressed there. (And yes, I'm pretty averse to arbitrary
casts like this being introduced.)

Jan

