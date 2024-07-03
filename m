Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D9C519261E6
	for <lists+xen-devel@lfdr.de>; Wed,  3 Jul 2024 15:33:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.753048.1161313 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sP06P-0003ma-8k; Wed, 03 Jul 2024 13:32:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 753048.1161313; Wed, 03 Jul 2024 13:32:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sP06P-0003l6-66; Wed, 03 Jul 2024 13:32:53 +0000
Received: by outflank-mailman (input) for mailman id 753048;
 Wed, 03 Jul 2024 13:32:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NzTd=OD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sP06N-0003l0-Pl
 for xen-devel@lists.xenproject.org; Wed, 03 Jul 2024 13:32:51 +0000
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [2a00:1450:4864:20::132])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bd8ecc7d-3940-11ef-8776-851b0ebba9a2;
 Wed, 03 Jul 2024 15:32:49 +0200 (CEST)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-52cdc4d221eso6026332e87.3
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jul 2024 06:32:49 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-708044adc38sm10733327b3a.170.2024.07.03.06.32.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Jul 2024 06:32:48 -0700 (PDT)
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
X-Inumbo-ID: bd8ecc7d-3940-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1720013569; x=1720618369; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=SR95aC3yCJp/ZP5AJgIu1r9QKXGg4iWOks4t3pW9ZCI=;
        b=eMDPI1O7AvcseXhwJ//4VY1kC8xaEtHbur0UGkiEVjQBpIY7ecYmIN4pn+bs1Tkjfb
         QQemtd53SStpN/Yn8tmP9Cm6Pe78II/R+d9AH4200a4B7iJhfe6xCAU7F+H8md82g3w4
         lSGUMYijns2X2h7b3IF7ImQEjPfSlJNNKF/VOzm6Tnnf+sF8DyK+PVQOtJMZYFSufeFw
         bBpV96dYycHYOoMPOTgWOMRnhs0PmE4bZU29tZPQY76NdrkAVM97GrRBdzx0SgEy5XAO
         gXz4jJ90AU9ziwrO+1FC72Bsrt7WRwO9PpwxZAPLWO4PQBFrjUQhbQFYuSNOW3sbBU7u
         Eilw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720013569; x=1720618369;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SR95aC3yCJp/ZP5AJgIu1r9QKXGg4iWOks4t3pW9ZCI=;
        b=ZoxDp8g9nANkFnF1AHDCUZP5bPZbRQIeatKEMdjDBtKQ+01k50DrtyA2H3BlmEuQ6y
         69jMWrrjrAxIAr5jwZCrVIbhVeLD1jSXZg5Zp+LxIDcjceUVV/CGVvb7WBsZ0nPVwsa0
         WXOq23qSgMU7r3SbFYx1QR7xp/4azixCD0rMrMGiUzN0ROJ2zNLCw/XPgjtJl/7Onufr
         BIQomLpWi4PZ+DvwmyXoPbDCH6n+LMcNuxQ1c/kCy7flXuV4BlAkoWhayvWJ4jqeJpgQ
         lcVMcTR/JP76ULHBuQro2GpXB3j4460m5ztn9HY0tLzeZP043VPyHF/w9SAFWmtHb8va
         uOQQ==
X-Forwarded-Encrypted: i=1; AJvYcCWRT2QDxeX3DwgInw7O9UNDzASsSXkrU1bFDZk6JpaNjbT1sSaZqYI5RPyDNRJviCqDUTZbcHYmx79VqGykERs7QvbyCHTRaRjO1bSIeYA=
X-Gm-Message-State: AOJu0Yy35e82uE2TYGYkY5JYFdBvFLsMszQsYRdWjwzQq2MRLfEIjeJk
	oIQ8D6Z6KiGZvPJEam4SJWlZmhe09CMWGpV7d5w+ruX6k4EX0rx2jLWBi5xeog==
X-Google-Smtp-Source: AGHT+IEIWNfK93Y/yHb39tqSx214dxaHw3/JuvysntnLhaOM7j9qdjdWq09xdagbLFPixLVbk4kz1A==
X-Received: by 2002:a05:6512:3083:b0:52c:e19c:ed90 with SMTP id 2adb3069b0e04-52e826fac53mr8196826e87.46.1720013568768;
        Wed, 03 Jul 2024 06:32:48 -0700 (PDT)
Message-ID: <d9f94662-92b7-492b-84cd-a7e6b1ab68b6@suse.com>
Date: Wed, 3 Jul 2024 15:32:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 16/17] xen/build: address violation of MISRA C Directive
 4.10
To: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>
Cc: consulting@bugseng.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
References: <cover.1719829101.git.alessandro.zucchelli@bugseng.com>
 <c3d0eb70d894a1dc0ddd53cacd6a525bc10577ce.1719829101.git.alessandro.zucchelli@bugseng.com>
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
In-Reply-To: <c3d0eb70d894a1dc0ddd53cacd6a525bc10577ce.1719829101.git.alessandro.zucchelli@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 01.07.2024 15:46, Alessandro Zucchelli wrote:
> --- a/xen/build.mk
> +++ b/xen/build.mk
> @@ -18,6 +18,8 @@ quiet_cmd_compile.h = UPD     $@
>  define cmd_compile.h
>      if [ ! -r $@ -o -O $@ ]; then \
>  	cat .banner; \
> +	echo '#ifndef INCLUDE_XEN_COMPILE_H' >> $(dot-target).tmp; \

Leaving aside the question on the INCLUDE_ prefix (see earlier comments
on another patch in this series), I wonder what good a guard does here
in the first place. But anyway, I expect this again gets us into "we
need to mechanically and slavishly follow the rules" territory.

However, shouldn't this first "echo" use > in place of >>, to prevent
surprises when e.g. an earlier build was interrupted at exactly the
"right" point?

Jan

