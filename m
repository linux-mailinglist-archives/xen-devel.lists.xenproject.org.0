Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 13193C809E2
	for <lists+xen-devel@lfdr.de>; Mon, 24 Nov 2025 13:59:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1170870.1495897 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vNW9z-00051r-7k; Mon, 24 Nov 2025 12:59:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1170870.1495897; Mon, 24 Nov 2025 12:59:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vNW9z-0004zB-43; Mon, 24 Nov 2025 12:59:15 +0000
Received: by outflank-mailman (input) for mailman id 1170870;
 Mon, 24 Nov 2025 12:59:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CeM5=6A=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vNW9x-0004T2-PM
 for xen-devel@lists.xenproject.org; Mon, 24 Nov 2025 12:59:13 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 60017aaa-c935-11f0-9d18-b5c5bf9af7f9;
 Mon, 24 Nov 2025 13:59:13 +0100 (CET)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-42b379cd896so2328669f8f.3
 for <xen-devel@lists.xenproject.org>; Mon, 24 Nov 2025 04:59:13 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-477bf1df392sm197221895e9.1.2025.11.24.04.59.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Nov 2025 04:59:12 -0800 (PST)
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
X-Inumbo-ID: 60017aaa-c935-11f0-9d18-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1763989152; x=1764593952; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=rthwdmuYVi+1feGAAdq1Pe/M0Dje0fenfS69Nzb+RrQ=;
        b=Pg7T2HnppGCHjesUwbPTPbcZptf/D4Hy//YhLt4oY9IQm1oqKoCk6R2E4eTAVx7kbB
         v5WtTjLcBxQzrPOHqq5UoyDXIMyoW5oKeDkHRWrcuwpFlUU7Rdv5hFDrwmbHHxJ07jAZ
         vZqQ949BrWE93tFKu35DBh92Ydk1HwosgQCQvubwEHiqtLUtEr8S+DmiYV/RebgwyseW
         3AGxws8SVS/EicsMRVXzrhB6XlLku6TjxdjCKwdT4TwTOQrvgV5P5SyVzzw+u1it4r+r
         o4j0SZ2DXdncsbx5Q2cdZHq9F5D53Soq83FucoKHzdjGUiRg4bGdAM3qNUE6owV/Cx95
         Wl/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763989152; x=1764593952;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rthwdmuYVi+1feGAAdq1Pe/M0Dje0fenfS69Nzb+RrQ=;
        b=srJKS0TazBf9M1dD8UFHYrm3o1dwMrBm7MdZPyS9EwIbyHLyngVRSXnJJcGp/GVjmS
         Lr8BiR+aPcQtGoOyk+aF1/PFWF8wmV9XADaZXtC4s2/tyKOkDkRv8bETMk1A9WIyupef
         vQYzeFuJ+ue5TTVI/RM+DgXVs6Z9IXf4lv0vFm7rh/P4XGCecc2shPlssaOxaGOdMWgh
         8fIg+dXUzQe0korcwfJIIbAIjsIgRl4mqw1HSn3q5UZAN0oDXGdfwsUU0Tq4lHUqTQTy
         O4Tdk8uowZpomZincz1Ky+8NieTfZ3SxOuVgbUg5gVYaYoxOcVj04Z/Sup8u+dn3IVdu
         shQA==
X-Forwarded-Encrypted: i=1; AJvYcCVlE9TLVywM5I0g2kMIi9kJdU3Oe21dHCl4WhJVMD+UoYHher6ot79zpRox211+0OJOJ4/YggFXyR8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YziP+Sx5PxDstsJR3S+KO7OpmikPyDQMPADohDX6vVMhreGHZ/E
	Nol91dZ+o2tjC0r4WzVAPGVpWXC6vbyyVKvK9ZA2Gz/iFtwCyEA1zYF3/L5q1Vvlxw==
X-Gm-Gg: ASbGncvfNlGeKOHBXzLus0V8sMA7JUh/lDzWKSIYZJ5dXOL9PSbwkrPMT98hpRaxx4v
	kzgbokwEYxCABhcLi4x/GWZrigTJHFX6BnZFX2yad/OUOPe88PiOsTS9LWPaaSKweKi8xJRiyIE
	D9OQOZcMVPDhFxVeIOwpbIIozrP6c0qhLU+MTvlO03OW95+Hib0al3UnkZvpmge45YbIfW84gzU
	LkFnvOatmNmXDjIK0AaCj2YnsWo/j+wgwcdojbBYpUnWNzZXoLN33DmNDmHkjj5LVhvSqb3GIn0
	Rp7AVK94uSvc6tokIHnPNmMf8P4TgpwWKapIUcMtlK2N+Gk4tLJnavKi1qP4MgBy9jipVYGNO/H
	R27IXFiLO8fJ0LuhJ27OLldweH/+cPDye1R2hZht2JH/5FveilDXXtaFP7AJfb/G6GpqtBwHb6d
	Jx7Tsyjigg/eEIiPRrGnLkdRKy0jCh6mAB7bfNe7G+UsMKTepDrRUTfUrAB6Zit5oVcUDPk5mDo
	98=
X-Google-Smtp-Source: AGHT+IGdoJhREtwuJONG9uLs3aCMaYECSDKh/GFxx4lW+5oDva3FYpVpq9aVDUebLIBuo7HkzHfAeg==
X-Received: by 2002:a05:600c:1c25:b0:46e:4586:57e4 with SMTP id 5b1f17b1804b1-477c114ed70mr175269635e9.24.1763989152463;
        Mon, 24 Nov 2025 04:59:12 -0800 (PST)
Message-ID: <b8b0e3ee-9b0e-4403-baed-a6297479f4cb@suse.com>
Date: Mon, 24 Nov 2025 13:59:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] xen/param: address violation of MISRA C Rule 8.2
To: Nicola Vetrini <nicola.vetrini@gmail.com>
Cc: andrew.cooper3@citrix.com, sstabellini@kernel.org,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <cover.1763642993.git.nicola.vetrini@gmail.com>
 <b51830acf5274dfac6a3b2b6864be775180ee673.1763642993.git.nicola.vetrini@gmail.com>
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
In-Reply-To: <b51830acf5274dfac6a3b2b6864be775180ee673.1763642993.git.nicola.vetrini@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 20.11.2025 20:32, Nicola Vetrini wrote:
> add missing parameter name in function pointer member declaration.
> 
> No functional change.
> 
> Signed-off-by: Nicola Vetrini <nicola.vetrini@gmail.com>

Acked-by: Jan Beulich <jbeulich@suse.com>


