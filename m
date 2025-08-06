Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AD8CB1C03D
	for <lists+xen-devel@lfdr.de>; Wed,  6 Aug 2025 08:07:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1071184.1434681 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujXHy-00014D-C3; Wed, 06 Aug 2025 06:06:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1071184.1434681; Wed, 06 Aug 2025 06:06:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujXHy-00011L-9T; Wed, 06 Aug 2025 06:06:14 +0000
Received: by outflank-mailman (input) for mailman id 1071184;
 Wed, 06 Aug 2025 06:06:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=z+Xv=2S=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ujXHx-00011F-3T
 for xen-devel@lists.xenproject.org; Wed, 06 Aug 2025 06:06:13 +0000
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [2a00:1450:4864:20::52c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6e1a9472-728b-11f0-b898-0df219b8e170;
 Wed, 06 Aug 2025 08:06:02 +0200 (CEST)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-61592ff5ebbso10952893a12.3
 for <xen-devel@lists.xenproject.org>; Tue, 05 Aug 2025 23:06:02 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-615a8eff8d3sm9556917a12.6.2025.08.05.23.06.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Aug 2025 23:06:01 -0700 (PDT)
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
X-Inumbo-ID: 6e1a9472-728b-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1754460362; x=1755065162; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Opw6cwdEdY1O9xZ3NlnSWq+ar4Sny1AcRzHjStgQApo=;
        b=SFKprCW6fr/jBDafGqXWmYNiqO28hsCWueFggrDuL+u5sXqyRWklcjjgheVzRuImt5
         B2VOfu+qqhRU8+HYn1yxgUooWPLi7hsz9PBy0WH5aJdbPUfp+DvFR04ckN9PfCSCU94N
         Uv+86anLjY46h0fc9PaEwMT+LpGVbnijfgisUnMUrIP4F6fa8Pc7PMJrDGDPx2RpyUFs
         15677l1gZE6RN1WO0llLb+wDko21Kt0DI3w+p/UOBMuGw2tiLJIbFh6LLi9jBfK5VMHG
         Qz25BluMMai/aOxCV8QGo0o3+QOb5yTNnRyCV+HK4s44eoo2sk9S015RAHVxB5dLrtjQ
         iNCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754460362; x=1755065162;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Opw6cwdEdY1O9xZ3NlnSWq+ar4Sny1AcRzHjStgQApo=;
        b=eSK5RPjllko75CCb0fDbAq6Ow+QpOitZ+RSkwgV3cebCyInyuGZUTq2GClt1GHcVWx
         kShUcpNozQImgYDc2Afdd4elnat5BOU/hrnO7Bm1TppYwy18JdVunLUILifFv5a50tz1
         hYiCTrCgH97XCamux17jAQDbcEmkjiIjt/y6gJ2xbmimFBF8HZZ7Irw+F7bs20ptKct3
         Oyum1FV8RIX0CUviBZ7ZIBgv8etT2iL+MCENYy3SGLY2G6lwX8x0y5UM6m5xn6Vnmmac
         C4YZm9+/nK4/rJjnVSB/kOjKHvrg9JW9J5lQfZcJx8rNUOBu51yQIyeYferP6vw6cgXv
         KK6g==
X-Forwarded-Encrypted: i=1; AJvYcCUN5PsO3AlKRjoq1G25FlQ5GWx9YAem6vsTyTxJZ0y4dwX1RIPQxkcs9le6qmz3YmY32IQe1nh7oDE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyG2LAol5AamxHqPzTcKDoueSHhxlvygRYEhMtmYiXefxfWNH26
	9krxdEcHHM8BsfhdBEE1oOoEcD8JWm0QhwC7Y6kCEnTn3kw3R7DjWLtVC5rzyrfc2g==
X-Gm-Gg: ASbGncuU7XocLrJ+BHWXjWn4k0rmSQAoYfB0ycqjPPJAXkm57nNN660sFfVPIxNse4H
	9fbOp1l8xzeHXKMH2KVu7LJWy26teeSrmglo5MNN/KcDdAXs1SMRloUx8WYkSQA2/a/9V2GSo6v
	VcvXVcmCw4CEECkNUaj2ZPCPj8nSJt357habQqy9S+X1RD2E818mQ1vMrRBQcNN8kP2KJHxNgN6
	jc3J3N615Y+HIK9i3pQyaWMHpjw5CLMWYzALpyUccigvbudzXe5rmo+olXwB1WxJiLa/ShywuQR
	HEl8y2aWYe7yzcTc0wsA5SZHsylLo0BUx3KVzShOgvs8BvhNWg9jSYrjDHC1SFYkfkhFLCbALw3
	GhC+3Hs4b5gGILLdJ7iHbz3FQbsLnGo0jNZlx2Pkuh5dCTm6uM4n1KR+RwoM+oH8WU699la7+CU
	08AxW/dow=
X-Google-Smtp-Source: AGHT+IHKRq56B+8V+eItYh1+GilccYBAN/RtJ3Wz5bTLkMLnVcrU9StonjqOOiWDdmpwEE4y215Xyg==
X-Received: by 2002:a05:6402:42d4:b0:615:cc03:e6a2 with SMTP id 4fb4d7f45d1cf-61796099915mr1370417a12.1.1754460361513;
        Tue, 05 Aug 2025 23:06:01 -0700 (PDT)
Message-ID: <242a93cf-20f7-4fcd-8eef-6945af5d864c@suse.com>
Date: Wed, 6 Aug 2025 08:05:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Xen 4.21 Development Update [June-July]
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
 Mykyta Poturai <Mykyta_Poturai@epam.com>, Juergen Gross <jgross@suse.com>,
 Teddy Astie <teddy.astie@vates.tech>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Luca Fancellu <luca.fancellu@arm.com>, "Jason Andryuk,"
 <jason.andryuk@amd.com>, Sergii Dmytruk <sergii.dmytruk@3mdeb.com>,
 "Penny Zheng," <Penny.Zheng@amd.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki=2C?=
 <marmarek@invisiblethingslab.com>, Roger Pau Monne <roger.pau@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, dmkhn@proton.me,
 Mykola Kvach <xakep.amatop@gmail.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Grygorii Strashko <gragst.linux@gmail.com>,
 Alejandro Vallejo <agarciav@amd.com>,
 "committers@xenproject.org" <committers@xenproject.org>,
 Community Manager <community.manager@xenproject.org>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <ae2c2e35-72df-40ed-bffe-391f3c11b826@gmail.com>
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
In-Reply-To: <ae2c2e35-72df-40ed-bffe-391f3c11b826@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 05.08.2025 20:19, Oleksii Kurochko wrote:
> * Full list of items : *
> 
> = Projects =
> 
> == Hypervisor ==
> 
> * [4.21] xen/console: cleanup console input switch logic (v5)
>    - Denis Mukhin
>    - 
> https://lore.kernel.org/xen-devel/20250530231841.73386-1-dmukhin@ford.com/
> 
> * [4.21] xen: introduce CONFIG_SYSCTL (v4 -> v8)
>    -  Penny Zheng
>    - 
> https://lore.kernel.org/xen-devel/20250711043158.2566880-1-Penny.Zheng@amd.com/
> 
> * [4.21] Several CI cleanups and improvements, plus yet another new runner
>    - Marek Marczykowski-Górecki
>    - 
> https://lore.kernel.org/xen-devel/cover.7da1777882774486a13e6f39ff4a2096f6b7901e.1744028549.git-series.marmarek@invisiblethingslab.com/
>    - 
> https://patchew.org/Xen/cover.7da1777882774486a13e6f39ff4a2096f6b7901e.1744028549.git-series.marmarek@invisiblethingslab.com/
> 
> * [4.21] automation: Refresh the remaining Debian containers (v2)
>    -  Javi Merino
>    - 
> https://lore.kernel.org/xen-devel/cover.1730743077.git.javi.merino@cloud.com/T/#m5d9acb7cf5db3c2be3d6527de14b69b07812314e
> 
> * [4.21] MSI-X support with qemu in stubdomain, and other related 
> changes (v8)
>    -  Marek Marczykowski-Górecki
>    - 
> https://lore.kernel.org/xen-devel/cover.33fb4385b7dd6c53bda4acf0a9e91748b3d7b1f7.1715313192.git-series.marmarek@invisiblethingslab.com/
>    -  Only automation patch left to be reviewed/merged.
> 
> * [next-rel(s)] Physical address hypercall ABI ("HVMv2")
>    - Teddy Astie
>    - 
> https://lore.kernel.org/xen-devel/cover.1744981654.git.teddy.astie@vates.tech/
> 
> * [next-rel(s)] xen: Untangle mm.h
>    -  Andrew Cooper
>    - 
> https://lore.kernel.org/xen-devel/20250312174513.4075066-1-andrew.cooper3@citrix.com/
>    - 
> https://patchew.org/Xen/20250312174513.4075066-1-andrew.cooper3@citrix.com/
> 
> * [next-rel(s)] Add support for exact-node memory claims
>    -  Alejandro Vallejo
>    - 
> https://lore.kernel.org/xen-devel/20250314172502.53498-1-alejandro.vallejo@cloud.com/
>    - 
> https://patchew.org/Xen/20250314172502.53498-1-alejandro.vallejo@cloud.com/
> 
> * [next-rel(s)] Remove the directmap (v5)
>    -  Alejandro Vallejo
>    - 
> https://lore.kernel.org/xen-devel/20250108151822.16030-1-alejandro.vallejo@cloud.com/
>    - 
> https://patchew.org/Xen/20250108151822.16030-1-alejandro.vallejo@cloud.com/
> 
> * [next-rel(s)] GRUB: Supporting Secure Boot of xen.gz (v1)
>    -  Ross Lagerwall
>    - 
> https://patchew.org/Xen/20240313150748.791236-1-ross.lagerwall@citrix.com/
> 
> * [next-rel(s)] Introduce xenbindgen to autogen hypercall structs (v1)
>    -  Alejandro Vallejo
>    - 
> https://patchew.org/Xen/20241115115200.2824-1-alejandro.vallejo@cloud.com/
> 
> * [next-rel(s)] Introduce NS8250 UART emulator (v2)
>    -  Denis Mukhin
>    - 
> https://patchew.org/Xen/20241205-vuart-ns8250-v1-0-e9aa923127eb@ford.com/
> 
> * [next-rel(s)] xen: framework for UART emulators
>    - Denis Mukhin
>    - 
> https://lore.kernel.org/xen-devel/20250624035443.344099-1-dmukhin@ford.com/
> 
> === x86 ===
> * [4.21] x86/asm: cleanups after toolchain baseline upgrade (v1 -> v2)
>    - Denis Mukhin
>    - 
> https://lore.kernel.org/xen-devel/20250403182250.3329498-1-dmukhin@ford.com/
>    - https://patchew.org/Xen/20250403182250.3329498-1-dmukhin@ford.com/
> 
> * [4.21?] x86/efi: Fix booting when NX is disabled (v1 -> v2)
>    - Andrew Cooper
>    - 
> https://patchew.org/Xen/20240722101838.3946983-1-andrew.cooper3@citrix.com/
>    - 
> https://lore.kernel.org/xen-devel/20240722101838.3946983-1-andrew.cooper3@citrix.com/
> 
> * [4.21?] Hyperlaunch device tree for dom0 (v6)
>    - Alejandro Vallejo
>    - https://patchew.org/Xen/20250429123629.20839-1-agarciav@amd.com/
>    - 
> https://lore.kernel.org/xen-devel/20250429123629.20839-1-agarciav@amd.com/
> 
> *  [4.21?] Boot modules for Hyperlaunch (v9)
>    -  Daniel P. Smith
>    - 
> https://lore.kernel.org/xen-devel/20241115131204.32135-1-dpsmith@apertussolutions.com/
>    - 
> https://patchew.org/Xen/20241115131204.32135-1-dpsmith@apertussolutions.com/
> 
> *  [4.21?] Address Space Isolation FPU preparations (v2->v3)
>    -  Alejandro Vallejo
>    - 
> https://patchew.org/Xen/20250110132823.24348-1-alejandro.vallejo@cloud.com/
> 
> * [next-rel(s)] Hyperlaunch domain builder
>    - Daniel P. Smith
>    - 
> https://lore.kernel.org/xen-devel/20250515131744.3843-1-dpsmith@apertussolutions.com/
> 
> * [next-rel(s)] Confidential computing and AMD SEV support
>    - Teddy Astie
>    - https://patchew.org/Xen/cover.1747312394.git.teddy.astie@vates.tech/
>    - 
> https://lore.kernel.org/xen-devel/cover.1747312394.git.teddy.astie@vates.tech/
> 
> * [next-rel(s)] amd-cppc CPU Performance Scaling Driver (v5 -> v6)
>    - Penny Zheng
>    - 
> https://lore.kernel.org/xen-devel/20250711035106.2540522-1-Penny.Zheng@amd.com/
> 
> * [next-rel(s)] x86: Trenchboot Secure Launch DRTM (Xen) (v1 -> v3)
>    - Sergii Dmytruk
>    - https://patchew.org/Xen/cover.1745172094.git.sergii.dmytruk@3mdeb.com/
>    - 
> https://lore.kernel.org/xen-devel/cover.1748611041.git.sergii.dmytruk@3mdeb.com/
> 
> * [next-rel(s)] x86/EFI: prevent write-execute sections
>    - Roger Pau Monne <roger.pau@citrix.com>
>    - 
> https://lore.kernel.org/xen-devel/20250401130840.72119-1-roger.pau@citrix.com/
> 
> * [next-rel(s)] x86: generate xen.efi image with no write-execute sections
>    - Roger Pau Monne
>    - 
> https://lore.kernel.org/xen-devel/20250318173547.59475-1-roger.pau@citrix.com/
> 
> *  [next-rel(s)] Expose consistent topology to guests (v7)
>    -  Alejandro Vallejo
>    - 
> https://patchew.org/Xen/20241021154600.11745-1-alejandro.vallejo@cloud.com/
> 
> *  [next-rel(s)] x86/alternatives: Adjust all insn-relative fields (v2)
>    -  Andrew Cooper
>    - 
> https://lore.kernel.org/xen-devel/20241002152725.1841575-1-andrew.cooper3@citrix.com/T/#mac2deaea7e02a343210d61887486433d946ad129
> 
> *  [next-rel(s)] x86emul: misc additions (v7)
>    -  Jan Beulich
>    - https://patchew.org/Xen/3a25cd59-e1cb-4bfc-b868-fb11599d22f5@suse.com/
> 
> *  [next-rel(s)] x86: support AVX10 (v3)
>    -  Jan Beulich
>    - 
> https://lore.kernel.org/xen-devel/516b7f9a-048e-409d-8a4e-89aeb8ffacc4@suse.com/
>    - https://patchew.org/Xen/516b7f9a-048e-409d-8a4e-89aeb8ffacc4@suse.com/

While it is correct that AVX10 is now to go first, AMX was lost as an item, and
APX (which I see no reason in posting as long as AVX10 doesn't make any progress)
was agreed to go after AVX10, before AMX. (KeyLocker was also lost, but that
happens to be correct, as with Intel abandoning the feature we apparently have no
plans anymore to make an attempt at supporting it.)

FRED (being worked on by Andrew) is also entirely missing.

Overall: There are very many items on this list, and it seems entirely clear to
me that not all of them will make it. I think it would be quite helpful to strip
down the set for 4.21 to some realistic subset. Maybe something to discuss on
the community call later today?

Jan

