Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BCB54006A9
	for <lists+xen-devel@lfdr.de>; Fri,  3 Sep 2021 22:32:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.178437.324437 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mMFqp-0006S6-JC; Fri, 03 Sep 2021 20:31:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 178437.324437; Fri, 03 Sep 2021 20:31:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mMFqp-0006QM-GF; Fri, 03 Sep 2021 20:31:51 +0000
Received: by outflank-mailman (input) for mailman id 178437;
 Fri, 03 Sep 2021 20:31:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lnve=NZ=linaro.org=richard.henderson@srs-us1.protection.inumbo.net>)
 id 1mMFqo-0006Ok-6q
 for xen-devel@lists.xenproject.org; Fri, 03 Sep 2021 20:31:50 +0000
Received: from mail-wm1-x32a.google.com (unknown [2a00:1450:4864:20::32a])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f49976a1-f222-4986-9403-0fc003c84747;
 Fri, 03 Sep 2021 20:31:48 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id m2so118211wmm.0
 for <xen-devel@lists.xenproject.org>; Fri, 03 Sep 2021 13:31:48 -0700 (PDT)
Received: from [192.168.8.107] (190.red-2-142-216.dynamicip.rima-tde.net.
 [2.142.216.190])
 by smtp.gmail.com with ESMTPSA id 129sm315688wmz.26.2021.09.03.13.31.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Sep 2021 13:31:47 -0700 (PDT)
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
X-Inumbo-ID: f49976a1-f222-4986-9403-0fc003c84747
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=IuI8V71Jj+hTTxPmLaVm9RgBYo3XervExPJzr/+wck8=;
        b=BHJmUzDO3YywOUa9sdMc6M7Mu/GQRndqEiNv6lAlw/Rx2vJ69SftU14BI/7FyKvVj9
         /uSejEVcW3KrPYDJAJyYChPMo1COohaJL/FXfRq2f06sB0IBPSkSyKXLV8C/rFTDVb7E
         WjHNSLL5Ss9dhHvBCzA6nwVi4BQ/020CB2mCBU5FNscWowKriFlIsU05ePAcI11HBhBZ
         8EJaMt/LSnFNof7n0feMVm2QdfWC+CGhuNk0uCoYDLrGLAXIEX9D0/LRxoU1O0AF4UA4
         kzHj1+GLCmB1fy3OyPTx6ajgae2BTAFMx+usPTXWXhBd7mz+rL1Z/GcPM+49esXseeLB
         SgmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=IuI8V71Jj+hTTxPmLaVm9RgBYo3XervExPJzr/+wck8=;
        b=oL7TTvZ8MnH3A0eGix+nqMs/+0M2ladZXXM2mXM+78bJziLnCy5Ronv2K2OoX1ulyX
         +gE4dicmKzCwtC1rXgR0P2c/iv5Q0Q/xAlDCkDypchSRj3DBouDDDNmW+TV1YdTDox1L
         k48cAtflmOgRHDaUGljjHhFZDj6P0JSPEqa00JS5cO9dx2SxX95/F4VtOXzBDr5rkFWe
         2Oj9MlRBcof+S8VHFIh3frOxlUrQ8vHVJ8qS+uykGPAJUUUdd/3VJvEyqlLWcD3aed18
         jk3ZXBrTJyYJ1aNaLXiVgEATtzsQMP0nyYtoa9DfrxXIyFWYKbMMbGVaOXbsA7Kap0/R
         w0HQ==
X-Gm-Message-State: AOAM531f55EtLlEgCgnUElBkBWiYtufxN7V3O6cbyMHdTMqNL9xM+z5c
	fxK4VV/iXY1f5PJNMIIAAcwqDA==
X-Google-Smtp-Source: ABdhPJxfq3NlZYeWiDE5W/APiCzDJdzufksHOX18ryVfGevh4sxLdu17AHeHdIzgstpOHsuJ9Y+KsA==
X-Received: by 2002:a05:600c:cc:: with SMTP id u12mr440384wmm.182.1630701108006;
        Fri, 03 Sep 2021 13:31:48 -0700 (PDT)
Subject: Re: [PATCH v3 19/30] target/openrisc: Restrict has_work() handler to
 sysemu and TCG
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Greg Kurz <groug@kaod.org>, haxm-team@intel.com,
 Kamil Rytarowski <kamil@netbsd.org>, qemu-ppc@nongnu.org,
 Anthony Perard <anthony.perard@citrix.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Michael Rolnik <mrolnik@gmail.com>, qemu-riscv@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Thomas Huth <thuth@redhat.com>, David Hildenbrand <david@redhat.com>,
 Chris Wulff <crwulff@gmail.com>, Laurent Vivier <lvivier@redhat.com>,
 Cameron Esfahani <dirty@apple.com>, Sunil Muthuswamy
 <sunilmut@microsoft.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Taylor Simpson <tsimpson@quicinc.com>, qemu-s390x@nongnu.org,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Aurelien Jarno
 <aurelien@aurel32.net>, Paul Durrant <paul@xen.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 David Gibson <david@gibson.dropbear.id.au>,
 Alistair Francis <alistair.francis@wdc.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, Laurent Vivier <laurent@vivier.eu>,
 Cornelia Huck <cohuck@redhat.com>, qemu-arm@nongnu.org,
 Wenchao Wang <wenchao.wang@intel.com>, xen-devel@lists.xenproject.org,
 Marek Vasut <marex@denx.de>, Stefano Stabellini <sstabellini@kernel.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Colin Xu <colin.xu@intel.com>, Claudio Fontana <cfontana@suse.de>,
 Palmer Dabbelt <palmer@dabbelt.com>, Stafford Horne <shorne@gmail.com>,
 Reinoud Zandijk <reinoud@netbsd.org>, kvm@vger.kernel.org
References: <20210902161543.417092-1-f4bug@amsat.org>
 <20210902161543.417092-20-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <ed2e67da-0ff5-88af-6522-1fd029511e3c@linaro.org>
Date: Fri, 3 Sep 2021 22:31:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210902161543.417092-20-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 9/2/21 6:15 PM, Philippe Mathieu-Daudé wrote:
> Restrict has_work() to TCG sysemu.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>   target/openrisc/cpu.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/target/openrisc/cpu.c b/target/openrisc/cpu.c
> index 27cb04152f9..6544b549f12 100644
> --- a/target/openrisc/cpu.c
> +++ b/target/openrisc/cpu.c
> @@ -30,11 +30,13 @@ static void openrisc_cpu_set_pc(CPUState *cs, vaddr value)
>       cpu->env.dflag = 0;
>   }
>   
> +#if defined(CONFIG_TCG) && !defined(CONFIG_USER_ONLY)
>   static bool openrisc_cpu_has_work(CPUState *cs)

No CONFIG_TCG, otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

