Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC1DFAC05C9
	for <lists+xen-devel@lfdr.de>; Thu, 22 May 2025 09:34:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.993051.1376503 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uI0Qp-00013l-Ui; Thu, 22 May 2025 07:33:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 993051.1376503; Thu, 22 May 2025 07:33:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uI0Qp-00011Y-RL; Thu, 22 May 2025 07:33:35 +0000
Received: by outflank-mailman (input) for mailman id 993051;
 Thu, 22 May 2025 07:33:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ix6t=YG=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uI0Qo-000110-IU
 for xen-devel@lists.xenproject.org; Thu, 22 May 2025 07:33:34 +0000
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1058ab99-36df-11f0-b892-0df219b8e170;
 Thu, 22 May 2025 09:33:33 +0200 (CEST)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-ad51ef2424bso1211576866b.0
 for <xen-devel@lists.xenproject.org>; Thu, 22 May 2025 00:33:32 -0700 (PDT)
Received: from [10.1.248.227] ([80.188.125.198])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad52d438086sm1027096266b.89.2025.05.22.00.33.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 May 2025 00:33:32 -0700 (PDT)
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
X-Inumbo-ID: 1058ab99-36df-11f0-b892-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1747899212; x=1748504012; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OY4atMzM5dFc/F+bExUQKfalrJYBS2kiIBGL2qt8cmg=;
        b=dlEqBZ3B8XeIjIE29HSe6GM3APAvBMENK2y4+bvCErWZwC+/Rt1EDPQG2kcCvPY+/M
         7YoJK8yucUphatJfr1DwgDV+bMNcAiL715nWKXeKXCGUsk81swqIucnjzRYEPmtXTH7n
         72RynLnGcEAa4qrMANzyvzoxNgt7Ix5F7tWn0Uvkw2Niw6k3GnVdovBfKr3dc/zkx9T5
         NHscDpv3VhB75PMtZDgdcPVFxAMzo/9XrF8G/mTItg9C2DrmkM1cei647TdCGPB0+D/X
         RJpP9Xx20rHjWSs0KTDBkl/mDfE+KthoaTbpnNDxaa0eOTNjkTUhd01vnYlfbWrjGQF+
         1wDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747899212; x=1748504012;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OY4atMzM5dFc/F+bExUQKfalrJYBS2kiIBGL2qt8cmg=;
        b=LOOhSBhtNkeETK+6/1cGeSKZQtLgHdYymgo2ZK0i5a+UDSs7k0GGTjvx4nb7X3YO+o
         FxQmhQrlF3oC95mlUdhs38Ur1WQ+q73TouV2iY8UpTkcNvSV5Iy8YYwn5a/Dmheue1nn
         d7LQrAPbSpU0JIlFdsG6U8oM985gvX9fQvY3BB/MBrSno8SpKqkILECmK9BVnxuBr9Tn
         /aQ06bIg7F3222YxtyVpXMW5ARj4nTekhwq4zDEzloybO1XzNGLsT986tQL0LaGbxEhv
         e16YiY7vUnnqdCLCUN/4EyUXknhf3SVuzDKjvYyeAFWVpi3AySKCoKx5TLK7SDmJly1e
         CIbg==
X-Forwarded-Encrypted: i=1; AJvYcCWOFJZAxOk2iBdimUqGqSH6X6yQLVzKvR/AqIWHgPZKgMpbK56K4r4d0bMq7/dO8Fm471bs00VP6xE=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxw1/kPDY8hk5bXHVAzsyY9DKpwCgDGb4+uyFGKAsePwPGSlfVu
	rak5LQmAssJhPluh9vq/wdeU8tSa3npwyfJM0ocr6n5jDS2Dg82jJrl/A8nHIAmg6w==
X-Gm-Gg: ASbGncuv13fsuQRZZ6iJjP4dIEPUZ8qgr+vOUM3lSIy5ESdwjQr6cpmpO0GEE/Qd/au
	FPAA+T8UE2XotK9P4ASweJnlX2vI6waNQxv3X6c55G1oR2pmjaVuoq3pQdQt9e3IStvfYJF+ZpJ
	4V6xeRVdRA2zXRUn+7CNn78v2NOwmMkzDCqEmGFS4kYMfn0hVA++0Rw9UofKd8TVxrUE9GE4KC3
	zZku9qLMHQSUK5/fb/IUHNmoVwepgM22+FPQdg1lG9UH6HLeK2FW4sbMZzTBJcoD+FNCT4H67WS
	Z6UYhM/bFPXiZXHzEcgGnsspwrQaKmLQj5wrhV+oN4TDjOwfaxBAPeKIzXwqXA==
X-Google-Smtp-Source: AGHT+IGmsPrjGhR/HfxZjU9TQ/wMC/nNAguNrRjkS9o4fFY18sFR7aI5iEZpTynADOkBp7z9C/RHRg==
X-Received: by 2002:a17:907:980d:b0:ad2:3f1f:7965 with SMTP id a640c23a62f3a-ad52d43838fmr2323033166b.4.1747899212339;
        Thu, 22 May 2025 00:33:32 -0700 (PDT)
Message-ID: <aaac8c78-070a-410e-a852-df42a07aa710@suse.com>
Date: Thu, 22 May 2025 09:33:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 03/14] xen/riscv: add ioremap_*() variants using
 ioremap_attr()
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1747843009.git.oleksii.kurochko@gmail.com>
 <2bdbb98adf5246cd1a10e1575b8bf0aa2bdb5f6d.1747843009.git.oleksii.kurochko@gmail.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <2bdbb98adf5246cd1a10e1575b8bf0aa2bdb5f6d.1747843009.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 21.05.2025 18:03, Oleksii Kurochko wrote:
> Introduce ioremap_attr() as a shared helper to implement architecture-specific
> ioremap variants:
> - ioremap_cache()
> - ioremap_wc()
> 
> These functions use __vmap() internally and apply appropriate memory attributes
> for RISC-V.
> 
> These functions are implemned not as static inline function or macros as it will
> require to include asm/page.h into asm/io.h what will lead to compilation
> issue.
> 
> Also, remove the unused ioremap_wt() macro from asm/io.h, as write-through
> mappings are not expected to be used on RISC-V.
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>


