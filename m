Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D78AFAEE32D
	for <lists+xen-devel@lfdr.de>; Mon, 30 Jun 2025 17:59:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1029246.1403024 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWGut-0008Iy-3C; Mon, 30 Jun 2025 15:59:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1029246.1403024; Mon, 30 Jun 2025 15:59:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWGus-0008H6-Vg; Mon, 30 Jun 2025 15:59:34 +0000
Received: by outflank-mailman (input) for mailman id 1029246;
 Mon, 30 Jun 2025 15:59:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=erj2=ZN=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uWGus-0008H0-7U
 for xen-devel@lists.xenproject.org; Mon, 30 Jun 2025 15:59:34 +0000
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [2a00:1450:4864:20::42a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 36851e82-55cb-11f0-a312-13f23c93f187;
 Mon, 30 Jun 2025 17:59:33 +0200 (CEST)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-3a6f2c6715fso2534786f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 30 Jun 2025 08:59:33 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-74af557460fsm9980405b3a.93.2025.06.30.08.59.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Jun 2025 08:59:31 -0700 (PDT)
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
X-Inumbo-ID: 36851e82-55cb-11f0-a312-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1751299172; x=1751903972; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=7ZffqJRME8x4UkcvSMYkkB4E+0MQZzh9SBrRhhrlkeM=;
        b=D9c2w/RlzUzy3E+4DnbQK8Byx9a/TvxGdrOjjRTJO330tdlMtr5un4hFzCagHx81Ai
         apw5D/FyLLxE0sMP/LjC1i8jAG/dEwZ5C2D4AKeJAtpLgGO6qibPA2CWLa/cz0E09hom
         skujzWKvUMhdmozXsDOHb1levPl0qO0J4xDQMOU5//DYOwznaaztYZ8yuO5remJGugCP
         Xdx8WMOCM1IdDvn1FxLmVNIWwsNEzlC3CuLCw/nMilOtuqY74GuI0n9FuDzXzgGpVxZh
         mAW1DbGSCv+na8JYRMloHWA0j1QD2E1nRhGh9dXDrIy0CmOx37JuRPbyTcLqTSKoIQFL
         qAIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751299172; x=1751903972;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7ZffqJRME8x4UkcvSMYkkB4E+0MQZzh9SBrRhhrlkeM=;
        b=t3uy3NCFH3PuaRvj2HG5p98poF/HU23xG7Yb0xeqP8QEcjdBY17POj3eMTTBmWrDHV
         uThK+VTLJWL9awGqTyDVIiuov5n0Ggh/qVmnG/LeS0O+7C1l1QHONa77Srq3lXgalicm
         xIalkYiThy6/cULwIiHzek5KH4R3w53m7GD5TXxJs5FOMudSDqD5axKNYYvsX75l36vu
         Tw+etNQe+UHqwe+ydfdRR/5XnSJIeR1E4Nof2fe+mydYf8HP1FKXp71uC8L/Y1Bugv87
         YJoml6x3qJ9H6M0yE4AgooBNQ856qF61AYZeVJ53oDEZ2uhq7poAEeXbtdqUXe6F0vzw
         lA5g==
X-Forwarded-Encrypted: i=1; AJvYcCW1ZIV3wzum5CAgJ/x7x3+WLbG8+0GElrMFjlsrGiivsPG/M5UMlU64oBbQVZIUmLPtt7VnJiK7NfI=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx1Ub1bjqm+dJePFL+rJomCIaHZKtox+yh4i1hYJxIC996VAxVI
	wvh6d2dU4Myf1Bf08UrPmFCHdliLWrbhFuL/6tX4MYwDl8SHTx+7pYSXD7vHkEp3BQ==
X-Gm-Gg: ASbGncsCPQgXdo/117LRjH+nXlHf49s+lrsa7limPeHwQFI+JYzcKZODyszgRbe0htE
	0tL65tJ5hjCUo+SKVZd8DQQuw3U80ky/8FUHwYGGImemiKygQtZlhXe5SqQ2yijC6pjeGb5dygR
	HRNqsTQhIbEwCi2n0olMQOM+q2an5XGnpRXD8qx+p64kXkKHAxltHBJ3IRRlXCUa0a/IrIy/OjO
	JdtT3CCDJICdLUbLc12uI2+Z7HizVlY8Ggk1ah0/naxv4l7yY7Khu6Rk9ngPn03WnEBPA/k/6i4
	WpNnqqgw/b44RQbkN1pOVe6AgX/8cUxaie9b18auqYYnfaavhTwt6ig4LIFlf2KCo43DUXdlpQz
	H2Bpog/UuH5xi6sDD5pIMmUJpAxAPZHV8XG8PkI+qVeQ+CTw=
X-Google-Smtp-Source: AGHT+IG5ucJoKG1vBGA+waDwFYrmJxnAuc+PmtW9uHGIahqq9pYnUWtAtMeHQcURj4SUVuWbMv9Gsg==
X-Received: by 2002:adf:9d91:0:b0:3a6:da76:38b0 with SMTP id ffacd0b85a97d-3a8f50cb692mr9963875f8f.25.1751299172491;
        Mon, 30 Jun 2025 08:59:32 -0700 (PDT)
Message-ID: <f1e26c40-c70d-4d86-96ec-7643a9d08e76@suse.com>
Date: Mon, 30 Jun 2025 17:59:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 10/17] xen/riscv: implement guest_physmap_add_entry()
 for mapping GFNs to MFNs
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1749555949.git.oleksii.kurochko@gmail.com>
 <0b1f7ead7eb1b7c8687d388cca50b46eefb8e408.1749555949.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <0b1f7ead7eb1b7c8687d388cca50b46eefb8e408.1749555949.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10.06.2025 15:05, Oleksii Kurochko wrote:
> --- a/xen/arch/riscv/p2m.c
> +++ b/xen/arch/riscv/p2m.c
> @@ -324,3 +324,44 @@ int p2m_set_allocation(struct domain *d, unsigned long pages, bool *preempted)
>  
>      return 0;
>  }
> +
> +static int p2m_set_entry(struct p2m_domain *p2m,
> +                         gfn_t sgfn,
> +                         unsigned long nr,
> +                         mfn_t smfn,
> +                         p2m_type_t t,
> +                         p2m_access_t a)
> +{
> +    return -EOPNOTSUPP;
> +}
> +
> +static int p2m_insert_mapping(struct domain *d, gfn_t start_gfn,

This likely again wants to be struct p2m_domain *.

> +                              unsigned long nr, mfn_t mfn, p2m_type_t t)
> +{
> +    struct p2m_domain *p2m = p2m_get_hostp2m(d);
> +    int rc;
> +
> +    p2m_write_lock(p2m);
> +    rc = p2m_set_entry(p2m, start_gfn, nr, mfn, t, p2m->default_access);
> +    p2m_write_unlock(p2m);
> +
> +    return rc;
> +}
> +
> +int map_regions_p2mt(struct domain *d,
> +                     gfn_t gfn,
> +                     unsigned long nr,
> +                     mfn_t mfn,
> +                     p2m_type_t p2mt)
> +{
> +    return p2m_insert_mapping(d, gfn, nr, mfn, p2mt);
> +}

What is this function doing here? The description says "for generic mapping
purposes", which really may mean anything. Plus, if and when you need it, it
wants to come with a name that fits with e.g. ...

> +int guest_physmap_add_entry(struct domain *d,
> +                            gfn_t gfn,
> +                            mfn_t mfn,
> +                            unsigned long page_order,
> +                            p2m_type_t t)

... this one, to understand their relationship / difference.

> +{
> +    return p2m_insert_mapping(d, gfn, (1 << page_order), mfn, t);

1UL please, while at the same time the parentheses could be omitted.

Jan

