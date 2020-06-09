Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 42CC51F38F8
	for <lists+xen-devel@lfdr.de>; Tue,  9 Jun 2020 13:05:11 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jic3x-00027Q-In; Tue, 09 Jun 2020 11:05:01 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HrVd=7W=redhat.com=pbonzini@srs-us1.protection.inumbo.net>)
 id 1jic3w-00027J-Oh
 for xen-devel@lists.xenproject.org; Tue, 09 Jun 2020 11:05:00 +0000
X-Inumbo-ID: 0f84a1d5-aa41-11ea-b305-12813bfff9fa
Received: from us-smtp-1.mimecast.com (unknown [207.211.31.81])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 0f84a1d5-aa41-11ea-b305-12813bfff9fa;
 Tue, 09 Jun 2020 11:04:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591700699;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ki/NH7KwE2iZfzrfj27y3fd4qwWI07EUloemfjIHR0Y=;
 b=YpcW/NI6BuJRAiQE3YdAwK0K0BJglNs9ZTkBK1WZEMzaGiRTyd1CoB8cLzpFwf+y3e5zh6
 6pf0sZS9cjwVPH2cpzfvpTW/DS7XB+j2viyPnZfqAF9tvTUl2L9WP3fnUgMycO03uepikz
 OJpqcY4MFkfN0OPYlepXtqT1nzc7PJg=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-197-PJyobAoeOaqYeLc6h7MXaQ-1; Tue, 09 Jun 2020 07:04:53 -0400
X-MC-Unique: PJyobAoeOaqYeLc6h7MXaQ-1
Received: by mail-wm1-f70.google.com with SMTP id y15so526895wmi.0
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jun 2020 04:04:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ki/NH7KwE2iZfzrfj27y3fd4qwWI07EUloemfjIHR0Y=;
 b=bLOzVv3Q/La/6oeGHBOIaWO7NRgjOqFPCLILoWAQk6VoVNDjX9pWyk6jOhzvceF/80
 /SMQa6x8b+0kmMkZfPSSyvjwtDNiIZODQr9PIRsYXdMTZOSC153QFrpqOC9CGcjC8azn
 QzWnKLA4jiKld0uMuQW+nEB1hZkBnCC3png0aTi1N0f4adBnZ3bj5OlmBDsxlH72STA9
 naomzTJwSrQu6K2ZTC+SpPsfsGHW+96WI8SwgYxuSnlTQbU3j07eFLYP6EqjNQpeKlfI
 XcOrUAeukc+/DFCyJSD5U3t7O+LdqnNZpoBPv1fjlQNnG+sn93uIe/YS+C3Oj6nWR9FC
 Axyg==
X-Gm-Message-State: AOAM530feVUeSFXOFwO6A1vA2mbeqrsNUJ640tuyVWqLPLXPDfe/mgR+
 AIQwlx1RDarV4yzR6LWU+Vl9Kfpr46FAyh8/Y0SP2M7qMqtV0u24QD1VA8h79FWT3GQxceHizpu
 Jd61ABzHLDH0e3M1fQyL2MoNpQXA=
X-Received: by 2002:a5d:4e87:: with SMTP id e7mr3608995wru.427.1591700691534; 
 Tue, 09 Jun 2020 04:04:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw61DF3zQg2Ykdl+eVskia6XAOI0NHB76zgWVAci3VuUK5xBuVU12NxurjEhvkEdodKHniwzg==
X-Received: by 2002:a5d:4e87:: with SMTP id e7mr3608951wru.427.1591700691283; 
 Tue, 09 Jun 2020 04:04:51 -0700 (PDT)
Received: from [192.168.178.58] ([151.21.172.168])
 by smtp.gmail.com with ESMTPSA id e5sm3132662wrw.19.2020.06.09.04.04.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Jun 2020 04:04:50 -0700 (PDT)
Subject: Re: [RFC PATCH 32/35] hw/riscv: Emit warning when old code is used
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20200608160044.15531-1-philmd@redhat.com>
 <20200608160044.15531-33-philmd@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <78a05ce1-ce9a-431a-69df-77b0a8fcfce9@redhat.com>
Date: Tue, 9 Jun 2020 13:04:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200608160044.15531-33-philmd@redhat.com>
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
>  hw/riscv/riscv_htif.c  | 4 ++++
>  hw/riscv/sifive_uart.c | 4 ++++
>  2 files changed, 8 insertions(+)
> 
> diff --git a/hw/riscv/riscv_htif.c b/hw/riscv/riscv_htif.c
> index ca87a5cf9f..bd080dbefb 100644
> --- a/hw/riscv/riscv_htif.c
> +++ b/hw/riscv/riscv_htif.c
> @@ -30,6 +30,7 @@
>  #include "hw/riscv/riscv_htif.h"
>  #include "qemu/timer.h"
>  #include "qemu/error-report.h"
> +#include "hw/qdev-deprecated.h"
>  
>  #define RISCV_DEBUG_HTIF 0
>  #define HTIF_DEBUG(fmt, ...)                                                   \
> @@ -238,6 +239,9 @@ HTIFState *htif_mm_init(MemoryRegion *address_space, MemoryRegion *main_mem,
>      uint64_t fromhost_offset = fromhost_addr - base;
>  
>      HTIFState *s = g_malloc0(sizeof(HTIFState));
> +
> +    qdev_warn_deprecated_function_used();
> +
>      s->address_space = address_space;
>      s->main_mem = main_mem;
>      s->main_mem_ram_ptr = memory_region_get_ram_ptr(main_mem);
> diff --git a/hw/riscv/sifive_uart.c b/hw/riscv/sifive_uart.c
> index 9350482662..1a5890d5f7 100644
> --- a/hw/riscv/sifive_uart.c
> +++ b/hw/riscv/sifive_uart.c
> @@ -25,6 +25,7 @@
>  #include "hw/hw.h"
>  #include "hw/irq.h"
>  #include "hw/riscv/sifive_uart.h"
> +#include "hw/qdev-deprecated.h"
>  
>  /*
>   * Not yet implemented:
> @@ -183,6 +184,9 @@ SiFiveUARTState *sifive_uart_create(MemoryRegion *address_space, hwaddr base,
>      Chardev *chr, qemu_irq irq)
>  {
>      SiFiveUARTState *s = g_malloc0(sizeof(SiFiveUARTState));
> +
> +    qdev_warn_deprecated_function_used();
> +
>      s->irq = irq;
>      qemu_chr_fe_init(&s->chr, chr, &error_abort);
>      qemu_chr_fe_set_handlers(&s->chr, uart_can_rx, uart_rx, uart_event,
> 

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>

Not sure why this code was accepted, furthermore it should have been in
hw/char.

Paolo


