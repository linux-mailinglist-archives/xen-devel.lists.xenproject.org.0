Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 88AB64005D8
	for <lists+xen-devel@lfdr.de>; Fri,  3 Sep 2021 21:31:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.178317.324226 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mMEu8-0005HZ-1l; Fri, 03 Sep 2021 19:31:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 178317.324226; Fri, 03 Sep 2021 19:31:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mMEu7-0005EO-U7; Fri, 03 Sep 2021 19:31:11 +0000
Received: by outflank-mailman (input) for mailman id 178317;
 Fri, 03 Sep 2021 19:31:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lnve=NZ=linaro.org=richard.henderson@srs-us1.protection.inumbo.net>)
 id 1mMEu6-0005EI-TY
 for xen-devel@lists.xenproject.org; Fri, 03 Sep 2021 19:31:10 +0000
Received: from mail-wm1-x335.google.com (unknown [2a00:1450:4864:20::335])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0b5a6aae-0869-4a71-8c58-ac91c4e78552;
 Fri, 03 Sep 2021 19:31:09 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 x2-20020a1c7c02000000b002e6f1f69a1eso232852wmc.5
 for <xen-devel@lists.xenproject.org>; Fri, 03 Sep 2021 12:31:09 -0700 (PDT)
Received: from [192.168.8.107] (190.red-2-142-216.dynamicip.rima-tde.net.
 [2.142.216.190])
 by smtp.gmail.com with ESMTPSA id f17sm286460wmf.4.2021.09.03.12.31.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Sep 2021 12:31:08 -0700 (PDT)
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
X-Inumbo-ID: 0b5a6aae-0869-4a71-8c58-ac91c4e78552
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=5AI83WewnZnYkPXwZnd2Q/eU9eygrBsbivngRE4BXiQ=;
        b=P4ISVXfvobqG12Z6RoTOI5UGIr/4McKEzBRjkpnJVeCZevklJ/WV/0lQBT+voH2SUY
         t0dVslctqlM5DOtyjeqjkUvPjGWjj1dhiEdyZQeWioK8rQRoWy5A5NcKlSGuzKW3aWqj
         t2bT7b9xG9bD7XISjXwWDKsCHqd+100iir2zh/3XRm8EAkGO06KgFLng+vuhbRGyvSoR
         AObhwaMSw7osyojtzotiYTY7cxvr3JYasdODvCk6KW0vBIVPJ0cpLiVEP0EFP/cmNIcL
         vTd4VlnM3ebyqP3INvEw9GWo/Z410XL/Oo2itgtLLE/TkG/P7c4oBYv9h2IqwiQYnS7X
         J5sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=5AI83WewnZnYkPXwZnd2Q/eU9eygrBsbivngRE4BXiQ=;
        b=B6AfWkm6iJPPwOFjof/JZTbWIte1i/DyMNkXA3zQ4z5Bs8RLa+dPYVfWVe7qIO9UlQ
         oF70qyOjkOiutCrvn9M4mGZmLZrYM2IZD6gZBr0J6L3Ni+N19G/02cDfpJAP4NAvWsFJ
         1xt/z5wmxYI3kdK1UB4Rv7g44yV3D4QuYXCXxiqm+xX4BdQtX7u1AefH4v1HI8Ku00fl
         bG1hcp/MlrdHt1KTYpViovlsd/pgTSg8NvGAPO4SmpxYtGwb1ChctSQi1IE90UsYnuus
         d3wvy39SR9P0YpupTi341QCF1UZwAV73/ufV+INEQP6qQ1QMp+2uAqcMQs1hGoR2J3xU
         7mgw==
X-Gm-Message-State: AOAM5322nGVaKe073evTpjpQww+giObdZ/qboNQv4yqwOjcKDs2PS9p9
	cdfA8R/H1eiuAUu54pUjPgcbmQ==
X-Google-Smtp-Source: ABdhPJyNPnhhhAtbo2njo6bCAr3WAaEKFNGmuE7LF325krCnfwymK4ah4w6eYAokj7v99c7wD74wnA==
X-Received: by 2002:a1c:1c2:: with SMTP id 185mr289419wmb.11.1630697468395;
        Fri, 03 Sep 2021 12:31:08 -0700 (PDT)
Subject: Re: [PATCH v3 01/30] accel/tcg: Restrict cpu_handle_halt() to sysemu
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
 <20210902161543.417092-2-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <cdbffa64-98a4-859d-d8f1-50d959197542@linaro.org>
Date: Fri, 3 Sep 2021 21:31:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210902161543.417092-2-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 9/2/21 6:15 PM, Philippe Mathieu-Daudé wrote:
> +#ifndef CONFIG_USER_ONLY
>   static inline bool cpu_handle_halt(CPUState *cpu)
>   {

Hmm, slightly better to move the ifdef just inside here,

> @@ -607,6 +608,7 @@ static inline bool cpu_handle_halt(CPUState *cpu)
>   

and here,

>       return false;
>   }
> +#endif /* !CONFIG_USER_ONLY */
>   
>   static inline void cpu_handle_debug_exception(CPUState *cpu)
>   {
> @@ -865,9 +867,11 @@ int cpu_exec(CPUState *cpu)
>       /* replay_interrupt may need current_cpu */
>       current_cpu = cpu;
>   
> +#ifndef CONFIG_USER_ONLY
>       if (cpu_handle_halt(cpu)) {
>           return EXCP_HALTED;
>       }
> +#endif

which would eliminate this one.


r~

