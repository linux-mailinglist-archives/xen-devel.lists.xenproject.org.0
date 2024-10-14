Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 03A6299D3D2
	for <lists+xen-devel@lfdr.de>; Mon, 14 Oct 2024 17:47:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.818757.1232041 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t0NHP-0004Cs-5I; Mon, 14 Oct 2024 15:46:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 818757.1232041; Mon, 14 Oct 2024 15:46:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t0NHP-00049u-2F; Mon, 14 Oct 2024 15:46:43 +0000
Received: by outflank-mailman (input) for mailman id 818757;
 Mon, 14 Oct 2024 15:46:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9kmr=RK=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1t0NHO-00049o-2L
 for xen-devel@lists.xenproject.org; Mon, 14 Oct 2024 15:46:42 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 801ead77-8a43-11ef-99a2-01e77a169b0f;
 Mon, 14 Oct 2024 17:46:39 +0200 (CEST)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-42f6bec84b5so43034325e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 14 Oct 2024 08:46:39 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-37d4b6bd555sm11576127f8f.28.2024.10.14.08.46.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Oct 2024 08:46:38 -0700 (PDT)
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
X-Inumbo-ID: 801ead77-8a43-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1728920798; x=1729525598; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=pk64sP4JgdJ9rRgH4PNFA0FWrGItwZgqfeCYLYuY3VM=;
        b=SZZ41J701ryHevB+2P4kPd1bYxRyn8vVN7zR03NO7fLIrN5O7IGaqE8F4buc9PXanR
         kr09FUILmW3tQqNEUB5UakSj4/zOWfupN2slcAA9wM7053xtSjbOHYYAtti3rLjIqP/X
         kn0DiT/od2ioX0LcxC1KyJx/7h6he7qyj0PBa+tChJ5z+ksujZN5RPf0i7hBz8ZRuvu1
         Li7F7WA+Gx/KLi0PbuPYkGJASmtG6esGNbKAUxnFSCbF7mtkjgi340TMKwmRMMvddgDR
         ZF/jp1Zr8HKMsMgZP5XaTcrEytQAeSTJU1mphajUke5DX+FDgoNOi39voMtc/2uMSBmZ
         ndvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728920798; x=1729525598;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pk64sP4JgdJ9rRgH4PNFA0FWrGItwZgqfeCYLYuY3VM=;
        b=PySzAoLDVypq3fviOKgPjcQhgHo3NDWmBGcSObk8cnqvG05ixU3KEZq0u3GWumeEG8
         0ZWpvlkDUL8D3g09LVKHvETfBPEVU39Em4gxe8iuLgm9y3r4s0fuU7gsAeXjwyUvC9cx
         iY4xKjvxfHt1d7Qhq2cxKmh3kD53qUlcSdbuGEZnx13Y3HQBdWA1EbYNuEP8AaLf5JcF
         x51bHzG1i/lSq8gM28mi+KfqmQaDYM0ezjFALpAoATwSsrqM7Fl3EBmfngHMrv2Nvo9n
         LPM3RehBrwtoJ0O+AxJ1g9mc+661lRhk8Izy6zcV2DXtutbqD0zm0ofOSTIsLkB/zxHm
         Bz8A==
X-Gm-Message-State: AOJu0YwsOr5hCUoGsg+T9RskLxRR01S8cVeZtxQUZnyB5dTgjlsjqW8z
	6EFXOfnqLskPhlWJQzoW0BlxTXaE7ujRIWR1FxiaXsGmecu3eZ3kvHSzVgywbw==
X-Google-Smtp-Source: AGHT+IGnQBPX3VKvFOyw5bJdkgSKppYb04HbN5bsdlk1uXVLrJMU1ba+kTCDOK1G5Qn7KePnHgqMBg==
X-Received: by 2002:a05:600c:3b28:b0:42c:b905:2bf9 with SMTP id 5b1f17b1804b1-4311dee74dbmr114594625e9.16.1728920798466;
        Mon, 14 Oct 2024 08:46:38 -0700 (PDT)
Message-ID: <d55397b9-0b13-493c-89a6-be12f17d3c3b@suse.com>
Date: Mon, 14 Oct 2024 17:46:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/6] x86/boot: create a C bundle for 32 bit boot code
 and use it
To: Anthony PERARD <anthony.perard@vates.tech>,
 Frediano Ziglio <frediano.ziglio@cloud.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20241014085332.3254546-1-frediano.ziglio@cloud.com>
 <20241014085332.3254546-3-frediano.ziglio@cloud.com> <Zw05Tb8UvCQAIo+n@l14>
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
In-Reply-To: <Zw05Tb8UvCQAIo+n@l14>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14.10.2024 17:31, Anthony PERARD wrote:
> On Mon, Oct 14, 2024 at 09:53:28AM +0100, Frediano Ziglio wrote:
>> diff --git a/xen/arch/x86/boot/Makefile b/xen/arch/x86/boot/Makefile
>> index 1199291d2b..23ad274c89 100644
>> --- a/xen/arch/x86/boot/Makefile
>> +++ b/xen/arch/x86/boot/Makefile
>> @@ -1,4 +1,5 @@
>>  obj-bin-y += head.o
>> +obj-bin-y += built_in_32.o
> 
> I don't quite like that this new object name is "built_in_32.o",
> It's really closed to "built_in.*" which is used by Rules.mk to collect
> all objects in a subdirectory. I don't really have a better suggestion at
> the moment.

blob32.o? bundle32.o?

Jan


