Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 69347944A85
	for <lists+xen-devel@lfdr.de>; Thu,  1 Aug 2024 13:39:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.769619.1180504 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZU9H-0001r0-3b; Thu, 01 Aug 2024 11:39:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 769619.1180504; Thu, 01 Aug 2024 11:39:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZU9H-0001pW-0l; Thu, 01 Aug 2024 11:39:11 +0000
Received: by outflank-mailman (input) for mailman id 769619;
 Thu, 01 Aug 2024 11:39:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/4YK=PA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sZU9F-0001pQ-Aw
 for xen-devel@lists.xenproject.org; Thu, 01 Aug 2024 11:39:09 +0000
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [2a00:1450:4864:20::132])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a947ca2f-4ffa-11ef-8776-851b0ebba9a2;
 Thu, 01 Aug 2024 13:39:07 +0200 (CEST)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-52f008aa351so9941080e87.0
 for <xen-devel@lists.xenproject.org>; Thu, 01 Aug 2024 04:39:07 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5ac64eb3aacsm10013068a12.64.2024.08.01.04.39.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Aug 2024 04:39:06 -0700 (PDT)
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
X-Inumbo-ID: a947ca2f-4ffa-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1722512347; x=1723117147; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=M05uZ0koUYcpV7q+n1GeR7wzIafZ+gDMPMR1VwSr0rY=;
        b=NMKKyt1Q51xtgiIGqWgx1r+HcdUOZDuRAacbfBJWL5WoSdEOzBJZV/blXXOPAfud8E
         zGWWaGmsFd9e4Gr9rSkGmdhc5UC/RyHWEinf9zwr7Xru77tk4YkdByOu4DfmwQXOPSQm
         hc8DU3KswgcVpFRWn+FMiKyehk56zUsiH/naZ7rEFU3nuF6GmjLLT+Qc7us8hnPhCwLo
         lvXy95OL68rS8F8U6osQZpAnqwlgZ1pjO3bQbOEZtgKRqKS6CIR0tkrOPhJOzPCkHyEz
         fJbMEp7/l/zabMDFoOkpwsje9pV09him1OIXpNsFADchr6PeDAhvuQISiPPQyDe5CUWJ
         3wZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722512347; x=1723117147;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M05uZ0koUYcpV7q+n1GeR7wzIafZ+gDMPMR1VwSr0rY=;
        b=A/dbs0rmNi23cJtczH6gLn9dTiNuyhCQlTpbRu24OJUDxHHHCBnbVhQ+btFLtaGa+u
         lb78YOOAeVscy7p/Xl43ksFamQuVZ2L/W4jH1W8KWYcFrHsIlcHBJnb5UzMgtNT2WvY3
         BhqBWUG2HTm6aVbj5bN5IHooD3L5UHNTQ9HqHRKbhWpY4nE2PSDbjGR9tjjqYAgo7ZSo
         45hPFnxt/E1KNOYPnAw2MqkeO/2YEVIDOwHpeo0fdztdqctvHP66ymR/sJJQLHZXGkBQ
         y2qqsPPXVXOk1z8kQM00sKHOSKnGO2BI9eJpFfIi48kJWYnKHamhuOm5Y1GCEe7am3Xz
         WplA==
X-Forwarded-Encrypted: i=1; AJvYcCXrToHoyqM/RYJTk2eLlS236RYrHeIUCV4jUsAxFsUuzguD0SV42efs75Cx5FxFIhMbJWrIcwpSeyyrG35JFU5jrufFs9nT3ZSYVQTWxWQ=
X-Gm-Message-State: AOJu0YwNQxRqUJdjNVrPJ53VP1tngggM78maUR7NB4gK6MFWwZKxXa8E
	vYTJ7ZinGl7kb7bFqpEMxH7RdlvmsY0ujqT+cQRSZzQFIQ4YoMcmE0baQqpTug==
X-Google-Smtp-Source: AGHT+IGk6g3SKmz43QaJz4xZBlqonYejxLu8OjGD0P9YlAiIhfZPO6LMqceEgoyTR6CO+QO/OekXbA==
X-Received: by 2002:a05:6512:1c9:b0:52c:e030:144e with SMTP id 2adb3069b0e04-530b61f5572mr1137420e87.47.1722512346583;
        Thu, 01 Aug 2024 04:39:06 -0700 (PDT)
Message-ID: <b9356c61-d927-45cf-857d-e9c80e9587eb@suse.com>
Date: Thu, 1 Aug 2024 13:39:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v5 13/13] x86/hvm: make AMD-V and Intel VT-x support
 configurable
To: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
Cc: Xenia Ragiadakou <burzalodowa@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Xenia Ragiadakou <xenia.ragiadakou@amd.com>, xen-devel@lists.xenproject.org
References: <cover.1722333634.git.Sergiy_Kibrik@epam.com>
 <827008e4af26814e4cd4bf6abbb92c77fc136aa8.1722333634.git.Sergiy_Kibrik@epam.com>
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
In-Reply-To: <827008e4af26814e4cd4bf6abbb92c77fc136aa8.1722333634.git.Sergiy_Kibrik@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30.07.2024 12:41, Sergiy Kibrik wrote:
> --- a/xen/arch/x86/Kconfig
> +++ b/xen/arch/x86/Kconfig
> @@ -123,11 +123,25 @@ config HVM
>  	  If unsure, say Y.
>  
>  config AMD_SVM
> -	def_bool HVM
> +	bool "AMD-V" if EXPERT
> +	depends on HVM
> +	default HVM
> +	help
> +	  Enables virtual machine extensions on platforms that implement the
> +	  AMD Virtualization Technology (AMD-V).
> +	  If your system includes a processor with AMD-V support, say Y.
> +	  If in doubt, say Y.
>  
>  config INTEL_VMX
> -	def_bool HVM
> +	bool "Intel VT-x" if EXPERT
> +	depends on HVM
> +	default HVM
>  	select ARCH_IOREQ_COMPLETION
> +	help
> +	  Enables virtual machine extensions on platforms that implement the
> +	  Intel Virtualization Technology (Intel VT-x).
> +	  If your system includes a processor with Intel VT-x support, say Y.
> +	  If in doubt, say Y.

Despite my earlier ack: It appears to make little sense to use "default HVM"
when there's also "depends on HVM". "default y" would be more clear imo, even
if just slightly.

Jan

