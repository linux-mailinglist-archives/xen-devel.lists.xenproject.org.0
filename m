Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ADEFB223C4
	for <lists+xen-devel@lfdr.de>; Tue, 12 Aug 2025 11:55:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1078512.1439544 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ullie-00057T-Nt; Tue, 12 Aug 2025 09:55:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1078512.1439544; Tue, 12 Aug 2025 09:55:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ullie-00054m-Kc; Tue, 12 Aug 2025 09:55:00 +0000
Received: by outflank-mailman (input) for mailman id 1078512;
 Tue, 12 Aug 2025 09:54:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Pr65=2Y=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ullid-00044d-NL
 for xen-devel@lists.xenproject.org; Tue, 12 Aug 2025 09:54:59 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 685bc83b-7762-11f0-a327-13f23c93f187;
 Tue, 12 Aug 2025 11:54:59 +0200 (CEST)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-af8fd1b80e5so936586266b.2
 for <xen-devel@lists.xenproject.org>; Tue, 12 Aug 2025 02:54:59 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af91a21c022sm2134216366b.101.2025.08.12.02.54.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Aug 2025 02:54:58 -0700 (PDT)
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
X-Inumbo-ID: 685bc83b-7762-11f0-a327-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1754992498; x=1755597298; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=1LpUH7HgtAJMURFE1DFIZimmj822E6aRthFxF0nuiu0=;
        b=Gsm47rOYT9GE9irNsbk1Lt3FROe5oitVLpKOE1pE/jiQz6IHs1ZnAsFkrd3NLFTaAP
         HCH1XDYFwMWILgGGUFv0z/HgMWxHI0Lx67AdRTpXL/uk2EnByST8YCr9G+alckrfxwx7
         aQTyfXf63l2tkCVWnDbLoWGjWPyDiHuCydd6r4DmnIZsfZy3dsc+F0MYo0RUSVrteFfY
         azwdnXtrpkmAFYrpxtu3LUde9DL7a/ac2Ptqb1iTU2Eqtxjboh5l9lDX+vGf/ESR6+MO
         FMSk72RZEef6nkRlB3Bml30iPbSArctxY2iGGXeJnULLZy52OydDek6lG+ZSK36l4Pyv
         ntIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754992498; x=1755597298;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1LpUH7HgtAJMURFE1DFIZimmj822E6aRthFxF0nuiu0=;
        b=wOYIySb3OqacA8oXwyW2eiDSBGq+xPhyYXd1pZ+ZRNCAFV6pjWAOeo7DpFHb1+wBUV
         vzA+aJIQGfb5IRQPyjuLF4+te7kZ7sHdcxU722HGMd71dXCd0p3CneSr/kAZhBGP9kGv
         5Gk4jwg6MMEBwyrNVcVX20GMjIgD8TbFFytWTOMs3ocFi50uaxacEIJ4VLsmKis17J3W
         jKPfSc614an09+Mei6ceEOuq5jXhq55o/OPTrYAQ2CoGN8YHcZ6fc2sFxSkGnaA6ytrO
         4qKFAmo61z7Lsvf5uivbDZNPFTcjUH9V6mW8Q64YJWBODjFB7b1zYJ5GYO5Eb8fS6Vjb
         N2JQ==
X-Forwarded-Encrypted: i=1; AJvYcCVk0rHOqu97Z1M1b32IueKvczJzIuhPTJywj4BWNC+q0dit0IETPTDl30V1gFTpSdzfRn+lbu6p2sc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzCPFK/GIVQb5yHLsKsToehjO9busyCQZHBtu1W/wSkHMZXlunu
	nE2O/nz77Seie/J8ZhsMQtQp9E+uVvqMD393RWyWPKtblQ+wKfnEhRNMsQ9SgX6g+Q==
X-Gm-Gg: ASbGncv4BRR6DARer8ujwD0t6ltDGBhNq0agwXXig3Cph/kwg6iQm1nG3CltGo76Fx6
	4SgPX3h9AdmbYCpaRWqVGbeTn7kZvCwAXUwo3xeS0hFzzZmeNB9J2WA76FcbCsaYiZ7dXSOvRkz
	FzYCeCUW7Kf4I9bIQfggXN6O1kjnLph4rWjnAH63PWxLEaA0bSBc8F63dYT2ZDaBbdhVE7a6yd+
	4T2sUWM+cbuoqUNPBRnOMQ1tuFBEDcvSw28khFhvj0dJ6cZFJJDKwlXp81t1kCVmLFUHMtR6947
	zI3Et9v+GiAgaBZ/M3AUF+QslxvYzu/lAtTmGWDDbk/gX96MyufeqHTr2Hu2WnOV8SfIQZTboQG
	+3fpVkbDKSE8L9yCGjcTTzhFgS8Y2apxT1u1bdb1LQohmJNNeba50yYeN/Uly3oQOhkgQKu3Taf
	sQcAwDkFB6xSJimeVLUg==
X-Google-Smtp-Source: AGHT+IHjIMfqjP2OZ8MvcQOqjsGqzpnLY51Rsn2G2Mi3UWojfGHetkCyS175GxNqg3htynl1vvz8xw==
X-Received: by 2002:a17:907:980f:b0:af9:c10d:746 with SMTP id a640c23a62f3a-afa1dfade34mr262872066b.10.1754992498547;
        Tue, 12 Aug 2025 02:54:58 -0700 (PDT)
Message-ID: <7931ecf2-4ff4-4eb2-875f-dbd316a08728@suse.com>
Date: Tue, 12 Aug 2025 11:54:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 12/22] x86/traps: Unexport show_code() and
 show_stack_overflow()
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250808202314.1045968-1-andrew.cooper3@citrix.com>
 <20250808202314.1045968-13-andrew.cooper3@citrix.com>
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
In-Reply-To: <20250808202314.1045968-13-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 08.08.2025 22:23, Andrew Cooper wrote:
> These can become static now the two traps.c have been merged.
> 
> No fucntional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>


