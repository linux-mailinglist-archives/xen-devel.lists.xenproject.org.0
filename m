Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 02B01A7F4E8
	for <lists+xen-devel@lfdr.de>; Tue,  8 Apr 2025 08:25:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.941390.1340890 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u22Nz-0002nH-KW; Tue, 08 Apr 2025 06:24:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 941390.1340890; Tue, 08 Apr 2025 06:24:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u22Nz-0002ln-GS; Tue, 08 Apr 2025 06:24:39 +0000
Received: by outflank-mailman (input) for mailman id 941390;
 Tue, 08 Apr 2025 06:24:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xdvb=W2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u22Nx-0002lh-OE
 for xen-devel@lists.xenproject.org; Tue, 08 Apr 2025 06:24:37 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 23e59561-1442-11f0-9ffb-bf95429c2676;
 Tue, 08 Apr 2025 08:24:35 +0200 (CEST)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-43ed8d32a95so28921435e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 07 Apr 2025 23:24:35 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39c3020d62fsm14143832f8f.79.2025.04.07.23.24.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Apr 2025 23:24:34 -0700 (PDT)
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
X-Inumbo-ID: 23e59561-1442-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1744093475; x=1744698275; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=pA/+y89GygcF27xI/j0rBkt6oEtfvfg6wfVfnDG5Zfc=;
        b=MZSFZyTzCkWlfYJcWKdvpdq29dD7TaGMbWq5yQyn6WKsIzalDQxKCqmaz5NfvuX6/N
         l+ti/FguRdjEn3jkImtRwIqioH+To0lvOSqFvIMFjgjO/NdV8k3mmPYmps/qMk7CE4bz
         tor/pg+uqPJrFDDLKASjzyAXXr+UNgHKAST8fVFqy/2YILECUVb+5m8E6DbB4O2dtb0P
         2tH3C4uih20oGZT/bE61wz4c9e1VshRmzc1Z00cbQD2eCf0yHI74SJXLsmW3f/XK58WJ
         vcbHpinKGOAMSqHbRG45Q22PvZ5l6ZA9p9nTIgiild7lkYHgNQ0p+ks3INktpBMXe95m
         bDkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744093475; x=1744698275;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pA/+y89GygcF27xI/j0rBkt6oEtfvfg6wfVfnDG5Zfc=;
        b=ecGfQjejC3TpKR7o7Wc+hItyxOLVetXliMFIT9RlJYguqTaS1yeWjj3MFblK5cCTQO
         OWwCgYGjWzdeOjxqqZBOn19d/dWLm2FwGZ5bavLfso6PAvC3e0tN3AG5FwO9u92ONItc
         O9S0xP0QhPSGpOI5kcc5cTtto/1VMQhJC3p3t2Izir4hSrc0l2ZcExq3h3mAS62KO8xy
         Jj20VjRAp4X+OMzNT/e09lc0k5LCtll0CfK9HhsL8Pomy0Wagm694XDGjR4khhADp3DH
         OQL+iRTxQaCmW0ixXXNgxfGZ9MQdYmhhtX76DC0oDobOHd4lgzig3xJY2n8AcgWD6F8x
         caVA==
X-Forwarded-Encrypted: i=1; AJvYcCXQtrRPTFudqM5c4ggfSOwoZJ3PclPhrvr8sEhq3uUC/ePe+uTpgxh4TC8jhBiQ4BYeJia/v36O0B8=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxy+yZkw24ncP0/W4oyyUwkL1SdizsTkNs5Q3PurfBi9ByGf54g
	l8kmsGdG7Y1pbw3GhQG+odXutbcgOrqK3aQPB8zWZvxgn8yL7A790YXoGTCwfw==
X-Gm-Gg: ASbGncscpoKse179T/bYfufQmgdkQnd3ImIreCbIwExKznU/lTLkOIkJzNCUxXXyQ/X
	CkiX6ncc0tR1nkGtXvxNJEf8Ij1IDEuh4pfedy8oDsSWdbDAEX6KhHWEJPXsDvSRoHVKGvLIjbB
	fMp8YowUHYUjgqWt4MQu/ApyaQq275J0OigNg7r4w1UAETmUDYeRefQoCH+BSQ/DhuV/0TXIsTq
	g9nGQYA9HqTMYh1xLvC9cIyfeB5WQsKKSUHWo8J7aAaosR6DR9S5yb8xpOolKcQrVybq2lu7GoK
	Zh9PtvLMs73whrjg/9IxAl2a+hcwiPtXOt94SiLQNWS0XZgMpRP6JfdtWZGgM5BSn1nadXh3t+5
	8psDX698NJJtLBW8IMJ82v5eiQvur8w==
X-Google-Smtp-Source: AGHT+IFfThN7YJ6vZ1/32KfNbGWCqB+PDQooJ/9koYkX9YkPBkrgy7uWY/AQpVX39pXfBWxWoYbc0A==
X-Received: by 2002:a05:600c:1c03:b0:43c:e6d1:efe7 with SMTP id 5b1f17b1804b1-43f114ef8d8mr8061295e9.26.1744093474635;
        Mon, 07 Apr 2025 23:24:34 -0700 (PDT)
Message-ID: <3ddc038e-9792-4eb7-a1bc-3ce0cf3fe33f@suse.com>
Date: Tue, 8 Apr 2025 08:24:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tools/libxl: Skip invalid IRQs
To: Jason Andryuk <jason.andryuk@amd.com>
Cc: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Anthony PERARD
 <anthony.perard@vates.tech>, Juergen Gross <jgross@suse.com>,
 xen-devel@lists.xenproject.org
References: <20250407192641.83554-1-jason.andryuk@amd.com>
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
In-Reply-To: <20250407192641.83554-1-jason.andryuk@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 07.04.2025 21:26, Jason Andryuk wrote:
> A PCI device's irq field is an 8-bit number.  A value of 0xff indicates
> that the device is not connected.

Nit: "... that the device IRQ is not ..."

>  Additionally, the Linux ACPI code can
> convert these 0xff values to IRQ_NOTCONNECTED(0x80000000) because
> "0x80000000 is guaranteed to be outside the available range of
> interrupts and easy to distinguish from other possible incorrect
> values."  When the hypercall to assign that IRQ fails, device
> passthrough as a whole fails.
> 
> Add checking for a valid IRQ and skip the IRQ handling for PCI devices
> outside that range.  This allows for passthrough of devices without
> legacy IRQs.

Which makes the code here even more Linux-centric, I guess.

A couple of related notes, yet most not directly affecting this patch:

> --- a/tools/libs/light/libxl_pci.c
> +++ b/tools/libs/light/libxl_pci.c
> @@ -26,6 +26,9 @@
>  #define PCI_BDF_XSPATH         "%04x-%02x-%02x-%01x"
>  #define PCI_PT_QDEV_ID         "pci-pt-%02x_%02x.%01x"
>  
> +/* PCI Interrupt Line is an 8-bit value, 0xff means disconnected. */
> +#define PCI_IRQ_LINE_LIMIT     0xff
> +
>  static unsigned int pci_encode_bdf(libxl_device_pci *pci)
>  {
>      unsigned int value;
> @@ -1495,7 +1498,8 @@ static void pci_add_dm_done(libxl__egc *egc,
>              LOGED(ERROR, domainid, "Couldn't open %s", sysfs_path);
>              goto out_no_irq;
>          }
> -        if ((fscanf(f, "%u", &irq) == 1) && irq) {
> +        if ((fscanf(f, "%u", &irq) == 1) &&

For this, "irq" ought to be unsigned int. Same below.

> +            irq > 0 && irq < PCI_IRQ_LINE_LIMIT) {

Not sure about this in libxl's style, but it feels inconsistent to have
parentheses around one relational expression but then not around the
others. Personally I'd drop them all, but the alternative clearly is to
add missing ones.

>              r = xc_physdev_map_pirq(ctx->xch, domid, irq, &irq);
>              if (r < 0) {
>                  LOGED(ERROR, domainid, "xc_physdev_map_pirq irq=%d (error=%d)",
> @@ -2257,7 +2261,8 @@ skip_bar:
>              goto skip_legacy_irq;
>          }
>  
> -        if ((fscanf(f, "%u", &irq) == 1) && irq) {
> +        if ((fscanf(f, "%u", &irq) == 1) &&
> +            irq > 0 && irq < PCI_IRQ_LINE_LIMIT) {
>              rc = xc_physdev_unmap_pirq(ctx->xch, domid, irq);
>              if (rc < 0) {
>                  /*

This is doing things in sensible order: unmap, then remove permissions.
The map side though adds permissions only after mapping. That's kind of
necessary because the value to pass into xc_domain_irq_permission() is
an output of xc_physdev_map_pirq(). Yet then the latter should have
failed for lack of permissions, unless permissions were granted another
way? In which case what's the point of granting permissions here?

Jan

