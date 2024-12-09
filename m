Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 922E19E8C92
	for <lists+xen-devel@lfdr.de>; Mon,  9 Dec 2024 08:49:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.851017.1265178 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tKYUo-0006RD-Dj; Mon, 09 Dec 2024 07:47:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 851017.1265178; Mon, 09 Dec 2024 07:47:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tKYUo-0006Oc-Av; Mon, 09 Dec 2024 07:47:58 +0000
Received: by outflank-mailman (input) for mailman id 851017;
 Mon, 09 Dec 2024 07:47:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=oUxd=TC=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tKYUn-0006OW-GA
 for xen-devel@lists.xenproject.org; Mon, 09 Dec 2024 07:47:57 +0000
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [2a00:1450:4864:20::42a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e5462cec-b601-11ef-99a3-01e77a169b0f;
 Mon, 09 Dec 2024 08:47:53 +0100 (CET)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-3863703258fso731856f8f.1
 for <xen-devel@lists.xenproject.org>; Sun, 08 Dec 2024 23:47:53 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-215f8f29bcbsm66471555ad.262.2024.12.08.23.47.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 08 Dec 2024 23:47:51 -0800 (PST)
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
X-Inumbo-ID: e5462cec-b601-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1733730472; x=1734335272; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=kdL9pa8zg2D/vtJQ8p0OpsKeztnS4n38G46C8uqAF5k=;
        b=RRwFP0sz2vB1tItT2KzQMWC/yO1N1D3L9uhR4jsB/LHvj8ywS1R1XsYVHrZgeZIg94
         pbYq8p/3gMinI6I+DVEVMJOMW3VBdFOFSPPTOWYZ5Ozi9XOJiSKFicUtF26em0v98oOk
         MA15cv08DEK9qEjirkyLCzQFPEjBKSl4l7ClW9pXw/fHc1txCxiT/dWD6/WTqik5IeTn
         /mETQ0+9iW0mg1y5gyyU5Hdwr+1kH24rD8vtAWWGRVHv33NNGuBTF3ivp48lXbgOloiP
         ghVFcV8NJqEnB0fGEbUCIvPrsHUOC/x9elqoahzwD+KgFCNfMIu/m3CF123zPEgNhbSQ
         PpAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733730472; x=1734335272;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kdL9pa8zg2D/vtJQ8p0OpsKeztnS4n38G46C8uqAF5k=;
        b=Q7LNEoKWQVhxGyLQ2iyv+v1+DalTxwrNd/2yTgATmBVxb/pgM9pxywDvYs0/keDUN8
         0awwiTVqpfUrKhOheJE6J4zU/B28kx41OaycB3RB/wKyLp/Vw50WkA6lyQm1Us4cVRbg
         NqvqXHBuSC8HBlVixPP3eXBsfHmjviQReQFEf9JcIK6oWCNGJBZ49KJaDYwVeMy6ULCf
         wJEPG54w6Yu5kfoChh6zjIYwVCvzZoJeBu9hpHE3vOcQI8wrRqHxDisuPoVTfXv/7guS
         diGw0Zg22uPP3TNVgAsn5oxZN5V9oHW4zEf19ulHQBnDPHKroeiyqEu7aWD9ZSEQgO1j
         77JA==
X-Forwarded-Encrypted: i=1; AJvYcCUSpuv+9kuh42BMRy0ZnRQEuNC7sQhTY9JwnyqIVckHeCbVUQMqTTU2/0+n5r0IJUGlklNnS5uUrUM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxLZdCBSw+kGV3MV9HzOqKJb2SrnxeRyelY+oA9xJ6ykuH854iR
	Wi81vc1O8Cy2XNy4TjbCIYJaNJtEVoCoFJvW6uQyRnJRUiIK6c3hpeHexgoiVw==
X-Gm-Gg: ASbGncuXkpFXhxVXJPtZz0amDB6MDNeDMMVdpDp7d7uUgXuXrsq4RXGbLSrFfY4jvRn
	PnMvM9Ubrl8a6p/fJCftuLQaWZ7j2UfcMzuVpl4UD/boZu+QDYWn0AnQURAyLZKMVV3DcvuioSl
	pUJWyj3Yz7ANJiu8ZWFVh+JSD+AD7YzvTcp5iPP4iTutmqZxcP5foBqvw7rBkZjlOs1E3HJrZID
	DgprcGahQDeZgb9pvghR0OClYl68jMmGfXBzYIj+sQ34YBxoW+UmQX+Nrb13FVQ3SazZ5ZBVXWb
	h1rfXLGSUBVu0C29dUZe3LqDmivf4MuJEys=
X-Google-Smtp-Source: AGHT+IFapL3mmL/DnMdBRUqJz6XjyN2AxoKmN7nZtURRn70VMOnqVmyUj+PvKq+X2GmkRavYuUwPmA==
X-Received: by 2002:a05:6000:178d:b0:386:3958:2ec5 with SMTP id ffacd0b85a97d-38639583627mr2811198f8f.28.1733730472443;
        Sun, 08 Dec 2024 23:47:52 -0800 (PST)
Message-ID: <03504a1e-c801-47fc-ac66-ab7e10ab6695@suse.com>
Date: Mon, 9 Dec 2024 08:47:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen: add privcmd ioctl to get p2pdma_distance
To: Julia Zhang <julia.zhang@amd.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Xenia Ragiadakou <burzalodowa@gmail.com>, Chen Jiqian <Jiqian.Chen@amd.com>,
 Huang Rui <ray.huang@amd.com>, Penny Zheng <penny.zheng@amd.com>,
 Zhu Lingshan <Lingshan.Zhu@amd.com>, Paul Durrant <paul@xen.org>,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Juergen Gross <jgross@suse.com>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20241207105946.542491-1-julia.zhang@amd.com>
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
In-Reply-To: <20241207105946.542491-1-julia.zhang@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 07.12.2024 11:59, Julia Zhang wrote:
> To implement dGPU prime feature, virtgpu driver need to get
> p2pdma_distance of two GPU from host side.
> 
> This adds a new privcmd ioctl to get the real p2pdma_distance of two pci
> devices in the host with pci notations sent from guest side.
> 
> Signed-off-by: Julia Zhang <julia.zhang@amd.com>

First - correcting Anthony's email address. He's no longer at Citrix/Cloud.

Second, please send patches To: the list, with maintainers on Cc:. (Stefano,
as this isn't the first such issue, can you please try to spread the
knowledge of this across people starting to contribute?) Personally I'd
question the length of the Cc: list of this submission, though. Plus - along
with Roger I was on the To: list here despite not even being maintainer of
any of the files touched.

> --- a/tools/include/xen-sys/Linux/privcmd.h
> +++ b/tools/include/xen-sys/Linux/privcmd.h
> @@ -110,6 +110,16 @@ typedef struct privcmd_map_hva_to_gpfns {
>  	int add_mapping;
>  } privcmd_map_hva_to_gpfns_t;
>  
> +typedef struct privcmd_p2pdma_distance {
> +	__u32 provider_bus;
> +	__u32 provider_slot;
> +	__u32 provider_func;
> +	__u32 client_bus;
> +	__u32 client_slot;
> +	__u32 client_func;
> +	__u32 distance;
> +} privcmd_p2pdma_distance_t;

"Distance" typically is a symmetric thing. Why the asymmetry here? And
why __u32 when __u8 will be fine for most fields? And where's the segment
part of the device coordinates? Finally, with it being merely stub
implementations that you add here, all details on where the needed info
is to come from are missing.

Jan

