Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F9A830A60C
	for <lists+xen-devel@lfdr.de>; Mon,  1 Feb 2021 12:00:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.79746.145199 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6Ww3-0007X4-Eg; Mon, 01 Feb 2021 10:59:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 79746.145199; Mon, 01 Feb 2021 10:59:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6Ww3-0007Wc-BP; Mon, 01 Feb 2021 10:59:59 +0000
Received: by outflank-mailman (input) for mailman id 79746;
 Mon, 01 Feb 2021 10:59:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jUbX=HD=gmail.com=philippe.mathieu.daude@srs-us1.protection.inumbo.net>)
 id 1l6Ww2-0007WW-Jm
 for xen-devel@lists.xenproject.org; Mon, 01 Feb 2021 10:59:58 +0000
Received: from mail-wm1-x332.google.com (unknown [2a00:1450:4864:20::332])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 11be89a7-ad55-4b43-96e4-e83228935551;
 Mon, 01 Feb 2021 10:59:57 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id y187so12786279wmd.3
 for <xen-devel@lists.xenproject.org>; Mon, 01 Feb 2021 02:59:56 -0800 (PST)
Received: from [192.168.1.36] (7.red-83-57-171.dynamicip.rima-tde.net.
 [83.57.171.7])
 by smtp.gmail.com with ESMTPSA id o17sm26583745wrm.52.2021.02.01.02.59.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Feb 2021 02:59:55 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
X-Inumbo-ID: 11be89a7-ad55-4b43-96e4-e83228935551
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=KE6pn1XLuZ35zO3PqK0E652tTHU9fRPfHroHeNP+mqs=;
        b=k8M1PI5PBfrYYPekh/jrTDQwU/rOaxV2QKr0Hn6vWm+QG3GeFyY7H+sJuPhHsBw2wa
         wulgnY4lgkmywg979X9tkQveWnWgx4/Jt/qV+qMmZ1PsIoFXPINHPBTw/7m0rAnAMbMD
         T3ej0P6cCJYXUx9iIp5mCI3ID9Z8bI7r/t6BMgf2hxRoTtrCOF8Ng4IFTgHzylfKKBQO
         TRJllt+Ux3Fruw84BDcCZhFNvzDwKTQj3QkF3ahTxr+AHG+11xPZ4pW499AJ3AE9n8Mu
         HgS4B1h0wM1kGKL69Q/u3dzajqNgLUbGAsm7feYngoDKeSZ1cEHuuB38xbZp02SjJlvS
         PNIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=KE6pn1XLuZ35zO3PqK0E652tTHU9fRPfHroHeNP+mqs=;
        b=hHHL9Olv0KSSgLe1nkoYgdSZzKQBJ0v4vOx/2hxezbgJE8ivrw3kyK0uI0VdvR2wvE
         7RvK13WttQ9UtzOmFDmZHJf281krOzPmO34vfA7X3Rhy+oUfsYHCLLd7GneA3IprGcpE
         3TectrBR1isFb1Fxcv0Ip8ZEanTWvIrTyM6PIWSRQi9QH0XGy9pX2+jEBWC3IPJ4Oy9l
         0SEjgTSq3fYxW8wN9Xwssi+84rpW085RVEfNDzhWWxAeDPSsIiznoCs7uNmyYR3k1LmV
         7D9dcU0qAey/NlQCFP0xxE8AHQi5yRDheU61xSvCie+sCGkQpr3kEKIzbm3oRcH+DJ7r
         4NiQ==
X-Gm-Message-State: AOAM5309lIKeMBLMC63t4n3oALeBQw5AFA9V+IORvuVG/bfkFmalIUpg
	5cjfE5N8g5ikP9MIcT3fkAs=
X-Google-Smtp-Source: ABdhPJx1kGiUfZp6OECVM9HcEU2ro/EqkyZTE/nUfkUseg0RWzzAejKdnqSZZFYlYi0EmovqBovjXA==
X-Received: by 2002:a05:600c:4f07:: with SMTP id l7mr9122348wmq.111.1612177195926;
        Mon, 01 Feb 2021 02:59:55 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philippe.mathieu.daude@gmail.com>
Subject: Re: [PATCH v2 3/4] hw/xen/Kconfig: Introduce XEN_PV config
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Paul Durrant <paul@xen.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 xen-devel@lists.xenproject.org, Anthony Perard <anthony.perard@citrix.com>
References: <20210131141810.293186-1-f4bug@amsat.org>
 <20210131141810.293186-4-f4bug@amsat.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <d3ad42eb-42bd-2e63-4c99-8eed91216fc5@amsat.org>
Date: Mon, 1 Feb 2021 11:59:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210131141810.293186-4-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 1/31/21 3:18 PM, Philippe Mathieu-Daudé wrote:
> xenpv machine requires USB, IDE_PIIX and PCI:
> 
>   /usr/bin/ld:
>   libcommon.fa.p/hw_xen_xen-legacy-backend.c.o: in function `xen_be_register_common':
>   hw/xen/xen-legacy-backend.c:757: undefined reference to `xen_usb_ops'
>   libqemu-i386-softmmu.fa.p/hw_i386_xen_xen_platform.c.o: in function `unplug_disks':
>   hw/i386/xen/xen_platform.c:153: undefined reference to `pci_piix3_xen_ide_unplug'
>   libqemu-i386-softmmu.fa.p/hw_i386_xen_xen_platform.c.o: in function `pci_unplug_nics':
>   hw/i386/xen/xen_platform.c:137: undefined reference to `pci_for_each_device'
>   libqemu-i386-softmmu.fa.p/hw_i386_xen_xen_platform.c.o: in function `xen_platform_realize':
>   hw/i386/xen/xen_platform.c:483: undefined reference to `pci_register_bar'
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  hw/Kconfig     | 1 +
>  hw/xen/Kconfig | 7 +++++++
>  2 files changed, 8 insertions(+)
>  create mode 100644 hw/xen/Kconfig
> 
> diff --git a/hw/Kconfig b/hw/Kconfig
> index 5ad3c6b5a4b..f2a95591d94 100644
> --- a/hw/Kconfig
> +++ b/hw/Kconfig
> @@ -39,6 +39,7 @@ source usb/Kconfig
>  source virtio/Kconfig
>  source vfio/Kconfig
>  source watchdog/Kconfig
> +source xen/Kconfig
>  
>  # arch Kconfig
>  source arm/Kconfig
> diff --git a/hw/xen/Kconfig b/hw/xen/Kconfig
> new file mode 100644
> index 00000000000..0b8427d6bd1
> --- /dev/null
> +++ b/hw/xen/Kconfig
> @@ -0,0 +1,7 @@
> +config XEN_PV
> +    bool
> +    default y if XEN
> +    depends on XEN
> +    select PCI
> +    select USB
> +    select IDE_PIIX

Well this is not enough, --without-default-devices fails:

/usr/bin/ld: libqemu-x86_64-softmmu.fa.p/softmmu_physmem.c.o: in
function `cpu_physical_memory_set_dirty_range':
include/exec/ram_addr.h:333: undefined reference to
`xen_hvm_modified_memory'
/usr/bin/ld: libqemu-x86_64-softmmu.fa.p/softmmu_physmem.c.o: in
function `ram_block_add':
softmmu/physmem.c:1873: undefined reference to `xen_ram_alloc'
/usr/bin/ld: libqemu-x86_64-softmmu.fa.p/softmmu_physmem.c.o: in
function `cpu_physical_memory_set_dirty_range':
include/exec/ram_addr.h:333: undefined reference to
`xen_hvm_modified_memory'
/usr/bin/ld: include/exec/ram_addr.h:333: undefined reference to
`xen_hvm_modified_memory'
/usr/bin/ld: libqemu-x86_64-softmmu.fa.p/softmmu_memory.c.o: in function
`cpu_physical_memory_set_dirty_range':
include/exec/ram_addr.h:333: undefined reference to
`xen_hvm_modified_memory'
collect2: error: ld returned 1 exit status
ninja: build stopped: subcommand failed.

