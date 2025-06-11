Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C12A2AD50BE
	for <lists+xen-devel@lfdr.de>; Wed, 11 Jun 2025 12:01:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1011422.1389847 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPIGn-0000el-Q4; Wed, 11 Jun 2025 10:01:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1011422.1389847; Wed, 11 Jun 2025 10:01:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPIGn-0000cH-Mu; Wed, 11 Jun 2025 10:01:21 +0000
Received: by outflank-mailman (input) for mailman id 1011422;
 Wed, 11 Jun 2025 10:01:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Z5UX=Y2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uPIGm-0000cB-Hz
 for xen-devel@lists.xenproject.org; Wed, 11 Jun 2025 10:01:20 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ff71e741-46aa-11f0-a307-13f23c93f187;
 Wed, 11 Jun 2025 12:01:09 +0200 (CEST)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-3a375e72473so3338073f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 11 Jun 2025 03:01:09 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7482b0c6b31sm8778568b3a.129.2025.06.11.03.01.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Jun 2025 03:01:08 -0700 (PDT)
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
X-Inumbo-ID: ff71e741-46aa-11f0-a307-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1749636069; x=1750240869; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Cs0AGDBPM7F/Niq6o67dpLWoKZh1nHnc+QG0epoXoa4=;
        b=gNx6Ugqwvp1ohoG4ZZPIABYa8EPgCGQz/055QZMSE1oWPkLRLPNfmPyrucLCA6vrlQ
         Wc4VTi/v16NyZP2W9TVd28ebieYeLKDfyhqO79FIObLHbSNikTKZ2ZkOYeaDuxbcmDCA
         OAt42rEbPX41MPHQQGP3CGI3Z6KeVlQcET+RUokVXHvUjxeALoV1UQX2lxUX42m/WlSi
         TFCGUYA/6J+9rcEkjL9Y0UwHXxM51lQTC3NcmNFz1g+c8dfkm/l+8GdUIKgel7ImeU/G
         OqMzykyIvcAAYMCxHhbUQwqPf+fl7hzg+iLa7UB3WJ1i3qmodaja4CVlOAsw0Z8cQ3Hg
         WVzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749636069; x=1750240869;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cs0AGDBPM7F/Niq6o67dpLWoKZh1nHnc+QG0epoXoa4=;
        b=A6wCJcwUqSrIyq7vw6vOiBwPK/jKPXbwUhNFIhvrVqRvTt6crDtJz3H+dhN4z065Wa
         yo/pklBEe/0iw9dC7FF1JRLB1QMPGPHrHv/wTy3inxk7L4xovcwUTofbrMkRJO0eHhVS
         QzHxT5A/y20ihOYKtgVVqF9lgWUMPMlu5HSBuLsZSEs5iDU3tPEJqvuAXUXWEYMNSIck
         s3pTtkm9qRKT1+9ewl7fLS5mFilK+07msyCH6F4st6j8dpomcU6dPEmJpPZX3dR7cblg
         7AHPwyvddgfrX0Qi/0hnUIhf4It9O2WmfPQ/kmcrMeGRoITiEOWTTWH/Hp9fm4DLb4NY
         S4Uw==
X-Forwarded-Encrypted: i=1; AJvYcCUtDWkLOTvasFIHEVXSEbDpSnIRD3lfZ8nftjsn4uY9us2WxvbcJar0rU3aEAWucleTl79xgP8jYtU=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz3y1TbyoXpCwXVZypM3FbcW598qC0IEO7O8kYYIa7itnAbKM7k
	70qYG0noBQCcFk3pnz/RwF+FBf8HVThXePNp2sGDYL8HCEm1sf/P2sNYjqfdiB/s2A==
X-Gm-Gg: ASbGncuxl4408EG9P4TQjUUxx/DRmyHHHlYvpGNaWyd88FIvJ9X5g0Ip4BVmvCTwBQb
	z17iZi1zJm8ahbLYIa4rfie5G+x8ygF3NV+7vAt8v2H6/WPsXsuFe90gziZ1OwLbYPd/dOyga9B
	J5kxkvfEpUibrpHkQKmUWCiIXMYJUKN7ZIPN185kKTYYY36WkTf37JnRqzR+wi9yOYalxxFKnpg
	xenwNMeAQ3lVEB16fzOAXAkPqnZHma5eA1IKOeyMHRu2jpQBs3Row28moDDj5OeQQyGzQ72Ht4Z
	CjWrAi85q4J8y3pccAyVPywKd2ilHv76aahCWhVHzdko9pEIlHdnF1It22OgCpSOGLqSBPP/MSh
	eRSiArpfW4k3xtY65FG4HuFOxIoPN5CSzuSlsh8JNN9nisqw=
X-Google-Smtp-Source: AGHT+IHgWevN18aoEVFZhhbuz8BPW2JHxVGYa+cnZcd+jaUy/nqyvSHNBKnYLIKjNmEJxsPrNDluPw==
X-Received: by 2002:a05:6000:4203:b0:3a5:1410:71c0 with SMTP id ffacd0b85a97d-3a5586dcff7mr2006686f8f.38.1749636068763;
        Wed, 11 Jun 2025 03:01:08 -0700 (PDT)
Message-ID: <9f2afc59-e55a-45d8-a521-0ad5aba61cdf@suse.com>
Date: Wed, 11 Jun 2025 12:01:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen: Strip xen.efi by default
To: Frediano Ziglio <freddy77@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20250610101228.24460-1-freddy77@gmail.com>
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
In-Reply-To: <20250610101228.24460-1-freddy77@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10.06.2025 12:12, Frediano Ziglio wrote:
> --- a/xen/arch/x86/Makefile
> +++ b/xen/arch/x86/Makefile
> @@ -238,6 +238,7 @@ endif
>  		> $@.map
>  ifeq ($(CONFIG_DEBUG_INFO),y)
>  	$(if $(filter --strip-debug,$(EFI_LDFLAGS)),:$(space))$(OBJCOPY) -O elf64-x86-64 $@ $@.elf
> +	$(if $(filter --strip-debug,$(EFI_LDFLAGS)),:$(space))$(STRIP) $@
>  endif
>  	rm -f $(dot-target).[0-9]* $(@D)/..$(@F).[0-9]*
>  ifeq ($(CONFIG_XEN_IBT),y)

Oh, one more thing: It is bad practice to modify the output of a rule multiple
times. An interrupted or otherwise failed make (at the "right" position) may
then leave something in place which a subsequent incremental build would not
know needs updating (again).

Jan

