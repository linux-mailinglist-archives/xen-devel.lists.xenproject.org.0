Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 06528ACFD2F
	for <lists+xen-devel@lfdr.de>; Fri,  6 Jun 2025 09:03:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1007955.1387148 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNR6c-0002WU-6J; Fri, 06 Jun 2025 07:03:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1007955.1387148; Fri, 06 Jun 2025 07:03:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNR6c-0002T6-1u; Fri, 06 Jun 2025 07:03:10 +0000
Received: by outflank-mailman (input) for mailman id 1007955;
 Fri, 06 Jun 2025 07:03:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=U7n3=YV=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uNR6a-0002QP-EG
 for xen-devel@lists.xenproject.org; Fri, 06 Jun 2025 07:03:08 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4bfafc25-42a4-11f0-a301-13f23c93f187;
 Fri, 06 Jun 2025 09:03:06 +0200 (CEST)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-450dd065828so13099155e9.2
 for <xen-devel@lists.xenproject.org>; Fri, 06 Jun 2025 00:03:06 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-31349f17be8sm746051a91.3.2025.06.06.00.03.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Jun 2025 00:03:05 -0700 (PDT)
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
X-Inumbo-ID: 4bfafc25-42a4-11f0-a301-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1749193386; x=1749798186; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=fBDXHMOf8VCTc+4VoPNOfZfdMeTaEz/GjWIXf6YvVBM=;
        b=CKrtcByEdiszg9f2GaO72/xVPp5G+boWzgriy9rPNyefytqZnQtavHPHfQG5GlChwP
         cJ3bncPDQYoq25qTjG2KaPvbOy7fbIJ2Gidl4/cdSov3xVHUAs2tqug5Mg5mi1IjuPSx
         xAdA59cKPIQpyb+Dah1Fq8Hcbbe5ICHny8lzbw+xtiYnYTxWx6a8g4z31NsnQcpX07mG
         StsWJUod/F/2mh1aqO3bPxWD6HoWdpNbif0bJs6xlmECWBFgz4Hkk8EGnQmlzjAvtUrH
         GscE8cd/MmrVgx22sGlZU5oqxAvLb87//DRuHp8/qNKZA4IQaGzxFDtJvfGluq2w2KSJ
         SmeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749193386; x=1749798186;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fBDXHMOf8VCTc+4VoPNOfZfdMeTaEz/GjWIXf6YvVBM=;
        b=BY65D7QoWHlV084F/ysDO+aZPeKmCAH61gaeK2Z3+w0B0hV+P6/rHghtM9p4AUB4la
         4cfGsyoNQy8lMuiUqB6xwpCLQU8kQhOsgE6m30C502XphpFZq1BM8bAMWYLqSNkuxjPb
         XgW0Z5HSQOw8zYYph7QEEvxhE1Ddk4qliaB5JYQaqH3LdEJxcdygyZf+ae3yg/Zf5soj
         mqxwXcr3faZlJeByFFjxMcB1D+B/mP9/Ou+uZNTGEuKVZ2WD9+wVOR3hnyPSw8YmZkV/
         6D2krHYZO0gqZnd5D2+HYWo530L1vKra1r3TKIC8h0rYjwfvj0j+2l006OeXfFD/BgaG
         cekQ==
X-Forwarded-Encrypted: i=1; AJvYcCWkcSaUz0MDmGdr79Vd9juimJz7PnCsTev04VoK9yhpHYkczXl5ogIygdrAMVsslOXoyNYzVtvvrCE=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx5u3l4/GnensFz/h+2xhqg9Y26eCe7sd4+Ty/Kv7A9N/PUwelo
	H9dxXF7uGHSfHSA0ggvLH6EjDN/zXO4mQwr58GXJlyvbPAHWbbgFxHYzNoL6EWP2+g==
X-Gm-Gg: ASbGnctUPWTDBtCy07kXL+WEPS7yBCMw8U1trGLZR/AdmDGIZeloxEycmhi/07M+kj2
	yTQDUBhKx1iAUll3ksFEv2qhohkUN/FGJwdLVG7NJvYaUDMAMcUk3SMN4laupZVm+tce20WRiAe
	SbkjOK95X592yhBNOeJZdugm8GNCdzwrmtRdt1tYWxLkAx7SzOu2ZBbTGLRz7lWkVDW7Iclqpu5
	8cCpxtc0MRGY/LTcXQ3PBzvUp1xwFBDZNdrwAIcOMXijsRC9F9qfre6/8QYT9Rury7WZCTm4Y/E
	6doP3+jAiI9Ry1ozm9BvAxpYROnGpmgo7WMbzRWChyfh1gUGzbMvpzJb3Z3Mo/zQiTmzEpaRZSP
	xfw/p+cSX1G795nxJq6IfZHb11FzP6KqKJ0T6
X-Google-Smtp-Source: AGHT+IHj2Unn7b5F6ZZjwBs8kYLc5dVD/p2AKif0YOsKpjMyIObHi9IG5wLMNqUsdmf8WgGQGrIzCA==
X-Received: by 2002:a05:6000:2888:b0:3a4:c909:ce16 with SMTP id ffacd0b85a97d-3a531ab6c62mr1774054f8f.49.1749193386032;
        Fri, 06 Jun 2025 00:03:06 -0700 (PDT)
Message-ID: <a98dfa47-4036-4fe9-9708-b921ebae6e78@suse.com>
Date: Fri, 6 Jun 2025 09:02:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 1/3] xen/domain: unify domain ID allocation
To: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, julien@xen.org,
 roger.pau@citrix.com, sstabellini@kernel.org, teddy.astie@vates.tech,
 dmukhin@ford.com, xen-devel@lists.xenproject.org
References: <20250528225030.2652166-1-dmukhin@ford.com>
 <20250528225030.2652166-2-dmukhin@ford.com>
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
In-Reply-To: <20250528225030.2652166-2-dmukhin@ford.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 29.05.2025 00:50, dmkhn@proton.me wrote:
> @@ -1079,7 +1082,7 @@ static struct domain *__init create_dom0(struct boot_info *bi)
>  
>      bd->d = d;
>      if ( construct_dom0(bd) != 0 )
> -        panic("Could not construct domain 0\n");
> +        panic("Could not construct domain %pd\n", d);

Just one nit I only noticed when reading Julien's reply: The word "domain" is
now becoming redundant here, and hence would imo better be dropped.

Jan

