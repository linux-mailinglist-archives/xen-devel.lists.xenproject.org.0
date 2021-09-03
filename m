Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 028AD400673
	for <lists+xen-devel@lfdr.de>; Fri,  3 Sep 2021 22:19:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.178365.324317 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mMFeE-0005sv-Qs; Fri, 03 Sep 2021 20:18:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 178365.324317; Fri, 03 Sep 2021 20:18:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mMFeE-0005r4-MX; Fri, 03 Sep 2021 20:18:50 +0000
Received: by outflank-mailman (input) for mailman id 178365;
 Fri, 03 Sep 2021 20:18:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lnve=NZ=linaro.org=richard.henderson@srs-us1.protection.inumbo.net>)
 id 1mMFeC-0005qI-T9
 for xen-devel@lists.xenproject.org; Fri, 03 Sep 2021 20:18:48 +0000
Received: from mail-wm1-x334.google.com (unknown [2a00:1450:4864:20::334])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id cb6e1bf4-0d8b-4b88-9e55-6134c1e51da7;
 Fri, 03 Sep 2021 20:18:48 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 192-20020a1c04c9000000b002f7a4ab0a49so274899wme.0
 for <xen-devel@lists.xenproject.org>; Fri, 03 Sep 2021 13:18:48 -0700 (PDT)
Received: from [192.168.8.107] (190.red-2-142-216.dynamicip.rima-tde.net.
 [2.142.216.190])
 by smtp.gmail.com with ESMTPSA id e3sm292523wrv.18.2021.09.03.13.18.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Sep 2021 13:18:46 -0700 (PDT)
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
X-Inumbo-ID: cb6e1bf4-0d8b-4b88-9e55-6134c1e51da7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=LqQ2qGQh8nV1ZvT9x+U3BKt+BXWg+vkVFqLIEGHhpMw=;
        b=V8kfIBCEJT52V1fp3BG4eEUjASX4Rx05CBYVPUwSnXcrpvu9DyPd9YLrQ1EFixujIi
         lUO2S1zkZF5PG/5VBU6Rk3aTdfu/NohdFpDaoPBTWr2+EAlAEqDrzmgPhi1sQ9/EZI5O
         sp0T10IQyhYcG2l5hY7SahzlV5/YDV007peO7QbcQiw6uki0FNbyDs+4u092DrKL854h
         BofPE+Yc042W1WfjRNZgBmoOLdNGI5J41nf004XrJoendGTO+R9LadQCXGvxwYAslhrk
         awNCuxHsEq//V4tBYb37j34Ybdls/wwtEv1je9PRsUGuN+bp2kKIvMshhTUfobepCiRM
         Cayg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=LqQ2qGQh8nV1ZvT9x+U3BKt+BXWg+vkVFqLIEGHhpMw=;
        b=fFS616hdkAZ4xc9P2JiDpTWswMFgmI9g7KUWwZ1NOSshdy+B49z5e7Rc+9lTIFtTSb
         pdXewz0X/CjPZuH1nThaMyDOVXrDKMtaKLNLotn3UlHFmV6X+cVcE4KXkhU9tIplrwwL
         7Tn+b752FQDkC7rvn+5tpfmVLj8cXVO37Oz1+axdh0Kwij57BsTcLfsO6xnE+7SHFVHr
         FVfDSD1KmZTQWC6aCiJ2PbxHudt6UeN2ywkvZlx6g+vDoBGEvh+y/TfOL5XEe734ziml
         OiacWeYjn8LhKQ/Qgk7Yga9QsPfSlkGYNT6DuUhmIzxXnZ9JqL6QcQ8AP9iaEdtlsaOS
         4L/A==
X-Gm-Message-State: AOAM530brx33j1oqyxOludQIFMv/ZSH6rhZd4Rkr/2mZ+0u9iQYJ4hcl
	Ri3LODKTBASYCDleawJ5HTLiyA==
X-Google-Smtp-Source: ABdhPJw3r9Ix8xv+Nu5+AHr+Q3zSVCPcKA2sZb2hwjS2kDrQMzRlRnU83nDo49PObR1jR+RXBXRDHg==
X-Received: by 2002:a1c:7c12:: with SMTP id x18mr498453wmc.114.1630700327288;
        Fri, 03 Sep 2021 13:18:47 -0700 (PDT)
Subject: Re: [PATCH v3 08/30] target/alpha: Restrict has_work() handler to
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
 <20210902161543.417092-9-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <3cd48aba-a1a1-cde3-3175-e9c462fcb220@linaro.org>
Date: Fri, 3 Sep 2021 22:18:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210902161543.417092-9-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 9/2/21 6:15 PM, Philippe Mathieu-Daudé wrote:
> Restrict has_work() to TCG sysemu.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>   target/alpha/cpu.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/target/alpha/cpu.c b/target/alpha/cpu.c
> index 93e16a2ffb4..32cf5a2ea9f 100644
> --- a/target/alpha/cpu.c
> +++ b/target/alpha/cpu.c
> @@ -33,6 +33,7 @@ static void alpha_cpu_set_pc(CPUState *cs, vaddr value)
>       cpu->env.pc = value;
>   }
>   
> +#if defined(CONFIG_TCG) && !defined(CONFIG_USER_ONLY)
>   static bool alpha_cpu_has_work(CPUState *cs)

Drop CONFIG_TCG for alpha; it's always true.

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

