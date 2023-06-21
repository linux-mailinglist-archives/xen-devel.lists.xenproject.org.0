Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E7D2A738140
	for <lists+xen-devel@lfdr.de>; Wed, 21 Jun 2023 13:11:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.552657.862849 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBvjK-0001aC-Ja; Wed, 21 Jun 2023 11:10:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 552657.862849; Wed, 21 Jun 2023 11:10:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBvjK-0001YQ-Gy; Wed, 21 Jun 2023 11:10:30 +0000
Received: by outflank-mailman (input) for mailman id 552657;
 Wed, 21 Jun 2023 11:10:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YJad=CJ=redhat.com=david@srs-se1.protection.inumbo.net>)
 id 1qBvjI-0001YG-Sw
 for xen-devel@lists.xenproject.org; Wed, 21 Jun 2023 11:10:28 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 38f49c7a-1024-11ee-8611-37d641c3527e;
 Wed, 21 Jun 2023 13:10:26 +0200 (CEST)
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-482-CM-Qw2czOY2GbQXem0Q4kQ-1; Wed, 21 Jun 2023 07:10:20 -0400
Received: by mail-lf1-f70.google.com with SMTP id
 2adb3069b0e04-4f652022d30so3925748e87.1
 for <xen-devel@lists.xenproject.org>; Wed, 21 Jun 2023 04:10:20 -0700 (PDT)
Received: from ?IPV6:2003:cb:c70b:9c00:7978:3030:9d9a:1aef?
 (p200300cbc70b9c00797830309d9a1aef.dip0.t-ipconnect.de.
 [2003:cb:c70b:9c00:7978:3030:9d9a:1aef])
 by smtp.gmail.com with ESMTPSA id
 n6-20020a05600c294600b003f7e4639aabsm15838957wmd.10.2023.06.21.04.10.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Jun 2023 04:10:18 -0700 (PDT)
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
X-Inumbo-ID: 38f49c7a-1024-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1687345825;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+PPJcZwVybRKqB+oePB3oQpC+QICYQE72Fmc4NGzUQ0=;
	b=T225pGR/G1Iumb14+o/P1zomU0Si0cKsxksHviD/zR+oDeBZ2IISO4NAXa+JrN/fh8GFoR
	ZrVl5Vbj21PxvlsbS5ZLKEyWpddksGlCLG0UHyDv1r1Q0MlfAQg3SeHYszAUCHd4+3zS7E
	zWJns8yDWPJxN3BhXLYEG5xeLQ5x9tI=
X-MC-Unique: CM-Qw2czOY2GbQXem0Q4kQ-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687345819; x=1689937819;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+PPJcZwVybRKqB+oePB3oQpC+QICYQE72Fmc4NGzUQ0=;
        b=fJ8YRqKye74aZb4r6BRk5Xfr652QYpJ/PXBcGTzgiKbFFYFQZijTTAKCmbCC34ihna
         RRlH8JvkJf+oIr1pw09Y/AsI7Nd8gzj4xk4uMQMKmdgTcJyQaZ1hiDKijq87UlZiIYOo
         /28+Sl0p8mZn6bz9jM4U6WWA/EF0W9PhsultcmnpxOj0DgPER7Jpc7C9Ap8y8eE7NWWV
         infcCCjy9188/mCLPza6wBJ8xqnhvlXQK7nSm0vd3iYpapROVb1bJCT3gKzMoCSeuTfZ
         g/mXHG9jpgFB7nInZUcMkHfvFlmb854GnCG/CBArX/zm3i9Zruvs9jxu73iwX5oMNzKK
         WfcQ==
X-Gm-Message-State: AC+VfDwmI0NQdhv01pm9AhWlOS5MbWzPnf86EJKyViJqEdnT3t7pibw1
	rpI06T8V8w8InV9McFaeuX4HffxR6OLaOs3LYVhVO+pPv5l+EXl8uykDgUpcMZNS09Em5l+xdpz
	jTCDxLkri0CdQsx9Hj6tEXD1fLKU=
X-Received: by 2002:a19:5f5e:0:b0:4f8:554f:36aa with SMTP id a30-20020a195f5e000000b004f8554f36aamr8695672lfj.29.1687345819126;
        Wed, 21 Jun 2023 04:10:19 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6dPOiwWjMrFeux8c7Yxb3pQd32Zv1F1r4CL1oEYE69e28hwJuZI9LmzmivR8K/k43R01PkHg==
X-Received: by 2002:a19:5f5e:0:b0:4f8:554f:36aa with SMTP id a30-20020a195f5e000000b004f8554f36aamr8695649lfj.29.1687345818759;
        Wed, 21 Jun 2023 04:10:18 -0700 (PDT)
Message-ID: <02b6a8a8-2da7-2864-0c0e-5ed81a560355@redhat.com>
Date: Wed, 21 Jun 2023 13:10:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v1 1/1] Q35 Support
To: Joel Upham <jupham125@gmail.com>, qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <anisinha@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Yanan Wang <wangyanan55@huawei.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 "open list:X86 Xen CPUs" <xen-devel@lists.xenproject.org>
References: <cover.1687127946.git.jupham125@gmail.com>
 <272947b9494f00bb4ad3e27c050e99f8b61905b3.1687127946.git.jupham125@gmail.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <272947b9494f00bb4ad3e27c050e99f8b61905b3.1687127946.git.jupham125@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 20.06.23 19:24, Joel Upham wrote:

Inexpressive patch subject and non-existant patch desciption. I have no 
clue what this is supposed to do, except that it involes q35 and xen ()I 
guess ?.

> ---
>   hw/acpi/ich9.c                |   22 +-
>   hw/acpi/pcihp.c               |    6 +-
>   hw/core/machine.c             |   19 +
>   hw/i386/pc_piix.c             |    3 +-
>   hw/i386/pc_q35.c              |   39 +-
>   hw/i386/xen/xen-hvm.c         |    7 +-
>   hw/i386/xen/xen_platform.c    |   19 +-
>   hw/isa/lpc_ich9.c             |   53 +-
>   hw/isa/piix3.c                |    2 +-
>   hw/pci-host/q35.c             |   28 +-
>   hw/pci/pci.c                  |   17 +
>   hw/xen/xen-host-pci-device.c  |  106 +++-
>   hw/xen/xen-host-pci-device.h  |    6 +-
>   hw/xen/xen_pt.c               |   49 +-
>   hw/xen/xen_pt.h               |   19 +-
>   hw/xen/xen_pt_config_init.c   | 1103 ++++++++++++++++++++++++++++++---
>   include/hw/acpi/ich9.h        |    1 +
>   include/hw/acpi/pcihp.h       |    2 +
>   include/hw/boards.h           |    1 +
>   include/hw/i386/pc.h          |    3 +
>   include/hw/pci-host/q35.h     |    4 +-
>   include/hw/pci/pci.h          |    3 +
>   include/hw/southbridge/ich9.h |    1 +
>   include/hw/xen/xen.h          |    4 +-
>   qemu-options.hx               |    1 +
>   softmmu/datadir.c             |    1 -
>   softmmu/qdev-monitor.c        |    3 +-
>   stubs/xen-hw-stub.c           |    4 +-
>   28 files changed, 1395 insertions(+), 131 deletions(-)
> 

Usually people refrain from reviewing such massive patches. Most 
probably this can be broken up into reviewable pieces.

Was this supposed to be an RFC?

-- 
Cheers,

David / dhildenb


