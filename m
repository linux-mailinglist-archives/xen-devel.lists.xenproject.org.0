Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 69ACE400681
	for <lists+xen-devel@lfdr.de>; Fri,  3 Sep 2021 22:22:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.178401.324371 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mMFhu-0001iL-E1; Fri, 03 Sep 2021 20:22:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 178401.324371; Fri, 03 Sep 2021 20:22:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mMFhu-0001g7-At; Fri, 03 Sep 2021 20:22:38 +0000
Received: by outflank-mailman (input) for mailman id 178401;
 Fri, 03 Sep 2021 20:22:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lnve=NZ=linaro.org=richard.henderson@srs-us1.protection.inumbo.net>)
 id 1mMFhs-0001fz-Uy
 for xen-devel@lists.xenproject.org; Fri, 03 Sep 2021 20:22:37 +0000
Received: from mail-wm1-x32e.google.com (unknown [2a00:1450:4864:20::32e])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7adb07b7-15d0-4505-a490-b04c17cc036e;
 Fri, 03 Sep 2021 20:22:36 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 u15-20020a05600c19cf00b002f6445b8f55so334024wmq.0
 for <xen-devel@lists.xenproject.org>; Fri, 03 Sep 2021 13:22:36 -0700 (PDT)
Received: from [192.168.8.107] (190.red-2-142-216.dynamicip.rima-tde.net.
 [2.142.216.190])
 by smtp.gmail.com with ESMTPSA id p13sm244311wro.8.2021.09.03.13.22.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Sep 2021 13:22:34 -0700 (PDT)
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
X-Inumbo-ID: 7adb07b7-15d0-4505-a490-b04c17cc036e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=UnbOiyADd1ZMlxRvNb9HZP0pt1hL83FL8WVZjS8Ogcw=;
        b=COG3NPL3Vxpz88wlWI3lGdCLg/LDdsQZJexfhJnrghpwFEqcukZveIdAk/fFiP0wKB
         7HNAWQIl6rmgV04BpIshszyQzk9qq0Q2NwrgljJCneyfFgOJ0xAXKUZsaU/hrF0B0/AT
         3w+VRd6HCQDmcDCjwEVjMOfRX4d+x+Lya4wftnpVkB2KXN3pr43vNkh+vseHQcZijosS
         Q3FflSz6b5FTlNEGFg6AgPTW3cZ3FSliEWoFoIHYG+zwm5ACts2RQXEeZ5OBwv2FsHiM
         zzHD5y43SWWwvU4sjxJD/8SKKcD/qNm8NbTssviVjN3cg7xbLdiiJSNeDTXPZ9eqrqkH
         KpWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=UnbOiyADd1ZMlxRvNb9HZP0pt1hL83FL8WVZjS8Ogcw=;
        b=sazlLata/lmlAqyxE3LUM1sbHpFP4c2M5QWmnvp2LeDRKFdXoijg/Pn9ksGFWLcjMu
         lbkiwUujh1xCoSqUCPeQ+3AwNjzMNliB1Q7ovwGDyZBeSerq+EQd1kVQ7qIa58+PhkPn
         2KtYWWiS3as1tw741pMCTbQxBsPubTDKlbF+LQmVeXaacMzYrvH9UDIQuhit8Bdzlj0c
         spVeyo+9SNhuSRWyNCtb28RWrsk91sI8cGQxZ08NikvH4Fw+5JiRWQ5+7C6Qd9cRr3gE
         fX5XIAGHqwm9sytZxoVUsCT24bCLheNMioj2Ng4bC0EOEuqEasFm/lohvG1k1S4cVaE+
         CQbg==
X-Gm-Message-State: AOAM533d53cJ9UyoA9ZAfBXLftC7FgXHNJjFnXj32xZt4qyHqEwInrsn
	arckgeZ4eBvQEVCwQl8gQZujng==
X-Google-Smtp-Source: ABdhPJxPwO0cHTUIrMGmZMtVOl8TUayc1aTCNm++vMgNkxvRpyKHD/crU8kG261DTumMzBNsNkV5GA==
X-Received: by 2002:a05:600c:19ca:: with SMTP id u10mr432498wmq.178.1630700555348;
        Fri, 03 Sep 2021 13:22:35 -0700 (PDT)
Subject: Re: [PATCH v3 13/30] target/hppa: Restrict has_work() handler to
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
 <20210902161543.417092-14-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <1f644d61-92e9-2161-284b-0643edd4892b@linaro.org>
Date: Fri, 3 Sep 2021 22:22:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210902161543.417092-14-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 9/2/21 6:15 PM, Philippe Mathieu-Daudé wrote:
> Restrict has_work() to TCG sysemu.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>   target/hppa/cpu.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/target/hppa/cpu.c b/target/hppa/cpu.c
> index e8edd189bfc..cf1f656218f 100644
> --- a/target/hppa/cpu.c
> +++ b/target/hppa/cpu.c
> @@ -60,10 +60,12 @@ static void hppa_cpu_synchronize_from_tb(CPUState *cs,
>       cpu->env.psw_n = (tb->flags & PSW_N) != 0;
>   }
>   
> +#if defined(CONFIG_TCG) && !defined(CONFIG_USER_ONLY)
>   static bool hppa_cpu_has_work(CPUState *cs)

No CONFIG_TCG, otherwise
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

