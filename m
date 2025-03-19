Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EA472A68727
	for <lists+xen-devel@lfdr.de>; Wed, 19 Mar 2025 09:45:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.920089.1324358 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tup3B-00036b-Aw; Wed, 19 Mar 2025 08:45:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 920089.1324358; Wed, 19 Mar 2025 08:45:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tup3B-00034L-8B; Wed, 19 Mar 2025 08:45:21 +0000
Received: by outflank-mailman (input) for mailman id 920089;
 Wed, 19 Mar 2025 08:45:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bBEQ=WG=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tup39-00034F-Nh
 for xen-devel@lists.xenproject.org; Wed, 19 Mar 2025 08:45:19 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 79d6b4a3-049e-11f0-9899-31a8f345e629;
 Wed, 19 Mar 2025 09:45:14 +0100 (CET)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-43d07ca6a80so20055785e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 19 Mar 2025 01:45:14 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d4453225bsm11496185e9.7.2025.03.19.01.45.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Mar 2025 01:45:13 -0700 (PDT)
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
X-Inumbo-ID: 79d6b4a3-049e-11f0-9899-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1742373914; x=1742978714; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=rsT5uKKi7PbWlvW9Og2dxpWwI81dUbeSn0/Qk67NFNg=;
        b=HxIPWwW6SQ9WHGm750j5AeGa0YLJEhdYFst4Setdawa2Sn5ojULGwFz7thpy3LKJIV
         4gNo96QQPyAQ1apGIS6FdFsX7hw21M2AdYEV5M42aofgi6YwUeP97LzPuKPZMISkrT5a
         Z3aVaHYfJ3ihdEoyy2Wb61yGcN13L2eRXtRr3YpufY5uZNBjPunYZ3hP6zRSFM8FuN3y
         mnDfJaK9WjkSxEPYqOV9RJjw1WxEq3Q4mlGeWkG9ZNdS9PfR99kRf2d7VTJGqBMHspMq
         XkoV5OCOiqfZJh4CI7LJu0lJqWmN7jqCVzTOhE5S6X3UAj81dMIDyHlsCO+7KVlBpUYy
         AVFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742373914; x=1742978714;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rsT5uKKi7PbWlvW9Og2dxpWwI81dUbeSn0/Qk67NFNg=;
        b=nYBg0S7l3cxdMUoaF8Dyc2pK4TO+vBBJDz8e2HkemRmxKk6xnsdebCLPs3GQy6pgUc
         VOaStxSjFXeb9UxzR5zqsXAKGrgYR9bvy2ial+OxCmb/5JSygoJHWZrJhfQuWF42PONI
         fEKXrzOFNlfTyAgDhTcjpAX9dDJlceed9sistqztbptTTuFKuI6tNOOlrI5fiGrE/jkj
         Ch4Zxoe7d8pX/3OxGOtPKnsyxzwsyyBtQUi7C82xZvuaiJYnFkoIR4rAMLtPMYmGOnUE
         54itwNIwtbtT/UQdLikE/rvcieVnlZ+S9O6S49sZleUYcPvXIFljq7mZZjAA2b3tacJ2
         +1rw==
X-Forwarded-Encrypted: i=1; AJvYcCWn4OynqVcfCtbtoanZF9dwQJwfztr2IsVOp328lq0IkIinZKwKYs3dH7iAcnExoNZEV8iFbJyn0w4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwgUQ+sv2a7MaL7k0X+3phteov2sEGp6PJG8UH/Abs++5E5wdpi
	X5vf/KCTd1T2ICCAJxjvJSbK3HSDy4Ce8hlNy6ODQtbZ9lE0qfb6GECUEEHpLQ==
X-Gm-Gg: ASbGncvir1+haC+OyKb9HTTXVzuDndYBfOfKtWk9mdsuhB2eMKxhu41pHL9XK6iZ1TZ
	vfwUuBLqgEx+DrZZSYhpSZ0jJabdsjwza50fLzWiZKXwkzAUQ7ahhrv+LQHG8Bqb5YY3tEU8yvQ
	Uh2+jToz8MgLIqbb7siIhnyadqbTJpNVxXV4H1Fz/NTE9c/0sxVItDd7KhV2PYzum5H9slDknpJ
	wlGiSbx71jN8PBgYgqRN7Fpi/yJ/FPrNHZ/VMgAf5wk5N5hukPovlhr61FupSQhVO0BGK6WB58P
	pM8+JbfyelDGV3jZMXmNeoTlsbDrLsC2fOmhdaXmAcA/eB4D4NTPVwCllv8DZJvfkfilXNbDt8z
	CQDRzy2e2Kn+2UgKJnrXmxTF/TdrFBA==
X-Google-Smtp-Source: AGHT+IHNZpOeJPfo0Kum76L80IeUQOCqeJCL7ngNw1EC01vL22P78flTUMPgEdswJwmWoZ5ViiyW7w==
X-Received: by 2002:a05:600c:1e8f:b0:43c:e8ca:5140 with SMTP id 5b1f17b1804b1-43d45e3d8b8mr7377575e9.23.1742373913965;
        Wed, 19 Mar 2025 01:45:13 -0700 (PDT)
Message-ID: <523bb3ac-cb2f-4497-9934-1008c0fecf4f@suse.com>
Date: Wed, 19 Mar 2025 09:45:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/2] Strip build path directories in tools, xen and
 xen/arch/x86
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>,
 =?UTF-8?Q?Fr=C3=A9d=C3=A9ric_Pierret_=28fepitre=29?=
 <frederic.pierret@qubes-os.org>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.a5cb9c3a17249fc067ab501818c3a3e6c7c229cf.1742317309.git-series.marmarek@invisiblethingslab.com>
 <0370c0eb1fd9ac00acab016792132fa0b943d384.1742317309.git-series.marmarek@invisiblethingslab.com>
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
In-Reply-To: <0370c0eb1fd9ac00acab016792132fa0b943d384.1742317309.git-series.marmarek@invisiblethingslab.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 18.03.2025 18:01, Marek Marczykowski-Górecki wrote:
> --- a/xen/Makefile
> +++ b/xen/Makefile
> @@ -411,6 +411,8 @@ ifneq ($(CONFIG_CC_IS_CLANG),y)
>  CFLAGS += -Wa,--strip-local-absolute
>  endif
>  
> +$(call cc-option-add CFLAGS,CC,-ffile-prefix-map=$(XEN_ROOT)=.)

With this, ...

> --- a/xen/arch/x86/Makefile
> +++ b/xen/arch/x86/Makefile
> @@ -137,6 +137,7 @@ $(TARGET): $(TARGET)-syms $(efi-y) $(obj)/boot/mkelf32
>  	mv $(TMP) $(TARGET)
>  
>  CFLAGS-$(XEN_BUILD_EFI) += -DXEN_BUILD_EFI
> +$(call cc-option-add CFLAGS-$(XEN_BUILD_EFI),CC,-ffile-prefix-map=$(XEN_ROOT)=.)

... why is this also needed? CFLAGS-y ought to be folded into CFLAGS.

Jan


