Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BC2DC321A6B
	for <lists+xen-devel@lfdr.de>; Mon, 22 Feb 2021 15:35:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.88121.165586 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lECIq-0002h7-0d; Mon, 22 Feb 2021 14:35:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 88121.165586; Mon, 22 Feb 2021 14:35:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lECIp-0002gi-TY; Mon, 22 Feb 2021 14:35:11 +0000
Received: by outflank-mailman (input) for mailman id 88121;
 Mon, 22 Feb 2021 14:35:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=V+0I=HY=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1lECIn-0002gd-T1
 for xen-devel@lists.xenproject.org; Mon, 22 Feb 2021 14:35:10 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [216.205.24.124])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id e5453185-93de-419d-af51-947d8447ed01;
 Mon, 22 Feb 2021 14:35:08 +0000 (UTC)
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-81-wnzsbwKhPbe49Di5rv67lw-1; Mon, 22 Feb 2021 09:35:04 -0500
Received: by mail-ed1-f70.google.com with SMTP id g20so4523121edy.7
 for <xen-devel@lists.xenproject.org>; Mon, 22 Feb 2021 06:35:04 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id s14sm10457606ejf.47.2021.02.22.06.35.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Feb 2021 06:35:02 -0800 (PST)
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
X-Inumbo-ID: e5453185-93de-419d-af51-947d8447ed01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1614004508;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ROXc4pPESl2hnVPAmTj87jG8Y89YLot+XFk/YVIBdHE=;
	b=Utm4jjZcClpf2C5IqxE6o3+p8aSCVx1b9QUseQuVCq6/QEbz/4ar8Dsr4E6aOxo81KX64N
	27wyaTn7rQkbqdzWzN8HVr1t0ITomq5YnFcbWKAeiyTrSUjSiEEZgBTtX5LBWaMy9V7UAK
	8NzZqEh3L+USeKZjsfv7OPmWuf2AXt0=
X-MC-Unique: wnzsbwKhPbe49Di5rv67lw-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ROXc4pPESl2hnVPAmTj87jG8Y89YLot+XFk/YVIBdHE=;
        b=qQQk5ClsEyYn86XNGOHlD4MLvONCGeYD/CvpXTButzbXdbtqIQZ8iHNUUqp4wh9/K2
         8yP/EmEQh0MfJ1YlefoA0qOb4/CFhhlSMV++O5wA3laXT+fdebNrKHU87xUFpDRTPX3U
         6ayPSqs7jn5kfW0BJ/VRu7R/sD1FkqA0j/7HfqrBz/ngBpEPIkIYuxPVUU2UG4XF95Zk
         iNiloHoyGaXBlF+3EfpPtximD8xtm8XCpo80O2Xdi8m+BVyv38tTFrc3fO6xHjPmta75
         exjfGa346wep9+ggYImnyKspRCF+PerG1vZELsMQgQVTXRn5NyjU+l4J+202zxBPaG4z
         1EaA==
X-Gm-Message-State: AOAM533wpXQ8caEuvXJ8gmyqdu2HePa2w6gw4x1A/1Bu15UgTCEgFHNo
	DTWSUnVvjTOZG/xw6EDPO0ZdaPSrCu0+DhUEjHed+QTNyPKhxG12/kdWAWSd+OshD5nc1hc3TpJ
	KRLG3FirjAOsHjpPcrkl9s7T5tE0=
X-Received: by 2002:a50:9dc9:: with SMTP id l9mr22865682edk.377.1614004503647;
        Mon, 22 Feb 2021 06:35:03 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyumDD7RCrt3aWNrG+469eebI8wUrsStbqcQO2s6zYWdcqMS9H6mt2qeXwl0MrBf/vG1e+wdw==
X-Received: by 2002:a50:9dc9:: with SMTP id l9mr22865651edk.377.1614004503527;
        Mon, 22 Feb 2021 06:35:03 -0800 (PST)
Subject: Re: [PATCH 0/2] sysemu: Let VMChangeStateHandler take boolean
 'running' argument
To: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Cc: Huacai Chen <chenhuacai@kernel.org>, Greg Kurz <groug@kaod.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-trivial@nongnu.org,
 Amit Shah <amit@kernel.org>, Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 qemu-arm@nongnu.org, John Snow <jsnow@redhat.com>, qemu-s390x@nongnu.org,
 Paul Durrant <paul@xen.org>, Anthony Perard <anthony.perard@citrix.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Alex Williamson <alex.williamson@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Jason Wang <jasowang@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Halil Pasic <pasic@linux.ibm.com>, Fam Zheng <fam@euphon.net>,
 qemu-ppc@nongnu.org, kvm@vger.kernel.org,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org,
 Cornelia Huck <cohuck@redhat.com>, David Hildenbrand <david@redhat.com>,
 qemu-block@nongnu.org, Christian Borntraeger <borntraeger@de.ibm.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, Thomas Huth <thuth@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>
References: <20210111152020.1422021-1-philmd@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <84048681-32d3-7217-e94c-461501cf550b@redhat.com>
Date: Mon, 22 Feb 2021 15:34:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210111152020.1422021-1-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

Paolo, this series is fully reviewed, can it go via your
misc tree?

On 1/11/21 4:20 PM, Philippe Mathieu-Daudé wrote:
> Trivial prototype change to clarify the use of the 'running'
> argument of VMChangeStateHandler.
> 
> Green CI:
> https://gitlab.com/philmd/qemu/-/pipelines/239497352
> 
> Philippe Mathieu-Daudé (2):
>   sysemu/runstate: Let runstate_is_running() return bool
>   sysemu: Let VMChangeStateHandler take boolean 'running' argument
> 
>  include/sysemu/runstate.h   | 12 +++++++++---
>  target/arm/kvm_arm.h        |  2 +-
>  target/ppc/cpu-qom.h        |  2 +-
>  accel/xen/xen-all.c         |  2 +-
>  audio/audio.c               |  2 +-
>  block/block-backend.c       |  2 +-
>  gdbstub.c                   |  2 +-
>  hw/block/pflash_cfi01.c     |  2 +-
>  hw/block/virtio-blk.c       |  2 +-
>  hw/display/qxl.c            |  2 +-
>  hw/i386/kvm/clock.c         |  2 +-
>  hw/i386/kvm/i8254.c         |  2 +-
>  hw/i386/kvmvapic.c          |  2 +-
>  hw/i386/xen/xen-hvm.c       |  2 +-
>  hw/ide/core.c               |  2 +-
>  hw/intc/arm_gicv3_its_kvm.c |  2 +-
>  hw/intc/arm_gicv3_kvm.c     |  2 +-
>  hw/intc/spapr_xive_kvm.c    |  2 +-
>  hw/misc/mac_via.c           |  2 +-
>  hw/net/e1000e_core.c        |  2 +-
>  hw/nvram/spapr_nvram.c      |  2 +-
>  hw/ppc/ppc.c                |  2 +-
>  hw/ppc/ppc_booke.c          |  2 +-
>  hw/s390x/tod-kvm.c          |  2 +-
>  hw/scsi/scsi-bus.c          |  2 +-
>  hw/usb/hcd-ehci.c           |  2 +-
>  hw/usb/host-libusb.c        |  2 +-
>  hw/usb/redirect.c           |  2 +-
>  hw/vfio/migration.c         |  2 +-
>  hw/virtio/virtio-rng.c      |  2 +-
>  hw/virtio/virtio.c          |  2 +-
>  net/net.c                   |  2 +-
>  softmmu/memory.c            |  2 +-
>  softmmu/runstate.c          |  4 ++--
>  target/arm/kvm.c            |  2 +-
>  target/i386/kvm/kvm.c       |  2 +-
>  target/i386/sev.c           |  2 +-
>  target/i386/whpx/whpx-all.c |  2 +-
>  target/mips/kvm.c           |  4 ++--
>  ui/gtk.c                    |  2 +-
>  ui/spice-core.c             |  2 +-
>  41 files changed, 51 insertions(+), 45 deletions(-)
> 


