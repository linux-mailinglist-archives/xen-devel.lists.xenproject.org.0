Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 23E759EADB8
	for <lists+xen-devel@lfdr.de>; Tue, 10 Dec 2024 11:14:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.851979.1265929 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tKxG9-000628-Ow; Tue, 10 Dec 2024 10:14:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 851979.1265929; Tue, 10 Dec 2024 10:14:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tKxG9-0005zE-MA; Tue, 10 Dec 2024 10:14:29 +0000
Received: by outflank-mailman (input) for mailman id 851979;
 Tue, 10 Dec 2024 10:14:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=So9x=TD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tKxG8-0005z8-3x
 for xen-devel@lists.xenproject.org; Tue, 10 Dec 2024 10:14:28 +0000
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [2a00:1450:4864:20::433])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 88a5126c-b6df-11ef-99a3-01e77a169b0f;
 Tue, 10 Dec 2024 11:14:26 +0100 (CET)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-385ed7f6605so2384744f8f.3
 for <xen-devel@lists.xenproject.org>; Tue, 10 Dec 2024 02:14:26 -0800 (PST)
Received: from ?IPV6:2003:ca:b746:63c:3d8c:c505:78ea:f982?
 (p200300cab746063c3d8cc50578eaf982.dip0.t-ipconnect.de.
 [2003:ca:b746:63c:3d8c:c505:78ea:f982])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3862c611242sm12502355f8f.36.2024.12.10.02.14.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Dec 2024 02:14:25 -0800 (PST)
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
X-Inumbo-ID: 88a5126c-b6df-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1733825665; x=1734430465; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=DsI5p3w9uIOUaInC22Ag0qJ2SDd5cFjUuOkhV0irGuM=;
        b=Gh9hT90FT515fZhjTLrLSV6OUlWsI1xKW3Z2wPw6K0yasbsfFb0O5+82w1XFIOf9P8
         6s+OTef/IB2/VS1e56E5lOwYT57vjabNBloiBcHeY601xN3zVv1zVycm8oWIuOAAXt9r
         +YurdQl2+hsVO9L0P12IoT2iN+NokTx1j7P5MvSYjTKqbC26ZHaApmIcg9iMN4oK6BZF
         X8i7aPwCOP02Xf4XM/Nrmng/WYTcWHbFn4lrwWh4JFskdRytIPAfyTs6bTeaBzJH/TfE
         T5134UTfb368+7WbmhVw+Pm9LEy+n8kxaF3Mgk1F9uJ/Gm6G450l4DV3/j5ySr4CuPPD
         3Upw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733825665; x=1734430465;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DsI5p3w9uIOUaInC22Ag0qJ2SDd5cFjUuOkhV0irGuM=;
        b=K5zaznMdnpiZCCgOy6yfAS5D1I6DPA6/peEJBMfrD/yXkUgQrBFlrKS8SHTKbR7MpQ
         hPCkKSg+rc6FyMkbwtANfIl9WO8G6ksREqH8xZPT6kE2mcoltaTkGtziET0ZOa1+AuBe
         Hmj0UlFWms2ini5v+XWiWCEkfAp8xui3rfDTbMOn2LaVPE60GvWcN7MTofXwrtE2AgRW
         J/iRl0N3+1EHYSYFol6K2lEZ2GEjfoCAk/M1MGu5ALlBeGQdwFQF1qEiHrS8dXQRnhA7
         0skc71It5nMo2nedkqdkAOSrGHY4c/YiQcijPO18bMo361ZcMBK5SXGEKWTZdxy8/Xga
         A15A==
X-Forwarded-Encrypted: i=1; AJvYcCVzjzmx1z1j2n9E1SJ3ymQXuKtH4jZRAhyekqBNhi2HTST8oVFGhB0R08477V9aSnAqD/SkEzkZ4vg=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz+Kgzb0yq927nFAIrdvbuNaRxaExczcw0j53X4E78oj1c6wSkw
	ksXkoHKEyi3PbMEaWYqYb0l9UzyhS5IpupEAxZ+GZOQz6PELqP0lDpe+6brXXA==
X-Gm-Gg: ASbGncsec1uXh8yRnW0WHq4bn1bC51RjuoywBj0tfIlPTMe9RM5sT4ZlW/Fk83wVGVC
	+ELs+duuV7cxDk5eHx/JuxUX+7vJtA27Xr0eFamDqpaB7Gg6hdYcuA/I1ulGy+ggKoMWdfskCsj
	VzCGS869hW8IcY0OsPtVhAMpEFgkbuIcjc/3SrEqmMa5uNmwtCOdc6VEVK9m0tmGsNkBZSA1bdI
	XTlGl0DZo0E0sk0/pcVkto792Hd+AE+3Da3WDmPmyinjXYcb79lBJIddNdyGVtGznzMLdqoZL2N
	ZigOClq78cDWwW/TAczuhpsWCmaDOzsZVILpAv4PB0DxPlcqmKmQW50mGKtRYKU9YlhQuXvy4p6
	EsVWVeHfSYw==
X-Google-Smtp-Source: AGHT+IH4pgzcrpDhGrT0rX+Vc3XOdrrsrao9+nRtXM1BqRqOsH4OU1IeH8nyDCUOhEM31RCoVlw0Gg==
X-Received: by 2002:a05:6000:2707:b0:386:39fd:5ec with SMTP id ffacd0b85a97d-38645401ec3mr2146932f8f.57.1733825665448;
        Tue, 10 Dec 2024 02:14:25 -0800 (PST)
Message-ID: <f1586637-9d09-405b-8da3-c98d4e38f839@suse.com>
Date: Tue, 10 Dec 2024 11:14:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] Use an include/boot directory to override headers
 for boot code
To: Frediano Ziglio <frediano.ziglio@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20241122093358.478774-1-frediano.ziglio@cloud.com>
 <20241122093358.478774-2-frediano.ziglio@cloud.com>
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
In-Reply-To: <20241122093358.478774-2-frediano.ziglio@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 22.11.2024 10:33, Frediano Ziglio wrote:
> Not all headers can be used by 32 bit boot code.
> Allows to override some headers, we don't want to mess up with
> main headers as most of the code is only 64 bit so the easy stuff should
> be done for 64 bit declarations.
> Boot headers should be 64 bit compatibles to avoid having multiple
> declarations.

I'm afraid that in isolation it's not clear what is intended. Boot code is
all located in a single directory. Can't we use local headers there, using
#include "...", instead of ...

> --- a/xen/arch/x86/boot/Makefile
> +++ b/xen/arch/x86/boot/Makefile
> @@ -18,7 +18,7 @@ CFLAGS_x86_32 := $(subst -m64,-m32 -march=i686,$(XEN_TREEWIDE_CFLAGS))
>  $(call cc-options-add,CFLAGS_x86_32,CC,$(EMBEDDED_EXTRA_CFLAGS))
>  CFLAGS_x86_32 += -Werror -fno-builtin -g0 -msoft-float -mregparm=3
>  CFLAGS_x86_32 += -nostdinc -include $(filter %/include/xen/config.h,$(XEN_CFLAGS))
> -CFLAGS_x86_32 += $(filter -I% -O%,$(XEN_CFLAGS)) -D__XEN__
> +CFLAGS_x86_32 += -I$(srctree)/arch/x86/include/boot $(filter -I% -O%,$(XEN_CFLAGS)) -D__XEN__

... introducing a arch-wide subdir, which non-boot code could easily (ab)use?

Jan

