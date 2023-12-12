Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7308780E8DF
	for <lists+xen-devel@lfdr.de>; Tue, 12 Dec 2023 11:14:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.652919.1019070 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rCzlv-0008TU-U7; Tue, 12 Dec 2023 10:13:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 652919.1019070; Tue, 12 Dec 2023 10:13:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rCzlv-0008Qs-R2; Tue, 12 Dec 2023 10:13:51 +0000
Received: by outflank-mailman (input) for mailman id 652919;
 Tue, 12 Dec 2023 10:13:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=A/PU=HX=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rCzlt-0008Qk-VA
 for xen-devel@lists.xenproject.org; Tue, 12 Dec 2023 10:13:49 +0000
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 23e2ba71-98d7-11ee-98e8-6d05b1d4d9a1;
 Tue, 12 Dec 2023 11:13:48 +0100 (CET)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-3332efd75c9so4916230f8f.2
 for <xen-devel@lists.xenproject.org>; Tue, 12 Dec 2023 02:13:48 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 n4-20020a5d6b84000000b0033634aef014sm614202wrx.104.2023.12.12.02.13.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Dec 2023 02:13:47 -0800 (PST)
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
X-Inumbo-ID: 23e2ba71-98d7-11ee-98e8-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1702376028; x=1702980828; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sA53lr3VybLm+zUZRmEDV22LzxVMfZxX2hxcf3b294g=;
        b=I7V2YKqWguq5gFzFYmmQ7POXDuPjaZRnsWBcAWSm5b+yzj7nxLXicq8/yB5l2ApM+t
         1Bohw+6JhJKqPgUbx1CMQT+HFlrZNY3Gcv0jzkyly6gc1Q/FuQNr2MhX46N2EYVhORh2
         DgDbynA7RSZ9PXtXz8aP++PWym84hJnJdhsq1kdx5LlWN1pnuDg83AanCunOgYT8KIfT
         hJXx6bEnVLRt3300msOAKfDekSS9ugqv+Zj66E5JmA+8tbSEUwlWcPmKvlin8dO6vT6e
         wCMOjmUB+FIoOAb4oDb4rjleewPxTUUKWrYS4CRCFeD9Pos59hyO/snACuFSWNeQCChx
         Yr1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702376028; x=1702980828;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sA53lr3VybLm+zUZRmEDV22LzxVMfZxX2hxcf3b294g=;
        b=d7UkP5GgvtPxcjHiIObDhE/xYRmOiRkBgCi73Nr6PLVBXleGXZtZkJ18mx18gqYFMB
         rJn8GcnNsg349mdJWYSo1AFk/cDUWXW7MGQJRvWZhmLeNql3At5dwDwcWNzphuKQoMB7
         wuzxbXvf6KymtBqN2YbeJNJ8QRHx8O/9zFIoYHrhGQ11CuiJD5J8gZcYt733TS/XHSNQ
         /ezrMjI+ADmV+kPF+Mi1pqV7+MMRGa2elGw+YznHMTHjn3Hxf9l1GlvshMh3LqZpR47B
         psarQcfsutEHzdcmYKry5oKQ25rE5bNzAaqZoPbYOnX+DwiqVPyNTOshCLU1FBQU83Om
         MwcQ==
X-Gm-Message-State: AOJu0Yw+2t+YvXTyjZNJPL8zMcj71WP/pvIeyrzqsMavwDENnBrBdEF2
	OrVQK34nKagpXwbAj6L1cWdt
X-Google-Smtp-Source: AGHT+IHrOLWnwqUwi4jG+YJTLMbDbKBt8/XAhrcJ3OxXpULLg2Tlp7EOBzANOr3cd/3bJSyboRU1CA==
X-Received: by 2002:a5d:4342:0:b0:333:591c:6507 with SMTP id u2-20020a5d4342000000b00333591c6507mr1570505wrr.248.1702376027903;
        Tue, 12 Dec 2023 02:13:47 -0800 (PST)
Message-ID: <a8c42909-6316-448b-8d21-628d055abfbc@suse.com>
Date: Tue, 12 Dec 2023 11:13:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 6/7] x86/platform: removed break to address MISRA
 C:2012 Rule 2.1
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: consulting@bugseng.com, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1702283415.git.nicola.vetrini@bugseng.com>
 <b1103bc13d5ce04159417592705b4fe6a6db748b.1702283415.git.nicola.vetrini@bugseng.com>
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
In-Reply-To: <b1103bc13d5ce04159417592705b4fe6a6db748b.1702283415.git.nicola.vetrini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11.12.2023 11:30, Nicola Vetrini wrote:
> The break statement is redundant, hence it can be removed.

Except ...

> --- a/xen/arch/x86/platform_hypercall.c
> +++ b/xen/arch/x86/platform_hypercall.c
> @@ -723,7 +723,6 @@ ret_t do_platform_op(
>  
>          ret = continue_hypercall_on_cpu(
>              0, cpu_down_helper, (void *)(unsigned long)cpu);
> -        break;
>      }
>      break;

... it wants to be the other break that is removed, imo. Andrew, Roger,
what do you think? There are many such (again: imo) oddly placed break-s
in that switch() ... In some cases there are also inner scopes without
there being new local variables in there. IOW imo throughout this
switch()
- pointless inner scopes want dropping,
- all "main" break-s want to have the same indentation.

Jan

