Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DC8BA1CE79
	for <lists+xen-devel@lfdr.de>; Sun, 26 Jan 2025 21:39:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.877292.1287432 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tc9Px-00040L-Fd; Sun, 26 Jan 2025 20:39:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 877292.1287432; Sun, 26 Jan 2025 20:39:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tc9Px-0003xz-CB; Sun, 26 Jan 2025 20:39:41 +0000
Received: by outflank-mailman (input) for mailman id 877292;
 Sun, 26 Jan 2025 20:39:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Vl/L=US=linaro.org=richard.henderson@srs-se1.protection.inumbo.net>)
 id 1tc9Pw-0003xp-2v
 for xen-devel@lists.xenproject.org; Sun, 26 Jan 2025 20:39:40 +0000
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com
 [2607:f8b0:4864:20::630])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a939ae1c-dc25-11ef-a0e6-8be0dac302b0;
 Sun, 26 Jan 2025 21:39:39 +0100 (CET)
Received: by mail-pl1-x630.google.com with SMTP id
 d9443c01a7336-2164b662090so71697385ad.1
 for <xen-devel@lists.xenproject.org>; Sun, 26 Jan 2025 12:39:39 -0800 (PST)
Received: from [192.168.0.4] (174-21-71-127.tukw.qwest.net. [174.21.71.127])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-ac48f897f8dsm4913213a12.22.2025.01.26.12.39.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 26 Jan 2025 12:39:37 -0800 (PST)
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
X-Inumbo-ID: a939ae1c-dc25-11ef-a0e6-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737923978; x=1738528778; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MvjpRtAdSgDSzkYfmgpR6A/dBIEK8m+/NiOGB5xZ+o4=;
        b=yeAirxMnIZ4echnzc5/x/nDAQacZlc6ss0ApwPwGu8ljVKmIPskdoZ7GGvlpJrzoYZ
         wp8jZh8BumRyzWCD71icuq8nQ8ZLeWWCY59X72uNA9f5YVpA3g6om5Z6PirhS3UTcddQ
         WqoPjZRuF7lOJVNVudAf/l+UAvF5bTU0PlyF9N7NQFlYRd1Z16iDd2pBevF5pQCC69cu
         PQ1KVgkdN0d67gjac73hUid3eK9GutiyWsuyRFvFKxIUkm+ZfE9El4GKc+mIb16PSuPe
         sERvErlf9ORCN43rZqVIwzbwH647z8gNJ+NdKg0OkDjgkRL7xDD7IlVliwyicPOHaDib
         jONg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737923978; x=1738528778;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MvjpRtAdSgDSzkYfmgpR6A/dBIEK8m+/NiOGB5xZ+o4=;
        b=vkY+kNF8a1Kd8y0nERSQOyiTVWwD8GoBmCJve6/vp43FK82kN+ZK7DyXBmHXu9LIm3
         8+0srfemDxmZZbp0liD2pGV1NL5X6n8NW2zqkdsIWgzV9j841BfJ3qCrpzDs3VF/8DKn
         M83Yry7uvxtfNu2N5ye0yFT7UBTWnjxh1WfUGP8+u1UNR0VHuvHZ5qw92+aOL5kN3Ys3
         mfvUuD1HlhjrNqd6KkVy1ZJNbPtay+0qiOqKFbLsDMMZn/5ePT5h69RGFS1zBDBPolcz
         wFgxgUr2OKO/I53cNvq35n3wKfLTgU+t1c58A9177pM5lkhszRZqI7lhu3mnaG999tfU
         DYDQ==
X-Forwarded-Encrypted: i=1; AJvYcCW9D8XD6DSTOSoT0ZuoQo7TCJg1m2q0PAVLw7DnP9bt1tB5+JWL7CngxJxe/DUtejpH9CUDtGrBFd4=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw1aVs8vca9tmbqK35WsfadOKpZ/Ld/vUiy9KYDCL8aqJExBRqG
	WAPp83y6X+ttKWSpgvJb23ob5QqF7ViN5UpR5B+PL1krgISlsFLt6zyWCN6+3E4=
X-Gm-Gg: ASbGnctOMCCfeR7I8bax+nEgRbe2tpeOnNZHOz8cUCvpXb0+n7RCYws+Hm0TKXk2TXy
	V6/yj27yht9hTG2xSL7oVN3sDLnO+HwOrkoaATDKPaaBEYMEu/ZVQnIvMHDLDtsRg1lt4/1jR3u
	m1ho4FfF6LF0poDOnkLN88wnDila8gpy6cC7rXjz7vF/12xnd+f5bVciwJtLl37f8qr0Jb/DFDs
	BBob9Qprru1oLpA4ViNC9xhUQd+IElEXbP5czylYhEsoHe/QZc2Kxeq4ZywU/JHp3tR5ShigvbP
	ETIv3+UIN5vLFcvTgJgIS7Cz5iWVrFwlS7Q9Z3xcpO4p1xk=
X-Google-Smtp-Source: AGHT+IGm+ocgYvvkVWsUvSKMByg6rdOolrkUz0sM7TYcNoHM9kXNHQjPzT7fvMCLNswi1NUAED96dg==
X-Received: by 2002:a05:6a20:394b:b0:1e5:a0d8:5a33 with SMTP id adf61e73a8af0-1eb21480ef0mr65256986637.18.1737923977749;
        Sun, 26 Jan 2025 12:39:37 -0800 (PST)
Message-ID: <25ab2464-7878-4ade-89b5-1691f70736fc@linaro.org>
Date: Sun, 26 Jan 2025 12:39:35 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/20] accel: Rename 'hw/core/accel-cpu.h' ->
 'accel/accel-cpu-target.h'
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>, =?UTF-8?Q?Alex_Benn=C3=A9e?=
 <alex.bennee@linaro.org>, kvm@vger.kernel.org, qemu-ppc@nongnu.org,
 qemu-riscv@nongnu.org, David Hildenbrand <david@redhat.com>,
 qemu-s390x@nongnu.org, xen-devel@lists.xenproject.org
References: <20250123234415.59850-1-philmd@linaro.org>
 <20250123234415.59850-12-philmd@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20250123234415.59850-12-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 1/23/25 15:44, Philippe Mathieu-Daudé wrote:
> AccelCPUClass is for accelerator to initialize target specific
> features of a vCPU. Not really related to hardware emulation,
> rename "hw/core/accel-cpu.h" as "accel/accel-cpu-target.h"
> (using the explicit -target suffix).
> 
> More importantly, target specific header often access the
> target specific definitions which are in each target/FOO/cpu.h
> header, usually included generically as "cpu.h" relative to
> target/FOO/. However, there is already a "cpu.h" in hw/core/
> which takes precedence. This change allows "accel-cpu-target.h"
> to include a target "cpu.h".
> 
> Mechanical change doing:
> 
>   $  git mv include/hw/core/accel-cpu.h \
>             include/accel/accel-cpu-target.h
>   $  sed -i -e 's,hw/core/accel-cpu.h,accel/accel-cpu-target.h,' \
>     $(git grep -l hw/core/accel-cpu.h)
> 
> and renaming header guard 'ACCEL_CPU_TARGET_H'.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   MAINTAINERS                                               | 2 +-
>   include/{hw/core/accel-cpu.h => accel/accel-cpu-target.h} | 4 ++--
>   accel/accel-target.c                                      | 2 +-
>   cpu-target.c                                              | 2 +-
>   target/i386/hvf/hvf-cpu.c                                 | 2 +-
>   target/i386/kvm/kvm-cpu.c                                 | 2 +-
>   target/i386/tcg/tcg-cpu.c                                 | 2 +-
>   target/ppc/kvm.c                                          | 2 +-
>   target/riscv/kvm/kvm-cpu.c                                | 2 +-
>   target/riscv/tcg/tcg-cpu.c                                | 2 +-
>   10 files changed, 11 insertions(+), 11 deletions(-)
>   rename include/{hw/core/accel-cpu.h => accel/accel-cpu-target.h} (95%)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

