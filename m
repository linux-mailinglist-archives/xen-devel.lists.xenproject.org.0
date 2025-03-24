Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E753A6DDA4
	for <lists+xen-devel@lfdr.de>; Mon, 24 Mar 2025 16:01:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.925729.1328612 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1twjIQ-0005pc-Hr; Mon, 24 Mar 2025 15:00:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 925729.1328612; Mon, 24 Mar 2025 15:00:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1twjIQ-0005ne-EC; Mon, 24 Mar 2025 15:00:58 +0000
Received: by outflank-mailman (input) for mailman id 925729;
 Mon, 24 Mar 2025 15:00:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=sMR0=WL=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1twjIO-0005nC-Nh
 for xen-devel@lists.xenproject.org; Mon, 24 Mar 2025 15:00:56 +0000
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [2a00:1450:4864:20::42e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c9726234-08c0-11f0-9ea2-5ba50f476ded;
 Mon, 24 Mar 2025 16:00:55 +0100 (CET)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-39141ffa9fcso3908919f8f.0
 for <xen-devel@lists.xenproject.org>; Mon, 24 Mar 2025 08:00:55 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3997f9a325csm11102025f8f.22.2025.03.24.08.00.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Mar 2025 08:00:53 -0700 (PDT)
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
X-Inumbo-ID: c9726234-08c0-11f0-9ea2-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1742828455; x=1743433255; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Mo6fJp0F1IUzlxDssU48NBjXGfBgXt0V9xAp/4jm5ko=;
        b=UCOGc8ambIdbB/doPphwbXxCCpLRDSI5PUHfuuX0FYFgQFy8k68scZESKukbieVf12
         FXnUlKwkAcKgozugDbtF3Po8rEnEIAe3VIEZ5BcfcfWuQ3buWHQobS/Sy/YAio9ltNLp
         H/w6E1ezvyTFx1Rcume4D/Ae5Hh6ufTYMMGAcbTJjBx6xqOR11ELzAYDlnGR0igDFD0b
         ko8XA/cpmR7eT9o+0k4JySNUnJSwIRKI7bxyAejGmlMfzRDipWlagrqeCo1GGaISxKYl
         RzsXOjoN8GaXWOqdQDFbihY18pSICj54Nq9ftgAeIDRIvgZ6liYySC4ZjjHc2mAQrgT2
         BoFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742828455; x=1743433255;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mo6fJp0F1IUzlxDssU48NBjXGfBgXt0V9xAp/4jm5ko=;
        b=t6w6iAMVwLvle9p3THNPFvgFKNiQDcKvD2BWyCp6GO4bbZt4JqGZ3vtxrFXeiUOleo
         DLlmZB90yQ3ngLxpMHw0St0i4GVcsiZeDdzDpAsbgHtq1qzvPBneuaOUbF5IB3DLeL/G
         4qwV6E34aKb9LJiNDjPwUxJRX1b/cLi5MQmeY8hslKDtxKXdNbTafkV4D4fCCaKgD49t
         rq+9tfpEI5HL44/LGPaofh+hT0t0wcRkOtanvF2vsrmGFdUoH+U0pVc5cr2fYqOHWQVJ
         VIY80Iwp8Lie0WOF6HiJA6ymRaKM2UeDanUy+Unc/pKvYe6njJHsL3dF0LLc5I4efb59
         rG1g==
X-Forwarded-Encrypted: i=1; AJvYcCXne/iK+AMGD3PrtcI+zxEgFEoyNbbW/TY/R2RqgsSi+IO8inMTm1yw5LqS2z8W0HzFCYXbOYG1bEU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxbdLnhpHrfdr/P7QEbhXD9pghvv9mtH0B4gl9Dj+B7xcQ1AvrI
	35aexyAjv7R8fb8FJomuOknP/MU/LygOez7VqA6rJOOdAhXK9p1aB0hIWA3SgQ==
X-Gm-Gg: ASbGncvlWsVI7xM0XT6XKguoChgNNSZe0Gr1nJ4+UEG9cutDbBEBeja33X0OXYMEa8O
	nZl7yUWt6eFH37PSWYYnKB98L7I7q5v+0rRJCVm3mdqxzz3rd0k9Yo0lTX7KwcMzNXnz/+x0Trr
	p5o1lozdOox7Q9kFgv6/QNwamP/vYwxlGEQmwgrJ2hPBeA987eFJplI3q5ONsdarXVFc5d/xfWh
	XcR4bucjz1OpTtNoF9GBoqAXZiF7sI1iMtjrdr/2RTpd6iEO3FuVzoPprIoVmCVWyPjtHK5RIqY
	AseACqn8bqmoZMbrF5HI9IaNDfQgImV1FKrGTo+ONR2H1vlf6747JTSsd1dtPusUvqFEgXBGYuY
	kpTcF4C6lrM9x84k5TZ3nihOCAzyJEGCQwqnvX7tK
X-Google-Smtp-Source: AGHT+IHSqvE5hHTODYEZMXbwzReS0+oeBEjvyujnkoyyOB3JC8ySCMbYz0opUeTvVDjymTpxxQNPUA==
X-Received: by 2002:a5d:5885:0:b0:391:48d4:bd02 with SMTP id ffacd0b85a97d-3997f914a95mr11920743f8f.29.1742828453429;
        Mon, 24 Mar 2025 08:00:53 -0700 (PDT)
Message-ID: <80963bfa-a19e-49a7-8de2-0d8508af450f@suse.com>
Date: Mon, 24 Mar 2025 16:00:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 03/15] xen/cpufreq: refactor cmdline "cpufreq=xxx"
To: Penny Zheng <Penny.Zheng@amd.com>
Cc: ray.huang@amd.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20250306083949.1503385-1-Penny.Zheng@amd.com>
 <20250306083949.1503385-4-Penny.Zheng@amd.com>
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
In-Reply-To: <20250306083949.1503385-4-Penny.Zheng@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06.03.2025 09:39, Penny Zheng wrote:
> This commit includes the following modification:
> - Introduce helper function cpufreq_cmdline_parse_xen and
> cpufreq_cmdline_parse_hwp to tidy the different parsing path
> - Add helper cpufreq_opts_contain to ignore user redundant setting,
> like "cpufreq=hwp;hwp;xen"
> - Doc refinement

See my earlier comment as to wording to avoid. In descriptions and comments
it would also be nice if function names could be followed by () (and array
names then be followed by []) to clearly identify the nature of such
identifiers.

> --- a/docs/misc/xen-command-line.pandoc
> +++ b/docs/misc/xen-command-line.pandoc
> @@ -535,7 +535,8 @@ choice of `dom0-kernel` is deprecated and not supported by all Dom0 kernels.
>    processor to autonomously force physical package components into idle state.
>    The default is enabled, but the option only applies when `hwp` is enabled.
>  
> -There is also support for `;`-separated fallback options:
> +User could use `;`-separated options to support universal options which they
> +would like to try on any agnostic platform, *but* under priority order, like
>  `cpufreq=hwp;xen,verbose`.  This first tries `hwp` and falls back to `xen` if
>  unavailable.  Note: The `verbose` suboption is handled globally.  Setting it
>  for either the primary or fallback option applies to both irrespective of where

What does "support" here mean? I fear I can't even suggest what else to use,
as I don't follow what additional information you mean to add here. Is a
change here really needed?

> --- a/xen/drivers/cpufreq/cpufreq.c
> +++ b/xen/drivers/cpufreq/cpufreq.c
> @@ -71,6 +71,46 @@ unsigned int __initdata cpufreq_xen_cnt = 1;
>  
>  static int __init cpufreq_cmdline_parse(const char *s, const char *e);
>  
> +static bool __init cpufreq_opts_contain(enum cpufreq_xen_opt option)
> +{
> +    unsigned int count = cpufreq_xen_cnt;
> +
> +    while ( count )
> +    {
> +        if ( cpufreq_xen_opts[--count] == option )
> +            return true;
> +    }
> +
> +    return false;
> +}
> +
> +static int __init cpufreq_cmdline_parse_xen(const char *arg, const char *end)
> +{
> +    int ret = 0;
> +
> +    xen_processor_pmbits |= XEN_PROCESSOR_PM_PX;
> +    cpufreq_controller = FREQCTL_xen;
> +    cpufreq_xen_opts[cpufreq_xen_cnt++] = CPUFREQ_xen;
> +    ret = 0;

ret was already set to 0 by the initializer.

> +    if ( arg[0] && arg[1] )
> +        ret = cpufreq_cmdline_parse(arg + 1, end);
> +
> +    return ret;
> +}
> +
> +static int __init cpufreq_cmdline_parse_hwp(const char *arg, const char *end)
> +{
> +    int ret = 0;
> +
> +    xen_processor_pmbits |= XEN_PROCESSOR_PM_PX;
> +    cpufreq_controller = FREQCTL_xen;
> +    cpufreq_xen_opts[cpufreq_xen_cnt++] = CPUFREQ_hwp;
> +    if ( arg[0] && arg[1] )
> +        ret = hwp_cmdline_parse(arg + 1, end);
> +
> +    return ret;
> +}

For both of the helpers may I suggest s/parse/process/ or some such
("handle" might be another possible term to use), as themselves they
don't do any parsing?

In the end I'm also not entirely convinced that we need these two almost
identical helpers (with a 3rd likely appearing in a later patch).

> @@ -112,25 +152,13 @@ static int __init cf_check setup_cpufreq_option(const char *str)
>          if ( cpufreq_xen_cnt == ARRAY_SIZE(cpufreq_xen_opts) )
>              return -E2BIG;
>  
> -        if ( choice > 0 || !cmdline_strcmp(str, "xen") )
> -        {
> -            xen_processor_pmbits |= XEN_PROCESSOR_PM_PX;
> -            cpufreq_controller = FREQCTL_xen;
> -            cpufreq_xen_opts[cpufreq_xen_cnt++] = CPUFREQ_xen;
> -            ret = 0;
> -            if ( arg[0] && arg[1] )
> -                ret = cpufreq_cmdline_parse(arg + 1, end);
> -        }
> +        if ( (choice > 0 || !cmdline_strcmp(str, "xen")) &&
> +             !cpufreq_opts_contain(CPUFREQ_xen) )
> +            ret = cpufreq_cmdline_parse_xen(arg, end);
>          else if ( IS_ENABLED(CONFIG_INTEL) && choice < 0 &&
> -                  !cmdline_strcmp(str, "hwp") )
> -        {
> -            xen_processor_pmbits |= XEN_PROCESSOR_PM_PX;
> -            cpufreq_controller = FREQCTL_xen;
> -            cpufreq_xen_opts[cpufreq_xen_cnt++] = CPUFREQ_hwp;
> -            ret = 0;
> -            if ( arg[0] && arg[1] )
> -                ret = hwp_cmdline_parse(arg + 1, end);
> -        }
> +                  !cmdline_strcmp(str, "hwp") &&
> +                  !cpufreq_opts_contain(CPUFREQ_hwp) )
> +            ret = cpufreq_cmdline_parse_hwp(arg, end);
>          else
>              ret = -EINVAL;

Hmm, if I'm not mistaken the example "cpufreq=hwp;hwp;xen" would lead us
to this -EINVAL then. That's not quite "ignore" as the description says.

Jan

