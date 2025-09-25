Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 95268B9DB94
	for <lists+xen-devel@lfdr.de>; Thu, 25 Sep 2025 08:49:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1129968.1469646 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v1fmE-0006B9-6X; Thu, 25 Sep 2025 06:48:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1129968.1469646; Thu, 25 Sep 2025 06:48:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v1fmE-00069K-3T; Thu, 25 Sep 2025 06:48:26 +0000
Received: by outflank-mailman (input) for mailman id 1129968;
 Thu, 25 Sep 2025 06:48:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vOWa=4E=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1v1fmC-00069E-I9
 for xen-devel@lists.xenproject.org; Thu, 25 Sep 2025 06:48:24 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9d166cfa-99db-11f0-9d14-b5c5bf9af7f9;
 Thu, 25 Sep 2025 08:48:16 +0200 (CEST)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-b256c8ca246so122283866b.1
 for <xen-devel@lists.xenproject.org>; Wed, 24 Sep 2025 23:48:16 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b35446f7506sm99531066b.52.2025.09.24.23.48.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Sep 2025 23:48:15 -0700 (PDT)
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
X-Inumbo-ID: 9d166cfa-99db-11f0-9d14-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1758782896; x=1759387696; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=p1AgoaW7coxI7lgNEoGPE9cIu1g2s2aCLioDA2QRJhs=;
        b=aaZHvRsZPszYbVHAnSTX9LXHkvUqdlyxqOHUCOA4ieIq7V7ruF17c/HyR6OHkzUuY5
         unRrUgjTphpy/+wO3RuomffM2N9w5TwcCHpKa33fs7eci1v9VZIYdmyOcZan95GKQp+2
         dKLdlhIcIUZaUQOLTo/kwUqRUFnLnzffYLYZWbMJD8UiZGqPE4CM8d7GLmsAL+I9vj5A
         qa8RIFQsgMXv8BNFI3HxaLAilUdTSrrFbzriGrWDZKYaUzJeIcftscvJ7pu9IaUg+wSN
         zrE9Q1CM7aBLbMvTzhRglBsQCmeMBDJbzuv61BIabEs4Fv47ZEjf17QBPyzu+j3fyV3W
         2alg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758782896; x=1759387696;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p1AgoaW7coxI7lgNEoGPE9cIu1g2s2aCLioDA2QRJhs=;
        b=jVhGUZkPLMFLx+WsHrwHae9aBIGEUHMc8gB7HSfKZPec2LNRAckNLCl0aknZtCSx6M
         Emp6G+oTNY2MD11HNW+//d3D2PZ+m7odYvH/cgoqIPTQrNGOqdU0+UYAj96BpoPjo8hU
         qdz+0tMYrIo5R/MfXKNq3cMGTnF/u73Vc8RL861EEpe6eok04Kbus2pH0jSSWBDLakly
         bFS5iQv+K/COdmSOqSOsIzd3iyesF38V9pL+9DUwDG5IQBxKjsOGSh0P6P3XrdpZhGNr
         xAFsBxNoZVBn16OZMfA3u+6IjkMfDtbw8Fhi8mrD4sj6JP6fnZB+WjNOXiuR8OM6CgHj
         DN3Q==
X-Forwarded-Encrypted: i=1; AJvYcCWW53mF/evj5D4Dwbo3qaqNlu4/PxVxJWULF8hHcwRHc2cqquXByTUdyoA2lH+loKXPmLD15U4sqQo=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyWP4e9OFwBFzCDKux+Cp8zxkJ9LnKKXeU/xujSKK0AcuWYzijR
	5Q4g70CaInRID7fwELH5yFJPGNHLCN7085wuujYV5TVGjt0Oc0I2KvMf6XFa7TI+5A==
X-Gm-Gg: ASbGncsQQxABOTVTLry5gjPbCwqz8kDoCoenYZFexGY+S9w93LbsSzS6hRaM6n5laiS
	H/g0RyEzVsRCWxi4kx/GfATuXfvuMWS6w/wt7scXIUht1ZlOWJvBQ7GoMZYMSyuxDszlQpMvSHg
	A6ZCcuKQ17ZxaTgePPuH8lCWBR6uAJFqg4S2JcmQ2HtBFdpFUi8WSvz93t5lXLSTY25wA7bZTAR
	EQhYeVgnvioXydqBEPYO/O74ePsSofx3dO0lMDApKCG322dyWI0x2rbgti6WzxQK2GZIDK2lb7f
	D9GsYi31NxCvNXJ3gk+mV4Dc1oAACVP8sQhAVtRGqdsckv9LJX8CxFRV4eHcO86cuLVGMuwAfA4
	v396CkwSC8/IKzGa5orzCQp3Tm1cClGpGtCQop4Ig7SIdxqF8NrEv5VrS879YbCsVa9itOm8Jqy
	fj9EB/Kuc=
X-Google-Smtp-Source: AGHT+IEqWsX1wpsa2jFTfLWaXxQedDhT48zZXJVkODGg9FSo0SCVIDPjUP9qc5lh56G4gRn5lKeCzQ==
X-Received: by 2002:a17:907:7fac:b0:b2e:b50c:9f8 with SMTP id a640c23a62f3a-b34bad28543mr234093866b.23.1758782895630;
        Wed, 24 Sep 2025 23:48:15 -0700 (PDT)
Message-ID: <d1300be4-cf4e-42f1-8abb-0333bd51365f@suse.com>
Date: Thu, 25 Sep 2025 08:48:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/8] arm/pci: Add pci-scan boot argument
To: Mykyta Poturai <Mykyta_Poturai@epam.com>
Cc: Edward Pickup <Edward.Pickup@arm.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Luca Fancellu <luca.fancellu@arm.com>,
 Stewart Hildebrand <stewart.hildebrand@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <cover.1758618839.git.mykyta_poturai@epam.com>
 <38d8a5b16f55cfe903c86073c48fe0d6d7af107c.1758618839.git.mykyta_poturai@epam.com>
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
In-Reply-To: <38d8a5b16f55cfe903c86073c48fe0d6d7af107c.1758618839.git.mykyta_poturai@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24.09.2025 09:59, Mykyta Poturai wrote:
> --- a/xen/arch/arm/include/asm/pci.h
> +++ b/xen/arch/arm/include/asm/pci.h
> @@ -23,6 +23,7 @@
>  #define pci_to_dev(pcidev) (&(pcidev)->arch.dev)
>  
>  extern bool pci_passthrough_enabled;
> +extern bool pci_scan_enabled;

At this point of the series this isn't needed, ...

> @@ -155,6 +156,8 @@ bool arch_pci_device_physdevop(void);
>  
>  #else   /*!CONFIG_HAS_PCI*/
>  
> +#define pci_scan_enabled false

... this is entirely unused, and ...

> --- a/xen/arch/arm/pci/pci.c
> +++ b/xen/arch/arm/pci/pci.c
> @@ -91,8 +91,14 @@ bool arch_pci_device_physdevop(void)
>  bool __read_mostly pci_passthrough_enabled;
>  boolean_param("pci-passthrough", pci_passthrough_enabled);
>  
> +/* By default pci scan is disabled. */
> +bool __ro_after_init pci_scan_enabled;

... and hence this wants to be static __initdata. Otherwise, strictly
speaking, this is "unreachable data" post-init as per Misra's unreachable
code criteria (which surely ought to extend to data as well).

> @@ -104,9 +110,23 @@ static int __init pci_init(void)
>          panic("Could not initialize PCI segment 0\n");
>  
>      if ( acpi_disabled )
> -        return dt_pci_init();
> +        ret = dt_pci_init();
>      else
> -        return acpi_pci_init();
> +        ret = acpi_pci_init();
> +
> +    if ( ret < 0 )
> +        return ret;

I understand this is merely transforming existing code, but I don't see
what actual use the returning of an error here and hence also ...

> +    if ( pci_scan_enabled )
> +    {
> +        ret = scan_pci_devices();
> +
> +        if ( ret < 0 )
> +            return ret;

... here has. The system will continue booting nevertheless, iirc without
even a diagnostic from caller.

Jan

