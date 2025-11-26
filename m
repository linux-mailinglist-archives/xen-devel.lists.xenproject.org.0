Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 713B7C88EBE
	for <lists+xen-devel@lfdr.de>; Wed, 26 Nov 2025 10:26:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1172402.1497478 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOBma-0000Jn-98; Wed, 26 Nov 2025 09:25:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1172402.1497478; Wed, 26 Nov 2025 09:25:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOBma-0000H3-5J; Wed, 26 Nov 2025 09:25:52 +0000
Received: by outflank-mailman (input) for mailman id 1172402;
 Wed, 26 Nov 2025 09:25:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=JzEl=6C=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vOBmZ-0000Gx-Af
 for xen-devel@lists.xenproject.org; Wed, 26 Nov 2025 09:25:51 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e5afc164-caa9-11f0-9d18-b5c5bf9af7f9;
 Wed, 26 Nov 2025 10:25:50 +0100 (CET)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-47774d3536dso5194765e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 26 Nov 2025 01:25:50 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4790b0c3a1dsm32711065e9.10.2025.11.26.01.25.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Nov 2025 01:25:49 -0800 (PST)
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
X-Inumbo-ID: e5afc164-caa9-11f0-9d18-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1764149149; x=1764753949; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Wk6WgRys9FouT6iO9lCQPYNCFSirGYzsyyY2HsqCEXg=;
        b=GT4S4BUbet4AE16xF1Z4JDKT/fbG/B/VOOUdedqMqQ6AfrIgpVzwvn4EinK2Ro/7hH
         pWzE0bqaHw0e4wiflrnn/PdYFR2zXf/bPBKi3d41Demik3J2W43RBV8I3PX5o1ddbmLG
         srsAO1Vf/fcOl6qsDgQsA9CmzBO6jinwjY29cb8NdsCNBVNoyI4cs9FccdA0YXxDw9Hf
         5p5aw+M1tPRvfjeNv5S/DRn07A4cRAylQxZl+P4T/CtRdbgQpzNjUJCRwn6FG7et2LbS
         acTZ4J0On65I+HeCIUpFJYKeUwLCuj9l02mut5hrgxlHNa3wWntTbmKbjU6Fgsvy2ljS
         1PGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764149149; x=1764753949;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wk6WgRys9FouT6iO9lCQPYNCFSirGYzsyyY2HsqCEXg=;
        b=odD8/01JBxV/yCqj4ToBc6oiwWHbAAyyW8c413WhlJHGGcWBv8mGPwAIyid4sHXb3/
         jjbTazwViAO2qpqgm6E88aFwCJ+Iqh4Qw4Ju4sEYF7zeNeHiUhpAC74VtX6ljpx4c5ul
         1Ka5FPn+2X8h9QSVJbBAyrZcdzRDnbPaaEoql7Sg/myfTswLm8+AEI1w3kp9rG1vPpNS
         15+N1DmEBSBx8I3A90nZix0QuI5OuPaoNiV/yCpeFeaQAaKE+5l0IcRovslbkMnFOjWa
         dk4hCo3F9/20+9FVFFbS7DgD24Cj9l4Ssq6KVhL9aQNhMfWfSkLew58H6299B4M+40ob
         yWWw==
X-Forwarded-Encrypted: i=1; AJvYcCWDmqezSlExXeSx9tCcLqgLg9YSzzLyIGmjsjL5qeY8vI17MAfkpZJfLWiqcVBhqGAYxa3btlCj+f0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwuSlLl28JEMQYixXSXyPAKVjUv9m31W3xZTJRy2SxySBCEbReH
	r7oUwKfQOE4tkyCnz6W1/3OWDHp4ZIg9xnNTupocD9WTAKWMpCf+jlQFcKLCWMzthg==
X-Gm-Gg: ASbGncsXJa4c/5lKyyQNEffbZkmhXgQO0nv3OJuOQ8ecMiaILNzYqrK9FEXgoGoUHwb
	l/n384tnTZFpR53Qyt7rugRiM13NiuTifev0A39FunZlHuecR8eOoEQ4mIeLRJhM+LNVR5jTcEY
	GbgDl5EJrx0cbBGsPgeD5hsrizKe2loaeQz4Ifk5j3g6J7L6NPDdB9zxQAieDtV9ZRlVoTmgi9s
	J3fXFD8wAVNQbbLBfJtIxQGCQuC9QBvwahht8aTojW/CXBiyUAL10UzrnNa54XyXSVKLagtEYnG
	Y3f1HXZ1NGx2gY8dsuUWX1w12vetMYwRc6i88Y2KyzjWzi9x0EhUktT5LpmXS+vU1Yrg3RQGthn
	9qwukg+uxuK7koCK27bwTaJiYeDwmqQ3xTVTccZ+f7XG29eUWkvtLUU+//5SyXWBbwehp8G5x0E
	cFHfP1+vSeDe36q6eUDr20KB38LA1/UbI9p8QQJbv2zhZsIT4DLgb42rm396BJ4WWbUyUDTqF0E
	8uhKfQT/t0ODw==
X-Google-Smtp-Source: AGHT+IGdiZwNmlf8nIMez9z0EyKOuFgLnYQUEkgD09UXnfURa9bQyhm4hmdXrFPdZ15QkM4nBWVlNA==
X-Received: by 2002:a05:600c:3ba7:b0:46e:59bd:f7e2 with SMTP id 5b1f17b1804b1-477c05139c2mr244503095e9.11.1764149149564;
        Wed, 26 Nov 2025 01:25:49 -0800 (PST)
Message-ID: <a73bd51e-14b7-450d-bec5-28af63b362a7@suse.com>
Date: Wed, 26 Nov 2025 10:25:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 23/24] xen/domctl: wrap common/domctl.c with
 CONFIG_MGMT_HYPERCALLS
To: Penny Zheng <Penny.Zheng@amd.com>
Cc: ray.huang@amd.com, grygorii_strashko@epam.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20251121105801.1251262-1-Penny.Zheng@amd.com>
 <20251121105801.1251262-24-Penny.Zheng@amd.com>
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
In-Reply-To: <20251121105801.1251262-24-Penny.Zheng@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 21.11.2025 11:58, Penny Zheng wrote:
> --- a/xen/common/Kconfig
> +++ b/xen/common/Kconfig
> @@ -654,11 +654,17 @@ menu "Supported hypercall interfaces"
>  config MGMT_HYPERCALLS
>  	bool "Enable privileged hypercalls for system management"
>  	depends on !PV_SHIM_EXCLUSIVE
> -	def_bool y

Why would the default not be Y anymore?

>  	help
> -	  This option shall only be disabled on some dom0less systems, or
> -	  PV shim on x86, to reduce Xen footprint via managing unnessary
> -	  hypercalls, like sysctl, etc.
> +	  Management hypercalls provide the means for dom0 to manage the
> +	  overall Xen system and other domains, including sysctl, domctl, etc.
> +	  In a dom0less or pv-shim build, they can be omitted to cut down
> +	  on the Xen binary's size. However, this comes at the loss of
> +	  significant runtime functionality.
> +	  So be cautious to disable it, as admins will face missing a few basic
> +	  hypercalls like listdomains, getdomaininfo, etc, hence leading to
> +	  have an impact on device-passthrough and DM.
> +
> +	  Unless you know what you are doing, you should enable this.

To be in line with what other help texts say, can this be "..., say Y" please?

Jan

