Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EAE184006DE
	for <lists+xen-devel@lfdr.de>; Fri,  3 Sep 2021 22:44:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.178479.324514 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mMG2j-0003QM-9N; Fri, 03 Sep 2021 20:44:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 178479.324514; Fri, 03 Sep 2021 20:44:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mMG2j-0003NN-60; Fri, 03 Sep 2021 20:44:09 +0000
Received: by outflank-mailman (input) for mailman id 178479;
 Fri, 03 Sep 2021 20:44:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lnve=NZ=linaro.org=richard.henderson@srs-us1.protection.inumbo.net>)
 id 1mMG2h-0003N3-PF
 for xen-devel@lists.xenproject.org; Fri, 03 Sep 2021 20:44:07 +0000
Received: from mail-wr1-x42a.google.com (unknown [2a00:1450:4864:20::42a])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f1d3555d-3435-4062-8bcf-9affcb3d7dc5;
 Fri, 03 Sep 2021 20:44:07 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id q11so381219wrr.9
 for <xen-devel@lists.xenproject.org>; Fri, 03 Sep 2021 13:44:07 -0700 (PDT)
Received: from [192.168.8.107] (190.red-2-142-216.dynamicip.rima-tde.net.
 [2.142.216.190])
 by smtp.gmail.com with ESMTPSA id h16sm264457wre.52.2021.09.03.13.44.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Sep 2021 13:44:05 -0700 (PDT)
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
X-Inumbo-ID: f1d3555d-3435-4062-8bcf-9affcb3d7dc5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=kHY8X+3WAxrdeSKfSV5cKvDPcFHMSr1zqsSabCFDuj4=;
        b=y2JE2znGpCHgDzsU2I9wK0RJ8GE2JJWPW9THeKM+zR9sq8qQv438t3kOx206Jt2Fg9
         HCBj4K5J9LrMW8VCOyReTekXa1iDDwX12LjR7w51Hp6FgTpMfV7mK57QPRaKgTN+mKSM
         c4ydaiundmZ/zqYpEcQ7fTBQRpS/g1xvCPjoSorsUTdNxikH8pbFeAJIqDRqkEeBcdOc
         o6bXO2ZIp6ZGu2T9H1FE0GxSedCTSSR2B/P/X59CRLG9yK22Gt+PLAznez/m/7vmSLM1
         nNLeBSmIfDEWuEX2lL68vLI9//wt72neSXBsIxn05T13a5hBYl9JWV1zFbdtz3FU6mYb
         fpgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=kHY8X+3WAxrdeSKfSV5cKvDPcFHMSr1zqsSabCFDuj4=;
        b=tnF7QaEAcubsueSkXIe4fv9uWUBpEY9UmErJYaO2zYb8OWuj+KDsHuQXmii6QrV9/p
         JpXpzn8P2prkRKJt+QoiOcHt7/iX05bkPf0l3QGV0A0UmRTYuAQoubLtlUMfljFLMZcN
         p2E76z1u7IsjdKawthLGN207k6hvesVwPtM3yjohl3VqBTR3mW0ZH/At6an52bvWNdli
         gIbtN5JOcbdd3ZLD/UnA01E+sA5YHttbMpzwtuNJ35HsVa91pwSYc+O6j8+yU57rb1+7
         NKZ69eXjPzE3c8+FYFAqvz8JDishDve3K4NkqQyBHPBe3isnroJu3cU5nOahUda/k1ut
         eU7g==
X-Gm-Message-State: AOAM5301doh9a0MYtX0WEU7xIN0vtznE2nJ5tUvJqbjYzy/isU8LqdBl
	Q5nw23gDRcQy+mwGADZJEjekDQ==
X-Google-Smtp-Source: ABdhPJwF66mC8rAdAxTJMbRm7Tnb/TmgI1HpOm8MMDv09XxJRL4qVfHzOz4F+luA4Rwup1L4RWjtvA==
X-Received: by 2002:a5d:6ac7:: with SMTP id u7mr889163wrw.390.1630701846250;
        Fri, 03 Sep 2021 13:44:06 -0700 (PDT)
Subject: Re: [PATCH v3 20/30] target/ppc: Restrict has_work() handler to
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
 <20210902161543.417092-21-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <860bd94b-89ce-3aa1-4c8b-b53e4d83b80f@linaro.org>
Date: Fri, 3 Sep 2021 22:43:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210902161543.417092-21-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 9/2/21 6:15 PM, Philippe Mathieu-Daudé wrote:
> Restrict has_work() to TCG sysemu.
> 
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   target/ppc/cpu_init.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

