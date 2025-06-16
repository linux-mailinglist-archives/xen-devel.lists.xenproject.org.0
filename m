Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EAAFADB6A1
	for <lists+xen-devel@lfdr.de>; Mon, 16 Jun 2025 18:23:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1017491.1394480 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uRCbW-0005en-JE; Mon, 16 Jun 2025 16:22:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1017491.1394480; Mon, 16 Jun 2025 16:22:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uRCbW-0005dE-FG; Mon, 16 Jun 2025 16:22:38 +0000
Received: by outflank-mailman (input) for mailman id 1017491;
 Mon, 16 Jun 2025 16:22:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jh7D=Y7=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uRCbV-0005d8-BD
 for xen-devel@lists.xenproject.org; Mon, 16 Jun 2025 16:22:37 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1d415d60-4ace-11f0-a309-13f23c93f187;
 Mon, 16 Jun 2025 18:22:36 +0200 (CEST)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-3a50fc819f2so4005409f8f.2
 for <xen-devel@lists.xenproject.org>; Mon, 16 Jun 2025 09:22:36 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7488ffecd29sm7033077b3a.31.2025.06.16.09.22.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Jun 2025 09:22:35 -0700 (PDT)
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
X-Inumbo-ID: 1d415d60-4ace-11f0-a309-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1750090956; x=1750695756; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=iJ22bVt6JnasgRgf0jzNkO9g0kG/12p0K1GXs13R5kU=;
        b=G2+b3ljizD4kFORYWTe+Aeiz09l3ozhXi9Hl6mWoNwMU6JOacqKmlh49D5ClG44wA5
         8LIX9GJYg2WmCMZrBNZ5R5fQSySVMbuXDmbxGXVAbO1ufWanrItCYpIG3c6s+nreN3Sj
         3v/3AwAffB3PR1MUKTN4k5tSEaFqQSq37tDeV+rd22O1qYaLDbAhwteykmAqingdTRQP
         QbcZhLsbuek923tcRwcrg+JY9bF9KA6iTmJOwgeTk2k8dprQyN7E09fwNrj0t9VR0yDb
         X4gsmMvp38VS7Tg+DTnuAdIdY0KZQF9+4bN8PZuH3YkLVS/t5DZuuyYLkkZNMQlZhzzp
         xNkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750090956; x=1750695756;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iJ22bVt6JnasgRgf0jzNkO9g0kG/12p0K1GXs13R5kU=;
        b=xLDA/Oo4mUTjLxK1REp27CnP5m3r+7R5bY7BFg7wXTaBqoG4PENTW1NVD/X0D7RxVj
         GuoKh7d86wqv7W/ik5dkiF/4ikbiIUUAMjp8iC7a6JXCIPBrYn7i/XPpL6TiJrzZmwlX
         hyU3r4eFnGFWU0/w2tih7Cx+Z8vsJ4a5yOOwcdgVSJYs1Ex1mua5fLd/VzPt0fHuT3jN
         BM/jiITtK889yKf9RsQ5R4XwZn9+vLXolh7drgBYikgq5LKPOOGOL68ZlcCy6PSZSFhQ
         L0b1hQD7vAhTxVjHnTB9Ss9lUsqZ2gidostyEHmhgmAwdzWXbLg1pTh2NMbDfQ9k9TMq
         GW+Q==
X-Forwarded-Encrypted: i=1; AJvYcCUPgrWryO0WY5ojnM1blyUQIhZ9jWzUWCc1QiWkUYV0DLCyabFEc2J0trQ4o2ilhDduG0w5W13K6Xo=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyhLzSybk/KemTlKk7oQmaTNc5ZJ5Fn5ZJFf81y+qW3Z/Rx379k
	XVYsv+k0iEo4dGLVNVCMZZLyi4iCHFrwIk9gB/6umwI+j78WPMhBmEJeUCYwVzfdJw==
X-Gm-Gg: ASbGncvqH4MNt92+y0IwMlUsh7I3HP2d0cJnCE1Yh34qk/1oUhrmmnQjk1KtiZJzxAx
	YwsBE/+XsQDVEb1t8TRXygZW3ty3+5q47sRxcL13Th+GJD/54sVysRPH25+s/bXJlIkpCsEnz0U
	X/IUeQ0UwMfhNHjqCTxW0tMHke7Zce8owx0wDCgRnjJgtYBfvva6MHsFUeO9E0b3Vahrv7cZ3Im
	Hk+4gDlQkUO72wQBQaVY0lPQ5Inb0g07MlWcg8GrhCkPdK0B9mWcOT+KxLHGSPt9PvpDOP02QSh
	t9MwZdXkxsQAqXjkv+8xBK0Qq8GTZayp+rYchV0jhvO8WPr6NWeNYyLObNYbrycc+1F/cTj6xCQ
	w/1WL3eNGMY6pd4hIYTg2H+1964eaevx/pTrmMtxFbMAG8H4=
X-Google-Smtp-Source: AGHT+IHdvxuxQ5SG5jNnjzIdMVwiUNfIURrrc/a3Xr2Rx6VoNt0acRIWE+vqYfw0/jsSEa9bfkIMNw==
X-Received: by 2002:a05:6000:1888:b0:3a5:2949:6c38 with SMTP id ffacd0b85a97d-3a572e99690mr8949618f8f.52.1750090955720;
        Mon, 16 Jun 2025 09:22:35 -0700 (PDT)
Message-ID: <0a5c9445-904a-4321-8406-8618fd82313b@suse.com>
Date: Mon, 16 Jun 2025 18:22:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 12/18] xen/cpufreq: get performance policy from
 governor set via xenpm
To: Penny Zheng <Penny.Zheng@amd.com>
Cc: ray.huang@amd.com, xen-devel@lists.xenproject.org
References: <20250527084833.338427-1-Penny.Zheng@amd.com>
 <20250527084833.338427-13-Penny.Zheng@amd.com>
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
In-Reply-To: <20250527084833.338427-13-Penny.Zheng@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 27.05.2025 10:48, Penny Zheng wrote:
> --- a/xen/drivers/acpi/pmstat.c
> +++ b/xen/drivers/acpi/pmstat.c
> @@ -319,6 +319,14 @@ static int set_cpufreq_gov(struct xen_sysctl_pm_op *op)
>      if (new_policy.governor == NULL)
>          return -EINVAL;
>  
> +    new_policy.policy = cpufreq_policy_from_governor(new_policy.governor);
> +    if ( new_policy.policy == CPUFREQ_POLICY_UNKNOWN )
> +    {
> +        printk("Failed to get performance policy from %s, and users shall write epp values to deliver preference towards performance over efficiency",

This message is excessively long and is lacking a newline (i.e. effectively two:
one in the middle and one at the end; yet better would be to find less verbose
wording). What's worse, how would a "user" go about "writing epp values"?

Jan

