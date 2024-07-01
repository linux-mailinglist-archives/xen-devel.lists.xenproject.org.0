Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 58F7D91DA19
	for <lists+xen-devel@lfdr.de>; Mon,  1 Jul 2024 10:37:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.751360.1159289 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sOCX6-0001ZB-H6; Mon, 01 Jul 2024 08:37:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 751360.1159289; Mon, 01 Jul 2024 08:37:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sOCX6-0001Xd-EG; Mon, 01 Jul 2024 08:37:08 +0000
Received: by outflank-mailman (input) for mailman id 751360;
 Mon, 01 Jul 2024 08:37:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kQX2=OB=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sOCX4-0001XX-U8
 for xen-devel@lists.xenproject.org; Mon, 01 Jul 2024 08:37:06 +0000
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [2a00:1450:4864:20::234])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 18ad9a18-3785-11ef-90a4-e314d9c70b13;
 Mon, 01 Jul 2024 10:37:06 +0200 (CEST)
Received: by mail-lj1-x234.google.com with SMTP id
 38308e7fff4ca-2ec10324791so29954291fa.1
 for <xen-devel@lists.xenproject.org>; Mon, 01 Jul 2024 01:37:06 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1fac10d1b56sm58838335ad.41.2024.07.01.01.37.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Jul 2024 01:37:04 -0700 (PDT)
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
X-Inumbo-ID: 18ad9a18-3785-11ef-90a4-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1719823025; x=1720427825; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=rqmjRYPX55NC1VdfXv+gSUiQiNh1rFhMeD27+CCOB7U=;
        b=G4hdG1KdazuFWK+JiGC8hlHDKVKkVEOhQAxgPKBFjYb9jrwxCt1Dj7ijPDNxyKlnBK
         o1SL6fO45eLyyvEfKVcbRCNF0a88EktFKR+VfEZXOoozm7ezhNGUoOgbHUpjIkqcKADm
         2tggxEsBJO9kY94Q7OQd9VqZ9XRjIDgMWpWkwWpXthX2n8CLenJ0NC5Ssmgr2FmJdgiK
         Dah/WYls5D4MjoKdQVBhzgOLp/RoUKG1Ma8Ejl3aJasawV+UNXQB1HmwPUmgjvdC55bn
         lelDcudu4YELwO+yKOW+eRS7cfDC9JUhgJepTmulfLe8ERe/nqdYJmnKDjoUGJ17oDD2
         jsew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719823025; x=1720427825;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rqmjRYPX55NC1VdfXv+gSUiQiNh1rFhMeD27+CCOB7U=;
        b=NuOQsoycLBqzx7J5RNDdoxOt8nBoqnxKs2UpIIUiZCYqlQmWeFEWkl2y1js/IEv8jx
         eMesfzh0JHyqM6ar/752XJmXYXm9k1AAq3uFruMlOKWC99ROK8CvYnleZ02yYnMfigrk
         KjqYTTuojUQMsp2sAkclMnOXN6jUPPUBMbCvo8ugJkV7NyHpjZvvMfslPr7gZzCY83+k
         x2psDYUoTGjuFzkygAlUs7FzUUO1FqJ2gD++/mtixVU/ksZhOHHB/rUsm5mroA4d4/Dx
         EHeG0e/vpcbMri3FuPboTirSgoHS9V63Orh7eM36QHlSU4u2irCRUQrKtmiEhOYa0YFa
         qhTw==
X-Forwarded-Encrypted: i=1; AJvYcCUrKrvmkyMDBs1f2zHkxN+6EGWRSEVy5Y8Rz7LCss4iCzrymXuauyubyykStPQ8i5IVaCfq/DEn5y3/WShf0VvA6Q3NDQT9XofLY2UnKdo=
X-Gm-Message-State: AOJu0YzCMnyJ2OIvAYdgNwlE1RZ13nGdu14BM0Yjf/hFwV2MVLa+VJuY
	8hNh7+9145jZEBpQzNK6+8tN59gEgbdShxvLvRn7/Cl2eT/6gDTqlUAWzt7ZYg==
X-Google-Smtp-Source: AGHT+IFSe2/0wjlXeosT6AybjaRDblBBqLYzSTq/pghMZUSFXaoYJaYUUu+wks1Pjo3vEOz64TkZAw==
X-Received: by 2002:a05:651c:807:b0:2ec:5258:e890 with SMTP id 38308e7fff4ca-2ee5e6cd9f0mr22383351fa.44.1719823025021;
        Mon, 01 Jul 2024 01:37:05 -0700 (PDT)
Message-ID: <38b57a6f-187c-440a-b3b4-9e7e124e1802@suse.com>
Date: Mon, 1 Jul 2024 10:36:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v2] x86: p2m-pod: address violation of MISRA C Rule
 2.1
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <43b3a42f9d323cc3f9747c56e8f59f9dffa69321.1719556140.git.nicola.vetrini@bugseng.com>
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
In-Reply-To: <43b3a42f9d323cc3f9747c56e8f59f9dffa69321.1719556140.git.nicola.vetrini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 28.06.2024 08:30, Nicola Vetrini wrote:
> The label 'out_unmap' is only reachable after ASSERT_UNREACHABLE,
> so the code below is only executed upon erroneously reaching that
> program point and calling domain_crash, thus resulting in the
> for loop after 'out_unmap' to become unreachable in some configurations.

First: As you have come to be used to, briefly stating the rule itself
(rather than just its number, requiring people like me - who have not
memorized all the rule numbers - to go look up what rule this is) would
be nice.

This being about unreachable code, why are the domain_crash() not the
crucial points of "unreachability"? And even if they weren't there, why
wouldn't it be the goto or ...

> --- a/xen/arch/x86/mm/p2m-pod.c
> +++ b/xen/arch/x86/mm/p2m-pod.c
> @@ -1040,6 +1040,7 @@ out_unmap:
>       * Something went wrong, probably crashing the domain.  Unmap
>       * everything and return.
>       */
> +    /* SAF-8-safe Rule 2.1: defensive programming */
>      for ( i = 0; i < count; i++ )
>          if ( map[i] )
>              unmap_domain_page(map[i]);

... the label (just out of context) where the comment needs to go?

Jan

