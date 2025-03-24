Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6003FA6D7DC
	for <lists+xen-devel@lfdr.de>; Mon, 24 Mar 2025 10:53:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.925214.1328086 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tweUs-0005Ze-Ol; Mon, 24 Mar 2025 09:53:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 925214.1328086; Mon, 24 Mar 2025 09:53:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tweUs-0005X4-Lg; Mon, 24 Mar 2025 09:53:30 +0000
Received: by outflank-mailman (input) for mailman id 925214;
 Mon, 24 Mar 2025 09:53:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=sMR0=WL=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tweUr-0005Ww-CL
 for xen-devel@lists.xenproject.org; Mon, 24 Mar 2025 09:53:29 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d5fa22d8-0895-11f0-9ea2-5ba50f476ded;
 Mon, 24 Mar 2025 10:53:28 +0100 (CET)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-43cfb6e9031so37813695e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 24 Mar 2025 02:53:28 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d43f3328bsm165679375e9.1.2025.03.24.02.53.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Mar 2025 02:53:27 -0700 (PDT)
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
X-Inumbo-ID: d5fa22d8-0895-11f0-9ea2-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1742810008; x=1743414808; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=USW37UorfVaQ4MHJmy0qUR9R6V4zM42MPM0ZTcWvUfM=;
        b=dVF3gwp1PIe+ygaSPSnFGvjqjqx+Wz7Ir4g1whnFIxowzJevG0tFC6aQATlpfAp6I5
         KqXDvmkYHhjzjvtOzuPsKi+rvMH3QtHrhG43y8gmHxI0IYiZ7AQQgjTohgIYQwZHmhGn
         qilktIE62yLTuxFl0y2GbhhL8ZIN21e7mqQqZKEj9ReEw/FQVs4Hs2fMSC1H7GJKLiW4
         9keGTCLvVT1dhrQ/dJC3HTHOYIJ8zLtAokWQHeXmnRsqH3vokQAQhmFLMZtPAAq66KBY
         CcQGa/51o2le6/YoPZF1SEHkcv829TOY3hxAqU33XbKwDDNEBIRIBGcHRkK7sJyrcADq
         9oQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742810008; x=1743414808;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=USW37UorfVaQ4MHJmy0qUR9R6V4zM42MPM0ZTcWvUfM=;
        b=Yyp826SwBYQ/xwT73e77ar2OZpTSLL+Bi61/9fxjtXK2juz3QRoxqEPYLJXOhcke40
         QqcdthA4y/TrNGD8+zLq9SzfFCI9/j8Oh/w6gM9bMfuSXgHx/MU+GNiDTyHEYNsbbpbL
         yA1N5H5p9wyHwnfoMqDbxmfML+lxafMnUEieG7hCSX/pvEos5H0ACbEKoRBeuieeWJeL
         zBcSdDuqM4nTBBGNkdlpCLo67n0tAsT0RV5ScDZhBYSfGdJmQ7+4bPB9tjHLTZFgI2af
         Vf1IsoZLp9jHPQOM69u3dKSa3eHnRacjOBzP6oLLGYLgAl1lTcvLvDMQ6JrDK0wtBafd
         mGJQ==
X-Forwarded-Encrypted: i=1; AJvYcCXuWjI6LnFu2D21mQdBAF+JdvI7TfZjaTAXBOwrewN+5N5NlvIhVBjSOlvSCw0n8UxI+49Z/Mml12A=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxZcNbRLML/0ODpeqUsjl9arawE9+jBdT5LwEuNAYtyce9TdIbi
	MyVCtnLgTGyAb2pDZ/HUhQjyc6QYfEzGA3Xv14ZNUjzjGyRknyu+/I6FPxF/Mw==
X-Gm-Gg: ASbGncvmhB3pFke9yNjXHB88ia3/nSmeeyyHrUw+nwKLNzhLz46j/ThPGjwLghoYZaW
	ms5enLZeVu2DWU+jILkJly9X3dFsFF5ZOnMCu0PwUo05QfR1t/w9odAn8zcPKdJ1t3K3GJ1WazX
	JXCj1Xz1dKaWNFNRxjbuRycpQdH3gcfFBu0CvrpjkQjAKotC094s0UVLxE5uERGe+EtgJxFbPdW
	G47RXzIMGhjPRfF2ezq5dlrWPiU4/yaDpArJfWJkhNgKjgV7ETnSJ5jecxbaJ6As4yrXIi42MAZ
	Reo/7ky+MHW6awso2K9ytfNbd0i83OcRU9PtGQOAigvvGumkT8UjEaGoSlGT5sA5L/CJLiun03N
	xmBH0MvFiB4XVvrF0e1FAfmAYLXHHNQ==
X-Google-Smtp-Source: AGHT+IHLiu+ey3sv2T3DwCaQz6L1XNIV5+QrpbiCB7d/UmETnLsV41pZZnn3o03zQ2NyrZ2Nk+Rbdg==
X-Received: by 2002:a05:600c:3550:b0:43d:1b74:e89a with SMTP id 5b1f17b1804b1-43d566d1ce9mr89539425e9.9.1742810007608;
        Mon, 24 Mar 2025 02:53:27 -0700 (PDT)
Message-ID: <3438cfe6-72c9-4c0d-b9a2-c46a8a8b9794@suse.com>
Date: Mon, 24 Mar 2025 10:53:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/8] x86/domctl: Stop using XLAT_cpu_user_regs()
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250311211043.3629696-1-andrew.cooper3@citrix.com>
 <20250311211043.3629696-6-andrew.cooper3@citrix.com>
 <1cd10c63-4e86-45fa-b4b3-cb750ad9f39b@suse.com>
 <4777d8e9-b4d9-45d2-82be-beb1af82283f@citrix.com>
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
In-Reply-To: <4777d8e9-b4d9-45d2-82be-beb1af82283f@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 21.03.2025 18:13, Andrew Cooper wrote:
> On 17/03/2025 11:42 am, Jan Beulich wrote:
>> On 11.03.2025 22:10, Andrew Cooper wrote:
>>> --- a/xen/include/xlat.lst
>>> +++ b/xen/include/xlat.lst
>>> @@ -34,8 +34,6 @@
>>>  ?	pmu_intel_ctxt			arch-x86/pmu.h
>>>  ?	pmu_regs			arch-x86/pmu.h
>>>  
>>> -!	cpu_user_regs			arch-x86/xen-@arch@.h
>> Maybe worthwhile to keep the line, just switching ! to #, in order to
>> indicate the type isn't accidentally missing here?
> 
> Is it really worth it?  That's a new semantic to an opaque
> domain-specific-language, and this file only ever gets looked at when
> something is broken.

True. Yet how else would we distinguish accidentally missing from deliberately
omitted?

Jan

