Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D3739ABDE7F
	for <lists+xen-devel@lfdr.de>; Tue, 20 May 2025 17:11:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.990897.1374828 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHOd2-0000QR-O4; Tue, 20 May 2025 15:11:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 990897.1374828; Tue, 20 May 2025 15:11:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHOd2-0000P2-Kx; Tue, 20 May 2025 15:11:40 +0000
Received: by outflank-mailman (input) for mailman id 990897;
 Tue, 20 May 2025 15:11:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=PJhk=YE=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uHOd1-0000Ow-8G
 for xen-devel@lists.xenproject.org; Tue, 20 May 2025 15:11:39 +0000
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [2a00:1450:4864:20::529])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ba1f430e-358c-11f0-a2fa-13f23c93f187;
 Tue, 20 May 2025 17:11:38 +0200 (CEST)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-601609043cfso6229975a12.0
 for <xen-devel@lists.xenproject.org>; Tue, 20 May 2025 08:11:38 -0700 (PDT)
Received: from [10.1.248.227] ([80.188.125.198])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6005a6e3ca0sm7505700a12.42.2025.05.20.08.11.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 May 2025 08:11:37 -0700 (PDT)
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
X-Inumbo-ID: ba1f430e-358c-11f0-a2fa-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1747753898; x=1748358698; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3nIGCruBoziHP+zwfCA2lqpvfCSAIq19XHEvtDtgFlQ=;
        b=PVMv8d5+SfjVYZ38Z85mflaO0/bdTLrr+XJNJkI6FGOSq0/kGoVYnPpyllXrw3Ava2
         7Ka20rxKMZMSWdF23Q7uNKQAP0w9FjizU9yjAmm9WyDaunTcoetr3IvjtwGqph26wVSl
         7ooT9LNkSPNM1HOnLX03mwtlQITjBMMi5G8dYP6iGDvyO/2g7v8w3KQc4cN7kCI0lsHm
         NdieznX7INTqgtG5c+Sz4WBQoI12wHrWonvaJSi8eljUNVSxbwWblN3425xwwob2KW+h
         K+maHAymRjf167UEXu53ie7ZlbUgIHHWydjCWTB9MA1ui06PHqwasolwRQnH29OBnPlQ
         26vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747753898; x=1748358698;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3nIGCruBoziHP+zwfCA2lqpvfCSAIq19XHEvtDtgFlQ=;
        b=gbY0ru6r8D4VXcA+D3xjY72Bin7Rz2R6muQlDM+sdSU0seiwc/mvDnT4t4MrhGHKMs
         8T79PpWoAJ92+37DC5Lu40CF/+2llRM7QtTFRdW7Fc8NicwsZ1MWgCWhjuqAXGCEhCS2
         igLFbQ6ve1STtdepJ4zx0fDuOc9kJKo4tbQzzGCLE41Inw2iVCT1x0nlAgBYxY2wt9yv
         Yf4QmAI5ZA8d8LNR0Tc6jzGhkp8Qx3pPRYQIJ5e9CRD3SxMAYEe0lHvwkj7RoRRB3G9L
         OSFX4S2ge/uEE1zqjwpIoIoZuv3J+N9BysPOYNpk6IElYOGEo1lPfk2A+GMuMC/dQlLc
         7Iew==
X-Forwarded-Encrypted: i=1; AJvYcCWFoE4BLS/c2H4rlhXn94PKZsoCuOXsoC+8CN2sXAeG9ABJTEFusq8Qqu4rlwFXDAr9eRghLiufCJU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxV0ikyNcG41dvTLDN5atNzQBo+1UFAfJjEoZM4+Q60NFyjazFa
	/uFEUXtmeQSBiM+knIoF3F/qAlKnhkwRW/d95UB7vJ1oh7xsHOZ0ERC/uH/8RNi1Eg==
X-Gm-Gg: ASbGnct0UGrEpHIIfbOCKRhBgl+KwyFeCErqs9aYZMD2M0D4wjLBka77eTVenqW25ln
	cWiXwpnqgBr3isxdr3auSEX35pCfXdAPloDFMlh3zISlWfZkc+tZyzS8cL+eVdd8XF/AVQtJevv
	pq9xra7gNx8nbU4Nl7TS3kccWZEV9hekuE1Q6DNedZcnCq8r680OAncwfPW9u/x7GaR3wuPzxMY
	Xf+bKePZm4htPCvE41GGSYoP/MlPy7UaC8eNsD35gBD1vldP8MJ6bogWRzLaqafxXWTnhYLg0Rg
	kagCtHIeWCFn5BAMXVkMXTGzdGHAV4gQgk2z9e0BadApzLKnCU74gooKExz4TZ7rtwN/Kw+2
X-Google-Smtp-Source: AGHT+IFvMikcGVviHukTluwXy9Ah/1ufJYvIPBbBDzcYouBorlmOvV+lGigpz0yn92VB10uVFSm++g==
X-Received: by 2002:a05:6402:50c9:b0:601:a681:4d5c with SMTP id 4fb4d7f45d1cf-601a6814f05mr9998135a12.32.1747753897648;
        Tue, 20 May 2025 08:11:37 -0700 (PDT)
Message-ID: <ad1d0c41-a554-49f2-8397-a288b4b75eae@suse.com>
Date: Tue, 20 May 2025 17:11:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 5/6] xen/riscv: add new p2m types and helper macros for
 type classification
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1746805907.git.oleksii.kurochko@gmail.com>
 <52861198c7c363c4b0caf818345f4ffbec056337.1746805907.git.oleksii.kurochko@gmail.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <52861198c7c363c4b0caf818345f4ffbec056337.1746805907.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 09.05.2025 17:57, Oleksii Kurochko wrote:
> --- a/xen/arch/riscv/include/asm/p2m.h
> +++ b/xen/arch/riscv/include/asm/p2m.h
> @@ -80,8 +80,36 @@ struct p2m_domain {
>  typedef enum {
>      p2m_invalid = 0,    /* Nothing mapped here */
>      p2m_ram_rw,         /* Normal read/write domain RAM */
> +    p2m_ram_ro,         /* Read-only; writes are silently dropped */

This is pretty special a type, which imo better wouldn't be introduced
without there being proper support for it. (I don't suppose RISC-V
hardware alone can effect this type?)

> +    p2m_mmio_direct_dev,/* Read/write mapping of genuine Device MMIO area */
> +    p2m_map_foreign_rw, /* Read/write RAM pages from foreign domain */
> +    p2m_map_foreign_ro, /* Read-only RAM pages from foreign domain */

Aiui you took these from Arm. Looking at its sole use, I'm not convinced
it's used correctly. If it is, the same comment as for p2m_ram_ro above
would apply here, too.

Jan

