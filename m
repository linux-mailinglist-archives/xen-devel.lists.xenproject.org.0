Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B51273FF64
	for <lists+xen-devel@lfdr.de>; Tue, 27 Jun 2023 17:14:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.556179.868490 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qEAOP-0007Fm-7N; Tue, 27 Jun 2023 15:14:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 556179.868490; Tue, 27 Jun 2023 15:14:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qEAOP-0007DT-3t; Tue, 27 Jun 2023 15:14:09 +0000
Received: by outflank-mailman (input) for mailman id 556179;
 Tue, 27 Jun 2023 15:14:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9jY1=CP=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1qEAON-0007DN-Hu
 for xen-devel@lists.xenproject.org; Tue, 27 Jun 2023 15:14:07 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4010309b-14fd-11ee-b237-6b7b168915f2;
 Tue, 27 Jun 2023 17:14:05 +0200 (CEST)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-98e109525d6so568192066b.0
 for <xen-devel@lists.xenproject.org>; Tue, 27 Jun 2023 08:14:03 -0700 (PDT)
Received: from [192.168.69.115] ([176.187.199.204])
 by smtp.gmail.com with ESMTPSA id
 ss26-20020a170907039a00b0098e422d6758sm3262608ejb.219.2023.06.27.08.14.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Jun 2023 08:14:02 -0700 (PDT)
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
X-Inumbo-ID: 4010309b-14fd-11ee-b237-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687878842; x=1690470842;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1hLkHKgBAbZUuk0W8oE9AqIRXF820+oX61/uVYQAwns=;
        b=RHSJC9x8UfCPz2FSbqOh2Ao54TcsCXhLbDK36yeB1DEJ4hj8Sl//hI37GaNYUgS+fs
         y4GXgRTnzQOM1uZVi38YmTqIyNo79pOMoci/EMI21MPW3l/lqt4OWFxhD0crUv1+Jlb9
         HAOtsR6oW56BaUJI4kAcsAxbPwP1gziEWSlXXCLlw13fsJZ46+EXCC7yWYT+y9jAT4m2
         e37yJcRCJEf80dlpoCKw2ihRR+G97nQEWmYOKSl3kIWFhrwA65/8u/9cIRWyQlcvD9VH
         FtltpgqEHEOcfVtyLsREChlxiSDkV4CjXzltjoOAxfty5o4YqGw18zEI/gJw6anC6zz4
         g8oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687878842; x=1690470842;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1hLkHKgBAbZUuk0W8oE9AqIRXF820+oX61/uVYQAwns=;
        b=NTFKtYs2dumhFtMqGhuPljCOG0s+Xxgb7PagAy1Xs3Ai2BvzKCOdwoPHhRPfqMrsj/
         kyYvIP0+9ODslZgceXN10f2Zzs8nQLPDma1x/DAtMd+zEbKJTDzsCWE+qZIQcT5VrHEy
         3hNIyajznenGK1qdpWDb5lm/CRvgvWIz1DPbfODfnbjbN8OnQVMszmurT8R1OH6DZwRv
         FUkeIcq/1ItYPeJY1vDWmXgeqnuh5kGAfId/V76dcp/4V0ZcN8Ak6eG17j48QvPhnfJF
         A1F8GLVmYUkQRf2KGeGi/4FPwHR6n6cB2FXidJZGYsSHuHBLUuHE5PoL7Exq9AvvEDbp
         xLFg==
X-Gm-Message-State: AC+VfDwB0NG8LI8ojQjnCRWQQrOnDJe0ytbuGOyMHiTO8rdq7k8GylIG
	Z9Mr6tLZknvPZgWFeykbiWB3BA==
X-Google-Smtp-Source: ACHHUZ4N32hEou6vtUW/NAB1itCDeEMec+9QDxvX9fKtvB6/ovOV17I4ogYzFcIiFUizKhcJXoAQ3g==
X-Received: by 2002:a17:907:3f87:b0:977:d660:c5aa with SMTP id hr7-20020a1709073f8700b00977d660c5aamr30961510ejc.31.1687878842634;
        Tue, 27 Jun 2023 08:14:02 -0700 (PDT)
Message-ID: <dcf96b9e-16c5-b1d5-14a5-276fc0556bee@linaro.org>
Date: Tue, 27 Jun 2023 17:13:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH v3 00/16] accel: Share CPUState accel context
 (HAX/NVMM/WHPX/HVF)
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
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230624174121.11508-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 24/6/23 19:41, Philippe Mathieu-Daudé wrote:
> This series is part of the single binary effort.
> 
> All accelerator will share their per-vCPU context in
> an opaque 'accel' pointer within the CPUState.
> 
> First handle HAX/NVMM/WHPX/HVF. KVM and TCG will follow
> as two different (bigger) follow-up series.
> 
> Except HVF/intel, all has been (cross-)build tested.
> 
> I plan to send the PR myself.
> 
> Since v2:
> - Addressed rth's review comments
> - Added rth's R-b tag
> 
> Since v1:
> - Addressed rth's review comments
> - Added rth's R-b tag
> - Converted HVF intel (untested)
> - Rebased
> 
> Philippe Mathieu-Daudé (16):
>    MAINTAINERS: Update Roman Bolshakov email address
>    accel: Document generic accelerator headers
>    accel: Remove unused hThread variable on TCG/WHPX
>    accel: Fix a leak on Windows HAX
>    accel: Destroy HAX vCPU threads once done
>    accel: Rename 'hax_vcpu' as 'accel' in CPUState
>    accel: Rename HAX 'struct hax_vcpu_state' -> AccelCPUState
>    accel: Move HAX hThread to accelerator context
>    accel: Remove NVMM unreachable error path
>    accel: Rename NVMM 'struct qemu_vcpu' -> AccelCPUState
>    accel: Inline NVMM get_qemu_vcpu()
>    accel: Remove WHPX unreachable error path
>    accel: Rename WHPX 'struct whpx_vcpu' -> AccelCPUState
>    accel: Inline WHPX get_whpx_vcpu()
>    accel: Rename 'cpu_state' -> 'cs'
>    accel: Rename HVF 'struct hvf_vcpu_state' -> AccelCPUState

Except the MAINTAINERS patch, all the rest is reviewed, so I plan
to send a PR tomorrow (dropping the first patch, nobody complained
about Roman email bouncing for months so we can keep ignoring the
automated emails).

