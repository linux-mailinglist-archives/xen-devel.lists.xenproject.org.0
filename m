Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E1B3673FC20
	for <lists+xen-devel@lfdr.de>; Tue, 27 Jun 2023 14:43:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.556154.868451 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qE82f-0006sQ-3L; Tue, 27 Jun 2023 12:43:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 556154.868451; Tue, 27 Jun 2023 12:43:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qE82e-0006pZ-VS; Tue, 27 Jun 2023 12:43:32 +0000
Received: by outflank-mailman (input) for mailman id 556154;
 Tue, 27 Jun 2023 12:43:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9jY1=CP=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1qE82d-0006VK-BS
 for xen-devel@lists.xenproject.org; Tue, 27 Jun 2023 12:43:31 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 38029d86-14e8-11ee-b237-6b7b168915f2;
 Tue, 27 Jun 2023 14:43:30 +0200 (CEST)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-98e0c1d5289so397270966b.2
 for <xen-devel@lists.xenproject.org>; Tue, 27 Jun 2023 05:43:30 -0700 (PDT)
Received: from [192.168.69.115] ([176.187.199.204])
 by smtp.gmail.com with ESMTPSA id
 k19-20020a1709061c1300b0098dd3981be9sm4477872ejg.224.2023.06.27.05.43.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Jun 2023 05:43:29 -0700 (PDT)
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
X-Inumbo-ID: 38029d86-14e8-11ee-b237-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687869809; x=1690461809;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1mTG0cvKU+zMeoqHlEai9X0XN4bdRY0Fj+S2ZVFglsw=;
        b=JGscvSjGoIt5zVRLMj+z4pQB3/0FtPmXup22DqGc0zhhp0riN4aIMg20E/BBLW2E98
         WdgKEMXAsf/vjSlW+0rzfMzh92/bntJIhsUWrs+pYQ2RCqNBJn7CruxkEX4Num2CPpjq
         Cu1VAziumpAykPKlGGwPoVrLybX8oEiiXC+oMQ6cOOpJ6MspwTxN5xTynf2HfJc/4PuS
         agFOT6HJF3FjtKyGBOUzZ4+wnAxZAWbCIkMijKhC8/MTL7fmrPW4o1umQGjvwNPZj3qk
         Dv8C/gAh/xvAnE5RsFwiY2mA4XOXlcUBSuvjWJC3jAaqrWkQFNjoTjLU6ISTyg2Xge7U
         FZ4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687869809; x=1690461809;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1mTG0cvKU+zMeoqHlEai9X0XN4bdRY0Fj+S2ZVFglsw=;
        b=kW6g1usvwQP011kZUzCAnsiZKMKmCs6GmKnZsw0/fIBfEEesfZRGkD2TnEFUrceBQp
         sSv7IKCNGQtfRppdjSmcbUZeHLnXICK+IUauWen9adM1Z5nYdFfllzXubpL582Oq4S+j
         /5VLaJ0YPdzI5w1bP0nOA+NKJlsfOtlU5jyhRsqF9EDPzIdKnL19z9QvLLTH++dKm/cd
         /5/HgPWj4Dgrxk65VKaPYopLr7H5Fg7ckAilGBl5hMNFiF+LfVKx2D/pzjB+IMhrfb3Y
         abTWcG/JwmKMPQM2tv+MnUuId61H9JKoQr+BGOAdJJW41QEbxjJbfHy7zOdwoEwhiKDh
         R0Xg==
X-Gm-Message-State: AC+VfDyuPi+GocKR9/ecPcAm3IHWhhROIT6MSrmpG5haVHQ6hHgaKHW/
	HUYIh2VLdNLQnGtUVaNek7fUFgig8FtNSB7BiXU=
X-Google-Smtp-Source: ACHHUZ7fuT0GL83RVg8Gj86ErRvzE6j5P8CLlQ8jWsCVG81jwLRBBrRfpqNvsX0LXyM1vFUtszJWyg==
X-Received: by 2002:a17:907:a42c:b0:991:bf04:204f with SMTP id sg44-20020a170907a42c00b00991bf04204fmr5098434ejc.60.1687869809706;
        Tue, 27 Jun 2023 05:43:29 -0700 (PDT)
Message-ID: <7b6c659f-a9d3-c883-ff53-3226c8d31bb8@linaro.org>
Date: Tue, 27 Jun 2023 14:43:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH v3 16/16] accel: Rename HVF 'struct hvf_vcpu_state' ->
 AccelCPUState
Content-Language: en-US
To: qemu-devel@nongnu.org
Cc: kvm@vger.kernel.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Roman Bolshakov <rbolshakov@ddn.com>, qemu-arm@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Alexander Graf <agraf@csgraf.de>, xen-devel@lists.xenproject.org,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Yanan Wang <wangyanan55@huawei.com>, Paul Durrant <paul@xen.org>,
 Reinoud Zandijk <reinoud@netbsd.org>, Eduardo Habkost <eduardo@habkost.net>,
 Cameron Esfahani <dirty@apple.com>, Paolo Bonzini <pbonzini@redhat.com>
References: <20230624174121.11508-1-philmd@linaro.org>
 <20230624174121.11508-17-philmd@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230624174121.11508-17-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 24/6/23 19:41, Philippe Mathieu-Daudé wrote:
> We want all accelerators to share the same opaque pointer in
> CPUState.
> 
> Rename the 'hvf_vcpu_state' structure as 'AccelCPUState'.
> 
> Use the generic 'accel' field of CPUState instead of 'hvf'.
> 
> Replace g_malloc0() by g_new0() for readability.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> ---
> Not even built on x86!

Per IRC chat:
Tested-by: Peter Maydell <peter.maydell@linaro.org>

> ---
>   include/hw/core/cpu.h       |   4 -
>   include/sysemu/hvf_int.h    |   2 +-
>   target/i386/hvf/vmx.h       |  22 ++--
>   accel/hvf/hvf-accel-ops.c   |  18 ++--
>   target/arm/hvf/hvf.c        | 108 +++++++++----------
>   target/i386/hvf/hvf.c       | 104 +++++++++---------
>   target/i386/hvf/x86.c       |  28 ++---
>   target/i386/hvf/x86_descr.c |  26 ++---
>   target/i386/hvf/x86_emu.c   |  62 +++++------
>   target/i386/hvf/x86_mmu.c   |   4 +-
>   target/i386/hvf/x86_task.c  |  10 +-
>   target/i386/hvf/x86hvf.c    | 208 ++++++++++++++++++------------------
>   12 files changed, 296 insertions(+), 300 deletions(-)


