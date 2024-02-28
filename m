Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FAD786AADC
	for <lists+xen-devel@lfdr.de>; Wed, 28 Feb 2024 10:07:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.686428.1068435 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfFtt-0004v3-JW; Wed, 28 Feb 2024 09:06:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 686428.1068435; Wed, 28 Feb 2024 09:06:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfFtt-0004sY-Gu; Wed, 28 Feb 2024 09:06:53 +0000
Received: by outflank-mailman (input) for mailman id 686428;
 Wed, 28 Feb 2024 09:06:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=iHog=KF=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rfFts-0004sS-Jo
 for xen-devel@lists.xenproject.org; Wed, 28 Feb 2024 09:06:52 +0000
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [2a00:1450:4864:20::533])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b4b7fe38-d618-11ee-a1ee-f123f15fe8a2;
 Wed, 28 Feb 2024 10:06:50 +0100 (CET)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-55a035669d5so9201334a12.2
 for <xen-devel@lists.xenproject.org>; Wed, 28 Feb 2024 01:06:49 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 t10-20020aa7d70a000000b00566626a355bsm535541edq.27.2024.02.28.01.06.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Feb 2024 01:06:48 -0800 (PST)
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
X-Inumbo-ID: b4b7fe38-d618-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1709111209; x=1709716009; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dBTQme72G1D1WHjl6s4FaCExq4+OBKBcEuq5q+muxj0=;
        b=RMxEQPS5aduAZRDjTlqU/Sl3p7cptdbc1uT4w2jdPbKy9wgrwCG0IVFbKqp44Ele0x
         MxNAf+/09tCnaD9i2dY/zhlpuHvfpxm+utS8GmE3/n5HCFNkfvBpzcLFnCz6/pILRlhE
         rq2iE8CHwpKAKPNYWciMrSHFEmnFrQp3LMR25A7YWGO1dDcHZmTTDOVyku9Feu4jzm3D
         KeoQcrtMQKHmGDOq1eIRpm7VzQuOVp+v3P1R2AMzMEzygbq4Oh+T0kd5aIFs286w7SNk
         a/CUnpsclaWOJ2kHi0DLfeHp1nY2CFiU5YUStIMRuGPG8baeLJSRshQ07EjA5XOMcJEW
         nIKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709111209; x=1709716009;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dBTQme72G1D1WHjl6s4FaCExq4+OBKBcEuq5q+muxj0=;
        b=h7roNA7FiEYwglkY3QCxa6wg1/PFYijcsQ5bI+dh1MIMPqrbA83bHDby+zgC5eOqVu
         cC5Ml5z63SqKuzDA5R0p37bakHhELSlEf5MPe3b0MiJAxxNfROYkprk/luo5cIvdBfWG
         nDBstKTBSUtzF2+umatEbbD/OuPYlGgGkEjCanSFzWfRXEADbz7sYHpiLm6htmffSRR4
         PU77Au37cJyNEXJp3ttJAwPtOkw5nIx08+zuC3w84zqEphEnqjfW7/0OUJ7WMJraVLzN
         oGm62HL3DLBcB1iareGfmNZdE3HEm43OcALQrgn38IJx4nj6sYyitQII3/mTplLSWFeD
         lJxQ==
X-Forwarded-Encrypted: i=1; AJvYcCWUxjCyFs7WIEp4d84ipNdrjvgOi7y9Qgm3MxTX8FZE6mLswkT8pSM/R4OIQgDIoUJ3eiItNLOBHcmk4BSycUP4PyqXf3vK/KL6lPNVSqs=
X-Gm-Message-State: AOJu0Yx1b5MFg+ebCQyTvyDTBVH6bFNxFG5/4OogJanJ1ojXA9nJADM9
	Ow1cdQcx9a1c/41Nthvi+A1G7xdYpuHGLqGlz3caBFTC1aiCKWg0tJPl2D0rcA==
X-Google-Smtp-Source: AGHT+IFGcWHX5vCqXQ32/fcePpSmxTM2nndWl/lu4VRKWx2TC2uOWDn8t8KdPtLZDDkamBmOvyzOxg==
X-Received: by 2002:aa7:d958:0:b0:565:5924:9d8b with SMTP id l24-20020aa7d958000000b0056559249d8bmr8521051eds.35.1709111209179;
        Wed, 28 Feb 2024 01:06:49 -0800 (PST)
Message-ID: <1a00c221-ce1c-45be-9ab3-e8f1a0e5678d@suse.com>
Date: Wed, 28 Feb 2024 10:06:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH] automation/eclair: extend deviations of MISRA C:2012
 Rule 16.3
Content-Language: en-US
To: Federico Serafini <federico.serafini@bugseng.com>
Cc: consulting@bugseng.com, Simone Ballarin <simone.ballarin@bugseng.com>,
 Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <6c96f889ae3fbdf516f0edfe4a5fb207540b6862.1709109662.git.federico.serafini@bugseng.com>
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
In-Reply-To: <6c96f889ae3fbdf516f0edfe4a5fb207540b6862.1709109662.git.federico.serafini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 28.02.2024 09:53, Federico Serafini wrote:
> --- a/automation/eclair_analysis/ECLAIR/deviations.ecl
> +++ b/automation/eclair_analysis/ECLAIR/deviations.ecl

Comments below apply similarly to text added to this file.

> --- a/docs/misra/deviations.rst
> +++ b/docs/misra/deviations.rst
> @@ -291,7 +291,14 @@ Deviations related to MISRA C:2012 Rules:
>       - Project-wide deviation; tagged as `deliberate` for ECLAIR.
>  
>     * - R16.3
> -     - Switch clauses ending with continue, goto, return statements are safe.
> +     - Switch clauses ending with an unconditional flow control statement
> +       (i.e., continue, goto, or return) are safe.
> +     - Tagged as `safe` for ECLAIR.

With this edit (unmentioned in the description, btw) ...

> +   * - R16.3
> +     - Switch clauses ending with an if-else statement are safe if both
> +       branches consist of a flow control statement (i.e., continue, break,
> +       goto, return).

... why is it not also "ending with" here?

Also what about either situation ending with a call to a noreturn function?

> @@ -307,6 +314,16 @@ Deviations related to MISRA C:2012 Rules:
>       - Switch clauses ending with failure method \"BUG()\" are safe.
>       - Tagged as `safe` for ECLAIR.
>  
> +   * - R16.3
> +     - On X86, switch clauses ending generating an exception through
> +       \"generate_exception()\" are safe.
> +     - Tagged as `safe` for ECLAIR.

This macro is limited to the emulator, so shouldn't be deviated globally.
Furthermore - why does the special case need mentioning here? Shouldn't
it be the underlying pattern which is deviated (along the lines of the
earlier ones):

    if ( true )
    {
        ...
        goto ...; /* Or break / continue / return */
    }

> +   * - R16.3
> +     - Switch clauses ending generating a parse error through
> +       \"PARSE_ERR_RET()\" are safe.
> +     - Tagged as `safe` for ECLAIR.

Again this isn't a global scope macro, so shouldn't be deviated globally.
Plus it ends in "return", so ought to be covered by the earlier clause.
The fact that the return is in a body of do {} while(0) shouldn't matter
at all - that's purely syntactic sugar.

Jan

