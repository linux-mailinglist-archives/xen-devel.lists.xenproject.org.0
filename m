Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B904FA1CE4E
	for <lists+xen-devel@lfdr.de>; Sun, 26 Jan 2025 21:00:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.877239.1287372 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tc8nx-0004IX-F1; Sun, 26 Jan 2025 20:00:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 877239.1287372; Sun, 26 Jan 2025 20:00:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tc8nx-0004G0-CD; Sun, 26 Jan 2025 20:00:25 +0000
Received: by outflank-mailman (input) for mailman id 877239;
 Sun, 26 Jan 2025 20:00:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Vl/L=US=linaro.org=richard.henderson@srs-se1.protection.inumbo.net>)
 id 1tc8nw-0003kh-AK
 for xen-devel@lists.xenproject.org; Sun, 26 Jan 2025 20:00:24 +0000
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com
 [2607:f8b0:4864:20::630])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2d4e4104-dc20-11ef-a0e6-8be0dac302b0;
 Sun, 26 Jan 2025 21:00:23 +0100 (CET)
Received: by mail-pl1-x630.google.com with SMTP id
 d9443c01a7336-2167141dfa1so65355025ad.1
 for <xen-devel@lists.xenproject.org>; Sun, 26 Jan 2025 12:00:23 -0800 (PST)
Received: from [192.168.0.4] (174-21-71-127.tukw.qwest.net. [174.21.71.127])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-21da3d9e083sm49207555ad.25.2025.01.26.12.00.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 26 Jan 2025 12:00:21 -0800 (PST)
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
X-Inumbo-ID: 2d4e4104-dc20-11ef-a0e6-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737921622; x=1738526422; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=r4XT8sSxnuMIL4fpPA4fND9osMVr0JW6MvSO5af0S0M=;
        b=q7BA9rdoQ0fLOsIxIBpPUdOWoV+AvdwWab0orf2N1sAV963UX4MspVUgWOdLgv8Xux
         zoB3mu+1UTy0cWzfJIlpOS8oEUcMKNU5P7wxIMn3rdFIM86HMeOgxPHUyWehzMCBXwEb
         tFiF4Xx1ujt0UlViRrTIxPHEERoeuIwf0ne7524WWzHHrR0WlOc6RFofxSCmDn1a/bgB
         pT4kewSdqGtrCghouVlGFpbEpKPCIiquYVPKPvuPFgyrh+FxWJMp9bnZn3QvhwYhfEER
         3u5b2mNG55dbN02uWMb38775iIiau3Kv2ErNr1CAvgJIJ8CUvUNSd/Txg6I5ks4J25Na
         8zZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737921622; x=1738526422;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=r4XT8sSxnuMIL4fpPA4fND9osMVr0JW6MvSO5af0S0M=;
        b=C8oZyTq1cnHZOmJlptOwA3NLYAme62oYDsn1e/OYTlfmZfzXuwZDFiAAV8t2VrMoOE
         RCspvmGH0t2eEJ9dOde9JRA2kvgtHbxakZc5R6CWxFyTH1Xa0qyl1ESEmy7quNPeDg6C
         6PrqblS90BfYCkTaDoXKQurfZSgrQifCu6oZSAmOyiKBN0QQRXT4BJuicws4BBq/LlFF
         euOhsMzO0t2xKzbpvG678LvwKv+i0bIfWbwoAopJnYQE7iUQZI82fd53XlvXsT5psvBz
         JU5X864nimAgmpRS8edDnxFFfgK5W52qgb14mTya4XDMfvf5dPqWch9iOz3O8VkIJHW2
         JQ0w==
X-Forwarded-Encrypted: i=1; AJvYcCWt97OMyiCnbq3k54tFJlx2q1LukQn49MxgRmniDRSZAWR1Iz6rfVNtI+3WbfTePCGik6e5vE5eadA=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxgr68Q6p3rr1nvda5l969QKptAJKrRUNaCaXdrbTsNKmMHMqvo
	E3pmEHzZ7yMVPHG19b/B89pirsjweJEGfTthfPC2cN47IMwW94hXBZ5t0Lyo0Y4=
X-Gm-Gg: ASbGncvxhtEuyRyLBKMtnK10s2R3BcDWU3jwFm43sS0+ZLMQcwzTO915llSoivqMSu8
	HOsFe7MIQneBuJfXIiecL+sF4rGIAW2BSNJQOka06DYJshti+7CQBKJ8/eGbIBpTsgHw96czjDE
	wO63gwSAeywa7AVnVMBVWhHFDu0or45fQZYXrPz8K0o9x6hiaUi1KjECS6wXq5nFDUS98h45AXL
	/sEpBQZTJtOEYpIRD9PBjpUzFr8rxppjQWE2QkT3KSR6D+NefRE0zpHN0LCvVeZNuS9onQOr/QJ
	1Lt2oEQeyEIKDFiEXgap+XjTLuqF5Z9+3864tcGUAzq5q4o=
X-Google-Smtp-Source: AGHT+IFeEZa5nVv+mtwIu6A9hZNGU86wznbWhD1KnBdApuLwR5PvKTBdXCajk9Qtynkb/fqX/bwRng==
X-Received: by 2002:a17:903:124b:b0:215:98e7:9b1 with SMTP id d9443c01a7336-21d993177a2mr227130405ad.5.1737921622320;
        Sun, 26 Jan 2025 12:00:22 -0800 (PST)
Message-ID: <bb022c56-2ec9-4e76-9bc6-efe2f7272806@linaro.org>
Date: Sun, 26 Jan 2025 12:00:19 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/20] accel/kvm: Remove unused 'system/cpus.h' header in
 kvm-cpus.h
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>, =?UTF-8?Q?Alex_Benn=C3=A9e?=
 <alex.bennee@linaro.org>, kvm@vger.kernel.org, qemu-ppc@nongnu.org,
 qemu-riscv@nongnu.org, David Hildenbrand <david@redhat.com>,
 qemu-s390x@nongnu.org, xen-devel@lists.xenproject.org
References: <20250123234415.59850-1-philmd@linaro.org>
 <20250123234415.59850-7-philmd@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20250123234415.59850-7-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 1/23/25 15:44, Philippe Mathieu-Daudé wrote:
> Missed in commit b86f59c7155 ("accel: replace struct CpusAccel
> with AccelOpsClass") which removed the single CpusAccel use.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   accel/kvm/kvm-cpus.h | 2 --
>   1 file changed, 2 deletions(-)
> 
> diff --git a/accel/kvm/kvm-cpus.h b/accel/kvm/kvm-cpus.h
> index b5435286e42..688511151c8 100644
> --- a/accel/kvm/kvm-cpus.h
> +++ b/accel/kvm/kvm-cpus.h
> @@ -10,8 +10,6 @@
>   #ifndef KVM_CPUS_H
>   #define KVM_CPUS_H
>   
> -#include "system/cpus.h"
> -
>   int kvm_init_vcpu(CPUState *cpu, Error **errp);
>   int kvm_cpu_exec(CPUState *cpu);
>   void kvm_destroy_vcpu(CPUState *cpu);

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

