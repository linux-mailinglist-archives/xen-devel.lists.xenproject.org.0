Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AE744873D15
	for <lists+xen-devel@lfdr.de>; Wed,  6 Mar 2024 18:15:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.689419.1074365 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rhur6-00084L-IH; Wed, 06 Mar 2024 17:15:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 689419.1074365; Wed, 06 Mar 2024 17:15:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rhur6-00081R-FW; Wed, 06 Mar 2024 17:15:00 +0000
Received: by outflank-mailman (input) for mailman id 689419;
 Wed, 06 Mar 2024 17:14:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9guM=KM=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1rhur4-00081L-Ge
 for xen-devel@lists.xenproject.org; Wed, 06 Mar 2024 17:14:58 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0dfcfe0f-dbdd-11ee-a1ee-f123f15fe8a2;
 Wed, 06 Mar 2024 18:14:56 +0100 (CET)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-a293f2280c7so2755666b.1
 for <xen-devel@lists.xenproject.org>; Wed, 06 Mar 2024 09:14:56 -0800 (PST)
Received: from [192.168.69.100] (vau06-h02-176-184-43-100.dsl.sta.abo.bbox.fr.
 [176.184.43.100]) by smtp.gmail.com with ESMTPSA id
 m26-20020a17090607da00b00a441ff174a3sm7372337ejc.90.2024.03.06.09.14.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Mar 2024 09:14:55 -0800 (PST)
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
X-Inumbo-ID: 0dfcfe0f-dbdd-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709745296; x=1710350096; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XjsyNthJQ6LEz6SX9rxTBbqUR1TTwhwhwoVKkXhpUAw=;
        b=E9NNxDZ5lE3kZLG7sekTYtw+9442Fex4Esv+GCbSLxposYVYgnULzLGMZoLJUQTONC
         gBj3otcl75DXus59OV2jEW9CSYjbcxmRDdJTZVwspgG6A/yC1Jg9BIylNXzLf89GUbEk
         KQ+wFFDagSVFmXQXKTF6dUwbv3xvvEFi9PVih1OaXF5pIbppwBLLp7ZkfKe+7sXNDzEs
         4EAMw/WZgpJ55vfcwhhalZtc9aCmKmMX6AKZDJ2OMCv0prENBCZ/S8f0NTNeK2DQNM1j
         oCQjWUHo/b+7XqmFq1etfJ/3venrYULFgvSmPDOv7WpZiwl9Dg3GM8NxcQnLaUIVLxYD
         FEhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709745296; x=1710350096;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XjsyNthJQ6LEz6SX9rxTBbqUR1TTwhwhwoVKkXhpUAw=;
        b=np/Ba06Q1t1FB4xs1wcLu7Bh+zayenPazkF93xUTBbZGhtDkHZ4gSOtfqDmcPHRv7I
         9yNFpRiF0395aS7snH2B6vH80+AYJ+VC5NRx34je1ocxF0hBsHLtocGlGPc2gWxd4iJx
         4DAe7eIkTQXkn56e6QXh06ik39GDIt/88Sk/zOvxZrqmLa+U6pGZdw+I/RCHssCZXJuN
         P9QzAAyuM/Ycs0nEDytQQGApHHYRRQNWkIc1Ec4JFtjT2MDzUTW+8Kf94b4/sR28rh9j
         dJMvfoO/EJwP7sFKJvPhDJMzOoaZEd2OskNK8e/I6ITCdR/bKyR8MGy0tclJ/LpYE4sW
         iehQ==
X-Forwarded-Encrypted: i=1; AJvYcCUz/fn2Ts+3ZbGND2tmGnw2c68Pg39lDHQAwFXogSKyPZI672rAEnb5+c1CAvwzpaZkZSG4jkXhKA9i9ArRtEi94E6GgcoCEkPxfqJTdiQ=
X-Gm-Message-State: AOJu0YyfzSqXAUgjbTq5mgZghbg2lgrdzj23ATv2IrXqBHW0hspy8vBd
	IPWlngQWHAdijheDYaRExHaudxMxC+VTEqbzM6T5T+VWUO48pAFusKsBaguHRGY=
X-Google-Smtp-Source: AGHT+IEzDMCAv1jmeGC0ooiGaix7vjr0dWNnW+e2K3+cHwRyHziRS4ipyA3ZMUpeB9SviZ5lAMKGMA==
X-Received: by 2002:a17:906:b154:b0:a45:da1:9375 with SMTP id bt20-20020a170906b15400b00a450da19375mr7102659ejb.30.1709745295992;
        Wed, 06 Mar 2024 09:14:55 -0800 (PST)
Message-ID: <68c4a4ad-cc49-4917-b1d6-d0f28b611c05@linaro.org>
Date: Wed, 6 Mar 2024 18:14:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH-for-9.0 v2 10/19] hw/xen: Rename 'ram_memory' global
 variable as 'xen_memory'
Content-Language: en-US
To: David Woodhouse <dwmw2@infradead.org>, David Woodhouse
 <dwmw@amazon.co.uk>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paul Durrant <paul@xen.org>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 xen-devel@lists.xenproject.org, qemu-block@nongnu.org,
 Anthony Perard <anthony.perard@citrix.com>, kvm@vger.kernel.org,
 Thomas Huth <thuth@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, "Michael S. Tsirkin"
 <mst@redhat.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
References: <20231114143816.71079-1-philmd@linaro.org>
 <20231114143816.71079-11-philmd@linaro.org>
 <84F1C2D8-4963-4815-8079-B44081234D41@infradead.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <84F1C2D8-4963-4815-8079-B44081234D41@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 14/11/23 16:49, David Woodhouse wrote:
> On 14 November 2023 09:38:06 GMT-05:00, "Philippe Mathieu-Daudé" <philmd@linaro.org> wrote:
>> To avoid a potential global variable shadow in
>> hw/i386/pc_piix.c::pc_init1(), rename Xen's
>> "ram_memory" as "xen_memory".
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> 
> Well OK, but aren't you going to be coming back later to eliminate global variables which are actually per-VM?
> 
> Or is that the point, because *then* the conflicting name will actually matter?

Eh I wasn't thinking about running 2 Xen VMs in the same QEMU process,
but this is a good test case. I was thinking of running a Xen guest VM
and another TCG VM in the same process.

So IIUC xen_memory should be part of PCMachineState.

> 
> Reviewed-by: David Woodhouse <dwmw@amazon.co.uk>

Thanks!


