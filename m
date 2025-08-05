Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D7A4B1B06A
	for <lists+xen-devel@lfdr.de>; Tue,  5 Aug 2025 10:48:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1070167.1433819 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujDLP-0007gC-Lw; Tue, 05 Aug 2025 08:48:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1070167.1433819; Tue, 05 Aug 2025 08:48:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujDLP-0007e5-IQ; Tue, 05 Aug 2025 08:48:27 +0000
Received: by outflank-mailman (input) for mailman id 1070167;
 Tue, 05 Aug 2025 08:48:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=j2i0=2R=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ujDLO-0007dN-0f
 for xen-devel@lists.xenproject.org; Tue, 05 Aug 2025 08:48:26 +0000
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [2a00:1450:4864:20::532])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f279791c-71d8-11f0-b898-0df219b8e170;
 Tue, 05 Aug 2025 10:48:24 +0200 (CEST)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-615622ed70fso8101230a12.3
 for <xen-devel@lists.xenproject.org>; Tue, 05 Aug 2025 01:48:24 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af91a0df10asm860581966b.59.2025.08.05.01.48.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Aug 2025 01:48:23 -0700 (PDT)
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
X-Inumbo-ID: f279791c-71d8-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1754383704; x=1754988504; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=RI2VX13MI7ulpHZ+PIe7JcNxs3UwWqLyUqlMvQmY7sU=;
        b=gf0JeYoIF7uuOuuSiJd6zkCci3K5RnTsJ1Pir4NHkVx4kPfLGVuPm0uIJExYmK9ada
         IO82io9QDlSBoJFZPQvmxqkAG3UGh6xF1FGknrWivVjBYC6aMqpcJ6OI86/DHz+qD/74
         26bvGiJAmQYpoXWcE4oH9aHXeLqHLAVJoUe2ieGjav4YEK3syEy2xWCa1FxzzRVnaAFP
         yEpFMuYOfNarcGILI7BA8qCR+40whEj3e5DNXD/NSPba6QsPwKvGfcugfsjMuYuTscT3
         1XmlfQqB6j45ItOpSWgioiTPeCArvn73KlPv9VtjkIK56hiL9CaRrArjQ4vjubX3RcE+
         5BTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754383704; x=1754988504;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RI2VX13MI7ulpHZ+PIe7JcNxs3UwWqLyUqlMvQmY7sU=;
        b=ONXUAjhndOvSmlWLJCZjdGYo+lvqao1a1xFoDIMsxILG+9v9ViwCQn7Ra+96ywHOn7
         /hndnT01qLC9sxIR4Kxax8kfxW9xVYv8PwxsWzcV/lTUqA0Xr+oBkHZIooUL3L6t3ESy
         +fSNCg/W5k8OJml9Ug7yQHn3FPwlGacq2Nnh1mxJJGpj1Lkqw5eHF+buUpmDImXsRT6d
         GZlRrh0X5DzeGzpm+yc28m07FqoRIkHeGFenMUXKdL3IQMHL6m7LyaWnsDGrBdyW8WiB
         02jg5Eo7eMJwvYHOIeVwGMhhJQZ/YFTjBKmU824K0Hmh6kph5QQhTerYg/geev/nlj0o
         jg2g==
X-Forwarded-Encrypted: i=1; AJvYcCX1Mx3vTnQHM46ozz8zoNdoogdMhXGTgwibuyVQdqZF7BQ134RTU/svBWt+HhVqU73u4e9UqBmzBk0=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywfw9RwDSyh0cY43ixoGJ0dMvLn9cjJR5pJOoXbWhz0l4pqWrsd
	nAEtjzedcbgqG5qYa/5AtMEMyNXUIqHgtxwDgewUveLnu6S5jWUp7vOIbFSN96g6cQ==
X-Gm-Gg: ASbGncvvGT2nqecyjG+MwCPjYMw+tnqIlMVBlwKtJhNzG1hlfjIAhXo4LOwHdRYh2Fy
	UCjeoOi+L3zp1xE+H8Z0RSnhb7blJ88uHZWu0laJoJ+qgeMU45l7asC+qeo7OzDY0H5cZ5qR9E7
	JvLVEi9xe7ez5opUZrvusTbo1qweWwg6DhszwIyGV2AIfRxt/gqKbMeUhAq2+lZ+lyixhpol38e
	YEQB5atyeix2TMxWPBf5WjyPQ8JocdsZvFebNFETe3KG19BY+VZgBeqCz7D8oJ1f3fp3vPg9saK
	JHsX8ONAbOPjHeff/J+hzZ72+qXYq6qoH5ID7TliZckLXAu1OgMvWQG4I/qigk2awtjXu4ui1+I
	poy8PVVxOrdCGWwygIhsPPYxgWYJ9/tRJFTaCCpQQaT52eL2QodhvyswxQlIeb6Doe9bniGHTK7
	38ISRYti0=
X-Google-Smtp-Source: AGHT+IFrw/qfJ8SGJVZMOh58Xvty5DKFRik5nQ6f5ywQQwLxCJ1FmxYX71FQnmdcJo395rmTvoMGwQ==
X-Received: by 2002:a17:907:f497:b0:af9:1c73:cefd with SMTP id a640c23a62f3a-af940247d01mr1279712666b.52.1754383703764;
        Tue, 05 Aug 2025 01:48:23 -0700 (PDT)
Message-ID: <a14449dd-a7dd-4369-9e73-656442b36f2a@suse.com>
Date: Tue, 5 Aug 2025 10:48:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 2/4] vpci/rebar: Free Rebar resources when
 init_rebar() fails
To: Jiqian Chen <Jiqian.Chen@amd.com>
Cc: Huang Rui <ray.huang@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
References: <20250805034906.1014212-1-Jiqian.Chen@amd.com>
 <20250805034906.1014212-3-Jiqian.Chen@amd.com>
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
In-Reply-To: <20250805034906.1014212-3-Jiqian.Chen@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 05.08.2025 05:49, Jiqian Chen wrote:
> --- a/xen/drivers/vpci/rebar.c
> +++ b/xen/drivers/vpci/rebar.c
> @@ -49,6 +49,32 @@ static void cf_check rebar_ctrl_write(const struct pci_dev *pdev,
>      bar->guest_addr = bar->addr;
>  }
>  
> +static int cf_check cleanup_rebar(const struct pci_dev *pdev)
> +{
> +    int rc;
> +    uint32_t ctrl;
> +    unsigned int nbars;
> +    unsigned int rebar_offset = pci_find_ext_capability(pdev->sbdf,
> +                                                        PCI_EXT_CAP_ID_REBAR);
> +
> +    if ( !rebar_offset || !is_hardware_domain(pdev->domain) )
> +    {
> +        ASSERT_UNREACHABLE();
> +        return 0;
> +    }
> +
> +    ctrl = pci_conf_read32(pdev->sbdf, rebar_offset + PCI_REBAR_CTRL(0));
> +    nbars = MASK_EXTR(ctrl, PCI_REBAR_CTRL_NBAR_MASK);
> +
> +    rc = vpci_remove_registers(pdev->vpci, rebar_offset + PCI_REBAR_CAP(0),
> +                               PCI_REBAR_CTRL(nbars - 1));
> +    if ( rc )
> +        printk(XENLOG_ERR "%pd %pp: fail to remove Rebar handlers rc=%d\n",
> +               pdev->domain, &pdev->sbdf, rc);

MSI and MSI-X (now) have ASSERT_UNREACHABLE() on their respective paths. Is
there a reason this shouldn't be done here as well?

MSI and MSI-X further have another add-register below here, to ensure the
control register cannot be written. Again - is there a reason the same
shouldn't be done here? (If so, I think this may want putting in a comment.)

Jan

