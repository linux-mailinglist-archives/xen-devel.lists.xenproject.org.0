Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CD31A1CE7B
	for <lists+xen-devel@lfdr.de>; Sun, 26 Jan 2025 21:40:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.877303.1287443 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tc9Qu-0005XH-SG; Sun, 26 Jan 2025 20:40:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 877303.1287443; Sun, 26 Jan 2025 20:40:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tc9Qu-0005Um-P8; Sun, 26 Jan 2025 20:40:40 +0000
Received: by outflank-mailman (input) for mailman id 877303;
 Sun, 26 Jan 2025 20:40:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Vl/L=US=linaro.org=richard.henderson@srs-se1.protection.inumbo.net>)
 id 1tc9Qt-0005TR-6h
 for xen-devel@lists.xenproject.org; Sun, 26 Jan 2025 20:40:39 +0000
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com
 [2607:f8b0:4864:20::102a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cc706053-dc25-11ef-a0e6-8be0dac302b0;
 Sun, 26 Jan 2025 21:40:38 +0100 (CET)
Received: by mail-pj1-x102a.google.com with SMTP id
 98e67ed59e1d1-2f42992f608so5244945a91.0
 for <xen-devel@lists.xenproject.org>; Sun, 26 Jan 2025 12:40:38 -0800 (PST)
Received: from [192.168.0.4] (174-21-71-127.tukw.qwest.net. [174.21.71.127])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2f7ffa44cc3sm5572845a91.10.2025.01.26.12.40.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 26 Jan 2025 12:40:36 -0800 (PST)
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
X-Inumbo-ID: cc706053-dc25-11ef-a0e6-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737924037; x=1738528837; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8IakMPE25WQo15H6bcZ/5DvSR8Tj+5m00/ec4213Klk=;
        b=AducoIZIGdzNaOtsZ4VSoE9KZTFw3jgUS6CJAdYcLFSDJL3MuefmywHTvdx6Xt2JAZ
         eqKTyQt+t1rhts5VjschtiIwh3bjCz0KYNb7Clua3mUUnCCyxy3hmgUfxh+ja4Ltg2pJ
         R3HL5iX84hm4hL2wUJKQw6suE6bYVUtHxFZfsV64nMnviSpIdWAjfXtk3CGvHPldYrIx
         5mD2ehF61D0tlRP5mxI4uJNqkR63qJaPkIvhiJlRyJzXiCIXXfJOZp9+YlPWZmcpE/Rr
         ijBgZYYgz1SYP0ZtQXayC3GZVpp/QftZvJ4t0gbtcorJTvZ8H83/Ykm2Nvm9j6cru0CW
         QmoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737924037; x=1738528837;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8IakMPE25WQo15H6bcZ/5DvSR8Tj+5m00/ec4213Klk=;
        b=j5U/akTqG985jb0grRge97VjdQHQ79QL6vSzwyK/lAYaUofYRHZfG8HESqVgQ6gtiH
         ++dLL+kDDY0Llksg1y1L3jj1m347VAp+S7TxVKCTAHU5tBIXNWtJdpDoTAmsBu1kmd3c
         IexmeHwmKmp29ALLV+6LJ4p7aL6yp2s32vg7sM+bzaBjrRqL5381Tw2pf7H5e5EFUtct
         MteBHmE6W6hIzhEC8c25FOr7EkJFFVFFKbQ5pDRS0aV/wu2M4S/oq0QjQwgqmjkudn0i
         n/1kMCOHGKZHQVpL90evmJpGElXHi3nm9NS/1k4EIcz4aQ9T9JClv8VykNaZ9ANggDCR
         KymA==
X-Forwarded-Encrypted: i=1; AJvYcCUD17xKO6heJVrk9sqPu5idWIB7eZM44OY9aZUVE4XzIrGclrP87IKZKryv7wDYX1cgqTYGa0kO5mQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyGIpnHq2kGGf/opnL6kp9ozfH5FlPaC3ZiB2u+N7levYpuPYhx
	DmmmBo3ZiYd17VvX8ZU0oMWti8mZJzxosMyyVYJIV4P4WzW+JFvVu0/PBvg/PWQFWkvvWrSyI7X
	v
X-Gm-Gg: ASbGnctPAXp8Azooo45GOYKNl/oR9YgkICJSxM4Wi/y65II4+5vX/47L7GQduCKNMAt
	ARMHydGjaTgshK2vS4S049oeBh/DD4wpLm6Fo/rH4V8wF9HbKs791BcUYF8N5r87+A62IWWh28m
	fwRsFBfrgdnjgHNIu0R4bGGqE1F/zo1Jut/3ulVADpBCS63Lo0CtM0h8nHPl3EfY06R/JN7M4Sa
	EBegTQMq2JawfxsiyIeLxOEDWOl7inpXmcqphWg3IQd73ZT6G4PBEQnVcFIqFc5fGpeJBIjJCcW
	q9RPDAr/7673xugXpOS/do1vwA+pm9bycGd35zjCKWf7/V8=
X-Google-Smtp-Source: AGHT+IHFyv2iybW4GBn6ydLEZa4E4dxLUY4YPXTswHBeV0LQk9iq0lO2cyUKBRO3s8sCKps06u6bpg==
X-Received: by 2002:a17:90b:2c85:b0:2ee:4b8f:a5b1 with SMTP id 98e67ed59e1d1-2f782d30ecamr56371023a91.24.1737924036671;
        Sun, 26 Jan 2025 12:40:36 -0800 (PST)
Message-ID: <41f18203-efc6-43d5-90fa-ea20416ec01c@linaro.org>
Date: Sun, 26 Jan 2025 12:40:34 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 12/20] accel/accel-cpu-target.h: Include missing 'cpu.h'
 header
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>, =?UTF-8?Q?Alex_Benn=C3=A9e?=
 <alex.bennee@linaro.org>, kvm@vger.kernel.org, qemu-ppc@nongnu.org,
 qemu-riscv@nongnu.org, David Hildenbrand <david@redhat.com>,
 qemu-s390x@nongnu.org, xen-devel@lists.xenproject.org
References: <20250123234415.59850-1-philmd@linaro.org>
 <20250123234415.59850-13-philmd@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20250123234415.59850-13-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 1/23/25 15:44, Philippe Mathieu-Daudé wrote:
> CPU_RESOLVING_TYPE is declared per target in "cpu.h". Include
> it (along with "qom/object.h") to avoid when moving code around:
> 
>    include/accel/accel-cpu-target.h:26:50: error: expected ')'
>       26 | DECLARE_CLASS_CHECKERS(AccelCPUClass, ACCEL_CPU, TYPE_ACCEL_CPU)
>          |                                                  ^
>    include/accel/accel-cpu-target.h:23:33: note: expanded from macro 'TYPE_ACCEL_CPU'
>       23 | #define TYPE_ACCEL_CPU "accel-" CPU_RESOLVING_TYPE
>          |                                 ^
>    include/accel/accel-cpu-target.h:26:1: note: to match this '('
>       26 | DECLARE_CLASS_CHECKERS(AccelCPUClass, ACCEL_CPU, TYPE_ACCEL_CPU)
>          | ^
>    include/qom/object.h:196:14: note: expanded from macro 'DECLARE_CLASS_CHECKERS'
>      196 |     { return OBJECT_GET_CLASS(ClassType, obj, TYPENAME); } \
>          |              ^
>    include/qom/object.h:558:5: note: expanded from macro 'OBJECT_GET_CLASS'
>      558 |     OBJECT_CLASS_CHECK(class, object_get_class(OBJECT(obj)), name)
>          |     ^
>    include/qom/object.h:544:74: note: expanded from macro 'OBJECT_CLASS_CHECK'
>      544 |     ((class_type *)object_class_dynamic_cast_assert(OBJECT_CLASS(class), (name), \
>          |                                                                          ^
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   include/accel/accel-cpu-target.h | 3 +++
>   1 file changed, 3 insertions(+)

Acked-by: Richard Henderson <richard.henderson@linaro.org>

r~

