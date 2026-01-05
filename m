Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 464ECCF4332
	for <lists+xen-devel@lfdr.de>; Mon, 05 Jan 2026 15:44:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1195442.1513379 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vclop-0002OU-WB; Mon, 05 Jan 2026 14:44:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1195442.1513379; Mon, 05 Jan 2026 14:44:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vclop-0002MU-TN; Mon, 05 Jan 2026 14:44:27 +0000
Received: by outflank-mailman (input) for mailman id 1195442;
 Mon, 05 Jan 2026 14:44:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VkFg=7K=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vcloo-0002MO-B1
 for xen-devel@lists.xenproject.org; Mon, 05 Jan 2026 14:44:26 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 06e28607-ea45-11f0-9ccf-f158ae23cfc8;
 Mon, 05 Jan 2026 15:44:24 +0100 (CET)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-47774d3536dso11305e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 05 Jan 2026 06:44:24 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47d6d13ed0asm165934995e9.3.2026.01.05.06.44.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Jan 2026 06:44:22 -0800 (PST)
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
X-Inumbo-ID: 06e28607-ea45-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1767624263; x=1768229063; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=v2XZa/+OUht4lzTXEfmEYzo3p577uCWIJ6aVSCp22xM=;
        b=Sp9+hxR2ryjaYS617xM+iDCQle+6rAJyTE3uxepBK2xHUUFndxgQuZT4iLDWCjyPB9
         7RMIt76/4h/gj4SGjB5Sdwuz6KJNtkHcX+52mYY7Mcmg8YwGqgfGEcR9Y3N0dP/8Wzgi
         EFQeM0YKZakz7Ty7AEt4hFuEOjVILBQgHIC2hiNhRrNd4IZu3AQ4OBzl7jHzWlIe3Oov
         rQDPy8KJrQwT3qwIbnn9VBJdGU0Ir+2irAPsQwV2nzFyUVj7VnRM7//BHnHO+vLnbYuE
         0mvfM3RvTiYO93OelUTUX3H1/GW7g/3DZOaayO0ZkW8hMUVGIHSNcmSvOl0Xrrmgjyq1
         dwSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767624263; x=1768229063;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v2XZa/+OUht4lzTXEfmEYzo3p577uCWIJ6aVSCp22xM=;
        b=ftXz3Gp8sQ9++eXr1PkiX/VJHusXNg76Mw14Q6qv7ljn1Pa1s/LGSQOVoJTJytXrlw
         7qKT0xcZw82uOtcNQ/HzG7ZJSvSzsl6tbmY3Vu5grEVb48mj62oBKEoSN4jq/vJ8yRxs
         W2NKKzIpvdM4pytsk5OPQO4ZFSd1h/CXUmN8xcS512+Ept3cUIX4bYnj5oxzFgpEsNcX
         xvyHrJuQy5izxUG3lXf9BYBAhXaZGJNyRzETdd1SDy49chO2ai3X/vn5er2i4Zlotdbm
         N6nfP4HtmUPunWoy3Oomjs47aHIZP3X170636CdynGkM5998G7Q0WnJ30xV+HzS0L+BP
         RdpQ==
X-Forwarded-Encrypted: i=1; AJvYcCWCVvw9DFkOT4COwhRfxlhqYRuSbmQvTx+/szp5vkeRjDd4nrnVBvscYLCtezbXnYgaDo+I+gH9Spk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzaOClO2gcO+u9HBCupyVsb+EGsltRZYfk9o/qLclASIQKKRQtm
	vFz6s/K7jJMjDJl0HC/zFW4t24QgjsVVAeT/yrBgx+VF79PHE4v9YfzP6wffp3Zs7A==
X-Gm-Gg: AY/fxX44RmaCVVawyXfEWQZjV9WGkG2kTYmtKEw3NvAH8czMXsa7Y8+mCLVJJoBWMyU
	RpbU3f9mDM28ZE4nZBiIrAbojGMcPL+iN3kV2Np+G8qtNHYGj1W5RS+jiJTq9C9wI/ssw+VFOzo
	1g2/B9n7OxQuX3A4HcghCzaIx/wOnLUvBrc94Y874UtvETHtZt8/Ec+SK8slQWAdQ+PXplnVzVM
	OANcsEAXhZG55b69Zfbv5XaYvh/7R7OZ/V8N6EHDbqqiD347ydpyu3Z9ONyjhPzGUrS5JXq/6ti
	EymBTOGmzylcx7z5gs63iRHWcHPC0mMBQarmmVYc7nwfUW5Q9GMJ/E8I/NhW9fNIN0uvhexQzLq
	uNc1HXfuS82j6Vb/sy2ggOoN1oB+eTDtItDwnasZeJ/HKUXv49ONlqY+LP5xGD03y19CHQSVms7
	FhhAvJDNJRkp1OfUw8UolSPc75ZIcXesidQYuDJ+lMAFyfKECE0BULx8rCwzlV8Ee2mwhbIuVx7
	uc=
X-Google-Smtp-Source: AGHT+IFeQqpVgX73VR7ao41n1Yipw9jK1Ar6juD309qcJVIGnx8BFGjbwpDYbpRFKsZEhbnTADFWlg==
X-Received: by 2002:a05:600c:6a8f:b0:47d:52ef:c572 with SMTP id 5b1f17b1804b1-47d6ba7ac36mr74123265e9.1.1767624263289;
        Mon, 05 Jan 2026 06:44:23 -0800 (PST)
Message-ID: <d6453811-1a4e-4b37-9c39-94bfcfa057d2@suse.com>
Date: Mon, 5 Jan 2026 15:44:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/4] xen/arm: optimize the size of struct vcpu
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 "Orzel, Michal" <michal.orzel@amd.com>, xen-devel@lists.xenproject.org
References: <cover.1766504313.git.oleksii.kurochko@gmail.com>
 <0756ee97dd47f6acdefe593694b743eb6bfefacb.1766504313.git.oleksii.kurochko@gmail.com>
 <9f2c9e4a-64e3-4e5e-b5da-976ab433f6cd@amd.com>
 <9f343323-2743-4bd6-82de-afe3b48adb70@amd.com>
 <096a8105-667e-43a6-856f-3ed52fb1c0a0@gmail.com>
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
In-Reply-To: <096a8105-667e-43a6-856f-3ed52fb1c0a0@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 31.12.2025 09:27, Oleksii Kurochko wrote:
> On 12/29/25 12:10 PM, Orzel, Michal wrote:
>> On 29/12/2025 12:08, Orzel, Michal wrote:
>>> On 23/12/2025 18:01, Oleksii Kurochko wrote:
>>>> When CONFIG_NEW_VGIC=y and CONFIG_ARM_64=y, the size of struct vcpu
>>>> exceeds one page, which requires allocating two pages and led to the
>>>> introduction of MAX_PAGES_PER_VCPU.
>> Also, I think it would be better to drop MAX_PAGES_PER_VCPU in this patch.
> 
> Then I'll update alloc_vcpu_struct() and free_vcpu_struct() to:
>   struct vcpu *alloc_vcpu_struct(const struct domain *d)
>   {
>       struct vcpu *v;
>   
> -    BUILD_BUG_ON(sizeof(*v) > MAX_PAGES_PER_VCPU * PAGE_SIZE);
> -    v = alloc_xenheap_pages(get_order_from_bytes(sizeof(*v)), 0);
> +    BUILD_BUG_ON(sizeof(*v) > PAGE_SIZE);
> +    v = alloc_xenheap_pages(0, 0);

Just one nit here: As (iirc) previously indicated by Andrew, please
avoid open-coding of alloc_xenheap_page().

Jan

