Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C554CAFC3FC
	for <lists+xen-devel@lfdr.de>; Tue,  8 Jul 2025 09:29:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1036248.1408516 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZ2lU-0006UI-34; Tue, 08 Jul 2025 07:29:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1036248.1408516; Tue, 08 Jul 2025 07:29:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZ2lU-0006SB-0P; Tue, 08 Jul 2025 07:29:20 +0000
Received: by outflank-mailman (input) for mailman id 1036248;
 Tue, 08 Jul 2025 07:29:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mjd+=ZV=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uZ2lS-0006S5-Ft
 for xen-devel@lists.xenproject.org; Tue, 08 Jul 2025 07:29:18 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 41783fe7-5bcd-11f0-a316-13f23c93f187;
 Tue, 08 Jul 2025 09:29:17 +0200 (CEST)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-3b49ffbb31bso1342981f8f.3
 for <xen-devel@lists.xenproject.org>; Tue, 08 Jul 2025 00:29:17 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23c84351a5esm106770165ad.55.2025.07.08.00.29.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Jul 2025 00:29:15 -0700 (PDT)
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
X-Inumbo-ID: 41783fe7-5bcd-11f0-a316-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1751959757; x=1752564557; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=cz/8h5FbvX1O/TaHLqCZXUtwgPJM+fSsMF9E+gvvbWk=;
        b=X2WANibO9fGne+JqsIcvAcW0w6zeGnCungf/Fejqj2ykZGWdEeBPf1VqclyZptdnld
         6fkL3egDsQrnAk/QTzF2iwMLFs/RsqlxkoVYL5Qwe6/tRAHNOPgthHDnZ+JMD6P2MW5C
         Ld9jYJLcxmWov3uenEj/8av6oFPicDR5XMsNXaAQtY6M+dYCVgkxbdB1cT5VQ2RaZ2Lv
         pd5egAVff9Vkf5gyvq+nviW2fiyawOQR/buRQ9O/HvbaOE6Ul+jzxXKG03i6wjBLgT2T
         lmaA/vFHt/vEQekde0Tg7SlTXrS5JOpFJ7VzJqElqTn6qg29XbS50nP+S5aN21uH3EPw
         1uvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751959757; x=1752564557;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cz/8h5FbvX1O/TaHLqCZXUtwgPJM+fSsMF9E+gvvbWk=;
        b=S1sUx2wLPZWAIrMyU3luKFBrr1cBWjMcdSWZTFWMAj37ZOUYoxh1aLC7UlG8fSRtq2
         MGoDQihyZGq5P0+n3Dh/EAYFKTiFClK1VJobBGPxOWk6mWxKkR3SXZZj8IWq87/vm+6/
         ygWGMduaIoWfD19DzWGIUojIsNV6mHPEWVVQ4SbPIb7Qp7iRW9P6MDxWr30jsthgmwpu
         /Wg9X3eNDUHSnVMlQ90B9CMMInigznzINdOTaLeIKLAZIrdemY+p5WkGM0AMGTzoD6/v
         jxMd1+qFimwNz88cTuE2e2bX/wYyaBaJUFSSuh7TmNM+QdpgbikcQWdVh4AW5AkEvX6q
         df5g==
X-Forwarded-Encrypted: i=1; AJvYcCXWu8tUfMfO2dduNhTE9dhm/JawLkYeol86sRp61bW9Wiaq33ibtnb4JZUJTKtW3uACZ8/HIEWMeyE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwjvFjVK4pbfe/HU1hymFiSZWOdx6UxuFuOaktSXrWiyt2JvFhK
	fWKrmiraupEeGk3xYop8hkz7/qtOZE+FgiwyUIeNKRYSdE++bIKYYQTtx28UyD7bVA==
X-Gm-Gg: ASbGncuU7xYosiSe1SH+Ec7BYmW8j8fuT5OFTKql0bAGU4ToAqYEbVTN4d/YPxPPAJO
	AvGKvDbZjnb+PX5/UhpJ8ZvV5iEn23s91/XUUFZ97BtyTJFDJHhP6/vpJc09w4AMQ94L7ggMIvE
	DNg+OFsGuMo/nRFpbDWRe5ArjIe2+qihEzlIEWH+Vur2YtBCHyPfmJpR89H5tDruhO0n3bQ5hzB
	QbdJJpj+bKrNz8MTq9STvfPjt/pMiqM4jDFOt0CgptWICXiYd7aPHwuMtvT3L0HYvmX33J3DtAD
	7cvzQSA30o22KU4X+nh2mk1JjqJP4/+n831H4Yaqt9sa9qLkYWKmfF5kErS9VDlx3E/CEwGuZri
	rOt1H5ZRt9V8m5H39Y3vxmllf1X+dfrEOYTKXkafeEgiHCTWp0vexFT5ynA==
X-Google-Smtp-Source: AGHT+IH4/FJY0L78zizJgD8H05IZUg7Ud1Gomwj+wJj7Jzx09DQ0kO2NkUtAGxAQ4nhiYZ37z/zTIg==
X-Received: by 2002:a05:6000:2f86:b0:3a4:f7e7:416b with SMTP id ffacd0b85a97d-3b5dde94dcemr1253108f8f.16.1751959756862;
        Tue, 08 Jul 2025 00:29:16 -0700 (PDT)
Message-ID: <961d2f58-a5c5-445f-ba76-e9d082c182ae@suse.com>
Date: Tue, 8 Jul 2025 09:29:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 3/5] x86/irq: address violation of MISRA C Rule 5.5
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <cover.1751659393.git.dmytro_prokopchuk1@epam.com>
 <0e289fdb9187902d59dce3fc7368facf5eafa2ff.1751659393.git.dmytro_prokopchuk1@epam.com>
 <70628c7f-5d9b-43d2-8fc6-da79a62d2fc2@suse.com>
 <alpine.DEB.2.22.394.2507071422160.605088@ubuntu-linux-20-04-desktop>
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
In-Reply-To: <alpine.DEB.2.22.394.2507071422160.605088@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 07.07.2025 23:25, Stefano Stabellini wrote:
> On Mon, 7 Jul 2025, Jan Beulich wrote:
>> On 04.07.2025 22:39, Dmytro Prokopchuk1 wrote:
>>> Address a violation of MISRA C:2012 Rule 5.5:
>>> "Identifiers shall be distinct from macro names".
>>>
>>> Reports for service MC3A2.R5.5:
>>> xen/include/xen/irq.h: non-compliant function `pirq_cleanup_check(struct pirq*, struct domain*)'
>>> xen/include/xen/irq.h: non-compliant macro `pirq_cleanup_check'
>>>
>>> The primary issue stems from the macro and function
>>> having identical names, which is confusing and
>>> non-compliant with common coding standards.
>>>
>>> Change the function name by adding two underscores at the end.
>>>
>>> Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>
>>
>> I'm not going to NAK this, but I dislike the transformation done. The aliasing
>> in this case was intentional, to avoid any caller appearing that would bypass
>> the macro. Yes, the double underscores will also stand out (as much as the
>> parenthesization that would have been needed to override the protection), but
>> still ...
> 
> Maybe you can suggest a different name?

As per my earlier reply, using the same name was intentional here. Hence
it's not a matter of what (different) name to pick, but the mere fact that
a different name is being suggested to be used. Yet as said - I'm not
going to NAK this, but I also don't like the change.

Jan

> Looking at the diff, this patch also seems OKish.
> 
> It is possible but difficult to deviate specific instances like this: if
> a SAF in-code comment works, then great, otherwise we have to resort to
> a regex which makes thing harder to maintain.
> 
> Unless a SAF in-code comment works, I think this patch is the best way
> to go.


