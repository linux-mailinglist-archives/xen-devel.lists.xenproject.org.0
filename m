Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 328D5AA510A
	for <lists+xen-devel@lfdr.de>; Wed, 30 Apr 2025 18:00:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.973846.1361878 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uA9ql-0002te-De; Wed, 30 Apr 2025 15:59:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 973846.1361878; Wed, 30 Apr 2025 15:59:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uA9ql-0002sC-AZ; Wed, 30 Apr 2025 15:59:55 +0000
Received: by outflank-mailman (input) for mailman id 973846;
 Wed, 30 Apr 2025 15:59:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=BSD2=XQ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uA9qk-0002rq-IJ
 for xen-devel@lists.xenproject.org; Wed, 30 Apr 2025 15:59:54 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2781cdd4-25dc-11f0-9eb4-5ba50f476ded;
 Wed, 30 Apr 2025 17:59:53 +0200 (CEST)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-acbb48bad09so62867266b.0
 for <xen-devel@lists.xenproject.org>; Wed, 30 Apr 2025 08:59:53 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ace6eda4901sm935196666b.162.2025.04.30.08.59.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Apr 2025 08:59:52 -0700 (PDT)
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
X-Inumbo-ID: 2781cdd4-25dc-11f0-9eb4-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1746028793; x=1746633593; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=UWj5FM9mLjk3pSrQ01H3MlDc5GyIEoIBb6WRU2aa4AA=;
        b=OQctR93U2J9x9xI5q0weoCSFP276tj1letsAEFpBfIOHJhNB3nMKi6sVAxoAAP2Kua
         woyMvCyZja5XgqT0enznEG5Fe2rpcfVWUiEjL+iJpTFv2R2kFnj+rFZWSYfWz2AqsZ55
         mFvSnPDqDE4D6h+AFnRen2wi32sgUtD6vcyirlQm0KYWFhv9EECNU367F12jaoWVs+g+
         VXI5MkTO53dY1tpJbLCrAwk56nfGgghm3hjh0ykeTkXwyY4UaTaIbyHXCM5OP/wpZsRY
         Aal0hSEQvwXIWsaL8/QVDkXFrfzSJXDzo+c3xxi2I0CDVYO7a3oyIxHtM180JG/2SEAq
         fzkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746028793; x=1746633593;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UWj5FM9mLjk3pSrQ01H3MlDc5GyIEoIBb6WRU2aa4AA=;
        b=dma0bLKcUXM9JnPPDMMydstXdizJTh2Nj11qOKskwmYYdRVOYmTOrOqqOhi3Nenn/D
         Dsa83Xd116BBycigtIJpHIosiFYr3rRrdfuKSEcUGhf6zi+JQY+QAsBB3xfdHztHTvzs
         Tcr6OhWT+IXDAGB7Z2gppB7NCLlvUVlXED7HyIWZzpNiauSOtmH5GP3yu12OagmxI0zs
         cL1bQQLQQjsJCqzdEZ2MSO0Whc5HSNPPmwoAALK9GHyO1wizDLVwMVsgIMpp5U23znw4
         uO/Hnjb14876PmebVowHsbccVOBxx2/CfBUVLUcHxx/BA0ODYncdQwRyF5M7EIYzN4nx
         HTMA==
X-Forwarded-Encrypted: i=1; AJvYcCWGSsTybyts1X/I2h0hlmWfPMrhOxENgRSdZBlkgUKPzBUq3+5qu7FSS742AcUglvp1AXYWqjKCVIc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzCuYqZxa1J6UNLHQak/ymIiu4mGlf5Xw0ODEeeO8AIBXIBdQQ4
	J4i/jGhZsKV5rvQCmYCLgbNWH5ie9oupWK8Zyo59eFUa9nR38+Qwq/HorJpP1Q==
X-Gm-Gg: ASbGnctDsTghgO5vSmI6AX96Cy6nQzEPfpq1dnjExoW4Kx+hxvJJEllv1lFU+I7qV5l
	5plrx4BtNS4LHkWn/hGEWIMOFnKE7s1z/yI6hefocDLpxJ6BvCm8tnaGKNMIks1Ba48toegBCwC
	LTplYkTSPdDcF//ycTdLu6CeUa8C0zThucPqnjSJykSmXV2XQ7cdO2cbKy/FCoLtnc+RTgcSxCD
	QV4vUxkYuJsZad0jKf4QqmRyJ47JRCny48RfN0vIEVFW6DXHyqHz9gSVJcbjXOr5gblkrtrDGV+
	L07GGXtaj3h0l+5sZpOcBJUO5ephMc4r7quKHKOnxdwR24Ksb5dU0zJkng/LWfq+gQqDfxoj9tm
	cCGe5S9bwuHB6poGVtFreHWJ21g==
X-Google-Smtp-Source: AGHT+IHjhzikOeH6euXYDS44dghM17JUKB41cPSZTcHYuFKL6y8HwuPpiJw5PjZObNhTxOePMyADaQ==
X-Received: by 2002:a17:907:3dac:b0:ace:cae6:c85c with SMTP id a640c23a62f3a-acee24b3eb6mr308184866b.39.1746028792984;
        Wed, 30 Apr 2025 08:59:52 -0700 (PDT)
Message-ID: <238c657e-a53c-4eaa-84aa-1d3310b65723@suse.com>
Date: Wed, 30 Apr 2025 17:59:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 1/4] xen: Introduce physaddr_abi CDF flag
To: Teddy Astie <teddy.astie@vates.tech>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1744981654.git.teddy.astie@vates.tech>
 <df0da6d56a9a9ca440b7bb2c7c0b71d66567e3aa.1744981654.git.teddy.astie@vates.tech>
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
In-Reply-To: <df0da6d56a9a9ca440b7bb2c7c0b71d66567e3aa.1744981654.git.teddy.astie@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 18.04.2025 16:18, Teddy Astie wrote:
> @@ -745,6 +747,12 @@ static int sanitise_domain_config(struct xen_domctl_createdomain *config)
>          return -EINVAL;
>      }
>  
> +    if ( physaddr_abi && !hvm )
> +    {
> +        dprintk(XENLOG_INFO, "Physical address ABI requested for non-HVM guest");
> +        return -EINVAL;
> +    }

Why this restriction?

Jan


