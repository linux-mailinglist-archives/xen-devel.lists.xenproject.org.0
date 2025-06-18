Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D7599ADEF4A
	for <lists+xen-devel@lfdr.de>; Wed, 18 Jun 2025 16:27:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1019224.1396032 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uRtlH-0007hM-8m; Wed, 18 Jun 2025 14:27:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1019224.1396032; Wed, 18 Jun 2025 14:27:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uRtlH-0007eL-5R; Wed, 18 Jun 2025 14:27:35 +0000
Received: by outflank-mailman (input) for mailman id 1019224;
 Wed, 18 Jun 2025 14:27:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=FBi2=ZB=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uRtlG-0007eF-A8
 for xen-devel@lists.xenproject.org; Wed, 18 Jun 2025 14:27:34 +0000
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [2a00:1450:4864:20::42e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5f6a5ccd-4c50-11f0-a30a-13f23c93f187;
 Wed, 18 Jun 2025 16:27:33 +0200 (CEST)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-3a365a6804eso5268711f8f.3
 for <xen-devel@lists.xenproject.org>; Wed, 18 Jun 2025 07:27:33 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2365dea903dsm100077235ad.158.2025.06.18.07.27.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Jun 2025 07:27:32 -0700 (PDT)
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
X-Inumbo-ID: 5f6a5ccd-4c50-11f0-a30a-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1750256852; x=1750861652; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=7gmVlrDR9sCAOkkXX3JtiVAQSKXhcXH/u9HopJyXKRc=;
        b=LwsKOTrjcfvS8ngLtsMMuKHiT+vqJKpcBjujYKxDbVv2bNQP9a8tP2Kh+0z7qfzVm9
         KCVDb/5+iDa4czy89ppYzf0Wi+0tGvgJWhZ2ZbxUVSeHpfY5Zij6nunCn2KUxu9X5104
         AITf6226g1ikdt5tHQxpyM31QacW06Xux97dYkozv72Krp3F3TScZpAIwuIyVj+se2W4
         EOQVnDn/j36Jw3p0Gq/Rah7xYplbWXLskStorlnVUqhbtQ124cKAJM3Hc5rPIgVdrhx3
         44Nw/wwb/3D7ZHhSNsCZCFWtAFnPgERfVOj7sxYpEcnYNElZnKPxM/tgirY6zlELcW7v
         I7GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750256852; x=1750861652;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7gmVlrDR9sCAOkkXX3JtiVAQSKXhcXH/u9HopJyXKRc=;
        b=FF3yxwRNBZFxu+h8uIqHAyJ3qDdeZ44FczO3adWe6D4PZk8QygOYDCzdDNJUp0wbSj
         FEAvmyirX819Em33B7cWeade9uPrFri86GKqLG/P5Ez0ANs92byOJR2O96jcXrzKPkmI
         LFMBu+nGLHn5dyD1+WSI9PdPikjD78DKMaY0GJolkbivqQ9q9Ev1A8okg30WcxuRdvlM
         eHwFUFdWQllBM4BHYNu/sYOG6Ho9aMvJ3nWlWacwH9O10KBDBCxdGTnutfrN5sU/1wW+
         4ZCAeqpkH4YT+3ovyOr+dU7uFjVXEEb+kbEP4ToB7eATI98lWdhYAo0vYsjYzIjbbzLK
         xcNQ==
X-Forwarded-Encrypted: i=1; AJvYcCWByW+OzmmzPaaGMm6JZwCtXCPcnKRLgnQmDdzk4KWEzIdRBszPBY6EjXIsF2Pzzftcqb0j2D1su/g=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxddIxEhL+hX/sR6aSiRWHQHA3T5axi4bHkh/B9QEp/FvQRSMVZ
	RXANWax1R5uuxGg2Qv84/bphj9sMiv8x3Vwqh3tTx0H+xHejrdxu5lX71dEAU7kDsA==
X-Gm-Gg: ASbGncu0TQod73I+cmkIzFEwLEPerQdLLpNtgqC8w/b7VbCKOEs3Im4mr+9mXi08P3n
	XWWiQvwaXImL+b3YVe4s7XM93HUFJbKRhDVpCdcYq+7WMB9N4VRv/F40PHdfnCnYgaYQf7zjflw
	tzWwZOxRzceuY924L2hWvCs6NeSkQr9+Qp5TaxPA7Nj579Cn9/P4VkLqS0tFnpbkR3taIpPFok5
	QZfQQRPdjJGR8r3l5Hh9GGnwRKQXTs/9oReCYmWKXU35E3s+2aSsmQbUD/DSm6gvLLwUqMncZQ6
	GnqCKKqy9TtVsJPvHW8b0A0WMRZnU/oyiaRvsecJneghcb7IoIk0putA7XIObYoPEo/D7X71LlY
	rAtnJA3d7SXInRNK8/Ywm3h/sM/mUV+88Epc/6++STwLgTak=
X-Google-Smtp-Source: AGHT+IGK0lI+zgB5Hcf+XR/zSLcglOJg6WfYsASlKFv0meGWnaCYIWeI50uTtYX/4HltGzSnAG5C6Q==
X-Received: by 2002:a5d:5f8d:0:b0:3a5:5270:a52c with SMTP id ffacd0b85a97d-3a57189727dmr15300531f8f.0.1750256852498;
        Wed, 18 Jun 2025 07:27:32 -0700 (PDT)
Message-ID: <816dd3fc-e6fc-40f6-b7c9-29d2411b52e5@suse.com>
Date: Wed, 18 Jun 2025 16:27:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 4/8] vpci: Hide extended capability when it fails to
 initialize
To: Jiqian Chen <Jiqian.Chen@amd.com>
Cc: Huang Rui <ray.huang@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20250612092942.1450344-1-Jiqian.Chen@amd.com>
 <20250612092942.1450344-5-Jiqian.Chen@amd.com>
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
In-Reply-To: <20250612092942.1450344-5-Jiqian.Chen@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12.06.2025 11:29, Jiqian Chen wrote:
> +static int vpci_ext_capability_hide(struct pci_dev *pdev, unsigned int cap)
> +{
> +    const unsigned int offset = pci_find_ext_capability(pdev->sbdf, cap);
> +    struct vpci_register *r, *prev_r;
> +    struct vpci *vpci = pdev->vpci;
> +    uint32_t header, pre_header;
> +
> +    if ( offset < PCI_CFG_SPACE_SIZE )
> +    {
> +        ASSERT_UNREACHABLE();
> +        return 0;
> +    }
> +
> +    spin_lock(&vpci->lock);
> +    r = vpci_get_register(vpci, offset, 4);
> +    if ( !r )
> +    {
> +        spin_unlock(&vpci->lock);
> +        return -ENODEV;
> +    }
> +
> +    header = (uint32_t)(uintptr_t)r->private;
> +    if ( offset == PCI_CFG_SPACE_SIZE )
> +    {
> +        if ( PCI_EXT_CAP_NEXT(header) <= PCI_CFG_SPACE_SIZE )
> +            r->private = (void *)(uintptr_t)0;
> +        else
> +            /*
> +             * The first extended capability (0x100) can not be removed from
> +             * the linked list, so instead mask its capability ID to return 0
> +             * and force OSes to skip it.
> +             */
> +            r->private = (void *)(uintptr_t)(header & ~PCI_EXT_CAP_ID(header));

Can we rely on OSes recognizing ID 0 as "just skip"? Since the size isn't encoded
in the header, there might be issues lurking here.

Jan

