Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 320C61F392C
	for <lists+xen-devel@lfdr.de>; Tue,  9 Jun 2020 13:12:36 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jicB5-0003pF-3B; Tue, 09 Jun 2020 11:12:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HrVd=7W=redhat.com=pbonzini@srs-us1.protection.inumbo.net>)
 id 1jicB3-0003p7-Hu
 for xen-devel@lists.xenproject.org; Tue, 09 Jun 2020 11:12:21 +0000
X-Inumbo-ID: 1692cdba-aa42-11ea-bca7-bc764e2007e4
Received: from us-smtp-delivery-1.mimecast.com (unknown [205.139.110.61])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 1692cdba-aa42-11ea-bca7-bc764e2007e4;
 Tue, 09 Jun 2020 11:12:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591701141;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=l4X2TCEtUozOLaXo/L8sScbontTQvUPvWMYmEeL8dy0=;
 b=ae0TnIQG62Gq7LjIYeArcLFlWzm75OBJp88b7BHEWevKk7EGRO1LbTnWnl+SH8hPSJVX8H
 YkEeMhYn9NEdSJHZdXFatlIRERQOwPUqApONZXJLR+2oiA/f4Vs5iHPxYCwOsvJ2Jf1jMs
 n3JloEgmlmeCiwf6MER7AXTQUjehbOs=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-482-Tc3IAPUlPgqnLlGtU6hkGA-1; Tue, 09 Jun 2020 07:12:19 -0400
X-MC-Unique: Tc3IAPUlPgqnLlGtU6hkGA-1
Received: by mail-wm1-f70.google.com with SMTP id a7so532523wmf.1
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jun 2020 04:12:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=l4X2TCEtUozOLaXo/L8sScbontTQvUPvWMYmEeL8dy0=;
 b=P1RRfwKlrp5QRNfFszMsFydq4dSnUZYdyoouZZr0bzr3p1caNK1dtwUeSCv7dwKNRJ
 vRC7bVEsH5ezXtFvTvYGEZiZnEYIK4LXHVGpacQrv+Y61myyLETlxGe327W4GZgbasGT
 N5zI+ISQ2kFNTgMTU+96OKgxn2TF1nQf2ItNaaHQJQxtbQfoqUiHkTrBQU0E7ZXN0CYE
 GvnHt+ATS/EcKeDYXREp9V8ABMxTlzI9q1eEcJd4sswgaZLVfMuKbi+DdOk8upLalDbe
 Uk3uAhf0oQSiqwKOfW0xnahlbgBwBGRvTmukVst132YwPAE+pU5Ci6G47zR/RnsXBq0V
 E+2g==
X-Gm-Message-State: AOAM532OfAfvqHfRL2qHtbRVGAbIrLemrekc+pO/8vKbbmpjZAjUqAyk
 vF3f2SgAZu9zfYP1A+qxFOYDRLa8QM03WGoYKFSt/uyNXY15K0RJdO8ILlMBJM17+OV598O37Cl
 dKzJ6/YIyhqzKJY/iCoGiERkjF+s=
X-Received: by 2002:a05:600c:4102:: with SMTP id
 j2mr3433716wmi.48.1591701138459; 
 Tue, 09 Jun 2020 04:12:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy0awk5HkX0L04n6QbPdprXKsckBJOO0WwKyuM0S0l/M/wQqyP9e9ViVkr5nd7Ja+7n12153w==
X-Received: by 2002:a05:600c:4102:: with SMTP id
 j2mr3433671wmi.48.1591701138230; 
 Tue, 09 Jun 2020 04:12:18 -0700 (PDT)
Received: from [192.168.178.58] ([151.21.172.168])
 by smtp.gmail.com with ESMTPSA id o18sm2614689wme.19.2020.06.09.04.12.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Jun 2020 04:12:17 -0700 (PDT)
Subject: Re: [RFC PATCH 30/35] hw/ppc/virtex_ml507: Emit warning when old code
 is used
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20200608160044.15531-1-philmd@redhat.com>
 <20200608160044.15531-31-philmd@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <85d75dcd-f08c-0506-46ee-97e2b5869e0b@redhat.com>
Date: Tue, 9 Jun 2020 13:12:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200608160044.15531-31-philmd@redhat.com>
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
>  hw/ppc/virtex_ml507.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/ppc/virtex_ml507.c b/hw/ppc/virtex_ml507.c
> index 0dacfcd236..17b8036c38 100644
> --- a/hw/ppc/virtex_ml507.c
> +++ b/hw/ppc/virtex_ml507.c
> @@ -40,7 +40,7 @@
>  #include "qemu/log.h"
>  #include "qemu/option.h"
>  #include "exec/address-spaces.h"
> -
> +#include "hw/qdev-deprecated.h"
>  #include "hw/ppc/ppc.h"
>  #include "hw/ppc/ppc4xx.h"
>  #include "hw/qdev-properties.h"
> @@ -95,6 +95,8 @@ static PowerPCCPU *ppc440_init_xilinx(const char *cpu_type, uint32_t sysclk)
>      CPUPPCState *env;
>      qemu_irq *irqs;
>  
> +    qdev_warn_deprecated_function_used();
> +
>      cpu = POWERPC_CPU(cpu_create(cpu_type));
>      env = &cpu->env;
>  
> 

This one is okay.

Paolo


