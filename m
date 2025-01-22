Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CBACDA18CB0
	for <lists+xen-devel@lfdr.de>; Wed, 22 Jan 2025 08:19:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.875780.1286203 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1taV15-0005VD-Bg; Wed, 22 Jan 2025 07:19:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 875780.1286203; Wed, 22 Jan 2025 07:19:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1taV15-0005T9-87; Wed, 22 Jan 2025 07:19:11 +0000
Received: by outflank-mailman (input) for mailman id 875780;
 Wed, 22 Jan 2025 07:19:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XwhO=UO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1taV14-0005T3-1N
 for xen-devel@lists.xenproject.org; Wed, 22 Jan 2025 07:19:10 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2be3d6a3-d891-11ef-a0e5-8be0dac302b0;
 Wed, 22 Jan 2025 08:19:09 +0100 (CET)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-3863703258fso307667f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 21 Jan 2025 23:19:09 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38bf3275901sm15635954f8f.61.2025.01.21.23.19.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Jan 2025 23:19:08 -0800 (PST)
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
X-Inumbo-ID: 2be3d6a3-d891-11ef-a0e5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1737530348; x=1738135148; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=6SJAo92DyDNJXxNIt7nA2UJV2gTXGpGtR/vEGz4DxbQ=;
        b=GRCV8BQN57i1ZVlyRoZz3M+OcUU5oDVkTZ/Cje99oPOKbMw3wNVd3NlXqJh23yATcI
         NEtGJTfN+cL+mP2q/1Cks8L/sDfmI4FOsORFnrI5mYhCOjwLX3pLLwx7VidDbruBIx1N
         cljWxXDCkBRe1r+ZaUgOiglzAk62PK/7LbqkmLZFZKOsr2yYsmdMgCnU/IAgiqpMHPbP
         edp7bd/XIRK97DFi99HO9RiM0DunTXiOJOilz2wHuXJoA9SPRRiRa4bAM3KRgE8YuBjx
         dclSJCmatDepKwbmSCPZ/lfAv5WLNrBdNPZcHHQq9o/VxpZBgx4wED6mPBNdh52Mrm+x
         byzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737530348; x=1738135148;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6SJAo92DyDNJXxNIt7nA2UJV2gTXGpGtR/vEGz4DxbQ=;
        b=pInACeOeF8/B0i6cmoNj5GwaIL6yYy1eKv1UedmC7fMwLs9thN43cv1ECL1HpFTrwA
         4Tr3ySK8CNd0XJcU+tD27Z0uqhLYlfhhYLAv244NfRq5rkKLaBAMAOFDT2MNRRRyESTq
         jPaihOnpaGXPiQkJlLcpViJUzVR6rRv/rnoqWXJ3VtbPXqo0fxmtenp+N0uoPJicKQ/k
         ikWvHGPJmJS6ngbL2BOqQFzi8ITT7KPbDRoc7ZnGczVBekJUccH34ifYHM4QIfta8E5/
         HhSfXqzJI9Z/NOGGriCUA38pMg6By8gtLOw/JKVcNxwpcmFfHQfgCTpmF5UseQNgyZP0
         g7AQ==
X-Forwarded-Encrypted: i=1; AJvYcCV0VOC6DmYKNfFGIprR6avnjtDF6YH4PwSPk8qFoyY19Ccw17DQwJ4DFQnfeO4/wRLMdFeYnnjo60U=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxw99LaxkNSOp+yThWo/+aJ/wHOsOg+SX7gp1yNHxUYMRuNds5e
	Wim5VQ5S/uDGbU/qWVQiuvEyWmoz0uh77lMIhRoCFQdFCtUaoptsa/3IyPHAzA==
X-Gm-Gg: ASbGncvFzgnkSESemPiGZyov4a0M0DXzV74nQfUmTwGGF/ri/rEE2SZPtTQ12khPpTJ
	Vo7qi/OFE464PcyIJuvXglXCj4NJHag5HsjHV6AVWRdFF4PjYmK6VSpeHw+fjhGIeMTou6JrDnK
	ah0VRutYvWcUnuJORfTExHBVIO/u71N/sKpmE4XK6kOx4OEbEWOonSPT3dXUs56XMofmywdqNmE
	DynRHhCGpamDFdpsC9W1cffL+UqQE9UT+2R03pq3+8lOJBXMuFouKUSa1CyQBcoIO9zG7HwCSGh
	VXvQm0j3dYoJmjKFxDmQALcdwGuxiBZmTqX7Pp7X4fBBHKenGB4j5bE=
X-Google-Smtp-Source: AGHT+IH3qI48ShHKGTiTqG5IrLo8zKLfLUJUlAC/orWWS151hSB30Iez6U+DXhV4yyzlpWAPXtaXog==
X-Received: by 2002:a5d:47a2:0:b0:38b:e22e:aee0 with SMTP id ffacd0b85a97d-38bf5b02a75mr17587005f8f.23.1737530348548;
        Tue, 21 Jan 2025 23:19:08 -0800 (PST)
Message-ID: <c490d01a-fe97-414d-8093-b0bff6a12eec@suse.com>
Date: Wed, 22 Jan 2025 08:19:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 01/24] xen/ctype: introduce is_console_printable()
To: dmukhin@ford.com
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Michal Orzel <michal.orzel@amd.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20250103-vuart-ns8250-v3-v1-0-c5d36b31d66c@ford.com>
 <20250103-vuart-ns8250-v3-v1-1-c5d36b31d66c@ford.com>
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
In-Reply-To: <20250103-vuart-ns8250-v3-v1-1-c5d36b31d66c@ford.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 04.01.2025 02:58, Denis Mukhin via B4 Relay wrote:
> --- a/xen/include/xen/ctype.h
> +++ b/xen/include/xen/ctype.h
> @@ -4,6 +4,8 @@
>  /*
>   * NOTE! This ctype does not handle EOF like the standard C
>   * library is required to.
> + *
> + * See Rule 21.13 in docs/misra/rules.rst.
>   */

As previously indicated, I object to such comments. I think I said so before:
_All_ Misra rules are relevant _everywhere_ anyway.

> @@ -51,4 +53,9 @@ static inline unsigned char __toupper(unsigned char c)
>  #define tolower(c) ((char)__tolower(c))
>  #define toupper(c) ((char)__toupper(c))
>  
> +static inline unsigned is_console_printable(unsigned char c)
> +{
> +	return isprint(c) || c == '\n' || c == '\t';
> +}

Why a return type of unsigned (and then not even "unsigned int")? I can't
spot anything in the file which would serve as a reference for this, and
by its nature the function clearly wants to return bool.

I further question the placement of this function in ctype.h: Only console
related code cares about this function, so exposure is far too wide this
way.

Jan

