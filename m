Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A5CA972D1E
	for <lists+xen-devel@lfdr.de>; Tue, 10 Sep 2024 11:13:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.795161.1204334 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1snwvi-0000Sd-9Z; Tue, 10 Sep 2024 09:12:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 795161.1204334; Tue, 10 Sep 2024 09:12:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1snwvi-0000Qn-5u; Tue, 10 Sep 2024 09:12:58 +0000
Received: by outflank-mailman (input) for mailman id 795161;
 Tue, 10 Sep 2024 09:12:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zCZR=QI=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1snwvh-0000Qe-2W
 for xen-devel@lists.xenproject.org; Tue, 10 Sep 2024 09:12:57 +0000
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [2a00:1450:4864:20::535])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ddc97405-6f54-11ef-a0b5-8be0dac302b0;
 Tue, 10 Sep 2024 11:12:56 +0200 (CEST)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-5c263118780so713342a12.2
 for <xen-devel@lists.xenproject.org>; Tue, 10 Sep 2024 02:12:56 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c3ebd76f27sm3968324a12.66.2024.09.10.02.12.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Sep 2024 02:12:55 -0700 (PDT)
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
X-Inumbo-ID: ddc97405-6f54-11ef-a0b5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1725959576; x=1726564376; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=l2OFwP2KYxczlaLzkvWY0MgJ0HsAZbBmlxjrsRQ+zHY=;
        b=IwbIQGRAuvX9H0BjEB8ra74bKMIl2iEXWmI7cLOoICqxSviAHPW4VDrMjnrRKZvRh/
         fuBjMRSqS2fpXQ9FlzpSzgIFQVKvOcyG0OIAsdL1tHqdeRkjVE0/tHfYxgpB9L82miwp
         dkUpshDFyr7VQlA9zLAAMFMI9TugoG7pQNZbQSD0I4QUqkvzHxTkO3Gbukomzz7xTk6J
         YDQA7yE7NpDgSDAOlxuq7aPlDXt7E7MtYZxs1wBgv8wedr3Z+4qbDxjl7DDW73lOoH0Q
         sJCxPPCFO02ULLO5d0Je1iiW6XHCvhgCHOhQ9jbLDIwtgh1Z4UcWmauMzfxCrVYOXEJf
         iVQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725959576; x=1726564376;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l2OFwP2KYxczlaLzkvWY0MgJ0HsAZbBmlxjrsRQ+zHY=;
        b=uRV3fWhGbDBt/EFU5tUvORk7dTb03OULmffXkJv/xn1JEZdZC5BUY4U7HyYa2AlAYu
         D/fJLybYChPP8PXbxsQq6jmb5KZHG3zXls/I9yrB0qDHxHBHbWMHnQPynxLsmLV91cuO
         q7r1qON5ydGagdUIeFjJNZGlutfnhtEOJ2JI7AR4EJzKhALvQjargaYw1XfOwcsckvEu
         K4uv5TBG3sUQFP2ZjqBv0vluHx0ZFOpOm0tMZ/iTWAi7p29GOkYin/Y0H4eQZ7yb436a
         NYZN3UfO4J7wBxX6++kv5tTKt1ykr1acWZ073J3VG9yDb+0fkceG79EP4FsD1Pud+tgF
         fzzg==
X-Forwarded-Encrypted: i=1; AJvYcCWixceTuyOomjo73IyNY+Rv/h14gtqEvQxwOcVgxORVtenpJHydzPvkiOha5yXNXWno7mpoX6abhPI=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yzo9iTjXAYF/YdXkevuUCooyH2OgLs8J24k4ZXtswPFdF/ZWtGz
	8oYp1hhmRY7vmrMWhWOazgTt6PAK8lkFNQ1P2CplrRCFBxvSy7BtPf1+u2tUUQ==
X-Google-Smtp-Source: AGHT+IEsvRqMtbwKztueImf18fUlMMBlthUYT00L5bOxA0drNbWbIT1fms/0CbqN7XgUNF3RlD7xNQ==
X-Received: by 2002:a05:6402:27cb:b0:5c2:70a2:5e41 with SMTP id 4fb4d7f45d1cf-5c3dc7b8318mr11786237a12.28.1725959575512;
        Tue, 10 Sep 2024 02:12:55 -0700 (PDT)
Message-ID: <7163626c-e2de-4c5a-b1e7-d3a80914985d@suse.com>
Date: Tue, 10 Sep 2024 11:12:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH] x86/cpufreq: address MISRA Rule 7.3 violation
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <c5aa988e00f94cf793b7ecae49a4eb94db785dee.1725958056.git.nicola.vetrini@bugseng.com>
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
In-Reply-To: <c5aa988e00f94cf793b7ecae49a4eb94db785dee.1725958056.git.nicola.vetrini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10.09.2024 10:48, Nicola Vetrini wrote:
> Rule 7.3 states:
> "The lowercase character l shall not be used in a literal suffix",
> but the INTEL_MSR_RANGE macro uses the "ull" suffix.
> The "u" is transformed in uppercase for consistency.
> 
> No functional change.
> 
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>

Acked-by: Jan Beulich <jbeulich@suse.com>

I'm heavily tempted though to ...

> --- a/xen/arch/x86/acpi/cpufreq/acpi.c
> +++ b/xen/arch/x86/acpi/cpufreq/acpi.c
> @@ -25,7 +25,7 @@ enum {
>      SYSTEM_IO_CAPABLE,
>  };
>  
> -#define INTEL_MSR_RANGE         (0xffffull)
> +#define INTEL_MSR_RANGE         (0xffffULL)

... drop the pointless parentheses while committing.

Jan


