Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A520A54AB9
	for <lists+xen-devel@lfdr.de>; Thu,  6 Mar 2025 13:32:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.903455.1311338 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tqAOV-0006rb-2b; Thu, 06 Mar 2025 12:32:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 903455.1311338; Thu, 06 Mar 2025 12:32:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tqAOU-0006oZ-Vk; Thu, 06 Mar 2025 12:32:06 +0000
Received: by outflank-mailman (input) for mailman id 903455;
 Thu, 06 Mar 2025 12:32:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qAxi=VZ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tqAOT-0006oT-SM
 for xen-devel@lists.xenproject.org; Thu, 06 Mar 2025 12:32:05 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 02ad02f9-fa87-11ef-9ab4-95dc52dad729;
 Thu, 06 Mar 2025 13:32:04 +0100 (CET)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-43bcc04d4fcso3713935e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 06 Mar 2025 04:32:04 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3912bfba8b6sm1957241f8f.11.2025.03.06.04.32.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Mar 2025 04:32:03 -0800 (PST)
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
X-Inumbo-ID: 02ad02f9-fa87-11ef-9ab4-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1741264324; x=1741869124; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=gDc/NFhDcjIQTDf+EtoXi4cxVvwJwbJMAMyY8Q0o4Ts=;
        b=DdCdnLItwi1SEQgyqhgpYa/Frp/Ix9dx4KLBXtKH68GxVpoAayFZB89UbtXh39N7Bm
         g81pBketbV4EPV3qwQzZRTO7xtgpyf5LwzU/IZjv0lKedvy2vtr+/S4qiMWGYqZ/y8TB
         4ZvfXGyB6C8gz375VMmLH3Fxy5XdUJgsF0sHSi2S50gjgjKFutMaHiQORTpqcEdYgkrJ
         Mmd6F5pN5vb0G+cMSeO3lRLfCLqZC4MsqjUzcSzrA6NC/yZif4MCle4ScoPDozKlGg3F
         5Iop0RuxqKLofodyN7J4UlyuVDIIDloU+6CwzFu6n1UOor/iBzgWWpfDCZ3KGeooqrSr
         p7Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741264324; x=1741869124;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gDc/NFhDcjIQTDf+EtoXi4cxVvwJwbJMAMyY8Q0o4Ts=;
        b=C3aDqKyxGhFq9opijK3cc+DfYDGiuXNVlobBTpw+oYb7eVXOV73aOTXdzXpvAI8N3g
         WhapUxOXOmRfCuaiI4p2ts+lSAaapdp7JgqCZEfTlshsb4k2iEtRR5naWrSqApxTFU4x
         x83FM7nQZOFK0i3+OGTl+PCbf4peXZCGjTeOCevIfErUf6HZhtmXFBmAO8zhQ26HP5Eh
         W0j6cyMuZdAOy1wq2vLKshFRd7vOrPDjm4eE9ct6r1oiiIGEJ6uWGfWXr5MzuwgpsBf3
         LnJvE/2CRQuPJRy0nyjSKSnqBOZgF+p/mYiDEwzQZWD3+xbxGLNTxMkveo8eSCTT0Wut
         6JEw==
X-Forwarded-Encrypted: i=1; AJvYcCUknC3Y6bgqerjxHPt2EXXCXWb2vS2q0oJZvmGxZWVPtIpJ8dtevuvHVzyvsV50WnApqxFEFOWdi6A=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywc0az17zsBECryfCqVnpBIvAyN+YNLfXQSh962grIZssSpS0tE
	+m1djZnIXwoDNHl/ppZBb6vSqrEmwOx7/UyIbjBEBl2J8qDh14qe2ES7fXf3zQ==
X-Gm-Gg: ASbGncvDq6R8UxNW4sGDJH7xbej4g/iu5x2e/Zeb7UqaVyt84cl7xZLCB/y8xOM8NIT
	IGWIt8FDGGKmEuyauMoFWH9IEr/0HPyv8oP/UCpy7vJDhmNbb7yM8xXTyL5mZ1ri3sRJkJRKs3o
	1q8XTccC3Mi+T8YJOfcHr7EzckpzQfKBJ08kGNgAWQQ4Kmqvx/GoKKIzvGbCvxOL4bJ7oN3L+6S
	L4XApCZ6EkOhyF7XCCPAKQYaGmn00v0XaS18ACXZhufFVlBnoMM+3mhyysZSNX86yQBX4g0jnbu
	LtQglOd1iIFTQUnbxa+7MlTEH+WgYzPkpQmLRteyNIssi2XB/clMklgQeP6ukhgZqVQqw4SZG9V
	ircSDF57ZSdHrdOYgW6PzIfDfI4e6xA==
X-Google-Smtp-Source: AGHT+IF1u3ZzzSkMEQ1muyjixuC3bMaujrv9qY/KJA/p9/BOE6/APdKQZLymkU/iqM4WpwnjX8TZ8A==
X-Received: by 2002:a05:600c:3ba8:b0:439:955d:c4e2 with SMTP id 5b1f17b1804b1-43bd29a3182mr49234155e9.13.1741264323908;
        Thu, 06 Mar 2025 04:32:03 -0800 (PST)
Message-ID: <70436c18-a916-46d9-befd-56e1780d92a4@suse.com>
Date: Thu, 6 Mar 2025 13:32:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs: specify numerical values of Xenstore commands
To: Juergen Gross <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20250306122426.4351-1-jgross@suse.com>
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
In-Reply-To: <20250306122426.4351-1-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 06.03.2025 13:23, Juergen Gross wrote:
> --- a/docs/misc/xenstore.txt
> +++ b/docs/misc/xenstore.txt
> @@ -86,6 +86,65 @@ parts of xenstore inaccessible to some clients.  In any case passing
>  bulk data through xenstore is not recommended as the performance
>  properties are poor.
>  
> +---------- Defined Xenstore message types ----------
> +
> +Below is a table with all defined Xenstore message types (type name
> +and its associated numerical value).
> +
> +Some types are optional to be supported by a specific Xenstore
> +implementation.  If an optional type is not supported by a Xenstore
> +implementation, Xen tools will continue to work, maybe with slightly
> +reduced functionality.  A mandatory type not being supported will
> +result in severely reduced functionality, like inability to create
> +domains.  In case a type is optional, this is stated in the table with
> +the lost functionality in case Xenstore doesn't support that type.
> +
> +XS_CONTROL		0	optional
> +	If not supported, xenstore-control command will not work.
> +	XS_DEBUG is a deprecated alias of XS_CONTROL.
> +XS_DIRECTORY		1
> +XS_READ			2
> +XS_GET_PERMS		3
> +XS_WATCH		4
> +XS_UNWATCH		5
> +XS_TRANSACTION_START	6
> +XS_TRANSACTION_END	7
> +XS_INTRODUCE		8
> +XS_RELEASE		9
> +XS_GET_DOMAIN_PATH	10
> +XS_WRITE		11
> +XS_MKDIR		12
> +XS_RM			13
> +XS_SET_PERMS		14
> +XS_WATCH_EVENT		15
> +	Not valid in client sent messages.
> +	Only valid in Xenstore replies.
> +XS_ERROR		16
> +	Not valid in client sent messages.
> +	Only valid in Xenstore replies.
> +XS_IS_DOMAIN_INTRODUCED	17
> +XS_RESUME		18
> +XS_SET_TARGET		19
> +XS_RESTRICT		20	no longer supported
> +	XS_RESTRICT has been removed, the type value 20 is invalid.
> +XS_RESET_WATCHES	21
> +XS_DIRECTORY_PART	22	optional
> +	If not supported, the output of xenstore-ls might be incomplete
> +	with moŕe than ca. 1000 domains active.

Nit: Odd 'ŕ' here.

Also the 1000 domains boundary is just an example aiui, so you may want
to add "e.g.".

> +XS_GET_FEATURE		23	optional
> +XS_SET_FEATURE		24	optional
> +	XS_GET_FEATURE and XS_SET_FEATURE must either be both supported
> +	or both unsupported.
> +	If unsupported, setting availability of Xenstore features per
> +	domain is not possible.

Why would GET_FEATURES alone not be permitted?

> +XS_GET_QUOTA		25	optional
> +XS_SET_QUOTA		26	optional
> +	XS_GET_QUOTA and XS_SET_QUOTA must either be both supported
> +	or both unsupported.
> +	If unsupported, setting of Xenstore quota per domain is not
> +	possible.

Same, maybe to lesser degree, for GET_QUOTA.

I'm further uncertain here regarding your use of hard tabs.

Jan

