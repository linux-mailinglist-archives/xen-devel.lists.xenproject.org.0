Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA1991F38FD
	for <lists+xen-devel@lfdr.de>; Tue,  9 Jun 2020 13:07:14 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jic5u-0002Mq-C1; Tue, 09 Jun 2020 11:07:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HrVd=7W=redhat.com=pbonzini@srs-us1.protection.inumbo.net>)
 id 1jic5s-0002Mk-96
 for xen-devel@lists.xenproject.org; Tue, 09 Jun 2020 11:07:00 +0000
X-Inumbo-ID: 56d326dc-aa41-11ea-b7bb-bc764e2007e4
Received: from us-smtp-delivery-1.mimecast.com (unknown [205.139.110.61])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 56d326dc-aa41-11ea-b7bb-bc764e2007e4;
 Tue, 09 Jun 2020 11:06:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591700819;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HLtEn6u9uzHwCvd1JnB+QPNLdle/XjOro9YfrFmD+kg=;
 b=JtxmvSONAsm6XhHv31D6eIqHUVVF/KPH3pV0JakH8lAi3REA4U6NlrDxsYz59Y5f+zRRTv
 Qrg2mehFAk5eLmR6koKhkSmbpwFkKm+Q7rzBzTtnwWKzZlFGLlqiZNCM9IgRP22c4MnyS8
 c4XHCKSWTokWVBtBjMPj4lQm/tBGsS4=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-490-RAyjCSOpPuqjbUVWrJr-vQ-1; Tue, 09 Jun 2020 07:06:57 -0400
X-MC-Unique: RAyjCSOpPuqjbUVWrJr-vQ-1
Received: by mail-wm1-f70.google.com with SMTP id k185so518376wme.8
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jun 2020 04:06:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=HLtEn6u9uzHwCvd1JnB+QPNLdle/XjOro9YfrFmD+kg=;
 b=Mm2cKBhrlcU8mm78hMzZ/e1o/Vc/ZDV2nZryE9rfVfSfsNG8ACPTq979jJBvoEn0+x
 uYP3kyk+DzpClOvmzPALRz9dKyCmE06VDyc10b6FZH+P0y9va0c5ghuCmV4fUQjd7/hY
 Ea3WrVs//6dYBY9W8/CsoQYan+qASilsoZfKNcG4CnBaHZmwUAEkU2TDSONNBmzIJ/uB
 qo+Wd5jRhcTo38VkVKw3WaWsWdw1VplMDkW6hDH1gi2CgAA4302mjI16Zj3YcemdT3rz
 Rd5Jul2OaMc9Brzv4WVyWobjghnCEGAU8/9q+oWeOP/iizI5uEpyEcKFZSD5VymX/7VK
 XX8w==
X-Gm-Message-State: AOAM533MVB8b+Db8xHsmPKzHLpqXnva4czBqFmNiBv4YPr3S+yyHJlvL
 s8ceN8YX1fKj5ElfG5kkeBZxKB2xJuBWp+xh606dFDV+K/gu0fcQRR9kHAcopqU0gaBtoFjaSZr
 0ZrXjEyqk1m74GuquWOxo7EOrSZs=
X-Received: by 2002:adf:e648:: with SMTP id b8mr3979236wrn.386.1591700816417; 
 Tue, 09 Jun 2020 04:06:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxwoEAqomO/pDUWsIe68Vfly9NVZSlhu3lj0ZH+nYvBwJM+baKNFuGqYNGT83VHTTt9pGx/hA==
X-Received: by 2002:adf:e648:: with SMTP id b8mr3979198wrn.386.1591700816219; 
 Tue, 09 Jun 2020 04:06:56 -0700 (PDT)
Received: from [192.168.178.58] ([151.21.172.168])
 by smtp.gmail.com with ESMTPSA id q5sm2976228wrm.62.2020.06.09.04.06.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Jun 2020 04:06:55 -0700 (PDT)
Subject: Re: [RFC PATCH 18/35] hw/input/ps2: Emit warning when old code is used
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20200608160044.15531-1-philmd@redhat.com>
 <20200608160044.15531-19-philmd@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <f5e33299-a8b0-8530-c8d2-4d130291722c@redhat.com>
Date: Tue, 9 Jun 2020 13:06:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200608160044.15531-19-philmd@redhat.com>
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
>  hw/input/ps2.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/input/ps2.c b/hw/input/ps2.c
> index f8746d2f52..0d84061cae 100644
> --- a/hw/input/ps2.c
> +++ b/hw/input/ps2.c
> @@ -30,7 +30,7 @@
>  #include "ui/input.h"
>  #include "sysemu/reset.h"
>  #include "sysemu/runstate.h"
> -
> +#include "hw/qdev-deprecated.h"
>  #include "trace.h"
>  
>  /* debug PC keyboard */
> @@ -1136,6 +1136,8 @@ void *ps2_kbd_init(void (*update_irq)(void *, int), void *update_arg)
>  {
>      PS2KbdState *s = (PS2KbdState *)g_malloc0(sizeof(PS2KbdState));
>  
> +    qdev_warn_deprecated_function_used();
> +
>      trace_ps2_kbd_init(s);
>      s->common.update_irq = update_irq;
>      s->common.update_arg = update_arg;
> @@ -1158,6 +1160,8 @@ void *ps2_mouse_init(void (*update_irq)(void *, int), void *update_arg)
>  {
>      PS2MouseState *s = (PS2MouseState *)g_malloc0(sizeof(PS2MouseState));
>  
> +    qdev_warn_deprecated_function_used();
> +
>      trace_ps2_mouse_init(s);
>      s->common.update_irq = update_irq;
>      s->common.update_arg = update_arg;
> 

While the keyboard and mouse are not QOM-ified, of the controllers
(i8042, lasips2, pl050) only lasips2 is not.  I would warn there.

Paolo


