Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F5AAAE13BE
	for <lists+xen-devel@lfdr.de>; Fri, 20 Jun 2025 08:23:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1020607.1396743 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uSV9P-0002F1-9A; Fri, 20 Jun 2025 06:22:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1020607.1396743; Fri, 20 Jun 2025 06:22:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uSV9P-0002DB-6a; Fri, 20 Jun 2025 06:22:59 +0000
Received: by outflank-mailman (input) for mailman id 1020607;
 Fri, 20 Jun 2025 06:22:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=SdMF=ZD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uSV9N-0002D5-M6
 for xen-devel@lists.xenproject.org; Fri, 20 Jun 2025 06:22:57 +0000
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [2a00:1450:4864:20::42c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0145306a-4d9f-11f0-a30e-13f23c93f187;
 Fri, 20 Jun 2025 08:22:56 +0200 (CEST)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-3a548a73ff2so1405425f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 19 Jun 2025 23:22:56 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b31f119b988sm744239a12.21.2025.06.19.23.22.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Jun 2025 23:22:55 -0700 (PDT)
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
X-Inumbo-ID: 0145306a-4d9f-11f0-a30e-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1750400576; x=1751005376; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=5vAMJHh3DqteArOUjowHhR/kL9HILOdSFZS1lUXWRy8=;
        b=hCeDtX6hLw21YFuosdKXBqrPX0dCV/5cHmRq7/Nv7OdNTST88CsfCkHPSRyriOMgPJ
         XCRXXA77ZY3Whi0JBicr4xxT4C1hs7e6Q8S74jlMf58Yn5fFtoLFNzOjjOUyFMJkDmlE
         blobQY5yweO1KS+VNzTn+WfVhWGPjfXSioKBvYAh25701yNhOfoDE+iQk9VZ75WUlIEI
         CBziwKEzfJARXflxL6rTQ0w+WP9reRnT8E6QHReXLtF1/Y7b3LVA46HyUUhCmBefHpt1
         YuCD8p3iscKCKLggmpvDFaIQNv7uxUxx8TLsULcDzlfBIVPdYrXI9gxsTAJoePdZTwr5
         jtVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750400576; x=1751005376;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5vAMJHh3DqteArOUjowHhR/kL9HILOdSFZS1lUXWRy8=;
        b=tYJU0AIzxreUc8nJtq+uhSl6TZpduXWNoIhtdAr0OmJTtkJM38h/H7OskefFYrs7s0
         FGjHiuhqW0GuA9buSEODfUMhOzFlq5Otqr9WbOmB2tb5ZtrK/Xgo4UbiUftEy6/DeQzW
         ec5w9LRToqxkoUdNpivMdVic3k/9/IeKC79Ni3ic6o/fd1OEBl7yz2iZAbuEHqJu6aP7
         k9uKupyW4JKQKAnP715IWnUmM/xNZSwPqAEwEOnRQIhmaelygu7cJwhECD7CiCmnO0Yb
         xfh9uQA3sNpn1ix3Nq2yBIUwmpE0rXGARWyhHukuML5wU39LHv6byXS5XNJ8OcpR2juS
         luDg==
X-Forwarded-Encrypted: i=1; AJvYcCWPGwfr/2WD8Kr62o76V6EmHDfyNr21+D0rrnkPEVOm6R62oXGaKZ1n50SsMrB8LOO4mh/kxXmLrds=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx/9SDg3TaVhcWuVC1awnk+RKejcOA6xK8bRrRu8ztfMpaulk6t
	6vIuNohHf/rQPxaOyRBlsYheFRedHwzq46IY/r0Dy1C50A7hNVmssGvDN1bCEyZSnQ==
X-Gm-Gg: ASbGnctsxm1u+vILqheMxCdallzeosHS4fFgC1vQGnuxMMhtmJ/i1IsSC+IuRvGcucF
	u+fV8Wtq0qbnJFBlfhxlw+EJKjtttWafWVBLGnPpnWg9+rNme7Ao/kdF88ieU5FsxTJrQVV6kQO
	/p7eimMQmPQRBHLqFxn54GaRfzDsnovEN0aGmK2ppviAQSNdc06JXRw1/L/F5a9PjneM5lxefIR
	bi3VTzBvgNJMuzsc9+xSC/GO8pEqv4n9PYEwePw6rrQL87vRjtjn8vC2ZBKp67YGvcPn129RGKW
	TDW2syLX+nvSwJkV5M47R4bnrvVZHgkqrf/UjCPvIEmbvFBYDVSedMshWSzVlULO40BAFRiRQpc
	QEAAQU0rUAollkGpUMzXsXp244Rqh2FAcR+GzgZEKfmqN7/Q=
X-Google-Smtp-Source: AGHT+IFWV5HC8kn8yafrqxyqyjHN6p21MH4b9dpu4eLTKaXujtIwoaZBH1KKPBvyogE58DudbwOkwA==
X-Received: by 2002:a05:6000:4011:b0:3a4:ebc2:d6ec with SMTP id ffacd0b85a97d-3a6d12c1651mr1320446f8f.14.1750400575783;
        Thu, 19 Jun 2025 23:22:55 -0700 (PDT)
Message-ID: <618e1896-2f1d-4727-83d7-76b60b011c81@suse.com>
Date: Fri, 20 Jun 2025 08:22:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/efi: Do not check kernel signature if it was embedded
To: Frediano Ziglio <frediano.ziglio@cloud.com>
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel@lists.xenproject.org
References: <20250618184631.15489-1-frediano.ziglio@cloud.com>
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
In-Reply-To: <20250618184631.15489-1-frediano.ziglio@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 18.06.2025 20:46, Frediano Ziglio wrote:
> --- a/xen/common/efi/boot.c
> +++ b/xen/common/efi/boot.c
> @@ -1291,6 +1291,7 @@ void EFIAPI __init noreturn efi_start(EFI_HANDLE ImageHandle,
>      bool base_video = false;
>      const char *option_str;
>      bool use_cfg_file;
> +    bool kernel_was_verified = false;

May I suggest to drop the "was" infix from the variable name? The name is imo
as clear without it.

Jan

