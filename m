Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3771A9F2CC8
	for <lists+xen-devel@lfdr.de>; Mon, 16 Dec 2024 10:20:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.857616.1269840 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tN7GH-0002CC-62; Mon, 16 Dec 2024 09:19:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 857616.1269840; Mon, 16 Dec 2024 09:19:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tN7GH-0002AY-2R; Mon, 16 Dec 2024 09:19:33 +0000
Received: by outflank-mailman (input) for mailman id 857616;
 Mon, 16 Dec 2024 09:19:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1wQJ=TJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tN7GF-0002AS-FF
 for xen-devel@lists.xenproject.org; Mon, 16 Dec 2024 09:19:31 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dab83dbb-bb8e-11ef-a0d6-8be0dac302b0;
 Mon, 16 Dec 2024 10:19:30 +0100 (CET)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-43628e97467so34172555e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 16 Dec 2024 01:19:30 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-388c8046da0sm7770523f8f.74.2024.12.16.01.19.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Dec 2024 01:19:29 -0800 (PST)
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
X-Inumbo-ID: dab83dbb-bb8e-11ef-a0d6-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1734340770; x=1734945570; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=OxHl9dtxX5fxuawa353QgOBshFc+eKtA/Hav1Jgel+c=;
        b=dKt8V9oDr/dNv/AEWMhY8B85e2BXx6IACrxrePgOsJeFX1Gz0ff5eXoQBAbk4UHCje
         N7AFxcONRkfNovunwbLDPhtJR7qE+jwZaD5lidXvkgOqr7nQ8c/vh/mglaHpnd1kikJ6
         ALjUM0TYwrqYFaTHzSGLxOOHva6jX21ci+KpTN02iiTUlV8DLZFJZ5t2JmqQh0YInelj
         Tqz79XDOq5tMkEVi3ejh679S5wvbdPOv8+hJVtLbzKPlnACSWkPmjQf2hA0DQugFMM/j
         zVhUYtkCKgqbe4BbMrfKVFNxzCAXrvRIDBYfrmZL4gqtlaE8ihwX9gTHmW8P7eIV4ITX
         9eIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734340770; x=1734945570;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OxHl9dtxX5fxuawa353QgOBshFc+eKtA/Hav1Jgel+c=;
        b=ncdE4NWy4W6XoIJnO708ren2fjrwIxeyzwL9onX/Vaqxnan07TM50RN1nT9jr0E7JA
         xYYj7V5XISttQFeMjN1/XAX9I4E7B0Ge+4UiaSrwOGwWvPOCjgXZm1VWeySBMWPua0Bz
         JF1Z5heOJp28I7GOR8tFNYxA/gLsCsOX5VsmlkaE6FcZchczoeCIYO+wszV/XVRKBamU
         MWnjNzW8GqlBkpPjw2kA5Z1p8Q5AOKgXxP/wIETw5pAzJ1Enkz4gmNETi8+H8sjXUSpa
         a3NeFIrZVOLBw4wp4bnKwHLlC5ljoKgrLq+EZixlYMWxrswf5JXgdnOMX7+CvmNIfZaZ
         S0bw==
X-Forwarded-Encrypted: i=1; AJvYcCXzkGjLI87rX/72d4xqTmC+ne7fPuD2UisgPYG7B8JlqxPJmDLzw3O9FvHOUnWqqzFrnigI0jTaUNE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwiQ4nJPs2dKzntSMgWVADS+usJ2phvKAHzzB5LC2DCgGN8s9Xj
	pVp1Cb29YoWfgGSnYs3gR7RD42gGThs18H2aGhLwXHVWpf5Ou9DoeHE+xbJ5vg==
X-Gm-Gg: ASbGncv5QQcCUP6CWHwZdQtFDIV/OrSg1Ym442S0bt+iUpE7nsMGNmaswSP0pyLv5ak
	Kg0Z/nhvp7wLOyRnpcUp+YrQi1GR6YsN5ZdOkasT3a51Kez6NEzkvVXU7Z7JjR32oE/f5K2bd0B
	k87KsgCgEoCvNeBTGWLfA+afoKde/Bz3JuayuQpMlC+3Bw95a+dsIpWmH+GT++bf5ZR/KeruHrJ
	/vbJY/G+T5Why8eqp96yNYzfAGsqv7FnXIeEGIu+GaMenIXYul3VjjuUQMn80Q2rlV37WqC0Fre
	e/nD/+dw8azrmZHDVlUnxZYwGwlINh+WNEvVYCOJtA==
X-Google-Smtp-Source: AGHT+IGUzulWCwIOeLEykd2kHecnhZmkQfhwjBHryCgvLvYGC5trB2ocAktXRMtBUqznyIGq0VBuwQ==
X-Received: by 2002:a05:600c:4e4e:b0:434:a30b:5455 with SMTP id 5b1f17b1804b1-4362aaa4372mr100847785e9.27.1734340769649;
        Mon, 16 Dec 2024 01:19:29 -0800 (PST)
Message-ID: <0284d807-ae85-4d43-93b5-91fb29528d62@suse.com>
Date: Mon, 16 Dec 2024 10:19:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen: add privcmd ioctl to get p2pdma_distance
To: "Zhang, Julia" <Julia.Zhang@amd.com>
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 "Koenig, Christian" <Christian.Koenig@amd.com>,
 Xenia Ragiadakou <burzalodowa@gmail.com>, "Chen, Jiqian"
 <Jiqian.Chen@amd.com>, "Huang, Ray" <Ray.Huang@amd.com>,
 "Penny, Zheng" <penny.zheng@amd.com>, "Zhu, Lingshan"
 <Lingshan.Zhu@amd.com>, Paul Durrant <paul@xen.org>,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Juergen Gross <jgross@suse.com>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20241207105946.542491-1-julia.zhang@amd.com>
 <03504a1e-c801-47fc-ac66-ab7e10ab6695@suse.com>
 <IA1PR12MB6532F32D012A63000F34823AF23B2@IA1PR12MB6532.namprd12.prod.outlook.com>
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
In-Reply-To: <IA1PR12MB6532F32D012A63000F34823AF23B2@IA1PR12MB6532.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16.12.2024 09:18, Zhang, Julia wrote:
> On 2024/12/9 15:47, Jan Beulich wrote:
> On 07.12.2024 11:59, Julia Zhang wrote:

Yet another formality, sorry: Please send plain text emails. You'll note that what
I said and why you said is indistinguishably intermixed below.

> --- a/tools/include/xen-sys/Linux/privcmd.h
> 
> +++ b/tools/include/xen-sys/Linux/privcmd.h
> 
> @@ -110,6 +110,16 @@ typedef struct privcmd_map_hva_to_gpfns {
> 
>    int add_mapping;
> 
>  } privcmd_map_hva_to_gpfns_t;
> 
> 
> 
> +typedef struct privcmd_p2pdma_distance {
> 
> +  __u32 provider_bus;
> 
> +  __u32 provider_slot;
> 
> +  __u32 provider_func;
> 
> +  __u32 client_bus;
> 
> +  __u32 client_slot;
> 
> +  __u32 client_func;
> 
> +  __u32 distance;
> 
> +} privcmd_p2pdma_distance_t;
> 
> 
> 
> "Distance" typically is a symmetric thing. Why the asymmetry here? And
> 
> why __u32 when __u8 will be fine for most fields? And where's the segment
> 
> part of the device coordinates? Finally, with it being merely stub
> 
> implementations that you add here, all details on where the needed info
> 
> is to come from are missing.
> 
> "Distance" is p2pdma-distance between two PCI devices, it's calculated in kernel driver.I don't get why it's symmetric?

Distance from A to B is usually the same as that from B to A. But yes,
not necessarily always (thinking of e.g. rings). Yet still I'm unclear
about the distinction between provide and client.

> I will use change __u32 to __u8.
> 
> By the segment part of the device coordinates, do you mean the domain number of the device?

Some call it domain, yes. Since domain has an important-ish different
meaning in Xen, we prefer segment though.

> All the needed info(virtual bus/slot/function numbers) are from guest VM, QEMU convert them to real physical info of two devices.
> 
> Do you mean that I should add more details in commit message or comment?

Perhaps. Or have the patch be more complete, in the sense of not only
putting in place stubs, thus actually making visible how the data is
produced / used.

Jan

