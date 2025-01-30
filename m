Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB355A22DBE
	for <lists+xen-devel@lfdr.de>; Thu, 30 Jan 2025 14:27:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.879573.1289784 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tdUaF-0000Wk-6P; Thu, 30 Jan 2025 13:27:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 879573.1289784; Thu, 30 Jan 2025 13:27:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tdUaF-0000Uk-33; Thu, 30 Jan 2025 13:27:51 +0000
Received: by outflank-mailman (input) for mailman id 879573;
 Thu, 30 Jan 2025 13:27:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zr8Z=UW=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tdUaE-0000Ua-3U
 for xen-devel@lists.xenproject.org; Thu, 30 Jan 2025 13:27:50 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ffdbfbf5-df0d-11ef-a0e6-8be0dac302b0;
 Thu, 30 Jan 2025 14:27:49 +0100 (CET)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-aa684b6d9c7so144421066b.2
 for <xen-devel@lists.xenproject.org>; Thu, 30 Jan 2025 05:27:49 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab6ee76b8fcsm54222266b.137.2025.01.30.05.27.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Jan 2025 05:27:48 -0800 (PST)
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
X-Inumbo-ID: ffdbfbf5-df0d-11ef-a0e6-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1738243669; x=1738848469; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=1uxPaAwc9ZrWb1DbjPqvZUMoPMtg0HkW/cwKFCiK668=;
        b=gLuUwYoaG8MePauCzk3wVmU9uIeAy7Amx9YhcLxAUBNOcEj+q9BxOoOOvm0GEH0ZIp
         S+kN4VHOU4ltXXV5e6RSMj/E0KKNU6fQy7Lbaza3WAZ2o1mQ3W1TkVAXRsGVzv3rxVM3
         FAzogxNh/Ez8M6fhOc1E8NQu4VsUr54LCE7gG8PkqP988WGA+vKy0mVpE5wGwAJ10qE+
         SAVMh/+c1KGjfUZq+hOI8zJvJLLCYIhLYOVDLwzVroDj1FLnjtSPc32WFfBaLb/tzee5
         vE5cH020VuaOq9OnX8Z0dt2U5fT19Uq48QVnX8cnk3lIoxOh0WHk2SdcNYb7WbAUlA6t
         8BaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738243669; x=1738848469;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1uxPaAwc9ZrWb1DbjPqvZUMoPMtg0HkW/cwKFCiK668=;
        b=cOz+RAEvLzN/cZ0Rh4eNsBra2OyXFeOqWDQj4Kl7OpInPfh+cJJSALsiPcak1UyKfC
         lpDdkRp7PyzawIZZb5pFSCejA5PjPaUHLUfdBSWwNUtChZA69VYMy4qt4qtxODoL9KmR
         rfzLFmXhppitR9ZyMDKHZ4MAWjX/bnm8ivhOQRQVm+2P7z0cNMYPglikb4W3DSq+aZQA
         3a13M5utOsn4ZLeMtVTeNOznZlr3sw0ZvsVtZKH9KU2REOa4GKyaORPTzeYl/1QHKZ77
         fYuV/hKK5eiMtC4OPkP2xDGP9P7NFgCaubgvYO8ej762DqKAlRcCCmzCyW+0CoY1TNhv
         b1ew==
X-Forwarded-Encrypted: i=1; AJvYcCUepUIMglu0tmNroSAO3JOagj72Dg/Bacy3ZjaZAHe1GswJPev/n94SIdXVRXG/gJBWA/4yvw0Vm/Q=@lists.xenproject.org
X-Gm-Message-State: AOJu0YygtrdxpWA/n8dm++Uk9XZogioA7WBXHchf52rxZAI5A0vJnh4U
	eJ1W3W0rdQkRQJ81syZkDvm4EMAzcTHkxNChRUrEGohkDYH7cl7ghxjW57fU1Q==
X-Gm-Gg: ASbGncvyCBcq9BNgxFhBfB1r22IJMAu5WZsflxSYIdRJMq8piFutqhW1f5tdJHp9Rbp
	YTgJD5DYvPjjJpiR5CSYoB9gctuSNYJrMeAZW9m8pnYz7HOUID2e98lFJUe1dZPSbVW3JT4qVCb
	KM2qY948ypiESWhfK0vZX+wbGZkHq+/2ZMzYlgCwJQg3md0g3rw+RiOfyN9sHIz9HlqmLl1sZAP
	aJIUsVuBKAKjbB/+zxFzNrKtP35uyWE5h3KFLbri4h0lVKEqTuVwzpXTZGbe8gDxokkPdkjpJWR
	JrmqEag9aJfcn1L9CfcBFfUfLLMk/xVZlX0a2jD8urORUQj2YCfcwv2pYk0yhSiN+Eq/oej1CXE
	C
X-Google-Smtp-Source: AGHT+IFhBW831LnaAmp1wPj9V9YfM7/Y6hS9iFB03C08+7Z/6Ha7QD5UiGKJEw7+2eBZnomgTvCHfg==
X-Received: by 2002:a17:906:4fc7:b0:aab:92bd:1a8f with SMTP id a640c23a62f3a-ab6cfd0839fmr625811966b.26.1738243668792;
        Thu, 30 Jan 2025 05:27:48 -0800 (PST)
Message-ID: <c0a9c3fa-1812-4a7f-9508-aa109c3221d7@suse.com>
Date: Thu, 30 Jan 2025 14:27:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] x86:monitor: control monitor.c build with
 CONFIG_VM_EVENT option
To: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1737452864.git.Sergiy_Kibrik@epam.com>
 <6fe254034570e1443a41c7dc5e3e3767b9c77f79.1737452864.git.Sergiy_Kibrik@epam.com>
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
In-Reply-To: <6fe254034570e1443a41c7dc5e3e3767b9c77f79.1737452864.git.Sergiy_Kibrik@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 21.01.2025 11:21, Sergiy Kibrik wrote:
> Replace more general CONFIG_HVM option with CONFIG_VM_EVENT which is more
> relevant and specific to monitoring. This is only to clarify at build level
> to which subsystem this file belongs.
> 
> No functional change here, as VM_EVENT depends on HVM.
> 
> Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>

As long as patch 1 stays roughly as it is right now:
Acked-by: Jan Beulich <jbeulich@suse.com>

Jan

