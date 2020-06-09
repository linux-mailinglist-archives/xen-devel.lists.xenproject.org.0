Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DD59E1F38F9
	for <lists+xen-devel@lfdr.de>; Tue,  9 Jun 2020 13:05:32 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jic4K-0002Aj-0S; Tue, 09 Jun 2020 11:05:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HrVd=7W=redhat.com=pbonzini@srs-us1.protection.inumbo.net>)
 id 1jic4I-0002Aa-Tb
 for xen-devel@lists.xenproject.org; Tue, 09 Jun 2020 11:05:22 +0000
X-Inumbo-ID: 1c93a154-aa41-11ea-b7bb-bc764e2007e4
Received: from us-smtp-delivery-1.mimecast.com (unknown [207.211.31.120])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 1c93a154-aa41-11ea-b7bb-bc764e2007e4;
 Tue, 09 Jun 2020 11:05:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591700721;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=S4OQhSEiQViO6+Bf5ntoxU/3fnBLGSIOBfTZnNbLbrw=;
 b=X75r9BtyBLTrJpkTe713Vj9hTVP42JGGOewHFSP0/1SD9gU9BCJvvGSTAVOx7oqmD0zzhh
 qkGtr5AjR7TCxx0MtNNOh4v0nKqitBYtmaIQDNUA0UiG3fvQgEu0it8NWGMvTeZ79H2qwv
 5gz2qTAqr1APjvAqD2BoOghsl5czW3g=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-215-ylBPv5FRN6SvS2fsOLlZGQ-1; Tue, 09 Jun 2020 07:05:14 -0400
X-MC-Unique: ylBPv5FRN6SvS2fsOLlZGQ-1
Received: by mail-wr1-f72.google.com with SMTP id f4so8472803wrp.21
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jun 2020 04:05:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=S4OQhSEiQViO6+Bf5ntoxU/3fnBLGSIOBfTZnNbLbrw=;
 b=dEPpbVaJQ6lDaVEbrWSwXpa4FV8mdf7gGKG0dewH39VyXNEGzUtZJpd5J4hVMnd+vY
 EIr0L9Ek/LzQygPusJdlNLjteNLeEDvtUJbTrQnXrysH4GetZW7pOoBV0mN44jEylCTD
 gifEQfUfbGViMRwFDKTDkzwjERoWmEICPWKtgAUwjN7CMhgH6n+dJym7B9aS3dgFrAUv
 dr0CBhRDNmwK82hCmW9ndZj70iCh2ErN0PGLzf66o7Ges5j+eCAJnA0thzbPrCacvaMY
 tNOOdcR+1ECjdG0XMqU2ygcqmSRRNQngFWrruROMCQdoKamQ7D27H9oFhazJJra+LtIx
 dIUg==
X-Gm-Message-State: AOAM531qvF5PMn4b772Kxfb3MEXJxbtvp/7ICGvHmO2bAGs/bf4/Blwx
 Y5S0bcZ6o5ezJVOHCCQ+h0ZHRk91lqg6ljFtE/H55sxRKJZX7w1znSmRU4VpS+6Z3AZiTslRNGP
 73AJggU+SBscfDWr7+VemvMrW/cg=
X-Received: by 2002:adf:ef83:: with SMTP id d3mr3590968wro.145.1591700713618; 
 Tue, 09 Jun 2020 04:05:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJypMcVAQwaW/I6vICjH3pnYoVeg7kiHWBRxB9LtVfTU1+Z7wL7jJgUZk4SDqi6hRzq7g/7iig==
X-Received: by 2002:adf:ef83:: with SMTP id d3mr3590931wro.145.1591700713378; 
 Tue, 09 Jun 2020 04:05:13 -0700 (PDT)
Received: from [192.168.178.58] ([151.21.172.168])
 by smtp.gmail.com with ESMTPSA id u7sm2957241wrm.23.2020.06.09.04.05.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Jun 2020 04:05:12 -0700 (PDT)
Subject: Re: [RFC PATCH 23/35] hw/misc/applesmc: Emit warning when old code is
 used
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20200608160044.15531-1-philmd@redhat.com>
 <20200608160044.15531-24-philmd@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <ac20d382-3ac3-5c29-8e1e-e3ba1d424138@redhat.com>
Date: Tue, 9 Jun 2020 13:05:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200608160044.15531-24-philmd@redhat.com>
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
>  hw/misc/applesmc.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/hw/misc/applesmc.c b/hw/misc/applesmc.c
> index 1c4addb201..d63f19038d 100644
> --- a/hw/misc/applesmc.c
> +++ b/hw/misc/applesmc.c
> @@ -36,6 +36,7 @@
>  #include "ui/console.h"
>  #include "qemu/module.h"
>  #include "qemu/timer.h"
> +#include "hw/qdev-deprecated.h"
>  
>  /* #define DEBUG_SMC */
>  
> @@ -253,6 +254,8 @@ static void applesmc_add_key(AppleSMCState *s, const char *key,
>  {
>      struct AppleSMCData *def;
>  
> +    qdev_warn_deprecated_function_used();
> +
>      def = g_malloc0(sizeof(struct AppleSMCData));
>      def->key = key;
>      def->len = len;
> 

This one is okay.

Paolo


