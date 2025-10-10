Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 71349BCC189
	for <lists+xen-devel@lfdr.de>; Fri, 10 Oct 2025 10:19:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1141021.1475621 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v78LK-0003hE-Ip; Fri, 10 Oct 2025 08:19:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1141021.1475621; Fri, 10 Oct 2025 08:19:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v78LK-0003e9-Fv; Fri, 10 Oct 2025 08:19:14 +0000
Received: by outflank-mailman (input) for mailman id 1141021;
 Fri, 10 Oct 2025 08:19:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=GA0H=4T=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1v78LJ-0003e3-8b
 for xen-devel@lists.xenproject.org; Fri, 10 Oct 2025 08:19:13 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cd0a29e5-a5b1-11f0-9d15-b5c5bf9af7f9;
 Fri, 10 Oct 2025 10:19:11 +0200 (CEST)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-46e2826d5c6so11456365e9.1
 for <xen-devel@lists.xenproject.org>; Fri, 10 Oct 2025 01:19:11 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46fb482b9absm39128285e9.2.2025.10.10.01.19.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Oct 2025 01:19:10 -0700 (PDT)
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
X-Inumbo-ID: cd0a29e5-a5b1-11f0-9d15-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1760084351; x=1760689151; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=61k9FqBm2QIbYt/1eNTiPOZeVqhkkBonfFUAcQOoxhg=;
        b=FOXK/SLs7Y/ExwYVBtdp8deYLtDTeO2WdUWzUm/U2nJ2yzu3q9gr0goC448bElD3tu
         crZmHIY4M1Sf16a1EJ0ODQWlJNuemG8diM/ZxavbNrswt8bg4LxlomjEY+YB+4A4uScL
         35tU1/FwYrl8K815VdP2dEWzy2KKWzCXpt+6qOpbNsOk0/sbsLK7/eqmQeOQEthssBR+
         dnoCrTMcmH0/G/spk1ZTNalfgIod2dfjr6vkSfhcP0AJpavDhJtdoXWACHKB3BSqh0ZF
         JU8sQH74U6nm+LoSoyyEZiXsATYrlulADABvUu9jxwTxUSgJx7G54Fce1M9/hxs3AR5O
         Yj/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760084351; x=1760689151;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=61k9FqBm2QIbYt/1eNTiPOZeVqhkkBonfFUAcQOoxhg=;
        b=IXMsOEgtRBSUzwHZC+xB4SSy18bsa9nRa9Drxx5ER1RDEvnTeitUhVYNvvpyTJ8NGp
         VfAvUaM7olSfrSJaOLhQpoy5dNIFd7KPNdFwext+3C+g6wQwg4c63C+i6GIduRVmrVFY
         pkqvZm6HDLEIWIVoAJz15c9bOeD9wSz+irrPp2Yhz0970do/RCJ/WWIXEvrnNniC0amP
         Pw74Bog1449KVum25OayxaJfcNAPb4+PFoG39vxyxrKxrZDzSt7LiKfvBuCH736bOTCC
         LdeG/XckaNy5XcVZBKGuGnzDwzusttx62AwFZ0V83AhR0octbsL65/h/CBTbcx6rrYgd
         3XCQ==
X-Forwarded-Encrypted: i=1; AJvYcCXwXOfHhHWY+lz+VfT7rkUgONaPeDxe7iL1AEmjIxbAc5J/nlIXnvWfbE4eJy/8jGHB5ZT1DGyhKFA=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yygij1UStAUYGOK2qY44XgRmME/8/oi+g5XnXV/xBRrESPQI3Cx
	s68uOJp+4eqtWopkf9H7glBXTcaeJZ4BPJbXLwURmxcdF9LajuJ2qXXuacEoQgrHAQ==
X-Gm-Gg: ASbGncttzSBPGpPsoMBOcTB+9XZ9KPL0uRxpdIhPfn7liUbP/gyxaWXu88gw4NpWgHz
	m66pWOI4N/P+0uO8cq8V8Xq2g8PtaSFzqi/G0HuWQtPsM/oWzrKnoN13KizRTggWOTpbhQ8/Dzg
	E2lH8ztx+QnFJwD1XaaXRluCW6VGBffhDovv6OXVtw4LsoxlLXxkvl48FcroCFKkcHLq3gfqh3S
	TzS09wfoGZAFxJ9w8GQNPVTUkQMOJcFdKjxu/WpxL1EpBOMWKd3/syBln2sFLqLLzb/q8UhOakd
	Yw6Pr8fZigtRBRYcXXgAjvynShoF7GOPOt1B20WMimSZLr8A8dumwkQo0kohCRVWNMM3kg4fWUA
	pyu/IQQT4hclwB8XN5JWp2ykeJgTbrAm8Brzk/DpD9Nf98SzdTvgdopPd44xGS4N2a60ijTRQsT
	p6U2z5Pgzb17plJsHwuZQkuGlbeOsH1RhV8t2UG3Ukzf6CrnI=
X-Google-Smtp-Source: AGHT+IHaHM7FeLXmhvinHiDawG+OuQ3lgV7ndGrUXyR6z4u9y7d1X7G3bBWhExu6NytEh5CNb7W8fw==
X-Received: by 2002:a05:600d:4301:b0:46f:aa8a:d2e7 with SMTP id 5b1f17b1804b1-46faa8ad4bamr45918615e9.4.1760084351233;
        Fri, 10 Oct 2025 01:19:11 -0700 (PDT)
Message-ID: <f7fd633b-486d-4b8e-969e-1e944bf62884@suse.com>
Date: Fri, 10 Oct 2025 10:19:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] tools/libs/light: fix BAR memory address truncation
To: Jiqian Chen <Jiqian.Chen@amd.com>
Cc: Huang Rui <ray.huang@amd.com>, Anthony PERARD
 <anthony.perard@vates.tech>, Juergen Gross <jgross@suse.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>, xen-devel@lists.xenproject.org
References: <20251010080029.29328-1-Jiqian.Chen@amd.com>
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
In-Reply-To: <20251010080029.29328-1-Jiqian.Chen@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10.10.2025 10:00, Jiqian Chen wrote:
> 64-bit BAR memory address is truncated when removing a passthrough pci
> device from guest since it uses "unsigned int".

You talking of address truncation only here, ...

> --- a/tools/libs/light/libxl_pci.c
> +++ b/tools/libs/light/libxl_pci.c
> @@ -2001,7 +2001,8 @@ static void pci_remove_detached(libxl__egc *egc,
>  {
>      STATE_AO_GC(prs->aodev->ao);
>      libxl_ctx *ctx = libxl__gc_owner(gc);
> -    unsigned int start = 0, end = 0, flags = 0, size = 0, irq = 0;
> +    unsigned long long start = 0, end = 0, flags = 0, size = 0;
> +    unsigned int irq = 0;

... does "flags" really need widening, too?

> @@ -2031,7 +2032,7 @@ static void pci_remove_detached(libxl__egc *egc,
>      }
>  
>      for (i = 0; i < PROC_PCI_NUM_RESOURCES; i++) {
> -        if (fscanf(f, "0x%x 0x%x 0x%x\n", &start, &end, &flags) != 3)
> +        if (fscanf(f, "0x%llx 0x%llx 0x%llx\n", &start, &end, &flags) != 3)

While touching this, don't we want to drop the stray 0x in here? Their
presence causes bogus input like 0x0x0 to be accepted, afaict.

> @@ -2040,7 +2041,7 @@ static void pci_remove_detached(libxl__egc *egc,
>                                                   size, 0);
>                  if (rc < 0)
>                      LOGED(ERROR, domid,
> -                          "xc_domain_ioport_permission error 0x%x/0x%x",
> +                          "xc_domain_ioport_permission error 0x%llx/0x%llx",
>                            start,
>                            size);
>              } else {
> @@ -2050,7 +2051,7 @@ static void pci_remove_detached(libxl__egc *egc,
>                                                  0);
>                  if (rc < 0)
>                      LOGED(ERROR, domid,
> -                          "xc_domain_iomem_permission error 0x%x/0x%x",
> +                          "xc_domain_iomem_permission error 0x%llx/0x%llx",

In the hypervisor I would request use of %#llx here; not sure what the
toolstack's take on this is.

Jan

