Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 08B4A4006A7
	for <lists+xen-devel@lfdr.de>; Fri,  3 Sep 2021 22:31:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.178432.324427 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mMFqC-0005vK-Bd; Fri, 03 Sep 2021 20:31:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 178432.324427; Fri, 03 Sep 2021 20:31:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mMFqC-0005sC-7n; Fri, 03 Sep 2021 20:31:12 +0000
Received: by outflank-mailman (input) for mailman id 178432;
 Fri, 03 Sep 2021 20:31:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lnve=NZ=linaro.org=richard.henderson@srs-us1.protection.inumbo.net>)
 id 1mMFqB-0005s6-3E
 for xen-devel@lists.xenproject.org; Fri, 03 Sep 2021 20:31:11 +0000
Received: from mail-wm1-x330.google.com (unknown [2a00:1450:4864:20::330])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fe8d4ae7-09e8-4557-aa50-c0513c956a23;
 Fri, 03 Sep 2021 20:31:10 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id g135so86906wme.5
 for <xen-devel@lists.xenproject.org>; Fri, 03 Sep 2021 13:31:10 -0700 (PDT)
Received: from [192.168.8.107] (190.red-2-142-216.dynamicip.rima-tde.net.
 [2.142.216.190])
 by smtp.gmail.com with ESMTPSA id i21sm232068wrb.62.2021.09.03.13.31.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Sep 2021 13:31:08 -0700 (PDT)
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
X-Inumbo-ID: fe8d4ae7-09e8-4557-aa50-c0513c956a23
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=bg/lxOaKgNK7p03NwBu4EagG8gbF3wogDiecV24XpwU=;
        b=N7Y7UOCwkEiqMP/DA2rhef2OLc1uTSqNeETW5xALwf+2bPM9vLPwLP2mwNJoCACMW9
         VGKi6Y2sF5A5a/NW+D+AWWckUMjZ4g3RW+QjWA4qk3jIut3SSJ9spjBUDhjvwevFox5I
         JxUNi0LSnwXZj39KDzqlWU4jMSwm5sc60TEToEgbjTBaHRQCxznMjmrAUesETWr1pxNW
         YyW+6rvnEyxw8H9JQrzfuQGZib07c4Ny8cSP8XSD4x2scI1MkvpGzBsmG8mPGMPdfgDz
         mq9c4Q6tDvPpU/qVPLs0vNhp9EqbjHmLIcoKB7Y3JPSTxJq3EY1M5NeWFCnMB3KfYlPd
         C/RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=bg/lxOaKgNK7p03NwBu4EagG8gbF3wogDiecV24XpwU=;
        b=dyGKD20n76EzEB1MwLfuEDj+jVdAoURheShco0xeoS1L64ZlwZWsX2DozUVJuVReSA
         yXpqVx9wkrH0jOT7Fm1AaRPDlDzuqvHI6Vz1+E1dbBaJ5iTXQVHJrPjtUVauLAmCrJQo
         lUR/IfWKnS3udWIXxNNEUcMEnOcOtnCM0IXT/o/n9CSe++yoBsWobf/1LaGViVGiVKta
         3RVU2zOP/dtob3mWvSTbrDSyjCnXiG5iBGiM12v82lZTbQ41xQ9eJ2qJGiroYrucmY+r
         Qi+2zLoXsgXyHVxyfIsZQhuOUyN+TFHoQemSSGB/r/+i2IdzYXLrS+ztbtKqMJXO/Ub5
         Laow==
X-Gm-Message-State: AOAM533xfFQyNOW/7D6CQoMRdoWUns81cLMZVIGYvddfA2N7d+bW9tEm
	wRL9EBdtGCup1+Z5ofk7kn/juA==
X-Google-Smtp-Source: ABdhPJwzsD1YoBLjkg4zHzKfIgPz4jC9G2HwCKaXpDjC3rpGD+JAqToGSBQB4JeRK7m1b0G3qcn/dw==
X-Received: by 2002:a05:600c:35cd:: with SMTP id r13mr538951wmq.24.1630701069292;
        Fri, 03 Sep 2021 13:31:09 -0700 (PDT)
Subject: Re: [PATCH v3 18/30] target/nios2: Restrict has_work() handler to
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
 <20210902161543.417092-19-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <f58740c8-2199-61de-014a-fcb1db4835f8@linaro.org>
Date: Fri, 3 Sep 2021 22:31:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210902161543.417092-19-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 9/2/21 6:15 PM, Philippe Mathieu-Daudé wrote:
> Restrict has_work() to TCG sysemu.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>   target/nios2/cpu.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/target/nios2/cpu.c b/target/nios2/cpu.c
> index 947bb09bc1e..f1f976bdad7 100644
> --- a/target/nios2/cpu.c
> +++ b/target/nios2/cpu.c
> @@ -34,10 +34,12 @@ static void nios2_cpu_set_pc(CPUState *cs, vaddr value)
>       env->regs[R_PC] = value;
>   }
>   
> +#if defined(CONFIG_TCG) && !defined(CONFIG_USER_ONLY)
>   static bool nios2_cpu_has_work(CPUState *cs)

No CONFIG_TCG, otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

