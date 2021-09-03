Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AFB8400667
	for <lists+xen-devel@lfdr.de>; Fri,  3 Sep 2021 22:15:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.178338.324259 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mMFaY-00030d-2e; Fri, 03 Sep 2021 20:15:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 178338.324259; Fri, 03 Sep 2021 20:15:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mMFaX-0002ye-VS; Fri, 03 Sep 2021 20:15:01 +0000
Received: by outflank-mailman (input) for mailman id 178338;
 Fri, 03 Sep 2021 20:15:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lnve=NZ=linaro.org=richard.henderson@srs-us1.protection.inumbo.net>)
 id 1mMFaX-0002yY-6x
 for xen-devel@lists.xenproject.org; Fri, 03 Sep 2021 20:15:01 +0000
Received: from mail-wr1-x42a.google.com (unknown [2a00:1450:4864:20::42a])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7aad5d17-db47-491c-9c16-9b1737dfe478;
 Fri, 03 Sep 2021 20:15:00 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id q14so322741wrp.3
 for <xen-devel@lists.xenproject.org>; Fri, 03 Sep 2021 13:15:00 -0700 (PDT)
Received: from [192.168.8.107] (190.red-2-142-216.dynamicip.rima-tde.net.
 [2.142.216.190])
 by smtp.gmail.com with ESMTPSA id l124sm343991wml.8.2021.09.03.13.14.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Sep 2021 13:14:59 -0700 (PDT)
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
X-Inumbo-ID: 7aad5d17-db47-491c-9c16-9b1737dfe478
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=4eHHYFkoRaMsvUTt4qW8qWzKOCRjBx/Npk4Tb094AvQ=;
        b=cLO22hnYLpEg/1RD0FCiO3YdVJ9j79J1/7mkf4AG2YXIXe2aFGD359ZxjySxf7C/iF
         tzfinMqq37GvKuJlfgORv3JQsLRcmYumsBYo2QPaZMoawXGhFMbSYBGnHCvKL0IbQik1
         45MV1RijIs6tVAHVpo7wuxRVTGnn6P3tAg9pOxmHYSpWbVd9DiYxU9bQGzq/RI9TejCi
         IuFmIe0QtC8F7fLOeMyaxPg7y3lcT3EAD/GnAD/B9pA4KX7M04jhATDZ7A8/fr7gbEdx
         fOoED7iAFaPcN+AM1JnCIYtXX45hgsKvOLuQ5XpA+AqILLfo9hIxUKs545+6dSzo6DRU
         0nsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=4eHHYFkoRaMsvUTt4qW8qWzKOCRjBx/Npk4Tb094AvQ=;
        b=f7e9szPaS9KnFo2+8yttE9sm9fN47hliljWAiiqqQDU5JitalRq7TbQD/3b0bZg3a6
         uEWXZqMR1o/6MwPSMEtxPWY5c3Q3TLgvU8MNnvmdQ+o4ylHi6j3hwgDoKw4qk8sysEDV
         DN1gYh9QK8872wFtmQ8GLcF7/oQ6xJOFNRIkSa/JFYvg9z11f8BqJ//h0WvaeFhbMJcK
         Vqwfdu4Bty7kQa3iqUbfi4aWhSRHdY1W2GsfyWA7P1ouRV7zvA0eztHIxqovr734oRJj
         9UWQk+t8jb4IKjfnXFfSmCu92JasIHwIyl8ZKnu6u91wDNwWyrHs0bDIzIhKnlZRxC1p
         q0gA==
X-Gm-Message-State: AOAM533hKAvEA5DEl4zaAF+//4pbkU8TqYOvE7BVC4AUg1nrONuQVjNt
	/gUR8IYxgeRXLO1UaMGBUy5vTQ==
X-Google-Smtp-Source: ABdhPJyHZZGXFXfUxy0q9drjOdzklbpmSyqwplr6BLWUGT4wjUUKjoKaSTakGLOyf3y9u9KCe6dQnw==
X-Received: by 2002:a5d:6cc9:: with SMTP id c9mr814056wrc.12.1630700099566;
        Fri, 03 Sep 2021 13:14:59 -0700 (PDT)
Subject: Re: [PATCH v3 04/30] sysemu: Introduce AccelOpsClass::has_work()
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
 <20210902161543.417092-5-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <d97a0dbf-842c-5d90-e4d9-c2faa5d618cc@linaro.org>
Date: Fri, 3 Sep 2021 22:14:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210902161543.417092-5-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 9/2/21 6:15 PM, Philippe Mathieu-Daudé wrote:
> Introduce an accelerator-specific has_work() handler.
> Eventually call it from cpu_has_work().
> 
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   include/sysemu/accel-ops.h | 5 +++++
>   softmmu/cpus.c             | 3 +++
>   2 files changed, 8 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

