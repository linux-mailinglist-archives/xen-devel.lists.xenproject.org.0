Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 24CBAA971D5
	for <lists+xen-devel@lfdr.de>; Tue, 22 Apr 2025 18:01:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.963216.1354241 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7G3y-00040G-Ns; Tue, 22 Apr 2025 16:01:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 963216.1354241; Tue, 22 Apr 2025 16:01:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7G3y-0003yK-LF; Tue, 22 Apr 2025 16:01:34 +0000
Received: by outflank-mailman (input) for mailman id 963216;
 Tue, 22 Apr 2025 16:01:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=f4Vg=XI=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u7G3x-0003vh-NC
 for xen-devel@lists.xenproject.org; Tue, 22 Apr 2025 16:01:33 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0ed54677-1f93-11f0-9ffb-bf95429c2676;
 Tue, 22 Apr 2025 18:01:31 +0200 (CEST)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-43cfba466b2so54300595e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 22 Apr 2025 09:01:31 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4406d563297sm179211705e9.0.2025.04.22.09.01.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Apr 2025 09:01:31 -0700 (PDT)
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
X-Inumbo-ID: 0ed54677-1f93-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1745337691; x=1745942491; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=5Hj8XFoDAu3jFNqXJ99rb/QBGUOrMPhyziddAyvehpI=;
        b=WoKLyQgZUnYhRcY5Z0d4o3x7hwDs2bg8Z4qTZwOw/sfPdl6wNLvlFNwLejNb+c1uLC
         5nkQgbtNkGIFK5Cozee3MFOQzGwCEWbw6gsT7FniQChlv8tl1t42Hg8UesU1kbAxxjbT
         9jqPx+s6glSqfMBWeXPsnoMMIVE1N/o/D1ldn+b2DjBOMKwWa0jEzJ9WbjFXNPaSfPED
         nZuxpvmL1f/iAg3GTWFwn0xAJ95Vwv5hCjRpYnvqfpKPfuqASPAEdzKq1B+Y9nfhX2W6
         wxZKtXc+oZp2IkJAddrrkMVSCJx9S2IXrjCVh7e69naDask7rL6e6AEs/sTFXDH8vP6Z
         oy2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745337691; x=1745942491;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5Hj8XFoDAu3jFNqXJ99rb/QBGUOrMPhyziddAyvehpI=;
        b=ViKzdOfDrypHe7zV8ON1SnhbJnB/kw+vWDXpszh/5vD/OgoH8yilaw+M1sWtyWKDa6
         XeHRH414Wacqrhv1XAn1mnwQXn9gtrjX8xRjrMbkMcgGrrNWk3e+MHYLzWbpX1wl5Ahe
         Vq15d3hnIfADKdg3stPIhhkpXMM9HbcSdKmtdFztrkM7As2BGVX8WeaSYn7j63RyqsbE
         pokKxAB/79b8t4VRS2LHIQ6Ra9S9di5g1EwKZ9TrV3VfnREXTAz3UQSL15WZ49+yycse
         ChRF+T0nyLXn39hyHJadX9j6KzbJadayf4+0RMF01TCr0B02yg47SHGRH1oebRkLu6al
         EHyQ==
X-Forwarded-Encrypted: i=1; AJvYcCX45ffyd221GYh7PK5/6LST5Ts1xJBfIiorNaxs3wDSI8x8gQGBrXZe25ERUnDNm3a0hT/gkLWUwP0=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz40oHVTYEeZ30pZkpGUUGBvqibIpOZ6Y5e8iWq5X4ijY8wdqY3
	e84PuSBLtPvbYi1sXlCdgUyK4hu/Smu2iNPbaciXwvZueJNg+Im32kClb2YuqA==
X-Gm-Gg: ASbGnctyhZKfI30nap2VXypJAmYJtOGwgSpWiPayBzhVZu1kb3CRy2TraXPBQ40hVU6
	4tPKyGguvX7nDMymB9dIDXnQ1kZ+lpzezUthyptO5aqM4GkW1wFI6kEiwK339GEDzZk2GOb+3NY
	trECFj0JRlRysG9L/QcomKTXNJLAYZNW90Gcv/7qyvHf3mkHobuJUCw2yzUN4QT0whZ4S+WORoj
	w0vQ1a0MqDHKmcuyt4EFcIzBifKih/7XTNjlpwsv88vEkT8Gagi0aEBViSm6ACWr9stA3yJVhv8
	99yJ/ZWwo+hit6NyxAfj6iokUHYsEdR1J1I+aYcZHgK1usbpdF02fl5PbMQcNSirPz+4OfH4DAU
	4HYqz2S0Lk6/FQx5p2+znh4vwdA==
X-Google-Smtp-Source: AGHT+IH+C8YFk4/IEVOi0C9gyRyLZikQOLbxj4xKk5FWjl4EVytKY+CLsSOuke9REJRlBgzlabg+zA==
X-Received: by 2002:a05:600c:5490:b0:43c:fd72:f039 with SMTP id 5b1f17b1804b1-44072c876d8mr108660915e9.11.1745337691311;
        Tue, 22 Apr 2025 09:01:31 -0700 (PDT)
Message-ID: <a60a1843-e15e-495e-98f4-f55b64ab336d@suse.com>
Date: Tue, 22 Apr 2025 18:01:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 03/11] vpci/header: Emulate legacy capability list for
 dom0
To: Jiqian Chen <Jiqian.Chen@amd.com>
Cc: Huang Rui <ray.huang@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
References: <20250421061903.1542652-1-Jiqian.Chen@amd.com>
 <20250421061903.1542652-4-Jiqian.Chen@amd.com>
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
In-Reply-To: <20250421061903.1542652-4-Jiqian.Chen@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 21.04.2025 08:18, Jiqian Chen wrote:
> @@ -759,10 +759,11 @@ static int vpci_init_capability_list(struct pci_dev *pdev)
>              PCI_CAP_ID_MSI,
>              PCI_CAP_ID_MSIX,
>          };
> +        const unsigned int *caps = is_hwdom ? NULL : supported_caps;
> +        const unsigned int n = is_hwdom ? 0 : ARRAY_SIZE(supported_caps);
>  
>          next = pci_find_next_cap_ttl(pdev->sbdf, PCI_CAPABILITY_LIST,
> -                                     supported_caps,
> -                                     ARRAY_SIZE(supported_caps), &ttl);
> +                                     caps, n, &ttl);

As per the v3 adjustment to patch 02, you can pass supported_caps here in
all cases. Only n needs to be zero for the hwdom case.

Jan

