Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B1F9E400678
	for <lists+xen-devel@lfdr.de>; Fri,  3 Sep 2021 22:20:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.178382.324339 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mMFfb-00080D-EH; Fri, 03 Sep 2021 20:20:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 178382.324339; Fri, 03 Sep 2021 20:20:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mMFfb-0007xN-A8; Fri, 03 Sep 2021 20:20:15 +0000
Received: by outflank-mailman (input) for mailman id 178382;
 Fri, 03 Sep 2021 20:20:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lnve=NZ=linaro.org=richard.henderson@srs-us1.protection.inumbo.net>)
 id 1mMFfZ-0007xD-QQ
 for xen-devel@lists.xenproject.org; Fri, 03 Sep 2021 20:20:13 +0000
Received: from mail-wr1-x435.google.com (unknown [2a00:1450:4864:20::435])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 42206d79-e52a-438d-9045-ae305ad8bfb6;
 Fri, 03 Sep 2021 20:20:13 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id z4so322463wrr.6
 for <xen-devel@lists.xenproject.org>; Fri, 03 Sep 2021 13:20:13 -0700 (PDT)
Received: from [192.168.8.107] (190.red-2-142-216.dynamicip.rima-tde.net.
 [2.142.216.190])
 by smtp.gmail.com with ESMTPSA id o8sm266012wmp.42.2021.09.03.13.20.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Sep 2021 13:20:11 -0700 (PDT)
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
X-Inumbo-ID: 42206d79-e52a-438d-9045-ae305ad8bfb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=xsif4pme6nhSpsi7vEWmXFg/Hnrb7mhQtjIRT3kxFkM=;
        b=muTFofn/yHs0EYKIsGha4ps6z/nsFLgk7o50hQ1bBL3mlCLJN3dqh2EbQA90EnwZiK
         NECjyG+jXGItzTA4QlZoqJEuj4/2GopLUtjAu+ncqdo/FFyEUWUPbBu236/GFMudcuCK
         D9DyjDbkUkta9IAKG6+3m2r8+8jv4lYsuurqFUi0rWz/gxe73U7hLmg/mrm5hqKdTbiF
         Opmfkr9N/UDCqcJTgk0JtowcRFkQ/LeFaRp+RBrZIUFfJTbIekWq6l07SbB0VGTU8eH+
         /SKP943AfE5+gEB6opgLoUtMGZRq5vBaEZuA49fASyXmNkP+xk+3PmUF6tFbonUn2CoS
         6yWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=xsif4pme6nhSpsi7vEWmXFg/Hnrb7mhQtjIRT3kxFkM=;
        b=WM1qaP9Nuobmr0ThmP9LOEw7Q6EJK5TgxVAvO6vqYNxWz26yTxi8DfEQBhq8vxoKFO
         hGG7Y0Os/5zuSpcXwIcSlM5gIgCQL8GIMCGDeYr+Ki+OHq2Hnmz6KDe+Wn2ChIhwIpDD
         EVlnCQe4l54bOZaxg6v84J4R7mIi8P4niFKAiIh/r9GH/HIG97chxOP4IbJj3FMq7WUN
         qCSHF6oGhJxT0pOZM6oA9VZTsEF1sTR7zD50T2XUqTjc2VOtDotxWImPs7ubQV7s2V+V
         zthsXK/D9F0VrWcXgu/WJUeEnSe6UAwrrQioFyhO/BcNt43wQBrvfFhvm8C/8DQHu2Is
         9nEw==
X-Gm-Message-State: AOAM533xozJkdYOtc7u6dtOZQf1WWA1jVqRrQPmf129hf2vfD9SSZMa2
	hqeIovRl0zbygR2uItsAJ+6hKA==
X-Google-Smtp-Source: ABdhPJxCxEUNKk9CrXrBQLK7GjqB1EVrT8+iyYBGoXf53+iVgrOG7SDx81iHjmDeuA92Igp3EWy9+w==
X-Received: by 2002:adf:dd4f:: with SMTP id u15mr825520wrm.237.1630700412182;
        Fri, 03 Sep 2021 13:20:12 -0700 (PDT)
Subject: Re: [PATCH v3 10/30] target/avr: Restrict has_work() handler to
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
 <20210902161543.417092-11-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <1833210b-e250-33f5-be38-9d543539b4aa@linaro.org>
Date: Fri, 3 Sep 2021 22:20:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210902161543.417092-11-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 9/2/21 6:15 PM, Philippe Mathieu-Daudé wrote:
> Restrict has_work() to TCG sysemu.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>   target/avr/cpu.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/target/avr/cpu.c b/target/avr/cpu.c
> index e9fa54c9777..6267cc6d530 100644
> --- a/target/avr/cpu.c
> +++ b/target/avr/cpu.c
> @@ -32,6 +32,7 @@ static void avr_cpu_set_pc(CPUState *cs, vaddr value)
>       cpu->env.pc_w = value / 2; /* internally PC points to words */
>   }
>   
> +#if defined(CONFIG_TCG) && !defined(CONFIG_USER_ONLY)
>   static bool avr_cpu_has_work(CPUState *cs)

No CONFIG_TCG or CONFIG_USER_ONLY test for avr.

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

