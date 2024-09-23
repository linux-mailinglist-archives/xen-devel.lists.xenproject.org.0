Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 933C697E9D6
	for <lists+xen-devel@lfdr.de>; Mon, 23 Sep 2024 12:21:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.801846.1211873 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ssgBb-0001tJ-GZ; Mon, 23 Sep 2024 10:20:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 801846.1211873; Mon, 23 Sep 2024 10:20:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ssgBb-0001rg-Dp; Mon, 23 Sep 2024 10:20:55 +0000
Received: by outflank-mailman (input) for mailman id 801846;
 Mon, 23 Sep 2024 10:20:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aZUN=QV=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ssgBZ-0001ra-QY
 for xen-devel@lists.xenproject.org; Mon, 23 Sep 2024 10:20:53 +0000
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [2a00:1450:4864:20::136])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 825627c8-7995-11ef-99a2-01e77a169b0f;
 Mon, 23 Sep 2024 12:20:51 +0200 (CEST)
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-5365d3f9d34so4047191e87.3
 for <xen-devel@lists.xenproject.org>; Mon, 23 Sep 2024 03:20:51 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a90610f3ad7sm1203431266b.52.2024.09.23.03.20.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Sep 2024 03:20:50 -0700 (PDT)
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
X-Inumbo-ID: 825627c8-7995-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1727086851; x=1727691651; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=2P7LcxzgZrM28thxhI9pUX0Wh64W90mKwGvDa6EtThE=;
        b=VupiBrZIM0smyXvstQjN34jnb8r/LQZt4dUY7vuzfvxc2YxZamA6YFOyk+EtPLzCcQ
         leQRR9DUdHwAfKDcw5QbT+Z1M5vmnimJFNF1RbU2ngQuCjBFdY0nnAMSIw3b4T/Z30dl
         sjo+9lijrgGghA6GIQnxcTIeDhJaGrOoMrKfqiRmCCWWaFI2GSbJQnjxK3O/9Csi/+1r
         mjxQARjB7GgsAHP5CDEdYKNN7KYMDBSzCcyAstfVMk1aibWfwIEaRF7Yem/MbgZi7l4o
         n73BPyXx6tdbB5HD+eRBPvys/xD6fuZvMSNjmpxVG1fkeFmgO7HBJNom367t82vrsTfZ
         OTYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727086851; x=1727691651;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2P7LcxzgZrM28thxhI9pUX0Wh64W90mKwGvDa6EtThE=;
        b=Z2XXo3qaYaeR8Y0QyODPJ3ZmAODzvIlF2zZ263vhuCigCcp/o09GWMmC/Ac4Ewp7p+
         jMaLuhCP0Cumnr4xHTcqI6LTyZjlnTSGNa8sK4hQcB2Sg08uQySKOQ+HpQ1X/5kisT/x
         QUXIErejry9nVjrK4+uWiMWDGgce1EuchR6Krd/QKbjxq4tsjlLToF3iffaj0Z1ttMjK
         XK4R9PpQ017PkyvUTzVWd+YvTPPbPs7RfDlvrsAMxXB44cfdIfK/IfkUGkKzMFughZXv
         aUdUSPMJkrTjnsBE1qZMU+kpy0JYd83g2xhNc+PHqBHf/G1f1DprE0ntnye32Ts2Zp3C
         lw7g==
X-Forwarded-Encrypted: i=1; AJvYcCUlYsxNHy7/lhfnRHVMqIsLUzzNZMmWCszBxnZ7XNIbanftuGl4W8qoBX3tbtL0LLB9gcCnawvRIo8=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy590IYLC7MIFmOc2h/qIdl4BaxquYIAcu3439jz/bTwxXdxvfS
	Bg1jfzhWHd06kSOLkf5qFpvzv36/pWbng16EQDoLeHYtu4npLaFiCSaNc11IGg==
X-Google-Smtp-Source: AGHT+IFc9Y9P7yxTuJnwOFCy9MYCrrGlWzNn9YLFlsHoWSsBb5AWBtV2XnRQXm/fS30nFwAxoAqNaw==
X-Received: by 2002:a05:6512:1295:b0:536:a50a:3c25 with SMTP id 2adb3069b0e04-536ac2d6914mr5820870e87.12.1727086851018;
        Mon, 23 Sep 2024 03:20:51 -0700 (PDT)
Message-ID: <bf4cd191-c7f0-4150-bf75-bb1359beef36@suse.com>
Date: Mon, 23 Sep 2024 12:20:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] xen/arm: mpu: Introduce choice between MMU and MPU
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org
References: <20240918175102.223076-1-ayan.kumar.halder@amd.com>
 <20240918175102.223076-2-ayan.kumar.halder@amd.com>
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
In-Reply-To: <20240918175102.223076-2-ayan.kumar.halder@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 18.09.2024 19:50, Ayan Kumar Halder wrote:
> --- a/xen/arch/arm/Kconfig
> +++ b/xen/arch/arm/Kconfig
> @@ -58,10 +58,24 @@ config PADDR_BITS
>  	default 40 if ARM_PA_BITS_40
>  	default 48 if ARM_64
>  
> +choice
> +	prompt "Memory management system"
> +	default MMU if ARM

Why the "if ARM", when ARM=y in all cases?

Jan

