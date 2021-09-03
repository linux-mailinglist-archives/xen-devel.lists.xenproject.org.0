Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 138B8400696
	for <lists+xen-devel@lfdr.de>; Fri,  3 Sep 2021 22:26:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.178425.324416 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mMFla-0004C1-LL; Fri, 03 Sep 2021 20:26:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 178425.324416; Fri, 03 Sep 2021 20:26:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mMFla-0004AC-I2; Fri, 03 Sep 2021 20:26:26 +0000
Received: by outflank-mailman (input) for mailman id 178425;
 Fri, 03 Sep 2021 20:26:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lnve=NZ=linaro.org=richard.henderson@srs-us1.protection.inumbo.net>)
 id 1mMFlZ-0004A3-Es
 for xen-devel@lists.xenproject.org; Fri, 03 Sep 2021 20:26:25 +0000
Received: from mail-wm1-x32d.google.com (unknown [2a00:1450:4864:20::32d])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e4397a1e-e8a3-4803-ac39-0d29a1f114d7;
 Fri, 03 Sep 2021 20:26:24 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 k5-20020a05600c1c8500b002f76c42214bso318379wms.3
 for <xen-devel@lists.xenproject.org>; Fri, 03 Sep 2021 13:26:24 -0700 (PDT)
Received: from [192.168.8.107] (190.red-2-142-216.dynamicip.rima-tde.net.
 [2.142.216.190])
 by smtp.gmail.com with ESMTPSA id c24sm245010wrb.57.2021.09.03.13.26.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Sep 2021 13:26:23 -0700 (PDT)
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
X-Inumbo-ID: e4397a1e-e8a3-4803-ac39-0d29a1f114d7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=9EhQsb/ACMR+ZUYvfsQ8sm7Iu0dalRztguOzy6Crcdk=;
        b=QYSXBDXbshWafmBVS2xgefEvLphaKwA0sQfPQhGCg4AdEMozIzMcXqiXVGYB7CIewz
         jGF6cmCkebhdq+OE+6RWrDO4qTxvTVl4BSUMt65GZglcAtMPB7hoGF8O6DZlqsExbX4s
         XAzARgy5lmbAjguMkMH9lOvN2ERwa8Zk1z1kUQwdBWqSZWZPNk39la+7ZY1kN/pV4gyV
         RBRSsHPMZGhaBmnt8AGJWS+r15xgowV56WK1jX05FsVJKFg3NVzyfEkg92ZjiSGXwFOY
         XPliUy/Mwpe/M5POTE0+dgsKNGe4w2JH0ejOk5iEpYzt1oiH6GsVpGrvEbVnBC4nn0nZ
         rJzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=9EhQsb/ACMR+ZUYvfsQ8sm7Iu0dalRztguOzy6Crcdk=;
        b=PCNHejtiT1CLRnZmh45VDJ5OdBHtjmbUE87Q5fZrGu6cn6ACsHiCPYmm516q1mNaEo
         gPKhXleycghBiLOoHH2HZfBjTYXjqhrOs50lZtc4bJ2T2HICLz90GPw36j7rPnzCbeL8
         0fq+CCl42zRREpxaZ2hjMwJz4PbqdJOmSGkmbIETTKsViE9gFl9wpYCHBmzED9VTvmUU
         XAEooRizrbYVqWi/XgfuHgpuqhVhfouNxRnoRPGhpcWtWK4I/2lqWQEqmOjxZx/Aqtgw
         8GF6/hN3NEP7YkalyPJRHxeQvPoimI/1ditnMSrg2Hiegjge47TCfxf4TDGbTAd7tJJ9
         Gdng==
X-Gm-Message-State: AOAM533an0b6nSzYAGxrtto6QlD/VwAhrujbx40lmqC/WL813iQuHgNd
	tvcA6j87xT87WZ2BzYCj6jTicA==
X-Google-Smtp-Source: ABdhPJxBhvIh1VZtcwLHBRW/mfjmLMhAmkSWajrXDW4E0STizvGidXuGiX92vd10z3qXEwsTB/9ddw==
X-Received: by 2002:a1c:202:: with SMTP id 2mr456635wmc.122.1630700783750;
        Fri, 03 Sep 2021 13:26:23 -0700 (PDT)
Subject: Re: [PATCH v3 17/30] target/mips: Restrict has_work() handler to
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
 <20210902161543.417092-18-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <f24d9add-497c-8342-f37b-3d299a383d73@linaro.org>
Date: Fri, 3 Sep 2021 22:26:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210902161543.417092-18-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 9/2/21 6:15 PM, Philippe Mathieu-Daudé wrote:
> Restrict has_work() to TCG sysemu.
> 
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   target/mips/cpu.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

