Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D5AD9A03AE7
	for <lists+xen-devel@lfdr.de>; Tue,  7 Jan 2025 10:17:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.866171.1277455 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tV5hq-0003cn-N6; Tue, 07 Jan 2025 09:16:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 866171.1277455; Tue, 07 Jan 2025 09:16:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tV5hq-0003bK-KW; Tue, 07 Jan 2025 09:16:58 +0000
Received: by outflank-mailman (input) for mailman id 866171;
 Tue, 07 Jan 2025 09:16:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QnJ5=T7=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1tV5hp-0003ai-3H
 for xen-devel@lists.xenproject.org; Tue, 07 Jan 2025 09:16:57 +0000
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [2a00:1450:4864:20::12e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 243bc1a4-ccd8-11ef-a0df-8be0dac302b0;
 Tue, 07 Jan 2025 10:16:56 +0100 (CET)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-53e3778bffdso16907724e87.0
 for <xen-devel@lists.xenproject.org>; Tue, 07 Jan 2025 01:16:56 -0800 (PST)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-542235f5f74sm5213690e87.43.2025.01.07.01.16.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Jan 2025 01:16:55 -0800 (PST)
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
X-Inumbo-ID: 243bc1a4-ccd8-11ef-a0df-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736241416; x=1736846216; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nQ6+m62PP4YmaEmBS829TX2p9LA/COx/CAnEgJroET4=;
        b=XNF3w07arS16g+q/oGBL5/VAaymtV0mMxF3uTQDdU6bBVGClVssMAmmdneJh97OL/a
         uCCmdDttB8hIHtUe9QeqGKsHO4/1SSZ1jVfL/uG2SXBC9+ideTyuFzdiHyVOBz5GHUz1
         Hp3dnQTkF8Rg737MG7ra1uz2ZU+hvIJVb1twbx/DThGskXkcEaWzGL/72FrnelMiuszj
         XNolMBz1knjGyeRHnbH9Mn/C7VhvWSgvk7d194wguBD7jLVpHd6v8Ni7G0pkReNKejVV
         sJmJ3kpSp52zRffryAV/KnyqJ0dvgO151kYO6ICSBmGYCFgJfQyG6TqCYSgnK7ps7YuQ
         xtPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736241416; x=1736846216;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nQ6+m62PP4YmaEmBS829TX2p9LA/COx/CAnEgJroET4=;
        b=w/aTsv0JXqnM2yibB7pkOmkGIpyQmNE3DB5irYPRxI6v+Z/xz1V0lFVyS1xt5614M5
         oA69IkzvRA55dWXngFZhJnQcR1m5GOqXnARg6Pnk3dz5EVBsa6J7/vgCXdR6OGD+rinL
         gLLjq0OFDspTfRGPMhqzL0KvtJpE48lRRqfVe17WwzZ5tZ3K4oBXd4pbAVgeF2G0LNZI
         2ria7BChW1IkL6AyoGhm4Y+8Ny0Kk2Ll5sIxcSPsg3CGm+hn0s1uImZ3UXRdKPlT3b5R
         zJfPYDww+UdZ6IhKNVgMqXFZhb332/G1PIqihpwnHej5pODJ2c/V/QFcXqdNsILb1LxR
         PTHg==
X-Forwarded-Encrypted: i=1; AJvYcCVNODAAPEf2i6B74i/psmQIl5QEyhPdkWoqAQO747i9BjmstTvYr1KtupCQ+O2C0N11oYX/qdBUBY8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxtD7yXnPgZf5RUP6iwtqTF1aC5XSxQkFryfLMII33/EloXi8yl
	ZJ8p+XlB/OMLNQa85xX8qDJsCYUF2ebSEA9QYnfZLqtQo+KLE7Tl
X-Gm-Gg: ASbGncubn+QFtbiX6wSgi5N0S0ydgFNpJMfzXrDasvLfvwIRxD831J+d68dgVnjFjC6
	+n9Vubfg60HBHJkeD1GHHyzpIHNJOd2adMYvyvg6baqiBxWqMJRUql7XY98xmCnjDbAtgI+YiFa
	Qar14/vIq4Wb6jvPEAj9/U8nP8qGPugIsOz5gPjT4ddUePDjdFhFf22KX+LcZWV6bJq2y4T4H1t
	bPYY1LpopSTxROzlKUOeymsTj8e98LKjxRdvnmDoZ5363azPwGnMWkWHHhGX/tB9IDRJw==
X-Google-Smtp-Source: AGHT+IG7zLmGt3x+WAZVEmCeUQm3J6uo56DroKfE4qInrkozGoIpmr8teyIPStCM4tno6XPluk45EQ==
X-Received: by 2002:a05:6512:3f25:b0:540:1b7e:7b4a with SMTP id 2adb3069b0e04-5422958230amr19661511e87.36.1736241415654;
        Tue, 07 Jan 2025 01:16:55 -0800 (PST)
Message-ID: <3b8794be-025c-488f-b6f3-8687e40a297f@gmail.com>
Date: Tue, 7 Jan 2025 10:16:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.20? 0/5] xen/perfc: Cleanup, and wire up for
 RISCV/PPC
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>
References: <20250102192508.2405687-1-andrew.cooper3@citrix.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <20250102192508.2405687-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 1/2/25 8:25 PM, Andrew Cooper wrote:
> This started as just patch 3 fixing a header tangle with FRED on x86, but grew
> somewhat.
>
> It's simple, straight forward, and gets perf counters working uniformly on all
> architectures, and a net reduction in code.
>
> It's low risk, and should be considered for 4.20 at this juncture.

Agree, we could consider to be in 4.20.

Feel free to commit these patch series.

Thanks.

~ Oleksii


>
> https://gitlab.com/xen-project/people/andyhhp/xen/-/pipelines/1609450793
>
> Andrew Cooper (5):
>    xen/perfc: Drop arch_perfc_{gather,reset}()
>    xen/perfc: Add perfc_defn.h to asm-generic
>    xen/perfc: Trim includes
>    xen/perfc: Cleanup
>    xen/perfc: COMPILE TEST
>
>   automation/gitlab-ci/build.yaml      |  1 -
>   xen/Kconfig.debug                    | 14 ++++----------
>   xen/arch/arm/include/asm/perfc.h     | 21 ---------------------
>   xen/arch/ppc/include/asm/Makefile    |  1 +
>   xen/arch/riscv/include/asm/Makefile  |  1 +
>   xen/arch/x86/include/asm/perfc.h     | 12 ------------
>   xen/common/perfc.c                   | 26 ++++++++++----------------
>   xen/include/asm-generic/perfc_defn.h |  5 +++++
>   xen/include/xen/perfc.h              | 26 ++++++++++++--------------
>   xen/include/xen/perfc_defn.h         |  2 ++
>   10 files changed, 35 insertions(+), 74 deletions(-)
>   delete mode 100644 xen/arch/arm/include/asm/perfc.h
>   delete mode 100644 xen/arch/x86/include/asm/perfc.h
>   create mode 100644 xen/include/asm-generic/perfc_defn.h
>
>
> base-commit: a1746cd4434dd27ca2da8430dfb10edc76264bb3

