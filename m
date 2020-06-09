Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B8861F392D
	for <lists+xen-devel@lfdr.de>; Tue,  9 Jun 2020 13:12:45 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jicBJ-0003rt-FH; Tue, 09 Jun 2020 11:12:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HrVd=7W=redhat.com=pbonzini@srs-us1.protection.inumbo.net>)
 id 1jicBI-0003rl-E5
 for xen-devel@lists.xenproject.org; Tue, 09 Jun 2020 11:12:36 +0000
X-Inumbo-ID: 1f6a1be6-aa42-11ea-bb8b-bc764e2007e4
Received: from us-smtp-1.mimecast.com (unknown [205.139.110.61])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 1f6a1be6-aa42-11ea-bb8b-bc764e2007e4;
 Tue, 09 Jun 2020 11:12:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591701155;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6lAgcTDN/dV/f7SK/NrjUs5/i9Qjg44Eo04qPw3cNtk=;
 b=ZX4ibfDnvSzi4fjxCeQlgN3ekJMGzJzBstjLOJgCpe0BF+qU7vGA5dh9RhIVKHVPPbpEWN
 9nD8eW1RXx4O0oTeqLeO1UrYOVLaVL5bmxV7xDm9ZFT8qghdvr10cxire9hJNwGaFed7mo
 6FbTUg1Cq4SE7fOcUiZ0eFURHLJHndE=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-108-ztb1v3rkMAa-kLAdiJ1xKw-1; Tue, 09 Jun 2020 07:12:32 -0400
X-MC-Unique: ztb1v3rkMAa-kLAdiJ1xKw-1
Received: by mail-wr1-f71.google.com with SMTP id l18so8531488wrm.0
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jun 2020 04:12:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=6lAgcTDN/dV/f7SK/NrjUs5/i9Qjg44Eo04qPw3cNtk=;
 b=fGEw/pDz+d6nXmzCFjsHaNdv+Ed3p5EMwdmBYAWgSfPuE4fI0WAqt4h9tufdLCd7uo
 qxkcGZRm+r+o4N1+A5xjCDZEzhlJr9bIAZ7QLZk+rkxOqQDs1BeRzYjC3cuP9f3UXnBX
 DcTGuoXg+2+k0hGrb93dXv78Ip24UobjQl8kGdcc+dPi/iZ9/qaP/Em/TyYi65RDEqfq
 I9v7Ywt19A4thxa/wO2CtmU6yDnvc9Ve0UlbcXPCkMhUWn708H8NPYM9sohDYpjMfe3p
 fP3zof80+sdiDshkxO0rf4CMH8apOV/TafGzkGOLX/0bpocBnIGlbgzIKmNc0gl7zjnC
 M6yA==
X-Gm-Message-State: AOAM533eujPEOlT6luWExuqTmBSek/7Dg8WPsgw8lfAwgTBcY98HmfWe
 NUb35zFyCAwIng4F1MAlwpHJVUBUJLZ+3u9ITawz4Lu97YGgXUId158TR5D/vIViaFfS0xRojhc
 XgsK/Iu6bSXKHmKRFJmTPcce2SiU=
X-Received: by 2002:a1c:a7c3:: with SMTP id q186mr3257031wme.141.1591701150721; 
 Tue, 09 Jun 2020 04:12:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwew58hVelVmOrF+efwHZuIRFPhx2tAfnSXNsxzJkV6M1Bdv9a4oEF967FsVILY6ztkPcXqaQ==
X-Received: by 2002:a1c:a7c3:: with SMTP id q186mr3256994wme.141.1591701150493; 
 Tue, 09 Jun 2020 04:12:30 -0700 (PDT)
Received: from [192.168.178.58] ([151.21.172.168])
 by smtp.gmail.com with ESMTPSA id u130sm2587221wmg.32.2020.06.09.04.12.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Jun 2020 04:12:29 -0700 (PDT)
Subject: Re: [RFC PATCH 29/35] hw/ppc/ppc_booke: Emit warning when old code is
 used
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20200608160044.15531-1-philmd@redhat.com>
 <20200608160044.15531-30-philmd@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <c932d51a-1b7d-bec3-5dfa-222c9ba5090e@redhat.com>
Date: Tue, 9 Jun 2020 13:12:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200608160044.15531-30-philmd@redhat.com>
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
>  hw/ppc/ppc_booke.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/ppc/ppc_booke.c b/hw/ppc/ppc_booke.c
> index 652a21b806..a9e5e68578 100644
> --- a/hw/ppc/ppc_booke.c
> +++ b/hw/ppc/ppc_booke.c
> @@ -31,7 +31,7 @@
>  #include "qemu/log.h"
>  #include "hw/loader.h"
>  #include "kvm_ppc.h"
> -
> +#include "hw/qdev-deprecated.h"
>  
>  /* Timer Control Register */
>  
> @@ -338,6 +338,8 @@ void ppc_booke_timers_init(PowerPCCPU *cpu, uint32_t freq, uint32_t flags)
>      booke_timer_t *booke_timer;
>      int ret = 0;
>  
> +    qdev_warn_deprecated_function_used();
> +
>      tb_env      = g_malloc0(sizeof(ppc_tb_t));
>      booke_timer = g_malloc0(sizeof(booke_timer_t));
>  
> 

This one is okay.

Paolo


