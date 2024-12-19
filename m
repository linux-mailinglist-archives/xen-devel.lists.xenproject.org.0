Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F4C59F7662
	for <lists+xen-devel@lfdr.de>; Thu, 19 Dec 2024 08:55:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.860819.1272796 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tOBNI-00071U-OV; Thu, 19 Dec 2024 07:55:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 860819.1272796; Thu, 19 Dec 2024 07:55:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tOBNI-0006zL-Ly; Thu, 19 Dec 2024 07:55:12 +0000
Received: by outflank-mailman (input) for mailman id 860819;
 Thu, 19 Dec 2024 07:55:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nfYH=TM=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tOBNG-0006zF-Ei
 for xen-devel@lists.xenproject.org; Thu, 19 Dec 2024 07:55:10 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 90eef019-bdde-11ef-99a3-01e77a169b0f;
 Thu, 19 Dec 2024 08:55:08 +0100 (CET)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-4361fe642ddso4652905e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 18 Dec 2024 23:55:08 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38a1c832ec4sm895511f8f.26.2024.12.18.23.55.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Dec 2024 23:55:07 -0800 (PST)
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
X-Inumbo-ID: 90eef019-bdde-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1734594908; x=1735199708; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ZJp7w+mf3vnysHaUf7gQZHO0NY4fqBlb6ueDSPuhat4=;
        b=G+9l8Jsr1TITe6RvAUIwkymK2pM1hJeGG7D+6QqVC+vJgfC/SFdA3RN4IxR+FhM6G/
         bYIsy+tTHsVUY8FUDJqeqvZD8tYm7KZxX4MGixPNUgyX4UEeUwPP9l811U3+LI3IXNBS
         06AmhxMo+fTOIlIX5p1ini0xtrf4/ubY1E+NMXW74NPv/M33ZWt14lYrFIKS/AvSIz1r
         8KSR9eeyDej1uJI8HxsImMnXhmB4XvbzHHry1eqQ3n7Gy72rf3chEMvRJcY2ENi1PqZk
         k3+YeKbqt5d1XayvRDAXrcGdXdIbWFBd5KlKcdRiJFXhkvRb9TXgRfipf/G5SPi5VTzC
         snjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734594908; x=1735199708;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZJp7w+mf3vnysHaUf7gQZHO0NY4fqBlb6ueDSPuhat4=;
        b=GGtcWaXiKUSVXK2LlwJr6jwZyYgupVTsp2GlZg7zA6k2XZcnRfQpmyAvcrYXhAhZcx
         fyjRkI5nT/V1nTwX2XjG6SwyuFjpjMnJomV0Ahr0azXd9yYb9ZufX5x1a9xzWHlL4YMx
         GtM5moIoRMURrvmlua6rfO9vQ2n0dtf7R2WgGtageYxgyTieCP1TPeZuQTCv8kRF6IjA
         0UnotENCNVLe7W48IkaQuPl1ilOasjO7l09FeoUdwGScjJL/3QbAPxaPzVogpskDmUaG
         4+BiEKj3WNyqQDzc8M2rHSikTqht98zpuIMUK+TxPuevS2xJuKaun9yEi/o7YC+mQV17
         JkFg==
X-Forwarded-Encrypted: i=1; AJvYcCWdgKjKR6UWVZpsmTTYpeY188wdSQf4A2K7ourBXRZARCfBvqh8Veo3DFXDP5z5IXNO5GrK3Ls0JmI=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy7iZ7Wo2qlcV458v+PZfLezXiFzuRY8f/ACHLCToeKgd0oPVjN
	hcBGq5wOXoCt8V4tglc9xEA/htxZo0Oaf7h/e8g03IuwTnhF70XPLnj0AxL5Qg==
X-Gm-Gg: ASbGncttppTzkTRFDTX1nzYhr9DRcSCDp2E8Y90R2XA+zWCLRYIeRHa70Pg7/dZ1+/q
	NhpDHwFQSA3YHKG16KmoegYkG0J5GDPZ9x2qZYQRElYtut9GxCdJ228wJzfW3CAAkIS6nNsYPDl
	YkYdLpVjiLlGL7wgGlURfWfnPb/o//VPThCTpil8gKJ60YI75xHi2u2fXLcUN7vuGzrSa9xFW3u
	6tgeBOJ4YU8yJLtyBXKR3Nc1TZZnpYVvyxXipYepChIOSF0QJI3Sy+LXOfgRXB6roG2Y2v6OhpQ
	ARf4BWQDMC2DQA4b6Ql9C011EfU0DFhvXm4VhQpHHg==
X-Google-Smtp-Source: AGHT+IGu8zKmxILKhViy32LkRnz7htuX2vIXctqry2GOPygmJYKufnVQ/q0E7Jg+TB3GjFgHvAy0cA==
X-Received: by 2002:a05:6000:1f89:b0:385:fd07:8616 with SMTP id ffacd0b85a97d-388e4c97076mr5793694f8f.0.1734594907867;
        Wed, 18 Dec 2024 23:55:07 -0800 (PST)
Message-ID: <6182abbf-7cc3-4075-9f13-55ebbdef6aef@suse.com>
Date: Thu, 19 Dec 2024 08:55:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] xen/kconfig: allow LATE_HWDOM config for ARM
To: Sergiy Kibrik <sergiy_kibrik@epam.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 xen-devel@lists.xenproject.org
References: <20241217114719.2870676-1-Sergiy_Kibrik@epam.com>
 <9003a677-e78b-4cf8-b890-c6cf432d5837@suse.com>
 <858496ff-b8da-4dd9-abd1-679dc4f67b30@epam.com>
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
In-Reply-To: <858496ff-b8da-4dd9-abd1-679dc4f67b30@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 18.12.2024 11:00, Sergiy Kibrik wrote:
> 17.12.24 15:02, Jan Beulich:
>> On 17.12.2024 12:47, Sergiy Kibrik wrote:
>>> Allow to build ARM configuration with support for initializing hardware domain.
>>> On ARM it is only possible to start hardware domain in multiboot mode, so
>>> dom0less support is required.
>>
>> I don't follow this. Late hwdom is supposed to be started by a (minimal)
>> toolstack iirc.
> 
> Yes, on x86 it's started by toolstack. This is not supported on ARM.
> However dom0less can already handle hardware domain initialization on 
> ARM, without much of an additional changes.

Yet that's not "late hwdom" then, but "separate hwdom and ctrldom" or some
such.

Jan

