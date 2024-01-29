Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B5E6A840C48
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jan 2024 17:50:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.673048.1047198 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rUUpv-0007nY-Db; Mon, 29 Jan 2024 16:50:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 673048.1047198; Mon, 29 Jan 2024 16:50:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rUUpv-0007lJ-AS; Mon, 29 Jan 2024 16:50:19 +0000
Received: by outflank-mailman (input) for mailman id 673048;
 Mon, 29 Jan 2024 16:50:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RfnY=JH=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1rUUpt-0007jp-Tu
 for xen-devel@lists.xenproject.org; Mon, 29 Jan 2024 16:50:18 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7af166d1-bec6-11ee-8a43-1f161083a0e0;
 Mon, 29 Jan 2024 17:50:17 +0100 (CET)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-40ef6454277so10572985e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jan 2024 08:50:17 -0800 (PST)
Received: from [192.168.69.100] ([176.187.219.39])
 by smtp.gmail.com with ESMTPSA id
 iv16-20020a05600c549000b0040e3635ca65sm14633892wmb.2.2024.01.29.08.50.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Jan 2024 08:50:16 -0800 (PST)
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
X-Inumbo-ID: 7af166d1-bec6-11ee-8a43-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706547016; x=1707151816; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=omKaa0iHW1o+ye+O07qQ9YI+SPw/nbBCLeN2GURIQnI=;
        b=d+6VrbVfoaKfT+FR5O+HRHNW5Jq/ZzaKwIF3ZmCTAkItY57DZ/RmRAMaU+mqVD8nQC
         jmouOdiToVrIqv5mw/YoXyvjINR+zKAhRQHABZdRq9/WZjxUwClFNhY3LrrwMmnKW5gO
         0Vbp+sQQWqMekU6SPQ3Oioj05kOS6GSy9wzxNxRV5TgAzXHgf/YAUEwCXpCa0NzuyN9A
         dz8T1g5oVrQgn+mS7tQbrpTWUvphpvjZMI4UM0mE0hf8MExSo5iAk78Yq7eac0IW3API
         Bu/yATxhcAfBsWZn40/QCxYvDeHsqfLn8lCWfJ1u/Tzk5d6B2tyKOPp26FVMxzcR3vhp
         M0HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706547017; x=1707151817;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=omKaa0iHW1o+ye+O07qQ9YI+SPw/nbBCLeN2GURIQnI=;
        b=VCTL7ChTwxUfyxXJnUH6FcG3CWjTKnV3vDR4BYOMSvhvjmHPncPxH3vobmt37WB29Q
         aqx5WfRUMxHKgV2PqKcB/wQV+GZgg/ODL5qhEdpgHRQOhxcWmP/6XFEGyIbL6S4iAoe7
         uBPW/SaBfMk59KYuO8TJdtveYHk31NV+5fRT7nhDfzQw8Lmn2azkQLPyD8qukiJOtS3L
         eqKBnW3c9P1DUhUcrRR0gFB8i8EGXxK2+Wr7Wo+OPrjMmdFA2Yh3FEccRf9biZsiJtrO
         FhWxfDSD7WZOMAUXAjYvWPXro5QugJdKv6SfMVYknEeVxjN7LioIklNcTbnBU/L5LBeB
         QhWg==
X-Gm-Message-State: AOJu0YzRf36tFLVxTsEByydw1V0lau7mOwu+i305U13CjBxlN8wndvm0
	d6QjE5HAirzsS01710IM+BZXgeyMWQie/Z8Y3qD8wLEe9p17BladQnxNVDzkvj8=
X-Google-Smtp-Source: AGHT+IENRodsNqBb2ZsMapK29qw3M64BL/PIvqlcP6V/HUTtgCz0m1D+dNQrPnYAHAiX3P1S+64j7w==
X-Received: by 2002:a05:600c:4e88:b0:40e:5523:e6dd with SMTP id f8-20020a05600c4e8800b0040e5523e6ddmr5423979wmq.30.1706547016686;
        Mon, 29 Jan 2024 08:50:16 -0800 (PST)
Message-ID: <36852ecc-36da-4b8e-bb81-13938a100100@linaro.org>
Date: Mon, 29 Jan 2024 17:50:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 14/29] target/i386: Prefer fast cpu_env() over slower
 CPU QOM cast macro
Content-Language: en-US
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, qemu-s390x@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, kvm@vger.kernel.org,
 qemu-ppc@nongnu.org, qemu-arm@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>,
 Cameron Esfahani <dirty@apple.com>, Roman Bolshakov <rbolshakov@ddn.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, David Woodhouse
 <dwmw2@infradead.org>, xen-devel@lists.xenproject.org
References: <20240129164514.73104-1-philmd@linaro.org>
 <20240129164514.73104-15-philmd@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240129164514.73104-15-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 29/1/24 17:44, Philippe Mathieu-Daudé wrote:
> Mechanical patch produced running the command documented
> in scripts/coccinelle/cpu_env.cocci_template header.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   target/i386/hvf/vmx.h                | 13 ++-------
>   hw/i386/fw_cfg.c                     |  3 +-
>   hw/i386/vmmouse.c                    |  6 ++--
>   hw/i386/xen/xen-hvm.c                |  3 +-
>   target/i386/arch_dump.c              | 11 ++------
>   target/i386/arch_memory_mapping.c    |  3 +-
>   target/i386/cpu-dump.c               |  3 +-
>   target/i386/cpu.c                    | 37 ++++++++----------------
>   target/i386/helper.c                 | 42 ++++++++--------------------
>   target/i386/hvf/hvf.c                |  8 ++----
>   target/i386/hvf/x86.c                |  4 +--
>   target/i386/hvf/x86_emu.c            |  6 ++--
>   target/i386/hvf/x86_task.c           | 10 ++-----
>   target/i386/hvf/x86hvf.c             |  9 ++----
>   target/i386/kvm/kvm.c                |  6 ++--
>   target/i386/kvm/xen-emu.c            | 32 +++++++--------------
>   target/i386/tcg/sysemu/bpt_helper.c  |  3 +-
>   target/i386/tcg/sysemu/excp_helper.c |  3 +-
>   target/i386/tcg/tcg-cpu.c            | 14 +++-------
>   target/i386/tcg/user/excp_helper.c   |  6 ++--
>   target/i386/tcg/user/seg_helper.c    |  3 +-
>   21 files changed, 67 insertions(+), 158 deletions(-)

Actually this one had:

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Acked-by: David Woodhouse <dwmw@amazon.co.uk>
Reviewed-by: Zhao Liu <zhao1.liu@intel.com>

But since I addressed Zhao's suggestion in patch 1
("bulk: Access existing variables initialized to &S->F when available")
which added more changes to this patch, I dropped the tags.

