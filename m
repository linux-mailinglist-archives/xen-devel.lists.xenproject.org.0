Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AD1C583C80D
	for <lists+xen-devel@lfdr.de>; Thu, 25 Jan 2024 17:31:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.671647.1045104 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rT2cx-000302-UB; Thu, 25 Jan 2024 16:30:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 671647.1045104; Thu, 25 Jan 2024 16:30:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rT2cx-0002yG-Rd; Thu, 25 Jan 2024 16:30:55 +0000
Received: by outflank-mailman (input) for mailman id 671647;
 Thu, 25 Jan 2024 16:30:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vt1H=JD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rT2cw-0002yA-Tw
 for xen-devel@lists.xenproject.org; Thu, 25 Jan 2024 16:30:54 +0000
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [2a00:1450:4864:20::531])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1b408e6b-bb9f-11ee-98f5-efadbce2ee36;
 Thu, 25 Jan 2024 17:30:52 +0100 (CET)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-55cd798b394so1794198a12.0
 for <xen-devel@lists.xenproject.org>; Thu, 25 Jan 2024 08:30:52 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 dh7-20020a056e021f0700b0035ff0206ae6sm9706806ilb.17.2024.01.25.08.30.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Jan 2024 08:30:51 -0800 (PST)
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
X-Inumbo-ID: 1b408e6b-bb9f-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1706200252; x=1706805052; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jpBBixWO47Get8Mb1/AylK/t47FYEgf3+z0r8OD2wPY=;
        b=X5VOsvsuQ62lAHWuzce8gz+YQbXPzHuBybmizjL/Ks/oX5Cxt6IXZ2nHbk6D6wnMPa
         U+d5MwUwTQOsdu2E/r9iBuOvkZtU+PQnHdW0g7vyuQFMwN3pC+F5kf2I4L65uT103OJY
         jCbidxTODEe9WARrBU4oUaE8xZx1O+4Y3hWp/Q1redg3aTfgbGgziTVLiooM2VwA0YiN
         6BPTlbD0pNsFQctV3lM7QOpA9fDcy7FKrNvEyOzC6kEA21dmdFnosUAt4WP+tn0lDzTz
         R2klWXCjIwhUgmoEGJVP4FE9yKj4Hbku/ieB2t7ZP066BFB+QEbA+WNPBgYIb0584UZI
         4wow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706200252; x=1706805052;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jpBBixWO47Get8Mb1/AylK/t47FYEgf3+z0r8OD2wPY=;
        b=F6/odaPJE2pJHBPWTuGfsxeY+nj8yITmJfAKCnmjpOBr8/XfBoNqClMakM2n+0qFJ+
         JNQNqs1ZLiFXREk5qm8EEPQpPgXNkrdrYEV8qik0ZoI8swwqf82yC7JyDuOZqvv98EHT
         /hrJCDv35Pg7WFF+Axs0qbQUjmJWA74OnwHpLd16+FOmDJPu7kP1VKulV9+LAH6yt+l3
         Rpic81JIvmcMfAUtipJ0oPZp4eyheVsUMFT7BP2cZ06gzcsu7La049lNMmq+BWocSpmk
         1Ddu0KiGiaLm6PtqOG/dRB16tbSE4YgqYqgXcVOTxmjwzGFPVv0aQnGddHbPb6Yc7zlh
         yvyw==
X-Gm-Message-State: AOJu0YyutEd66rQwDWG6I7H0BoNt+hQulYmIfYHgqtzdLp4gLSg17ml7
	cI29Ux0NZ4MQUmwAxa5EfwezI8KpV9YvvWew9Y9lTch/grTIQssOAPnu2khppQ==
X-Google-Smtp-Source: AGHT+IGFBPFsEv0BPkxNcVFm7mvc1d5BPT8/6dnaXKkUs7dMk7YEdCnw/i4AtO0B0UiKQE/rziz6Ww==
X-Received: by 2002:a17:906:4749:b0:a2b:f7d:5b5d with SMTP id j9-20020a170906474900b00a2b0f7d5b5dmr126728ejs.32.1706200252319;
        Thu, 25 Jan 2024 08:30:52 -0800 (PST)
Message-ID: <df2fb038-680f-41be-b378-9ff7514fcb68@suse.com>
Date: Thu, 25 Jan 2024 17:30:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 (resend) 05/27] xen/numa: vmap the pages for memnodemap
Content-Language: en-US
To: Elias El Yandouzi <eliasely@amazon.com>
Cc: julien@xen.org, pdurrant@amazon.com, dwmw@amazon.com,
 Hongyan Xia <hongyxia@amazon.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Julien Grall <jgrall@amazon.com>, xen-devel@lists.xenproject.org
References: <20240116192611.41112-1-eliasely@amazon.com>
 <20240116192611.41112-6-eliasely@amazon.com>
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
In-Reply-To: <20240116192611.41112-6-eliasely@amazon.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16.01.2024 20:25, Elias El Yandouzi wrote:
> --- a/xen/common/numa.c
> +++ b/xen/common/numa.c
> @@ -424,13 +424,14 @@ static int __init populate_memnodemap(const struct node *nodes,
>  static int __init allocate_cachealigned_memnodemap(void)
>  {
>      unsigned long size = PFN_UP(memnodemapsize * sizeof(*memnodemap));
> -    unsigned long mfn = mfn_x(alloc_boot_pages(size, 1));
> +    mfn_t mfn = alloc_boot_pages(size, 1);
>  
> -    memnodemap = mfn_to_virt(mfn);
> -    mfn <<= PAGE_SHIFT;
> +    memnodemap = vmap_contig(mfn, size);
> +    if ( !memnodemap )
> +        panic("Unable to map the ACPI SLIT. Retry with numa=off");

Looks like a copy-and-paste mistake from the next patch (which I expect
to have a similar panic(), with the text then actually applicable). With
this adjusted (could also be done while committing):
Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan

