Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AF50AD89A3
	for <lists+xen-devel@lfdr.de>; Fri, 13 Jun 2025 12:40:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1014227.1392465 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uQ1pc-0002je-JT; Fri, 13 Jun 2025 10:40:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1014227.1392465; Fri, 13 Jun 2025 10:40:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uQ1pc-0002hI-Gc; Fri, 13 Jun 2025 10:40:20 +0000
Received: by outflank-mailman (input) for mailman id 1014227;
 Fri, 13 Jun 2025 10:40:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=M3pU=Y4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uQ1pa-0002hC-R8
 for xen-devel@lists.xenproject.org; Fri, 13 Jun 2025 10:40:18 +0000
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [2a00:1450:4864:20::42c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ca555d73-4842-11f0-a309-13f23c93f187;
 Fri, 13 Jun 2025 12:40:14 +0200 (CEST)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-3a5257748e1so1496155f8f.2
 for <xen-devel@lists.xenproject.org>; Fri, 13 Jun 2025 03:40:14 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2365de78335sm11355315ad.117.2025.06.13.03.40.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Jun 2025 03:40:13 -0700 (PDT)
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
X-Inumbo-ID: ca555d73-4842-11f0-a309-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1749811214; x=1750416014; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Jfio+SURPBp/xyxYHWqlEWbdwyqneL3EihsmdfPpwwA=;
        b=e0ht8ekn8YuqXDgj0vACTOBwxQ0mVUBVpKP4W0C/SXrNFRja+cw8Fd/e3byyxSdobF
         S1XPJK1id9HpWCE3RgCz/JC5jnqHzFxFJ1vHF0+jg4YDlelpvK4hItW+9g5U8m40d5rP
         11aSrbNynBZTr69qc0Wumxy27LKNZCXCVV5LiUDOx4UPllPCQGaM9/oTklsq4xJGVfrr
         tovy9JgYhv1M8L4LfifKPJhv7pfXmUEeKwZu5teQ14aobFb+UiQCKNY1QGO5t5QVK6b8
         ZAFGZ163Qg8OAYbW9yOeVnhZamnYGO/nqOT2FJIh1kRDBAO6UkzZcI0zP0GUbZpuUU9f
         0jmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749811214; x=1750416014;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jfio+SURPBp/xyxYHWqlEWbdwyqneL3EihsmdfPpwwA=;
        b=Qr8h5tzGAB1Aiwg513LcjVqVVxhvfSRaG6EEQ3a39Q7LR08rSzb2vJ5clqriz83pFr
         81jQgnkqugQS9T+Ie7ZSNnaAnbSSP8FQwh+mwIWqyJX6mCpeIy7ZCUiIj/iNQqOBcLG9
         hVXEJTNH6z6t+Dm5wAEn6+UpL13W2RCAcLZ/ixDFe2HWXPRFRxe55WtBMPIEYE79i5rS
         R5kXV+U8a427z/vflwwj0qSR57Cm9dDjb4SGaVVh8vgWShRQPAMdfilTNW1YrZWb9MXn
         qBbFAdmiOdj6IlodyZ1iPPiYRa9aYnnNhHot/C2g9xnb8NAh9x8m7G7I1NlAdT4m0b8Y
         frRg==
X-Forwarded-Encrypted: i=1; AJvYcCV5jqwtQ6w22w4mg+PH10IR4MgA+w0bIHFGBAM4zacN+BqUA0PjcZBHtVwXQ/w01CRLGjVOaON7uNU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyopKpI3C2S7xOK/YETXl9ic1WfHjYt1T/aT/Eva117PO62opUe
	2opbcYnip36sgyFDVxyMvJ3T53gNCAEB9dJmtlTQt873Twl1MwqFBw/LSqDJFDVYiw==
X-Gm-Gg: ASbGnctd96rdNCjriBLB3/cYQIMuw8UpofDOr/BJ6cC+wI66U1SzZ4tE7Q3CNkv4B9F
	yXKNhuDobJLKloX8BvUlLYW2jei1/vNeUXM+VPKrxiXqcdPtpbTo7tMhD6MD6SEzugpBkNgEC35
	lbBcWPiuio2Y6tWl1q+2MwrTXdgji7JKirrOPxF+oEQjopPQIy475cilibFdmMNYtrPVpP9R9DH
	ibydM98OQI3ZfOobgOoGwPajejU3vdAInaSKvOi9YsCxo4wjqe0CHMiabFHz7NIbpxL6QisbUpl
	rdCIeaacO+eMqF3Tsa6fP/8cIiT8P3m2gT1KC206L9HsqoHpBmOB4bGp1rN4u78ZIv1ax5V0zVH
	oCQx54DGeHbzagfTAOyCbigyqqi90ilp+ol0BMef5LmIhxSg=
X-Google-Smtp-Source: AGHT+IFbYvpLqKAdsbR6/6+XQPQuRoPB7edq3zhE3fyJIcjF2VJyNDh3CX2kCItGStCAzCM+LKQKjA==
X-Received: by 2002:a05:6000:18a5:b0:3a3:7387:3078 with SMTP id ffacd0b85a97d-3a5686e945bmr2316365f8f.4.1749811214299;
        Fri, 13 Jun 2025 03:40:14 -0700 (PDT)
Message-ID: <cff5c3c2-3386-4ea2-8372-1e4b2e3df973@suse.com>
Date: Fri, 13 Jun 2025 12:40:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/pci: Use C99 style types for fixed integrals
To: Frediano Ziglio <frediano.ziglio@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20250613101249.164199-1-frediano.ziglio@cloud.com>
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
In-Reply-To: <20250613101249.164199-1-frediano.ziglio@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13.06.2025 12:12, Frediano Ziglio wrote:
> Just code style change.
> 
> Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
> ---
>  xen/include/xen/pci.h | 26 +++++++++++++-------------
>  1 file changed, 13 insertions(+), 13 deletions(-)

Aiui Eclair will object to declarations now (again?) going out of sync with
definitions.

> --- a/xen/include/xen/pci.h
> +++ b/xen/include/xen/pci.h
> @@ -89,8 +89,8 @@ struct pci_dev_info {
>      bool is_extfn;
>      bool is_virtfn;
>      struct {
> -        u8 bus;
> -        u8 devfn;
> +        uint8_t bus;
> +        uint8_t devfn;
>      } physfn;
>  };
>  
> @@ -209,26 +209,26 @@ static always_inline bool pcidevs_trylock(void)
>  #define ASSERT_PDEV_LIST_IS_READ_LOCKED(d) ((void)(d))
>  #endif
>  
> -bool pci_known_segment(u16 seg);
> -bool pci_device_detect(u16 seg, u8 bus, u8 dev, u8 func);
> +bool pci_known_segment(uint16_t seg);
> +bool pci_device_detect(uint16_t seg, uint8_t bus, uint8_t dev, uint8_t func);
>  int scan_pci_devices(void);
> -enum pdev_type pdev_type(u16 seg, u8 bus, u8 devfn);
> -int find_upstream_bridge(u16 seg, u8 *bus, u8 *devfn, u8 *secbus);
> +enum pdev_type pdev_type(uint16_t seg, uint8_t bus, uint8_t devfn);
> +int find_upstream_bridge(uint16_t seg, uint8_t *bus, uint8_t *devfn, uint8_t *secbus);

As you make style adjustments, please also obey to other aspects of style, like
line length here.

Overall, while I don't mind the change, I'm not sure all of it is worthwhile.
We're still only halfway through converting functions taking (s,b,d,f) tuples
to take either struct pci_dev * or sbdf_t instead. Going straight to there
where possible might be a more desirable approach.

Jan

