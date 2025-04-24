Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E74A4A9A178
	for <lists+xen-devel@lfdr.de>; Thu, 24 Apr 2025 08:19:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.965835.1356245 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7pvE-0003kW-Of; Thu, 24 Apr 2025 06:18:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 965835.1356245; Thu, 24 Apr 2025 06:18:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7pvE-0003hV-Lq; Thu, 24 Apr 2025 06:18:56 +0000
Received: by outflank-mailman (input) for mailman id 965835;
 Thu, 24 Apr 2025 06:18:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=IaUl=XK=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u7pvD-0003hP-PB
 for xen-devel@lists.xenproject.org; Thu, 24 Apr 2025 06:18:55 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ff809a97-20d3-11f0-9eb1-5ba50f476ded;
 Thu, 24 Apr 2025 08:18:54 +0200 (CEST)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-39ac9aea656so731438f8f.3
 for <xen-devel@lists.xenproject.org>; Wed, 23 Apr 2025 23:18:54 -0700 (PDT)
Received: from ?IPV6:2003:ca:b734:b408:9d23:e5d:de25:e110?
 (p200300cab734b4089d230e5dde25e110.dip0.t-ipconnect.de.
 [2003:ca:b734:b408:9d23:e5d:de25:e110])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4409d2a35f0sm7164515e9.15.2025.04.23.23.18.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Apr 2025 23:18:53 -0700 (PDT)
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
X-Inumbo-ID: ff809a97-20d3-11f0-9eb1-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1745475534; x=1746080334; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=0xpX0cMUyLAPCpNvd9WcehRSs8l4r8ukiuxwyPaApb0=;
        b=IcJF+13b0rNBswOvUUVKbLzZV3cj8v76N380w20kN7d/JZ378sX01kh3eRPHVbOkwb
         4+BqUmw3laMa5g2Z5VGjtvgn1wUluUtaXrcZEV3e9wQoIwPFMo3+kv+kOfrQ6EQxzfTQ
         atVpTpI6aCzCIDVKzaT1e9cc4IjbrrGX7W9qI4lctizkpU+SV3H7sTzC3AlpI18tb59l
         gk1ziNTBqNG5K+PwfVpNYyjwt/uf3JCgdOdu8aLWNGd7Kf2oMJYdYRa1sZkb0OsAUNPM
         L9lSTBok4A3XvuGKYIabG9k9ZOhANjyAnESkGgFGQpFbfsrGUZ79j5ci22NZ+XvSFUg6
         +trA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745475534; x=1746080334;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0xpX0cMUyLAPCpNvd9WcehRSs8l4r8ukiuxwyPaApb0=;
        b=lVTiu8rLo3ezIXK18EtLIFlhSzT4d+tNNtEPZVDZM0+fYqnO+gWkVK80JWmYMvbTYA
         Y1mJgusRyZeJRlra6qX5ROCloUUdnJrHW6K/qUfjkf1qUuCJPGmv/hsoCG0fHlxRF/n/
         /ajEgI1Is1w5IEFEdjlhNPZERwPxCSvON7PPtC4+LtC42k9i+QRecorxM1Ii1pR3ApH9
         Nih9cibEywd7CjuT5kVm5ODBa/KygcVJxtuz+ghLYITW6emqdIx1ynUAejenJUfQQlSA
         m+Ukw4Rkw0OZvVgdEp3BrGUP5o1bcBvhW7TMJZwahHa7Z8mRAw3cOCV8mYJSpzdFnSWb
         GdQA==
X-Forwarded-Encrypted: i=1; AJvYcCWBJLi3aWJ8Cea8Ka1TAh964WaTfY1Ueu38/xFu/dJwUSpGIZh71O0nbb8qtcRnwRsuxRy15+MJHag=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw36J23bwwMK1C21FpIEMGXRbC9r7JD1plh+wM6WbrakWxNDggq
	sVqIDoCx+TeJcO5YWD3ISniLvsa7txwHODm4O7aRE4Le5rMzXn9xjFTA0Y3Nvw==
X-Gm-Gg: ASbGncvPzEm/tKujAL+LywIebyrfMbGEwVOPGJu83K8LB5GnaQzpPe1kggKx9Vfxujg
	Qi6UJZ4qNAGLN1Tqs46gl9ye+QNeqbJnVykywyTemt3pYe9PhrkhdDhQ0NYuL08oVTh+qGWfXrB
	l5AEuq9DhbbQjugpyi/boM8CsTJcOQiNv33HUlaMLxTlWhYOLu/wQekKg37hTsRaYy+5FOQGD39
	m8qsvoPfGSWlwS0v4ZXQNweTQzUXezgUgyknKkZzaqknHM9Y+hxDyAyUGveG1iB+olsual9vZ8o
	IX4VZQkKbOKcwT4Shq8cjqqz+ErCAu8PsaBsDHlMXjjhVjjFg2DXmWVcHxSM4Em4RdOENQN86kE
	0Y3tCgWQkt/UGkpUUvaGWz1cueb/b3lUqPcaU3kewPGSB+ez47o5SKG1oSOjecjFgKwFIJnYhHx
	+4HDh644I=
X-Google-Smtp-Source: AGHT+IGIP4sCkBDkzCvn7skUkrHV0kNsI7HIFkRx6Iph43dmLCbwWv5DjMV/+rhZm8UpxDRjJ7oFdA==
X-Received: by 2002:a05:6000:1ac9:b0:39c:268e:ae04 with SMTP id ffacd0b85a97d-3a06cecb311mr797596f8f.0.1745475534151;
        Wed, 23 Apr 2025 23:18:54 -0700 (PDT)
Message-ID: <fc4bb04a-8d6d-4744-9be3-399aea5081e2@suse.com>
Date: Thu, 24 Apr 2025 08:18:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/vpci: Fix msix existing mapping printk
To: Jason Andryuk <jason.andryuk@amd.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20250423212229.32721-1-jason.andryuk@amd.com>
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
In-Reply-To: <20250423212229.32721-1-jason.andryuk@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 23.04.2025 23:22, Jason Andryuk wrote:
> --- a/xen/drivers/vpci/msix.c
> +++ b/xen/drivers/vpci/msix.c
> @@ -666,7 +666,7 @@ int vpci_make_msix_hole(const struct pci_dev *pdev)
>                  put_gfn(d, start);
>                  gprintk(XENLOG_WARNING,
>                          "%pp: existing mapping (mfn: %" PRI_mfn
> -                        "type: %d) at %#lx clobbers MSIX MMIO area\n",
> +                        " type: %d) at %#lx clobbers MSIX MMIO area\n",

Imo this is a good indication that the format string better wouldn't be
extending across multiple lines. Then it would also be possible to grep
for it (in the sources) using e.g. "existing mapping .* clobbers".

Jan

