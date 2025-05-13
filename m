Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 214E7AB5718
	for <lists+xen-devel@lfdr.de>; Tue, 13 May 2025 16:27:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.982913.1369275 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEqbA-0002tK-26; Tue, 13 May 2025 14:27:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 982913.1369275; Tue, 13 May 2025 14:27:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEqb9-0002qI-Vn; Tue, 13 May 2025 14:27:11 +0000
Received: by outflank-mailman (input) for mailman id 982913;
 Tue, 13 May 2025 14:27:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=iHDm=X5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uEqb8-0002qC-Sh
 for xen-devel@lists.xenproject.org; Tue, 13 May 2025 14:27:10 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5a840b0e-3006-11f0-9eb6-5ba50f476ded;
 Tue, 13 May 2025 16:27:09 +0200 (CEST)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-ad243cdbe98so505756766b.0
 for <xen-devel@lists.xenproject.org>; Tue, 13 May 2025 07:27:09 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad2198b68dasm781774466b.181.2025.05.13.07.27.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 May 2025 07:27:08 -0700 (PDT)
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
X-Inumbo-ID: 5a840b0e-3006-11f0-9eb6-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1747146429; x=1747751229; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Pab7t/HmM//a4/BkuGC4VNRQRXAmMookN/PuxnC12B8=;
        b=VZSJlu9whlde0Qu1iy2yoZervREQj+jm08ShZUsbSgbEnOOeVlT3VH6ZagSjSMc6HY
         v+25o+megeAMrU4U9Oww5qxbZP+c0tE/0zkAa1hh6THuB3pJgvoH5XRWD3HgqnW6j0wE
         22mNh+wmvHTFU/MTUzkwQVGxk5QUh1U+kHpx5zIX6Nt7w45PkaDlzsN6G7vTmo/rw+Tn
         O7/scN9Fr2lq0dl7C1ncREC54ub8pPK5VxnuQt4oOaj8ZtTp0AXCkD7SCf8cHoPEBRxo
         a6MeNja0gAX5GDFWftJd2BN0fGhgeG5niy/2vNIPdCW64qCyMNAEIreDOIoiV1BMsGsQ
         L5iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747146429; x=1747751229;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Pab7t/HmM//a4/BkuGC4VNRQRXAmMookN/PuxnC12B8=;
        b=dDXmCc8WBE9NlTIX3Ld1qLApHtZnPhxw7N3H70dVP+yP2wQwTyQDdBH5eXMdmqmzeS
         plQn3jAnh3P3YCdTTUmdpvoH/hYfhgtw64TEBrnDQdYXsRvogJqNty3gUzuIgLJwXUQf
         5ynFkRUphtCVYRj+Kgssp1GEnfCs2/TDN/EhRNHWerJ2JR+Be6oQke3y4FH3JO2mp84x
         KcLM3apw9xqcSRlQQY/xV5r64N9nwg5e6MNCCqHT1sJ/S+xBkTa8JTivzAKTSACKspNt
         scqdcspZt8QQ+ueUs1GW0E3SAKe0pva7xJDA0fOCrYy+No0OzaR9fzMIQNzbVkZqiCtp
         M0cA==
X-Gm-Message-State: AOJu0Yz8OfUEa4wO5JcbWMrocdKWyZLXksciIQJH5oUIoxjWDaxyRspn
	4CgJB/WekRVUnBOkvPZhlZ99U5Dc8b1KEElaewvG3hnhHwKhG1bXCrNYG3A8Vg==
X-Gm-Gg: ASbGnctL0HfstmRksCPl6p+87hh2UkMsDVIBs6rzYOf1y6nE2dDYJVvjaIN42CmbHsa
	gJa3SVk3g61Phg9f8VS08G/GDMSfZyr1agC/NlxRuCuGhuSf5vk9h/edi7TBt40PYD3mct3cDKD
	PVMpwsb8ZKn4lIBILE4KFX/IM/I33c8g5nZ03Bu+er0UenE5/vV2a1RllfOyIhiPUhtQD2QSNmV
	/XHO7+UUsyCnCMuuibv4EEJ64RqjufFYosyDZXhv4YBgfz+yKzdSlQ23zFU7JZSL9k9s6VNmh9q
	yRooe7mZj29wb4kdcZ6xAjxlv24HRgprThHq7RAl123QuizbgAoos2QUGPYEZSI3Y+wYRuLSFKz
	oegPiQxpiBrqcJhLXRZGbqXiGa1vqoxiHdy716zfSAxCza5I=
X-Google-Smtp-Source: AGHT+IFGUJjgx/c/psHLy8KVsszJIb81qRGrH7azlLMXp7YDmwhkMpZ5m8C3HSDtTXB39dggmTBCZg==
X-Received: by 2002:a17:907:c717:b0:ace:c505:3349 with SMTP id a640c23a62f3a-ad218e3f64fmr1749854466b.12.1747146429086;
        Tue, 13 May 2025 07:27:09 -0700 (PDT)
Message-ID: <204e177c-beba-41a1-93bf-3ae6454875cc@suse.com>
Date: Tue, 13 May 2025 16:27:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/5] x86/pmstat: Check size of PMSTAT_get_pxstat
 buffers
To: Ross Lagerwall <ross.lagerwall@citrix.com>
References: <20250512144656.314925-1-ross.lagerwall@citrix.com>
 <20250512144656.314925-2-ross.lagerwall@citrix.com>
Content-Language: en-US
Cc: xen-devel@lists.xenproject.org
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
In-Reply-To: <20250512144656.314925-2-ross.lagerwall@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12.05.2025 16:46, Ross Lagerwall wrote:
> Check that the total number of states passed in and hence the size of
> buffers is sufficient to avoid writing more than the caller has
> allocated.
> 
> The interface is not explicit about whether getpx.total is expected to
> be set by the caller in this case but since it is always set in
> libxenctrl it seems reasonable to check it.

Yet if we start checking the value, I think the public header should also
be made say so (in a comment).

> --- a/xen/drivers/acpi/pmstat.c
> +++ b/xen/drivers/acpi/pmstat.c
> @@ -103,8 +103,10 @@ int do_get_pm_info(struct xen_sysctl_get_pmstat *op)
>  
>          cpufreq_residency_update(op->cpuid, pxpt->u.cur);
>  
> -        ct = pmpt->perf.state_count;
> -        if ( copy_to_guest(op->u.getpx.trans_pt, pxpt->u.trans_pt, ct*ct) )
> +        ct = min_t(uint32_t, pmpt->perf.state_count, op->u.getpx.total);

With this, ...

> +        if ( ct <= op->u.getpx.total &&

... this is going to be always true, isn't it? Which constitutes a violation
of Misra rule 14.3.

Also it would be nice if the min_t() could become a normal min(), e.g. by
"promoting" op->u.getpx.total to unsigned int via adding 0U. This way it's
clear there's no hidden truncation (or else there might be an argument for
keeping the check above).

> +             copy_to_guest(op->u.getpx.trans_pt, pxpt->u.trans_pt, ct * ct) )
>          {
>              spin_unlock(cpufreq_statistic_lock);
>              ret = -EFAULT;

Why would you constrain this copy-out but not the one just out of context
below here? (The question is of course moot if the condition was dropped.)

Jan

