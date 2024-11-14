Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CC4B79C8927
	for <lists+xen-devel@lfdr.de>; Thu, 14 Nov 2024 12:42:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.836324.1252202 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBYEf-0004tj-RP; Thu, 14 Nov 2024 11:42:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 836324.1252202; Thu, 14 Nov 2024 11:42:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBYEf-0004rm-OH; Thu, 14 Nov 2024 11:42:05 +0000
Received: by outflank-mailman (input) for mailman id 836324;
 Thu, 14 Nov 2024 11:42:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=81on=SJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tBYEe-0004rg-JP
 for xen-devel@lists.xenproject.org; Thu, 14 Nov 2024 11:42:04 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 765eee62-a27d-11ef-a0c7-8be0dac302b0;
 Thu, 14 Nov 2024 12:42:01 +0100 (CET)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-43163667f0eso4710955e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 14 Nov 2024 03:42:01 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-432da27ffafsm20880675e9.22.2024.11.14.03.42.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Nov 2024 03:42:00 -0800 (PST)
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
X-Inumbo-ID: 765eee62-a27d-11ef-a0c7-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjozMzEiLCJoZWxvIjoibWFpbC13bTEteDMzMS5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6Ijc2NWVlZTYyLWEyN2QtMTFlZi1hMGM3LThiZTBkYWMzMDJiMCIsInRzIjoxNzMxNTg0NTIxLjQyMzE2Nywic2VuZGVyIjoiamJldWxpY2hAc3VzZS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1731584521; x=1732189321; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=vjPNGdQGo25oHcJOvSGhX3nl6JKxsDZiGpRGUM+/mnw=;
        b=S7wMEz7wK2+ywWt3GozLqSDUhVljdB3zgVL6z5uNNYjCtESBwVM0oIbFq/5WcZtZuN
         z9PC2uaZTjcTbE48Cs7R1JyRyYHdo/iz0h9QTH2uKeOmrwJb77J1vdPm3qB5quY9kTUU
         XqLpsDUoOzEhNzmh4D0LZ8otzHSY2NI0dM0mwTdXVwKEjx6uEHabN7EoKuf548kTENGJ
         fopocEWcawQGuitlfwb0zw3qvFGlNrQdtxgGPLnKGApWBWuPZfWjjdLCmbryiKUT5PHQ
         eRCiLBEiDXjNJQJe2jwZKemkNSmbrr1x8yieTuKbRRU31nKrzTk0YrEN/3OiuMXcKFEu
         gHKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731584521; x=1732189321;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vjPNGdQGo25oHcJOvSGhX3nl6JKxsDZiGpRGUM+/mnw=;
        b=TsBdWdLSR3+DrSNTRu1TNjD5FmrSSkg3IiA5bpzdX/P+pfKBDMR3sU6vSp1w6JC+e8
         qgWPXD/xPIcou8HgGJK9/jzNPsUycbI/sxRd/zygf5Se1nSGuBmPcl0qeGQHQlXuhu4R
         pmqRhlbon1Pc5qVJOXhS9OzENmTTK7q3YkflkujtSePt9W/Zu9Q4femGEVBwupKDViPC
         7rMPpSISCOhirdYDEeZBNPzf9R6y8g+gbK4CfXItZP5RI2VcLmOhpA/SN2u5bnLYuUw4
         KJAg/zPhfZVjXToA/Adk7BgnTnLCV2QU0Dhhcy/UGfP/h5gcd/JqoRDmsILI9nQH4rqG
         YzXQ==
X-Forwarded-Encrypted: i=1; AJvYcCUkI2T2u/grpeWPyLo3Xek+nXdPnfZQa/Ip07kTdUAgJ8AIYPPwTVdchPG3hfXRppWnqNa8zKoxaBM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwxrI8Ho6fL20gqhMWsZQOau38I+l9lDyw/LyQxMZ6dVM9GYiOj
	c+LAnfklGCTgJj5luVv6hHRPOKNnXOWStNfDTr+PKBzumCoxaiiIqCm+m4aagw==
X-Google-Smtp-Source: AGHT+IEpEas25+lJXbB6zpvxH+5WeDRGgLx5IjJePN42cRvkOS38/CVshQxDZFSMW55xNWsq1MPECg==
X-Received: by 2002:a05:600c:548b:b0:426:64a2:5362 with SMTP id 5b1f17b1804b1-432da7a051amr16541365e9.8.1731584520788;
        Thu, 14 Nov 2024 03:42:00 -0800 (PST)
Message-ID: <aee06ffe-fb3d-41ab-a715-0bb057d4ca52@suse.com>
Date: Thu, 14 Nov 2024 12:41:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] x86/ucode: Drop MIS_UCODE and
 microcode_match_result
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20241112211915.1473121-1-andrew.cooper3@citrix.com>
 <20241112211915.1473121-4-andrew.cooper3@citrix.com>
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
In-Reply-To: <20241112211915.1473121-4-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12.11.2024 22:19, Andrew Cooper wrote:
> @@ -199,8 +198,8 @@ static bool microcode_fits_cpu(const struct microcode_patch *patch)
>      return equiv.id == patch->processor_rev_id;
>  }
>  
> -static enum microcode_match_result cf_check compare_patch(
> -    const struct microcode_patch *new, const struct microcode_patch *old)
> +static int cf_check compare_patch(
> +    const struct microcode_patch *old, const struct microcode_patch *new)
>  {

Let's hope we won't screw up a backport because of this swapping. I'd
like to ask to at least consider renaming at least the functions,
perhaps also the hook pointer, perhaps simply by switching from singular
to plural. This would then also avoid reviewers like me to go hunt for
all uses of the function/hook, in an attempt to make sure none was left
out when converting.

> @@ -54,11 +47,17 @@ struct microcode_ops {
>                             unsigned int flags);
>  
>      /*
> -     * Given two patches, are they both applicable to the current CPU, and is
> -     * new a higher revision than old?
> +     * Given a current patch, and a proposed new patch, order them based on revision.
> +     *
> +     * This operation is not necessarily symmetrical.  In some cases, a debug
> +     * "new" patch will always considered to be newer, on the expectation that
> +     * whomever is using debug patches knows exactly what they're doing.
>       */
> -    enum microcode_match_result (*compare_patch)(
> -        const struct microcode_patch *new, const struct microcode_patch *old);
> +#define OLD_UCODE  -1

Nit: I'm pretty sure Misra wants parentheses here.

Preferably with both (mechanical) adjustments:
Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan

