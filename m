Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B76306B713D
	for <lists+xen-devel@lfdr.de>; Mon, 13 Mar 2023 09:36:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.509144.784401 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pbdfR-0006Pe-K0; Mon, 13 Mar 2023 08:36:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 509144.784401; Mon, 13 Mar 2023 08:36:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pbdfR-0006Nu-FQ; Mon, 13 Mar 2023 08:36:29 +0000
Received: by outflank-mailman (input) for mailman id 509144;
 Mon, 13 Mar 2023 08:36:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=eMjs=7F=redhat.com=thuth@srs-se1.protection.inumbo.net>)
 id 1pbdfP-0006Nl-Sk
 for xen-devel@lists.xenproject.org; Mon, 13 Mar 2023 08:36:28 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 23efd089-c17a-11ed-87f5-c1b5be75604c;
 Mon, 13 Mar 2023 09:36:26 +0100 (CET)
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-491--5SNFHy_O0-_So_2shfO5A-1; Mon, 13 Mar 2023 04:36:23 -0400
Received: by mail-wm1-f72.google.com with SMTP id
 t1-20020a7bc3c1000000b003dfe223de49so7453202wmj.5
 for <xen-devel@lists.xenproject.org>; Mon, 13 Mar 2023 01:36:23 -0700 (PDT)
Received: from [192.168.0.2] (ip-109-43-179-26.web.vodafone.de.
 [109.43.179.26]) by smtp.gmail.com with ESMTPSA id
 q12-20020adfcd8c000000b002ceaeb4b608sm3160170wrj.34.2023.03.13.01.36.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Mar 2023 01:36:21 -0700 (PDT)
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
X-Inumbo-ID: 23efd089-c17a-11ed-87f5-c1b5be75604c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678696584;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OWt5vj9MMwXb4l9+uwottEsS1Nl//OGUSfQKqU3untY=;
	b=X47CRGb3XaA3Y2sMQ1kWSGAXypOVI0TlgZ58jKdkALmWS35gVuImYuIwjxDw8i2U4uujmK
	qLCMJkxu4/K8OgX8cZ1n48mOqZKFzOTTHHV9Vz28UxXJhvGXsHlqx7KSWoqYASML+yiJhV
	qXMM/96fxz6rR7gjcz2lF+Xa60fpXoA=
X-MC-Unique: -5SNFHy_O0-_So_2shfO5A-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678696582;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OWt5vj9MMwXb4l9+uwottEsS1Nl//OGUSfQKqU3untY=;
        b=wBUNZrviorCaZW37FLIL+PYpfOVlowhx7x8LTDF3b+a2TazfvSn6g9qjUo2rKtlH4/
         7/VFKkxiSpl27bLuKMUWY76bPZIL1paVxz/e40C8Hu72rJfCnmOFdmu3XRBcwRKg2jHV
         z8bAAxGbois4bYJsLfSG0fltiJECPUB2InKzTeqc1vw6ZF3vUGXmXQHHuYscSsx3SVZj
         4MQRjPTjcwenn3jsUsXYPVMsRpejoYA8ZoaU5b85wf8HNabGZCD2ug9XxX/J1IIXyzbu
         qAundeBTVM5BKPze9ZyKTttvVdGfDuw/3p5uLh7MZzgF+FaDVTCuUUTBX1WTEllU7BD7
         UUiA==
X-Gm-Message-State: AO0yUKUNzC2ujWinGFj+5BAyJ+QTF7KKk8cNAh42ZFyeoincfDMywQ1h
	RjfCCRllBiaccx/2d0VnMcLGQyygDWpkR7M+r6NUkj2Buh5a7nHIU3NZWh8Fp17hdxNiQheEokD
	ZgJEVtMVTMFCzsr+vIAbXZflSVrU=
X-Received: by 2002:a5d:6504:0:b0:2ce:39d3:c9a5 with SMTP id x4-20020a5d6504000000b002ce39d3c9a5mr21946664wru.22.1678696582376;
        Mon, 13 Mar 2023 01:36:22 -0700 (PDT)
X-Google-Smtp-Source: AK7set+MQhE6wSCnJV1f3TtYtFcxGiN5fNsHY1JDaSaepfTCQcDtrqqNRgmQVYfYKIYqqxPt0EH8gA==
X-Received: by 2002:a5d:6504:0:b0:2ce:39d3:c9a5 with SMTP id x4-20020a5d6504000000b002ce39d3c9a5mr21946635wru.22.1678696582103;
        Mon, 13 Mar 2023 01:36:22 -0700 (PDT)
Message-ID: <18ea04ff-4ebf-b163-0dcf-f0b8e966bda4@redhat.com>
Date: Mon, 13 Mar 2023 09:36:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v7 4/6] hw: replace most qemu_bh_new calls with
 qemu_bh_new_guarded
To: Alexander Bulekov <alxndr@bu.edu>, qemu-devel@nongnu.org
Cc: Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Mauro Matteo Cascella <mcascell@redhat.com>, Peter Xu <peterx@redhat.com>,
 Jason Wang <jasowang@redhat.com>, David Hildenbrand <david@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Bandan Das <bsd@redhat.com>, "Edgar E . Iglesias"
 <edgar.iglesias@gmail.com>, Darren Kenny <darren.kenny@oracle.com>,
 Bin Meng <bin.meng@windriver.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Jon Maloy <jmaloy@redhat.com>,
 Siqi Chen <coc.cyqh@gmail.com>, Paul Durrant <paul@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>, Kevin Wolf <kwolf@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Amit Shah <amit@kernel.org>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 John Snow <jsnow@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Keith Busch <kbusch@kernel.org>, Klaus Jensen <its@irrelevant.dk>,
 Fam Zheng <fam@euphon.net>, Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 "open list:X86 Xen CPUs" <xen-devel@lists.xenproject.org>,
 "open list:virtio-blk" <qemu-block@nongnu.org>,
 "open list:i.MX31 (kzm)" <qemu-arm@nongnu.org>,
 "open list:New World (mac99)" <qemu-ppc@nongnu.org>
References: <20230313082417.827484-1-alxndr@bu.edu>
 <20230313082417.827484-5-alxndr@bu.edu>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230313082417.827484-5-alxndr@bu.edu>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 13/03/2023 09.24, Alexander Bulekov wrote:
> This protects devices from bh->mmio reentrancy issues.
> 
> Thanks: Thomas Huth <thuth@redhat.com> for diagnosing OS X test failure.
> Reviewed-by: Darren Kenny <darren.kenny@oracle.com>
> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
> Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
> Reviewed-by: Paul Durrant <paul@xen.org>
> Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
> ---
>   hw/9pfs/xen-9p-backend.c        | 5 ++++-
>   hw/block/dataplane/virtio-blk.c | 3 ++-
>   hw/block/dataplane/xen-block.c  | 5 +++--
>   hw/char/virtio-serial-bus.c     | 3 ++-
>   hw/display/qxl.c                | 9 ++++++---
>   hw/display/virtio-gpu.c         | 6 ++++--
>   hw/ide/ahci.c                   | 3 ++-
>   hw/ide/ahci_internal.h          | 1 +
>   hw/ide/core.c                   | 4 +++-
>   hw/misc/imx_rngc.c              | 6 ++++--
>   hw/misc/macio/mac_dbdma.c       | 2 +-
>   hw/net/virtio-net.c             | 3 ++-
>   hw/nvme/ctrl.c                  | 6 ++++--
>   hw/scsi/mptsas.c                | 3 ++-
>   hw/scsi/scsi-bus.c              | 3 ++-
>   hw/scsi/vmw_pvscsi.c            | 3 ++-
>   hw/usb/dev-uas.c                | 3 ++-
>   hw/usb/hcd-dwc2.c               | 3 ++-
>   hw/usb/hcd-ehci.c               | 3 ++-
>   hw/usb/hcd-uhci.c               | 2 +-
>   hw/usb/host-libusb.c            | 6 ++++--
>   hw/usb/redirect.c               | 6 ++++--
>   hw/usb/xen-usb.c                | 3 ++-
>   hw/virtio/virtio-balloon.c      | 5 +++--
>   hw/virtio/virtio-crypto.c       | 3 ++-
>   25 files changed, 66 insertions(+), 33 deletions(-)

Reviewed-by: Thomas Huth <thuth@redhat.com>


