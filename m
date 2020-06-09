Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E30081F391D
	for <lists+xen-devel@lfdr.de>; Tue,  9 Jun 2020 13:11:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jic9Y-0003Sx-Fl; Tue, 09 Jun 2020 11:10:48 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HrVd=7W=redhat.com=pbonzini@srs-us1.protection.inumbo.net>)
 id 1jic9X-0003SF-1d
 for xen-devel@lists.xenproject.org; Tue, 09 Jun 2020 11:10:47 +0000
X-Inumbo-ID: de26ac94-aa41-11ea-b30b-12813bfff9fa
Received: from us-smtp-1.mimecast.com (unknown [207.211.31.120])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id de26ac94-aa41-11ea-b30b-12813bfff9fa;
 Tue, 09 Jun 2020 11:10:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591701046;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TysuOc5GXylf1UUaen/G81fkeOnuEfcp2+jvnmZ+bCw=;
 b=GaEw5OKblin3Wfa203BH+/tlsxjxq/fqyNohbanzKGVp1hrWOCvG5Lfp30KG+rIPuKwC9R
 wkCzWoR/zk9nTeAbRNakJ3xgpwEqtai9jxFkaC4DljG79wI4wySR9HpwT5+wMlxumwm7Xp
 jpeaXaXcdJ9lPJhRt6Ujse0i2f00/As=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-151-CeCzEunOOqqNq2mTzVpXkQ-1; Tue, 09 Jun 2020 07:10:43 -0400
X-MC-Unique: CeCzEunOOqqNq2mTzVpXkQ-1
Received: by mail-wm1-f69.google.com with SMTP id p24so608557wmc.1
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jun 2020 04:10:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=TysuOc5GXylf1UUaen/G81fkeOnuEfcp2+jvnmZ+bCw=;
 b=LFi3p2ytY3rxNMkSJOD4XqQTSIdOpdoIKS3baFZdoL+HF2zz8lIrV9gSFSE+5ovqqV
 lUejEZlYQ/2eKahcue031pwCY067k/xIel9f8CtSzARoxafxuKRmGsHYiaU901Zwiux8
 Ye0hmRvbVupy7SsC9lzKAdk1QWTxAUtKcHFFvgpIGe6CVdBHi8HWPj5Pc5V2qQXAQxBl
 5AZncOI0xaZXqbpTZ86LRYz32350Ve3XgAr0v4bsKAn7SIiBq2GYt3hooPrKRgOANqsV
 oN7gVW07PeVVDiYnJm7EonRIqO60/l8Z+bm/rB75uFLUB2/hwBquOsGgWXd0s5wOGuEf
 p9EA==
X-Gm-Message-State: AOAM531MovhQ/viLbilx3Jqs914394ieQlA3KtyOHSvG+gwo1BgmrpTo
 x/Q02QSdfblhh99gX+ALwDps8/Bi+1wobxiM8du7dwVi523Uohn35RHK2gUCKjyyyFdDWZiy4Mj
 vHQjaCOrS2cn48OWVFoaeUGIqss4=
X-Received: by 2002:a7b:cb91:: with SMTP id m17mr3627182wmi.126.1591701042664; 
 Tue, 09 Jun 2020 04:10:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzYXhhkklLh5/jP4wI4AWv8kJypOFv0T2ku7XSwlUIkFk2HE1PSObyt3ACvqwUvh1wPJYEGWA==
X-Received: by 2002:a7b:cb91:: with SMTP id m17mr3627155wmi.126.1591701042347; 
 Tue, 09 Jun 2020 04:10:42 -0700 (PDT)
Received: from [192.168.178.58] ([151.21.172.168])
 by smtp.gmail.com with ESMTPSA id q1sm2521908wmc.15.2020.06.09.04.10.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Jun 2020 04:10:41 -0700 (PDT)
Subject: Re: [RFC PATCH 20/35] hw/intc/i8259: Emit warning when old code is
 used
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20200608160044.15531-1-philmd@redhat.com>
 <20200608160044.15531-21-philmd@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <71b5e461-88f6-eab2-f46a-e8aa4783debd@redhat.com>
Date: Tue, 9 Jun 2020 13:10:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200608160044.15531-21-philmd@redhat.com>
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
>  hw/intc/i8259.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/hw/intc/i8259.c b/hw/intc/i8259.c
> index 51b27f6a34..9d9609cdab 100644
> --- a/hw/intc/i8259.c
> +++ b/hw/intc/i8259.c
> @@ -30,6 +30,7 @@
>  #include "qemu/log.h"
>  #include "hw/isa/i8259_internal.h"
>  #include "trace.h"
> +#include "hw/qdev-deprecated.h"
>  
>  /* debug PIC */
>  //#define DEBUG_PIC
> @@ -414,6 +415,8 @@ qemu_irq *i8259_init(ISABus *bus, qemu_irq parent_irq)
>      ISADevice *isadev;
>      int i;
>  
> +    qdev_warn_deprecated_function_used();
> +
>      irq_set = g_new0(qemu_irq, ISA_NUM_IRQS);
>  
>      isadev = i8259_init_chip(TYPE_I8259, bus, true);
> 

This one is okay too.

Paolo


