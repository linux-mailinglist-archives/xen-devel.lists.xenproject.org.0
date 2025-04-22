Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 29288A971D6
	for <lists+xen-devel@lfdr.de>; Tue, 22 Apr 2025 18:03:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.963227.1354252 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7G5o-0004sC-3O; Tue, 22 Apr 2025 16:03:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 963227.1354252; Tue, 22 Apr 2025 16:03:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7G5o-0004pr-0D; Tue, 22 Apr 2025 16:03:28 +0000
Received: by outflank-mailman (input) for mailman id 963227;
 Tue, 22 Apr 2025 16:03:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=f4Vg=XI=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u7G5m-0004pj-EO
 for xen-devel@lists.xenproject.org; Tue, 22 Apr 2025 16:03:26 +0000
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5268f2e3-1f93-11f0-9eb0-5ba50f476ded;
 Tue, 22 Apr 2025 18:03:25 +0200 (CEST)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-39c0dfad22aso3839879f8f.2
 for <xen-devel@lists.xenproject.org>; Tue, 22 Apr 2025 09:03:25 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39efa4a4f2dsm15844535f8f.95.2025.04.22.09.03.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Apr 2025 09:03:24 -0700 (PDT)
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
X-Inumbo-ID: 5268f2e3-1f93-11f0-9eb0-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1745337805; x=1745942605; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=kn6gzp6n3FAtn1xNbobRXBscRY37qdIYkrfqkjjpXH4=;
        b=JaM0nf4SpLL4c7mggarGVMrVMBwDKxOvUfxKTtAI/O3VQ1y/2RyGAdJMRid0vPO7+D
         +Eg7EGzHnmH55Zi4zI8yaPWDXv+Cvv1RhSVN85aLTz3zgy22PPUE1MQw5u3IMp0y+O7K
         FgB7Hz/cU238wxtWD4mLp2yqfChl9Iu3iAccUvyYG807phzHJ/1ZVj0wNPCqgdpcUwlj
         X3N8s01ElaiuFTJQ0B92VV5Lf/wIijnjGUKB48uxwcey+5iV2bbNSTxXzfo9sHaNeCa2
         6fyj9DNIOc42RtScAQF6SDEuvdMgomyT6cJZ8CVyDtLjg56WZxR8mygEPpR8bxX5PQU2
         XPqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745337805; x=1745942605;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kn6gzp6n3FAtn1xNbobRXBscRY37qdIYkrfqkjjpXH4=;
        b=HgJ3o9hOJTEh9PAkyNhTybg2a4pJDN2fCUkuPwJJADBxBL5ICx8Qgoz+wX/Lse2J7d
         3jxeav/o6jgCXbSlCmr4QLHjqeFKatKkOUhKxU1+Jbxcoddscz1oA83Erk9Dh/yOWkDA
         CgOm2c0x6wu1riYvoE3TEvJw+xCHEzyjOl2yVhErtxYGxkx06O8eOSDmysKXZtI2i68L
         nt3x5umRoUIgaN2oRERVfCrI+AuLlMlt1UNtJw2xYmkVL3/pEqoX2tInO7Ealz7niMv+
         HoVR8riZ5Oa9QB8cs73EmsutuA83rRgyf81A2aOBQTBjVzuK0eONzpO2PbyUfkibpONI
         Q5pw==
X-Forwarded-Encrypted: i=1; AJvYcCVjbJ6TaIljWbAH/JJtD9T5hAI8iGregr7T+HqIFm13GPs/qPk16fTw9GyRG87OU2nN4bh8RaymMn4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyX2jYiAinZh+9w6e7IvfIl3tJd9C8KMM/QjVvbbSwNxYXZ9rcT
	sBfEiehuwf9GptT9K6aD3LQdBDfQRwvA+OSB0dog46GdUz2uW1LBKPVj1QTVQg==
X-Gm-Gg: ASbGncszAO6FNIRTlLwYhKPcvi5799F6JhZExSTrGU7E072CZ+2ZkFWDUwgQaa/9ScW
	1aKEifm7qx/hEUWeD/Ael+o1Z4dcBINHQOBHtbByecjIOS+Z1HSN0sp1p6/Ky0xi6eB7ULIRCTC
	2w7RG0FINDfCH5EVJU+guB7VuSoy8s+jLLv5jaZpDYNS8YXE96lGh5EjbWuhg7djTK7aUiNevz4
	jUEWoT9NajWK1ptNpadlmNyk/e83D+8z0juroIM2GjghYYsLf8mJC+pBzMdmttCtQIeNETOkmRs
	yqODdJ5FavQtnRIIfW/5Z2veQg0v8GW1Z0UW3SMpcByl/CNs/Bpbymw4dQ8AL+VpxiVM+fHwlsP
	xEXMwEjo+SoY/CzHaMrQ8dYrbBA==
X-Google-Smtp-Source: AGHT+IExj/zHTJ73WUCPafrrP35p+3Ra0bBzWVe+wggnEG9Om/ibpt6URww4fG0gttnC95CUymnd0Q==
X-Received: by 2002:a05:6000:2503:b0:38d:cf33:31d6 with SMTP id ffacd0b85a97d-39efba2f341mr12989824f8f.3.1745337804873;
        Tue, 22 Apr 2025 09:03:24 -0700 (PDT)
Message-ID: <545079b5-7159-4f47-8100-df387fffe57a@suse.com>
Date: Tue, 22 Apr 2025 18:03:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 05/11] vpci: Refactor REGISTER_VPCI_INIT
To: Jiqian Chen <Jiqian.Chen@amd.com>
Cc: Huang Rui <ray.huang@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20250421061903.1542652-1-Jiqian.Chen@amd.com>
 <20250421061903.1542652-6-Jiqian.Chen@amd.com>
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
In-Reply-To: <20250421061903.1542652-6-Jiqian.Chen@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 21.04.2025 08:18, Jiqian Chen wrote:
> Refactor REGISTER_VPCI_INIT to contain more capability specific
> information, this is benifit for follow-on changes to hide capability
> which initialization fails.
> 
> What's more, change the definition of init_header() since it is
> not a capability and it is needed for all devices' PCI config space.
> 
> Note:
> Call vpci_make_msix_hole() in the end of init_msix() since the
> change of sequence of init_header() and init_msix().
> The fini hook will be implemented in follow-on changes.
> 
> Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>

From the description I can't derive the need for ...

> --- a/xen/include/xen/xen.lds.h
> +++ b/xen/include/xen/xen.lds.h
> @@ -187,7 +187,7 @@
>  #define VPCI_ARRAY               \
>         . = ALIGN(POINTER_ALIGN); \
>         __start_vpci_array = .;   \
> -       *(SORT(.data.vpci.*))     \
> +       *(.data.vpci.*)     \
>         __end_vpci_array = .;
>  #else
>  #define VPCI_ARRAY

... this change.

Jan

