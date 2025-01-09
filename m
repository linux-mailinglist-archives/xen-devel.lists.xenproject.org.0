Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 369BCA079BB
	for <lists+xen-devel@lfdr.de>; Thu,  9 Jan 2025 15:51:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.868483.1279983 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVtsA-0004IY-Ps; Thu, 09 Jan 2025 14:50:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 868483.1279983; Thu, 09 Jan 2025 14:50:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVtsA-0004Gf-M5; Thu, 09 Jan 2025 14:50:58 +0000
Received: by outflank-mailman (input) for mailman id 868483;
 Thu, 09 Jan 2025 14:50:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=pS5t=UB=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tVts8-0004GX-NC
 for xen-devel@lists.xenproject.org; Thu, 09 Jan 2025 14:50:56 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 213a6c78-ce99-11ef-a0df-8be0dac302b0;
 Thu, 09 Jan 2025 15:50:55 +0100 (CET)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-4362f61757fso10706835e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 09 Jan 2025 06:50:55 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38a8e37d154sm2086025f8f.10.2025.01.09.06.50.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Jan 2025 06:50:54 -0800 (PST)
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
X-Inumbo-ID: 213a6c78-ce99-11ef-a0df-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1736434255; x=1737039055; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=bQ7O0CTldjygQku2NAoci4VaNDGpPNcndFcs2iZCnSw=;
        b=I1dw0Zfedz8i5Nfgw3ATIHcNGCylaJyCFxCxpFj+Xom+wupU5t50U4IkjqJnMm5qNZ
         ST/+6OsW6qq6Xu+lAhJrX+7v+YM3yfgZ14axyVsJVRUbFCzzVsXcPaXXzQX9kenOkwsj
         dRfQEnHu6TO+RVRTAwjZWHzACGpX/cZCPFCbHIDD0nBiduq4OPul/PSNAuV0FXJ3AIoR
         bhq3k+mMQnKgfX1K6CICCb/f8tQkzJDZQVx4JRmqm08C7THb7cAfvlQESud0j9Qbe3B2
         NkjNs1JSl/EgX/AgDXrEKzsH4PC29yddpFzyurSQZ5dEO1D8Unn64Hd6TNdVcPNX8WHj
         /ZfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736434255; x=1737039055;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bQ7O0CTldjygQku2NAoci4VaNDGpPNcndFcs2iZCnSw=;
        b=nU8EproQaR++s/qM3K6Knz6fA6zNL07tlcHvlhizPZOJuVP6H/gVL55rKiJl2XTpx/
         1OkgGLbAPO3dJsoFi2Yxi97AcGTEJpdOebuRXYnnBEuZLvXkX98lhtA64gAeKrW/H+P3
         SnVG3ko4/BNSrNgCJ1IOiw3huL3cSFVdbcgX5Rn1gWQKhl98Xf83sUuYtSy4e+L3uYmd
         1WtKEtoW+KjKo/BplKF0n/JZIeQtdWsyWPGbBr8/luRCNUMItm2BqhYbGxaia7lTW4+6
         vOIgDN7xihtyhkp3wWzRizlz/6JyKvHMPDQOEx0d0r3YgNOBEm0eCYxPrNlSUhHk5pOy
         fWMw==
X-Forwarded-Encrypted: i=1; AJvYcCWug46gYcx/eyOkiC+qXepYRMbRfnTchL9sIP8xOikvkykZENqhwQy5rOgdf/p900j/nBvI8QFDBOY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwAGuOOx7ioECgvRwc6vchrOnAMZjUPSGZ32RcH/1ne0eKHnG4I
	W5XlEMgtgR3UJcgQg1Z1vqYUWpBkQWM/ClpH2q5YVKTOrK6WLpMUT/vGVJe1rw==
X-Gm-Gg: ASbGncvWYSMonPnUlZgP2ckuZBpPf68fTrqQAaSYanvzsMyyjYtEnTmdrczcZpTZPSl
	9qTowH9zo1OgICPfgXiaxm7rVmvlBMtcmf8DDQOw68CQShRG9NFrVQHgou4s8yX7gIfRTPewxo1
	3MFS+tMV+u8S4uNC+kKP0NZOMVtKxnxIdszFyO8BA1fe0w91UprGeWXs7mbze9wqMxIkDQ89v2b
	QQ7FPQ9OM5Fpsi3cectsh3kCTGzCO2CdbSPUkQj8wMixzyR1qonw4vRmAVO6Q+gItp0H+ZqHg+l
	kbLA7Dz/6bCNOiXpmdonsdXo9MmF7nn3ZVCvfoTVsA==
X-Google-Smtp-Source: AGHT+IH4z3Ua3hzqoe9n7js31hgqbC9AGJNy40B3UosLTIFrSbzc2qmvXV2UJ5W6VSy7cUDAeF2W0Q==
X-Received: by 2002:a5d:5f44:0:b0:385:fa33:29ed with SMTP id ffacd0b85a97d-38a8730fa63mr5544550f8f.47.1736434254983;
        Thu, 09 Jan 2025 06:50:54 -0800 (PST)
Message-ID: <74bad181-c8d9-4d4f-b932-8492d1e9d6b1@suse.com>
Date: Thu, 9 Jan 2025 15:50:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/boot: adjust text gap/diff to work with 64-bytes
 alignment too
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
References: <20250109131515.1757764-1-marmarek@invisiblethingslab.com>
 <d7421558-c2d6-485b-96bf-927992c5c066@suse.com>
 <47378338-ac05-4041-a055-56045e5ba131@citrix.com>
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
In-Reply-To: <47378338-ac05-4041-a055-56045e5ba131@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 09.01.2025 14:44, Andrew Cooper wrote:
> On 09/01/2025 1:23 pm, Jan Beulich wrote:
>> On 09.01.2025 14:15, Marek Marczykowski-Górecki wrote:
>>> Xen compiled with -mtune=generic has .text alignment set to 64-bytes.
>>> Having text_diff non-64-bytes-aligned breaks stuff:
>>>
>>>     Traceback (most recent call last):
>>>       File "/builddir/build/BUILD/xen-4.20.0-build/xen-4.20.0-rc0/xen/./tools/combine_two_binaries.py", line 96, in <module>
>>>         raise Exception('File sizes do not match')
>>>     Exception: File sizes do not match: 70160 != 4080 + 66048
>>>
>>> Adjust the numbers as suggested by Frediano to work with 64-bytes and
>>> even 128-bytes alignment.
>> And then breaking at 256? As indicated on Matrix, imo we should be able to
>> cope with anything up to at least PAGE_SIZE. Or we should reduce .text
>> alignment before linking.
> 
> Do you have a concrete proposal on how to do this?

The latter suggestion would involve objcopy's --set-section-alignment,
the former would involve using constants with the low 12 bits clear.

> Because if not, we've had 2 downstreams hit by this build failure, and
> we probably ought to take this patch as a stopgap fix, and see about
> doing the better fix for 4.20.

4.21 that is, I guess. I never like such very much, because it's too
likely that it'll then be forgotten.

Jan

