Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D639CB9DA38
	for <lists+xen-devel@lfdr.de>; Thu, 25 Sep 2025 08:34:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1129942.1469626 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v1fYm-0003jD-RN; Thu, 25 Sep 2025 06:34:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1129942.1469626; Thu, 25 Sep 2025 06:34:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v1fYm-0003h4-O2; Thu, 25 Sep 2025 06:34:32 +0000
Received: by outflank-mailman (input) for mailman id 1129942;
 Thu, 25 Sep 2025 06:34:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vOWa=4E=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1v1fYl-0003gy-3G
 for xen-devel@lists.xenproject.org; Thu, 25 Sep 2025 06:34:31 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b011a4d9-99d9-11f0-9809-7dc792cee155;
 Thu, 25 Sep 2025 08:34:29 +0200 (CEST)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-b28e1b87aa7so89798966b.3
 for <xen-devel@lists.xenproject.org>; Wed, 24 Sep 2025 23:34:29 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-634a3b052e0sm652782a12.47.2025.09.24.23.34.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Sep 2025 23:34:28 -0700 (PDT)
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
X-Inumbo-ID: b011a4d9-99d9-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1758782068; x=1759386868; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ozP4ICgetyfPLvldh5KQA27y5QCFNaRSs6nV+auII+I=;
        b=aLTCH3kQ5u+DL6rAVki/B+42T0lWDUnK1ZRwn6HQxuDZ0yR+1zav5SW7CBU1jAI9Bd
         AsJnSKWQu7mS8srv01zlkboBNikmmdcRH8B2RWQscqYIx3VyW668xWA47jhSYgjmpC1I
         Fy2ioQq+GOJTFirY3/YJOLXH6bWTCRrRMcpGxsijBDWw4S9TtRU36Gto/3lfkz2bnQFH
         pfJxAOVs9HXs+kJfPUWk4a6Et8KTGiIMJIgzLIFzn9RwrFVh9kiiIQ9SFePQyJI6U2Hh
         O2YeJLOceofxfNvObv0tbNOXnf2FmhksP46F2/M7HMtK9ZnUHEQK+TMVWd9Gt4QX92SO
         4YPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758782068; x=1759386868;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ozP4ICgetyfPLvldh5KQA27y5QCFNaRSs6nV+auII+I=;
        b=DyZ2v7kxVeAUd1GZLro7Frckj7fH590UGgVp2T/3BIUwVEzxdv+ohQ3Rps8McBInCu
         KAL2NOjkBCPmiSGTtqsIk9PffLtjwTWPi2kPyTqhzV41Wc9S3piPNEAtPmg6xQVGOx6O
         QrNG0xTXwry/tSytTG4IQWzwhX8x/Bz17WQELVlsXjHEz+h4J5oj4fhBqjPhYBH8hGRh
         obajf5wc4IYfOEkv1MxH55HqjzOSrWEqgd3y1g9PJng6GH5IAKSGrmqbMCWdIE0GxBDB
         bfjRmV7byRD7vbQJ7NSc5rMx9Ta+LM5qzQM+CPk7jX7a7JzqdMOHviLPyS2ivPLg16Ia
         7C9g==
X-Forwarded-Encrypted: i=1; AJvYcCVrwqxlAZ1sidS7iKYj/IoBt4xxzPSmJfN1Tbpd6ND9A5mXtWgk6Eb7E/UetuITkZX722xzFVeLrDo=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxB1kbj7UsZT8fetCOXbdWX1P0evnAxV1PMaxsnI7579sTelWH1
	Yj8v8YwvwX5rL5TXsGoYVgGvQJXEc4DF+XSIpMXcR3gY8h44Smp/gZYV9QrQlWLXiw==
X-Gm-Gg: ASbGncv7PiDAxri54rTWtyu5lZm4x2CFaMgRpFEZQyMJtpbQDf0rkyzAUDG2lBk6F5j
	5JYLo880Bhn6kfbLOtJD6EJxZI/Ix4nK8YmlWgRwcqg0caRgOBMx9C3AtPbXsiepLCoQLPf0MAD
	biOQq8OEanGpKhP3DVFZ1ApO6MknqMKjz93f5PTx5ryyUUZERbNfyGxab/UrhI4hlvmvG77EQxs
	13XjbPhZLC207vPOKQ8qv7YBXMEy1oQgOjIVIqKB8dVeiE8M06/yJUsnCIRfwHTGhHkj1cUHe1t
	jWI4my2d608UuIu3WPnaWPv1H09c92X6s0xPKj5kIVp6Bgaop3JTtiFjk3BJo2vdTKtRbco42Cs
	sQKSI3ufv30nI4jZqmqsFQCFe3dQWHU5HHup5v0kwG/bmOdt/8xvOPh9zDSSz1qwX+6PVtUxjZN
	EyeWCoBxU=
X-Google-Smtp-Source: AGHT+IHzLCTXuKAPq1YsMXuj+To6GOOACzY7Bx/GCZC4Q4Waa8Q1tRyHjTVFuuopP6tPuIJSZtLR6Q==
X-Received: by 2002:a17:907:1c15:b0:afe:87bd:da59 with SMTP id a640c23a62f3a-b34be2f5318mr221327666b.42.1758782068489;
        Wed, 24 Sep 2025 23:34:28 -0700 (PDT)
Message-ID: <9507e775-f9c3-4351-9c76-ca939c1147bc@suse.com>
Date: Thu, 25 Sep 2025 08:34:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] xen/arm, xen/common: Add Kconfig option to control
 Dom0 boot
To: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Bertrand Marquis <bertrand.marquis@arm.com>, Julien Grall <julien@xen.org>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <34e1b5036361745db2fde233e0935a568c0ebc90.1758729618.git.oleksii_moisieiev@epam.com>
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
In-Reply-To: <34e1b5036361745db2fde233e0935a568c0ebc90.1758729618.git.oleksii_moisieiev@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24.09.2025 18:00, Oleksii Moisieiev wrote:
> --- a/xen/common/Kconfig
> +++ b/xen/common/Kconfig
> @@ -26,6 +26,14 @@ config DOM0LESS_BOOT
>  	  Xen boot without the need of a control domain (Dom0), which could be
>  	  present anyway.
>  
> +config DOM0_BOOT
> +	bool "Dom0 boot support" if EXPERT
> +	default y
> +	depends on (ARM && HAS_DOM0 && HAS_DEVICE_TREE_DISCOVERY && DOMAIN_BUILD_HELPERS) || (X86 && HAS_DOM0)

This line is too long, and really would have wanted to be broken up anyway. Clearly
"depends on HAS_DOM0" can be separated out. I'm not quite sure about the extra
Arm-specific dependencies: Are these two really Arm-only (as in: not also affecting
e.g. RISC-V)? Furthermore, what if I turned this option off for x86? Doing so would,
aiui, have no effect at all right now. An option without any effect imo better
wouldn't be exposed.

Jan

