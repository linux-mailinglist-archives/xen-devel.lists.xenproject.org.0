Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A3B534006E1
	for <lists+xen-devel@lfdr.de>; Fri,  3 Sep 2021 22:44:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.178486.324526 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mMG39-00040R-J2; Fri, 03 Sep 2021 20:44:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 178486.324526; Fri, 03 Sep 2021 20:44:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mMG39-0003xx-Ew; Fri, 03 Sep 2021 20:44:35 +0000
Received: by outflank-mailman (input) for mailman id 178486;
 Fri, 03 Sep 2021 20:44:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lnve=NZ=linaro.org=richard.henderson@srs-us1.protection.inumbo.net>)
 id 1mMG37-0003vk-PE
 for xen-devel@lists.xenproject.org; Fri, 03 Sep 2021 20:44:33 +0000
Received: from mail-wr1-x430.google.com (unknown [2a00:1450:4864:20::430])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f17a0e54-f5d3-418e-ad55-3ab4e9f433c2;
 Fri, 03 Sep 2021 20:44:30 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id g18so370577wrc.11
 for <xen-devel@lists.xenproject.org>; Fri, 03 Sep 2021 13:44:30 -0700 (PDT)
Received: from [192.168.8.107] (190.red-2-142-216.dynamicip.rima-tde.net.
 [2.142.216.190])
 by smtp.gmail.com with ESMTPSA id c24sm280794wrb.57.2021.09.03.13.44.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Sep 2021 13:44:29 -0700 (PDT)
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
X-Inumbo-ID: f17a0e54-f5d3-418e-ad55-3ab4e9f433c2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=KQ6VNEDT2RTSrtudl0wF85JMAcGQkDFdqJ9dexlByDI=;
        b=j0YbQMDCCUEbh8WfA/4C6tjTCZz5YVgUlnkvm7vBt137y8oCJJCgceYmnd1W45xDsj
         fH2oliFfUD9c9XqutLEe1u5GTFJ6NAM0xeLY5W7fHmz3N4JrZIxA65d+kOsL2+ohTMMZ
         pz2NWVSauNgwHAR9TfxgbMUUxFdzWPsbV7R8NCfsWMr3X1UEPkWtchjxP20wvoSCi3RN
         2F0iPe5rDeOWIgYfpiwvyG9SdVoyXltSrkbqSEyUhJSapGdh1kKfq26I6utdBnwZlpAN
         hMZ0E1VMPwkZiA/nmt6T74JUpWM/2vzkg/YXgRLLDqbAk0z+L4XVz0pmGyj5wrmMUf7O
         sEtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=KQ6VNEDT2RTSrtudl0wF85JMAcGQkDFdqJ9dexlByDI=;
        b=puG1glLUZzKB8V3FIux5L6bUK8HHumPi9yZ8qzNMK9flFQSP6UIFOlbLX+fs0ljBek
         QGoew9tq2IsLIIn4RU/5V+YflecudxjS5gMf10K9wyAA16WMCen9RhwZfXA/Wv6/IKZc
         IfMXNWCE2OJse24oD0GUYpMgOOoCo6u4W/I/R3uq7Wxh3ON7H7WUfEkyyaykPXFjOPIj
         O4MoKQvAxZ2oT31nUOtPYhmZeNmp2h1AY6wlG47MlO6awvAs71AhDAIjX4drfYaCyuAi
         3VE7fTUnN0YAmggDwNg0PCwgmmvWEaEmINo2MGQDQaOHUlJKnYkZQxqm2xTkmv30haDn
         ir3g==
X-Gm-Message-State: AOAM5334zDmhmaeSQZBgD+WRZ4w8o3VJfekJmhfKId0QChVz2B6atj5n
	mK16K1nwPyUeyFbf/Ig9IJQjTw==
X-Google-Smtp-Source: ABdhPJz3eHG2XBUgqkGosMAvUqwA6yjsJz1vhZ/AXgPH+VG7PO6AKFhg7sg0B/HYBLrKSYyiTUNh5w==
X-Received: by 2002:adf:b789:: with SMTP id s9mr857553wre.315.1630701869461;
        Fri, 03 Sep 2021 13:44:29 -0700 (PDT)
Subject: Re: [PATCH v3 24/30] target/rx: Restrict has_work() handler to sysemu
 and TCG
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
 <20210902161543.417092-25-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <5f0e217b-2580-49b5-5cee-61d8ab41d706@linaro.org>
Date: Fri, 3 Sep 2021 22:44:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210902161543.417092-25-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 9/2/21 6:15 PM, Philippe Mathieu-Daudé wrote:
> Restrict has_work() to TCG sysemu.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>   target/rx/cpu.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/target/rx/cpu.c b/target/rx/cpu.c
> index 25a4aa2976d..0d0cf6f9028 100644
> --- a/target/rx/cpu.c
> +++ b/target/rx/cpu.c
> @@ -41,11 +41,13 @@ static void rx_cpu_synchronize_from_tb(CPUState *cs,
>       cpu->env.pc = tb->pc;
>   }
>   
> +#if defined(CONFIG_TCG) && !defined(CONFIG_USER_ONLY)
>   static bool rx_cpu_has_work(CPUState *cs)

No CONFIG_TCG, otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

