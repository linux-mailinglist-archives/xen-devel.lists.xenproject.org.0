Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B5E7A89A65
	for <lists+xen-devel@lfdr.de>; Tue, 15 Apr 2025 12:37:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.952616.1348021 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4det-0006q4-Gx; Tue, 15 Apr 2025 10:36:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 952616.1348021; Tue, 15 Apr 2025 10:36:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4det-0006nM-DX; Tue, 15 Apr 2025 10:36:51 +0000
Received: by outflank-mailman (input) for mailman id 952616;
 Tue, 15 Apr 2025 10:36:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ai1O=XB=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u4des-0006mW-Fr
 for xen-devel@lists.xenproject.org; Tue, 15 Apr 2025 10:36:50 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 87d58ebd-19e5-11f0-9ffb-bf95429c2676;
 Tue, 15 Apr 2025 12:36:46 +0200 (CEST)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-43690d4605dso42123415e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 15 Apr 2025 03:36:47 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43f20626c19sm212013025e9.15.2025.04.15.03.36.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Apr 2025 03:36:46 -0700 (PDT)
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
X-Inumbo-ID: 87d58ebd-19e5-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1744713407; x=1745318207; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=+3mcrs+9oCkr0jPdfGdb0DzrO1ayJiO9Mhb+3ehe/TE=;
        b=SSQCyLZFOia39ej2JFx9lnN4Z5GQ9tV95MRvAScygJJO66yvwok80JoSUiooKrmD1J
         5VyD9XYV90xNLWxINhuxeHXG0h/f+1Hcc1+sDkY0Cn62u86geXts0HVlZa9EuWJkQLmX
         Ryii3B2cb0yNC/GNMmRbvvoPXTOgBCYsoRl9Ls3M37aoJ55CWAjSxsj/rxtSXh1AORoS
         JwFv7mhLDDBgemkxspTZPD6PG3S4bDv/FW0jBxD56bvDIb9pzEp8X4TqLlX/pGDUTM2B
         ATcBB6BYUDH5roKII0nMKZNpA1PhugCWOUq7nTgdlKn6ixwV/9COBG1Sd+frxJGfwRik
         fffw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744713407; x=1745318207;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+3mcrs+9oCkr0jPdfGdb0DzrO1ayJiO9Mhb+3ehe/TE=;
        b=SGlAP+lTqUMiv2sNbNC8dKpMCPim6fgSO+UDYnc7ES9QTIFkR/IDvdO5pBXl28TQfY
         BnCcxKQlUKbWAR4kUjGl2jhc11DF4LoM8kZCxH+M6bBNPbWK3BRwQvgHY4U43jdqn4A5
         x/X8yt6RtFNJPmG4xCYKQ/kcszSfZqU6KLZV+eP9+Edy8RnkLavpd10MU/KJ0gGsYEe/
         mmHZasbPXcgGeUXeyfjq+MRzDN51b+4ynHqzeWpXeG9Ccq5ZZNHSGZbOVKpfGvtBcCDY
         nehLXiufj07Sw8t55anTCAxUOdiK9NEkOJ8WxjsvHzSKt8kYM9WIwZvBN4pzyLcaBZIR
         cgQA==
X-Forwarded-Encrypted: i=1; AJvYcCV5ajlldiRAHps/kAr9SpB3t9KUUenhtyPIUW495Yz+xq0fSmibkVR4BSLal2ADNF4vEY4xkLluL+s=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxL01SZo5plJVWBXGM9NR6tLRF9B8ol5xlWNGcsd9uNZZUKnMKa
	okF4zbFvBiDXUyavpGu9dH/KfmFljd333Ep66Xaam/C5ItAzgDe7R45sUGtV9Q==
X-Gm-Gg: ASbGncsxWbMn1AhQuAcdiYHf7hE/miWYMMrsbQw+fGTHwlp+pywrI7x9m8yb/HNBwL9
	ISZQ0hjQ6BfSBEysY/avZM8fWleZwA9gKzRcPZqSPkFym+Aypls05uO7AJ/18lTLjnHzuyPm0O2
	cXeBYvLqd67lJpHRIdVEjCTF0XNId0cXVy50wcBCwVVrfTkmkmHvExJZ6AC5aN9dKwohNVPBgSy
	JltOSVlNpBlIOpZ1oxlJ1TpYER2N6xzX5yQN3DHVea3WEdzkUJp2m5QaxbP6VEK11KTptWkrjjF
	iIG1uJ0ut64DRYdM3KjxApoJhy/QQ/60nD95FjBpz2rCdFHFlV83gFNFkBCBzMYETt9SYp8/S1h
	fn5VyqlY4UDlfZjXXtAM+8gg/Lg==
X-Google-Smtp-Source: AGHT+IGEgXVO7f7QBp8Fb63WlQPcSjwCJgfSUNqIZBrbla1xlMTm47XdCCD+OIuPY3j7iL3WLRrJkA==
X-Received: by 2002:a05:600c:810b:b0:43c:f61e:6ea8 with SMTP id 5b1f17b1804b1-43f3a926c29mr136842065e9.2.1744713406682;
        Tue, 15 Apr 2025 03:36:46 -0700 (PDT)
Message-ID: <8e35673e-6207-4b6f-9fb4-96f9bcbd9c74@suse.com>
Date: Tue, 15 Apr 2025 12:36:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/3] drivers: Change amd_iommu struct to contain
 pci_sbdf_t, simplify code
To: Andrii Sultanov <sultanovandriy@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <cover.1744657012.git.andriy.sultanov@vates.tech>
 <40f504017d71c16a3e2bc8945ac5e674a3e791ed.1744657012.git.andriy.sultanov@vates.tech>
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
In-Reply-To: <40f504017d71c16a3e2bc8945ac5e674a3e791ed.1744657012.git.andriy.sultanov@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14.04.2025 21:19, Andrii Sultanov wrote:
> @@ -578,7 +578,7 @@ static int cf_check amd_iommu_add_device(u8 devfn, struct pci_dev *pdev)
>          return -EINVAL;
>  
>      for_each_amd_iommu(iommu)
> -        if ( pdev->seg == iommu->seg && pdev->sbdf.bdf == iommu->bdf )
> +        if ( pdev->sbdf.sbdf == iommu->sbdf.sbdf )

Not for this patch (optionally for a prereq one) we may want to gain sbdf_eq(),
much like we have mfn_eq() and friends.

Jan

