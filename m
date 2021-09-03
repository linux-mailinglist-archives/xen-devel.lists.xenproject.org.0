Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9259B40065E
	for <lists+xen-devel@lfdr.de>; Fri,  3 Sep 2021 22:12:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.178329.324248 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mMFXl-0002Cy-Gk; Fri, 03 Sep 2021 20:12:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 178329.324248; Fri, 03 Sep 2021 20:12:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mMFXl-0002BG-BZ; Fri, 03 Sep 2021 20:12:09 +0000
Received: by outflank-mailman (input) for mailman id 178329;
 Fri, 03 Sep 2021 20:12:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lnve=NZ=linaro.org=richard.henderson@srs-us1.protection.inumbo.net>)
 id 1mMFXj-00027S-M5
 for xen-devel@lists.xenproject.org; Fri, 03 Sep 2021 20:12:07 +0000
Received: from mail-wm1-x32d.google.com (unknown [2a00:1450:4864:20::32d])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6cb8a81b-98a6-42d3-9930-9832eff5d001;
 Fri, 03 Sep 2021 20:12:02 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 u26-20020a05600c441a00b002f66b2d8603so297450wmn.4
 for <xen-devel@lists.xenproject.org>; Fri, 03 Sep 2021 13:12:02 -0700 (PDT)
Received: from [192.168.8.107] (190.red-2-142-216.dynamicip.rima-tde.net.
 [2.142.216.190])
 by smtp.gmail.com with ESMTPSA id d24sm273952wmb.35.2021.09.03.13.11.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Sep 2021 13:12:00 -0700 (PDT)
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
X-Inumbo-ID: 6cb8a81b-98a6-42d3-9930-9832eff5d001
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=mxyctmapl79Ub3Q/zYX+Nkj85YoukkH7BHTHMekfamE=;
        b=t9RFyV/8T9K6nv3dHRjG1hWQUIpgeAPiWzbli6rc/aUuQ31x1HtnbcmsiJVOb8T6rR
         m4qiCVH84qQK8xPbNGXOZUpCRPvxDeX7tTBSsZh8M0374UGQg6dF6PLZwyo9ISjfc9bJ
         CWfpxjGwhMr7vTpK1fPtfwbm1iJ8HnTJdrYosgJK9izgHdZ0ztxg8B2uyepCOhJplxAp
         prdXjw8n/KT5kuDuS96LqrCZaNEgUC6kDP7SmktLzm+AQ+9mJ5wvgVVAeU25jfhlO6eI
         BLzbMQN2f0dppbQCTMKOQkiUcLDlvJ+v4vT/tXsEEKXyNLSD/44J84hSUEVubACT1vl5
         uKhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=mxyctmapl79Ub3Q/zYX+Nkj85YoukkH7BHTHMekfamE=;
        b=E3sT4A+kmXTE6nMqoHUQl5zhxL96RMev8hIGOCggNJ2QSdLo7Url16Mo9p+vsDliTQ
         rmptr9bpz2J42YkLnvEqfGckE7MSMgZsZEz/kR41ReweZoU4Gge6bnC0uK5tk9mqKpqX
         CG51FgXMNRnMedO6kouwBBxbLakqMUGIpBzgp2E88ImAOjlrGojATYjkhdcPJE2kr/rE
         dbKyeam8gNx3RLoy4p6JombUm0Jdh9V2dtFNtnUVLzRy4B00i3ZXRqtx9CzfRZP6JiqA
         T2oxOp6e0gxJxdJYyfls+qYt7QFRhZhzkrZ+mTklF1vDBgw9+54DPjuii5L6/pspAttG
         lhFQ==
X-Gm-Message-State: AOAM53197H9cpRisvnY7JdzdT64DZGPc878/8MCRATPpnOIxgKTZdvnL
	ubJYnWV14YRExO+DqHGjC7vB/w==
X-Google-Smtp-Source: ABdhPJy+MRQgwX4y9J2xsMLOLDvh4kR8c6BOyH1OQWePN8Q6sLyIRNmiAvv2gW9kqjIBssHC4EjXwA==
X-Received: by 2002:a1c:23cb:: with SMTP id j194mr455976wmj.1.1630699921311;
        Fri, 03 Sep 2021 13:12:01 -0700 (PDT)
Subject: Re: [PATCH v3 03/30] hw/core: Un-inline cpu_has_work()
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
 <20210902161543.417092-4-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <a72010ab-56d8-a6ca-14a0-7caaec76eca0@linaro.org>
Date: Fri, 3 Sep 2021 22:11:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210902161543.417092-4-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 9/2/21 6:15 PM, Philippe Mathieu-Daudé wrote:
> We want to make cpu_has_work() per-accelerator. Only declare its
> prototype and move its definition to softmmu/cpus.c.
> 
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   include/hw/core/cpu.h | 8 +-------
>   softmmu/cpus.c        | 8 ++++++++
>   2 files changed, 9 insertions(+), 7 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

