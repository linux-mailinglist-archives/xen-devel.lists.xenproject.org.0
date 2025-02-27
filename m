Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 52D4BA477A9
	for <lists+xen-devel@lfdr.de>; Thu, 27 Feb 2025 09:23:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.897918.1306543 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnZBF-0007eF-6c; Thu, 27 Feb 2025 08:23:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 897918.1306543; Thu, 27 Feb 2025 08:23:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnZBF-0007cP-19; Thu, 27 Feb 2025 08:23:41 +0000
Received: by outflank-mailman (input) for mailman id 897918;
 Thu, 27 Feb 2025 08:23:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=MKxr=VS=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tnZBD-0007cJ-Ll
 for xen-devel@lists.xenproject.org; Thu, 27 Feb 2025 08:23:39 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 24830708-f4e4-11ef-9898-31a8f345e629;
 Thu, 27 Feb 2025 09:23:37 +0100 (CET)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-390e6ac844fso268864f8f.3
 for <xen-devel@lists.xenproject.org>; Thu, 27 Feb 2025 00:23:37 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43aba5710f6sm48457185e9.29.2025.02.27.00.23.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Feb 2025 00:23:36 -0800 (PST)
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
X-Inumbo-ID: 24830708-f4e4-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1740644617; x=1741249417; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=etFPcrtk9Tgkn8uByeM46xjOYSvuZ71OIx9b3bGqazU=;
        b=ImoWkL/9wRYpDscGcd9WnLiF5POZfWfM/qftFmkRkBdLrh2jhQf0l0JXISSBnJJp8Q
         6YQEIDfmMrgphn1PhXRrB35kf4pXfpsb8PKxf0krIawq6/aoBWgz34XynieABxtH8Xpr
         w+BUAWEug2qCctaq+e/+Kpc+FmPB3QHRqKbbbt95EhAR5kkaS+m80el3Uo9mKGBPIPmu
         vzgh5LOpacudtNI6qhbEfbDi8CKKz5whF7aUxXzs6J2AC4MjUh49Z1kA+ghNfTNgJNEd
         FwLuFmqomqFQ2HQraxB1hTPqVekZki3YVimGtI5hk/+Ny5EzFyjAPQrwbJXyujPYDDvP
         L6oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740644617; x=1741249417;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=etFPcrtk9Tgkn8uByeM46xjOYSvuZ71OIx9b3bGqazU=;
        b=OO95zRyISTyp79nKiDY17Zg+CvVU8JLeFYYVLyTv0TLtZKHWfIukkDCDUxGBeE8mx/
         FTLNv0vmlBHZJ6VtCCsVBMzc0Z+W9W5vXaLiGMspSj6vo72kHnlLoqdtzCbX+fJPaoeq
         I3nYEMcI196cUIa+yUd8dUvrCviVgjFoRZHOBkCK1tKvvZQypFXjGE8qz7pfvepdaFJA
         /hw/69At1z4589zsEGyHTV6KizoB54Wha2EuTNOLGcaXvYSA/rXR0fQt/xS1eY8D2UYC
         B5CyLe4gvzZsCiLX6cQ5oeyEfp0XgkKWrIWThf40gbqlGZBtpVslC4uKLyLHgU/pNU/l
         tlYw==
X-Forwarded-Encrypted: i=1; AJvYcCUtyPwb23szEah7qsUDBD1DsicDUKUVr/ChU/NWJ268YB1IwNfXWSuR/8DGfSJKCSakDrbs5FM/KVg=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yztgk/zz0246fbzu33iLQwnIH+VZHnl+kp2lTwDkF7lsZoql+VR
	t8Y3aCauX2wXj9VUUPzpw7qYA9NF6FTO5nApFCBIiY1Ss3uFKtfnPbSO8492+g==
X-Gm-Gg: ASbGncuVdO0Qkl0E9DExW94scalXCdq1vcK3qnqEh8hWmaZ2rNXmsTX7K3wt1hVgYuX
	Vu56tOoC4pFagc5UTQjCHyqaPPOH2TV9theduH6L6GhxQZTT+ViUYizcTPpTFy2+8KqHSREu74P
	RoTJrFIIe5Hv2IQmPZMNDxGlLfGhKQPwDXFLCEJu11MICnuLQTRREzmNKFesbaXuVXkbXlcVM2/
	sVqZOWUxP6yvy+em/Ml/jFq3DaoEMqz/1BP8YiT8txDhfQYevQphx+xXqgBD6Tlyhv6Dt7U37Hg
	L9Qy/YLtVnS4E4dsU3nU3Vg3zw114fwPrkgSAbCr6LYZYkuY79oWB/n1Z6k+dkMzijAHeiecui2
	mTP4+NL5XwLM=
X-Google-Smtp-Source: AGHT+IGNO4lSsKzWr9bxAoIjTpTJaMHd6X1/Kf+c9UJluJGrqU3WSg6vtNZXxKPF+NoQckaCet6dJA==
X-Received: by 2002:a5d:6c63:0:b0:38f:2a7f:b6cd with SMTP id ffacd0b85a97d-38f7079a134mr17580534f8f.20.1740644617014;
        Thu, 27 Feb 2025 00:23:37 -0800 (PST)
Message-ID: <22a46f43-d60c-465d-9ae7-4d84ca9108d4@suse.com>
Date: Thu, 27 Feb 2025 09:23:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/pciback: Make missing GSI non-fatal
To: Jason Andryuk <jason.andryuk@amd.com>
Cc: stable@vger.kernel.org, xen-devel@lists.xenproject.org,
 linux-kernel@vger.kernel.org, Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Jiqian Chen <Jiqian.Chen@amd.com>, Huang Rui <ray.huang@amd.com>
References: <20250226200134.29759-1-jason.andryuk@amd.com>
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
In-Reply-To: <20250226200134.29759-1-jason.andryuk@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26.02.2025 21:01, Jason Andryuk wrote:
> A PCI may not have a legacy IRQ.  In that case, do not fail assigning

Nit: Missing "device".

> to the pciback stub.  Instead just skip xen_pvh_setup_gsi().
> 
> This will leave psdev->gsi == -1.  In that case, when reading the value
> via IOCTL_PRIVCMD_PCIDEV_GET_GSI, return -ENOENT.  Userspace can used

Nit: "use".

> this to distinquish from other errors.

Nit: "distinguish".

> --- a/drivers/xen/acpi.c
> +++ b/drivers/xen/acpi.c
> @@ -101,7 +101,7 @@ int xen_acpi_get_gsi_info(struct pci_dev *dev,
>  
>  	pin = dev->pin;
>  	if (!pin)
> -		return -EINVAL;
> +		return -ENOENT;
>  
>  	entry = acpi_pci_irq_lookup(dev, pin);
>  	if (entry) {

While I can understand this change, ...

> @@ -116,7 +116,7 @@ int xen_acpi_get_gsi_info(struct pci_dev *dev,
>  		gsi = -1;
>  
>  	if (gsi < 0)
> -		return -EINVAL;
> +		return -ENOENT;
>  
>  	*gsi_out = gsi;
>  	*trigger_out = trigger;

... I'd expect this needs to keep using an error code other than ENOENT.
Aiui this path means the device has a pin-based interrupt, just that it's
not configured correctly. In which case we'd better not allow the device
to be handed to a guest. Unless there's logic in place (somewhere) to
make sure it then would get to see a device without pin-based interrupt.

> --- a/drivers/xen/xen-pciback/pci_stub.c
> +++ b/drivers/xen/xen-pciback/pci_stub.c
> @@ -240,6 +240,9 @@ static int pcistub_get_gsi_from_sbdf(unsigned int sbdf)
>  	if (!psdev)
>  		return -ENODEV;
>  
> +	if (psdev->gsi == -1)
> +		return -ENOENT;

This may, aiui, mean either of the two situations above. They would then
need distinguishing, too, if user space is intended to derive decisions
from the error code it gets.

Jan

