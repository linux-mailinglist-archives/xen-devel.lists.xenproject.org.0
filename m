Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C92C0AD5A48
	for <lists+xen-devel@lfdr.de>; Wed, 11 Jun 2025 17:24:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1011879.1390408 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPNJC-0001HS-6l; Wed, 11 Jun 2025 15:24:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1011879.1390408; Wed, 11 Jun 2025 15:24:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPNJC-0001Et-3L; Wed, 11 Jun 2025 15:24:10 +0000
Received: by outflank-mailman (input) for mailman id 1011879;
 Wed, 11 Jun 2025 15:24:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Z5UX=Y2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uPNJA-0001En-Rw
 for xen-devel@lists.xenproject.org; Wed, 11 Jun 2025 15:24:08 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1c2c78f4-46d8-11f0-b894-0df219b8e170;
 Wed, 11 Jun 2025 17:24:05 +0200 (CEST)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-451dbe494d6so83333645e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 11 Jun 2025 08:24:04 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23603405f5fsm89510815ad.172.2025.06.11.08.24.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Jun 2025 08:24:03 -0700 (PDT)
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
X-Inumbo-ID: 1c2c78f4-46d8-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1749655444; x=1750260244; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=a72wZ0Yu2OYFZ62cY5VhXbdtPrirEvtb++QiGHx2GNM=;
        b=I792ajLJESCccqGvAFklyXNqwneZpGjjgnHEgQ5RQEOjDJ95zm4pBqpcYMKa7Tu6TZ
         DD7X93yDNfJsuAoQjRki+zHaF/+2XbzVTO5TtWT7WfkR7DWGWyeA8S/uec32SCqmSveG
         wpMEV9/0m49nfCGjXe052ioSv1BmzmrbBIf9Fh9u3LuFSdLvIPG8frsDHRmfO4j7QDFA
         tr9/PBI9XqJVaLbvrvV7e6BK3X3IQ51tGuv8gaS8RUMCDezzX3JN2VNTYOJwhA7mcUBl
         yFzgmpte/18xe0h5py/fZ1Hx5gqcXYpI+0xHe747H1iYsb/uxzN57t6xMMgqB/yXjjvU
         o8QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749655444; x=1750260244;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a72wZ0Yu2OYFZ62cY5VhXbdtPrirEvtb++QiGHx2GNM=;
        b=wHk2pecxQVgq4HpHZ/oJcx7jvby43xMpgA4DW2Ra5CGe/YX4KGSmIYeAo/ugKmuMQM
         r5fsW5alZsdLcI0XbQ0Y7ddqZk8YZfW6n+Pqab6VwfWKmopSPEmOe2MdRjPf5V4WUqVL
         s73puVGdozFiKy0orga8A7PbA7pt327Q+TJSnDcIkLOvF5rfrHH+vtoueIbt9aJhorBJ
         1cNbs2yyQJU1Aj0gq+Wse0AsWgk4huE2ctG061FVCAMKklKQ6JN0PijcQOzL8lZuH3sV
         z/Ukd5cRJWGOx+pZ9CxTZfBC/xHkTCDoqB1gSv5NbBtfX6xWIYesY4DmpF3/LX6rrJBF
         1UwA==
X-Forwarded-Encrypted: i=1; AJvYcCVrbRNhiXwcAysIgALc6xc30DXZIlT83aXTDhijI6TTMBiEEPOGYtIX+nSq+siF6Sl55i3GOqCwn6A=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy0Kbv4Bfh9V6+YPvsThAG9wy+oJ54fBZNt3MsyC81NtPd83L6/
	44FuxushjafXZ9LZC8/W1wFWW7pNLXS3NmmiJtu7mBAppkcW6p9RWcSXPBGJW3DYTA==
X-Gm-Gg: ASbGncv82HaJGIlozURUtMul4E5bZG1o/CiOKW5tmOFPJ5Wz5p6KZMi+IFAOng5Rzwy
	4n+oSg93Ydsi/q9BA55H3izE+6jSY8Xehj3XQhVcxbJTLQv2Jpy7RFZ57/n0tFIfWeg7fdrnpT/
	gUJzNzsYifyB26xXSMbKE4pa85b1TOVPOb7I11fowokOoTExAFGTPbxvuY94D1TEVCeqaYTtLsL
	ntibaVDX5Iugzi6TKhcCRPKmYd7FnRDB1mi1WU8lRQx1KjH3HbVEFX/e7RwxdIyu1U9FcSoRnkm
	Uhd7ePit43rDmk9w6NfhebfrvLB7qQKQnWSE8ZTPNY+w22MTQrfoH/ffnmis9zkm02JxmKfaoAX
	5uyijmFIG2Qr67eRqqTWTouNtLFxF3IVAV8f3KTNeIfSLlUp0ckkMLf2UfA==
X-Google-Smtp-Source: AGHT+IE6ULbTRxbiui29GjIIHjMEIxwZt+aVtKk9dtRj9ifk7l3Zr2v3ptg/5fN2V4U5Gi3N0Y7rUg==
X-Received: by 2002:a05:6000:2306:b0:3a5:541c:b40f with SMTP id ffacd0b85a97d-3a5586c3b69mr3134942f8f.9.1749655444316;
        Wed, 11 Jun 2025 08:24:04 -0700 (PDT)
Message-ID: <77a441a3-7f98-457f-bc74-4d9db4f75692@suse.com>
Date: Wed, 11 Jun 2025 17:23:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 02/18] xen/cpufreq: move "init" flag into common
 structure
To: Penny Zheng <Penny.Zheng@amd.com>
Cc: ray.huang@amd.com, xen-devel@lists.xenproject.org
References: <20250527084833.338427-1-Penny.Zheng@amd.com>
 <20250527084833.338427-3-Penny.Zheng@amd.com>
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
In-Reply-To: <20250527084833.338427-3-Penny.Zheng@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 27.05.2025 10:48, Penny Zheng wrote:
> AMD cpufreq cores will be intialized in two modes, legacy P-state mode,
> and CPPC mode. So "init" flag shall be extracted from px-specific
> "struct xen_processor_perf", and placed in the common
> "struct processor_pminfo". Otherwise, later when introducing a new
> sub-hypercall to propagate CPPC data, we need to pass irrelevant px-specific
> "struct xen_processor_perf" to just set init flag.
> 
> Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>

Acked-by: Jan Beulich <jbeulich@suse.com>

I'd be happy to put this in right away, but aiui ...

> @@ -228,7 +228,7 @@ static int get_cpufreq_para(struct xen_sysctl_pm_op *op)
>      ret = copy_to_guest(op->u.get_para.affected_cpus,
>                          data, op->u.get_para.cpu_num);
>  
> -    if ( pmpt->perf.init & XEN_PX_INIT )
> +    if ( pmpt->init & XEN_PX_INIT )
>      {
>          for ( i = 0; i < op->u.get_para.freq_num; i++ )
>              data[i] = pmpt->perf.states[i].core_frequency * 1000;

... this hunk needs dropping then, as the modified code is only introduced
by patch 1. Which raises the question why you didn't order the patches the
other way around, avoiding to immediately need to touch the same (new) code
again. Please clarify.

Jan

