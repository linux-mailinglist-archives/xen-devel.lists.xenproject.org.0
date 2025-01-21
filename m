Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 69E7DA17B22
	for <lists+xen-devel@lfdr.de>; Tue, 21 Jan 2025 11:13:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.875242.1285683 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1taBFs-0001Aw-0Z; Tue, 21 Jan 2025 10:13:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 875242.1285683; Tue, 21 Jan 2025 10:13:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1taBFr-00019W-UD; Tue, 21 Jan 2025 10:13:07 +0000
Received: by outflank-mailman (input) for mailman id 875242;
 Tue, 21 Jan 2025 10:13:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qQWO=UN=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1taBFr-00019Q-1D
 for xen-devel@lists.xenproject.org; Tue, 21 Jan 2025 10:13:07 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4d9175ae-d7e0-11ef-a0e4-8be0dac302b0;
 Tue, 21 Jan 2025 11:13:04 +0100 (CET)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-4361f664af5so62395325e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 21 Jan 2025 02:13:04 -0800 (PST)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438904625e5sm174706295e9.32.2025.01.21.02.13.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Jan 2025 02:13:03 -0800 (PST)
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
X-Inumbo-ID: 4d9175ae-d7e0-11ef-a0e4-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1737454384; x=1738059184; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=w7PL6jtDuqaCI47/vBihS/1cwVtVGWcN0cpHdQWY7CM=;
        b=QEiS9Rn4CeBp3Qb8zPmWxObOjZEZIZfQ41RmTb3SONE2ZE+5x5eATPcuUHsxlsTXhD
         X50qNn3ixMcbdIsGbrqY/sHcBubeuOhMng6SkA8q9yquhDtB4TF9+AMRD3s+x7E2l8Ic
         edpAbmz+os4FCyzJl4NDrKbGjJkyn67QdMh7Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737454384; x=1738059184;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w7PL6jtDuqaCI47/vBihS/1cwVtVGWcN0cpHdQWY7CM=;
        b=OWo6IKWIUhMu2P6i50t1JJh/xnnSjpcAC8Oavxe7GNElkqrhUmqZ4Oz1dsH7AE+jZ7
         UM2jxJjMgaR5gyxorPIpIB7C/Tw/Ej3jO71ISIJVQ4eS/zxDN0/alWB0BCLONn7YD4Pe
         DXfgET9DD/kJLjjIz4/daJdmHJlTXh/aN82tfpRIVHZE0OmIDnxeIPEyKfn2eALumeDG
         Xr21qpQhIMhVtCe5m005JE0ILLE5518YCW+MeeuCj0AMZ+tNLXJmeWmEAuver56KAX/Y
         YCmKpCK/0pHBtBEFN/64fQM4yPgFZ3PLve4ClqtHECNhggx0O5bNR5v9EsHHJhiuMdQi
         REMQ==
X-Forwarded-Encrypted: i=1; AJvYcCXM3969ePUKkqvmpfn/P9pkB3gdcHj1RzunGJh9my1hu70pKATcst5Er//vpEW1l8AXWbw7DoZ0/uc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwADqI5gMWxCcyHNsc3uftvFiHkeRYuyXRdy6L2JTLWYhV5jZL8
	nHEbb/zgxFnmG2Y2Rig/6hTkzfGHt3Kf9ilIES5XbFiWAL3HlL4y1lgRXvf0WOI=
X-Gm-Gg: ASbGncsvtNH1y/WlgCFsxEtEDD/MiX21rji3gfOQn5gMGQafmOGL+xW3+dskrsYF9F/
	GUH3TcFOWWjvu175GRlANykgXSIXCs6+A5XjuZBU3WR3x/W7ZrNwlSfaUtqpEY3SSg/FA1Z9SAN
	8Fmzw2ffOfqRUsbTbdLZSO1yL9tsna27s93FX2kFPvt7hYSO0DjvgV4wKiqwoVzmCHT+16hqXVR
	uD+2bOY+UzfZ3oqNj2vUUqvGh+gF01co5u6QdhsR281hf++Hp+HdRWv4x6hC5soHecJGiC7hikE
	llDPxl0x7ukoEb0nk+pJ2UjW2RihA59t8Q==
X-Google-Smtp-Source: AGHT+IGqgc+G/R8qYlMP6RGudFGP5SKZBDMGlxz7E3VKZrURjhhqXxZSWlXLKqDCUsQZaAj3K5l9uw==
X-Received: by 2002:a05:600c:6c06:b0:436:e8b4:36e7 with SMTP id 5b1f17b1804b1-438913cb191mr145965745e9.8.1737454384103;
        Tue, 21 Jan 2025 02:13:04 -0800 (PST)
Message-ID: <a1a43ab4-5028-4fe4-8e08-5ebd92220436@citrix.com>
Date: Tue, 21 Jan 2025 10:13:03 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] iommu/amd: atomically update IRTE if supported
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>
References: <20250121095704.18769-1-roger.pau@citrix.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20250121095704.18769-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 21/01/2025 9:57 am, Roger Pau Monne wrote:
> diff --git a/xen/drivers/passthrough/amd/iommu_intr.c b/xen/drivers/passthrough/amd/iommu_intr.c
> index 7fc796dec25b..efa9ddc62458 100644
> --- a/xen/drivers/passthrough/amd/iommu_intr.c
> +++ b/xen/drivers/passthrough/amd/iommu_intr.c
> @@ -223,14 +224,36 @@ static void update_intremap_entry(const struct amd_iommu *iommu,
>              },
>          };
>  
> -        ASSERT(!entry.ptr128->full.remap_en);
> -        entry.ptr128->raw[1] = irte.raw[1];
> -        /*
> -         * High half needs to be set before low one (containing RemapEn).  See
> -         * comment in free_intremap_entry() regarding the choice of barrier.
> -         */
> -        smp_wmb();
> -        ACCESS_ONCE(entry.ptr128->raw[0]) = irte.raw[0];
> +        if ( cpu_has_cx16 )

cx16 is always available.  Teddy even submitted patches, but it looks
like they succumbed.

We need to take Teddy's patches, then ~half this one.

As proved by this patch alone, it's already hard enough getting this
right, without introducing dead logic paths into the mix.

~Andrew

