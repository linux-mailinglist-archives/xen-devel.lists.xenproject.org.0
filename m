Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ACE99794BD
	for <lists+xen-devel@lfdr.de>; Sun, 15 Sep 2024 08:21:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.798853.1208885 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1spid3-00048Q-U1; Sun, 15 Sep 2024 06:21:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 798853.1208885; Sun, 15 Sep 2024 06:21:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1spid3-00046W-RN; Sun, 15 Sep 2024 06:21:01 +0000
Received: by outflank-mailman (input) for mailman id 798853;
 Sun, 15 Sep 2024 06:21:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=F3w5=QN=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1spid2-00046Q-4u
 for xen-devel@lists.xenproject.org; Sun, 15 Sep 2024 06:21:00 +0000
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id abf2d3f4-732a-11ef-a0b5-8be0dac302b0;
 Sun, 15 Sep 2024 08:20:58 +0200 (CEST)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-a8d60e23b33so436832466b.0
 for <xen-devel@lists.xenproject.org>; Sat, 14 Sep 2024 23:20:58 -0700 (PDT)
Received: from [172.31.47.100] ([193.118.249.27])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a90610f3a92sm156974866b.81.2024.09.14.23.20.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 14 Sep 2024 23:20:57 -0700 (PDT)
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
X-Inumbo-ID: abf2d3f4-732a-11ef-a0b5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1726381258; x=1726986058; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FHvupKFjUJ/XYxCi2zqus0bXeKJZr+0eHcMH1hqh6iE=;
        b=ah47zeWkgbTNCTpwaLk7oH/d7/huG8rhoQQ7yGrmBzHv7z2qhDWjaIASXnffzzu0ta
         Ul0ZAhRfAhgiIoagGfjn+kG4T1967xk6UIcnNzOtrtjwrjPbx6vAssVRq0uHxgY2ov4x
         nqrkUEmRTGfGoIk7rVAR8V8D6FMCU4urCvvIdhRlgqplBc3/Xps9/ZEH4dtg1dZSyors
         0VyV+FRqC3uDtzjsUVqiT5tI1v3BkMUS/x6gBD5mYUyZmwhGTFRQntpbwGnW0svmuLzg
         t7QT2jM/SPUwyOHyjZzZC+iOvCKLwYcgegyzhAAlD5NptKlKG8a2H13BjbjDSr882brX
         BTYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726381258; x=1726986058;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FHvupKFjUJ/XYxCi2zqus0bXeKJZr+0eHcMH1hqh6iE=;
        b=C3Mvcg1ZAJIsPpsBskXoXV3mIxyufHYlRzj8+YGnFliWv1UbMng1huQ6ObpgigZrCl
         HOdMkx0gneS/VbYmKRSNL9fszjJKA3aPKMprcPBJH+huSUx+XLHZiydHDsMk5CXtek8o
         iKESXD5EgKRbNbz80iOtnbW14HyJf6tif9UPjqVJWq2BmRqDQHaEP32zTshEBzQFRq8a
         x/+1t1dWrX9NVHpw5Xq19I/EtDN+76sNl3TzIMlMeG2Ji0etgMcMhhZRZV+sI1P4gAVj
         LPb+0CGRpv8QvB9ItvrFjZFdLFG9AnNO3p7N5BtkkaPsXtU09kKreK9rseNiwFIsmwXs
         b2Ag==
X-Forwarded-Encrypted: i=1; AJvYcCVm1Xqf8gl5B3BfJlsp5OZG+7AKAmvn+dTJOevptevjZl657JG0eFgR11ES8bvEScuVEyhPFTIVNxQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw4b4N2SP2OWjhWFRaTQAqdMd7iGhbSwxaro5i66ngk64iU3Xw2
	qh8tgkpkk2qNpuOEyZAE5tCXkHBLPARs1HpQhqrk3D/TKfynyjmZ72vbRfVYOQ==
X-Google-Smtp-Source: AGHT+IF5I+ZCtWRSL8Qd6DDPcBK/KDiVe5qJJl+otc7CFOl6sn8nMFNEnHJp/ayvlJKmoCu3Gs7ymg==
X-Received: by 2002:a17:907:c7d8:b0:a8d:7b7d:8c48 with SMTP id a640c23a62f3a-a9029481771mr1115894166b.25.1726381257742;
        Sat, 14 Sep 2024 23:20:57 -0700 (PDT)
Message-ID: <76d6d359-d856-4c31-b7ef-30084d7a735c@suse.com>
Date: Sun, 15 Sep 2024 08:20:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] x86/boot: Initialise BSS as soon as possible
To: Frediano Ziglio <frediano.ziglio@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20240910161612.242702-1-frediano.ziglio@cloud.com>
 <20240910161612.242702-2-frediano.ziglio@cloud.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20240910161612.242702-2-frediano.ziglio@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10.09.2024 18:16, Frediano Ziglio wrote:
> --- a/xen/arch/x86/boot/head.S
> +++ b/xen/arch/x86/boot/head.S
> @@ -231,6 +231,27 @@ __efi64_mb2_start:
>          /* VGA is not available on EFI platforms. */
>          movl   $0,vga_text_buffer(%rip)
>  
> +        /*
> +         * Align the stack as UEFI spec requires. Keep it aligned
> +         * before efi_multiboot2() call by pushing/popping even
> +         * numbers of items on it.
> +         */
> +        and     $~15,%rsp

You don't use the stack below, so it's not clear if/why this needs
moving. If it does, please add the missing blank after the comma
(like you nicely do everywhere else).

Apart from this there's the question on the precise placement of
the calls - see respective comment on patch 2 (which I needed to
look at first to have an opinion here).

Jan

