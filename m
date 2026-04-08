Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OG+hNIZL1ml8DQgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 08 Apr 2026 14:35:18 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 40DBA3BC2EA
	for <lists+xen-devel@lfdr.de>; Wed, 08 Apr 2026 14:35:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1275992.1561643 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wAS7S-0008KL-OL; Wed, 08 Apr 2026 12:34:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1275992.1561643; Wed, 08 Apr 2026 12:34:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wAS7S-0008Hw-Le; Wed, 08 Apr 2026 12:34:54 +0000
Received: by outflank-mailman (input) for mailman id 1275992;
 Wed, 08 Apr 2026 12:34:54 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wAS7R-0008Hq-Tp
 for xen-devel@lists.xenproject.org; Wed, 08 Apr 2026 12:34:54 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wAS7Q-008eTB-RK
 for xen-devel@lists.xenproject.org; Wed, 08 Apr 2026 14:34:52 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69d64b5d-bab6-0a2a0a5309dd-0a2a4509a234-40
 for <xen-devel@lists.xenproject.org>; Wed, 08 Apr 2026 14:34:52 +0200
Received: from [209.85.128.49] (helo=mail-wm1-f49.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <jbeulich@suse.com>)
 id 69d64b6c-bf79-0a2a45090019-d1558031edb8-3
 for <xen-devel@lists.xenproject.org>; Wed, 08 Apr 2026 14:34:52 +0200
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-488afb0427eso36378955e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 08 Apr 2026 05:34:52 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4887e80a63esm822552095e9.3.2026.04.08.05.34.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Apr 2026 05:34:51 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:In-Reply-To:Autocrypt:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1775651692; x=1776256492; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=NEezGgfFw/VX5nvvqf1R4nIVKN7YvXPBoYZPwxQfE+g=;
        b=c0tJhkMOZ12d/ddfx+h0qRb7p821quBinVbVY1FDofu8LpsYJmIQzs1ovLUOPzvob2
         i1Quv55JYKT/KOzZ4ukX15Tl9007NkwYNJ5e0ArSjssO4hZ57+SCkXuAKFK1qeSUhfpC
         PmfXLQfnZZRqo/LyHlRG6wnR3tpUW2ca8be/ouXbJZ8ukKucKqqMZLONJWEK8PPEs83l
         dDRYlmvNJX7UpvCZVgyMJW2uRBIVMBXQnzThx8ov4uD9AGSsMegxooN4Rk9NWkCXv6V8
         S4nN8zwiOTfjs/Nr1r4Zio0jvpw6Vcm/0qpKbZRdV0n2OWDonGqn2UJeRp3o6w06seo/
         tU4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775651692; x=1776256492;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NEezGgfFw/VX5nvvqf1R4nIVKN7YvXPBoYZPwxQfE+g=;
        b=A/Ad7ri4+OaY1y/woDZWOhmKIv+0S+k94lGgLqQc6fKfRG4GCM0fxi5NFTKUPvK60k
         gvB0aaWGhP6sZMR2ENfLCKHMEYzxy+PLX8dg+1Xe2DeXmixtIM5rOlJ2tRka0q3FMY4O
         fX7Oy731g+zqbCMS3f0yFWuczeDsCK/CFInXDDFezpNyO0m3V6xnzyLQ9RfqgeMDtDEJ
         1ERBKMDb1Hu8Hl3WG5q92AtAXbdpggxBaWZOuEP1ga7DmKR4ENogyhVH9pfk2yCAzTRm
         XwIjlq8aqRjbTc0A+AW7UkncfOzSXeYQPlCSbv4WFmdoqTxzrFCu2p35SIp0U//SIjab
         je8A==
X-Forwarded-Encrypted: i=1; AJvYcCUAcgsWp5nA9hOqIRYtX/IdiKEeHdgSPA084pufUB6U+NiZ3swvk6MVfyleLAptG2nQz82nE+2AWEU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YymPFK2X22cNKWmSxrBa6/aM8kALaJr5OkVjpGftv1zpTC72wZI
	7TXOqFcgPmP/kyBB/WChpqywdOK80kuz2B4ulyDOeBSz/rsLLQUKJP+g12bf4wG+SA==
X-Gm-Gg: AeBDiet11qbdv42gXDhzXoAulaLwZSplqlzQtvOuzKgTr6lItwKjgxSog7JMVhESczN
	u8erqYKThQnsHVr0KSgdU1gQPV73C35keXQUxaqCaXMT9xugflRTqosirXBBnAQTTWLDJtuhULL
	KWvsvl1NmW//tqefpoSdyVFJFWlqI9fRDNwJyNR0rzsHnzyfaIqVTKlqDqhCoSYP5Lkj7CvwPHh
	M7mLr//JFe+1hUUtUL2y4r+uIZRN005KvB4Poj8OsIG9N4g3Ka4vF57QM2bjny7rpNwdxzdYPHH
	jtaZjJzYqBpq0uYRL0ypgib4BhBKh9D96kCtQY95gHjWoy4oxqFLlf00EcLawWZzrK3wsA9DzwY
	+vJbIyXdZbCwqnk6NsAhu9lzdIWVzFOreh+2W9rymUAb7NQ3nwrhJF3ej2QxdWdeyrcxlIiJQEp
	LLfcnMjQ+tVGGEoSjX5SxcYPdN7S3p9VGJ9DKbi6kRE6TCfsr5vmewcAtHtTtf303y9+csyrFIr
	KjoNcE4LJohBS4=
X-Received: by 2002:a05:600c:4689:b0:488:be21:54ae with SMTP id 5b1f17b1804b1-488be21569bmr98992405e9.0.1775651692055;
        Wed, 08 Apr 2026 05:34:52 -0700 (PDT)
Message-ID: <a9b21308-18f6-41ab-9ba6-1c2874cee86b@suse.com>
Date: Wed, 8 Apr 2026 14:34:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10] xenpm: Add get-core-temp subcommand
To: Teddy Astie <teddy.astie@vates.tech>
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Community Manager <community.manager@xenproject.org>,
 Anthony PERARD <anthony.perard@vates.tech>, xen-devel@lists.xenproject.org
References: <22bcde2914c0303b2c594485542af19d2952e782.1775570823.git.teddy.astie@vates.tech>
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
In-Reply-To: <22bcde2914c0303b2c594485542af19d2952e782.1775570823.git.teddy.astie@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-bad1c0/1775651692-2F34C152-F5F2749C/0/0
X-purgate-type: clean
X-purgate-size: 3605
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:teddy.astie@vates.tech,m:oleksii.kurochko@gmail.com,m:community.manager@xenproject.org,m:anthony.perard@vates.tech,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,xenproject.org,vates.tech,lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:dkim,suse.com:email,suse.com:mid,keepachangelog.com:url];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	NEURAL_HAM(-0.00)[-0.992];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 40DBA3BC2EA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 07.04.2026 16:10, Teddy Astie wrote:
> --- a/CHANGELOG.md
> +++ b/CHANGELOG.md
> @@ -16,6 +16,8 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
>       mitigate (by rate-limiting) the system wide impact of an HVM guest
>       misusing atomic instructions.
>     - Support for CPIO microcode in discrete multiboot modules.
> +   - Introduce get-core-temp to xenpm to query CPU temperatures on Intel
> +     platforms.

Would you mind inserting "command" or "option" before "to xenpm"?

> @@ -1354,6 +1358,121 @@ void enable_turbo_mode(int argc, char *argv[])
>                  errno, strerror(errno));
>  }
>  
> +static int fetch_dts_temp(xc_interface *xch, uint32_t cpu, bool package, int *temp)
> +{
> +    xc_resource_entry_t entries[] = {
> +        { .idx = package ? MSR_PACKAGE_THERM_STATUS : MSR_IA32_THERM_STATUS },
> +        { .idx = MSR_TEMPERATURE_TARGET },
> +    };
> +    struct xc_resource_op ops = {
> +        .cpu = cpu,
> +        .entries = entries,
> +        .nr_entries = ARRAY_SIZE(entries),
> +    };
> +    int tjmax;
> +
> +    int ret = xc_resource_op(xch, 1, &ops);
> +
> +    switch ( ret )
> +    {
> +    case 0:
> +        /* This CPU isn't online or can't query this MSR */
> +        errno = ENODATA;
> +        return -1;
> +
> +    case 1:
> +    {
> +        /*
> +         * The CPU doesn't support MSR_TEMPERATURE_TARGET, we assume it's 100
> +         * which is correct aside a few selected Atom CPUs. Check Linux
> +         * kernel's coretemp.c for more information.
> +         */
> +        static bool has_reported_once = false;
> +
> +        if ( !has_reported_once )
> +        {
> +            fprintf(stderr, "MSR_TEMPERATURE_TARGET is not supported, assume "
> +                            "tjmax = 100, readings may be incorrect.\n");
> +            has_reported_once = true;
> +        }
> +
> +        tjmax = 100;
> +        break;
> +    }
> +
> +    case 2:
> +        tjmax = (entries[1].val >> 16) & 0xff;
> +        break;
> +
> +    default:
> +        if ( ret > 0 )
> +        {
> +            fprintf(stderr, "Got unexpected xc_resource_op return value: %d", ret);
> +            errno = EINVAL;
> +        }
> +        return -1;
> +    }
> +
> +    *temp = tjmax - ((entries[0].val >> 16) & 0xff);
> +    return 0;
> +}
> +
> +static void get_core_temp(int argc, char *argv[])
> +{
> +    int temp = -1, cpu = -1;

cpu's initializer is needed, but why would temp need one? You rely on ...

> +    unsigned int socket;
> +    bool has_data = false;
> +
> +    if ( argc > 0 )
> +        parse_cpuid(argv[0], &cpu);
> +
> +    if ( cpu != -1 )
> +    {
> +        if ( fetch_dts_temp(xc_handle, cpu, false, &temp) )
> +        {
> +            fprintf(stderr, "Unable to fetch temperature (%d - %s)\n",
> +                    errno, strerror(errno));
> +            exit(EXIT_FAILURE);
> +        }
> +        else
> +            printf("CPU%d: %d°C\n", cpu, temp);
> +        return;
> +    }
> +
> +    /* Per socket measurement */
> +    for ( socket = 0, cpu = 0; cpu < max_cpu_nr;
> +          socket++, cpu += physinfo.cores_per_socket * physinfo.threads_per_core )
> +    {
> +        if ( fetch_dts_temp(xc_handle, cpu, true, &temp) )

... fetch_dts_temp() to always update it in the success case anyway, both here and
in the other loop further down.

Other than this (happy to adjust while committing, provided you agree):
Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan

