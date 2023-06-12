Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 402B872D532
	for <lists+xen-devel@lfdr.de>; Tue, 13 Jun 2023 01:49:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.547691.855258 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q8rHs-0003gn-NE; Mon, 12 Jun 2023 23:49:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 547691.855258; Mon, 12 Jun 2023 23:49:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q8rHs-0003e9-KQ; Mon, 12 Jun 2023 23:49:28 +0000
Received: by outflank-mailman (input) for mailman id 547691;
 Mon, 12 Jun 2023 23:49:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fZSN=CA=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1q8rHr-0003e3-2y
 for xen-devel@lists.xenproject.org; Mon, 12 Jun 2023 23:49:27 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c38e1df5-097b-11ee-b232-6b7b168915f2;
 Tue, 13 Jun 2023 01:49:26 +0200 (CEST)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-98220bb31c6so210333066b.3
 for <xen-devel@lists.xenproject.org>; Mon, 12 Jun 2023 16:49:26 -0700 (PDT)
Received: from [10.10.0.115] ([185.140.244.249])
 by smtp.gmail.com with ESMTPSA id
 g20-20020aa7c854000000b005169cd0edffsm5568532edt.35.2023.06.12.16.49.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Jun 2023 16:49:25 -0700 (PDT)
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
X-Inumbo-ID: c38e1df5-097b-11ee-b232-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686613766; x=1689205766;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KdDi50ZcI/FLwaJCGeRMVNgmMDqblajVGcvGtWq/rU0=;
        b=h14Y/off+2kKH+CZ9xuEqnth8dkIR68MU6fTRlm6+a1ccdcM0M0IsU1vvHNgsK8p2Y
         0C3NyMHNpdoVINJwXJ2UsLvgZ4NTbFLvy78i26qPyTkArpsvqQO8P3rqJaQrm8rGzPXS
         b21ZAicO32Ry1R7mkMJ6NNUImtgdcpa22tAe3I7ZxvHegVAwZ0w/UvF0S48EVuSzeqn9
         b3JjK1ZAX8STmHG870Zb54I4LTDZcNLOHVNCHnZhE6ryjThlXIgkPKnQSaTbHbmt0aPo
         YIMzeRPPStNBrG12bFe/IsSOLZJnGkaCG+swAqxSi4tHTnfqr5byW4FG9+MbQBtCjN2v
         e6sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686613766; x=1689205766;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KdDi50ZcI/FLwaJCGeRMVNgmMDqblajVGcvGtWq/rU0=;
        b=lLwkQ439Ewi1SWlKSHUeGexRGQZmTTUWhfeIvYmwuIOci0rnezXIqhY5dP3ZZ4N+RG
         9i3g817uWJj3KInJHYkDcCgsgFhlioVYzOrvfnkSLXg33scCQrSj0KuhxunRwg0Zq1ew
         dj1C3p3zazzGEhReNQ01lrSVzTwyewC5SU9yH8oy9dA3Bw36MCEFz2ycWkX3AGZ5W1AM
         bwRnyKy5DbO7BHXcN1qOS6Aj+2Do1qDtRY00AGlMDptY9ZWTNAfKGVsjqhPGXBAGs/hE
         +rMWcMaIUowgsd9lgsjGFCGHGN7oSIDS5bWjZF6bK9RL07BSOV9INPzmsF9AVXKGxvuo
         ZlzA==
X-Gm-Message-State: AC+VfDznsKbX3qMyLQjnib2rR8MYbpwW6pW1jX8DxeJcjE/h4JKcz+Qs
	z2qyXO6HF/hdcLJEwxMkC2u5kg==
X-Google-Smtp-Source: ACHHUZ5d+tF+AAPixk/kFmtV+CtWpDVmOxGFS7Q1zOS4cdYHHVXnx1KgJdGHPbzDoYU+p/rh+kAXUw==
X-Received: by 2002:a17:907:7207:b0:978:9e92:f903 with SMTP id dr7-20020a170907720700b009789e92f903mr11221800ejc.46.1686613765790;
        Mon, 12 Jun 2023 16:49:25 -0700 (PDT)
Message-ID: <94b05905-df3a-4534-a28c-fe9e3030fc4a@linaro.org>
Date: Tue, 13 Jun 2023 01:49:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.11.2
Subject: Re: [patch V4 10/37] x86/smpboot: Get rid of cpu_init_secondary()
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
 <20230512205255.981999763@linutronix.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230512205255.981999763@linutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 12/5/23 23:07, Thomas Gleixner wrote:
> From: Thomas Gleixner <tglx@linutronix.de>
> 
> The synchronization of the AP with the control CPU is a SMP boot problem
> and has nothing to do with cpu_init().
> 
> Open code cpu_init_secondary() in start_secondary() and move
> wait_for_master_cpu() into the SMP boot code.
> 
> No functional change.
> 
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> Tested-by: Michael Kelley <mikelley@microsoft.com>
> ---
>   arch/x86/include/asm/processor.h |    1 -
>   arch/x86/kernel/cpu/common.c     |   27 ---------------------------
>   arch/x86/kernel/smpboot.c        |   24 +++++++++++++++++++-----
>   3 files changed, 19 insertions(+), 33 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


