Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F809ADEF91
	for <lists+xen-devel@lfdr.de>; Wed, 18 Jun 2025 16:34:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1019232.1396042 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uRtrf-00013e-SC; Wed, 18 Jun 2025 14:34:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1019232.1396042; Wed, 18 Jun 2025 14:34:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uRtrf-00012C-PR; Wed, 18 Jun 2025 14:34:11 +0000
Received: by outflank-mailman (input) for mailman id 1019232;
 Wed, 18 Jun 2025 14:34:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=FBi2=ZB=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uRtre-000125-76
 for xen-devel@lists.xenproject.org; Wed, 18 Jun 2025 14:34:10 +0000
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [2a00:1450:4864:20::42b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4ae04aaf-4c51-11f0-b894-0df219b8e170;
 Wed, 18 Jun 2025 16:34:08 +0200 (CEST)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-3a57c8e247cso3433952f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 18 Jun 2025 07:34:08 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-748900d0d90sm10991326b3a.155.2025.06.18.07.34.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Jun 2025 07:34:07 -0700 (PDT)
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
X-Inumbo-ID: 4ae04aaf-4c51-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1750257247; x=1750862047; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=c4ZDLYITV5axQdWqyesy+FnFzK6kGDsDGv7/1FtT6i8=;
        b=eB1KW7ym1bp0kwVMViUC9YerKYFCuD6giUqKszZcZp925Zu+UhCr36VipykOI4MssY
         XEuGPr5tLAS4BHbMqNjGzED3oaK5P/qxTw+7OhMX2epwuabLkhPfN5cYgptlp+e82DcF
         gLegNAByoe56Nz+Si8m9xRBdL8JSwDcpnT4PNRB6cXJrEjMFGzcMSbfEohxE1bBEWAYi
         /SjZZrazne37mDgeaMaW+65NTRPMVcwPonQZOjnoY3LUA8UcuOnynT87ewGzONC7lMkb
         D8ON+H6uHk9Hl2kG2g7FE7fMsnZ9/iJC8VTj5U0Hih6qThRGKpFT653OgFYgquIcI3hL
         U6SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750257247; x=1750862047;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c4ZDLYITV5axQdWqyesy+FnFzK6kGDsDGv7/1FtT6i8=;
        b=t/3Fi13rTzp2nDC+JvOqD4bftGDE4HJGxG8wXIkuHATP9yaqx76aFcnQT3cOlzVPdl
         Du7oo4CdV2Ly6zWkA7Qn/Sfu54fRO2XVo1mIvNyMMeRfgYLO8Zrqjbx6TS3x1TjWo1Vt
         L6tSLnJTvwO0QmsGp6q3NwbthFs1dJPrUOj5Fq6AO2LzMfeXXaOZ3jGcys0YL4+gGeG8
         tVvoQux/kVZXdGbyStq8d+uKENCF7CmN7gF0FAHJRTs7gMYQHo4k+NftleQybCH5PcA0
         F1jqwJLCtSDLPOERb7kVZCEdi0SEpbMWmZ58caWAhuPhYdj3dnAoTHgWrdJnvPrHPOqO
         RApw==
X-Forwarded-Encrypted: i=1; AJvYcCUqYrSRJX7bbNwO+c0y0HXlW4FZX+lgQo5QPFOzfjA+EdwJEq/LbTm95LOftYK/rssCbgQ5A6pTQfo=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxd0NZTcGY3UIymXj5rRNZfS2kjoJrrV4cOdta5325arjh+m5Ro
	Z98/D7s/R4q0y9N6iU2UJIyOhvLXZkQNlpG8qSn9E0sBSMJ9jsyeA9Yjolsjl+4edw==
X-Gm-Gg: ASbGncuS3bcM0pplA4WIGBf6ixb0L/066icqonuOTcuFssP2p2qTL5pNqXrUBKBVFTs
	Ch348uQMaYK1NZbyjV4RGzheCk/YLm9uIS7kVw3yLTMOnPCAsB5i23YrPAydVHmqupZl9hX+ChW
	HL8iASyc0ypIxFljprdgdQ5MoETmJU0KfHGrc8qG1D3JxW8ZYrrpNpZ0vQF9ZLI+9Wi3m39y5Us
	aDqHIaKDD2MGTPmbRXngTCabMrww5LRaEpln2r3n5ed7xSVXM/1+0sd2kjeB5KvZHte9qTNgUy4
	2vqxeBQSgDkDXKnOT93d3+qlAHjKs69zk4Al3NeQmqd+x32ox4c08KRA/S3DcjwnH0zYizbKyu/
	dLMyWI9hjGJNJajbm9CzQLP+5APZA8xVwk0R11l508nMH248=
X-Google-Smtp-Source: AGHT+IEmNlz4AiIPomR73q2O3fRFL52LbQLoV8CC5BH22cSwv+7v/BeMmE8uzC3tK3D1NuziqiAJuA==
X-Received: by 2002:a05:6000:1881:b0:3a4:e5fa:73f0 with SMTP id ffacd0b85a97d-3a572397846mr15649067f8f.20.1750257247535;
        Wed, 18 Jun 2025 07:34:07 -0700 (PDT)
Message-ID: <1634c18d-e54e-4105-8b30-6f3085bace22@suse.com>
Date: Wed, 18 Jun 2025 16:33:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/8] vpci: Refactor REGISTER_VPCI_INIT
To: Jiqian Chen <Jiqian.Chen@amd.com>
Cc: Huang Rui <ray.huang@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20250612092942.1450344-1-Jiqian.Chen@amd.com>
 <20250612092942.1450344-3-Jiqian.Chen@amd.com>
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
In-Reply-To: <20250612092942.1450344-3-Jiqian.Chen@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12.06.2025 11:29, Jiqian Chen wrote:
> --- a/xen/include/xen/vpci.h
> +++ b/xen/include/xen/vpci.h
> @@ -13,11 +13,12 @@ typedef uint32_t vpci_read_t(const struct pci_dev *pdev, unsigned int reg,
>  typedef void vpci_write_t(const struct pci_dev *pdev, unsigned int reg,
>                            uint32_t val, void *data);
>  
> -typedef int vpci_register_init_t(struct pci_dev *dev);
> -
> -#define VPCI_PRIORITY_HIGH      "1"
> -#define VPCI_PRIORITY_MIDDLE    "5"
> -#define VPCI_PRIORITY_LOW       "9"
> +typedef struct {
> +    unsigned int id;
> +    bool is_ext;
> +    int (*init)(struct pci_dev *pdev);
> +    int (*cleanup)(struct pci_dev *pdev);

Is const really not possible to add to at least one of these two?

> +} vpci_capability_t;

As you have it here, ...

> @@ -29,9 +30,22 @@ typedef int vpci_register_init_t(struct pci_dev *dev);
>   */
>  #define VPCI_MAX_VIRT_DEV       (PCI_SLOT(~0) + 1)
>  
> -#define REGISTER_VPCI_INIT(x, p)                \
> -  static vpci_register_init_t *const x##_entry  \
> -               __used_section(".data.vpci." p) = (x)
> +#define REGISTER_VPCI_CAPABILITY(cap, finit, fclean, ext) \
> +    static const vpci_capability_t finit##_t = { \

... _t suffixes generally designate types. I don't think we should abuse
that suffix for an identifier of a variable.

Jan

