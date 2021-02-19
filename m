Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8725D31FEB6
	for <lists+xen-devel@lfdr.de>; Fri, 19 Feb 2021 19:20:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.87070.164118 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lDAO6-0006mg-T2; Fri, 19 Feb 2021 18:20:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 87070.164118; Fri, 19 Feb 2021 18:20:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lDAO6-0006mH-Pz; Fri, 19 Feb 2021 18:20:22 +0000
Received: by outflank-mailman (input) for mailman id 87070;
 Fri, 19 Feb 2021 18:20:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7G3N=HV=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1lDAO5-0006mC-4B
 for xen-devel@lists.xenproject.org; Fri, 19 Feb 2021 18:20:21 +0000
Received: from mail-wm1-x333.google.com (unknown [2a00:1450:4864:20::333])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 654b75d0-70c0-47c1-8bff-46fc3c430567;
 Fri, 19 Feb 2021 18:20:20 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id i7so4776526wmb.0
 for <xen-devel@lists.xenproject.org>; Fri, 19 Feb 2021 10:20:20 -0800 (PST)
Received: from ?IPv6:2a00:23c5:5785:9a01:101f:7370:9e02:844f?
 ([2a00:23c5:5785:9a01:101f:7370:9e02:844f])
 by smtp.gmail.com with ESMTPSA id y16sm14031151wrw.46.2021.02.19.10.20.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Feb 2021 10:20:19 -0800 (PST)
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
X-Inumbo-ID: 654b75d0-70c0-47c1-8bff-46fc3c430567
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:reply-to:subject:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=QWLOIiitmqBo5+3UaA0iJ43f4RC209g18TM/vosn6KU=;
        b=POVBAu9h6VXtheGXvk2NfpN7VuXcoirzXDBHZeSRMcMGwnLtXNDmDnbRloswSncCiu
         UUBmOonAiKAxfUdgfpFKvVHNlcCFmDWcmG8TCbHlREKDdpiW5tij6aSeDioQohoQDmeC
         l2FziYTXDZmhyOPKjnAEbFWKjYxdlG6G3js9cUC1ajMTGuLS3fEZNPbSMl5onWT1CxdM
         Q2YUQQV7bJTmWqgCLcKw5KDw4nOFUtWukP3ASDJiAqkYmBSvJTP2EuipIaJIBK23iSfg
         JQjIFR1ep2dPw3zIHeetdBiKkyAERCkBqJuP8d2NkTJ+YjJg4vONwd4TsJwMnLvHRhe0
         xrxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:reply-to:subject:to:cc:references
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=QWLOIiitmqBo5+3UaA0iJ43f4RC209g18TM/vosn6KU=;
        b=DDpQp9BgjmFf50C2qdsCjnIaZkT0DGhxh4JQi0Rr3KJhIa0q2nZzvwyGknarZDK1gH
         AIdixrLtYLe9o40IyandX07w6rI1UHfrCHJuY2dLeQF5lQZp2hFIYxIpgxsWtZyPUPqb
         brd7kvx4rF7uupQZCyK43Ia0egOAVPECwSMqTkXJ/KIFEXMOhMHA34XvEdpG2RYOrfSu
         2pntNhl90QE4zRHzMKRub/8QqQwrlAVlMviJw0+wk3sT0Uugi/ldArBg7lzn/51jBx/p
         Cbvxi+lfBQVHUd1gqbuRg6Ic0ydE9MfEsIaePRBGX+v0ZXPmGZneZN7CMyB49t+N25nL
         6nLw==
X-Gm-Message-State: AOAM5317PL8D2oGu8fPVhFAKm30yGhEuvXf7tbJuN+9kl54Oibfo9vVU
	bmncmFoP2jHMZWqMznImljA=
X-Google-Smtp-Source: ABdhPJyPeyLs0ufJRIjEcmZzmn8XKM8ztr4zDFZnUaEnnHiY3eTI/16kdMKEeG8iwgyT/uZdHskVEw==
X-Received: by 2002:a1c:a795:: with SMTP id q143mr9362251wme.113.1613758819494;
        Fri, 19 Feb 2021 10:20:19 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Reply-To: paul@xen.org
Subject: Re: [PATCH v2 09/11] hw/xenpv: Restrict Xen Para-virtualized machine
 to Xen accelerator
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Cc: Aurelien Jarno <aurelien@aurel32.net>,
 Peter Maydell <peter.maydell@linaro.org>,
 Anthony Perard <anthony.perard@citrix.com>, qemu-ppc@nongnu.org,
 qemu-s390x@nongnu.org, Halil Pasic <pasic@linux.ibm.com>,
 Huacai Chen <chenhuacai@kernel.org>, xen-devel@lists.xenproject.org,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>, qemu-arm@nongnu.org,
 Stefano Stabellini <sstabellini@kernel.org>,
 Paolo Bonzini <pbonzini@redhat.com>, kvm@vger.kernel.org,
 BALATON Zoltan <balaton@eik.bme.hu>, Leif Lindholm <leif@nuviainc.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Radoslaw Biernacki <rad@semihalf.com>,
 Alistair Francis <alistair@alistair23.me>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin"
 <mst@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Greg Kurz <groug@kaod.org>, Christian Borntraeger <borntraeger@de.ibm.com>,
 Cornelia Huck <cohuck@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 David Hildenbrand <david@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
References: <20210219173847.2054123-1-philmd@redhat.com>
 <20210219173847.2054123-10-philmd@redhat.com>
Message-ID: <f386d7c4-f139-4f17-4e5b-5a3c5288b238@xen.org>
Date: Fri, 19 Feb 2021 18:20:17 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210219173847.2054123-10-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 19/02/2021 17:38, Philippe Mathieu-Daudé wrote:
> When started with other accelerator than Xen, the XenPV machine
> fails with a criptic message:
> 
>    $ qemu-system-x86_64 -M xenpv,accel=kvm
>    xen be core: can't connect to xenstored
>    qemu-system-x86_64: xen_init_pv: xen backend core setup failed
> 
> By restricting it to Xen, we display a clearer error message:
> 
>    $ qemu-system-x86_64 -M xenpv,accel=kvm
>    qemu-system-x86_64: invalid accelerator 'kvm' for machine xenpv
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>

Acked-by: Paul Durrant <paul@xen.org>

