Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E9348D0679
	for <lists+xen-devel@lfdr.de>; Mon, 27 May 2024 17:45:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.730864.1136124 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sBcXi-0000ad-GD; Mon, 27 May 2024 15:45:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 730864.1136124; Mon, 27 May 2024 15:45:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sBcXi-0000Yr-DD; Mon, 27 May 2024 15:45:46 +0000
Received: by outflank-mailman (input) for mailman id 730864;
 Mon, 27 May 2024 15:45:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=O60l=M6=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sBcXh-0000Yl-Ad
 for xen-devel@lists.xenproject.org; Mon, 27 May 2024 15:45:45 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2d9b7df5-1c40-11ef-90a1-e314d9c70b13;
 Mon, 27 May 2024 17:45:44 +0200 (CEST)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-a63036f2daaso103007266b.1
 for <xen-devel@lists.xenproject.org>; Mon, 27 May 2024 08:45:44 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a626cc8adf3sm503577766b.152.2024.05.27.08.45.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 May 2024 08:45:43 -0700 (PDT)
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
X-Inumbo-ID: 2d9b7df5-1c40-11ef-90a1-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1716824743; x=1717429543; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Z4r0Jsgg7TsD8pi/X5L7DjWiTiuCLXHQWMb03Np8clM=;
        b=TDAZMCXKC/Q820AkHqKTzq6lxT/j5/QIzD5umxcHgy00qcIHo4zbH2sp5nusvv8E11
         j4z8qPROrWx6K+POxwRXNtcSLXWllKH4drBN258Zw8YCbEY6AR3185HoaMbYu4dK8qRp
         8LoYhOHNSkjakLAcBVykYMmDT9qCy8JHyyfIF3Y0FNWcgi4j6cMqJaGGoRfwGZE1cQuq
         /EeECX0lg99jeq3YMWRLYLYekPIToKkfSTOOWgWwJn/wL/5BbZ6WqiQhOdICGaVJGkWv
         0Xx8z4VLnMXPNfDBi6PoeTDhvt8TuVfeF/+vSh1qnsxhUGJQnCJFDoTfWyd+nXa6CbVg
         1ORQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716824743; x=1717429543;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Z4r0Jsgg7TsD8pi/X5L7DjWiTiuCLXHQWMb03Np8clM=;
        b=ZHxyosMxUVectm+LjwXeMVHd2GYcy1GcjiHdZITBBqVJppNCvLRP9YZZCDbG6w7nOA
         rKNLHeYM4AEHKogRJoXMQUefMhdgOcWJw6ywPax+JVpK96sJNCE/zX9ll88r8sMCaPcv
         4vUnRgn6FMCsLuCCTF3GaSJsnTNF/KGqlewk50/ruvKpCnJbyWDLLxg4eCo1CjF4PrHl
         8oE1qowd3D2nqJHYGFEUsDJ4hI+L9PnFQNxptDX6kSHqmX+2QOU0HobNdNpY4gdQy7mF
         D+abGkkxGegOP6TLm2DNSVVgyW6BSp1Y+d89JrfvMy2Cuw7AaVMzFGn9QQ5+sUPulvCg
         qNlg==
X-Forwarded-Encrypted: i=1; AJvYcCUotNtZUb5HVntlGJ+emIdbVM/y8jc92X4ocn4uVr9rTd/k/wo5WmpoFqO54PCFJiR5gI3f14iOKWjEjFwGK221/9DfkZZ2GUfkMnTudI0=
X-Gm-Message-State: AOJu0YxK9sVmU1Lf7vKaDLR13zevEpFNfagoJF5GxpVnq6gjeXnf8ULH
	7qJnzLRYwWYcwJiCdhIZ7UoKrny+Fxa/j2MHSNqwpK08+qIwa/wRpg9NehUD4jyq8PAIKBGJ7/Y
	=
X-Google-Smtp-Source: AGHT+IFeB0Eh+2k61aR5lWGzoTlJxC+celrvHqWmZD5+Aqd6pEncsLarR/4kgxfF2ycUlPEOwLwlvw==
X-Received: by 2002:a17:906:f5a1:b0:a62:f6f6:badb with SMTP id a640c23a62f3a-a62f6f6bb87mr218359166b.54.1716824743715;
        Mon, 27 May 2024 08:45:43 -0700 (PDT)
Message-ID: <193913eb-e7e8-4670-a236-8942a718686a@suse.com>
Date: Mon, 27 May 2024 17:45:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v4 2/3] x86/MCE: add default switch case in
 init_nonfatal_mce_checker()
Content-Language: en-US
To: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1716366581.git.Sergiy_Kibrik@epam.com>
 <9ec888c37a261c86a52f360146cbbb3ad437ad30.1716366581.git.Sergiy_Kibrik@epam.com>
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
In-Reply-To: <9ec888c37a261c86a52f360146cbbb3ad437ad30.1716366581.git.Sergiy_Kibrik@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 22.05.2024 10:42, Sergiy Kibrik wrote:
> The default switch case block is wanted here, to handle situation
> e.g. of unexpected c->x86_vendor value -- then no mcheck init is done, but
> misleading message still gets logged anyway.
> 
> Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>

Acked-by: Jan Beulich <jbeulich@suse.com>



