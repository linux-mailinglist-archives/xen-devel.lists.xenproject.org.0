Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 71678B9F8E3
	for <lists+xen-devel@lfdr.de>; Thu, 25 Sep 2025 15:26:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1130544.1470054 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v1lys-0004Dy-0d; Thu, 25 Sep 2025 13:25:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1130544.1470054; Thu, 25 Sep 2025 13:25:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v1lyr-0004BV-TO; Thu, 25 Sep 2025 13:25:53 +0000
Received: by outflank-mailman (input) for mailman id 1130544;
 Thu, 25 Sep 2025 13:25:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vOWa=4E=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1v1lyq-0004BP-3L
 for xen-devel@lists.xenproject.org; Thu, 25 Sep 2025 13:25:52 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 27928e26-9a13-11f0-9d14-b5c5bf9af7f9;
 Thu, 25 Sep 2025 15:25:50 +0200 (CEST)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-b28e1b87aa7so150259266b.3
 for <xen-devel@lists.xenproject.org>; Thu, 25 Sep 2025 06:25:50 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b35446f5c36sm167579166b.54.2025.09.25.06.25.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Sep 2025 06:25:48 -0700 (PDT)
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
X-Inumbo-ID: 27928e26-9a13-11f0-9d14-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1758806750; x=1759411550; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=3zygVjSJt3HOEAYXtJDeUJse47jyPQumbp70tWWPRFg=;
        b=TL6qp9LKh50r5gFlTwaI9/fuQd4xOx1prTbvGvDlfDWmVrL6jWACRGE38TmY5FKDLX
         wZz6/MHm8d49HUVJZVYnuVo17NB96kpM7uR7DE07IEBnHY2A1V0BTnX6ivNf+vBFe9jX
         t3QXdWYl1B1ufE9MRoVun+1OPr7Tf4gIIWfDoB8t8vdUw8oLo77190TcSiiu4QgBRmlf
         IhJ20f5hskYsWAFvaCGuvpcZnVmefpkxeSHiThgXsCYpoaCimod+zmNqZRc/YC13iCLU
         XV4SUZmkyALBQuGOgJU7VvxLae9c5IpGiQSVPML6ESE9n4mVSpn5qsx+/SxqDkzguTy6
         kf3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758806750; x=1759411550;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3zygVjSJt3HOEAYXtJDeUJse47jyPQumbp70tWWPRFg=;
        b=gH44AwDx3bF/ruKbDsvkrVr67d+grU9svlgE2yvGREKIG1nbt6Wl60gGWjlRfL0pWq
         PNlkrDPFr4kL//BJmtv4KeXyeTqoUrbazXX+XvsxPbK0gLfhUQ9UaKstHn1ymRLfR6H+
         ErXWtDUq+K1uNOOTc+2yYJJIcV9AdMkj2i2/iMFNODAaDu8MMkQPjWntMVzJ22s3WssD
         Hlreq2sggwmWEIDsuzvtqw+Y5eJAeytCK6uWtWST/mgArxbSp+9tAs4r4px9XA0YlR6g
         b8uS30hgom5QscJlEZLVHUkgJA7mTHxPhcMYhev4JbUmwe/KM/NhYeQFMSqSPGpSx/Ao
         qUqQ==
X-Forwarded-Encrypted: i=1; AJvYcCX9zRb4ceb0CkbtbSbNhXjZPg0YSxgKXQ/+S9nylzzSgZ+kr6DeqvCtQRb5Kepd5b+M0jKIBOkorzY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzUmNEmrjEZ0KJFRnxyue8VJPz8pgNYVkH3oZ9PnaSy3MuRtKB0
	1cnQywtdHVHXvNIlFQsSEzSUU2oRBkp2v1MCE7DyB3XbwNxZajYOPkg6rHs1nn4SiA==
X-Gm-Gg: ASbGncutTbxUFamge6gGJPVDqAKQ4w9Krsil5SJVwgCWehrLaotwYs+61cfJyaDapqL
	7VG7sZeuY+Vbc8wtgQYwIVkin5yavXRDDmxP1JawN335BcCuo+8nilRWRQjduZwvWP4hNngNRt6
	f31HQz1oMxZmhGV+zd3Avj8Ej0PI0QkFJShvyKwHzVyDAm5HsJdY0HZVSmoFZogAGAq4vV1QNLk
	x/kCV+nS0o1LyFj8EjcMgKGZnj8YVevtnJGzhJR94vPiHk/jAs3p/xJyXdYsNtd3FyzTPAfJbGx
	V8nPfAQR8nmDq+50rePcAEjwp2Q4CVIanRjqKwJ8ydDCR/OHWpc6C7Ltan3R+6IzRqtw5OeWYY7
	kOKWwVMOBf7hUlRuqMM4R+VIhM2NT6l3OIaqB2eW/fpYpmNB0vUpvcMFC0JOdvCVK0Pmc9FaeXo
	kcfOFFHkg=
X-Google-Smtp-Source: AGHT+IEnZy9Q6X/ohu3rhj6rh9y7O7A48Oq9+lMskewJV+pvFypwFZ7KDvQ3BNd9LsmjJeCQ10CXxQ==
X-Received: by 2002:a17:907:7e93:b0:b33:a7d6:8b58 with SMTP id a640c23a62f3a-b34baa348f3mr407296466b.16.1758806748690;
        Thu, 25 Sep 2025 06:25:48 -0700 (PDT)
Message-ID: <ae0ecbfc-cee0-4035-ba03-e9f9ba2661e4@suse.com>
Date: Thu, 25 Sep 2025 15:25:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] misra: consider conversion from UL or (void*) to
 function pointer as safe
To: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
Cc: Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <b0f269822312a442e87ab02c8deff028b6b040a9.1758787340.git.dmytro_prokopchuk1@epam.com>
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
In-Reply-To: <b0f269822312a442e87ab02c8deff028b6b040a9.1758787340.git.dmytro_prokopchuk1@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 25.09.2025 10:04, Dmytro Prokopchuk1 wrote:
> --- a/docs/misra/deviations.rst
> +++ b/docs/misra/deviations.rst
> @@ -366,11 +366,22 @@ Deviations related to MISRA C:2012 Rules:
>       - Tagged as `safe` for ECLAIR.
>  
>     * - R11.1
> -     - The conversion from a function pointer to unsigned long or (void \*) does
> +     - The conversion from a function pointer to unsigned long or '(void *)' does
>         not lose any information, provided that the target type has enough bits
>         to store it.
>       - Tagged as `safe` for ECLAIR.
>  
> +   * - R11.1
> +     - The conversion from unsigned long or '(void *)' to a function pointer is
> +       safe because it relies on both ABI definitions and compiler implementations
> +       supported by Xen which define consistent and compatible representations
> +       (i.e., having the same size and memory layout) for '(void *)', unsigned
> +       long, and function pointers, enabling safe conversions between these types
> +       without data loss or corruption. The compile-time assertions (BUILD_BUG_ON
> +       macro) is integrated into 'xen/common/version.c' to confirm conversions
> +       compatibility across all target platforms.

As you use (and mean) plural, s/is/are/ ? I also think the "The" at the start
of the sentence wants dropping.

Further, why this very dissimilar wording compared to what's said about
conversions _from_ function pointer types?

And then ...

> --- a/xen/common/version.c
> +++ b/xen/common/version.c
> @@ -217,6 +217,17 @@ void __init xen_build_init(void)
>  #endif /* CONFIG_X86 */
>  }
>  #endif /* BUILD_ID */
> +
> +static void __init __maybe_unused build_assertions(void)
> +{
> +    /*
> +     * To confirm conversion compatibility between unsigned long, (void *)
> +     * and function pointers for all supported architectures.
> +     */
> +    BUILD_BUG_ON(sizeof(unsigned long) != sizeof(void (*)(void)));
> +    BUILD_BUG_ON(sizeof(void *) != sizeof(void (*)(void)));
> +}

... I'm unconvinced checking merely the sizes is sufficient. On architectures
involving function descriptors (e.g. ia64) converting in this direction is
safe only if earlier on the value was obtained as the result of a conversion
in the opposite direction (and all of this within a single component, which
of course is guaranteed for Xen).

Jan

