Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B1F872D525
	for <lists+xen-devel@lfdr.de>; Tue, 13 Jun 2023 01:46:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.547677.855238 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q8rEK-0002Wb-SU; Mon, 12 Jun 2023 23:45:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 547677.855238; Mon, 12 Jun 2023 23:45:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q8rEK-0002TG-PB; Mon, 12 Jun 2023 23:45:48 +0000
Received: by outflank-mailman (input) for mailman id 547677;
 Mon, 12 Jun 2023 23:45:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fZSN=CA=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1q8rEJ-0002TA-KW
 for xen-devel@lists.xenproject.org; Mon, 12 Jun 2023 23:45:47 +0000
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [2a00:1450:4864:20::52d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3fecc094-097b-11ee-b232-6b7b168915f2;
 Tue, 13 Jun 2023 01:45:45 +0200 (CEST)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-5151934a4e3so7284634a12.1
 for <xen-devel@lists.xenproject.org>; Mon, 12 Jun 2023 16:45:45 -0700 (PDT)
Received: from [10.10.0.115] ([185.140.244.249])
 by smtp.gmail.com with ESMTPSA id
 h18-20020a1709063b5200b0097457363fc0sm5849378ejf.33.2023.06.12.16.45.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Jun 2023 16:45:44 -0700 (PDT)
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
X-Inumbo-ID: 3fecc094-097b-11ee-b232-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686613545; x=1689205545;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=J6RKBwJ1snfOShsMKSa/kdTwHRc2sX8E52+VmBrW73M=;
        b=d3xgiOjtTog0mLVt0UUF6SYGGd8ZNr4HF7QbG3ANNB0F9pm2Mnfq6cMKvB6sbMuSRV
         QgWIqQPT0Bz/c6PzgCrCP7PjhIQEf53F9Hq1ZzRfje3zYm9eFWGopD2mOQlyY3W6Ct1C
         diLMaiEHR/d2lY6XdYCuUVT8MxiBw26YRbJ+vLXKhx4eckjH/IBs8Vu650PjnGgHLZfm
         F+52i+6LlG/DNA9AL6mhi/Ytu30a/yapXnU8e4vUqRcJdEh8s8OFO1YXOUJadub+iQHv
         z6vbdQtv6OfPN8ZdleCLjbUevHZa+Wcr6lxGX03ENnGWHZ1Zg+XQGmkr7kxiw7qx+njU
         qXkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686613545; x=1689205545;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=J6RKBwJ1snfOShsMKSa/kdTwHRc2sX8E52+VmBrW73M=;
        b=H+YTNCg4/Tsh7hDMT+AXdgY31h3xoN9wLql3Odd9lJVzb2Hjyx7L6L8MnjiY+Y+IcK
         iTslnZRu9CwMtdHfCORe25MF3ZFtJqvr7CoMm/gjrd51X4UDz9qrdPJpIfeLNeauNn4p
         Hxb+Ptbd7JvSd3A0Yp5S4mN5Fk1uaGwSRSAx7WpGMRSt/ctNnh+kF0Qre5IitlHh7jBV
         NTvmGn7vhKQ9IYXwPexjT7VC5QUa/WDdibuXU2ZsjEOtIyF0L800tc2nLIhRuKVPSwXQ
         Mnwj6dzSXSmPmY14BTFzITp6oFCY10w7eZaZZ3vVRJJxBDDFMGiEtAx5Nu/wO2SR9sBX
         /w1Q==
X-Gm-Message-State: AC+VfDzVjKeoANDJgQ7NnKloDiZ55+t6pVqRVtfG459shCxF1gU7DH8g
	9sYUa44ZNg6sygTu3OlrlwLn8Q==
X-Google-Smtp-Source: ACHHUZ6dtuV5DoYQYE0R52xSIR6NpJYLC8VAvw2sPNu3DqvDkPqqCuCfv+mCrhCPNNxlAI9Ns3XUug==
X-Received: by 2002:a17:906:dac3:b0:96f:9608:da7c with SMTP id xi3-20020a170906dac300b0096f9608da7cmr11947868ejb.36.1686613544905;
        Mon, 12 Jun 2023 16:45:44 -0700 (PDT)
Message-ID: <41b22e82-fd6c-5bcd-44ae-e5b799ed0175@linaro.org>
Date: Tue, 13 Jun 2023 01:45:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.11.2
Subject: Re: [patch V4 04/37] x86/smpboot: Rename start_cpu0() to
 soft_restart_cpu()
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
 <20230512205255.662319599@linutronix.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230512205255.662319599@linutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 12/5/23 23:07, Thomas Gleixner wrote:
> From: Thomas Gleixner <tglx@linutronix.de>
> 
> This is used in the SEV play_dead() implementation to re-online CPUs. But
> that has nothing to do with CPU0.
> 
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> Tested-by: Michael Kelley <mikelley@microsoft.com>
> ---
>   arch/x86/include/asm/cpu.h   |    2 +-
>   arch/x86/kernel/callthunks.c |    2 +-
>   arch/x86/kernel/head_32.S    |   10 +++++-----
>   arch/x86/kernel/head_64.S    |   10 +++++-----
>   arch/x86/kernel/sev.c        |    2 +-
>   5 files changed, 13 insertions(+), 13 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


