Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C216DA9A154
	for <lists+xen-devel@lfdr.de>; Thu, 24 Apr 2025 08:16:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.965824.1356235 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7ps6-00039n-9g; Thu, 24 Apr 2025 06:15:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 965824.1356235; Thu, 24 Apr 2025 06:15:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7ps6-00037Z-6F; Thu, 24 Apr 2025 06:15:42 +0000
Received: by outflank-mailman (input) for mailman id 965824;
 Thu, 24 Apr 2025 06:15:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=IaUl=XK=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u7ps4-00037T-Kz
 for xen-devel@lists.xenproject.org; Thu, 24 Apr 2025 06:15:40 +0000
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8b512674-20d3-11f0-9eb1-5ba50f476ded;
 Thu, 24 Apr 2025 08:15:39 +0200 (CEST)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-39ee623fe64so537619f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 23 Apr 2025 23:15:39 -0700 (PDT)
Received: from ?IPV6:2003:ca:b734:b408:9d23:e5d:de25:e110?
 (p200300cab734b4089d230e5dde25e110.dip0.t-ipconnect.de.
 [2003:ca:b734:b408:9d23:e5d:de25:e110])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a06d4bc3d8sm951458f8f.33.2025.04.23.23.15.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Apr 2025 23:15:38 -0700 (PDT)
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
X-Inumbo-ID: 8b512674-20d3-11f0-9eb1-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1745475339; x=1746080139; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=sjT5q7bqjg7O0S4bE1vBzcQDjh6CoLXS329p8JLs2iM=;
        b=VGawodNIlg0vbhQ5aI94P8zE6TZ3nc/GbDPX0GdW/fC/XlEfzJDl/CJOxBJUS393Th
         B6zZ8GmMG/LE6o5ytGHOHsNCNiYK2etJbgv0nxrgntq8SkNjOitAkywSA1dNorR0ZFAC
         tPv+zguNK5N/5waUVVg0kGaVQiaaLuGx+9wIBO0r3MQjtMaxj0PhUWprSKcUQaOB+Urr
         bRVoIVmz0UfOGX+Ou6R1crge7f9rYuXqzBckRjR9FJvVObeCcSfj5FqxjM0ALEM05bKp
         Vb9H9AYbTMPJxD/g7+/jUFhFsobyC0GYUrPnxCFeyQQ3UXuTWCDCKhuifCF9icGnY06s
         8bog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745475339; x=1746080139;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sjT5q7bqjg7O0S4bE1vBzcQDjh6CoLXS329p8JLs2iM=;
        b=GTyEw1ig7JiBRMJJPR66ObWqzwP3CIBIckMp2zSyqroASxELeblPAKwt6365xhOWGN
         6vOOrpahf4kjPRF9hKOn7kcrBIX8DkZe+f6ElEGBusu4F9HwKiemGlORqJEDdabuu9p5
         SaS5i2HOVd5cHuQpo5PB69VeJmw9d8tWAa1ldNQF2Y2iH1cdNjOPa6421sJ8E0F8jC0m
         74LAhTnUsLKZdLTE8+CxRiIfDT7AKZKSbYPe7KkJLmAPdWEL6kBujeklEQcX1yoOE5sJ
         gd7LfKh2JDuZFE26lG5Un5Qp9xREdUMtp83ebnDBxO5TuVliaYAEYMeYubdDiKbWMCLO
         EM+A==
X-Forwarded-Encrypted: i=1; AJvYcCUi1T70IU/XEGcTS9sLvPUGMBcwfaoZEzatHF26UmdClZR7rz4UgS0ZkEOhOx2sdS+MmOXONPFU7NY=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw9t2dUsUR9Pxls2Ov5J7CsucVCa0TuQ8uEtLDUChBEEFr4xNbv
	cdobOmDaRvdQtgPcIMUWezjWdkffk1sMMNC0AKjz1XX5FqdLB6+bsUHivC3RiQ==
X-Gm-Gg: ASbGncus9GkK9Spejv4nM2jw78UJNJk0T5Vn6jAiEkpO/QwhP5OutMjA1+piPzQguaF
	qBcv1HnckyynEXU7QLNUzd4HLQIJixW3/omNbaLWnii/B+QvT+pU/mWdWb5LyRR3ZugsmjGIkwS
	fooX1caESVF2ZQihIuXhRFStyjIBcXWoHfPsaQBjOvMtmWeT5kIjM5iCXVTPag7mNmob1qAcU7v
	lafwLxl9j4WqGsjkUtj34dMiqmYMoltSuuCAND6xRHGtmLUE1hCIGNB5jHgAqOWfYKUo9L18Vuu
	gra4QQ/GxNsAGNe+yrCl5iKG+ZdonNjsMMRVbLq4HzGGR39VyPZ3lPqE+jCC/KkqsK11ULULp5D
	n9RnkMYw8mj551g5RNj+KLNVZ5P2puuJzTQVQ2RD9hOgk8kiDa5NWRasny6TQs9/glTSNMsRN
X-Google-Smtp-Source: AGHT+IGGi23COGmh58KBbvsDxIH1pgPmCb5zDstbfufb7xC1K1UMabgbpLXVnDty9087DoTrS2Plcw==
X-Received: by 2002:a05:6000:4201:b0:39c:268b:8b66 with SMTP id ffacd0b85a97d-3a06cfa5a70mr782081f8f.43.1745475339096;
        Wed, 23 Apr 2025 23:15:39 -0700 (PDT)
Message-ID: <f5d35582-9270-4816-84c2-f078afeee711@suse.com>
Date: Thu, 24 Apr 2025 08:15:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] misra: add deviation for rules 21.1 and 21.2
To: victorm.lira@amd.com, Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Federico Serafini <federico.serafini@bugseng.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>, xen-devel@lists.xenproject.org
References: <9e1210f2a9c794d68dcc6b897239b228b141296a.1745427770.git.victorm.lira@amd.com>
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
In-Reply-To: <9e1210f2a9c794d68dcc6b897239b228b141296a.1745427770.git.victorm.lira@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 23.04.2025 19:54, victorm.lira@amd.com wrote:
> From: Nicola Vetrini <nicola.vetrini@bugseng.com>
> 
> MISRA C Rules 21.1 ("#define and #undef shall not be used on a
> reserved identifier or reserved macro name") and R21.2 ("A reserved
> identifier or reserved macro name shall not be declared") violations
> are not problematic for Xen, as it does not use the C or POSIX
> libraries.
> 
> Xen uses -fno-builtin and -nostdinc to ensure this, but there are still
> __builtin_* functions from the compiler that are available so
> a deviation is formulated for all identifiers not starting with
> "__builtin_".
> 
> The missing text of a deviation for Rule 21.2 is added to
> docs/misra/deviations.rst.
> 
> To avoid regressions, tag both rules as clean and add them to the
> monitored set.
> 
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
> Signed-off-by: Victor Lira <victorm.lira@amd.com>

While the rule is in the library section, ...

> --- a/docs/misra/deviations.rst
> +++ b/docs/misra/deviations.rst
> @@ -587,7 +587,31 @@ Deviations related to MISRA C:2012 Rules:
>         construct is deviated only in Translation Units that present a violation
>         of the Rule due to uses of this macro.
>       - Tagged as `deliberate` for ECLAIR.
> -
> +
> +   * - R21.1
> +     - Rule 21.1 reports identifiers reserved for the C and POSIX standard
> +       libraries. Xen does not use such libraries and all translation units
> +       are compiled with option '-nostdinc', therefore there is no reason to
> +       avoid to use `#define` or `#undef` on such identifiers except for those
> +       beginning with `__builtin_` for which compilers may perform (wrong)
> +       optimizations.
> +     - Tagged as `safe` for ECLAIR.

... I'd like to ask that it be explicitly clarified here that it's solely
the library (and not e.g. the compiler itself) that are of concern here.
If so, I expect there's another rule dealing with the remaining concerns.
Then, however, I consider the rule wording insufficient (as leaving an
ambiguity).

Jan

