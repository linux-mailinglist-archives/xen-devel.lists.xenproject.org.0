Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB91DAF94E3
	for <lists+xen-devel@lfdr.de>; Fri,  4 Jul 2025 16:02:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1033421.1406788 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uXgzK-0007VP-4t; Fri, 04 Jul 2025 14:02:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1033421.1406788; Fri, 04 Jul 2025 14:02:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uXgzK-0007St-1c; Fri, 04 Jul 2025 14:02:02 +0000
Received: by outflank-mailman (input) for mailman id 1033421;
 Fri, 04 Jul 2025 14:02:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jMLS=ZR=linaro.org=richard.henderson@srs-se1.protection.inumbo.net>)
 id 1uXgzI-0007Sn-4a
 for xen-devel@lists.xenproject.org; Fri, 04 Jul 2025 14:02:00 +0000
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com
 [2607:f8b0:4864:20::22b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 714629b9-58df-11f0-a315-13f23c93f187;
 Fri, 04 Jul 2025 16:01:55 +0200 (CEST)
Received: by mail-oi1-x22b.google.com with SMTP id
 5614622812f47-40d12821c1cso64220b6e.2
 for <xen-devel@lists.xenproject.org>; Fri, 04 Jul 2025 07:01:55 -0700 (PDT)
Received: from [192.168.4.112] (fixed-187-189-51-143.totalplay.net.
 [187.189.51.143]) by smtp.gmail.com with ESMTPSA id
 5614622812f47-40d02a44bc5sm315193b6e.18.2025.07.04.07.01.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Jul 2025 07:01:53 -0700 (PDT)
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
X-Inumbo-ID: 714629b9-58df-11f0-a315-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751637714; x=1752242514; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gdQOyqpRwSgJgq1ODB3x5MH5gjNy7ViEFGXyEVIG+Y0=;
        b=mQL0k3Yg2h9I9g/nxrD9MxICf9+ztODFPRh6nyLAT8iDU7ffOCX6H2u9Gzrn3NR+wD
         H76nQrh+6hHTXfq8xvmH5JZxBCv0/473Yu+5xy2YsWWHTbHtvuU4wJlIaD1gx1mVFivD
         3ynhVMrQW1PNeULnxIPAIS6aGJnna8d0vSNw4hWFjFtac7oFqM9Io4jKJXvcjQDy7yJv
         rBI3nuYIpj7WP6YoEklzdeukWWdPNI3vRNG4wL3RUqVqd64yjpNXw/xZTt0VVJ5Yi9a9
         K4d8T6hK4UvCjx1vw6K/RdLBjamp4+Df3yQA9zIvbeZSJgSNWqkFho2Dho9naUhnGKZe
         mhlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751637714; x=1752242514;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gdQOyqpRwSgJgq1ODB3x5MH5gjNy7ViEFGXyEVIG+Y0=;
        b=xEnLXDUBpJFtoHIVmalPuLgZwIwhgZnGHzAYqFTgWK82ybzOe7jTluiyqLF5y8TZzf
         aFIEU1iJZXaT1qS4oFQDi9l88hhO+EZvZAX8kID0BPU9qd05TBk82slibdLtqucNcuxO
         +fxY5l01T+ve/FWyeHzMm7E8lfRq2uzT4fuyyxtSe0JIij2DRfPJt/M9Al8Mg3ZO5sRP
         xFxkS44Q3hugWPkEfZGMl3e3AJPKviM8VFQoC0HbfLCS+4nVOj1bTLbm2RoqKycQ7ONS
         c8E3h2QRuogbrAOrCZsK6XmCiMcKmgd8nJjuplBGLaTSlcOy5kgcL1xB8pA2HZEsHftK
         RU2w==
X-Forwarded-Encrypted: i=1; AJvYcCUN6iTw87/5qA5vRYzn9D8kliqxKziEWkxTMCI9oYpNdx2P3NXsgyvfr6/ZjHEXE1xZnb6Sm9omCXs=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxE9/GV44Mg26AEok+YsA1H9Ny/Fo74SQa1scsTbHxg6OfwSgIp
	YYlFWejB5bJyueRg9NurJhVEGfjyyM3/mygDOuNizTLDTPbd+mSU6f6m7LTax3n6sYA=
X-Gm-Gg: ASbGncv+aifCW4rNjuMjY11+XFpQoqlxeefnsRtcMZmOy+CxXPY+aBg6YWH0Pr+PWTh
	COuRLChFAb15Ec7z9HF25s9dA+m9asPqbvJc1fbgHQCf5qoBsSCNCA0tOXCOVr6V6hbDDARNVBH
	Bjx4Egx45Fdimvu+HJmbn08Yb66fyomIGkYxfMXuKHW/SoS7xFqLgz/7uFFGAruIBd1Tu2UVPGs
	xxpvqBhwSIfvuOwA3zqS5P6qzyAfhryZPrDpEu0NAwfhZ41CVDlpqjc1LcOBETDfbGC2x5H4Dhf
	HOAIybQUJjlCFSkpC/A+e9Bueg4lwFMrhu8NVcwJTvtU7uE5VVly2rKkv8bNj7NBAqgxF3l3yW+
	viyOJOLaWt2OO+0tc0JGuAUH11o9KscprUzbPinJn
X-Google-Smtp-Source: AGHT+IHxIVOO+gNuc/LC25XI0U1uFEyxSWF05BGWni1kCzTzcdJfCOeeBeDR0keZpUpg1vyhdOOQdg==
X-Received: by 2002:a05:6808:3028:b0:40a:525d:6220 with SMTP id 5614622812f47-40d043e6d65mr2043241b6e.22.1751637714178;
        Fri, 04 Jul 2025 07:01:54 -0700 (PDT)
Message-ID: <c6eb1d9f-b3eb-4418-8bf1-6edd47ddc2e0@linaro.org>
Date: Fri, 4 Jul 2025 08:01:50 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 37/39] accel: Rename 'system/accel-ops.h' ->
 'accel/accel-cpu-ops.h'
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Zhao Liu <zhao1.liu@intel.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Cameron Esfahani <dirty@apple.com>, Roman Bolshakov <rbolshakov@ddn.com>,
 Phil Dennis-Jordan <phil@philjordan.eu>, Mads Ynddal <mads@ynddal.dk>,
 Fabiano Rosas <farosas@suse.de>, Laurent Vivier <lvivier@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony@xenproject.org>, Paul Durrant <paul@xen.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Reinoud Zandijk <reinoud@netbsd.org>,
 Sunil Muthuswamy <sunilmut@microsoft.com>, kvm@vger.kernel.org,
 xen-devel@lists.xenproject.org
References: <20250703173248.44995-1-philmd@linaro.org>
 <20250703173248.44995-38-philmd@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20250703173248.44995-38-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 7/3/25 11:32, Philippe Mathieu-Daudé wrote:
> Unfortunately "system/accel-ops.h" handlers are not only
> system-specific. For example, the cpu_reset_hold() hook
> is part of the vCPU creation, after it is realized.
> 
> Mechanical rename to drop 'system' using:
> 
>    $ sed -i -e s_system/accel-ops.h_accel/accel-cpu-ops.h_g \
>                $(git grep -l system/accel-ops.h)
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   include/{system/accel-ops.h => accel/accel-cpu-ops.h} | 8 ++++----
>   accel/accel-common.c                                  | 2 +-
>   accel/accel-system.c                                  | 2 +-
>   accel/hvf/hvf-accel-ops.c                             | 2 +-
>   accel/kvm/kvm-accel-ops.c                             | 2 +-
>   accel/qtest/qtest.c                                   | 2 +-
>   accel/tcg/tcg-accel-ops.c                             | 2 +-
>   accel/xen/xen-all.c                                   | 2 +-
>   cpu-target.c                                          | 2 +-
>   gdbstub/system.c                                      | 2 +-
>   system/cpus.c                                         | 2 +-
>   target/i386/nvmm/nvmm-accel-ops.c                     | 2 +-
>   target/i386/whpx/whpx-accel-ops.c                     | 2 +-
>   13 files changed, 16 insertions(+), 16 deletions(-)
>   rename include/{system/accel-ops.h => accel/accel-cpu-ops.h} (96%)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


