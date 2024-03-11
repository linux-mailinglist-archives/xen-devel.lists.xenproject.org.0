Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A41698785DC
	for <lists+xen-devel@lfdr.de>; Mon, 11 Mar 2024 17:58:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.691549.1077614 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rjiyY-0000Ze-Cy; Mon, 11 Mar 2024 16:58:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 691549.1077614; Mon, 11 Mar 2024 16:58:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rjiyY-0000Xx-AB; Mon, 11 Mar 2024 16:58:10 +0000
Received: by outflank-mailman (input) for mailman id 691549;
 Mon, 11 Mar 2024 16:58:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ZVPQ=KR=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rjiyX-0000Xr-FG
 for xen-devel@lists.xenproject.org; Mon, 11 Mar 2024 16:58:09 +0000
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [2a00:1450:4864:20::529])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 88a64ae6-dfc8-11ee-a1ee-f123f15fe8a2;
 Mon, 11 Mar 2024 17:58:07 +0100 (CET)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-5658082d2c4so6009552a12.1
 for <xen-devel@lists.xenproject.org>; Mon, 11 Mar 2024 09:58:07 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 n10-20020aa7d04a000000b0056826248468sm3106458edo.89.2024.03.11.09.58.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Mar 2024 09:58:06 -0700 (PDT)
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
X-Inumbo-ID: 88a64ae6-dfc8-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1710176287; x=1710781087; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wWpKp7nCxFXHUhoAq4Q++ZBgt4mxrjKsMFSgtPCtRVo=;
        b=TEV76pKZ7yhEMuDrzJFVLeVLO3tPLe201eA86+QnTrmwyGzRxQkUx/pB5IUtLIgPCM
         W8qS4a7S84Wn+2fK9Cpys0hClLxfqqFkUAJJ7h7oSw7D6mjQAaGa5ygBkrP1PPH3M4Bx
         4EDoMNiptJSqHuPlOjfHYJZ5HhKgiExyVbhvh2GfaHIEWWLj4CxQfYc21CAGvF4NUCHQ
         WECgz6gmCM9Te7ioJVo39qiPTQ/ol6knPNfbU20fXbKgRCkqolG9eX+x6iRcGzzpFvS4
         6jV8FdbYsovvJmkj0VclyzSCklNLuXHVg2hOIXLOQmTaaGnF26Z9AbU/QbcX2IG/v+QT
         IwEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710176287; x=1710781087;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wWpKp7nCxFXHUhoAq4Q++ZBgt4mxrjKsMFSgtPCtRVo=;
        b=by+ZACmZXfKNk3OZnorDN250wf8jyRMzGvq4JQBDC/pmQ2NlcvSosYPXMJpfiWJfuV
         6elTmiejQhJHZmovt4t0zv1bXsfQavOPFUAwmkxc2ivVsvKlyvGwaNaVgb2yRp4dI5BO
         l/Svl+4S0VpKNsmJvQ7QOmuywSk/QFysZbB6ttTtzaTW7+L+x+CvLwuv5lt5pwTcSB0M
         iKaXxBEayUTC7WSKkK8F9ln8s4UHnV2j4Qs+ZVWtBb0xMC9wwYnBq/glJ8zXxeJUfWD+
         bSRDn0vlJOs0ISJ0LbSE0wT8x+zvQosOZ4GuYCK6wW8LjfbhkYdXfDrsfPBUYg/a2O3V
         5fPQ==
X-Forwarded-Encrypted: i=1; AJvYcCXN29RPB0KMriqTA8VHLU7jPl4d9X8kyPxxKVo7HQjODfS87h2BEIhX5TJC7sljo7qtyKFuLUBuxjhukmx1Vr/r7HqFFVMBBjhQo1NtjGc=
X-Gm-Message-State: AOJu0YwbHO/FLSey653rmw26kVuujCRJTppMhd25945KWzIGALLXNZji
	IFCA8/LWZDeN6/RnaHqWkJCzF16n14npj80CFVfrcDB6S3GxHvVksFrXp2zb/2Dtr6ETex7hjyE
	=
X-Google-Smtp-Source: AGHT+IGmvvpQNvsF6SE3Z/Zct7cvyH6zvS91FpcKfvE+ByByx8N0/GP/o8FnS9zEWoRld0XJJGb91g==
X-Received: by 2002:a50:d558:0:b0:568:1444:a828 with SMTP id f24-20020a50d558000000b005681444a828mr3616680edj.37.1710176287047;
        Mon, 11 Mar 2024 09:58:07 -0700 (PDT)
Message-ID: <ef01a9fd-4825-4430-9c20-62277e1b2114@suse.com>
Date: Mon, 11 Mar 2024 17:58:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/5] xen/domctl, tools: Introduce a new domctl to get
 guest memory map
Content-Language: en-US
To: Henry Wang <xin.wang2@amd.com>
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Alec Kwapis <alec.kwapis@medtronic.com>, xen-devel@lists.xenproject.org
References: <20240308015435.4044339-1-xin.wang2@amd.com>
 <20240308015435.4044339-4-xin.wang2@amd.com>
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
In-Reply-To: <20240308015435.4044339-4-xin.wang2@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 08.03.2024 02:54, Henry Wang wrote:
> --- a/xen/include/public/domctl.h
> +++ b/xen/include/public/domctl.h
> @@ -946,6 +946,25 @@ struct xen_domctl_paging_mempool {
>      uint64_aligned_t size; /* Size in bytes. */
>  };
>  
> +#define XEN_MAX_MEM_REGIONS 1
> +
> +struct xen_mem_region {
> +    uint64_t start;
> +    uint64_t size;

uint64_aligned_t?

> +    unsigned int type;

uint32_t and explicit padding (incl checking thereof) please.

> +};
> +typedef struct xen_mem_region xen_mem_region_t;
> +DEFINE_XEN_GUEST_HANDLE(xen_mem_region_t);
> +
> +struct xen_domctl_mem_map {
> +    /* IN & OUT */
> +    uint32_t nr_mem_regions;
> +    /* OUT */
> +    XEN_GUEST_HANDLE(xen_mem_region_t) buffer;

XEN_GUEST_HANDLE_64() and explicit padding (+checking) again please.

Jan

