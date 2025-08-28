Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FE11B39D69
	for <lists+xen-devel@lfdr.de>; Thu, 28 Aug 2025 14:36:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1098703.1452695 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urbrO-0000EE-Ji; Thu, 28 Aug 2025 12:36:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1098703.1452695; Thu, 28 Aug 2025 12:36:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urbrO-0000DU-FV; Thu, 28 Aug 2025 12:36:10 +0000
Received: by outflank-mailman (input) for mailman id 1098703;
 Thu, 28 Aug 2025 12:36:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=pYI3=3I=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1urbrN-0000Cd-BM
 for xen-devel@lists.xenproject.org; Thu, 28 Aug 2025 12:36:09 +0000
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [2a00:1450:4864:20::52b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9129f939-840b-11f0-8dd7-1b34d833f44b;
 Thu, 28 Aug 2025 14:36:06 +0200 (CEST)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-61cbc8259fbso1334602a12.2
 for <xen-devel@lists.xenproject.org>; Thu, 28 Aug 2025 05:36:06 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-61cb77ec864sm3175065a12.37.2025.08.28.05.36.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Aug 2025 05:36:05 -0700 (PDT)
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
X-Inumbo-ID: 9129f939-840b-11f0-8dd7-1b34d833f44b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1756384566; x=1756989366; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=tLCP8SA5dpRIIPjCzuLJhZmjGW4fmF8XmRZ+tuHCizs=;
        b=BklZ9t8fCEBWqo2AFDbvc3bFOFo/MbcpsaGeg5Goo+PkreDcpReXic5ChNZdIV5XpD
         2hVAvWOVamp/FCyitioh4UhQUGlfv6NfgvbCD0ivJE7vFli65yHNG5KNyTPHWIU0Vcb7
         Naq17xyHnQzIBOZnMbRfcERDGiFf84pnMy2WSQD/rADiIkECg5GaixNz17w8+xUc2VL7
         zBpWVSBTuG1wbDEAdqf9kXoJZrfjQ+xWiGO2J4yz6yUodv+luR9klskhtJVtBZIaFcKK
         12jH8XdkpfoqwzurgfX7IMT4NEZNBW+tbit2jHY5bfB33d3wK+kAD9DbQyWRvRrOPDZY
         TTug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756384566; x=1756989366;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tLCP8SA5dpRIIPjCzuLJhZmjGW4fmF8XmRZ+tuHCizs=;
        b=nZZw1Au/VAyMQeRM1Qw/jTJXpCioPoQpLOxrFssWiIeSYHXlQY89oIn6MG9G4GYDbb
         vSvcwHwN0h4RbCxzgejMZT9FRa2oFbpK9o3OkL8qSwMEbpSNi1WGSdGFFVvu8/iik3Jx
         yuuzYk+Zny4acpAHZC6dGLwZ+jW1p5kKzzR527Krx6ftAWtAFT4t5h4byq0lQNt5lqtO
         +jgCHEYCudSkWxRD34lh+hWcv9oTciIzvke0sdm9EeI9fOlsWtOm2J4KmGYUxusEv9RJ
         iSDfRlbqb52x0v66t1pjDEm7e0t7xwb44+U8VPUZTSZ4UboIpqq/KPHYshUVaHONI25/
         xcuQ==
X-Forwarded-Encrypted: i=1; AJvYcCWqu6r2xklQyTeEnFdHa3L/5B+4H4XDOdkxuo7liNpFLWpeDKxeV3hu3A9TFwpukA3DPiRhJPKhz70=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzRXrb9BiS947lReszJYtKzrIEHS7Czt445Hl4YWDGMrlsLvSrx
	+HzqoqSYJQCQrtv6mvbZ3bomIurXCrgJlvG+Uh6IUKskpHLavmUsyDDXQLAjAuvAVeOVwofgNBu
	/7zs=
X-Gm-Gg: ASbGncvnwjDAWlXLEau3rYXXmHcW7wxt6d7or5Vr1Hh76uyBi04mcYCzcjCmq/Oxg1G
	zQWhjM8cFUmHBauZ3o5wgehu3OAEFkJA3tv8YU8HKmNGSj8Xcu7c3wyaouPLkcbSKi/1Zw2yd35
	Gfpsw8BXc9N7MxQM5h/++RT5nQ5jHApFC+IQhEla43O2R2wEJM3LzvC7f2VFKYqIv2SqfxVgIo4
	yZnyhsE4afSWqAbr1DneL5yZdEXS3Y3utYDson/1SGMiz423SEuUVod/YyfBEdegcXzIix9zabk
	ZkCxxD97DaDiXbqOkeSOmTjIrZettLDkIJWS1cKHvB/1BMt15z982/PeKEb07Prt0W4MfxKUjBA
	68c0YB7NFZ1DujTXQBgglDwP0z1I5VMaRJf309ZtUKsaje54mg5komVkvt4BOYYpQaYnJLv+Ve7
	7g4mIwwKo=
X-Google-Smtp-Source: AGHT+IHtd1867US+I8nqSqJAAMzWsBtOABEERJ6Zl+aJI4yIJ8DJBJdKTq1FwRIdgayv1YJh+vlZNQ==
X-Received: by 2002:a05:6402:3492:b0:61c:6b3a:ce88 with SMTP id 4fb4d7f45d1cf-61c6b3ad602mr11748404a12.8.1756384565344;
        Thu, 28 Aug 2025 05:36:05 -0700 (PDT)
Message-ID: <24124bb1-c03d-469f-b668-3945c35e05c1@suse.com>
Date: Thu, 28 Aug 2025 14:36:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 6/9] sched: Extract do_poll main logic into vcpu_poll
To: Teddy Astie <teddy.astie@vates.tech>
Cc: Dario Faggioli <dfaggioli@suse.com>, Juergen Gross <jgross@suse.com>,
 George Dunlap <gwd@xenproject.org>, xen-devel@lists.xenproject.org
References: <cover.1755785258.git.teddy.astie@vates.tech>
 <812a818e263cb8287634cea5241fe076beacc39f.1755785258.git.teddy.astie@vates.tech>
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
In-Reply-To: <812a818e263cb8287634cea5241fe076beacc39f.1755785258.git.teddy.astie@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 21.08.2025 17:25, Teddy Astie wrote:
> do_poll takes sched_poll* as parameter, but that's actually in guest memory
> (so it's more a guest handle).

No, it's not, or else ...

> --- a/xen/common/sched/core.c
> +++ b/xen/common/sched/core.c
> @@ -1437,21 +1437,13 @@ static void vcpu_block_enable_events(void)
>      vcpu_block();
>  }
>  
> -static long do_poll(const struct sched_poll *sched_poll)
> +static long vcpu_poll(unsigned int nr_ports, uint64_t timeout, evtchn_port_t *ports)
>  {
>      struct vcpu   *v = current;
>      struct domain *d = v->domain;
> -    evtchn_port_t  port = 0;
>      long           rc;
>      unsigned int   i;
>  
> -    /* Fairly arbitrary limit. */
> -    if ( sched_poll->nr_ports > 128 )

... this access would be a security issue. The handle is ...

> -        return -EINVAL;
> -
> -    if ( !guest_handle_okay(sched_poll->ports, sched_poll->nr_ports) )

... seen here, the ->ports member.

Here as well as for patch 1 and 3 what is entirely lacking from the description
is the mentioning of why the change is actually going to be useful.

Jan

