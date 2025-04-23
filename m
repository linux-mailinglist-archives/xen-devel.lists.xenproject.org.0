Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 492E8A982E8
	for <lists+xen-devel@lfdr.de>; Wed, 23 Apr 2025 10:21:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.964142.1355002 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7VLj-0002Ec-Bn; Wed, 23 Apr 2025 08:20:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 964142.1355002; Wed, 23 Apr 2025 08:20:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7VLj-0002BN-8c; Wed, 23 Apr 2025 08:20:55 +0000
Received: by outflank-mailman (input) for mailman id 964142;
 Wed, 23 Apr 2025 08:20:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=rvAI=XJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u7VLh-00029M-6N
 for xen-devel@lists.xenproject.org; Wed, 23 Apr 2025 08:20:53 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id deb268e0-201b-11f0-9eb0-5ba50f476ded;
 Wed, 23 Apr 2025 10:20:52 +0200 (CEST)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-43cfa7e7f54so4802095e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 23 Apr 2025 01:20:52 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-44092db2ca4sm16993695e9.27.2025.04.23.01.20.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Apr 2025 01:20:51 -0700 (PDT)
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
X-Inumbo-ID: deb268e0-201b-11f0-9eb0-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1745396452; x=1746001252; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=2Dz+r8TyXvFXQrEZxlFMkaOfdKxTw+zwjh8Bt9hQrNs=;
        b=f6MnpbkqV/5zNtxHGlrjIelvMUbjDqTPTmhoQfvgNO9hOPT8N3FETlGdndJteVOmlA
         blWfvXQt4cQzl7tKSIE2Hzrk2688ki0PQgMjCyTbqdN2oL+Q8frmi3W8vKhI2JiFZLjS
         M0nMJE8rzkPiVg0j7JmSnLlfrrVRROJLdkCN0QWOyeEF56UhtvVPNKDQqu5rMjXJxwUR
         q83S+ktWqOXy3iBoHJWJ1rlvIrtkK79nvBecgyLxeV24AztFnT4t9hjeP6Qd0Ov1cD6+
         G+B1ml71OO84kmMtkcqZFv31H9f3pqWNQZOQ9AMJAAfJfepeCy1k/KIUiM7fTkc/4deO
         RiYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745396452; x=1746001252;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2Dz+r8TyXvFXQrEZxlFMkaOfdKxTw+zwjh8Bt9hQrNs=;
        b=PgRtIWJoXB6y7wog1cxGToPbgJn8NrZYDWqw3vS3A2ojRtNfy0mP+R8d/VJX4neMI9
         hVcYFtYRNczYQMp79PXyPLmLJurZhfWzXt1LWTpxsN5i5rG2nyE4DsKZOz9T6yvgOknP
         mN6zUOWVFCdJW1783WJx/2P8DSXVQDhS67LvQMaCQgEXQlN2VSXMg0pxvLS1OzYhF+I6
         UyNzUBTLmbAN7CdSZPrapcK7j8X59uNwDV+f5x0FOcSJPF0aupjTMZ7Ke87Eej4tJuu2
         2wFru1K1soybwDpJ8ZpJsl6AngsiHj1cScWc1AAdXWgdvBkx1plRgFvTHvs6+HCfYi4T
         bHsA==
X-Forwarded-Encrypted: i=1; AJvYcCXxX71goK9tNlUVM0zx46NuF2qms618uBhkSXcW0/kXkav2oHVcN7UBB4GXWUMI2bYS1Gf22TSA9d4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxGVA9NTeo4cK5t3Lt3tLDlIlAZhyINXebFM3z5+/S6n6L++lw8
	e+leGK5qzuXfsWJmyhRzSpKEPcp4UuTumYBH0ScXHpqj57eytVoCvGxPMPvykg==
X-Gm-Gg: ASbGncvASe9iGmv/IR+tI2t1kcCabUU+Nztlwam0nFY14LWMQ78A+qYjpLd20BeYFcI
	6kgPgSvabeKmSSaftpsbMLw16j8fEONHRirRQiw5gPll2RKfI/t7s/SztAr9orf7NEq1IhWVrVH
	de/zbY5mzMouKuA5MFYNyvFmfBb+NSuEh5W7/QoaR0jW0S+iECAoMe/lQLlTg3+FUSqHCU4GsoR
	qcHEmYIT9zRF8NkC1ATUB7cY+XAeXgBXFphUTZbSaIib1eQLSLCUG0OWU3DBay2mQACHwjIMPwO
	cowTjpEZtm3pR6MJ1+X0dldq9nvf3deIFPJB6i/dMKImmP1HJP5mDtofhW0dflVxvrji4kLGXI3
	dvyTDJqFQEjwztDpOpROf6ZrF3g==
X-Google-Smtp-Source: AGHT+IF+zG3ZbR6q2sgNzxnJoteb7mnhrFUW3GlEl7Hfpa7T65rFZ3KbMcEVj6us3X3W/JjMw3GUkA==
X-Received: by 2002:a05:600c:3d0b:b0:439:8878:5029 with SMTP id 5b1f17b1804b1-44091ed703emr14777655e9.2.1745396451692;
        Wed, 23 Apr 2025 01:20:51 -0700 (PDT)
Message-ID: <1bad3a5e-379f-4b96-ab2a-c0ee7f3904cf@suse.com>
Date: Wed, 23 Apr 2025 10:20:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/8] xen/livepatch: Support new altcall scheme
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250423010237.1528582-1-andrew.cooper3@citrix.com>
 <20250423010237.1528582-7-andrew.cooper3@citrix.com>
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
In-Reply-To: <20250423010237.1528582-7-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 23.04.2025 03:02, Andrew Cooper wrote:
> The new altcall scheme uses an .alt_call_sites section.  Wire this up in very
> much the same way as the .altinstructions section, although there is less
> sanity checking necessary.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>



