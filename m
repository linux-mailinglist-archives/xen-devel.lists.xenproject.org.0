Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5808C9C6CC7
	for <lists+xen-devel@lfdr.de>; Wed, 13 Nov 2024 11:23:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.835284.1251141 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBAWx-0007nv-Ob; Wed, 13 Nov 2024 10:23:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 835284.1251141; Wed, 13 Nov 2024 10:23:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBAWx-0007lG-Lt; Wed, 13 Nov 2024 10:23:23 +0000
Received: by outflank-mailman (input) for mailman id 835284;
 Wed, 13 Nov 2024 10:23:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=REvy=SI=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tBAWv-0007lA-MG
 for xen-devel@lists.xenproject.org; Wed, 13 Nov 2024 10:23:21 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4d4df859-a1a9-11ef-a0c7-8be0dac302b0;
 Wed, 13 Nov 2024 11:23:19 +0100 (CET)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-4316cce103dso83613855e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 13 Nov 2024 02:23:19 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-381ed9ec272sm18269236f8f.85.2024.11.13.02.23.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Nov 2024 02:23:18 -0800 (PST)
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
X-Inumbo-ID: 4d4df859-a1a9-11ef-a0c7-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjozMmMiLCJoZWxvIjoibWFpbC13bTEteDMyYy5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjRkNGRmODU5LWExYTktMTFlZi1hMGM3LThiZTBkYWMzMDJiMCIsInRzIjoxNzMxNDkzMzk5LjMyNjIxNiwic2VuZGVyIjoiamJldWxpY2hAc3VzZS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1731493398; x=1732098198; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=YsEMDJh8WfyISDZbNRaepSxbVtvn7UW6OLscEb723qc=;
        b=FbeKBqhwmlJwmPe6ksr+Y71baBkT+2lxLEEH+d4oEgIDdcP3t/aHdweSYlijxrO1OR
         i8AuF3oMcxOt1DAGOBFaWqC8X3kdyg6OekJ3Vgz4g5WfKKIUtMNw42VdtEwRwKfy2R5e
         jaeYlQTiXxgTwKB2Mp7KOznnbMjE51zWrxgB/BkQorpUAYxgP8SPbzuyd6aYOv1XGpb2
         X+SrFWi9YjSmEhnoEZPVkkEPs0NsI27JoSlp7wJGHRsLclbIyuyIirD6wIJ3CQctT6jv
         2Jp7hQ8k3Fg6C+b0iyqpoqF2Qo3SP7PUnzt/LcFKCoQtumDUvP5NqvGMskp3LhnkmaEZ
         nejg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731493398; x=1732098198;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YsEMDJh8WfyISDZbNRaepSxbVtvn7UW6OLscEb723qc=;
        b=lfQhQAUBOOchURyMKtvsYIi0Mcyf46sOH1wJnLOvEFJDBfz9XIp/uvhVlVoRQQiXrO
         9qd01maPiFD+QTrmngk/e5vDjO2z09oRpc42x+008qSxrre+aCRbedJS/LKexmFlVtH/
         LQMlmooOY8nRhu9nal0vonUISnKbm7tzJxmKdDIkr2e9LSvY2E0wbwpLMU2cXZkvgjYm
         cch6pLUj0adRx6VU2aT1fL+U5xhgLUMPrxurEMVMSAnqgqn00j415R+ZZMvCuLY5legr
         jZvsS2aMLRGW1WuWmL7TjCndpzDf57lX0rBEyTfoeLJ2RzJvQ9LX7OgbPBwZJ5hAoLZB
         IOUQ==
X-Forwarded-Encrypted: i=1; AJvYcCXkD7362iFyCoD68nluchpgT1Y/lhAYOwTp7KHJ0d0w7Tt7sHRWDMQcdZ/XWWFGUEUBAHhtWJ1+2+U=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwxDfjAMqSXKk0Df25mYFPM0rs2Ae9gYASlIbuMup2+2KE10Ygu
	monOV/+Yg2HroxQv5EmqwbuGwprFZpjT09PlLu3hBNDma9ZvX8HdNvoQEW6V2A==
X-Google-Smtp-Source: AGHT+IH7Um8yN+m7abMFbn4FCIvDst2d7ojBMIF/2RJgkk89/uAf0XgBWRrCoqjKedtJj6ZqNVu9SQ==
X-Received: by 2002:a05:600c:3c99:b0:42c:ba83:3f00 with SMTP id 5b1f17b1804b1-432b74febf4mr210737545e9.1.1731493398609;
        Wed, 13 Nov 2024 02:23:18 -0800 (PST)
Message-ID: <5961777b-2d38-4edd-b2e0-2da89862655c@suse.com>
Date: Wed, 13 Nov 2024 11:23:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] x86/trampoline: Rationalise the constants to describe
 the size
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "Daniel P . Smith" <dpsmith@apertussolutions.com>,
 Frediano Ziglio <frediano.ziglio@cloud.com>,
 Alejandro Vallejo <alejandro.vallejo@cloud.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20241113093058.1562447-1-andrew.cooper3@citrix.com>
 <20241113093058.1562447-3-andrew.cooper3@citrix.com>
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
In-Reply-To: <20241113093058.1562447-3-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13.11.2024 10:30, Andrew Cooper wrote:
> --- a/xen/arch/x86/include/asm/config.h
> +++ b/xen/arch/x86/include/asm/config.h
> @@ -51,8 +51,9 @@
>  
>  #define IST_SHSTK_SIZE 1024
>  
> -#define TRAMPOLINE_STACK_SPACE  PAGE_SIZE
> -#define TRAMPOLINE_SPACE        (KB(64) - TRAMPOLINE_STACK_SPACE)
> +/* See asm/trampoline.h */
> +#define TRAMPOLINE_SIZE         KB(64)
> +#define TRAMPOLINE_HEAP_END     (TRAMPOLINE_SIZE - PAGE_SIZE)

Is there actually a reason these can't move to trampoline.h?

Jan


