Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FF2F7EA29A
	for <lists+xen-devel@lfdr.de>; Mon, 13 Nov 2023 19:13:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.631937.985695 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2bQk-0001ip-TP; Mon, 13 Nov 2023 18:13:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 631937.985695; Mon, 13 Nov 2023 18:13:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2bQk-0001gc-Po; Mon, 13 Nov 2023 18:13:02 +0000
Received: by outflank-mailman (input) for mailman id 631937;
 Mon, 13 Nov 2023 18:13:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aZgi=G2=linaro.org=richard.henderson@srs-se1.protection.inumbo.net>)
 id 1r2bQj-0001gT-Qp
 for xen-devel@lists.xenproject.org; Mon, 13 Nov 2023 18:13:01 +0000
Received: from mail-oa1-x35.google.com (mail-oa1-x35.google.com
 [2001:4860:4864:20::35])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 471a33ca-8250-11ee-98db-6d05b1d4d9a1;
 Mon, 13 Nov 2023 19:13:00 +0100 (CET)
Received: by mail-oa1-x35.google.com with SMTP id
 586e51a60fabf-1e993765c1bso3081852fac.3
 for <xen-devel@lists.xenproject.org>; Mon, 13 Nov 2023 10:13:00 -0800 (PST)
Received: from [192.168.0.4] ([71.212.149.95])
 by smtp.gmail.com with ESMTPSA id
 it13-20020a056a00458d00b006b58af8aae3sm4092255pfb.77.2023.11.13.10.12.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Nov 2023 10:12:58 -0800 (PST)
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
X-Inumbo-ID: 471a33ca-8250-11ee-98db-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699899179; x=1700503979; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZBVS57ugFH+dWwwgJQNw/EdC1LQ7A71bAIRGFWgr9qQ=;
        b=J5QhL1+00spDJbFLpO/4S91c89ruapOo2i9gEp5UaITmYXRTfc4eZXdLjJTFH3cXLC
         WaFd0j0W//4QOZGXrnZVzQd2lfIDL8C8kQO1PD32cPd+huuxuZa0yqaB0GG/SWaeztDl
         G+ACrLGZvfwJIL8ETiSaI0na8681WCc40kdD6SH/szfa6Q+/82XgPMoKo+YWuYCQGH26
         E5J5RN/dyv9696UbQK1fCnWmt4zgiblTzoaM5X4yorKiwRoxhFWcqS4GhVLyQDEil6VR
         5w1hEh5+7ShJkE6HXaSmfqWcfRUD7ZLf4V4cuTs1fJ7ImnQwNA374eD6O04qKwp3TBT/
         Kxdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699899179; x=1700503979;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZBVS57ugFH+dWwwgJQNw/EdC1LQ7A71bAIRGFWgr9qQ=;
        b=U+z3Vy4JUhlvPhJOlicQS44Do6VV1Yo4ujrweGFNiNjaoqWa0JvFK42xuBF+LeLiio
         OKXvzlAfMbFjIrVZkdPFcRAjDOB37VDx2HYBgo3DG5YEqffZ+lppJ5ryWsNcYPMdG+yK
         K8DyojDVL5m0NtF3pW7YX5kyfetUKCOpdt2I7Axssosuf7MguV12msSRg1jxuCOSrUts
         Op93W91wRg44GZtS6eBDaIA3elOiDPsWc2Z2lsYC/v3jXOq6T1uoidtzHNcsQHNL87Tn
         g7mnGmBJIbDnRVkrKiscUsIi2glPPsTHOEavweWcB2FU6TEYjSIuT9RsDkxbJjFP1QYY
         OhMA==
X-Gm-Message-State: AOJu0Yx80sulr5WgwxUeV31gRUTVE0kracQg38ZOUtZ9DjG2TZziuS6V
	v7A7ATguXhvmv2RP1XG4gQKg7Q==
X-Google-Smtp-Source: AGHT+IHouUBCiMX9KBY+uYOICqzQx66TRgfPBXn9EutFo+KHFLUOx3FPF3CRi5Kl+BGT8JiIk0Cxfw==
X-Received: by 2002:a05:6870:3045:b0:1ef:c944:222b with SMTP id u5-20020a056870304500b001efc944222bmr9441610oau.11.1699899179250;
        Mon, 13 Nov 2023 10:12:59 -0800 (PST)
Message-ID: <1c57d09a-14ab-4dc3-bc23-31e1ac906f82@linaro.org>
Date: Mon, 13 Nov 2023 10:12:56 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH-for-9.0 02/10] hw/xen/xen_arch_hvm: Rename prototypes
 using 'xen_arch_' prefix
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 David Woodhouse <dwmw@amazon.co.uk>, qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Stefano Stabellini <sstabellini@kernel.org>, qemu-block@nongnu.org,
 Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-arm@nongnu.org, Paul Durrant <paul@xen.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
References: <20231113152114.47916-1-philmd@linaro.org>
 <20231113152114.47916-3-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20231113152114.47916-3-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/13/23 07:21, Philippe Mathieu-Daudé wrote:
> Use a common 'xen_arch_' prefix for architecture-specific functions.
> Rename xen_arch_set_memory() and xen_arch_handle_ioreq().
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   include/hw/arm/xen_arch_hvm.h  | 4 ++--
>   include/hw/i386/xen_arch_hvm.h | 4 ++--
>   hw/arm/xen_arm.c               | 4 ++--
>   hw/i386/xen/xen-hvm.c          | 6 +++---
>   hw/xen/xen-hvm-common.c        | 4 ++--
>   5 files changed, 11 insertions(+), 11 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

