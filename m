Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 227181F3911
	for <lists+xen-devel@lfdr.de>; Tue,  9 Jun 2020 13:10:33 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jic99-0003N5-Sc; Tue, 09 Jun 2020 11:10:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HrVd=7W=redhat.com=pbonzini@srs-us1.protection.inumbo.net>)
 id 1jic97-0003Ky-Tw
 for xen-devel@lists.xenproject.org; Tue, 09 Jun 2020 11:10:21 +0000
X-Inumbo-ID: cd73d46c-aa41-11ea-bca7-bc764e2007e4
Received: from us-smtp-delivery-1.mimecast.com (unknown [205.139.110.120])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id cd73d46c-aa41-11ea-bca7-bc764e2007e4;
 Tue, 09 Jun 2020 11:10:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591701018;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tZftxcB2LQwq4WRu0Cjx9f/yr0m/a27AoJYbbnSzCMU=;
 b=Kwefb0LRlbEQcRj2IBWLkd9O79JWoTrISYk5e8bUuhm5j4IQ4KzSkhymJzkZzHE0jH/p13
 hwfUavdw4IRe4iwMQzW4a62oV56OXGAQXpUMxxlwelO/sQgPq0uU1MuBncE9GUqbFUPkBA
 QmgzrzEgH+1XMTgEXhXwMckjn8Rvlx0=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-218-6wpZAdFrOHe73l81htPEog-1; Tue, 09 Jun 2020 07:10:14 -0400
X-MC-Unique: 6wpZAdFrOHe73l81htPEog-1
Received: by mail-wm1-f70.google.com with SMTP id k185so521717wme.8
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jun 2020 04:10:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=tZftxcB2LQwq4WRu0Cjx9f/yr0m/a27AoJYbbnSzCMU=;
 b=jViJiRhK/DMIihBnQJZINF97kqPLkWXOKFKlTqyjRjzIhXuvJZn5YoyvvsDPZYhxrk
 eOeFAkU9M1IT7QzrFpHovhzot8wZXVNL5iGmDkfUXLoEDZ/YI11b12GbBBshWLe2MXhp
 qXS504avDy32fyqX8i9PVJw+9RP06ba8GuMY/wpfkA3SZoCXoiJNlxLEpXIel8L8pHsk
 YqXFubBNYRx0BQZ11P2IzlFzNc7+CeA7GoVRAa39seibJywkgJQkaS0+EsQxTYTdw0J4
 BIU69+futwS9VHioZiKFGmOqozf/Z+U0cqddUMMEnCDbZQKcgW5mtVyqAJzkkCYO7JxU
 nLhg==
X-Gm-Message-State: AOAM531xo+1V1oHCFrHajcLap5pCLuQZMJog8FrJamkx//Gi5gzoYUCP
 Uns6ZtxdQIUvMSc50anZQuFuPk00qQJc8bYtLhcBN2lLMfIw3uCsoRbk+dmxR9PXHJTg/I2ssJ3
 Mp7ryN22cy3E27L3YbVe0F1Nko5E=
X-Received: by 2002:a1c:4e17:: with SMTP id g23mr3355931wmh.38.1591701013436; 
 Tue, 09 Jun 2020 04:10:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzJZned0l+0SRbEeJRfGrfGSK0dv05DsTiejFW4ozxbhJOZqse/JM2i7IzQrf8+3BqinX/VGQ==
X-Received: by 2002:a1c:4e17:: with SMTP id g23mr3355899wmh.38.1591701013164; 
 Tue, 09 Jun 2020 04:10:13 -0700 (PDT)
Received: from [192.168.178.58] ([151.21.172.168])
 by smtp.gmail.com with ESMTPSA id b8sm2981236wrm.35.2020.06.09.04.10.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Jun 2020 04:10:12 -0700 (PDT)
Subject: Re: [RFC PATCH 06/35] hw/timer/arm_timer: Emit warning when old code
 is used
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20200608160044.15531-1-philmd@redhat.com>
 <20200608160044.15531-7-philmd@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <57ccbbbb-2462-7ae3-52f4-c209a21795cd@redhat.com>
Date: Tue, 9 Jun 2020 13:10:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200608160044.15531-7-philmd@redhat.com>
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
>  hw/timer/arm_timer.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/hw/timer/arm_timer.c b/hw/timer/arm_timer.c
> index 9607366d78..e23e6b4b31 100644
> --- a/hw/timer/arm_timer.c
> +++ b/hw/timer/arm_timer.c
> @@ -16,6 +16,7 @@
>  #include "hw/qdev-properties.h"
>  #include "qemu/module.h"
>  #include "qemu/log.h"
> +#include "hw/qdev-deprecated.h"
>  
>  /* Common timer implementation.  */
>  
> @@ -175,6 +176,8 @@ static arm_timer_state *arm_timer_init(uint32_t freq)
>  {
>      arm_timer_state *s;
>  
> +    qdev_warn_deprecated_function_used();
> +
>      s = (arm_timer_state *)g_malloc0(sizeof(arm_timer_state));
>      s->freq = freq;
>      s->control = TIMER_CTRL_IE;
> 

This one is okay, the devices that use arm_timer_init are all QOM.

Paolo


