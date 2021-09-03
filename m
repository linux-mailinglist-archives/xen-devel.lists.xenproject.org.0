Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C01740066B
	for <lists+xen-devel@lfdr.de>; Fri,  3 Sep 2021 22:16:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.178350.324282 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mMFcC-0004C8-MY; Fri, 03 Sep 2021 20:16:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 178350.324282; Fri, 03 Sep 2021 20:16:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mMFcC-00048m-Ih; Fri, 03 Sep 2021 20:16:44 +0000
Received: by outflank-mailman (input) for mailman id 178350;
 Fri, 03 Sep 2021 20:16:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lnve=NZ=linaro.org=richard.henderson@srs-us1.protection.inumbo.net>)
 id 1mMFcA-00048c-Pj
 for xen-devel@lists.xenproject.org; Fri, 03 Sep 2021 20:16:42 +0000
Received: from mail-wr1-x433.google.com (unknown [2a00:1450:4864:20::433])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 51c84082-b43f-4e93-b677-905a8c27a938;
 Fri, 03 Sep 2021 20:16:41 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id q11so303104wrr.9
 for <xen-devel@lists.xenproject.org>; Fri, 03 Sep 2021 13:16:41 -0700 (PDT)
Received: from [192.168.8.107] (190.red-2-142-216.dynamicip.rima-tde.net.
 [2.142.216.190])
 by smtp.gmail.com with ESMTPSA id b18sm201319wrr.89.2021.09.03.13.16.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Sep 2021 13:16:40 -0700 (PDT)
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
X-Inumbo-ID: 51c84082-b43f-4e93-b677-905a8c27a938
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=ksvR3vXBtwALfl0I6bUYOq6zF1YdgeJMV8dFDRL1P+g=;
        b=F+LmEPrSCssgf1eqjM+WBloAvOVq2tL7NMyM6LZCHirhU39DXiDO2uLD9ug3iNaHCK
         qAQxo2bwgbel/l5ZzJa4uPRl/EqjN0sQA7XIe3XklYehe60QyUJs5qg1vnpnfs/LYzJ8
         F50mpECSrD9JTS8cWWsDSVPn2dEFp7h2GfA9zAOn6e5EfN/aiCylKqANnhUX+0GyzxMA
         5YbCx/uH9oIK3BVZImpikPWK6g5wC7VESYux9bpW/knmD2hNngQDnsSLtz91Hsh54IH+
         4JT7IufJEjtYH/tbJ32xqBZvfx5N5H001O4TnBoFg7L9NuRj3KiL2d3ZfaMPEXO0z6EN
         fEBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ksvR3vXBtwALfl0I6bUYOq6zF1YdgeJMV8dFDRL1P+g=;
        b=mEWZqKV/mrsQGoQguwhD752Us+6NTsDddwM82XLeRiFXvXuuFVazp/j+sZSej/NZrR
         i9+VIMJv04YQy6c9HcDZgdtVKR7v6jBzLEmr1AxhphuJYCKd8QFm7S45yCZX0y3X/9NR
         qMS1QBqkyEhlqCvGjHvyD2ro1xCCGhPz+jTArVHSkC/UZzXARrfI+josk+RsPehnL0YM
         dYSgCecPvqRljT1hpCProqgCn0cnS4+Ax8o4R87bITnlEVqXYOlidrmGKkmkdk7fGgNC
         DBW2hDW92sS3jF1g9Kft/jFhmwXKEgGvsjwNbPRTt7GA5eZq913vKmUpAIWAjGmKSycp
         kFow==
X-Gm-Message-State: AOAM530zwJUITx+Fd6Rupzp4r4RyIQNuNP8GhWnRUIl1hIKOM5voP21/
	Dkohf8CsxiwrvVxgTXg9fENyjw==
X-Google-Smtp-Source: ABdhPJzV+oCZLVl1R3jywIXOYAACRgU/ouMC2nXN7qXT1ry456hLKIT4YtHfUNsVqaTI8qbV2+dfAA==
X-Received: by 2002:adf:eb4a:: with SMTP id u10mr794817wrn.11.1630700201045;
        Fri, 03 Sep 2021 13:16:41 -0700 (PDT)
Subject: Re: [PATCH v3 06/30] accel/whpx: Implement AccelOpsClass::has_work()
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
 <20210902161543.417092-7-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <c7d58bfa-20f7-502b-f307-9ed8f9f4def6@linaro.org>
Date: Fri, 3 Sep 2021 22:16:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210902161543.417092-7-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 9/2/21 6:15 PM, Philippe Mathieu-Daudé wrote:
> Implement WHPX has_work() handler in AccelOpsClass and
> remove it from cpu_thread_is_idle() since cpu_has_work()
> is already called.
> 
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   softmmu/cpus.c                    | 4 +---
>   target/i386/whpx/whpx-accel-ops.c | 6 ++++++
>   2 files changed, 7 insertions(+), 3 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

