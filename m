Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6611897E9DB
	for <lists+xen-devel@lfdr.de>; Mon, 23 Sep 2024 12:23:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.801853.1211884 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ssgDv-0002SG-TX; Mon, 23 Sep 2024 10:23:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 801853.1211884; Mon, 23 Sep 2024 10:23:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ssgDv-0002Ql-Ps; Mon, 23 Sep 2024 10:23:19 +0000
Received: by outflank-mailman (input) for mailman id 801853;
 Mon, 23 Sep 2024 10:23:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aZUN=QV=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ssgDt-0002Qb-Vk
 for xen-devel@lists.xenproject.org; Mon, 23 Sep 2024 10:23:17 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d852f39d-7995-11ef-99a2-01e77a169b0f;
 Mon, 23 Sep 2024 12:23:16 +0200 (CEST)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-a8d13b83511so508537166b.2
 for <xen-devel@lists.xenproject.org>; Mon, 23 Sep 2024 03:23:16 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a90610f4400sm1195155966b.84.2024.09.23.03.23.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Sep 2024 03:23:15 -0700 (PDT)
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
X-Inumbo-ID: d852f39d-7995-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1727086995; x=1727691795; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Mj9J+zCG5PbTG3mgyILycRM/5ZmhMObTv4pc8nbCmeg=;
        b=U3TVvtQaasAludhoFaeEUtl2UtXp9MsHpBBaAKhKHWNr/VTu6iOoy61j4K+RziKDY2
         jHHXRToOtYGCfh5mJFrs+EaWSSCW/fal6T2ciKkxIObqUn4x9hnGmqBGQZs+QjGxPh66
         lpClIjQnbpo09+yNauOT4MLLTYji2WX2sYJTVoNyisNGjYYttNhNggzGMm9DsD7MMhvk
         INU5lXewjf4VoErJui8cMahIFOlaNSPCMeTRdPPHkmBF9TiB2sEBTZkrMxsOfhbu5Oah
         s9D2avoxS5GSs9fji1yUr5NpJXQxokN64KXQojigRTAoCe7YHIBWk/30S3H0u5Vfz17Q
         I76g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727086995; x=1727691795;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mj9J+zCG5PbTG3mgyILycRM/5ZmhMObTv4pc8nbCmeg=;
        b=eaC/e02jf3QBwhzGUvX1CnyVgzybWdvdwWRGOk1Fw0M6567e+dvizGijlq0GOWvTMc
         hqcuYs9z0vnzlNZMUmw8Qscq4ymX1bdSHrM/VZKL+7HnsFEa6i17XYTpRisXCjhKw6aA
         wA2McGlLVqpv1y5LfrGOWqziIWft0AKoOL9z09YXIdwmzMfW+/GbNdjxiVCG6MsLuTS6
         93dzfXq/0E/XN/cei17ue0jR0TzfLyOIduIQCGy3beZpbdLnl7GLOZoCBwrYcx0qX2pG
         ShoTOESCxk4HdW6fgx7e6Zwz69xrajIC2o2Yz0dJub0mfNu4bCj/H5B1+4IuhcfSbSnZ
         Fgkw==
X-Forwarded-Encrypted: i=1; AJvYcCXYNwnwyn5v1OZNSsoizkaNLP/DrtfLrM1+V/KBxiJjEJYFuc1G/E+pT8n/dS4vIoHWhQmnxvQDJU8=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy5xmG54xilS6KUqf6d9hz5zQGDaC1b591csklehBygZtITfR7C
	TMdHExKaMsZ0a2pxTXIacbY1UAPW2TvEDj4DOd9JIS+eKoJJ4zf68NfTwq79rw==
X-Google-Smtp-Source: AGHT+IH2KJJTSxc+n/auZjNhZegqMAlSJV7gd4H8A3DhyMupssQYHXI4EZMAccUhH7Uw35EEAxwqZQ==
X-Received: by 2002:a17:906:dac5:b0:a90:41a9:7c3e with SMTP id a640c23a62f3a-a90d5b00ff3mr1297476066b.65.1727086995361;
        Mon, 23 Sep 2024 03:23:15 -0700 (PDT)
Message-ID: <c27ebb1a-6ca4-41d7-99d8-ea613e3120fc@suse.com>
Date: Mon, 23 Sep 2024 12:23:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] xen/arm: mpu: Implement a dummy
 enable_secondary_cpu_mm
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org
References: <20240918175102.223076-1-ayan.kumar.halder@amd.com>
 <20240918175102.223076-5-ayan.kumar.halder@amd.com>
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
In-Reply-To: <20240918175102.223076-5-ayan.kumar.halder@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 18.09.2024 19:51, Ayan Kumar Halder wrote:
> Secondary cpus initialization is not yet supported. Thus, we print an
> appropriate message and put the secondary cpus in WFE state.
> 
> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
> ---
> Changes from :-
> 
> v1 - 1. NR_CPUS is defined as 1 for MPU

Not quite, what you do is ...

> --- a/xen/arch/Kconfig
> +++ b/xen/arch/Kconfig
> @@ -11,6 +11,7 @@ config NR_CPUS
>  	default "8" if ARM && RCAR3
>  	default "4" if ARM && QEMU
>  	default "4" if ARM && MPSOC
> +	default "1" if ARM && MPU
>  	default "128" if ARM
>  	help
>  	  Controls the build-time size of various arrays and bitmaps

... merely set the default. I wonder how useful that is, the more that
- as per the description - this is temporary only anyway.

Jan

