Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F6ED1F3945
	for <lists+xen-devel@lfdr.de>; Tue,  9 Jun 2020 13:14:16 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jicCe-00049l-2y; Tue, 09 Jun 2020 11:14:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HrVd=7W=redhat.com=pbonzini@srs-us1.protection.inumbo.net>)
 id 1jicCc-00049J-M5
 for xen-devel@lists.xenproject.org; Tue, 09 Jun 2020 11:13:58 +0000
X-Inumbo-ID: 50657326-aa42-11ea-b30b-12813bfff9fa
Received: from us-smtp-1.mimecast.com (unknown [205.139.110.61])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 50657326-aa42-11ea-b30b-12813bfff9fa;
 Tue, 09 Jun 2020 11:13:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591701238;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=O3lzSLGxJ8WgRzoyp9NolnrgEUC6tjBqCyG0KDbIHi0=;
 b=Rg2sDSqNz6mSUZRA+rtHXrL0X8hkZG8/Yib8T5MElWpJrvDYFLsgJmBy9lW2UeYM51StFY
 UkcWSQS/PloyuYYy/Xpjjf5hprG+cxGSoyrT/2VOiHzaJ/R70EN8uIjbVsKR845DSwfMV9
 5lYphO8PLBcT7vqcyC+3RT0K3+anc6o=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-166-zMugz2zhMSWNRX53jY4VjQ-1; Tue, 09 Jun 2020 07:13:56 -0400
X-MC-Unique: zMugz2zhMSWNRX53jY4VjQ-1
Received: by mail-wm1-f72.google.com with SMTP id k185so524767wme.8
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jun 2020 04:13:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=O3lzSLGxJ8WgRzoyp9NolnrgEUC6tjBqCyG0KDbIHi0=;
 b=kvpDfD/AiTP2ng+c7/YTvJgeSqlZgwmkYecGHOHnFRkPmWlXGDUs6yuFt+lvyh9yy+
 Wl9/2jjIdrS70mut3haJxnbQCevCxbukhH9TLgHWhskfaKe6OKN9LtHk0pRv4fIqoPwN
 hFmQ0DeyAi8TVyWliCNGK6QUEhwl/HfECAyKYChV218GHjFDP/9qM/NoDyJzqWRbMjDg
 h3efb6vkzqAji+eAEjSPEFrosEIiiwFru2vyVPRVPK9ofgdHkb0LtZYoWmWB8mm8lq2g
 H0Bj86u8v5CWNxVrOzUH8GYTMkcg2Y3E0ehPhM8XE6zxmStLB4Dr2JfABuM3UgSXS/Ei
 wqig==
X-Gm-Message-State: AOAM530CyIgYOwhwW4J7QHEcX1p6EhrJdMoHbl8BpPTSVdD7RcGn3/we
 UVPuGc0IHUz763GuLjENzgdfQvGLkmpcOyWqET4d41NJl8FrU8M11nLDSwzhnYxYZ18wZf5AGEo
 wq2Cmun8mkmcuWRDkOvV+AejnTOs=
X-Received: by 2002:adf:f582:: with SMTP id f2mr4186320wro.204.1591701235064; 
 Tue, 09 Jun 2020 04:13:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy7CEeV1+7lXiLRFYok5rBbukk8N3FMNoofh40xzDiHh3/3TzmlrCYg3pn55HLPW4csjHJ2JQ==
X-Received: by 2002:adf:f582:: with SMTP id f2mr4186295wro.204.1591701234805; 
 Tue, 09 Jun 2020 04:13:54 -0700 (PDT)
Received: from [192.168.178.58] ([151.21.172.168])
 by smtp.gmail.com with ESMTPSA id 50sm3179768wra.1.2020.06.09.04.13.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Jun 2020 04:13:54 -0700 (PDT)
Subject: Re: [RFC PATCH 26/35] hw/openrisc/cputimer: Emit warning when old
 code is used
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20200608160044.15531-1-philmd@redhat.com>
 <20200608160044.15531-27-philmd@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <4cdb0948-56b8-6d72-2030-ea00186c47bc@redhat.com>
Date: Tue, 9 Jun 2020 13:13:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200608160044.15531-27-philmd@redhat.com>
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
>  hw/openrisc/cputimer.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/hw/openrisc/cputimer.c b/hw/openrisc/cputimer.c
> index 93268815d8..60f2c9667f 100644
> --- a/hw/openrisc/cputimer.c
> +++ b/hw/openrisc/cputimer.c
> @@ -22,6 +22,7 @@
>  #include "cpu.h"
>  #include "migration/vmstate.h"
>  #include "qemu/timer.h"
> +#include "hw/qdev-deprecated.h"
>  
>  #define TIMER_PERIOD 50 /* 50 ns period for 20 MHz timer */
>  
> @@ -135,6 +136,8 @@ static const VMStateDescription vmstate_or1k_timer = {
>  
>  void cpu_openrisc_clock_init(OpenRISCCPU *cpu)
>  {
> +    qdev_warn_deprecated_function_used();
> +
>      cpu->env.timer = timer_new_ns(QEMU_CLOCK_VIRTUAL, &openrisc_timer_cb, cpu);
>      cpu->env.ttmr = 0x00000000;
>  
> 


I was about to give this a pass, but if we did so it should be the CPU
itself that calls cpu_openrisc_clock_init (not openrisc_sim_init).

Paolo


