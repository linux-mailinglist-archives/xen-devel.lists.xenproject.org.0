Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 17418A20901
	for <lists+xen-devel@lfdr.de>; Tue, 28 Jan 2025 11:51:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.878372.1288544 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tcjBr-0004IZ-2e; Tue, 28 Jan 2025 10:51:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 878372.1288544; Tue, 28 Jan 2025 10:51:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tcjBq-0004H0-W3; Tue, 28 Jan 2025 10:51:30 +0000
Received: by outflank-mailman (input) for mailman id 878372;
 Tue, 28 Jan 2025 10:51:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jygh=UU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tcjBp-0004Gm-7A
 for xen-devel@lists.xenproject.org; Tue, 28 Jan 2025 10:51:29 +0000
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [2a00:1450:4864:20::52b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d390fdce-dd65-11ef-a0e6-8be0dac302b0;
 Tue, 28 Jan 2025 11:51:28 +0100 (CET)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-5da12292b67so9060481a12.3
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jan 2025 02:51:28 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab676116b02sm765105166b.174.2025.01.28.02.51.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Jan 2025 02:51:27 -0800 (PST)
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
X-Inumbo-ID: d390fdce-dd65-11ef-a0e6-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1738061488; x=1738666288; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Woi1AjyI1FT+oY2p5rclMEWbqgTxSC8HyGcRDn0ysiw=;
        b=B+t/fbnhfH9cJuGf0K7nO+sSpX9WbJ+rOtEUJqt+Hazl1zw4QiJzJTrI1lJiA63OMj
         oJygLCLyozIpjoSOgKg2bj7RcCwuFE/UgyaI5Vz050kyOPIPvOvDQbFuTvN9PwpOZbnI
         tH3KTcOBTdFia3ly15n9fZbwAjhwvEHQ7cQ1h1iNiQ6tbQjZoSXdnUA9vhfK4Rf6dDqT
         S0YIYsZopPAuJ34yJlqI0WXXnc/wz6lcDHnbstNnR/ow7+vkfSwE5Ayi6m3vJZ87sGf1
         lhO4Hi7FZE4X514FxBGpz3NgVG85oyeqoW6MSNtIIIzP0Mn+HsfbViHem0RC8LUw2Feh
         z0DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738061488; x=1738666288;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Woi1AjyI1FT+oY2p5rclMEWbqgTxSC8HyGcRDn0ysiw=;
        b=LvhayTGsk+NzXjq3IUsE4LA7hx3yVgYGen4eDYb010eFeV0nu8qPKePHS8aDPW/17k
         uHqCAoj4cJoB5qtMqqnvXH+OYpWvZFXWMOURRvGrz9iVUeDeb6nR+csRSvPUHESMY2NJ
         UzPbE1jKlBFsslTWoOAhHNjHr9MvK+OOaMmRIXVcF8nni0FlKuRK9jOJq0dJ13SzJErd
         pSgBfO2qgFTDfGZd/AaBKPfW2JI5YJs5xaQrnQ0pxUDiu5Di7q+jV2lY3QT5uenZ2W+l
         5V1LlaB48XhkSPXJaFrgb1tuQkTvpfBRTYZaG75E0cH4zPBLFUplPXumLjx8UMlrpaQJ
         OP+A==
X-Forwarded-Encrypted: i=1; AJvYcCVkom3wtQUsLyO5pSw+K+vBnE+5QgIsdij+c0EqLPV/nneLn02+X5FcFXRMoHnKdValGPYnPZygkmQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzShzOPTCnfcYzrIaB9bzSRxiwzCA3qti1y52/+CweglsxoSD6D
	rt6SWk4aIKvK+qLQDeMC6mvoi3PuFYElXf6Y1z/rdPZsQ4Fa987/ARsGbMa+8g==
X-Gm-Gg: ASbGncu1KENgQxQv25T52HD/NAu0KSvTqTcn0VXKdJAPG5Uf4VV6ofD5dLdrY6rPBth
	gL/8ijKDmLaZLoN+LhbbFy/ovIbHfgeR61FRy5pZ3+thbQ80dC9KH0W1z4PgESV4ogkmOOmtQ4V
	3aiaWwGvMp7n5thZ6mwyWfcK87bbA7sS2MGsxjz/BF2Fbk5c4k/0aC4wERLKywADs8mpf6UvasT
	WU68HjfXrmMBwCppfWC8hkcCj8bOb8eZstgNJjNgpFi0ic6KbfIsZby/hQaa4iLOg4sT0fbdVqS
	uEiuKSEOa885/dKiCyJEPUUcTVkGQQ6sAJioQ9xFk6g8eJIH/bjn48OgY6+ewFfoIisfuPA+Tpx
	J
X-Google-Smtp-Source: AGHT+IGJ+5iNb5HdjBkGfdVwByzn5vpLGB90GB2NxnDJhIajNZcdLjQ67Kkn2/OUzkiKVLb+FidUlw==
X-Received: by 2002:a05:6402:34ca:b0:5d0:81f5:a398 with SMTP id 4fb4d7f45d1cf-5db7d2dc58bmr99058889a12.1.1738061487881;
        Tue, 28 Jan 2025 02:51:27 -0800 (PST)
Message-ID: <fefb7445-cece-4fe6-b475-9acb8f551199@suse.com>
Date: Tue, 28 Jan 2025 11:51:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 04/24] xen/console: introduce
 console_{get,put}_domain()
To: dmukhin@ford.com
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Michal Orzel <michal.orzel@amd.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20250103-vuart-ns8250-v3-v1-0-c5d36b31d66c@ford.com>
 <20250103-vuart-ns8250-v3-v1-4-c5d36b31d66c@ford.com>
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
In-Reply-To: <20250103-vuart-ns8250-v3-v1-4-c5d36b31d66c@ford.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 04.01.2025 02:58, Denis Mukhin via B4 Relay wrote:
> @@ -529,14 +532,18 @@ static void switch_serial_input(void)
>  
>  static void __serial_rx(char c)
>  {
> +    struct domain *d;
>      int rc = 0;
>  
> -    switch ( console_rx )
> -    {
> -    case 0:
> +    if ( console_rx == 0 )
>          return handle_keypress(c, false);
>  
> -    case 1:
> +    d = console_get_domain();
> +    if ( !d )
> +        return;
> +
> +    if ( is_hardware_domain(d) )
> +    {
>          /*
>           * Deliver input to the hardware domain buffer, unless it is
>           * already full.

Isn't this a (desirable) functional change for late-hwdom, which runs with
domid different from 0? Such a bug-fix-like change wants calling out in the
description, I think.

Jan

