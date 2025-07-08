Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DC70AFC5B1
	for <lists+xen-devel@lfdr.de>; Tue,  8 Jul 2025 10:32:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1036286.1408545 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZ3k0-0000as-2J; Tue, 08 Jul 2025 08:31:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1036286.1408545; Tue, 08 Jul 2025 08:31:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZ3jz-0000YB-Vt; Tue, 08 Jul 2025 08:31:51 +0000
Received: by outflank-mailman (input) for mailman id 1036286;
 Tue, 08 Jul 2025 08:31:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mjd+=ZV=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uZ3jy-0000Y4-4L
 for xen-devel@lists.xenproject.org; Tue, 08 Jul 2025 08:31:50 +0000
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [2a00:1450:4864:20::433])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fdaaafa1-5bd5-11f0-a317-13f23c93f187;
 Tue, 08 Jul 2025 10:31:49 +0200 (CEST)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-3a50956e5d3so3071742f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 08 Jul 2025 01:31:49 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23c845bf52asm103412435ad.241.2025.07.08.01.31.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Jul 2025 01:31:48 -0700 (PDT)
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
X-Inumbo-ID: fdaaafa1-5bd5-11f0-a317-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1751963508; x=1752568308; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=zZ5yc09p2QE9QMFUqK37b9h29ICTpaOgyWX7RAdwcgc=;
        b=EcEPSZgtYgwdhUliSgi2xVSIAb8LikKtWUevXv/JNBWqe/HG+3Kn9G2wKaQBtMq81Z
         pEY4ZzxlF3pW1B33wpfSAKXwDuiVG/6M1cnM+hXF5BwT+W7vxmWSAhiNd8O5ulL/dEUS
         NneoUlk7wBmqX4th1rc7RB2+2fPuwIqp+XGIjiMjNOeWzRyd9wCVxeSS2Ox3bI/1luel
         XUQicF850IJkRz79Vj8kY+FNe71MTGnS1E3qOLc+HA/Rfd4Ot9hKYVDKYwN3MZYRqL0Z
         d6kof6UseTKSB/vaAEcp8hOD1QQkiaCHyka7u2hTv4xoGeLxk4BiptWcjijL9DGkL/Pr
         3EEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751963508; x=1752568308;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zZ5yc09p2QE9QMFUqK37b9h29ICTpaOgyWX7RAdwcgc=;
        b=peCto0eTaE3YCyuFzIQTNnf/Yo8k4LOa7V1vNA9mX/rvoMbM98jOkyoomVoY6EVSpm
         ctq8HiW9rxJk9zd00dbrdacna1EI0T3/N56eaJzuD3Ll7AUj/JMmvI2ArF0NlL2SJBUM
         IkuWcWVxkIVR4ZLGcKq2DKrnTH8KqkF7U6/+daEhDJFRIbrJWS94ABgiAzApmPuSITKz
         2Owjg1GAFts/1BVQhwDcXuuRcjkjb/OLM+KSUJgWoiEiRGeELX4w8Tl/DZe7Fe43jtho
         VUsnAibObiJqLeWf8chj4lmNAPrb+PJTgGFzVypkxcUi7e2rbztgufybeCaPEhkH9rJP
         lNsg==
X-Forwarded-Encrypted: i=1; AJvYcCU3bV378t0soQipoVHp7Oixlk9t9WR3eFBMbEZc4shPUFBxy934xePF5rXpB+50R4zGaojNEqbUo2k=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy+5ZCCKZEDhCCgepcXR9cE7vTWXS6GSNgRVZ/dG9s8VUoRED18
	3EAgDxt1OLJFMw+f5l25daIvNnMue3E+5IoW5FfFuN/nUxQKlfp46tap0kSwbp0VPA==
X-Gm-Gg: ASbGncvBR3PyMVtbqNt9+SKRSlOof8EPA+MHdSefYJ4WtFgAWC68k+5glTeKP+gtci4
	1efzcsr/ohhv3rHiy4V2Nh9a4K/NBFzXHyMey88wrugLDEltAtfNkVTeZa+6tggeglv0C5FB1oY
	E5rnY260MMA8rXZnN3JIwBwwa734L8ZGObJSZCJFh5mLvUdX8D1maRxHLODci2cEpiYXSvV2Rgy
	OaFnCATJjC0bQMURmuGWQIwnpiWKDV5KiU3tJjhxNKWMU0ltECtQE9qqmGquAuc/KwEIBUehlI5
	Gfo8Fmn95VwXevAD4DK73a0rQ/LwwblSGBSL/sHM6MiEUUQ5GROAfaRBuu00OQ0SERz1Llv/xEv
	lZcOqF99pks74gk0xikXPB3UBEGy4HrBSLBJPvBWm8KsdemM=
X-Google-Smtp-Source: AGHT+IFg/I7Ft54CumcAFz9GqYBsIhGOAn6MBTl2CJfvLMRfZ2aLpqGApkUBAsABhAl3Wn14stFisw==
X-Received: by 2002:a5d:5f45:0:b0:3a4:ebc2:d6ec with SMTP id ffacd0b85a97d-3b5dde6764fmr1799721f8f.14.1751963508569;
        Tue, 08 Jul 2025 01:31:48 -0700 (PDT)
Message-ID: <9548571f-7229-44fa-a946-a3cbc6bba27a@suse.com>
Date: Tue, 8 Jul 2025 10:31:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs/misra/rules.rst: allow string literals with memcmp
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: andrew.cooper3@citrix.com, michal.orzel@amd.com, julien@xen.org,
 roger.pau@citrix.com, Bertrand Marquis <bertrand.marquis@arm.com>,
 xen-devel@lists.xenproject.org, Nicola Vetrini <nicola.vetrini@bugseng.com>
References: <alpine.DEB.2.22.394.2506231642450.862517@ubuntu-linux-20-04-desktop>
 <0c6d5b49-ce69-4f16-b61e-ad1378b20807@suse.com>
 <c61624db2dc3cce8609aed49d49b2865@bugseng.com>
 <alpine.DEB.2.22.394.2507071445200.605088@ubuntu-linux-20-04-desktop>
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
In-Reply-To: <alpine.DEB.2.22.394.2507071445200.605088@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 07.07.2025 23:45, Stefano Stabellini wrote:
> On Thu, 26 Jun 2025, Nicola Vetrini wrote:
>> On 2025-06-24 08:11, Jan Beulich wrote:
>>> On 24.06.2025 01:45, Stefano Stabellini wrote:
>>>> Rule 21.16 is about the types of arguments allowed for memcpy.
>>>
>>> Seeing the subject - is it memcmp(), memcpy(), or both? (Writing from
>>> home, where I don't have the Misra spec to hand, and hence can't check
>>> what coverage the rule has.)
>>
>> In this case the rule covers just memcmp(): "The pointer arguments to the
>> Standard Library function memcmp shall point to either a pointer type, an
>> essentially signed type, an essentially unsigned type, an essentially Boolean
>> type or an essentially enum type"
> 
> Jan, given the above, any chance you can ack it?

With the description corrected:
Acked-by: Jan Beulich <jbeulich@suse.com>

Jan

