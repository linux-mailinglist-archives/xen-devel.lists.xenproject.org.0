Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C3D86ADEFCF
	for <lists+xen-devel@lfdr.de>; Wed, 18 Jun 2025 16:38:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1019239.1396053 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uRtvT-0001e9-Bm; Wed, 18 Jun 2025 14:38:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1019239.1396053; Wed, 18 Jun 2025 14:38:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uRtvT-0001bP-7A; Wed, 18 Jun 2025 14:38:07 +0000
Received: by outflank-mailman (input) for mailman id 1019239;
 Wed, 18 Jun 2025 14:38:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=FBi2=ZB=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uRtvR-0001bJ-EJ
 for xen-devel@lists.xenproject.org; Wed, 18 Jun 2025 14:38:05 +0000
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [2a00:1450:4864:20::433])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d7a3723c-4c51-11f0-a30a-13f23c93f187;
 Wed, 18 Jun 2025 16:38:04 +0200 (CEST)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-3a5123c1533so3993643f8f.2
 for <xen-devel@lists.xenproject.org>; Wed, 18 Jun 2025 07:38:04 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-74890083034sm11487602b3a.98.2025.06.18.07.38.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Jun 2025 07:38:03 -0700 (PDT)
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
X-Inumbo-ID: d7a3723c-4c51-11f0-a30a-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1750257484; x=1750862284; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=nsNMYcv6w1MRQWT7aYneGzTuj1sM9ZBc2xY2fiJ8e2s=;
        b=Nv1BJbzKXVE9iwiZI1E0JJ3srpIccd4EZ2DZUACDq04Nz6zCpnC96uOQl1kH8Waqyd
         JjR0pTx+IKfN0w465VatEZj4SSM+FDkfyrW/DlsUOVfDKfaQSGNW8rn5/4ahGCvtBLgW
         ycuFKn6o5Q/u2pt2ZrodTNRIqKE/D/Kz8xEvGSikE6a0/bgRYZKW2EJ+P8ooFZ01KlqU
         qr8I6dZPnkp/KY9u3XWBHEYSfzUuBV5THF3REjgQpQsgZZ/FVdNfBasLzRsUoanrveSw
         YDofeqFVMAlBjuVxHNyX+6VqIzMMOllOv6hGVl/jgi3y1E0wmvvKQNoLKh4WbqUyddGA
         Y62g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750257484; x=1750862284;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nsNMYcv6w1MRQWT7aYneGzTuj1sM9ZBc2xY2fiJ8e2s=;
        b=EzxLhqwJZlnhHqjMrlwf2S6SS0saj1z8iE+ewr6Wmy5+hn6WlSoSSSSrTa0kr4h1o5
         JmcCJuSkSvshMCGNjbU2oeR3KOv4s98lYt/IwxqYuFcFYYLPxo/XterpZ9xo08rDDhD3
         llQI5FJe8S/6Jg57JBeP7fVzZ0glwBjPFVr4pzddXzBbIBeGYYeIUfNh7/Td/mRLF39F
         LPQ7tikU2btvG+l8RjX7UhsP5dYFOS0HA33FmARsrbU7zblLGyllZLZWAXTK5TB2V4fk
         yyPdRb8dv95/dcdOVlYfRsJtUHRGVs94Y3F+hnm4SXzzDvFbGZvkdwpDCSXwWjrvdErs
         DT6w==
X-Forwarded-Encrypted: i=1; AJvYcCX/IeIh/m20EnuIRwlmvxsp+4g+93EJl3tsB1UixZ8QvaCjrFLI0fPxw1ssGMEwgbWaYODv+moz6h4=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yzj5FS8mC+KWMe5J9vzWpbxArod01rBhrCC+9IKT7XRYLJuImLN
	AZUZcQ6e+SgfCkT86bk+wvaVVwuqr8rdNnYPSKIGT+AHxnYvnmhRRL/JDypXbLANSA==
X-Gm-Gg: ASbGncvALWcgvkGY0q17CvWYtbWyUEjf1NmrXhbAm7jGCUQkJT+bq+WEIyeE45V0V29
	etWN28bxqKkk48AF+GDcw3hyWNCbKgawqyuYmIidipjbrZBtVRcX2Nab0ScYcSSq4rIGpPXzRFF
	8LjeudP7ExeMKQMKliCj12KgvP3idSjHhk2ZrxrPl9iTM+6F/jJhUhjzQTxXGLHsJ4/tyVtC4ng
	bJtmWBEgZG3/Qpu7sApIP5J0duBxBzt80BIyYhvNat5YWbMyeBwi8sdfYnyJIsnmXC6MXozNp4N
	m8HenGos77SGAfrCQzS3pmD6zj/gc8J7XM+sp1iiw5JhJJvm63bu5pQYeJddlnJZAczJrfwwW8W
	eEzrmCMv8voGfzZm781N0v/0A3x5fmPj1K0Z4J3+aNiOxJas=
X-Google-Smtp-Source: AGHT+IEhgZnmzcHZyRJ8kPmTw80neTVDcVDtf4qpqL5EEF0uCk6ybUZIleBz7lfauX1erIMG5UZglQ==
X-Received: by 2002:a05:6000:2705:b0:3a5:8a09:70b7 with SMTP id ffacd0b85a97d-3a58a18b882mr4164753f8f.38.1750257483722;
        Wed, 18 Jun 2025 07:38:03 -0700 (PDT)
Message-ID: <2d5a5abc-9fc6-4412-9a70-7b12ba46d80f@suse.com>
Date: Wed, 18 Jun 2025 16:37:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 7/8] vpci/msi: Free MSI resources when init_msi() fails
To: Jiqian Chen <Jiqian.Chen@amd.com>
Cc: Huang Rui <ray.huang@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
References: <20250612092942.1450344-1-Jiqian.Chen@amd.com>
 <20250612092942.1450344-8-Jiqian.Chen@amd.com>
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
In-Reply-To: <20250612092942.1450344-8-Jiqian.Chen@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12.06.2025 11:29, Jiqian Chen wrote:
> --- a/xen/drivers/vpci/msi.c
> +++ b/xen/drivers/vpci/msi.c
> @@ -193,6 +193,33 @@ static void cf_check mask_write(
>      msi->mask = val;
>  }
>  
> +static int cf_check cleanup_msi(struct pci_dev *pdev)
> +{
> +    int rc;
> +    unsigned int end, size;
> +    struct vpci *vpci = pdev->vpci;
> +    const unsigned int msi_pos = pdev->msi_pos;
> +    const unsigned int ctrl = msi_control_reg(msi_pos);
> +
> +    if ( !msi_pos || !vpci->msi )
> +        return 0;
> +
> +    if ( vpci->msi->masking )
> +        end = msi_pending_bits_reg(msi_pos, vpci->msi->address64);
> +    else
> +        end = msi_mask_bits_reg(msi_pos, vpci->msi->address64) - 2;
> +
> +    size = end - ctrl;
> +
> +    rc = vpci_remove_registers(vpci, ctrl, size);
> +    if ( rc )
> +        return rc;
> +
> +    XFREE(vpci->msi);
> +
> +    return vpci_add_register(pdev->vpci, vpci_hw_read16, NULL, ctrl, 2, NULL);

Why not use the local variable "vpci" here?

I also think this (re)adding warrants a comment, as to why we do this.

Jan

