Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 721F1A3BC09
	for <lists+xen-devel@lfdr.de>; Wed, 19 Feb 2025 11:51:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.892644.1301607 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkhfG-0001uB-E6; Wed, 19 Feb 2025 10:50:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 892644.1301607; Wed, 19 Feb 2025 10:50:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkhfG-0001rz-Ay; Wed, 19 Feb 2025 10:50:50 +0000
Received: by outflank-mailman (input) for mailman id 892644;
 Wed, 19 Feb 2025 10:50:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EceQ=VK=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tkhfE-0001rs-NP
 for xen-devel@lists.xenproject.org; Wed, 19 Feb 2025 10:50:48 +0000
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [2a00:1450:4864:20::52f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6079b74d-eeaf-11ef-9aa8-95dc52dad729;
 Wed, 19 Feb 2025 11:50:47 +0100 (CET)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-5ded368fcd9so8833423a12.1
 for <xen-devel@lists.xenproject.org>; Wed, 19 Feb 2025 02:50:47 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5dece1d48c5sm10648398a12.47.2025.02.19.02.50.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Feb 2025 02:50:47 -0800 (PST)
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
X-Inumbo-ID: 6079b74d-eeaf-11ef-9aa8-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1739962247; x=1740567047; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=vHUu5dYvXeXj2jhTFz0dU6Tu2G8gUCGihYLwkXfI6ps=;
        b=fB/5uhv2h25IVy90p6khnvySJrwI6r6LihdSmBdzCuhYsrUckDLUFLVsWDNxLgG3nz
         CgijAhsm8yUr2AFTvNomCuS2W5SU5j2ef8zvwFEPxyLf7r/GZrv4Iv29O7tYcyqvhY7W
         0vsDDftv6gr8vCp+ut6mrBqxfqaDydZGohVQH384nvKaq/lMi8rB9mUY9OocJhq2uxa5
         XawINqUE2n1g+xO5NwPgRkPLdE97hvN//IbguAwHiZYETFADeSZhpjMg9wd91U8Z7qQx
         sHDUWu8chcVtrINRFlUbUV5eStbXSk6QmN8nbIJdoCWQivT2Uj5PARCwfbb8rcY3cPZz
         fXng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739962247; x=1740567047;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vHUu5dYvXeXj2jhTFz0dU6Tu2G8gUCGihYLwkXfI6ps=;
        b=mvhP9HujGDnBnHUjMaFogxHRbxjKRskYtNLWVAv5oGohfi+8A8zFeu7b/wN5jhEBQ8
         5twiSDtfEm234Uvpa5GrUYePeFvOL8uSItxYK0fDCP5cjoLhrUar27Oco/X2zOCD8Kvk
         8g+YvkQYqSxsEnOvShTR39V59MLccj6zV5zD6VGN9xmxJXCLpKR4q/b39y9HgMKUQS5y
         h1mKiGiu+GIgIBCla36Ww+EzaN5pkeFuBBh0m2klgrzURKVJPoXCujhKldeAXBYJdyMu
         4i98zzIBH2A5ljVLzyEMV7Zy32iEGIXZpk4y+T+vPPw9zlM7S85Bl1tgX3ufoMeSTN9i
         hytg==
X-Forwarded-Encrypted: i=1; AJvYcCXmxgBlpavUI1C7BO9Y/KJdpHh9dlyBXTxyD7aXuumdIZ14GR+zylhkqv1LbJASg8oRLynu9MwzNws=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy9NVMQBnC6gcXUHpwWJt9tqVLAQsuYDkkECXbC1VdklcCNgZfI
	RSqTTzSkVKC/d5ch/lAcA/3ppoC114H3fbRkrrCuAabKOO6slW1O7IrsytrLkw==
X-Gm-Gg: ASbGncuNBilqMdzmFz0r5AWqU/8qw54gOx212hnvusoKwcFcPn5ScrTfnjA2wIlRz9j
	k0DQOLQ0Ni4IgwBasRxDpYLVIlfThICgYsRnJDoLwpNGV6KvLBXqyNLyjPJceuj5TI1E9xddVtW
	7cs3wjP/EDEHZjcObg04Ojpp6qvoH8DXSwv4zRBppjkgT/CxB/+faIOLtQi/j7DcD6TB/DdlWFH
	2TovmE3czADN6tpBghjo1TK4ICG1ttU0oSyI84ojAogvWBchf+haUyJPdfviUiPLt/5E+PGsvqT
	1LX7O8phNIyapRW+siQu8jmwXrrkuVeDBm3BdWdwjB3CdBz5j+np+xlK1lXMxvgO4RIDtzvRIV3
	+
X-Google-Smtp-Source: AGHT+IF6KlPwFblbogrXmR3/wq/4hm6Qhoyv0vtrAz7QgAYyWLzb6wVDUNLsKwYTf1QQ0ZBVoNb+7Q==
X-Received: by 2002:a05:6402:4402:b0:5e0:34b5:13c0 with SMTP id 4fb4d7f45d1cf-5e089531896mr3138000a12.19.1739962247243;
        Wed, 19 Feb 2025 02:50:47 -0800 (PST)
Message-ID: <d2628a9f-5af6-4927-9464-6a706346a7c9@suse.com>
Date: Wed, 19 Feb 2025 11:50:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/MCE-telem: adjust cookie definition
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <stefano@stabellini.net>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <bd74b357-b254-4c43-a417-f26434361340@suse.com>
 <84298eb0-42cb-4967-b382-71cb309a7359@citrix.com>
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
In-Reply-To: <84298eb0-42cb-4967-b382-71cb309a7359@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 19.02.2025 11:44, Andrew Cooper wrote:
> On 19/02/2025 10:00 am, Jan Beulich wrote:
>> struct mctelem_ent is opaque outside of mcetelem.c; the cookie
>> abstraction exists - afaict - just to achieve this opaqueness. Then it
>> is irrelevant though which kind of pointer mctelem_cookie_t resolves to.
>> IOW we can as well use struct mctelem_ent there, allowing to remove the
>> casts from COOKIE2MCTE() and MCTE2COOKIE(). Their removal addresses
>> Misra C:2012 rule 11.2 ("Conversions shall not be performed between a
>> pointer to an incomplete type and any other type") violations.
>>
>> No functional change intended.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> https://gitlab.com/xen-project/people/andyhhp/xen/-/jobs/9181587757
> 
> Eclair does appear to be happy with this approach (assuming I stripped
> down to only checking R11.2 correctly, and making it fatal).
> 
> For the change itself, it's an almost identical binary, differing only
> in the string section which I expect means some embedded line numbers.

Line number changes would be odd, given the patch doesn't add or remove
any lines. I expect its internal kind-of-sequence numbers of the compiler,
used to e.g. generate local label names.

> Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

Thanks.

Jan

