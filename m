Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CCD92AC058C
	for <lists+xen-devel@lfdr.de>; Thu, 22 May 2025 09:22:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.993012.1376463 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uI0Fz-0005m6-5Q; Thu, 22 May 2025 07:22:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 993012.1376463; Thu, 22 May 2025 07:22:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uI0Fz-0005j2-2D; Thu, 22 May 2025 07:22:23 +0000
Received: by outflank-mailman (input) for mailman id 993012;
 Thu, 22 May 2025 07:22:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ix6t=YG=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uI0Fx-0005iw-Mh
 for xen-devel@lists.xenproject.org; Thu, 22 May 2025 07:22:21 +0000
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [2a00:1450:4864:20::536])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7ef27c9c-36dd-11f0-b892-0df219b8e170;
 Thu, 22 May 2025 09:22:19 +0200 (CEST)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-601956fa3beso8519019a12.0
 for <xen-devel@lists.xenproject.org>; Thu, 22 May 2025 00:22:19 -0700 (PDT)
Received: from [10.1.248.227] ([80.188.125.198])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6005ac32b53sm10167046a12.64.2025.05.22.00.22.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 May 2025 00:22:18 -0700 (PDT)
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
X-Inumbo-ID: 7ef27c9c-36dd-11f0-b892-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1747898539; x=1748503339; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OmW4i0A11ZtP8YRdQQ9hPjUiVy3nQCRBWGZIN2e/oes=;
        b=e3hyD7bDzzVtDR4CTV4wconrb3TEH3AOq6wCkpdIaxWLX5kSE5q3kxeQSNpFg0iyiN
         ADpyShuwdajzINUrNC8sOjWFat2cfhZrIZWon/MkknTKu6yLFXyMh41DigB0S0ECcfxa
         WHCbC+pifTrDAf5Pr2ydvHDHFhqRftBGt9SCP9lslofJu8D5CP29yzXaiCl5DYPurFj9
         w3ddwmJAhyqPTkvtP2y93vqXvb1qafXoHD6b2WX5bNa/+sgCjYEe0WSKurphX0PRYt6d
         hy9mF9wH4rFJDUoHXtmxLpc52hnML6iN7kWrTPhSmjMq6baoVHyI8TktW4eogs5LAA2j
         5cfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747898539; x=1748503339;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OmW4i0A11ZtP8YRdQQ9hPjUiVy3nQCRBWGZIN2e/oes=;
        b=rF+Jp8AJfMDqPudMQmEqs2xE7LTO0cJ3sHxhqVowQdKW3p4P7sWmcFWGMly/zlk880
         ryIr7Xh+axVGLgCII7qYdJP4M49yRWXZ/LPF4MhXyZTnxxwdjnm16ns7Pu0amFzc6VyF
         IGTQOzJFJw770OPFnwAVMmiNcFWQ2edOlouT7lbwIgjoP2AdO2fmPldKrKpLdNfvFrtv
         fz5pZf+MLFRcQkU5ymkESKzZ0KoK865Dtq0hpK7NekFNMTur1aCNbJKeOsvNrJpCe0aX
         +ufSIRi9P4TvBb2+MF68U9H9oYu6iUiPywv6QhitC4iUbAsKe6NB1+89ih+gRQnpUr2G
         sZ6Q==
X-Forwarded-Encrypted: i=1; AJvYcCWXLtxe3Osg5a98Be7i3xw93IlM0wrrxcA6VVoAdwSv/v+v5Dn0eLGOilhUtFjxa87WVnHPSO/UH5A=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzcPknQPHRo3useHGl/zmmPh7LfeZJDu19u0tpaY1l9r5IOYWQJ
	54g9y2RFxmI/8PGbvfWSf6nKhrQ/mIBE2nTyrkdqLKYde/BtVJGkUdqz3tDkPuiviA==
X-Gm-Gg: ASbGncu6dejjTagt7eFp8bmkQ1Yl4XqqbYSLPaYr0WBp0E+s4O76NzoPK68WTV1sIT4
	TRC7cUSQUYOAJyFc79HsXl4X/DIpWlmoNy1uWcsldtYEiPdc3N1kBwbodjPPCPkjt+jBz1DZ7Zb
	h+bjd83FfYCwzhYBgL3JoO0+k7iKEX6YqPQa/cYx0dz7lvuL/uHIStf8ynycmuSO6ywsHQQ6FRh
	GK6I133GX/0q/fJdLbklc/K6jN0Q1Two+H8v+a5H4m/2J423Xbgb/ItVT2ChUhZvscN/H5wgGrV
	P676RcwyyQmB6b8mR9KYCQNUZevBenirLDCakDzSc6BgYgIOrn5NsgA8hgib7A==
X-Google-Smtp-Source: AGHT+IF2eVAltQ6MnaXr3ehgVaziCVlJPjtxpWoHEfcQ37yiilP3dFvzex3H06WXrC0R4R+gmxJ4rg==
X-Received: by 2002:a05:6402:1e8c:b0:602:1b8b:292a with SMTP id 4fb4d7f45d1cf-6021b8b2cb2mr7283262a12.2.1747898538921;
        Thu, 22 May 2025 00:22:18 -0700 (PDT)
Message-ID: <0554d84f-41bc-45a5-9c46-c850e0316d87@suse.com>
Date: Thu, 22 May 2025 09:22:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 01/14] xen/riscv: introduce smp_prepare_boot_cpu()
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1747843009.git.oleksii.kurochko@gmail.com>
 <33f3e8378631f6b73148402bbb0b6bb3c64bf754.1747843009.git.oleksii.kurochko@gmail.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <33f3e8378631f6b73148402bbb0b6bb3c64bf754.1747843009.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 21.05.2025 18:03, Oleksii Kurochko wrote:
> Initialize cpu_{possible, online}_map by using smp_prepare_boot_cpu().
> 
> Drop DEFINE_PER_CPU(unsigned int, cpu_id) from stubs.c as this variable isn't
> expected to be used in RISC-V at all.
> 
> Move declaration of cpu_{possible,online}_map from stubs.c to smpboot.c
> as now smpboot.c is now introduced.
> Other defintions keep in stubs.c as they are not initialized and not needed, at
> the moment.
> 
> Drop cpu_present_map as it is enough to have cpu_possible_map. Also, ask
> linker to provide symbol for cpu_present_map as common code references it.
> 
> Move call of set_processor_id(0) to smp_prepare_boot_cpu().
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>


