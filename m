Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E5EEECB2756
	for <lists+xen-devel@lfdr.de>; Wed, 10 Dec 2025 09:51:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1182669.1505514 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTFuM-0006uC-Fr; Wed, 10 Dec 2025 08:50:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1182669.1505514; Wed, 10 Dec 2025 08:50:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTFuM-0006sf-D7; Wed, 10 Dec 2025 08:50:50 +0000
Received: by outflank-mailman (input) for mailman id 1182669;
 Wed, 10 Dec 2025 08:50:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=K7qh=6Q=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vTFuL-0006sZ-8b
 for xen-devel@lists.xenproject.org; Wed, 10 Dec 2025 08:50:49 +0000
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [2a00:1450:4864:20::42c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 51f1273a-d5a5-11f0-9cce-f158ae23cfc8;
 Wed, 10 Dec 2025 09:50:47 +0100 (CET)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-42b3c965cc4so255110f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 10 Dec 2025 00:50:47 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42f7cbfeae9sm36761718f8f.13.2025.12.10.00.50.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Dec 2025 00:50:45 -0800 (PST)
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
X-Inumbo-ID: 51f1273a-d5a5-11f0-9cce-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1765356646; x=1765961446; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=GdxOMJ1aJGBzhGwqmFcvqL4PlfxOe3iufLLQ1Y5HEqk=;
        b=TJu7VmColLBDTfsEpG0Qr1ddsGMn1qOFD6ysVJkbPDyFX2nLP4qPHf/W+W79OQlOYw
         jK6m34DNj9hy9FMHiNzSZVrIwuVT9WUqUsPtYtwFVtJ/61JO+wtTu6R1JaRTixzrbEGx
         ImKwMoGNwD284a/UMVgiIuJSUCf5xsrubkIZGUN0th1WcxtmEcpqg1syvBLckrkOLpLg
         SLtdUWUNRFnA3teVgVZ97/FHpRPp0IjTD6AugRPDQTC7q5i8bE2r1N9oPYat5z5HEruD
         p2xl7vWbfJYwsOjlOaWnmvESDcLal9C0ANj0sF+RQ/euI2qMp3uW94lZuhIzr2c7eehi
         bi5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765356646; x=1765961446;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GdxOMJ1aJGBzhGwqmFcvqL4PlfxOe3iufLLQ1Y5HEqk=;
        b=qpChY6ZqUv1J+DIaOLksJjABBJHm6sopgnYiDoSenncjbRfl78qT0IKYuhBoSiYGNv
         W09bVChHd3ov7wz0mKT0zv5iYUId6NbDQfNX+4tQjwd7trYBjtIIGZmVlkzmkANauMkZ
         G8Y3Syd4Z80sqz/pywFMHAiz2B6TbaE6fdGaGUkYCnlkQ7KgBdiY+Aa6m0SRZiRvUn43
         1WusGGsp27OTol/mmZf0BdGVjPfELZDyj7pzcySkV+g3JzY4R1G1NtnNDoEOvpzJ0EZt
         NssnmnKHroZa41fPW68INVQHVFSUF+0ylJ4AtEpWfj2AH93qL107LYPJwrtjtFSBAsgW
         6pnQ==
X-Forwarded-Encrypted: i=1; AJvYcCVzqnwRa2Y33SkWleHrz6SrJqfgiItjpAoPTuKxJB3cfy7SFuMlYgH5NnZa6Ae/inuqpofk2/jekoY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwkbP/keMwHdBYZv9xxhiYJGqvfKgg8lx427y50ucq/u4pYEqPR
	ZCxKNmT+3I8+XLJd0l670c7xEu7nCPfNLUR6exRUw1wvIGiIM+FBJyi8T/yagv8qXQ==
X-Gm-Gg: AY/fxX7EYeiMHK6PlByY0TK4gaiYxitSc8H92a0oZjTT+rYCV19GxX1p7ENQZdOod7m
	kwCNBDwj0GysHHsK5v+ArfO8/ebZCh8P5tWsrK/Ifk+A44KnuzstfyiN6fJoXi/lQ0qmyx3ZUPo
	XAr0cMpaXLt7A4qIvsVN1BkBmKEQFW2XXhsYK6YRXevQIcbzm6q+b+Yt7Zgboy656xC/guvrTrd
	wRSDLLw/yPK6u//KNgxvGVwjc3ZNsSMMGrNArGc1p7EfSiNhp2du59xDHE6cRbnwvkdY+QNSpSv
	VbNzGWICUy67qMbI+I/JLeoF4xdb8wc1IEUQGxstZn+kCGf4bntNG290lUKZv9QRNONbQ69lLsG
	EuF9Sa7ETZDLZF9uI8kivOXIPi/dWNToTmkbDdz54OXNTOcNB/XicowkxMsLjKpPmcr/+7Bk6oG
	XApxEdYGe3MsqiRALD/uKPbGAptpVNsXxretEzkjr2rfihO66fha65Jrt7wvGTs7Xx2ynm29cZk
	zM19rm2VhvpTA==
X-Google-Smtp-Source: AGHT+IG/HVX6sl7qvS5HuGpSlat+cDl0LQujIDtXQf0W9f0f6s+833nAhDQegxueecICNl4wV6F+tQ==
X-Received: by 2002:a05:6000:2086:b0:42b:47ef:1d7a with SMTP id ffacd0b85a97d-42fa08621eamr4831232f8f.20.1765356646438;
        Wed, 10 Dec 2025 00:50:46 -0800 (PST)
Message-ID: <29100824-303a-46b2-b394-d15d617131bc@suse.com>
Date: Wed, 10 Dec 2025 09:50:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] xenpm: Add get-intel-temp subcommand
To: Teddy Astie <teddy.astie@vates.tech>
Cc: Anthony PERARD <anthony.perard@vates.tech>, xen-devel@lists.xenproject.org
References: <cover.1765300623.git.teddy.astie@vates.tech>
 <6fcfea5d3f6be1bcf1d34ea5ccec40a477100472.1765300623.git.teddy.astie@vates.tech>
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
In-Reply-To: <6fcfea5d3f6be1bcf1d34ea5ccec40a477100472.1765300623.git.teddy.astie@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 09.12.2025 18:19, Teddy Astie wrote:
> --- a/tools/misc/xenpm.c
> +++ b/tools/misc/xenpm.c
> @@ -30,6 +30,7 @@
>  #include <inttypes.h>
>  #include <sys/time.h>
>  
> +#include <xen/asm/msr-index.h>

For this to not break non-x86 builds, don't you need to constrain the building
of the tool to CONFIG_X86? (I have no clue why it is being built for Arm as
well right now, as I don't see how it could provide any value there.)

> @@ -37,6 +38,7 @@
>  
>  static xc_interface *xc_handle;
>  static unsigned int max_cpu_nr;
> +static xc_physinfo_t physinfo;
>  
>  /* help message */
>  void show_help(void)
> @@ -93,6 +95,7 @@ void show_help(void)
>              "                                           units default to \"us\" if unspecified.\n"
>              "                                           truncates un-representable values.\n"
>              "                                           0 lets the hardware decide.\n"
> +            " get-intel-temp        [cpuid]       get Intel CPU temperature of <cpuid> or all\n"
>              " start [seconds]                     start collect Cx/Px statistics,\n"
>              "                                     output after CTRL-C or SIGINT or several seconds.\n"
>              " enable-turbo-mode     [cpuid]       enable Turbo Mode for processors that support it.\n"
> @@ -1354,6 +1357,92 @@ void enable_turbo_mode(int argc, char *argv[])
>                  errno, strerror(errno));
>  }
>  
> +static int fetch_dts_temp(xc_interface *xch, uint32_t cpu, bool package, int *temp)
> +{
> +    xc_resource_entry_t entries[2] = {

Is the 2 actually useful to have here?

> +        (xc_resource_entry_t){

Why these type specifiers? They shouldn't be needed in initializers (while they
would be needed in assignments)?

> +            .idx = package ? MSR_PACKAGE_THERM_STATUS : MSR_IA32_THERM_STATUS
> +        },
> +        (xc_resource_entry_t){ .idx = MSR_TEMPERATURE_TARGET },
> +    };
> +    struct xc_resource_op ops = {
> +        .cpu = cpu,
> +        .entries = entries,
> +        .nr_entries = 2,

ARRAY_SIZE() please.

> +    };
> +    int tjmax;
> +
> +    int ret = xc_resource_op(xch, 1, &ops);
> +
> +    if ( ret <= 0 )
> +        /* This CPU isn't online or can't query this MSR */
> +        return ret ?: -EOPNOTSUPP;

xc_resource_op() doesn't return errno values, so by using -EOPNOTSUPP here you
put the caller into a difficult position when actually looking at the return
value: Does -1 mean -1 or -EPERM?

> +    if ( ret == 2 )
> +        tjmax = (entries[1].val >> 16) & 0xff;
> +    else
> +    {
> +        /*
> +         * The CPU doesn't support MSR_IA32_TEMPERATURE_TARGET, we assume it's 100 which
> +         * is correct aside a few selected Atom CPUs. Check coretemp source code for more
> +         * information.
> +         */

What is "coretemp source code" in xen.git context? (I understand you mean the
Linux driver, but that also needs saying then.)

Further please respect line length limits, also ...

> +        fprintf(stderr, "[CPU%d] MSR_IA32_TEMPERATURE_TARGET is not supported, assume "

... e.g. here.

Additionally there are still IA32 infixes here.

Finally, if this message triggers once on a system, it'll likely trigger once
per get_intel_temp()'s loop iteration. Feels like a lot of (potential) noise.

> +                "tjmax=100°C, readings may be incorrect\n", cpu);
> +        tjmax = 100;
> +    }
> +    
> +    *temp = tjmax - ((entries[0].val >> 16) & 0xff);
> +    return 0;
> +}
> +
> +
> +void get_intel_temp(int argc, char *argv[])

static?

> +{
> +    int temp, cpu = -1;
> +    unsigned int socket;
> +    bool has_data = false;
> +
> +    if ( argc > 0 )
> +        parse_cpuid(argv[0], &cpu);
> +
> +    if ( cpu != -1 )
> +    {
> +        if ( !fetch_dts_temp(xc_handle, cpu, false, &temp) )
> +            printf("CPU%d: %d°C\n", cpu, temp);
> +        else
> +            printf("No data\n");
> +        return;
> +    }
> +
> +    /* Per socket measurement */
> +    for ( socket = 0, cpu = 0; cpu < max_cpu_nr;
> +          socket++, cpu += physinfo.cores_per_socket * physinfo.threads_per_core )
> +    {
> +        if ( !fetch_dts_temp(xc_handle, cpu, true, &temp) )
> +        {
> +            has_data = true;
> +            printf("Package%d: %d°C\n", socket, temp);

%u please for socket.

Jan

