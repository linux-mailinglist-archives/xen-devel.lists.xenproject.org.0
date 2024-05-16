Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6424C8C74B2
	for <lists+xen-devel@lfdr.de>; Thu, 16 May 2024 12:37:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.723106.1127640 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7YUF-0007wq-S5; Thu, 16 May 2024 10:37:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 723106.1127640; Thu, 16 May 2024 10:37:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7YUF-0007vK-Ns; Thu, 16 May 2024 10:37:23 +0000
Received: by outflank-mailman (input) for mailman id 723106;
 Thu, 16 May 2024 10:37:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=LYhW=MT=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1s7YUE-0007vC-CY
 for xen-devel@lists.xenproject.org; Thu, 16 May 2024 10:37:22 +0000
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [2a00:1450:4864:20::534])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 467a7ac8-1370-11ef-909d-e314d9c70b13;
 Thu, 16 May 2024 12:37:21 +0200 (CEST)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-5723edf0ae5so2885738a12.0
 for <xen-devel@lists.xenproject.org>; Thu, 16 May 2024 03:37:21 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a5a179c7faasm965483366b.136.2024.05.16.03.37.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 May 2024 03:37:19 -0700 (PDT)
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
X-Inumbo-ID: 467a7ac8-1370-11ef-909d-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1715855841; x=1716460641; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YwVAVtNNMa1Hc0vHyqcKhW7ESVYZx23wYJZgcsrtoXs=;
        b=DX+khVK6LxYnBV29EbwaL3OIU9xopPNqRqQTJHRDR+6v+co/dWApNEGrhF3XaxfGos
         vxhOf17WTAN2nw0rBvtOMJJ5GLW5dwN6h6TtlwvyQydwcy5j3eKTWU0TR4ER43MADmr/
         qez0ythIdLwxy+gnuO408SspGkVkCqAS9fmpgjA2d8a8Y+EBfXCGqN3DW4o5IpoBcMHI
         1Q9DpCMI5GwD/ca6FCyQhkWD5+siQXEMMGh6dZalG6+8+Qi8JwA+brTmFYAO5eXX4MVv
         tvYla0KltrO+KjloZN4cUUuSSIS1jCCrisnuUlVQswd76yGXHReYLywgsw1S3LdZXqBA
         50Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715855841; x=1716460641;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YwVAVtNNMa1Hc0vHyqcKhW7ESVYZx23wYJZgcsrtoXs=;
        b=DGTVAs05D8VlvZS7Yg6dRVNaGb/MR92SDacZtriTdYZZSjibsRkwb3hX8/sPO6OCaT
         VlruHdTBkyuH2dr38FApWjLtTuwkxQLhi8uHQUloZliVzWGcqb4pWyatyM4FwhQYx1S3
         RAsBhZKijOQMHg1tcrEMljbPPysJzHthLoHyB52bXpy03F/IiBGcWix38bNS8tDUZFft
         7MucelicX2+LIMKUlvayqisNYtuvzZUlng2ky0YZmTMFWXBVfXMvwDXfcCcWkhLMFxBA
         MFvMn+Qk2qZ/8eJdT9hOqmO/IMtLbJiKEGiojCbbUGwSDzn/u20P04D2uAzDUv5ze+b4
         wg+A==
X-Forwarded-Encrypted: i=1; AJvYcCWxdB+2cwutHtMQFDzgnPPc5NvhdozhWWMtbHT6WD6oz/SKQdB+KyoI7b3G24YT6LaeYTBpMqDYxF1xmkE84DaOw38CVoMELqVI1MOGbB4=
X-Gm-Message-State: AOJu0YyKoxphpeKp+yWZ/VodJA66jEvyJXvmp0zBfrCN+3QxZY4vT/Bx
	IxdlQOAo5ZFTD9GIVs/HDQSlfT+I82ePJ4fHCwjDyZvlguIp4mVvQ+wg+mB45Q==
X-Google-Smtp-Source: AGHT+IFhWd78SGpTXKw6a9azhaPHpXGw5tNC5QM4X+LEKzSMTtzmJvZPsW7r8AWV2tgWaFRRKuLGKA==
X-Received: by 2002:a17:907:2d86:b0:a5a:423:a69f with SMTP id a640c23a62f3a-a5a2d53b9bemr1454620366b.9.1715855839819;
        Thu, 16 May 2024 03:37:19 -0700 (PDT)
Message-ID: <7681c0b5-9f16-44e0-9ad0-48bb262e58e6@suse.com>
Date: Thu, 16 May 2024 12:37:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v2 04/15] x86/p2m: move altp2m-related code to
 separate file
Content-Language: en-US
To: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
 Tamas K Lengyel <tamas@tklengyel.com>, xen-devel@lists.xenproject.org
References: <cover.1715761386.git.Sergiy_Kibrik@epam.com>
 <d791a552c3d9331d9b2d40c91e6568932ea6afb7.1715761386.git.Sergiy_Kibrik@epam.com>
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
In-Reply-To: <d791a552c3d9331d9b2d40c91e6568932ea6afb7.1715761386.git.Sergiy_Kibrik@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15.05.2024 11:06, Sergiy Kibrik wrote:
> --- a/xen/arch/x86/mm/p2m.c
> +++ b/xen/arch/x86/mm/p2m.c
> @@ -500,7 +500,7 @@ int p2m_alloc_table(struct p2m_domain *p2m)
>      return 0;
>  }
>  
> -static int __must_check
> +int __must_check
>  p2m_remove_entry(struct p2m_domain *p2m, gfn_t gfn, mfn_t mfn,
>                   unsigned int page_order)

With there now being a separate declaration, __must_check doesn't need
repeating here. Then
Acked-by: Jan Beulich <jbeulich@suse.com>

I'll see whether this applies okay ahead of the earlier patches; if it
does, I'll commit it with said adjustment.

Jan

