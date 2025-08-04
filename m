Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A6006B19CD3
	for <lists+xen-devel@lfdr.de>; Mon,  4 Aug 2025 09:41:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1068848.1432709 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uipoS-0002wD-UL; Mon, 04 Aug 2025 07:40:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1068848.1432709; Mon, 04 Aug 2025 07:40:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uipoS-0002tu-Rc; Mon, 04 Aug 2025 07:40:52 +0000
Received: by outflank-mailman (input) for mailman id 1068848;
 Mon, 04 Aug 2025 07:40:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=c2vN=2Q=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uipoR-0002sG-Bt
 for xen-devel@lists.xenproject.org; Mon, 04 Aug 2025 07:40:51 +0000
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [2a00:1450:4864:20::530])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 579b0470-7106-11f0-a321-13f23c93f187;
 Mon, 04 Aug 2025 09:40:50 +0200 (CEST)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-61571192ba5so6016069a12.2
 for <xen-devel@lists.xenproject.org>; Mon, 04 Aug 2025 00:40:50 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af91a21c099sm679150566b.108.2025.08.04.00.40.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Aug 2025 00:40:49 -0700 (PDT)
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
X-Inumbo-ID: 579b0470-7106-11f0-a321-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1754293250; x=1754898050; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=B9SF7RZMtoM3hYCSMqGBiDg2hhOtnjtDrsiw4g2HWks=;
        b=MGJY5xGjHWXMSG5ltdIVDzuzKZPfW9Q6lctL65EPOqte2F6YldPunz5SIpcff79GTA
         fDmWOBEP7uXNA1sA11VSSySlwEahrv0hxAJViabvQPaCw7yEvf3wG9jXIiyQ9Jpc4D17
         KiGEhkLnpiT3iRednw7Ce0gNAOcs1lJdEXNxvvI1BndBSCCJhMkL5wdLVEGaOdjTcxJV
         08UdJqPRe8s2CfMaNqAy9agB5desGuLi2VbHWjcQDplYf9PyQ001cbGB6vYGVltnQK45
         o8+TMkRJD/NGrRwMXciVJX9ozQKorP6oosDspBGcHDFK2E+3P6hJ7nPu4fpmiHlzfS3X
         yTBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754293250; x=1754898050;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B9SF7RZMtoM3hYCSMqGBiDg2hhOtnjtDrsiw4g2HWks=;
        b=o/7A3+SsylRrnRZ9wKbYmjnZi/DlW4RFbQjkZN+okFTIZEQeyvP9sK2fwZd5W3b4x/
         zwM2GklZE7nIL3wX8fzRYTWNiilMYrwmKpo/jPSjBqXdBW6hipN+awyJ9YgZOoNxj81E
         vheGLRJZHcT6kgyT6XTTXnK/fGD1Ez69UzORPdKmPY8MQr3Dkjw53AicLjd3a01cYFKk
         mKx2+84BS2ajIlsTtw3vpmp6Agl5vZ9OxOeBD4lIOUGxuJSIr7QSMMknrYJliD0MwyDl
         Q3h5/8v7Z9LSLy8wCJXlrxpRspTjoWd3+5UM4GN9Ry5FnVVqk06O67QFMgjnC+FV8IIZ
         sFbg==
X-Forwarded-Encrypted: i=1; AJvYcCXLCEkASqhefnkpLFvlcME1MjOqAPn+8/EWZMnGN9QqTErXh3xA5K6ly5IPLqRWiFV8zSkQM2C5j6k=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyJBYzbI2pnqlkkrcb/JBT9jZfiD8PkRbwb1j+HcQCR4RHXPG7h
	5dpCKqaOy6wS0iung8uRF/mL0J2Pfs+IZBq9TS3daE4efhy5PaydC3z1GWuZfKxnEw==
X-Gm-Gg: ASbGncv7cFAywMEa/XGCKCSfhtGaO7s8dumI6FvYMQ8VAs/QttBgP+K8dtZCP0lNON1
	iLY2h/haKKCbFWSMyYSPyo5LY+Fu8vlQ2O57UNF3dfkTwM7jUhuZnqGSf79E4YhSq0xN1UjczoZ
	DJ2WpQjzf71EuASuHsCaHuARornXb1n5amFK1lO21zuhf9Y7dCmOfVomhNXVnwsL3ZT04z1Z0WU
	kP6gDSctbbbhCI1BnI8IaRBHOkMFLPxhyfUcjxIHMRiBmiRuhsopgn/LGTvNItvWg406FQ8umis
	ZLMqM3G1PmxZ+RIZTvd2NlOmtZAVE6hRD6cV68r7+S/lcijCMv5lXeyixyMmongI9aQNHmh4gJZ
	73F/JLVnO4MoIL3GDPJN4jV7oRMoNpl5/1jkuvSuv+6ePsYVKuWZ3FYk24mUnMskwOvyK/kYNN6
	G360dVMIRaHE7oWRIAEg==
X-Google-Smtp-Source: AGHT+IHp45BE/jBmN4s/ABhjXU97ga54ghngbZuBA9MdMRmP88/9LLDDMQiDxNE2I2TP7/sNlinY3A==
X-Received: by 2002:a17:907:e2cd:b0:af9:566c:4cba with SMTP id a640c23a62f3a-af9566c59a9mr536463166b.9.1754293249714;
        Mon, 04 Aug 2025 00:40:49 -0700 (PDT)
Message-ID: <770f41e5-5d02-4358-8f91-e577f762cf58@suse.com>
Date: Mon, 4 Aug 2025 09:40:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 05/25] xen: introduce CONFIG_DOMCTL
To: Penny Zheng <Penny.Zheng@amd.com>
Cc: ray.huang@amd.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20250803094738.3625269-1-Penny.Zheng@amd.com>
 <20250803094738.3625269-6-Penny.Zheng@amd.com>
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
In-Reply-To: <20250803094738.3625269-6-Penny.Zheng@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 03.08.2025 11:47, Penny Zheng wrote:
> --- a/xen/common/Kconfig
> +++ b/xen/common/Kconfig
> @@ -627,6 +627,10 @@ config SYSCTL
>  	  This option shall only be disabled on some dom0less systems, or
>  	  PV shim on x86, to reduce Xen footprint.
>  
> +config DOMCTL
> +	bool "Enable domctl hypercall"
> +	def_bool y
> +

Just to re-iterate - we don't think we want things to be this fine-grained.
(As an aside, nit: "bool" and "def_bool" are partly redundant with one
another.)

Jan

