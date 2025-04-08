Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 96C10A80E1C
	for <lists+xen-devel@lfdr.de>; Tue,  8 Apr 2025 16:33:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.942362.1341542 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2A16-0005la-FW; Tue, 08 Apr 2025 14:33:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 942362.1341542; Tue, 08 Apr 2025 14:33:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2A16-0005jl-CD; Tue, 08 Apr 2025 14:33:32 +0000
Received: by outflank-mailman (input) for mailman id 942362;
 Tue, 08 Apr 2025 14:33:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xdvb=W2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u2A14-0005jf-7r
 for xen-devel@lists.xenproject.org; Tue, 08 Apr 2025 14:33:30 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 703d33c6-1486-11f0-9eaa-5ba50f476ded;
 Tue, 08 Apr 2025 16:33:29 +0200 (CEST)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-43cf257158fso40137715e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 08 Apr 2025 07:33:29 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43ec1663060sm168036085e9.14.2025.04.08.07.33.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Apr 2025 07:33:28 -0700 (PDT)
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
X-Inumbo-ID: 703d33c6-1486-11f0-9eaa-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1744122808; x=1744727608; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=zVuCHdWp908W17xrpkZHFaKTFLK1VswuZsht9fQt+8Q=;
        b=NsTHnXrJkGoUU5lw3NHJNdJLob4xtoqawWUgXF9Nt1uAKCF+waYcdFwmiojnQgPcfI
         udFNqmevN0RMfdeXWdpAKRn6lQSQsFg8ZYPFRqps6zo3jDqHAm8CFnLCdNxK0B1BdPm2
         jVFLhJeaF4r4+v7qSSd9iM4TBE8NmJ0XpX02pxMbWlSIV8N8PASY4nzLCIem1O0ckdZr
         re1mF/JYWipn224To0XWViHuxqIoJqOHRpPoqEJL4behYatUan1pK23fv8L2PI2v1uOU
         z3cXQMZ3x9fqqpComexCY3WlatI45ypWEM3ATbU/Dz8BBl+pqLR/dj2UCoR9UwO/QQKL
         QnvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744122808; x=1744727608;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zVuCHdWp908W17xrpkZHFaKTFLK1VswuZsht9fQt+8Q=;
        b=YVMAVrlv74dwCbREzVmqk7fL8+S0rAF6FkaWDok+J5vzdTNkw92wGE0sSeUZ8RTbQx
         TXu++OVCgn5+qwKhujHH7EVyZ1fiHAjRa7/Ws3SnCNVrfdO4iRcQs5JhcF9ChMeyd5u1
         0OA104jvzJnnSI0zf+v+l0SXTNpkGBazC3fB0SxxmdI/pZG7N3nXjNyXE9HSm0koGFkk
         qyqOBbGp649PrimQrCQslUob1VCwWOLqgCDNLVClcmADwPNndcXh0K7FGFAJ6mgqG9pU
         h8IaWUjR5lZFFRVndL2T/prbFqGIEQrkq/HYYDI4p9HAUqxMn/MA9UVkddFd0JE+ck2O
         RPyA==
X-Forwarded-Encrypted: i=1; AJvYcCVD5oaxpEYE4cSw9NVcG/TRkkW5W6SPekJWEtBANXNhSoXevTN4n1GJFNaYXB2qmVFR5xhNpWRcIok=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxfW2WbAcDp3D7S8PT4WJlUYpHs/q5N4iegeXlVlr4xQN533lUA
	Sl2MRE9zpcy+rI6TQ78V30RaFJ7oNpZH1pP0ZadZHd4jgvATUXyk4lvqf0/O+A==
X-Gm-Gg: ASbGncsFik8CQbNP/8Ilb/7EMv2T4v9eu3aSFjRFzAkM59moQNSp3NS8bQO3e7PcL8C
	KDMpmMa3V4GVuqnE993T1BtYaS5khKDQqCiqn8MUnJcX4yd3mOlw6+12NLPrOroJMXIrYBKcx5u
	JW4Hng3FH+awFpOnsHT7A0RMVwz9sU5JDu4+IbtJ+n5rlZLfuhZCIE6+fyrIWJr4eceqk/NYB05
	5zRuQOqLAG5cKp2UOBrFIVfoK+vdmNFgFlkh1X0tOc/jssvA/UyuXLzwyDtG4pZo69099YYEuVG
	YdFBMeadTTVBmDbADkSeOxBr4OWOkugUfBV9JSpWSoR980Ib+LrZLJL9LN1wz918KOF5I7c+lLG
	ZqH8uhOyOI8V4ZoL36ltkIRumgULVBA==
X-Google-Smtp-Source: AGHT+IEJXL3mtBHlK4tj/OB5Rad64yf4mmAh1tIcCVru2mCP5/AP2uPlR6Y+uxL6SkifQLn4WnbBiA==
X-Received: by 2002:a05:600c:45ca:b0:43c:f332:703a with SMTP id 5b1f17b1804b1-43ecfa3726dmr160933345e9.31.1744122808508;
        Tue, 08 Apr 2025 07:33:28 -0700 (PDT)
Message-ID: <27191054-ce86-47c4-bde4-24f008ad0a09@suse.com>
Date: Tue, 8 Apr 2025 16:33:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/7] xen/domain: introduce domid_top()
To: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, julien@xen.org,
 michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org,
 dmukhin@ford.com, xen-devel@lists.xenproject.org
References: <20250331230508.440198-1-dmukhin@ford.com>
 <20250331230508.440198-4-dmukhin@ford.com>
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
In-Reply-To: <20250331230508.440198-4-dmukhin@ford.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 01.04.2025 01:05, dmkhn@proton.me wrote:
> From: Denis Mukhin <dmukhin@ford.com>
> 
> Introduce domid_top() in architecture-independent location to retrieve
> the highest non-system domain ID for use in console input switch logic.
> 
> Replace max_init_domid with domid_top(), which obsoletes max_init_domid
> in the code base.
> 
> Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> ---
> Changes since v1:
> - promote domid_top to a function which walks through the list of domains
>   to identify the highest non-system domain ID which should be considered
>   for console input rotation
> - elimitate use of max_init_domid

I still don't get how this is functionally identical to what we had so far.
In principle imo this change should come with a "No functional change"
statement. Provided of course that's true in the first place.

> --- a/xen/common/domain.c
> +++ b/xen/common/domain.c
> @@ -111,6 +111,29 @@ int domid_alloc(int hint)
>      return domid;
>  }
>  
> +/*
> + * Retrieve the highest known non-system domain ID.
> + */
> +domid_t domid_top(void)
> +{
> +    struct domain *d;

const?

> +    domid_t i = 0;

i is a pretty generic name for something of type domid_t.

> +
> +    spin_lock(&domlist_update_lock);
> +
> +    for ( d = domain_list;
> +          d && (d->domain_id < DOMID_FIRST_RESERVED);

May I ask which domains with ID >= DOMID_FIRST_RESERVED end up in this
list?

> +          d = d->next_in_list )
> +    {
> +        if ( i < d->domain_id )
> +            i = d->domain_id;

See the comment in domlist_insert() as to sorting of that list.

> --- a/xen/drivers/char/console.c
> +++ b/xen/drivers/char/console.c
> @@ -472,7 +472,7 @@ static void cf_check dump_console_ring_key(unsigned char key)
>   */
>  static unsigned int __read_mostly console_rx = 0;
>  
> -#define max_console_rx (max_init_domid + 1)
> +#define max_console_rx (domid_top() + 1)

This is becoming quite a bit more expensive now, without it becoming clear
whether it's really worth paying that price.

Jan

