Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6245526C56B
	for <lists+xen-devel@lfdr.de>; Wed, 16 Sep 2020 18:56:39 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kIair-0007tM-Hs; Wed, 16 Sep 2020 16:55:57 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=o9Fb=CZ=redhat.com=pbonzini@srs-us1.protection.inumbo.net>)
 id 1kIaip-0007tH-OJ
 for xen-devel@lists.xenproject.org; Wed, 16 Sep 2020 16:55:56 +0000
X-Inumbo-ID: aebf3c66-c61c-40a0-80f9-45b3e4c6cd16
Received: from us-smtp-1.mimecast.com (unknown [207.211.31.81])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id aebf3c66-c61c-40a0-80f9-45b3e4c6cd16;
 Wed, 16 Sep 2020 16:55:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600275353;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3sYm1l5EYSHhjLYsHCWeMbwuD9LSZQ5+tMb8TWqnxYY=;
 b=iIVc3GQJQHNvPcrqIZKFUBSXvB11tr18lsBg2SVx+TCNw+qbrgUzrjCI32nAgHBO3kap+7
 XyHFvLgdwElX/ChCtmnpVp7OwfDK3R4qHTR5lbpHwa0VGwHvoynk6UCN/9XsGt1xi3mn+O
 coR3uU9Uy9i/b2fZRx5flmZEqZhxHS8=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-481-bKow-nFRNwejxRbSItUc2g-1; Wed, 16 Sep 2020 12:55:51 -0400
X-MC-Unique: bKow-nFRNwejxRbSItUc2g-1
Received: by mail-wr1-f71.google.com with SMTP id g6so2799939wrv.3
 for <xen-devel@lists.xenproject.org>; Wed, 16 Sep 2020 09:55:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=3sYm1l5EYSHhjLYsHCWeMbwuD9LSZQ5+tMb8TWqnxYY=;
 b=jMxgIsBweNxXfXdelQZlWIgEyfJyyXKQ84Sm4Ix2HQfHOksHkveRDyieQMVSvn9//Z
 diiKTL2Y3DUShFteg15So8h6g48mN2c3GV/IAaIz6TQ6HUHm8f33h1qh9f9H06pktKVy
 Mf5dm69Lu0GFh/Vm55MZIbqH7eEJocuF1LNx3lTGn7BT4Rqtl9gqahCtUiIh40WWcyto
 MTXE3QN5/E9DpSN7k3SIhfgdm+51LiPPe5cCBRkVJbuOyZXKaAjz43kMEMf4ghpHf2hc
 neK1z182TIf4YDYrkjJcteV2ZZeaFb1c0ENu7miHQo1dgUtcdyPU93TWAfMBipSPrf0x
 8U4Q==
X-Gm-Message-State: AOAM532SiwWKf9vueoEiXtcdzXlJSgLQy/v0Y8zgsXBqBjb00aLVmZYz
 CjaaDB8WhWbOqDoZPe5mri02a0D4SQdZOmFdCjU4+fo4tuLSZlO6wk5To7fpeG4/B/FMvAK4AYc
 2G3iHzAaCFr/SwT2aUvdz3C8blAQ=
X-Received: by 2002:a1c:678a:: with SMTP id b132mr6025773wmc.10.1600275350220; 
 Wed, 16 Sep 2020 09:55:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx87Hr/v2p/Un8UOkycLUHO0a8boSP7Qjrz9rywcUGZfeW+IRU6rmRdRvv4Fk5+PaakyKEIyg==
X-Received: by 2002:a1c:678a:: with SMTP id b132mr6025753wmc.10.1600275349971; 
 Wed, 16 Sep 2020 09:55:49 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:cf8e:a9a0:1aed:9a37?
 ([2001:b07:6468:f312:cf8e:a9a0:1aed:9a37])
 by smtp.gmail.com with ESMTPSA id n66sm6539991wmb.35.2020.09.16.09.55.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Sep 2020 09:55:49 -0700 (PDT)
Subject: Re: [PATCH-for-5.2] hw/i386/q35: Remove unreachable Xen code on Q35
 machine
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Paul Durrant <paul@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Richard Henderson <rth@twiddle.net>,
 Anthony Perard <anthony.perard@citrix.com>
References: <20200722082517.18708-1-philmd@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <4a921f1b-b559-6c0c-641b-4451ae3ec479@redhat.com>
Date: Wed, 16 Sep 2020 18:55:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200722082517.18708-1-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 22/07/20 10:25, Philippe Mathieu-Daudé wrote:
> Xen accelerator requires specific changes to a machine to be able
> to use it. See for example the 'Xen PC' machine configure its PCI
> bus calling pc_xen_hvm_init_pci(). There is no 'Xen Q35' machine
> declared. This code was probably added while introducing the Q35
> machine, based on the existing PC machine (see commit df2d8b3ed4
> "Introduce q35 pc based chipset emulator"). Remove the unreachable
> code to simplify this file.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  hw/i386/pc_q35.c | 13 ++-----------
>  1 file changed, 2 insertions(+), 11 deletions(-)
> 
> diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
> index a3e607a544..12f5934241 100644
> --- a/hw/i386/pc_q35.c
> +++ b/hw/i386/pc_q35.c
> @@ -34,9 +34,7 @@
>  #include "sysemu/arch_init.h"
>  #include "hw/i2c/smbus_eeprom.h"
>  #include "hw/rtc/mc146818rtc.h"
> -#include "hw/xen/xen.h"
>  #include "sysemu/kvm.h"
> -#include "sysemu/xen.h"
>  #include "hw/kvm/clock.h"
>  #include "hw/pci-host/q35.h"
>  #include "hw/qdev-properties.h"
> @@ -179,10 +177,6 @@ static void pc_q35_init(MachineState *machine)
>          x86ms->below_4g_mem_size = machine->ram_size;
>      }
>  
> -    if (xen_enabled()) {
> -        xen_hvm_init(pcms, &ram_memory);
> -    }
> -
>      x86_cpus_init(x86ms, pcmc->default_cpu_version);
>  
>      kvmclock_create();
> @@ -208,10 +202,7 @@ static void pc_q35_init(MachineState *machine)
>      }
>  
>      /* allocate ram and load rom/bios */
> -    if (!xen_enabled()) {
> -        pc_memory_init(pcms, get_system_memory(),
> -                       rom_memory, &ram_memory);
> -    }
> +    pc_memory_init(pcms, get_system_memory(), rom_memory, &ram_memory);
>  
>      /* create pci host bus */
>      q35_host = Q35_HOST_DEVICE(qdev_new(TYPE_Q35_HOST_DEVICE));
> @@ -271,7 +262,7 @@ static void pc_q35_init(MachineState *machine)
>  
>      assert(pcms->vmport != ON_OFF_AUTO__MAX);
>      if (pcms->vmport == ON_OFF_AUTO_AUTO) {
> -        pcms->vmport = xen_enabled() ? ON_OFF_AUTO_OFF : ON_OFF_AUTO_ON;
> +        pcms->vmport = ON_OFF_AUTO_ON;
>      }
>  
>      /* init basic PC hardware */
> 

Queued, thanks.

Paolo


