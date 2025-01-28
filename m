Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C6BF6A20DD0
	for <lists+xen-devel@lfdr.de>; Tue, 28 Jan 2025 16:58:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.878601.1288787 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tcnz8-0005iH-Es; Tue, 28 Jan 2025 15:58:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 878601.1288787; Tue, 28 Jan 2025 15:58:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tcnz8-0005gb-Aq; Tue, 28 Jan 2025 15:58:42 +0000
Received: by outflank-mailman (input) for mailman id 878601;
 Tue, 28 Jan 2025 15:58:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jygh=UU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tcnz7-0005gU-73
 for xen-devel@lists.xenproject.org; Tue, 28 Jan 2025 15:58:41 +0000
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [2a00:1450:4864:20::52f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bdd32946-dd90-11ef-a0e6-8be0dac302b0;
 Tue, 28 Jan 2025 16:58:40 +0100 (CET)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-5d3d14336f0so9878456a12.3
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jan 2025 07:58:40 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab675e124fasm802633766b.22.2025.01.28.07.58.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Jan 2025 07:58:39 -0800 (PST)
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
X-Inumbo-ID: bdd32946-dd90-11ef-a0e6-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1738079920; x=1738684720; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=euMZ8VO56xTjyz+Qq21x3Voc1RfClAZu5uDyO4I8Lac=;
        b=GjF6Z3JxxILCfL6RorWIlyJI+Qufdg1OZ79OoZT71UTiLnlzUgVWtDsZ62kREtNpJx
         f+QPe+JWFZh5lB0YfSNIb1c0mI9ifr+LJA64QMDyA+Bne5fbxEHgNBWvjnODRIVCXnHC
         2CVzJn5ALsTvcWnkVFgE1V/g2fXb/+CCIawRTN3bbu0WmOvr90KMCR24e+urxj3DqRiP
         adtNe8bKV47BFIXupDUEEXnU5zac7FeUpbLjpKJzJmI2cyh9hN3dMqw8H3XCwSNk8CRA
         c3fZeQpgDSyPwxP3PzUTM0etj/f6v+wUJvkXJw2u+ZIf/DAKhaKFuLecwQgtXJ8x43gV
         Tx6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738079920; x=1738684720;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=euMZ8VO56xTjyz+Qq21x3Voc1RfClAZu5uDyO4I8Lac=;
        b=kdGf7bnn34ex0dAcxaqU3v8V+hIVAmMpWmXyDY/u4hes3IX9zl0pqSCL/1L9PR4Ktc
         Owt1EFeu7gd035M4+IQrxszYtxxZ6lg/u9xs2yVXSVqHgLHpLNmIRi0B+R2Dsbs4WcTw
         TA+0fAglm1AVhpEDXeQh3frjB/KEAToOwblz8wyTCGmwhePW7ZvuikmKvkb5AtNHfXse
         W407JhDySw9GFh3OTreRovZn2hT1/9eg0VVV5fJq8jB+3KWFFYE6rZvbd2YcZPyDS6oZ
         JmCCHHFzCiRobeAIMiHnJXOVOuNGdKzBMygz98ZhpdyKmi3WycR48Fk/aPcxHk4Nnu32
         nw5A==
X-Forwarded-Encrypted: i=1; AJvYcCUB3vGMdkAZaNz+ljJgHCCQ40/65KSCdN+lFLnF5qkcZQULluMno+AynSHYm43MhXNIEmVNp2upKoU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyKsnVg3cTSLyyy28VvCoKjlA5FKGZ/msHlCwNA3ICGUh/qTpCt
	SYhtMl8eAnuacZOha7n2+czUQXHRyb7kv2lZYl8rQ3bHQXY3Ql7jh+ODUMbe6w==
X-Gm-Gg: ASbGnctkuSvf7v5mXHchcUBo+jBcgcWzOGA2bGrayPcvAsi+JXhiyROZhKLueUQNDNa
	L9MSxFuJVm2gMAuPFC0wjnzObva8jXnD3WjkHISw1+1eeNJPhP8YcdX23b3rjIUNxSLiM9Ug7B4
	kEeV5jE7amCUE6OD2BcRpFpmPPQ7yGFJrE6xB3cdVgQLuuXS+X+8dM/9XfyRYD7RkPgDVjNsNMz
	RSUcetudjk+WMsxg9Le/zix/L+5LvfBsqJIjRxAWbQIbf4JRxjwOg0pmIP3gAy4TUMaFg39JBJ/
	OwYkMDYNvwbW7AoPlNh7/j2+HCWXqUCeqs9Mz4ecYqDFn4h2D7IkVjW0u1NjkfhoT8YmWeqWcJV
	h
X-Google-Smtp-Source: AGHT+IEzt9CYU0p2BNDPNv/n7KxwShSyq1miGS2BI6UfJ5HHSd3kci2yuINog1ecaBWpgkl1gqk3Gw==
X-Received: by 2002:a17:907:2ce3:b0:aa6:8d51:8fdb with SMTP id a640c23a62f3a-ab38b240a67mr4038528466b.19.1738079919695;
        Tue, 28 Jan 2025 07:58:39 -0800 (PST)
Message-ID: <47503710-f70d-40f3-8d45-cf6f517ec415@suse.com>
Date: Tue, 28 Jan 2025 16:58:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 14/24] xen/console: simplify console owner switch hint
To: dmukhin@ford.com
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Michal Orzel <michal.orzel@amd.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20250103-vuart-ns8250-v3-v1-0-c5d36b31d66c@ford.com>
 <20250103-vuart-ns8250-v3-v1-14-c5d36b31d66c@ford.com>
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
In-Reply-To: <20250103-vuart-ns8250-v3-v1-14-c5d36b31d66c@ford.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 04.01.2025 02:58, Denis Mukhin via B4 Relay wrote:
> --- a/xen/drivers/char/console.c
> +++ b/xen/drivers/char/console.c
> @@ -518,8 +518,8 @@ int console_set_owner(domid_t domid)
>      console_owner = domid;
>  
>      if ( switch_code )
> -        printk(" (type 'CTRL-%c' three times to switch input)",
> -               opt_conswitch[0]);
> +        printk(" (type 'CTRL-%c%c%c' to switch input)",
> +               opt_conswitch[0], opt_conswitch[0], opt_conswitch[0]);

I view this as ambiguous: It could mean Ctrl-<?> Ctrl-<?> Ctrl-<?> or
Ctrl-<?> <?> <?>. Plus again - how's this related to the goal of the
series?

Jan

