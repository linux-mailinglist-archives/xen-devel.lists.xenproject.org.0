Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 662E79EB1CC
	for <lists+xen-devel@lfdr.de>; Tue, 10 Dec 2024 14:25:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.852382.1266190 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tL0Eb-0003nA-2d; Tue, 10 Dec 2024 13:25:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 852382.1266190; Tue, 10 Dec 2024 13:25:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tL0Ea-0003lG-WC; Tue, 10 Dec 2024 13:25:04 +0000
Received: by outflank-mailman (input) for mailman id 852382;
 Tue, 10 Dec 2024 13:25:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=So9x=TD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tL0EZ-0003lA-NP
 for xen-devel@lists.xenproject.org; Tue, 10 Dec 2024 13:25:03 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 28f8e2b5-b6fa-11ef-99a3-01e77a169b0f;
 Tue, 10 Dec 2024 14:25:01 +0100 (CET)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-434e9716feaso18935525e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 10 Dec 2024 05:25:01 -0800 (PST)
Received: from ?IPV6:2003:ca:b746:63c:8df1:d232:d9a2:1ff9?
 (p200300cab746063c8df1d232d9a21ff9.dip0.t-ipconnect.de.
 [2003:ca:b746:63c:8df1:d232:d9a2:1ff9])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-434fb9bf04esm56993525e9.26.2024.12.10.05.25.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Dec 2024 05:25:00 -0800 (PST)
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
X-Inumbo-ID: 28f8e2b5-b6fa-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1733837101; x=1734441901; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=RBcklUltirvQY9PSNc7XysIqku7VkeVi7jrUQuk4484=;
        b=B8kEU/dNvxaflT90k57t3cbOFRfhLnTEqWpYkmN7I3W6kwjri0BSvEj+WHwZkUcqyM
         1f3D59FrYm23uRTCcUS80nl8JGnSFw4tKlax9Xj0QpVfRuYJldUfP344w1iwudOTznAy
         5mghU1531W9PMi2bVbRin2CPQkd9GuyrnScRhdQlir51wPqqIm/zSkWGrzw2YeFh3KoR
         fF1fEA4OHpUrJYSSCEQzdL4NokVlWLCd627gIUw6iH0kXbaZoalQMF3HZRg4BGA0OGop
         K28bPrOSB5SDX6Krsj19lDD69mLWTY9NF3HKr8G/P6JxBkiy7PnSRHztX9JfNtOdxDlk
         dXuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733837101; x=1734441901;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RBcklUltirvQY9PSNc7XysIqku7VkeVi7jrUQuk4484=;
        b=cDKVFNrO/muorJt79cgOx4u8Kz9bBCESiiH5xLcAwcO8d0zb+Fr96KVxRrQvFRKsby
         KsD4KPv1u5FpP8t5cgEkwJ3LBA+fdlvVyxTu/WDKl3QyNIVQDh0ff7ve4rNqxXSEm+Vb
         n2NIUdplA0e+YJq0Hajkcrdz4HfYJsESo3625AIevVhk1a7uW6dToIcKzumYB4Ft9ZVc
         4Ld0642qVHfNSpOPL+RphuUg2b66uh3Sz/0O7yNlG3ZSrVUTSPP1OAWoF3UPBA24lJPC
         lonO6QWTid34Pg/519zb+2GX7E7+6D4eUGMG+HsWCJORnTpUMGXGLD5eOkAMlrZUtZWu
         G87Q==
X-Forwarded-Encrypted: i=1; AJvYcCX1C12arfdrMDDJ0duPNA4aRifzivfOjI5W/0cs137tXDAHLO3DNgmDXk44PqsVHXnmAPdJnJ9oBos=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxKGB9nTaxIawee7mVftXNKTdVwNNmNLleTlQShrxXaoj5hX3Qn
	2P/cQszVj68WebYUf/tfR98Egt/uJsyjB1bfQY8k4aRWUmZQjyupsDGG7JSwpQ==
X-Gm-Gg: ASbGnctxp83WPmwQm2YpMpppj4GwskJH4/fM2kOA++S0jnsVSm5h8sRjQaptks3HBOa
	cf18d9G4NyyctqOlupT0FVFtc+6IzhAdadeKMzyysiMxd6AlEEfZKnKvltA9wDdBIa5elrreJLK
	wfCP3NDpVecFokdfT31JLmEkuchKKruc0KUsUQ8U6It9fx7e6ZeK4SBDpIsiW4Hjl3SFgJ97AAT
	LdgZ3EANRvTSEe9zlFg19G7RO9nzDh2IvI+w3okRCAeKQ8ph1WWT8/K1ot/OBTpxqxSGqEoj9CC
	8ipNajkZeoaZPlGOxIa9pxSDGA+s1rRbBC1WDzE0Qra9zb2sw7x6i0VRMQzh17B9ttL+fhEB4Q4
	UdI6V2PJ0tQ==
X-Google-Smtp-Source: AGHT+IEI48tSbAuXlSNltoXFGqhCWWgRlD7UOBfVnfjD3qAJgPCcyceWva5xeqqDIXezifka2/ISBg==
X-Received: by 2002:a05:600c:1f96:b0:431:55af:a230 with SMTP id 5b1f17b1804b1-434ddee050emr112747885e9.33.1733837101189;
        Tue, 10 Dec 2024 05:25:01 -0800 (PST)
Message-ID: <ffabb668-1390-4273-ae82-a0510a01abc2@suse.com>
Date: Tue, 10 Dec 2024 14:24:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 07/35] ppc/domain: introduce domain_has_vuart()
To: dmukhin@ford.com
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 xen-devel@lists.xenproject.org
References: <20241205-vuart-ns8250-v1-0-e9aa923127eb@ford.com>
 <20241205-vuart-ns8250-v1-7-e9aa923127eb@ford.com>
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
In-Reply-To: <20241205-vuart-ns8250-v1-7-e9aa923127eb@ford.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06.12.2024 05:41, Denis Mukhin via B4 Relay wrote:
> From: Denis Mukhin <dmukhin@ford.com>
> 
> Introduce domain_has_vuart() for PPC port to be used in the console driver.
> 
> Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> ---
>  xen/arch/ppc/include/asm/domain.h | 2 ++
>  1 file changed, 2 insertions(+)

Please be sure to Cc the maintainer(s) of the file(s) you change. Else
it may be pretty unlikely that you'll ever get an ack.

Jan

> --- a/xen/arch/ppc/include/asm/domain.h
> +++ b/xen/arch/ppc/include/asm/domain.h
> @@ -10,6 +10,8 @@ struct hvm_domain
>      uint64_t              params[HVM_NR_PARAMS];
>  };
>  
> +#define domain_has_vuart(d)         false
> +
>  /* TODO: Implement */
>  #define guest_mode(r) ({ (void)(r); BUG_ON("unimplemented"); 0; })
>  
> 


