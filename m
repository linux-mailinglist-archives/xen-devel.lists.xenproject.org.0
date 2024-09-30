Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B4F5B989B47
	for <lists+xen-devel@lfdr.de>; Mon, 30 Sep 2024 09:20:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.807056.1218236 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svAhZ-000464-Us; Mon, 30 Sep 2024 07:20:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 807056.1218236; Mon, 30 Sep 2024 07:20:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svAhZ-00043m-Ry; Mon, 30 Sep 2024 07:20:13 +0000
Received: by outflank-mailman (input) for mailman id 807056;
 Mon, 30 Sep 2024 07:20:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1QIX=Q4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1svAhY-00043g-8J
 for xen-devel@lists.xenproject.org; Mon, 30 Sep 2024 07:20:12 +0000
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [2a00:1450:4864:20::532])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6e08d5f2-7efc-11ef-a0ba-8be0dac302b0;
 Mon, 30 Sep 2024 09:20:11 +0200 (CEST)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-5c88370ad7bso3543016a12.3
 for <xen-devel@lists.xenproject.org>; Mon, 30 Sep 2024 00:20:11 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c88249540bsm4042270a12.96.2024.09.30.00.20.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Sep 2024 00:20:10 -0700 (PDT)
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
X-Inumbo-ID: 6e08d5f2-7efc-11ef-a0ba-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1727680811; x=1728285611; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=0C8c75/pymvSL/a0y2EXBtHeTKqMXFWopjCGX1muFso=;
        b=RZOTz4n3Czv+230UJpJ5pjGLn4z2wQppssGvFZhFCooq4mRnAOOUD+Vu3AOvoihqNu
         neoJYfrfses1njZtjB/p8raFKjhpTAk3MGL6ZBzifbwqxjmetlGb+hUeYmf0OSgRjwKj
         r4hI5xb2+qXdbHr2ZciOYFvkRZ0E52FLCQNQTbGYEBFqOg3Z0HyaupqhJu79N5IDvacq
         7W/XljtpM7+gOptuS0K1yTEDQ2jBt7++j3rPczYfYYu2GSobMBFvmSAEikbRRCdPdFs5
         HmM1SEdCNsBMXTXF41sZhavVyN6tleqYJepiPZQkZOSXq14ZTyVw6K7BH84KWjo7hRW8
         uoNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727680811; x=1728285611;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0C8c75/pymvSL/a0y2EXBtHeTKqMXFWopjCGX1muFso=;
        b=uuFGc4VqqCR87VeL8hgkGLTQJHTmlElKQznZVs3vFw9OyIheFCHS/xBf2+hqQu7+pc
         jCRXh1pydkfECpTmATG3be7Ua2KNQ2SoWr7wv9UFOCBRO5PupxSStUFxc8P7z1gIk3cP
         dPV+LA6paPtncpFBeNQlRQ1nFAVyBBWq4xj7rXTP4gNx6HGeV1pM9ojiww6VCqPKos9X
         HhYOdzz/SGSKxPPBbeggRgGdgQRz+UVqPoab9NyP4QTJICoT80k+sKU5LyIwGNvennjH
         UbT3DXHa5tyeWHdjjyt2EO+gw2yn+bgGuOwjzruuGjNaFrrIfa5JOhtPcdfFkoyrBxrR
         mOKA==
X-Forwarded-Encrypted: i=1; AJvYcCUoEk38VZcZEei5o9eqHD9UvPE71N8iwIL4w8YrAjBU/KZc+pVz1h9kzXaNC2vnGI1oXHejnau1ciU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzjIika9yQq/5SW5LhYwtQ8M2N3NEEOIwcWvzCYmjpxi31VI44M
	8HnH8GvI2TfiF72t3fvVo9pobXw//bKpEHGBnNvduRrPc4jS2IfW16d4hFQT2A==
X-Google-Smtp-Source: AGHT+IF4iKcYhwGnLvughFVI2+prYHknAKsa6HYtwR/FU4S/F95FTatii4QxlPLRhsI+8Nk9SyWlyQ==
X-Received: by 2002:a05:6402:524a:b0:5c8:9668:45a6 with SMTP id 4fb4d7f45d1cf-5c89668469amr3021434a12.13.1727680810749;
        Mon, 30 Sep 2024 00:20:10 -0700 (PDT)
Message-ID: <12348b6e-2dc8-4b58-b360-578f0fdd8a14@suse.com>
Date: Mon, 30 Sep 2024 09:20:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/6] xen: introduce DECL_SECTION_WITH_LADDR
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Shawn Anastasio <sanastasio@raptorengineering.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <cover.1727452451.git.oleksii.kurochko@gmail.com>
 <e835f07478a528266f72d9ac99c090464522bbdf.1727452451.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <e835f07478a528266f72d9ac99c090464522bbdf.1727452451.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 27.09.2024 18:32, Oleksii Kurochko wrote:
> --- a/xen/arch/x86/xen.lds.S
> +++ b/xen/arch/x86/xen.lds.S
> @@ -3,6 +3,10 @@
>  
>  #include <xen/cache.h>
>  #include <xen/lib.h>
> +
> +#ifndef EFI
> +# define DECL_SECTION_WITH_LADDR
> +#endif

I think either this wants inserting at the very top or it wants moving down
together with ...

>  #include <xen/xen.lds.h>

... this line, past all the #includes (and, much you have it, separated by a
blank line, just at both sides). Can adjust while committing of course.

Jan

