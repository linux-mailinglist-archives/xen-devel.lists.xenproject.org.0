Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 967A340067F
	for <lists+xen-devel@lfdr.de>; Fri,  3 Sep 2021 22:22:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.178392.324360 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mMFh9-0000zW-03; Fri, 03 Sep 2021 20:21:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 178392.324360; Fri, 03 Sep 2021 20:21:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mMFh8-0000xI-TF; Fri, 03 Sep 2021 20:21:50 +0000
Received: by outflank-mailman (input) for mailman id 178392;
 Fri, 03 Sep 2021 20:21:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lnve=NZ=linaro.org=richard.henderson@srs-us1.protection.inumbo.net>)
 id 1mMFh7-0000x6-TY
 for xen-devel@lists.xenproject.org; Fri, 03 Sep 2021 20:21:49 +0000
Received: from mail-wr1-x42a.google.com (unknown [2a00:1450:4864:20::42a])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 76992963-d02d-4d59-9f16-1d9497d94eaf;
 Fri, 03 Sep 2021 20:21:49 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id b10so382251wru.0
 for <xen-devel@lists.xenproject.org>; Fri, 03 Sep 2021 13:21:48 -0700 (PDT)
Received: from [192.168.8.107] (190.red-2-142-216.dynamicip.rima-tde.net.
 [2.142.216.190])
 by smtp.gmail.com with ESMTPSA id r15sm402884wmh.27.2021.09.03.13.21.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Sep 2021 13:21:47 -0700 (PDT)
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
X-Inumbo-ID: 76992963-d02d-4d59-9f16-1d9497d94eaf
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=mnk5zSmpT/p699xgSKxNbIV/1GCHbsuA6wEF56QNf+E=;
        b=GhgL9+LGgM+gjslEr/EdoI7/xsxfmmw67TehO/6U7pPlE/OPtA9LjE4SDDmXvYLAmN
         yZeX0gl3cDixUofaJ53d7PYirmx3VephL7Fp2AHgbYGFY+2vJtFBsCzJiTNZI+nj8zOU
         lX3C3n2CsiqPN2JfeGez5wPcTov60f+AYR19eDiQGHsrHnbpM5alfslIIIHhsT0nTxma
         DXlSCsL0edylOOeUn7jofbIz89KxP2tF8ZT5uMLxWfF0tNPmLeVePpEpIaz8SindXxiw
         pPRklR9Iklk2ipRx/ia9X3h7Q3ffP7aRj506nP6FYfGI6tshEguc/NBqS4OKI2Ci9Ann
         FGJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=mnk5zSmpT/p699xgSKxNbIV/1GCHbsuA6wEF56QNf+E=;
        b=ZJ0EbI4yCqYK1W/l2g8S9Hv3xZJiYQGN+YYsJY60GH2xtOIpaKCw14sQCqORs8a81B
         5oj0S15wInCjtsHhN6o+89dylxZxuIfoiQROUg4xDzOmr8xLv82nQYH1uM8cCDU0QMD1
         kUznd8E1wu56lNhFFzlCszhPe1mqrG7YY3KC0V03SDH971aOHXx5SnpCek0ilHuDekdv
         hkB/d+man8bZUztrCwLUNUQccX6ZjlC5s1IXKr/n/iAooqkU6ThA/jsHJ/D9IBq2h2Fr
         ABcdrc8LYeyUMSt15CkT7cfcgvYSONdhI6iecxWAQRbAGkP0TNgp9c+J3eSl7RtruKBq
         CRuw==
X-Gm-Message-State: AOAM532PKoKaqMegNpv10UWyrkslaq61Q8pAac/7ak/eQcjW5uLf7s9w
	CWf9IGgy+trperHT0wztpu+Xbw==
X-Google-Smtp-Source: ABdhPJwPe1mnKhrxerAyhvhbZ2seI44kln/Bm0nN+tszrWb4ThZb+maUMAoke8HDY1589uhlj92r0g==
X-Received: by 2002:adf:8b03:: with SMTP id n3mr768062wra.439.1630700508096;
        Fri, 03 Sep 2021 13:21:48 -0700 (PDT)
Subject: Re: [PATCH v3 12/30] target/hexagon: Remove unused has_work() handler
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
 <20210902161543.417092-13-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <5c91731f-a11c-3555-93d8-cd3379fb727e@linaro.org>
Date: Fri, 3 Sep 2021 22:21:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210902161543.417092-13-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 9/2/21 6:15 PM, Philippe Mathieu-Daudé wrote:
> has_work() is sysemu specific, and Hexagon target only provides
> a linux-user implementation. Remove the unused hexagon_cpu_has_work().
> 
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   target/hexagon/cpu.c | 6 ------
>   1 file changed, 6 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

