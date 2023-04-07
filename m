Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DDF756DB6EE
	for <lists+xen-devel@lfdr.de>; Sat,  8 Apr 2023 01:11:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.519146.806385 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pkvEX-0003qo-VE; Fri, 07 Apr 2023 23:11:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 519146.806385; Fri, 07 Apr 2023 23:11:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pkvEX-0003nf-RR; Fri, 07 Apr 2023 23:11:05 +0000
Received: by outflank-mailman (input) for mailman id 519146;
 Fri, 07 Apr 2023 23:11:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2dUW=76=linaro.org=richard.henderson@srs-se1.protection.inumbo.net>)
 id 1pkvEW-0003nU-P6
 for xen-devel@lists.xenproject.org; Fri, 07 Apr 2023 23:11:04 +0000
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [2607:f8b0:4864:20::636])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 77979410-d599-11ed-85db-49a42c6b2330;
 Sat, 08 Apr 2023 01:11:04 +0200 (CEST)
Received: by mail-pl1-x636.google.com with SMTP id p8so184862plk.9
 for <xen-devel@lists.xenproject.org>; Fri, 07 Apr 2023 16:11:04 -0700 (PDT)
Received: from ?IPV6:2602:ae:1541:f901:8bb4:5a9d:7ab7:b4b8?
 ([2602:ae:1541:f901:8bb4:5a9d:7ab7:b4b8])
 by smtp.gmail.com with ESMTPSA id
 ik23-20020a170902ab1700b001967580f60fsm3360481plb.260.2023.04.07.16.11.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Apr 2023 16:11:02 -0700 (PDT)
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
X-Inumbo-ID: 77979410-d599-11ed-85db-49a42c6b2330
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680909062;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+8sjrQkKmFa0fDEbK0ByEbj8xRVyyoXwt3mONWUrCjg=;
        b=fu0fc9kQ3M2sfVtK3t68zTbYFucNlj5oFSUSteqUYRu6VDv3uTItwTOkzCaPFNHOei
         Df/jKMmHFnnEBVa21r/eZ50XSQaDi0Hdouvc5bo4bnXn3NaTSvMg4uk2qfa5HE0KEHPK
         G/hnmvZSmlnUfmxSrzAzCG2somHL6hF+eFvhEfvqMO4TRTM4MdDjEbP4M3dgQLLmAJUt
         NQ70V3GEiNeBy6LgXX+ZifscCDpUsnjTSs3RYovPOLuMKgkROChad5HQjq9TyjzVOy/W
         ikj4D19qkBrRoB4IJxSKljZsM9kEwp6vq/D91lh+Kurhgan8M73NHLiK5l1wy/jRVm4c
         8CpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680909062;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+8sjrQkKmFa0fDEbK0ByEbj8xRVyyoXwt3mONWUrCjg=;
        b=4H6Y7kdbGPpD+gmoFNrjvHAumoTzlCcxscceakYxWRHVoG2uTPFocs0S1hzoeTlamv
         axA/ZL2nt0rvlCxfto1/wdEFtxVTF6/flH+o22ChOPxyd8zWlYyrClfp7inXy5jOvhm6
         h2PAMKNlIyMF9u7ocxn1gwPd1E54B9ZcvFWLFui809/ZxjNzcveBl+SYOWHnhZZdUz84
         v9miEQs7JqjtH0Hi4SoRIDkpFyUBjAFBIAdD6uoeFfAB20glm1w1AJ6QS+X0M50uJ4Dq
         6I973CApWEZS62GrGoFDFRU0Hq/fbJ7GyjXV1lJgvYdKjqn0Yw0umXODALgYUTUPx1+H
         VkUQ==
X-Gm-Message-State: AAQBX9cphCe+e4Fx6f3T5Dd9T6Mvzh4iqB7cQwALVzY6TkFkYCCIIyey
	b4cJ+5AiW5zoHTPfq0W/aaxG8g==
X-Google-Smtp-Source: AKy350Z01RjDdvFrn3SDcNSR06u3kONrO463lNJW2mYVi5QEQlyqB2hcRXm9iVwIpLBrSzeEsGCq9A==
X-Received: by 2002:a17:903:3093:b0:1a2:ca:c6cd with SMTP id u19-20020a170903309300b001a200cac6cdmr3648934plc.43.1680909062629;
        Fri, 07 Apr 2023 16:11:02 -0700 (PDT)
Message-ID: <e37bd0f9-b577-dbf4-6d34-a17a9d5cfbaf@linaro.org>
Date: Fri, 7 Apr 2023 16:11:00 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 10/14] accel: Rename NVMM struct qemu_vcpu -> struct
 AccelvCPUState
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, xen-devel@lists.xenproject.org,
 kvm@vger.kernel.org, Reinoud Zandijk <reinoud@netbsd.org>
References: <20230405101811.76663-1-philmd@linaro.org>
 <20230405101811.76663-11-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230405101811.76663-11-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 4/5/23 03:18, Philippe Mathieu-Daudé wrote:
> -    struct qemu_vcpu *qcpu = get_qemu_vcpu(cpu);
> +    struct AccelvCPUState *qcpu = get_qemu_vcpu(cpu);

With the typedef in hw/core/cpu.h, you can drop the 'struct' at the same time.

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

> -    qcpu = g_try_malloc0(sizeof(*qcpu));
> +    qcpu = g_try_new0(struct AccelvCPUState, 1);

Another 'try' to clean up.  :-)


r~

