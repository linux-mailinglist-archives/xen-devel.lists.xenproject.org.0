Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A5AB8BFC67E
	for <lists+xen-devel@lfdr.de>; Wed, 22 Oct 2025 16:12:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1148236.1480380 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vBZYu-0007aV-LT; Wed, 22 Oct 2025 14:11:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1148236.1480380; Wed, 22 Oct 2025 14:11:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vBZYu-0007YN-IP; Wed, 22 Oct 2025 14:11:36 +0000
Received: by outflank-mailman (input) for mailman id 1148236;
 Wed, 22 Oct 2025 14:11:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=pHug=47=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vBZYt-0007YH-HA
 for xen-devel@lists.xenproject.org; Wed, 22 Oct 2025 14:11:35 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 041270c3-af51-11f0-9d15-b5c5bf9af7f9;
 Wed, 22 Oct 2025 16:11:34 +0200 (CEST)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-471076f819bso55105865e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 22 Oct 2025 07:11:34 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-475c42d828asm46794955e9.17.2025.10.22.07.11.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Oct 2025 07:11:32 -0700 (PDT)
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
X-Inumbo-ID: 041270c3-af51-11f0-9d15-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1761142294; x=1761747094; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=SjjTeIOCsVDildLnxJ8P1TiHlAeqOVpi7i093PH7SuA=;
        b=IftySfWQN3Jv98QoAMDbKtDxpKSKXxiqGTfJMsJzffCnaYSbjs2rzFeCGwrCb0LsDt
         +oL1MfnK0E1LMGbQVBcx6LHd0lfXaomBbMQ5x45yZHSEAAnvRUnvHX7kyo5ZIO/+jZrj
         56DX75336if0oxQiNg7f480t+jQsIuczbkWVcTipgu7M5dCHT6WmIzPveevUJfGIUElM
         iPKSrBBaQb6WYk5govD2FtcqiiEkL6Ga9tqLT9A1sIs6lMUXPZpomqP5JpuQ1toFr0g1
         /zFEVvJ+I9bWNLbLoIFvQQuR9Rn6D8W16de5FxDKt42pRkO1Zxv960i72mfhjwv+BGK6
         MKBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761142294; x=1761747094;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SjjTeIOCsVDildLnxJ8P1TiHlAeqOVpi7i093PH7SuA=;
        b=pwHrQR+n0Z4yerlOHPmm6GasxmmZaj69VH9XVJluxLlk8PkKo7+cJUMRXL9tfpI1WW
         noM8Jlk91EAS8gTiDF+tLJezMPPsxff3N3XB+2/FmyrwefmqRD9vV2KQ+M7LH2jDMkmh
         OfH7anBndx5ewTW6Tr3UQSlfFs2i7y4OvkfGbC0pOfdqEjZP0/NIVcCPEXYu4ZFnlGOh
         tL/AjDtXk36ebQI7gQrgAU9Yuv3jlacMjLclG3KGGPQiRcIvC7rMSzX1GEbgaoncaE/W
         So6CM5l6bEkSUdnj+eIC1BtW8UAgAWQafbaXPZ/6Ji+KODEKdJMEaYNrLSnuVhLiaLcq
         8irw==
X-Forwarded-Encrypted: i=1; AJvYcCUDLFmunp0FaOTR/sjhA/HUReXwX+A5XIJC8qw+NMpFbuDA+BgmAFt8YVVKKDXISAqKxZtBnoocP8Y=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyVq2RGHHumr0QppD5i9vaxlc2yXvHeLUuKeZzpR5oPRR0A3MfZ
	ZmwJs1U9ZIJnjPz5UBCC8rx1eYIGLEsjNnkThZ5Y/EFO04INdTh60Bk1L51mOiFSKAvUjk8ELRj
	tgLg=
X-Gm-Gg: ASbGncuG4DqUd0+dCKMqCl6QZWd/ULtsZgZO0ejOYifYJ855VJLs4VXbxvUbGi87+9T
	eM6uMSFAlnPlU/hCGMECqh9Hufe8tX2hKrwO3GjOSRdq8Z7wm6Fp9QRHIew8k94PtNGNwmOOWSq
	d3IxmzKPIeOi7Cx8RoW2OpNEzESswjnUiKJBpYlz48OmYT2zP854LZIVAF/q7E53qgD9IQipsPU
	/uF7vzzRAipY2U88AI/Qwj0/oFm8S1osl2iCRsHAyEgqiBwjnODval594Q/+cTt1fPCA4DWp7oy
	EKTtfviuNI//tmhQh2j1w4k3ls0/KMMO3Jqd6Cl2JhIvA+gsJDF+y+4jDhOmmMR6LWbN8Ex3hd/
	U1xWFKD581SkDtnoHN1KiUbYFJtff17mZDLgVPJxJ89t399maSyRRck9m4I6fIThcKObrsKBNO6
	6xNpHsWuYiTEk661H2z+rFrU7ypVpphS84hvwgx7Uljyip3QqPdCEE2uAMwpNqvdCLjCWohZc=
X-Google-Smtp-Source: AGHT+IEEqo7OEB8PMqx9XuTR8jZGMlFu+QlTUZcqjHVo7J7rs8a6KcgBa2aiPlaJAMVn0IDUIOMwfA==
X-Received: by 2002:a05:600c:3b8d:b0:471:60c:1501 with SMTP id 5b1f17b1804b1-47117918c0cmr176442575e9.28.1761142293814;
        Wed, 22 Oct 2025 07:11:33 -0700 (PDT)
Message-ID: <f3ca8744-38c5-4d29-a216-b5e810adeb05@suse.com>
Date: Wed, 22 Oct 2025 16:11:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/7] xen/pci: introduce has_vpci_bridge
To: Mykyta Poturai <Mykyta_Poturai@epam.com>
Cc: Stefano Stabellini <stefano.stabellini@amd.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stewart Hildebrand <stewart.hildebrand@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <cover.1761134829.git.mykyta_poturai@epam.com>
 <1695581f037a8361ef284a5e51bcbce9891b8110.1761134829.git.mykyta_poturai@epam.com>
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
In-Reply-To: <1695581f037a8361ef284a5e51bcbce9891b8110.1761134829.git.mykyta_poturai@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 22.10.2025 15:56, Mykyta Poturai wrote:
> From: Stefano Stabellini <stefano.stabellini@amd.com>
> 
> has_vpci_bridge is a macro to check if the domain is a domU or is dom0
> with vPCI (pci-scan=yes) enabled.
> 
> Use the macro in drivers/vpci.
> 
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
> Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
> ---
> v1->v2:
> * simplify definition
> ---
>  xen/drivers/vpci/header.c | 14 +++++++-------
>  xen/drivers/vpci/vpci.c   |  4 ++--
>  xen/include/xen/vpci.h    |  8 ++++++++
>  3 files changed, 17 insertions(+), 9 deletions(-)

With this diffstat, its the subject prefix missing a 'v' (xen/vpci:)?

> --- a/xen/drivers/vpci/header.c
> +++ b/xen/drivers/vpci/header.c
> @@ -230,7 +230,7 @@ bool vpci_process_pending(struct vcpu *v)
>  
>              read_unlock(&v->domain->pci_lock);
>  
> -            if ( !is_hardware_domain(v->domain) )
> +            if ( has_vpci_bridge(v->domain) )
>                  domain_crash(v->domain);

Here and perhaps everywhere else I wonder: Is this really an appropriately
named predicate for the purpose / context?

Jan

