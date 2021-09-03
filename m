Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F1CD40068B
	for <lists+xen-devel@lfdr.de>; Fri,  3 Sep 2021 22:24:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.178413.324394 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mMFjn-0002yQ-2b; Fri, 03 Sep 2021 20:24:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 178413.324394; Fri, 03 Sep 2021 20:24:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mMFjm-0002vl-Um; Fri, 03 Sep 2021 20:24:34 +0000
Received: by outflank-mailman (input) for mailman id 178413;
 Fri, 03 Sep 2021 20:24:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lnve=NZ=linaro.org=richard.henderson@srs-us1.protection.inumbo.net>)
 id 1mMFjk-0002vT-Mf
 for xen-devel@lists.xenproject.org; Fri, 03 Sep 2021 20:24:32 +0000
Received: from mail-wr1-x42a.google.com (unknown [2a00:1450:4864:20::42a])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3df121d7-77d4-470d-8279-ac0f63c31d72;
 Fri, 03 Sep 2021 20:24:31 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id u9so327078wrg.8
 for <xen-devel@lists.xenproject.org>; Fri, 03 Sep 2021 13:24:31 -0700 (PDT)
Received: from [192.168.8.107] (190.red-2-142-216.dynamicip.rima-tde.net.
 [2.142.216.190])
 by smtp.gmail.com with ESMTPSA id l15sm315117wms.38.2021.09.03.13.24.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Sep 2021 13:24:30 -0700 (PDT)
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
X-Inumbo-ID: 3df121d7-77d4-470d-8279-ac0f63c31d72
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=MUAOnWb7Jr2o1NB8tpwx1E/Lm7U1xeRRhxPNvAXjZbg=;
        b=vzZJ3StsffaZE2XWFvvqf2xJqEy05bbfJRhtDaeaWq7QuAU52n/TB/ULQ8WeVNs54M
         UGk4VZfAumjAQ6YHZqLXwehiRMweE/3kJmX4Exi6/vcM0AbVsP9DyQ+kTZSyXOjSTQXE
         yltj+XKDtFQcrEjs98IbsnvIXwqtEH/TjR8pwEw8KEUkc8NYtmXPjP513FwOCCGUt9wr
         aStX5sxRH5/5TVq63meFggk5pkY4HjNNTzztQF0zM0dnsU7O4t2Ixsf6lRKnmGoibQxd
         a4FPgOEbY/12bxwaYsGxLbjms3hn+0Bpm8n2QXKQeM0XRr72OBCjWTcA7StsxwdGykZR
         MZRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=MUAOnWb7Jr2o1NB8tpwx1E/Lm7U1xeRRhxPNvAXjZbg=;
        b=JOYTnnJAZUa5Dj7c6hA/CHUvkpGrG6mFHpK0TPc56S07LSbsvxJ4EcyHfA+TxxQCj7
         db0HDBeZMwmMJv03cMvNaiqfvtL7RF7u7lJiGQ2k+SzQhDTO+f5L3dauIh/3p3DVu5Bu
         u+M2vhyV37FGJfvM5vnVeVhBuuCkzXbDl13OFQWtpZAl8skERJegw5Mht+OsSjSNapAo
         88CgEx6SWnIWQet5yDugTNMf4p3EomArIiaPmVwAmUR6QL0uTOZ6UsnZ4TpzbNCjG5+T
         xAyTFZ19W5UOfKErFnAu77Kb+5EyrDqbApLFOQx2dubjSDr6YOoLRGbBUaHNDEoNqoAv
         Jo/Q==
X-Gm-Message-State: AOAM533slL4RzxBXWPC65IwtOhkQpqhRFhuQIqleKkxxqEX1U1TEsX3A
	Tt54VkVnu76Q3AN/RvtArMIuJA==
X-Google-Smtp-Source: ABdhPJzUsw/5kYywwKhFVX1rjFqmUKa3i/mI2bjH4AHQJ6YuS1HfmSJytNGtWbSvomY0u97BFeRM4Q==
X-Received: by 2002:adf:d4c2:: with SMTP id w2mr799125wrk.235.1630700671118;
        Fri, 03 Sep 2021 13:24:31 -0700 (PDT)
Subject: Re: [PATCH v3 15/30] target/m68k: Restrict has_work() handler to
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
 <20210902161543.417092-16-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <4ac98aaa-ca63-0db6-87ce-a77193044dd1@linaro.org>
Date: Fri, 3 Sep 2021 22:24:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210902161543.417092-16-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 9/2/21 6:15 PM, Philippe Mathieu-Daudé wrote:
> Restrict has_work() to TCG sysemu.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>   target/m68k/cpu.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/target/m68k/cpu.c b/target/m68k/cpu.c
> index 66d22d11895..94b35cb4a50 100644
> --- a/target/m68k/cpu.c
> +++ b/target/m68k/cpu.c
> @@ -31,10 +31,12 @@ static void m68k_cpu_set_pc(CPUState *cs, vaddr value)
>       cpu->env.pc = value;
>   }
>   
> +#if defined(CONFIG_TCG) && !defined(CONFIG_USER_ONLY)
>   static bool m68k_cpu_has_work(CPUState *cs)

No CONFIG_TCG, otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

