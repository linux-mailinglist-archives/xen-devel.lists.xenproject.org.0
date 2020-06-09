Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 229311F38F3
	for <lists+xen-devel@lfdr.de>; Tue,  9 Jun 2020 13:04:21 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jic2P-00021u-6o; Tue, 09 Jun 2020 11:03:25 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HrVd=7W=redhat.com=pbonzini@srs-us1.protection.inumbo.net>)
 id 1jic2M-00021p-MC
 for xen-devel@lists.xenproject.org; Tue, 09 Jun 2020 11:03:23 +0000
X-Inumbo-ID: d4a80a7e-aa40-11ea-b305-12813bfff9fa
Received: from us-smtp-1.mimecast.com (unknown [207.211.31.120])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id d4a80a7e-aa40-11ea-b305-12813bfff9fa;
 Tue, 09 Jun 2020 11:03:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591700600;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AGuN3wM4I0BralfErs2ulp7k2NU1Mw2uS1iHN1MhyPM=;
 b=Hjw0DGqkKb/riXWMqn+f9iplwRDu8qEiXr7tpDYWrz02YwUD/zijRZCAqP1N92rrJUB+kl
 jn8Wtq6GG7URPz7yUT6gXDc8W5qSrIgBM2cSnJ0GY1dkng60ODEfUZ004HlPKCnOQFhyDy
 ZNG8Ih1pRxY1PZVTRR/xYk7/HNB6jyU=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-21-Nfe3kRG0MHirhwfX67968A-1; Tue, 09 Jun 2020 07:03:18 -0400
X-MC-Unique: Nfe3kRG0MHirhwfX67968A-1
Received: by mail-wm1-f69.google.com with SMTP id a7so524313wmf.1
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jun 2020 04:03:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=AGuN3wM4I0BralfErs2ulp7k2NU1Mw2uS1iHN1MhyPM=;
 b=DPMWdvI0C4RrtafYTgijSlJxCflB+AbVfAfW4jQpkrMvoVh1RWLLm9g5WvGsXUy4wU
 H++7ALuoMgGw6pcbR2ovQGm/jfgkCv7lLIruVMSmR9epNjoMFwAhmRCkS1qOyg5mjQjl
 QG0kJvO/F176cp6rUXR4u0S6lhyUkvIbksF7Dxgz1ebBw34mwy9E4tYdyKUxf5AsVlV2
 C01dhP+dZiEP3Xuc2oGszETeC3eSXoq9PpqRtPW4eSFrxYZDd4G2An5QZMvU1i6riINb
 hn6IavbTwhupCoo2DuzJ7sdXO06wvj3yzHduDS/HG1YiTG6vr53MIMeA0C8svO26Pjee
 QqMg==
X-Gm-Message-State: AOAM530GpsZZasY63vrKK75gahrbDyw1rC9FLyIavBuEnA1cniYXQXH4
 jKDiNmSiWz33drUBle7xaAZRCO18g+xSVPqRhZFm2Betc+Wz7HYh1uNfrBdXyAlvLDULo+ABkf2
 DgdAYyaOPncMbtfa39azXKa6adgY=
X-Received: by 2002:adf:fdcd:: with SMTP id i13mr3615806wrs.190.1591700597529; 
 Tue, 09 Jun 2020 04:03:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxDvLBQJgRiWZcWe2u7EwQcm+tdrRwDV7JS7cSYFfquo5pnCwJjyQFwLMFNNTExDMlkFTA1qg==
X-Received: by 2002:adf:fdcd:: with SMTP id i13mr3615759wrs.190.1591700597265; 
 Tue, 09 Jun 2020 04:03:17 -0700 (PDT)
Received: from [192.168.178.58] ([151.21.172.168])
 by smtp.gmail.com with ESMTPSA id u3sm2969549wrw.89.2020.06.09.04.03.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Jun 2020 04:03:16 -0700 (PDT)
Subject: Re: [RFC PATCH 33/35] hw/timer/slavio_timer: Emit warning when old
 code is used
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20200608160044.15531-1-philmd@redhat.com>
 <20200608160044.15531-34-philmd@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <0bc0385a-9738-a9ea-d3c9-115955d5e8e6@redhat.com>
Date: Tue, 9 Jun 2020 13:03:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200608160044.15531-34-philmd@redhat.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Max Filippov <jcmvbkbc@gmail.com>, Alistair Francis <Alistair.Francis@wdc.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>,
 Magnus Damm <magnus.damm@gmail.com>, Markus Armbruster <armbru@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Andrzej Zaborowski <balrogg@gmail.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <alistair@alistair23.me>, qemu-arm@nongnu.org,
 xen-devel@lists.xenproject.org, qemu-riscv@nongnu.org,
 Stafford Horne <shorne@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Richard Henderson <rth@twiddle.net>,
 "Daniel P . Berrange" <berrange@redhat.com>, Thomas Huth <huth@tuxfamily.org>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Michael Walle <michael@walle.cc>, qemu-ppc@nongnu.org,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 08/06/20 18:00, Philippe Mathieu-Daudé wrote:
> This code hasn't been QOM'ified yet. Warn the user.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  hw/timer/slavio_timer.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/hw/timer/slavio_timer.c b/hw/timer/slavio_timer.c
> index 4c5d65e391..16f21669bf 100644
> --- a/hw/timer/slavio_timer.c
> +++ b/hw/timer/slavio_timer.c
> @@ -31,6 +31,7 @@
>  #include "migration/vmstate.h"
>  #include "trace.h"
>  #include "qemu/module.h"
> +#include "hw/qdev-deprecated.h"
>  
>  /*
>   * Registers of hardware timer in sun4m.
> @@ -392,6 +393,8 @@ static void slavio_timer_init(Object *obj)
>      unsigned int i;
>      TimerContext *tc;
>  
> +    qdev_warn_deprecated_function_used();
> +
>      for (i = 0; i <= MAX_CPUS; i++) {
>          uint64_t size;
>          char timer_name[20];
> 

This one is okay.

Paolo


