Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB0217A0BE9
	for <lists+xen-devel@lfdr.de>; Thu, 14 Sep 2023 19:42:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.602613.939279 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgqLx-00039X-RK; Thu, 14 Sep 2023 17:42:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 602613.939279; Thu, 14 Sep 2023 17:42:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgqLx-00036Y-NO; Thu, 14 Sep 2023 17:42:09 +0000
Received: by outflank-mailman (input) for mailman id 602613;
 Thu, 14 Sep 2023 17:42:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uqVP=E6=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1qgqLv-00036Q-BN
 for xen-devel@lists.xenproject.org; Thu, 14 Sep 2023 17:42:07 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 04b6d6cb-5326-11ee-9b0d-b553b5be7939;
 Thu, 14 Sep 2023 19:42:05 +0200 (CEST)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-401d6f6b2e0so15440465e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 14 Sep 2023 10:42:05 -0700 (PDT)
Received: from [10.80.67.28] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 l4-20020a5d4804000000b0030ada01ca78sm2272631wrq.10.2023.09.14.10.42.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Sep 2023 10:42:04 -0700 (PDT)
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
X-Inumbo-ID: 04b6d6cb-5326-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1694713324; x=1695318124; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:references:cc:to
         :content-language:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=O5P09Fowp3yjIYcgyxnprWNjqJlp5DVeKLE4sUDeX1E=;
        b=Wp8Vf+RuMo3CRfop6vPplpt/V5cq8tztGcGDOcD2MjNRhRfiosymQTHiGLhQd3KzGH
         ZZNEgZJj7ADx2dJztoPt9wturDXHkpb6moA8/1j1386xdEshkdnzXE82opkEJ9SQYlBZ
         NXHx5Mfj0/AlnAcemqSOBWegIoj3giLzvU0fc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694713324; x=1695318124;
        h=content-transfer-encoding:in-reply-to:references:cc:to
         :content-language:subject:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O5P09Fowp3yjIYcgyxnprWNjqJlp5DVeKLE4sUDeX1E=;
        b=LMJR5yP0vsdzQXqlQEulKvQsk47sIBnfXsez5T3+vhMTxUREN/fOa11Y9511hipgkJ
         5Rz9ITHjZBlBG/fI+cVAFYtbAlKmamoXKLUCF0sGlrdNomjfJTVKtDla8JjKxkYr+CpV
         sp7OseuyxHgDBR37sxy68huAYjK8ShG7KuinwO0QRdi2jY6pBzescYZ0959bErhr7sVL
         RkrQrlNVQfVcnvy+DCcGkUNk2YXow7PCA8OhuHm90T/tWhLviqEmgIZcOD9g6n/j8cAJ
         SETCO/JBckdcBVvNj+l3FcBVmuWl6iGNl100wp0Yq4yN9qymHIlUFCF9q2RV1Ye5pltf
         JnqQ==
X-Gm-Message-State: AOJu0Yz5of7ikUBKEDlFwDgN/n3mV4wtx2L0flDd1arndKnyCkDwJoqw
	GYQIVboJE15K0xXSJZIFrdMRKWetDW/X+6S0D2aY1g==
X-Google-Smtp-Source: AGHT+IGMAWwLRr/hOumS9DT09MGLMrowZemv7tB8rOLepMBJRbm7MiYvLmERbLPPlCXJ8riZxXJWUA==
X-Received: by 2002:a5d:6e56:0:b0:317:6579:2b9f with SMTP id j22-20020a5d6e56000000b0031765792b9fmr1704358wrz.30.1694713324372;
        Thu, 14 Sep 2023 10:42:04 -0700 (PDT)
Message-ID: <2d767f96-9f20-e786-9148-cae5c30a41fd@citrix.com>
Date: Thu, 14 Sep 2023 18:42:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86/shutdown: change default reboot method preference
Content-Language: en-GB
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>
References: <20230914152120.92696-1-roger.pau@citrix.com>
In-Reply-To: <20230914152120.92696-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 14/09/2023 4:21 pm, Roger Pau Monne wrote:
> The current logic to chose the preferred reboot method is based on the mode Xen
> has been booted into, so if the box is booted from UEFI, the preferred reboot
> method will be to use the ResetSystem() run time service call.
>
> However, that call seems to be widely untested once the firmware has exited
> boot services, and quite often leads to a result similar to:

I don't know how true this is.  What Xen does differently to most of the
rest of the world is not calling SetVirtualAddressMap()

>
> Hardware Dom0 shutdown: rebooting machine
> ----[ Xen-4.18-unstable  x86_64  debug=y  Tainted:   C    ]----
> CPU:    0
> RIP:    e008:[<0000000000000017>] 0000000000000017
> RFLAGS: 0000000000010202   CONTEXT: hypervisor
> [...]
> Xen call trace:
>    [<0000000000000017>] R 0000000000000017
>    [<ffff83207eff7b50>] S ffff83207eff7b50
>    [<ffff82d0403525aa>] F machine_restart+0x1da/0x261
>    [<ffff82d04035263c>] F apic_wait_icr_idle+0/0x37
>    [<ffff82d040233689>] F smp_call_function_interrupt+0xc7/0xcb
>    [<ffff82d040352f05>] F call_function_interrupt+0x20/0x34
>    [<ffff82d04033b0d5>] F do_IRQ+0x150/0x6f3
>    [<ffff82d0402018c2>] F common_interrupt+0x132/0x140
>    [<ffff82d040283d33>] F arch/x86/acpi/cpu_idle.c#acpi_idle_do_entry+0x113/0x129
>    [<ffff82d04028436c>] F arch/x86/acpi/cpu_idle.c#acpi_processor_idle+0x3eb/0x5f7
>    [<ffff82d04032a549>] F arch/x86/domain.c#idle_loop+0xec/0xee
>
> ****************************************
> Panic on CPU 0:
> FATAL TRAP: vector = 6 (invalid opcode)
> ****************************************
>
> Which in most cases does lead to a reboot, however that's unreliable.
>
> Change the default reboot preference to prefer ACPI over UEFI if available and
> not in reduced hardware mode.
>
> This is in line to what Linux does, so it's unlikely to cause issues on current
> and future hardware, since there's a much higher chance of vendors testing
> hardware with Linux rather than Xen.
>
> I'm not aware of using ACPI reboot causing issues on boxes that do have
> properly implemented ResetSystem() methods.
>
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Wording aside, Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

This is a giant embarrassment to Xen, and needs fixing.

> ---
> I haven't found anything in the UEFI spec that mandates to use ResetSystem()
> when booted from UEFI, I've only found:
>
> "One method of resetting the platform is through the EFI Runtime Service
> ResetSystem()."
>
> But that's vaguely a recommendation.
>
> I've found a lot of boxes that don't reboot properly using ResetSystem(), and I
> think our default should attempt to make sure Xen reliably reboots on as much
> hardware as possible.

You're supposed to use ResetSystem() so all the value-add can be added
behind your back, but it's a chocolate teapot when it's so broken that
none of the OSes use it...

~Andrew

