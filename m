Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 48A3C686117
	for <lists+xen-devel@lfdr.de>; Wed,  1 Feb 2023 09:01:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.488150.756094 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pN83Q-0004rT-Jg; Wed, 01 Feb 2023 08:01:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 488150.756094; Wed, 01 Feb 2023 08:01:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pN83Q-0004pY-Gf; Wed, 01 Feb 2023 08:01:16 +0000
Received: by outflank-mailman (input) for mailman id 488150;
 Wed, 01 Feb 2023 08:01:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EYYs=55=gmail.com=xadimgnik@srs-se1.protection.inumbo.net>)
 id 1pN83P-0004pS-4V
 for xen-devel@lists.xenproject.org; Wed, 01 Feb 2023 08:01:15 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 991e6a5c-a206-11ed-933c-83870f6b2ba8;
 Wed, 01 Feb 2023 09:01:14 +0100 (CET)
Received: by mail-wm1-x330.google.com with SMTP id q8so11978227wmo.5
 for <xen-devel@lists.xenproject.org>; Wed, 01 Feb 2023 00:01:14 -0800 (PST)
Received: from [192.168.9.204] (54-240-197-238.amazon.com. [54.240.197.238])
 by smtp.gmail.com with ESMTPSA id
 e18-20020a05600c4e5200b003dc1f466a25sm950849wmq.25.2023.02.01.00.01.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Feb 2023 00:01:13 -0800 (PST)
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
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 991e6a5c-a206-11ed-933c-83870f6b2ba8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tymDbNnZpQDXwy3rfuwrhJj7HPDQs8cQ+0cSJgozvc4=;
        b=NJzFFqJ2YsatpZ7udiQFrj0iSc3ZzMp6IojPkq6WMXGf4ov2khQi3tFnGi8nlfSnNL
         UDmBuUHFoH3rLj992LsptKLq0VJ4K6+H13vpqkzo4q42PyMgIPA6+5B1V1oND0NCQA4g
         dCNn04zmEei837pXi8wkud02fyAJ7IEiTLunmdVs2m0N1G6iq5Mjs7t3xhmZ9aH75+6g
         PJXKu4DnTb+OS9EJ6OHtCB9hpyQvx5enBhz3L8BK6yP8BY/OL/zDN2+8jH1fP4+qgcu+
         n6dMnssALHBR6g+SBGpCwqezx70TNrGZsWmCEGtJ5n2sy3r9E99qKOgsrepjECqRJqKA
         aChw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tymDbNnZpQDXwy3rfuwrhJj7HPDQs8cQ+0cSJgozvc4=;
        b=Wx+3G2A0HJZyi0irRvHQ3Q/ellwM4Yj0t1meaxbDOG7MHSZna9ozXQlD0Y2b7uWq8M
         mc4WVdSfG/P5UtU0fDWXFREDF70n+tXNYPjnXP/d2831ItOf8g3hW/t2KYUPOq1JPlBv
         Me1VFQpCiFg5j6+E0rUrskObdc0Kc8Co+RCZ/f/WJEpXUC0oBjcsvGbtrHKkWRC6F1JA
         yUU729G4wuqzcBXI9Nimlsg/8lBcghwErXF4b3PCbcYP7ulViq1Smn828PQe5+uTzEYe
         aHc/PSBLaWmw4Vc7tpeTxLJWsI9nOZ4gwCH4KuBqJu+yQ6NSweDqjaYwEde0EWaR2zP5
         OgOw==
X-Gm-Message-State: AO0yUKVWkjJWM4YLGRWgtW0xAKJVnZSDrm9zEYT2EKyYcr6U4Nf/13eJ
	pbBpm/qbCACEfrykAKtCIdA=
X-Google-Smtp-Source: AK7set+rqD7bnAoFLZkN+q1G35EYiojdGNZQpQwl/easXWfAl2aoQ7RNm2jDhDyB8vx+pvg4MYsrTQ==
X-Received: by 2002:a05:600c:42ca:b0:3dc:58fb:c1eb with SMTP id j10-20020a05600c42ca00b003dc58fbc1ebmr1069408wme.8.1675238473672;
        Wed, 01 Feb 2023 00:01:13 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <3c54b871-b14c-9fc1-fd80-1d01d506035c@xen.org>
Date: Wed, 1 Feb 2023 08:01:09 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Reply-To: paul@xen.org
Subject: Re: [QEMU][PATCH v5 04/10] xen-hvm: reorganize xen-hvm and move
 common function to xen-hvm-common
Content-Language: en-US
To: Vikram Garhwal <vikram.garhwal@amd.com>, qemu-devel@nongnu.org
Cc: xen-devel@lists.xenproject.org, stefano.stabellini@amd.com,
 alex.bennee@linaro.org, Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>
References: <20230131225149.14764-1-vikram.garhwal@amd.com>
 <20230131225149.14764-5-vikram.garhwal@amd.com>
Organization: Xen Project
In-Reply-To: <20230131225149.14764-5-vikram.garhwal@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 31/01/2023 22:51, Vikram Garhwal wrote:
> From: Stefano Stabellini <stefano.stabellini@amd.com>
> 
> This patch does following:
> 1. creates arch_handle_ioreq() and arch_xen_set_memory(). This is done in
>      preparation for moving most of xen-hvm code to an arch-neutral location,
>      move the x86-specific portion of xen_set_memory to arch_xen_set_memory.
>      Also, move handle_vmport_ioreq to arch_handle_ioreq.
> 
> 2. Pure code movement: move common functions to hw/xen/xen-hvm-common.c
>      Extract common functionalities from hw/i386/xen/xen-hvm.c and move them to
>      hw/xen/xen-hvm-common.c. These common functions are useful for creating
>      an IOREQ server.
> 
>      xen_hvm_init_pc() contains the architecture independent code for creating
>      and mapping a IOREQ server, connecting memory and IO listeners, initializing
>      a xen bus and registering backends. Moved this common xen code to a new
>      function xen_register_ioreq() which can be used by both x86 and ARM machines.
> 
>      Following functions are moved to hw/xen/xen-hvm-common.c:
>          xen_vcpu_eport(), xen_vcpu_ioreq(), xen_ram_alloc(), xen_set_memory(),
>          xen_region_add(), xen_region_del(), xen_io_add(), xen_io_del(),
>          xen_device_realize(), xen_device_unrealize(),
>          cpu_get_ioreq_from_shared_memory(), cpu_get_ioreq(), do_inp(),
>          do_outp(), rw_phys_req_item(), read_phys_req_item(),
>          write_phys_req_item(), cpu_ioreq_pio(), cpu_ioreq_move(),
>          cpu_ioreq_config(), handle_ioreq(), handle_buffered_iopage(),
>          handle_buffered_io(), cpu_handle_ioreq(), xen_main_loop_prepare(),
>          xen_hvm_change_state_handler(), xen_exit_notifier(),
>          xen_map_ioreq_server(), destroy_hvm_domain() and
>          xen_shutdown_fatal_error()
> 
> 3. Removed static type from below functions:
>      1. xen_region_add()
>      2. xen_region_del()
>      3. xen_io_add()
>      4. xen_io_del()
>      5. xen_device_realize()
>      6. xen_device_unrealize()
>      7. xen_hvm_change_state_handler()
>      8. cpu_ioreq_pio()
>      9. xen_exit_notifier()
> 
> 4. Replace TARGET_PAGE_SIZE with XC_PAGE_SIZE to match the page side with Xen.
> 
> Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
> ---
>   hw/i386/xen/trace-events        |   14 -
>   hw/i386/xen/xen-hvm.c           | 1019 ++-----------------------------
>   hw/xen/meson.build              |    5 +-
>   hw/xen/trace-events             |   14 +
>   hw/xen/xen-hvm-common.c         |  874 ++++++++++++++++++++++++++
>   include/hw/i386/xen_arch_hvm.h  |   11 +
>   include/hw/xen/arch_hvm.h       |    3 +
>   include/hw/xen/xen-hvm-common.h |   98 +++
>   8 files changed, 1067 insertions(+), 971 deletions(-)
>   create mode 100644 hw/xen/xen-hvm-common.c
>   create mode 100644 include/hw/i386/xen_arch_hvm.h
>   create mode 100644 include/hw/xen/arch_hvm.h
>   create mode 100644 include/hw/xen/xen-hvm-common.h
> 

Reviewed-by: Paul Durrant <paul@xen.org>


