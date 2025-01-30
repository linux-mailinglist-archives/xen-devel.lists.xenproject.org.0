Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F41C4A22E3B
	for <lists+xen-devel@lfdr.de>; Thu, 30 Jan 2025 14:52:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.879600.1289819 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tdUxR-0006WX-HA; Thu, 30 Jan 2025 13:51:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 879600.1289819; Thu, 30 Jan 2025 13:51:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tdUxR-0006UK-D2; Thu, 30 Jan 2025 13:51:49 +0000
Received: by outflank-mailman (input) for mailman id 879600;
 Thu, 30 Jan 2025 13:51:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zr8Z=UW=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tdUxQ-0006UE-36
 for xen-devel@lists.xenproject.org; Thu, 30 Jan 2025 13:51:48 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 58eab81e-df11-11ef-a0e6-8be0dac302b0;
 Thu, 30 Jan 2025 14:51:47 +0100 (CET)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-aaecf50578eso172796266b.2
 for <xen-devel@lists.xenproject.org>; Thu, 30 Jan 2025 05:51:47 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5dc723e4c8esm1112425a12.23.2025.01.30.05.51.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Jan 2025 05:51:46 -0800 (PST)
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
X-Inumbo-ID: 58eab81e-df11-11ef-a0e6-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1738245107; x=1738849907; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=4j26GBKFhejBkGSKMpktjiN6fvhII4e5qr1SdkqYS14=;
        b=VdQbXuc39uTbq7kTGOO75jbM0P+ylU23HXE+OxMKAgY1T+ugD7H1ntIs/Jv6GKHqMN
         cttCUB4heZxbdCk9Sai0S743Uv31ZnEr/NFFASwBYiV0ZNJKbTG+89KzengCwPFMe0lW
         NmgnKLfyqvGq0yusIvqAtbyiTCbH1c1CFo/AtIQ7X+66cIy06ysTfky0cwGvU8R3aXmt
         sLlJitkZUViQqCsxKGjLGvPrl8Y/mc9znyhELsGt6XyWfJooXAgU72iCHQk22XyVS5oF
         wd6vsbTtogvpGfziXce0baBeMH0r+uAEc11IoiE1ngyBdA5GCKRxhqLQJJVrbRRqAxZE
         1egg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738245107; x=1738849907;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4j26GBKFhejBkGSKMpktjiN6fvhII4e5qr1SdkqYS14=;
        b=FYtjj9/oTSuKAZotTrkfHn1GuEZV+NlZQaOgnxFOrAxoDZ0VUWujXjkbgQghUC2tFZ
         WyLyfiNXY/oZsTHLMWVrUdJafgZY5JjbhGz2K9JUPWSvAx98LiQJu1piO8loutqEbk2x
         gUO7VZ1dBgrwKshmlqjvk4xYNpHR1glNMTthKhNYsA+EX5LURryRJZNI8VY4EXXb1fna
         6uzKEGn8lQVSqKk/ciMarqrzdl+VOa42oy2BW1vpI86FJVNaCV/EPjUAKrdK4Ev9cyUN
         xwkFmGoWQJgdaP+/GjauheXq0Jq0C43sJmLQ7KgUav4mRZJ3YQGYYkGN8LlveL+5rxNl
         Y9zg==
X-Forwarded-Encrypted: i=1; AJvYcCW7ORt/Lj/ALrHSgN4+72fupcL9wgwE63+E/RHSQdKtzPhkWET06rWlQUui1zXKWfp2NsY4Lwf7wnk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwSJYoVi8bm/+H1TTWV1ArN5vEtNsf2T8syjzu3qOzlfYCw4CaW
	pdoEJ9Qp76u1rJam3LssaDUiuGaX+9cedtU4ZKe22jQwpjDZxxvpGhyjj4UY3w==
X-Gm-Gg: ASbGncsAr4WpolQftyCORasTvqME83dJDEhys1y2scHOeTPjSij7bi/S6iQxEz/MW90
	azYtnnq1PI7Ta5vtj08BbyiUahU8MS1OwHI/tqDE5S6/QWo+UxTK6oXCVAdzMNS4Xlq774k7Dhp
	E/hwK0y6qb1VVWFSrxnZxoObkWqh/KYC3DZR5LtcGeUVhoRpkz8vOq3W2vdAqGt/6Q8eemsu86j
	yChzbJZB7Q6w82UifJr4tG9VUt3iwEOupkEv8jZN4XL2vbX9rBf/25rWwtXGrtcmxvK1WgDsgxs
	yS3O6tWjcjiygc5wBUaZoNUdZvtnB9Uy6ilhzl4cX4HmuZKawPtNCxqzuKrENumQPh2hXM2VnVf
	x
X-Google-Smtp-Source: AGHT+IH6BqAuOJC1JhLDNCYwrZmwZadAiKHJGi/qqAKYlFCcCybNd5FVV6NSx6mGMMW9h5o/JcMeBA==
X-Received: by 2002:a17:907:7d93:b0:aae:c3c1:1361 with SMTP id a640c23a62f3a-ab6cfdd6b4fmr725392966b.44.1738245106645;
        Thu, 30 Jan 2025 05:51:46 -0800 (PST)
Message-ID: <61d5986f-bd52-4b00-87e1-49f9e6f7ed44@suse.com>
Date: Thu, 30 Jan 2025 14:51:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/15] x86/boot: introduce domid field to struct
 boot_domain
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: jason.andryuk@amd.com, christopher.w.clark@gmail.com,
 stefano.stabellini@amd.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20241226165740.29812-1-dpsmith@apertussolutions.com>
 <20241226165740.29812-3-dpsmith@apertussolutions.com>
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
In-Reply-To: <20241226165740.29812-3-dpsmith@apertussolutions.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26.12.2024 17:57, Daniel P. Smith wrote:
> Add a domid field to struct boot_domain to hold the assigned domain id for the
> domain. During initialization, ensure all instances of struct boot_domain have
> the invalid domid to ensure that the domid must be set either by convention or
> configuration.

I'm still missing justification for the duplication between the struct domain *
that's already in struct boot_domain and this new member. Iirc you responded to
this earlier question of mine, but nothing was put here.

> --- a/xen/arch/x86/setup.c
> +++ b/xen/arch/x86/setup.c
> @@ -292,6 +292,7 @@ static const char *cmdline_cook(const char *p, const char *loader_name);
>  struct boot_info __initdata xen_boot_info = {
>      .loader = "unknown",
>      .cmdline = "",
> +    .domains = { {.domid = DOMID_INVALID} },

Please can you fully use designated initializers here, thus also protecting
against MAX_NR_BOOTDOMS increasing without and update being done here (and
the compiler still being happy)?

    .domains = { [0 ... MAX_NR_BOOTDOMS - 1] = { .domid = DOMID_INVALID } },

Nit: Note also the blanks I added.

Jan

