Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 09D60A022CF
	for <lists+xen-devel@lfdr.de>; Mon,  6 Jan 2025 11:21:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.865640.1276891 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tUkDi-0001TU-Ix; Mon, 06 Jan 2025 10:20:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 865640.1276891; Mon, 06 Jan 2025 10:20:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tUkDi-0001RE-GD; Mon, 06 Jan 2025 10:20:26 +0000
Received: by outflank-mailman (input) for mailman id 865640;
 Mon, 06 Jan 2025 10:20:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9khw=T6=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tUkDi-0001R8-2l
 for xen-devel@lists.xenproject.org; Mon, 06 Jan 2025 10:20:26 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d76735f4-cc17-11ef-a0df-8be0dac302b0;
 Mon, 06 Jan 2025 11:20:24 +0100 (CET)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-436637e8c8dso144353535e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 06 Jan 2025 02:20:24 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4366a093cbfsm539374875e9.22.2025.01.06.02.20.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Jan 2025 02:20:23 -0800 (PST)
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
X-Inumbo-ID: d76735f4-cc17-11ef-a0df-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1736158824; x=1736763624; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=bFyQuwIqv4EbMtPoPGmZSdTwN9m/YTeWqwZFZdjXaGg=;
        b=baJLAP8vjhI808hX/wUB+LasTAcp7mXltFZYakZ3Q+lsGCxKMlt8gVSF15yEX2G/1J
         razzimHE1Nmwi4XbnYEwCXBI1vPLX09H/gSbLzedomvhF/64yAqp3nnDIu5866+rHxq0
         eEEo15zvp2OB/Mepg0r/qkSewG4kc14a+f82HTf1b1//XMLwOoJSFlRJfXGf4T7JbJq0
         Varr1VEkAIHmJPalLVmzeDRjkirqErOD8FkR8KjHephxNfs8gjEtepTL0woOZgpuzJgx
         joRqBUEqIWWUonj8GgHJe9WmqGmntNbkOLGYKMtZiIFo+3k3/ASayJcVp+4Ekce8oEZU
         X+GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736158824; x=1736763624;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bFyQuwIqv4EbMtPoPGmZSdTwN9m/YTeWqwZFZdjXaGg=;
        b=t22pc9soOff5OIb5B4H5foVFwdkKwNl+e8gRvZ6KgnpMC5LRkDmqovHzKAG9taxL7p
         /YqDlH3CY1y3w94OpsyqEi4Pc0/8kOgon+/l05isiveDdYEu0KU6fwQdz154Uhybpeg1
         8aIQaxBv96Z4QyijSlLq4QwJVU6iu0hYExm/hZGgwi2zHFsO9fYvL6c5uvAAxJl2NBe9
         T5qNGWgpbwE8R02K4inUlbzOXhvMS/U+rtE0tv3gHc2hy8gb7zbRfNZ6Lw6H9ICA5vGU
         CXFh7lxThk33+4zwHeZIlK+JDwea9LC9K/2vp2uMVl6DlQXE+EHqpi/Ti5ZZEiiZlzLj
         DPxg==
X-Forwarded-Encrypted: i=1; AJvYcCWYmWfqiWCvXC7c+2krGGRx6NX7C6B1y3+RA6KmG1MU1vQzrhCRTY8PqdQMmMxjbPzTOz2i7yqtQRQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxWeOf+tps0nunThrPniJi4ocSLkjCxqfxomyep5rOjKBlUU2yN
	o2rdIHiDKQvG7+slyfO+MkgNafvZgt+3N1Z6vOmGmY8iL05+S4c04ntLSzrfiQ==
X-Gm-Gg: ASbGncvgPSo6kQ5BH801deviwZ70gY1AT/x/CJMxlABUPLM8sctobxgZxULNp5oqFvA
	eFb4JrYsua1se4pjQu6g6zWmS8jM+eokHdXNdvz236iju2qX4zdMUeFhF1vHx9Edl3skpHqsFs6
	0cSnyBU9fOrJgNFJ0eAYPSS+WXY+rdc3CvByHuHbihBsOCv79kavxCEaUT0shWzLcXvgwUYf/Ll
	KkckhsW7/ZQOvPlI+LeccAeXSRcLGSOELf9Y2OD1ytjNJnr0a7nIBAYnbYp9WxDs9Dx7LGt3luT
	6ddT/RXyOdW6+v8MgYh/JQdXBfTwXNLBknKE296oxg==
X-Google-Smtp-Source: AGHT+IG8KMgcQv6bJNIHFWgbD6cQqqbpttQ1x/PH0JHK55khFrE2WIxQf4pWUpPMGv6F3p0W/w+D/w==
X-Received: by 2002:a05:600c:294c:b0:436:51bb:7a53 with SMTP id 5b1f17b1804b1-43668643ba9mr512716245e9.12.1736158823734;
        Mon, 06 Jan 2025 02:20:23 -0800 (PST)
Message-ID: <10d1330d-45c9-4433-9ba3-b5498999cda5@suse.com>
Date: Mon, 6 Jan 2025 11:20:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 3/5] xen/arch/x86: make objdump output user locale
 agnostic
To: Maximilian Engelhardt <maxi@daemonizer.de>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <cover.1735585600.git.maxi@daemonizer.de>
 <c86ce036f829a9e626c8d1dfc595c6caf6c48212.1735585600.git.maxi@daemonizer.de>
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
In-Reply-To: <c86ce036f829a9e626c8d1dfc595c6caf6c48212.1735585600.git.maxi@daemonizer.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30.12.2024 22:00, Maximilian Engelhardt wrote:
> The objdump output is fed to grep, so make sure it doesn't change with
> different user locales and break the grep parsing.
> This problem was identified while updating xen in Debian and the fix is
> needed for generating reproducible builds in varying environments.

It required me to check objdump (really: libbfd) source code to figure that
it's ...

> --- a/xen/arch/x86/arch.mk
> +++ b/xen/arch/x86/arch.mk
> @@ -109,7 +109,7 @@ endif
>  ifeq ($(XEN_BUILD_PE),y)
>  
>  # Check if the linker produces fixups in PE by default
> -efi-nr-fixups := $(shell $(OBJDUMP) -p $(efi-check).efi | grep '^[[:blank:]]*reloc[[:blank:]]*[0-9][[:blank:]].*DIR64$$' | wc -l)
> +efi-nr-fixups := $(shell LC_ALL=C $(OBJDUMP) -p $(efi-check).efi | grep '^[[:blank:]]*reloc[[:blank:]]*[0-9][[:blank:]].*DIR64$$' | wc -l)

... the "reloc" in here which (oddly enough) may be subject to translation.
Would have been nice if such a relevant detail had been added to the
description.

Jan


