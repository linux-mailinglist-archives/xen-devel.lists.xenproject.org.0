Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3852CB040DD
	for <lists+xen-devel@lfdr.de>; Mon, 14 Jul 2025 16:03:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1042860.1412928 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubJlN-0004op-89; Mon, 14 Jul 2025 14:02:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1042860.1412928; Mon, 14 Jul 2025 14:02:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubJlN-0004ms-4R; Mon, 14 Jul 2025 14:02:37 +0000
Received: by outflank-mailman (input) for mailman id 1042860;
 Mon, 14 Jul 2025 14:02:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=90OC=Z3=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ubJlM-0004mc-0j
 for xen-devel@lists.xenproject.org; Mon, 14 Jul 2025 14:02:36 +0000
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 30876d75-60bb-11f0-b894-0df219b8e170;
 Mon, 14 Jul 2025 16:02:33 +0200 (CEST)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-3a507e88b0aso3371112f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 14 Jul 2025 07:02:33 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-74eb9f1c8c0sm10466312b3a.81.2025.07.14.07.02.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Jul 2025 07:02:32 -0700 (PDT)
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
X-Inumbo-ID: 30876d75-60bb-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1752501753; x=1753106553; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=1Ccs8wECXUz32FlcPlC5VFNfUVXPf1jJucYnSmf0Z2I=;
        b=NrGFilLaUPFkXR5/MP+C5aqPeKnr9JdQxupamwElfV+6yFEOkeaT5fjnDdfP4IVqH+
         NtxPo/vPBn7TLamACDdGRrlfPtrdMqdn3FDoBxktjhpSnPsPAThbwvlPk+nRq043LTsA
         e+Fu4YxWmNhDIdr19O3r3Uyny0Kdpv0HGI4wfT3aIw1fOep3nZp5E84sYE5DtfMnBidK
         4TbLhl71PIqBsfLFX+DiWL7D53D3d/fmtOB+PH21LL0g4ErLmWCiiRpFqlStBT2+ZWXR
         9KBcOtgI3PXXHNvnJ1b2ybQlmkOlRAe8TpXTbVJgiwJRPEyzfhLyr+OJSfGExSctLKHX
         nQ6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752501753; x=1753106553;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1Ccs8wECXUz32FlcPlC5VFNfUVXPf1jJucYnSmf0Z2I=;
        b=e0Y00chUXfQXx0JM+mW1tCC3J3auo6P3AXxQyP3Hn7oc53qERRlTxaXxD5uLlduwhO
         NKDq8MzghKPdPBhZejljrNWipJtAYZ0fI6aWdgISebDloH1p8aIho58uoiVEXJMsi5QU
         5EPaTXJYalaR+/2S60lZkQF5J9OMjNSRit3dYhx9PQh2KYJj5f/F8c+cBdMHyrWZDsTO
         ok1o3j+5M2jCy10iYhGZqSDsbAEM93JJTS4xk1GAZg721C4X2LIXo4b01qgKCgnPfp/O
         iR7XiT7sSacaJ60dkNbezZzj41s3iXJsvBCk4C8XJrwOPNh5EUa6TXLMuWyRuarOYiBR
         axuA==
X-Forwarded-Encrypted: i=1; AJvYcCWFPa0hOMRXKhYu5qFrb37Vp0j/k8hYiXUfm0t9F7Nd6pSQJZ51CPrPEGXYaVZkNBB1cFP4i6PK0HM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzzKw02LOep0qS8TgUaSgsPxWhJSi010D9hzFGrhM8iiOk++QO0
	JEykNGrlIR9lIJ+l4EtKDnITFPRahq7zU/CKBvSmKTS2jqADphvf+ck6Rt8u07p1CHQEJv4GgvJ
	bzv0=
X-Gm-Gg: ASbGncsRvm4KAWA2zR4ldhVH3qx+S14DJlhlSIGLeoU6VIMJhGBEHzHNSloiNl//JJx
	oRK9sNP1zXxXYZkPFxHc7dSUahcplIyH1eHXnbYNzfkNL0lqUAPDpMCMyUlDGBOkj9af4yk+UoP
	kJfrTSGPflHnEWGxdZoSGmd7o9g/eMnx/6fcvb45YdmqHGUWvDS1Ezpmw4rgYyOdnk1e8P+5Jcq
	wSfXCXEAOUwbneHta8OlwKPiJblO3vallzGdcLJGz+sOgoNbNtaOMEgFQI2x6jsWwa5YAqALZ/K
	eCrybv7dk8XhfgUe6sVPuxBqPv401wa1RhBiuYYNUwp7Qi9nSjByvuwEtw7EMn15vyAFGkeLwm2
	/Zhh0JLttPWOrdjk4kO2heHRCJitihmuuEBr9ua3t/mcAmwVObc15NNM5Wrm84OWt4SHtf785Wa
	oznQgWE2nU7pO5MBiXeA==
X-Google-Smtp-Source: AGHT+IFdr1gDvmkYcfu5trrQBcGPWv4dSIPidDS11JoDjDilj2AsTmmSr4II8+p97dZul4Aujo/05g==
X-Received: by 2002:a05:6000:2d11:b0:3a4:fbaf:3f99 with SMTP id ffacd0b85a97d-3b5f188d7b8mr7998963f8f.13.1752501752840;
        Mon, 14 Jul 2025 07:02:32 -0700 (PDT)
Message-ID: <cccfa579-7fe9-400d-8ea6-7d6a8210e65d@suse.com>
Date: Mon, 14 Jul 2025 16:02:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [MINI-OS PATCH] e820: fix e820_get_reserved_pfns() to reserve
 page aligned area
To: Juergen Gross <jgross@suse.com>
Cc: samuel.thibault@ens-lyon.org, minios-devel@lists.xenproject.org,
 xen-devel@lists.xenproject.org
References: <20250711120333.23745-1-jgross@suse.com>
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
In-Reply-To: <20250711120333.23745-1-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11.07.2025 14:03, Juergen Gross wrote:
> e820_get_reserved_pfns() needs to make sure to reserve only page
> aligned memory areas.
> 
> Fixes: a7d27a7332ba ("mini-os: add memory map service functions")
> Signed-off-by: Juergen Gross <jgross@suse.com>

I've committed this, but ...

> --- a/e820.c
> +++ b/e820.c
> @@ -365,7 +365,7 @@ unsigned long e820_get_reserved_pfns(int pages)
>      unsigned long last = 0, needed = (long)pages << PAGE_SHIFT;
>  
>      for ( i = 0; i < e820_entries && e820_map[i].addr < last + needed; i++ )
> -        last = e820_map[i].addr + e820_map[i].size;
> +        last = round_pgup(e820_map[i].addr + e820_map[i].size);
>  
>      if ( i == 0 || e820_map[i - 1].type != E820_TYPE_SOFT_RESERVED )
>          e820_insert_entry_at(i, last, needed, E820_TYPE_SOFT_RESERVED);

... I had to resolve fuzz here: There's no E820_TYPE_SOFT_RESERVED in the
upstream tree, afaics. I just hope I didn't screw up ...

Jan

