Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 027679EC5CB
	for <lists+xen-devel@lfdr.de>; Wed, 11 Dec 2024 08:43:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.853965.1267286 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLHNZ-00037D-Ez; Wed, 11 Dec 2024 07:43:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 853965.1267286; Wed, 11 Dec 2024 07:43:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLHNZ-00035Y-BR; Wed, 11 Dec 2024 07:43:29 +0000
Received: by outflank-mailman (input) for mailman id 853965;
 Wed, 11 Dec 2024 07:43:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2HaM=TE=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tLHNY-0002V2-Gq
 for xen-devel@lists.xenproject.org; Wed, 11 Dec 2024 07:43:28 +0000
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [2a00:1450:4864:20::42c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9b1fc504-b793-11ef-a0d5-8be0dac302b0;
 Wed, 11 Dec 2024 08:43:26 +0100 (CET)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-3862a921123so3732739f8f.3
 for <xen-devel@lists.xenproject.org>; Tue, 10 Dec 2024 23:43:26 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-7fd50fe6a58sm3540740a12.11.2024.12.10.23.43.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Dec 2024 23:43:25 -0800 (PST)
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
X-Inumbo-ID: 9b1fc504-b793-11ef-a0d5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1733903006; x=1734507806; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=yecfDviozleLFbgf+wyb3xikWvF3rFEw92atT8UgzD0=;
        b=bR/EQE5753bQJ1Oz3Sdc5tyUKPtLKOJFIL6KB6fm6p9cvewEO1+LMdXfwwh5aGz0l8
         r30pvxZsd75akkomust8Rcoz5tRJGidrg8k9yxiJzzYm6zpcf3SARRktOcBx48Oxcnmf
         /E+EorHlYiLwxgVJSDjGrvB+ztdB3C77O5XC+qaLh4z6pTK6J18TAkuSPw0omGNCOQ+Q
         vrCEGXHxDuxqIwwmw7loQAB9IYiMsugSzAM0La3ZppKguUVwiPYnOTx13PuNu4dL3BOC
         9DzwSmfV/ctgqAhlDexLZ+XgC7/1meLD/rSWl/3k0ACnUvD4VRaqLDTDgsOcrQIFOI7g
         mtvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733903006; x=1734507806;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yecfDviozleLFbgf+wyb3xikWvF3rFEw92atT8UgzD0=;
        b=h+9XJYZBib5b5UKE0Uon6b7m8XRJyJn8MSwszwv1b9qFQfpHdyWlYV8lENsujYtmnp
         cVlM82LifuotM5Lial1NwDSgCMCqwsOWaK4xuk2A3HoaRwsZDsmowt2WQhqIE/1NdZNm
         NPJuGD/4HTJ/OLad2jKDadNgU9hoGm2QeDD87ca8OyRGSGbVxZ8PKiyt/KR2YcO0Sxt1
         F1EFQ3JfmU2gR1LJtW1lwTTrc84BTzuqLIcFWcCP1foYh/hqGZP0tUclTSpHJFB53xw4
         oAHEdGO2h5Cx1/ZNb/GIkjEecECd3bKqoi2KCVwvMGH6daJrPzGrt021yL0eDAHR8+tJ
         3adA==
X-Forwarded-Encrypted: i=1; AJvYcCVdw3dWdPIeXLAkwZ7IkcEu7PGNQT74CtqdcJbwsbjMtCwJkHGHsO0r+pe5vymyx6t3VadlMNAhp6Q=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw3uhrzMHBMuI27t77JPCoR+ILm9GxF/elSuxrkJPMANOLCnAsP
	n3mPRMPEHUIluOz3iDRGy4YzE4eAzjO3T3sbakOJWpnepqhAFS7RbqtsfLQUFA==
X-Gm-Gg: ASbGncvQJfGkH1XMXDqYwnKYyPy1XkwKibuR5J+/zeih+vId5nbs6ARZIHaGdvsblW4
	cNlqkJEdSfAGUzhGjE1LtFxg1JRLOW0ifghQeGlz48cOkM2LsyGL73TrmjacoU8OuOwzt5Fg9rb
	CxlQgA218WIbgip+86kZS6mAjek0ojQk0hPScuz+XzsSdbbtXTpXmi1eewrEEbzeipxImkotR7w
	AU3RI7lSsZj4osI0OSBeN2DBLfXHbKgsW4BezME8YJX+2mCIad2A3WxUi2WUxqokxrlPYqpsvm2
	YaNPsIMkwle4PcNVpSe0+GzC5KNKWRfSQFFYoEU=
X-Google-Smtp-Source: AGHT+IGRB4Ux5OMiNJKTPqsP7hwft1q5TrVt1iybNQhpEfThW7Q7LDvpNRHt1y3M5ZPniC2hBAX66Q==
X-Received: by 2002:a05:6000:400c:b0:386:3560:477f with SMTP id ffacd0b85a97d-3864ce96ec6mr990134f8f.23.1733903005715;
        Tue, 10 Dec 2024 23:43:25 -0800 (PST)
Message-ID: <a145bd2a-face-414c-b553-0fdd6220b195@suse.com>
Date: Wed, 11 Dec 2024 08:43:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] MAINTAINERS: add Anthony, Michal, Roger to THE REST
To: Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
Cc: kelly.choi@cloud.com, anthony.perard@vates.tech, michal.orzel@amd.com,
 roger.pau@cloud.com, committers@xenproject.org
References: <alpine.DEB.2.22.394.2412101558000.463523@ubuntu-linux-20-04-desktop>
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
In-Reply-To: <alpine.DEB.2.22.394.2412101558000.463523@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11.12.2024 00:58, Stefano Stabellini wrote:
> In recognition of their outstanding work and years of service to the Xen
> Community, please join me in welcoming Anthony, Michal, and Roger as
> Committers and REST Maintainers.
> 
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>

Acked-by: Jan Beulich <jbeulich@suse.com>
albeit ...

> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -662,8 +662,11 @@ K:	\b(xsm|XSM)\b
>  
>  THE REST
>  M:	Andrew Cooper <andrew.cooper3@citrix.com>
> +M:	Anthony PERARD <anthony.perard@vates.tech>
> +M:	Michal Orzel <michal.orzel@amd.com>
>  M:	Jan Beulich <jbeulich@suse.com>
>  M:	Julien Grall <julien@xen.org>
> +M:	Roger Pau Monné <roger.pau@citrix.com>
>  M:	Stefano Stabellini <sstabellini@kernel.org>
>  L:	xen-devel@lists.xenproject.org
>  S:	Supported

... isn't this meant to be alphabetically sorted, in which case Michal would
need to move down a little?

Jan

