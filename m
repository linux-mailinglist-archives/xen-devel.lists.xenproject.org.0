Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 117B5A37CA6
	for <lists+xen-devel@lfdr.de>; Mon, 17 Feb 2025 09:01:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.889775.1298818 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tjw4Q-000411-I8; Mon, 17 Feb 2025 08:01:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 889775.1298818; Mon, 17 Feb 2025 08:01:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tjw4Q-0003yi-FH; Mon, 17 Feb 2025 08:01:38 +0000
Received: by outflank-mailman (input) for mailman id 889775;
 Mon, 17 Feb 2025 08:01:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=o9S/=VI=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tjw4P-0003yB-0X
 for xen-devel@lists.xenproject.org; Mon, 17 Feb 2025 08:01:37 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 680f0e78-ed05-11ef-9896-31a8f345e629;
 Mon, 17 Feb 2025 09:01:35 +0100 (CET)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-aaee2c5ee6eso627137966b.1
 for <xen-devel@lists.xenproject.org>; Mon, 17 Feb 2025 00:01:34 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-abb4d3ef3c0sm499040866b.41.2025.02.17.00.01.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Feb 2025 00:01:34 -0800 (PST)
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
X-Inumbo-ID: 680f0e78-ed05-11ef-9896-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1739779294; x=1740384094; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=TXqkrsf2vEkpxJmMI1/U1j3ju4Vj7fD+V1swLMcZRwg=;
        b=c72o5q/UVVgYwSYQ9OTp/tyklFhYsFApPBia4gVhxpWpfmO3rkCBn0rNO08woyPV/U
         mvKLroUI6DNACmi7snX8SmG805pyrAuyCNYfuAGvrzTFRv84T9eze6RJbZXjs3GAh7fT
         Z+6FZXpyUzwzp10IRZ/5ZlkTod7NOx1LNc/aBUbOofeHLlOjBHDsbwFpFHwgW1J4HlvU
         YIZpCysI4AK5ApPCeOqU/0qWYGLjvtZP+Ryxdz5bi3F82bWHiqd4SFrM09ZVlPxoC63e
         LdPfblW0Uw3jGUb9DE2wUcpdFsZ9nHtiO1lgl6DccLJTQpK1veNx/yWgO3o/uA8lKxcZ
         Bqog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739779294; x=1740384094;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TXqkrsf2vEkpxJmMI1/U1j3ju4Vj7fD+V1swLMcZRwg=;
        b=aUbvbBSyOZzepTlSnwHFFu4eQQfQpZyY9F2DQh9qY/OKSorBzk7lwwgzNQivys2sON
         +ZEA0pn/tgYQyhBWlk/piZv/JlWTv5iXXc9saboHUNNWJ9mnvuujvojF97Im+ywonAxe
         Tf0XmEYDEEMXxw7onJXDuP2/gtSJ0uQRj4Rg8sFBlMpCENsTGZ1gxZqWHw0JKDQy480o
         +roWA42bJGwUzoeo29+LUjLEQOJK/jWLT6ZyE35GYqMrwEmxfY5sPqNRpRrRFzqyUbZ+
         vKjoKqX8kU9pb4CFc4v1CdYEGTz3yZr8iPi3PVspgdO+pMAb1YIZP2a4kjLE9Go7ED7d
         /RRw==
X-Forwarded-Encrypted: i=1; AJvYcCVIuojPx8ai5e3yvOR7FvLrVokEfD5TK6BjPg6IB7+WAcXFa8FGKAMTRtyCeEvv24ph49Eu9+DWbwM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YznIcMCTJMi/8YYkwPoOVBakgDkrfneM5MYrS42rhkORdubXWe/
	cbw2St02p1R7sxCIurfc+g2QYmHPGcAUoix3QlgabYelLRcMYHy96l7UyCrmkA==
X-Gm-Gg: ASbGnctSoI7Rp4Sfp+4tr3SPDsgW68ip09DEsIrsd0m2ULt8vXHjKtfJwx/ebJIEEDL
	OcLeJoRNybEGc931JwFK++qBki3ee1+VX4op3QowCIsHderNcevnGDkqSB2RrALrYoiG2FQycLM
	AfhizDFxTldJL9e7EXWiTgR3T15gxVW4DpHsX5OjV4N7KiTA2HAxXr+gdDxriDF5WCLVfRvCk3R
	Iur/h74b9obLweCn1SD2TwQRG+1ET9XM78DtED4k/YD+cjv3qk1j6f7xP1pEpwuPEusA5HPJqyd
	WMXk4L4ESBP1R0mSu3YeOVZd1DEzjoXWEOJura1Sp5HaoWtqVxGEioeXPws4rGtJRs+GvRu9MPk
	R
X-Google-Smtp-Source: AGHT+IHqxu6tbQ2J/pTR3j20sIyLsbkxxqXQEO+nE/45qJyqvnoZutgvGhjm1trwINshWMIxzz8fog==
X-Received: by 2002:a17:907:6d08:b0:ab7:d87f:6662 with SMTP id a640c23a62f3a-abb70e421cbmr832488366b.52.1739779294402;
        Mon, 17 Feb 2025 00:01:34 -0800 (PST)
Message-ID: <98f7e1a6-4684-43df-8ce1-0f5f6ef866f7@suse.com>
Date: Mon, 17 Feb 2025 09:01:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] xen/console: print Xen version via keyhandler
To: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, julien@xen.org,
 michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org,
 dmukhin@ford.com, xen-devel@lists.xenproject.org
References: <20250214193615.1812503-1-dmukhin@ford.com>
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
In-Reply-To: <20250214193615.1812503-1-dmukhin@ford.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14.02.2025 21:05, dmkhn@proton.me wrote:
> --- a/xen/common/version.c
> +++ b/xen/common/version.c
> @@ -210,9 +210,28 @@ void __init xen_build_init(void)
>          }
>      }
>  #endif /* CONFIG_X86 */
> -    if ( !rc )
> -        printk(XENLOG_INFO "build-id: %*phN\n", build_id_len, build_id_p);
>  }
> +
> +void print_version(void)
> +{
> +    printk("Xen version %d.%d%s (%s@%s) (%s) %s %s\n",
> +           xen_major_version(), xen_minor_version(), xen_extra_version(),
> +           xen_compile_by(), xen_compile_domain(), xen_compiler(),
> +           xen_build_info(), xen_compile_date());
> +
> +    printk("Latest ChangeSet: %s\n", xen_changeset());
> +}
> +
> +void print_build_id(void)
> +{
> +    /*
> +     * NB: build_id_p may be NULL if XEN_HAS_BUILD_ID=n.
> +     * Do not print empty build-id.
> +     */
> +    if ( build_id_p )
> +        printk("build-id: %*phN\n", build_id_len, build_id_p);
> +}

In my reply to v3 I specifically suggested to use build_id_len in the if().
Why did you choose to use build_id_p instead? Yes, if all works correctly
both should be (non-)zero/NULL at the same time, but please also consider
the case of things not working correctly. When len is zero, there's nothing
there, no matter what the pointer. When len is non-zero and the pointer is
NULL, it would be quite nice to have a trace thereof in the log.

Preferably with the adjustment (which I'd be happy to make while committing)
Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan

