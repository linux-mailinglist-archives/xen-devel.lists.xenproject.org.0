Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C1D31A1CE81
	for <lists+xen-devel@lfdr.de>; Sun, 26 Jan 2025 21:42:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.877310.1287452 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tc9SX-0006gS-6T; Sun, 26 Jan 2025 20:42:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 877310.1287452; Sun, 26 Jan 2025 20:42:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tc9SX-0006dT-3o; Sun, 26 Jan 2025 20:42:21 +0000
Received: by outflank-mailman (input) for mailman id 877310;
 Sun, 26 Jan 2025 20:42:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Vl/L=US=linaro.org=richard.henderson@srs-se1.protection.inumbo.net>)
 id 1tc9SV-0006a9-Pa
 for xen-devel@lists.xenproject.org; Sun, 26 Jan 2025 20:42:19 +0000
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com
 [2607:f8b0:4864:20::62f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0845e246-dc26-11ef-a0e6-8be0dac302b0;
 Sun, 26 Jan 2025 21:42:18 +0100 (CET)
Received: by mail-pl1-x62f.google.com with SMTP id
 d9443c01a7336-2162c0f6a39so86481175ad.0
 for <xen-devel@lists.xenproject.org>; Sun, 26 Jan 2025 12:42:18 -0800 (PST)
Received: from [192.168.0.4] (174-21-71-127.tukw.qwest.net. [174.21.71.127])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-72f8a6b3233sm5836919b3a.61.2025.01.26.12.42.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 26 Jan 2025 12:42:16 -0800 (PST)
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
X-Inumbo-ID: 0845e246-dc26-11ef-a0e6-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737924137; x=1738528937; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=H48ko7PqBt1MRDsTfWIcWC8+CkMs626ufkIw2bc/5x8=;
        b=SYVlLTI841X10GzFjnkWOd80XVxQNJL0k6vjKJYqJhS8jh6dpD+3jINfs+io5K1D3E
         OOqI2OrQ7bNk327KYlligxoXDoFuJvp0qzkCqkfG2V1mMe09YiNWywSMZL1Rt7hXNjF0
         6y0j1DhTNKwEx6L31CPiNhLFAGV/+HewySP9PcGYMz5FjrD8VSnUXEjA7iLrcQ3Mid3I
         rTgyuFD11RPqs0xKUz17nus/S5IwO8VV5KbvJ9N6Npyo9KuqNRULTGwEVUvl0EojLz/N
         v5ZtSn9lHZBw1AL6weQ/BNU1zq/xmpFiS1v6oYSNObzMeD+37iOC2vlAR+AwiXJN4YKk
         mbkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737924137; x=1738528937;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=H48ko7PqBt1MRDsTfWIcWC8+CkMs626ufkIw2bc/5x8=;
        b=iuW58PmQkqqsR+QWeSkUzUKz3Wx07syZJ1cp+B82bxAx9A4tOJ5gDt4wtYJWgDEI6h
         i7N3NEhU06o5tyD9AqOuff3lyVMta3zegmLf7mgcbbAKkRfYidL+Qc0JnaZDTv6xQFgI
         K9fHaKph+gAkT74eN34MjsSl1dEOAizaSYLJzP7XEjoxcams5k2hOB/3H//+ZWSSZDNY
         eLB4vRk2XZC82nWsPpAI2kqpDIaIrGR3RQZReRh/VFTHd7DfCBnMlhl7Mqz2+5sAxAov
         4w/poJ0d54DoSZlc4gibQSxxqcxxgn3M+oI0PCUoW7WxvrdbJ+4+U/rupXS5nlbfn4DL
         6OZQ==
X-Forwarded-Encrypted: i=1; AJvYcCXaAyNhRTK9g6e5xcbEXzGfTOclGvaLjf+0FTzY1FHpaI1RlhmRkH2/8gGmCaI2z0uHJwMQSZdXqH0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxG/zsjPDKMPGRZAhfOvDi/CliK/uk2CNT74hlVEW8bbNbErFXx
	ZOb9MVzzQ7AJOqmOYt/DW7mmzvZ1jfED0ezpl6RsklUk+3YqQluh/Qw9+vASabY=
X-Gm-Gg: ASbGncuiWzH99kAzJ5p+txtDATSapayXQ3t+Pd5xXZWBwmFo1CvIe5eDMX2yveqlmMI
	IMMZEIwlbSuLE2Ah1w9BjHxV0QXyk0DOfEac7339F88h1/75iPVIcWAE5IF3sx2+xp9QxE68Xjj
	+cQwe6NYCGtxNzP5JYDR7aTMHEyUkiuBLeeOspMCYfYuzeGJ6BtHOvHwlPYeOmA3Wk9bebAsXUf
	kYKkfx3hov+GcR/sAUUiHE6YTY0oygXYyYIHSxJrrbWoVOq0vWWeIhV8VeRG0QRh6JGh1kheGOS
	+Q5QC0AoIRs2q4ZZKyMNCqVJneUMb+EVo4cv2lVnlf/tu48=
X-Google-Smtp-Source: AGHT+IET1Hgf5DlFtTnLB6zbw3cCOrZlZ4h4Z0Ht47r+OhnvTjZQY9E5YHFS64waNnu9A7EWzAD+mw==
X-Received: by 2002:a05:6a00:2719:b0:72a:83ec:b1cb with SMTP id d2e1a72fcca58-72f8adf4091mr15476076b3a.0.1737924137118;
        Sun, 26 Jan 2025 12:42:17 -0800 (PST)
Message-ID: <fc81002d-b169-40f7-80e1-c93e55fadd30@linaro.org>
Date: Sun, 26 Jan 2025 12:42:15 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 13/20] accel: Forward-declare AccelOpsClass in
 'qemu/typedefs.h'
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>, =?UTF-8?Q?Alex_Benn=C3=A9e?=
 <alex.bennee@linaro.org>, kvm@vger.kernel.org, qemu-ppc@nongnu.org,
 qemu-riscv@nongnu.org, David Hildenbrand <david@redhat.com>,
 qemu-s390x@nongnu.org, xen-devel@lists.xenproject.org
References: <20250123234415.59850-1-philmd@linaro.org>
 <20250123234415.59850-14-philmd@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20250123234415.59850-14-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 1/23/25 15:44, Philippe Mathieu-Daudé wrote:
> The heavily imported "system/cpus.h" header includes "accel-ops.h"
> to get AccelOpsClass type declaration. Reduce headers pressure by
> forward declaring it in "qemu/typedefs.h", where we already
> declare the AccelCPUState type.
> 
> Reduce "system/cpus.h" inclusions by only including
> "system/accel-ops.h" when necessary.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   include/qemu/typedefs.h           | 1 +
>   include/system/accel-ops.h        | 1 -
>   include/system/cpus.h             | 2 --
>   accel/accel-system.c              | 1 +
>   accel/hvf/hvf-accel-ops.c         | 1 +
>   accel/kvm/kvm-accel-ops.c         | 1 +
>   accel/qtest/qtest.c               | 1 +
>   accel/tcg/cpu-exec-common.c       | 1 -
>   accel/tcg/cpu-exec.c              | 1 -
>   accel/tcg/monitor.c               | 1 -
>   accel/tcg/tcg-accel-ops.c         | 1 +
>   accel/tcg/translate-all.c         | 1 -
>   accel/xen/xen-all.c               | 1 +
>   cpu-common.c                      | 1 -
>   cpu-target.c                      | 1 +
>   gdbstub/system.c                  | 1 +
>   system/cpus.c                     | 1 +
>   target/i386/nvmm/nvmm-accel-ops.c | 1 +
>   target/i386/whpx/whpx-accel-ops.c | 1 +
>   19 files changed, 12 insertions(+), 8 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

