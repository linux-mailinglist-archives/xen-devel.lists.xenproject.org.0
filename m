Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 92ED872D524
	for <lists+xen-devel@lfdr.de>; Tue, 13 Jun 2023 01:46:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.547679.855247 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q8rEj-0002w3-8V; Mon, 12 Jun 2023 23:46:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 547679.855247; Mon, 12 Jun 2023 23:46:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q8rEj-0002ty-5K; Mon, 12 Jun 2023 23:46:13 +0000
Received: by outflank-mailman (input) for mailman id 547679;
 Mon, 12 Jun 2023 23:46:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fZSN=CA=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1q8rEh-0002qb-RN
 for xen-devel@lists.xenproject.org; Mon, 12 Jun 2023 23:46:11 +0000
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [2a00:1450:4864:20::534])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4abeafe5-097b-11ee-8611-37d641c3527e;
 Tue, 13 Jun 2023 01:46:03 +0200 (CEST)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-510d6b939bfso8562990a12.0
 for <xen-devel@lists.xenproject.org>; Mon, 12 Jun 2023 16:46:03 -0700 (PDT)
Received: from [10.10.0.115] ([185.140.244.249])
 by smtp.gmail.com with ESMTPSA id
 x22-20020aa7cd96000000b0050bca43ff55sm5689515edv.68.2023.06.12.16.46.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Jun 2023 16:46:02 -0700 (PDT)
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
X-Inumbo-ID: 4abeafe5-097b-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686613563; x=1689205563;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8wbDZKmo9VP00ABKYaLGQ28GM2QOo4QwYdlCxLvFQV0=;
        b=xTqZLje4stFH7gdg9tw2fGuaNoAlSVyZ9bZDgTUiGpVn1rKnmnRRB/wOdsBKdk3M45
         XyM6zqrGB41V6amFO878oAEpaEipM+J+IhZ6OUQnO6vb96iOf43xb+cTOPWDW6SPGUvU
         wbzhN3iKgf+ErheqSRMoxFxfGjuBsXPFyA9Nf8eealnhw6j5dxAexUg8TC0HYjPKNm9+
         cmH1X+muu7EXkJdtUp+5TMYcw4rbxC4VhQQvi+yG5WIIqUjSEFDaY+a9WqK4wgXHrhfU
         58f1vI8ofPwecC+2UBaX1dI7mOlCr37zZFNYbepf9z+FBvhotWk1bkOhqbtAhvfg0arh
         BtYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686613563; x=1689205563;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8wbDZKmo9VP00ABKYaLGQ28GM2QOo4QwYdlCxLvFQV0=;
        b=JcZ7C/eiiuPiPMwIIyg3zDtegWXaSwqRN4NjxIDFDCOfkZHmwdyQ1ry+91x5Xt5F8v
         Q5vgYN+tzL59VRRNv22z0h+pd5iZNcONTZoyfFlAD86iIbb7j71abACATdSurbHH5NfG
         iTeNu8Fh3CW73lHxum8hi4Y05KwQ+1UEOgv99pzH57TdoBNJJC+3WqVogz+sPVaZ1sAP
         QMEzXZWABjc3Z8HbMkLcInQhiU0JGYvrOFiuEpFwhjXUtRwHS/oOtljEBU9B77pS4WeB
         Qe818te3WmfY101oE5Kq+EuExK4h/vQQvufYf62gsBiCuNjdHZFwe30sd+c6GpxXo8xy
         923A==
X-Gm-Message-State: AC+VfDwFcdUAtv5lWMbWAkoibC60YlIPIw85Q7ZTlBqcuUIWLig1xmGa
	4IA3xFqZUwFe+oRUEuLzhrgE0A==
X-Google-Smtp-Source: ACHHUZ5ctYtCeisGQ2uomlCypPix/oMuhk7GCBAQ91QMqgz33FoH6mnEV6NDszFqNC1dju2nqgRtMA==
X-Received: by 2002:a05:6402:898:b0:514:77f5:d77c with SMTP id e24-20020a056402089800b0051477f5d77cmr6507743edy.1.1686613563154;
        Mon, 12 Jun 2023 16:46:03 -0700 (PDT)
Message-ID: <a242cbd8-3ae5-62b0-fbb8-92a51dd7bc18@linaro.org>
Date: Tue, 13 Jun 2023 01:46:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.11.2
Subject: Re: [patch V4 07/37] x86/smpboot: Restrict soft_restart_cpu() to SEV
Content-Language: en-US
To: Thomas Gleixner <tglx@linutronix.de>, LKML <linux-kernel@vger.kernel.org>
Cc: x86@kernel.org, David Woodhouse <dwmw2@infradead.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Brian Gerst <brgerst@gmail.com>,
 Arjan van de Veen <arjan@linux.intel.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Paul McKenney <paulmck@kernel.org>,
 Tom Lendacky <thomas.lendacky@amd.com>,
 Sean Christopherson <seanjc@google.com>,
 Oleksandr Natalenko <oleksandr@natalenko.name>,
 Paul Menzel <pmenzel@molgen.mpg.de>,
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
 Piotr Gorski <lucjan.lucjanov@gmail.com>,
 Usama Arif <usama.arif@bytedance.com>, Juergen Gross <jgross@suse.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 xen-devel@lists.xenproject.org, Russell King <linux@armlinux.org.uk>,
 Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Guo Ren <guoren@kernel.org>, linux-csky@vger.kernel.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-mips@vger.kernel.org,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, linux-riscv@lists.infradead.org,
 Mark Rutland <mark.rutland@arm.com>, Sabin Rapan <sabrapan@amazon.com>,
 "Michael Kelley (LINUX)" <mikelley@microsoft.com>,
 Ross Philipson <ross.philipson@oracle.com>
References: <20230512203426.452963764@linutronix.de>
 <20230512205255.822234014@linutronix.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230512205255.822234014@linutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 12/5/23 23:07, Thomas Gleixner wrote:
> From: Thomas Gleixner <tglx@linutronix.de>
> 
> Now that the CPU0 hotplug cruft is gone, the only user is AMD SEV.
> 
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> Tested-by: Michael Kelley <mikelley@microsoft.com>
> ---
>   arch/x86/kernel/callthunks.c |    2 +-
>   arch/x86/kernel/head_32.S    |   14 --------------
>   arch/x86/kernel/head_64.S    |    2 +-
>   3 files changed, 2 insertions(+), 16 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


