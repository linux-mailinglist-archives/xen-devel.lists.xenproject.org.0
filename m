Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED206B0F5E3
	for <lists+xen-devel@lfdr.de>; Wed, 23 Jul 2025 16:50:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1054310.1423066 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueanV-0000Ew-QL; Wed, 23 Jul 2025 14:50:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1054310.1423066; Wed, 23 Jul 2025 14:50:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueanV-0000Cv-NJ; Wed, 23 Jul 2025 14:50:21 +0000
Received: by outflank-mailman (input) for mailman id 1054310;
 Wed, 23 Jul 2025 14:50:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=KFh9=2E=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ueanU-0000Cp-Sd
 for xen-devel@lists.xenproject.org; Wed, 23 Jul 2025 14:50:20 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 59fb3295-67d4-11f0-b895-0df219b8e170;
 Wed, 23 Jul 2025 16:50:19 +0200 (CEST)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-45634205adaso34294685e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 23 Jul 2025 07:50:19 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23e3b6d2fa7sm98145285ad.162.2025.07.23.07.50.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Jul 2025 07:50:17 -0700 (PDT)
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
X-Inumbo-ID: 59fb3295-67d4-11f0-b895-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1753282218; x=1753887018; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=QjmBSsNlVuybkjWjv0z/QvoMXLyQqFNFTKwU/W+4ysA=;
        b=SjjrT22aPIDyOUYI+Sa5tyzovSvWRUlPnMKgjNnU1z++AlRUrNkuOR5YGg64HBJ2+g
         P7/+9RoEj2eXlaWhbiguj0e7+YPxfjRW+JjDrtRljOpVR3poZcTf/DHkgf/8PXZy2sIp
         5rgSW7lZ7ggzXd1//NAZ6uVLZAJDB4Jm8TLFEQ2lTf6muMQdolWwR5odwbbG9lZSEtql
         YWXY05LQCO1lN3+vxhaaId3RgazbnogiVfj49O5P3kiHOum5E8mcPmbT+8/xyOetm8Xc
         zpelXUrZJQPiKR2lZuKR0jggOCLTWuu7/lzqzPIPNrUeNuZQUjc5dM1lOAne6GeIhVet
         emaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753282218; x=1753887018;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QjmBSsNlVuybkjWjv0z/QvoMXLyQqFNFTKwU/W+4ysA=;
        b=g0EAuafNIeHqYYQ8ZYFthMR/5L2E5iuV4zlbJNxugNVYnPpp0Lokmc1Immbzplhotz
         CXB8/q7Fcm+KCYgd2mUlajeYX5sO8dYiXRdrkg3tZyu7K4ajO+hm37gD0v8ewnBWYzPQ
         OeCGMfYc7BS9RESrC2Dz9uBN9WHeKbsM66ASNcyYPUMmXnbYzPu0Uw373mXnCccmidzX
         r2qHHyyPDRF1mzL07qFj/u1uMb4dLuE8ibz2MRNLibTxf9i9uwrlPLqppQUw732Zbbfm
         akRXmvD1hB/W+7ZEeMARkaO2okXgQ+SwtNVRRuHMx+Fykmpa4J2n8u64v8XnjPynN/V4
         2/OA==
X-Forwarded-Encrypted: i=1; AJvYcCUHKwIioXKdthVX//zMdqgu8rCbhHZJPrM0Bak42d5XxGs1qhVGy+3OK8CAPboQBmVH48txTvGk1Mo=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxTFWcA3c7sWxF/AD4LFUroJgtYpTykj4kIFMIVpzJWPZut4YDr
	JadjBg4zDeRVjpvjpCcef5pIyheF//OsqVXVWNc9uaizW2xczOvX3AFUAljflcNJvw==
X-Gm-Gg: ASbGnct5OFLnjnhp4fT4lHbHQHykI0EY9B5laDBQiezMcWaFj6Dq786l/MN5SfJvBbD
	OPO0d6wedZTKGmmATg15kW2XuZgnVqIxpFMf5qNYiDSEpgs50eP1E4sCMVvtgxcPofdJ9S3Aeng
	DN9haI3X7UFeV6tvkHG7X8TrRlHmPwcqVdvPCD2DT5LwliPq5e60VZvELjk2QNayJPWVrR4zcZo
	atMsiUKHdEJDVbs60rcVlFMnTdAX3hGgsoquBhx55v6qZ1XLZEBxUPWu48E4wd9j0+C6r9HjmKd
	25jx6lovJDEsgsRYVivFgYXzRTtMKWYP+zCNyF64zhiIYMk5LEkGomLb9PPO4LQj8pLIWVJHkF5
	j8+aWG+ThQK5w5GywZe3p2r1aqls1n82r0t8HPQP5QGPI6TibH0Q4FsM0YzqMyeTPjNkjuXkF9w
	jAJBU9XUq3MsLd80aEwA==
X-Google-Smtp-Source: AGHT+IE5UkW9ZCABBttf+ulV+9BmY5QuqqRk3NwcujzJN8E36qnmRSwKOO2pMfDpkWXKppsMixchbw==
X-Received: by 2002:a05:6000:2003:b0:3a5:300d:ead0 with SMTP id ffacd0b85a97d-3b768f26808mr2601220f8f.43.1753282218380;
        Wed, 23 Jul 2025 07:50:18 -0700 (PDT)
Message-ID: <6bb0e3d5-7e00-4b5d-a12b-2f449862b6f6@suse.com>
Date: Wed, 23 Jul 2025 16:50:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH] x86/page: fix regressions of MISRA C Rule 8.2
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: consulting@bugseng.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <9ad46ae1a1f07bdacbcd6a6befd249be95c9d5cb.1753281819.git.nicola.vetrini@bugseng.com>
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
In-Reply-To: <9ad46ae1a1f07bdacbcd6a6befd249be95c9d5cb.1753281819.git.nicola.vetrini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 23.07.2025 16:45, Nicola Vetrini wrote:
> The rule states: "Function types shall be in prototype form
> with named parameters". Add missing parameter names.
> 
> Fixes: 6ff0cfbfd4f7 ("mm: allow page scrubbing routine(s) to be arch controlled")
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>

Can as well take your patch (see [1]), as then I can put it in right away:
Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan

[1] https://lists.xen.org/archives/html/xen-devel/2025-07/msg01682.html

