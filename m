Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F93F1F38FF
	for <lists+xen-devel@lfdr.de>; Tue,  9 Jun 2020 13:07:54 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jic6b-0002RA-L8; Tue, 09 Jun 2020 11:07:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HrVd=7W=redhat.com=pbonzini@srs-us1.protection.inumbo.net>)
 id 1jic6a-0002R1-4h
 for xen-devel@lists.xenproject.org; Tue, 09 Jun 2020 11:07:44 +0000
X-Inumbo-ID: 711889d8-aa41-11ea-8496-bc764e2007e4
Received: from us-smtp-delivery-1.mimecast.com (unknown [205.139.110.120])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 711889d8-aa41-11ea-8496-bc764e2007e4;
 Tue, 09 Jun 2020 11:07:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591700863;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9N2hQA54vscW2wYRbiWR3tdH19bd/eus87N3YlhQewI=;
 b=LZYIz9njjiwDr//wgh+lsHkMPxbP8zd7foyie9O1J2Oq7FmPPg0pBRE2Nr8xqqJLPTMFYv
 M6wbLteHP9f/EWVRY3RJaBFjDW5v0UIQFf5wAEeBLHX7dBbEK5OrDzZucYShB4YwQCAjAw
 tHMWv7f+QlJ4lYKnwWFh/osJIhNanB0=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-464-tpVjFtxgPfaFp_985NkvEg-1; Tue, 09 Jun 2020 07:07:39 -0400
X-MC-Unique: tpVjFtxgPfaFp_985NkvEg-1
Received: by mail-wm1-f69.google.com with SMTP id g84so603692wmf.4
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jun 2020 04:07:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=9N2hQA54vscW2wYRbiWR3tdH19bd/eus87N3YlhQewI=;
 b=NISxwASh/2ajCNX5mM6UhUyH6YgvLZgLx3CMVAwoSPxIh0UXfIlUuwVMXCaKgKcVkb
 dFo2xZ4GZlDQcCOcUnKv2TJB/R8SHTZMtly+OOTUPY4cBatQH2TC4dyteheTPqj45WL8
 4pE03xH5MOyJFVkbLPbxecehn5PoZVguB60sKqbuHdcG7rk8V1k0Q2Fr1OsHzJYW7sCi
 eH6BrDTEo7lOJFWKTJlZ22ifxa5cazVGMAVtodjuR2KVdTug6phyh5CZtVb0EjDdFQiE
 j1pp3D//EcYK9g+hT4aT9FSXvdXUP8GhPTCI7I5llO8pcQEqcnMpl1Wm7zzON3mSUctI
 GJ0A==
X-Gm-Message-State: AOAM532879POp5ybhgha3ceeGZpwjyEtA0FyPRfkKczKmJ2Efx7JWM/C
 Z1alTFhpvA348DP3pk8E/izmFgHGHhmYfpSRY9unKzOclA4Jnp8gHpvVUZvxoIjJgcGo2w5IzT/
 2vwAnvKKuybQpEDEnvgFhyOKLA+U=
X-Received: by 2002:a1c:bad7:: with SMTP id k206mr3381152wmf.11.1591700858709; 
 Tue, 09 Jun 2020 04:07:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxmmnUl8eLPhmEPFuKu6sJiacZuSMv+9NuEpBWzXhQnd/T9N7bfObZmAohH0mdSOoMNNOmGLw==
X-Received: by 2002:a1c:bad7:: with SMTP id k206mr3381101wmf.11.1591700858431; 
 Tue, 09 Jun 2020 04:07:38 -0700 (PDT)
Received: from [192.168.178.58] ([151.21.172.168])
 by smtp.gmail.com with ESMTPSA id s8sm3061694wrm.96.2020.06.09.04.07.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Jun 2020 04:07:37 -0700 (PDT)
Subject: Re: [RFC PATCH 17/35] hw/input/pckbd: Emit warning when old code is
 used
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20200608160044.15531-1-philmd@redhat.com>
 <20200608160044.15531-18-philmd@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <eaa0d68f-bad7-506e-d95f-5a3da2baa180@redhat.com>
Date: Tue, 9 Jun 2020 13:07:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200608160044.15531-18-philmd@redhat.com>
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
>  hw/input/pckbd.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/input/pckbd.c b/hw/input/pckbd.c
> index 60a4130320..c7f42be63b 100644
> --- a/hw/input/pckbd.c
> +++ b/hw/input/pckbd.c
> @@ -31,7 +31,7 @@
>  #include "hw/input/i8042.h"
>  #include "sysemu/reset.h"
>  #include "sysemu/runstate.h"
> -
> +#include "hw/qdev-deprecated.h"
>  #include "trace.h"
>  
>  /*	Keyboard Controller Commands */
> @@ -467,6 +467,8 @@ void i8042_mm_init(qemu_irq kbd_irq, qemu_irq mouse_irq,
>  {
>      KBDState *s = g_malloc0(sizeof(KBDState));
>  
> +    qdev_warn_deprecated_function_used();
> +
>      s->irq_kbd = kbd_irq;
>      s->irq_mouse = mouse_irq;
>      s->mask = mask;
> 

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>

The ISA variant is QOM-ified, but you placed the warning in the right place.

Paolo


