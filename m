Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7067FABDC5D
	for <lists+xen-devel@lfdr.de>; Tue, 20 May 2025 16:23:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.990798.1374718 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHNsI-0004md-2H; Tue, 20 May 2025 14:23:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 990798.1374718; Tue, 20 May 2025 14:23:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHNsH-0004jW-VO; Tue, 20 May 2025 14:23:21 +0000
Received: by outflank-mailman (input) for mailman id 990798;
 Tue, 20 May 2025 14:23:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=PJhk=YE=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uHNsH-0004jQ-9U
 for xen-devel@lists.xenproject.org; Tue, 20 May 2025 14:23:21 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fa06f145-3585-11f0-b892-0df219b8e170;
 Tue, 20 May 2025 16:23:19 +0200 (CEST)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-ad56cbc7b07so329754066b.0
 for <xen-devel@lists.xenproject.org>; Tue, 20 May 2025 07:23:19 -0700 (PDT)
Received: from [10.1.248.227] ([80.188.125.198])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6005a6e6371sm7398914a12.40.2025.05.20.07.23.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 May 2025 07:23:18 -0700 (PDT)
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
X-Inumbo-ID: fa06f145-3585-11f0-b892-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1747750998; x=1748355798; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=s9jXamqxmpepEYCOpcWsD9OoOtGJnaKzn6cFUix2AbI=;
        b=Dx76K8rA9zwhmeIv2sjRWhXxs3aNkf4pbwpKqpvPN+PSvnad6fpAxpbg6AFyIS6zp4
         2CoJfcaTeLE+P86jamphlhoRGFLw/pnSawgklEmtAbDrijJDfjprXsjz5yTqvq1gcK2F
         TU1sxloKvr+TG2rCKKo6JcRHYely8jycvr1V78RN5duZfUzEXAyCDIeu6QHGRhSE/Aif
         7F1gjIwED2rPHPS6plkCSQaqr/pTU7sDKPtdo8/XmqVcKQlyPMy0OxUPyrt4/AH1O5QV
         n6Q6PJx+R1Lf0cPh2OWPOSId1e92VgV0twq4kIOlcvT/sjrFfkO2jNofjKxu7rFdpWhP
         ErCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747750998; x=1748355798;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=s9jXamqxmpepEYCOpcWsD9OoOtGJnaKzn6cFUix2AbI=;
        b=YmYu50LhiKjc59cVeqnPE9BgAXHLDPe0BjjL7MIB5u3x5uWqEJPyL4zwwGhagviKxp
         ckyWtjwJXL/7vUVfhNl+Ym09bNe+kThjT5VDcmfYAhivS8zDxnbAKkTLTTQCQZs2zx0C
         uTamFJ9lIgRz5VCUncSyHNP90qVMKMvCuXPTlZbTv+nZ3Ujy39VMvGllWuh8nwyzHHzc
         9u8Mz1G24Ieucq99Gsc4swD9NFN6dPtKy32o8qLrhV4TCTh11gqBaYZWRBozraaNxuwD
         I6CGicYFTa1HJZU0AvaSYQVkN6ROTKPmXr3aiaoqJNSxASNloAIwWJLIrxmM4X01oPV3
         gviQ==
X-Forwarded-Encrypted: i=1; AJvYcCW1sKMGHCCHCGy+Tf46wBkIr+2vIVkroHRhdI1v/ic3Ou0ku2DBlrknyiZZJJ33W92tWuUIHMrqWm8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzgZilrMFFMy/Z9orh3R5oEmhEmzRMTJLx8XkkJoqtD+6IBaWZY
	JHGIUoWAeQoAWrhYIxKWjSWPWu7X6KHmOOMDATpzKm3u1WS9MLkh49O3vNp3W+KsZQ==
X-Gm-Gg: ASbGnctvMfP7QWBObiul0LIEv1955dFGnIqp4/2eD1KZqv9EE/odQpfxscozNjy8eiN
	w4uqgyoi9zCK56SzY0T8Z5uEk5yVA91kZLLXep8gG7MDU/NXN0FQtnEBNGJuiD9nKEdTbPkiJYH
	mTG67+FVwfsU4kqZ0fIpzN9Q2x1WIz88uCUvIZk/XNtaxNfa8QS3Z2jgWOUUvIc7G7d+ycX+Qpq
	6u+fyOwdMSRrFeMXQvOThg1GgFYuq3nw89uiSDV34zalTWjmwdVeEZ4K6dwcz8v4xqadPJJeaV4
	QXVuheZIO0Etnaxidcjv1msNgAi+ZIbTdlvBHrK5aT5wCsCwRASIwqVZAVowOw==
X-Google-Smtp-Source: AGHT+IGqTQ1I5Wiepc3G2SUpemeJvIKY+jLjtM7GYUWZPjUlPBJCwsU+HVupWR4bHXNIoeZByV7mSQ==
X-Received: by 2002:a17:907:d8b:b0:ad5:719d:3e88 with SMTP id a640c23a62f3a-ad5719d5958mr710813866b.44.1747750998576;
        Tue, 20 May 2025 07:23:18 -0700 (PDT)
Message-ID: <726c5069-2136-403a-910b-de003129b198@suse.com>
Date: Tue, 20 May 2025 16:23:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] Add lockdown mode
To: Kevin Lampis <kevin.lampis@cloud.com>
Cc: Ross Lagerwall <ross.lagerwall@citrix.com>, xen-devel@lists.xenproject.org
References: <20250512195628.1728455-3-kevin.lampis@cloud.com>
 <20250520115716.706100-1-kevin.lampis@cloud.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20250520115716.706100-1-kevin.lampis@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 20.05.2025 13:57, Kevin Lampis wrote:
> From: Ross Lagerwall <ross.lagerwall@citrix.com>
> 
> The intention of lockdown mode is to prevent attacks from a rogue dom0
> userspace from compromising the system. Lockdown mode can be controlled by a
> Kconfig option and a command-line parameter. It is also enabled automatically
> when Secure Boot is enabled and it cannot be disabled in that case.
> 
> If enabled from the command-line then it is required to be first in the
> list otherwise Xen may process some insecure parameters before reaching
> the lockdown parameter.
> 
> Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
> Signed-off-by: Kevin Lampis <kevin.lampis@cloud.com>
> ---
> Changes in v2:
> - Remove custom command line parsing
> - Print warning if lockdown is not first on command line

No comments on the patch itself (yet), just a formal remark: I was puzzled
by having only v2 2/3 and 3/3 in my inbox. Looks like you sent each as
reply on the v1 sub-threads. Very occasionally for a larger series it may
be okay to send just a single update that way. Here, however, please re-
send as a full, standalone v2 series.

Jan

