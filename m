Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DFDA393EF3F
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jul 2024 09:59:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.766349.1176843 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYLHO-0007mG-0l; Mon, 29 Jul 2024 07:58:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 766349.1176843; Mon, 29 Jul 2024 07:58:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYLHN-0007j6-UG; Mon, 29 Jul 2024 07:58:49 +0000
Received: by outflank-mailman (input) for mailman id 766349;
 Mon, 29 Jul 2024 07:58:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XCGL=O5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sYLHN-0007j0-67
 for xen-devel@lists.xenproject.org; Mon, 29 Jul 2024 07:58:49 +0000
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [2a00:1450:4864:20::52c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 624e315f-4d80-11ef-8776-851b0ebba9a2;
 Mon, 29 Jul 2024 09:58:47 +0200 (CEST)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-5af326eddb2so4295321a12.1
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jul 2024 00:58:47 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5ac63b59bfesm5384919a12.44.2024.07.29.00.58.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Jul 2024 00:58:46 -0700 (PDT)
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
X-Inumbo-ID: 624e315f-4d80-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1722239927; x=1722844727; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=JTA9nN1j9WD+sbsfEZj27INEmgj7ty4D+VYolvmYf9U=;
        b=IVEaYJo9Mh8HX/9ewPtzCXzp57Cda4prfNe+jZSbpHOFSRTcCnOrIn9zUyu/ifC19u
         DnO94EzexL+8ES9niAKLEH7hikUqcUHzC4D+nDIHmhB2WiHvI0JVr9E1FrWoDgCBrOWX
         AR7twli9TMmFodkbA9ngd0LAzw5qMinKuPlswu0A1nDA5qrtRSsPTvwkmc3GnLVI+QAe
         LgvFyJmSj0E46DXiB8H7v0Nh6iYtg82nSgU+g7DSNP/RMbeG3UuAALOKIlTwqSVG/9B2
         XeWk50PxEDv6/mQ5vf8ZJTnBMkEhCjcjl6XoO6MwMYNdS6loV1QtnvKbudofnhTxopnc
         a4eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722239927; x=1722844727;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JTA9nN1j9WD+sbsfEZj27INEmgj7ty4D+VYolvmYf9U=;
        b=cUCMb9z+AS3x9uvBMrO7wWSu3/uFwE7P9SJ3Rz25RDvG1l0QpNodBmkNyliz6qY+sQ
         n73iRchFh4kN+PMj1X84KNRGw8QiLMuqUumxncdgOTEotRSURIgCuW2M2w9PUWPjGYI/
         i0FKKSG51g1Ekg8n4DF2N0DG1CUHvIi2s8ZxCee68XZG6LDvpcJSeoOZuEmNDdIhhgrb
         Qm05NBnqaoKqMmMxcWDoVaShRpJvyhZXXUK+5ddJpjh9fWi2hRdTD/ierlam0xowx1yD
         X37O25eY596UQp+BFj4BzCPSGUrMqjQ9vCCevR9IGsjCm7pNx9QjHT2iDNuF12QSFj88
         mUbg==
X-Forwarded-Encrypted: i=1; AJvYcCWAAApjHm9rKsO8uiCkWUMcBLMP8WpqNkO0xMrIq3oFQTma6Ub2G/lqY8mSuHlixBzKAeRdM3W+2Mgf4sr32d8hJEkOCcEccjhgfpOz4Wc=
X-Gm-Message-State: AOJu0YxIfw8JuT+MIKD7NI88KH2WS5bFR2fku1YWui83THLkDivhLlU9
	JE8u0bMnV6M3jPrYUiM7Uv0H1Lrh2Pa4O+OauFOfiEKmaUB/8fBD7gsMZmju6g==
X-Google-Smtp-Source: AGHT+IERqENyqgn6XPQzpAOBc6W+v3CLD9Lg1EYq+cSfTpHRMOssb05vgJVLJgDg6Xl1V4Lyxus9dw==
X-Received: by 2002:a50:d75e:0:b0:5af:d7a9:63d7 with SMTP id 4fb4d7f45d1cf-5b0173a0c65mr6227818a12.6.1722239926595;
        Mon, 29 Jul 2024 00:58:46 -0700 (PDT)
Message-ID: <1491a5c3-bb30-4804-95d6-31946ee1588d@suse.com>
Date: Mon, 29 Jul 2024 09:58:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v4] tools/lsevtchn: Use errno macro to handle
 hypercall error cases
To: Matthew Barnes <matthew.barnes@cloud.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <cce46da98274f84a3cea16d0e1e34b56d4d09410.1722011581.git.matthew.barnes@cloud.com>
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
In-Reply-To: <cce46da98274f84a3cea16d0e1e34b56d4d09410.1722011581.git.matthew.barnes@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26.07.2024 18:40, Matthew Barnes wrote:
> @@ -24,7 +25,23 @@ int main(int argc, char **argv)
>          status.port = port;
>          rc = xc_evtchn_status(xch, &status);
>          if ( rc < 0 )
> -            break;
> +        {
> +            switch ( errno ) {
> +                case EACCES: continue; /* Xen-owned evtchn */
> +                case EINVAL: /* Port enumeration has ended */
> +                    rc = 0;
> +                    goto out;
> +
> +                case ESRCH:
> +                    perror("Domain ID does not correspond to valid domain");
> +                    rc = ESRCH;
> +                    goto out;
> +                default:
> +                    perror(NULL);
> +                    rc = errno;
> +                    goto out;
> +            }
> +        }

There are a number of style violations here: Opening figure brace
placement, indentation of the case labels, placement of the
"continue", lack of blank lines between non-fall-through case blocks.
Also why three "goto out" when one would do?

Jan

