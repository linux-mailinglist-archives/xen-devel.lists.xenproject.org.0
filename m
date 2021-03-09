Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 55F92333161
	for <lists+xen-devel@lfdr.de>; Tue,  9 Mar 2021 23:09:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.95798.180818 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJkWi-0004mF-7x; Tue, 09 Mar 2021 22:08:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 95798.180818; Tue, 09 Mar 2021 22:08:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJkWi-0004lq-4k; Tue, 09 Mar 2021 22:08:28 +0000
Received: by outflank-mailman (input) for mailman id 95798;
 Tue, 09 Mar 2021 22:08:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=m7x3=IH=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1lJkWg-0004ll-7J
 for xen-devel@lists.xenproject.org; Tue, 09 Mar 2021 22:08:26 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [170.10.133.124])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 9d83a547-fa69-4fe1-af66-7d431d274933;
 Tue, 09 Mar 2021 22:08:24 +0000 (UTC)
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-166-Budw5cMqPBCvu3CF6jYNBA-1; Tue, 09 Mar 2021 17:08:22 -0500
Received: by mail-ej1-f69.google.com with SMTP id e13so6275943ejd.21
 for <xen-devel@lists.xenproject.org>; Tue, 09 Mar 2021 14:08:21 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id u15sm10107092eds.6.2021.03.09.14.08.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Mar 2021 14:08:20 -0800 (PST)
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
X-Inumbo-ID: 9d83a547-fa69-4fe1-af66-7d431d274933
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1615327704;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TrRfkpaCyAif10vY2NLzElT8H9hcz96S44UT+WnEyM0=;
	b=AX4JN3KlRzvVZY7kUOGstjmHLo/65B3SiilWnDoIa1wLK+17QVEMVMMhS0y2ynLTy02cAM
	Gni/Cb4TnscuEMebIrep8ArMUjbdUrZZ/fu4qNUQ1bu7xeLoRap1bIvgFEXgFJGtE53D5E
	hjGcIse+0L9LEEBshtDdmGUHDQ47llI=
X-MC-Unique: Budw5cMqPBCvu3CF6jYNBA-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=TrRfkpaCyAif10vY2NLzElT8H9hcz96S44UT+WnEyM0=;
        b=gP9WtBxfAGsFBBhl+4soqaZy0y11XUHFEoPQwq7iaadsNKe78PEWRp6IUjVbqI5sJs
         kQvAXkhwmmAoDbX77TgtjLGgXOmRltUpj1ZMcCzYhMdEzLkS9k99yh+OLOCkpHdBdNcf
         dpG9aGMT2int8e/fml7k7CZLUGtFm41BEz0rRJVo+ZNCdY9yAKtQOdGPVFjIY2p3rbZo
         SvTBzMRBnkyCs6G92vvZ61Ih6Y8cVK/PhQ3q0Eq7k65KKXtqVsvds7mdJ7Ll5CDCLb2K
         JlyOVw/IYGNGU/wsvjyN3bvO272ydsEzahvBox9KTDEtCMtiZz8ViH7HuBYVzmBQQkQN
         43FA==
X-Gm-Message-State: AOAM5336oWaL0JztgJk9O9H0/wSUVXzmB3mWZH2dsR8BhK+YObhKzaCZ
	WF41JlNDEZpBqCgLLANVAfLM5TNEHya+zwgM5QKCop8eszmHjL+p343Kt+6XSDitDhJpBjKmTGk
	NmhkIzLRKQaAzM6bZ5W7IchHOWxA=
X-Received: by 2002:a17:907:d15:: with SMTP id gn21mr180972ejc.337.1615327700938;
        Tue, 09 Mar 2021 14:08:20 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyoPZbz8BsbfZxNq4crDSMnBl/+S3hyEa4IsAMqqCextuO59Wc8A5fWQ9LtkxA8SuHE3e3dRQ==
X-Received: by 2002:a17:907:d15:: with SMTP id gn21mr180947ejc.337.1615327700754;
        Tue, 09 Mar 2021 14:08:20 -0800 (PST)
Subject: Re: [PATCH 0/2] sysemu: Let VMChangeStateHandler take boolean
 'running' argument
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 QEMU Trivial <qemu-trivial@nongnu.org>
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
 <84048681-32d3-7217-e94c-461501cf550b@redhat.com>
Message-ID: <3112233d-e227-b0c5-4a97-3ad0127a4d12@redhat.com>
Date: Tue, 9 Mar 2021 23:08:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <84048681-32d3-7217-e94c-461501cf550b@redhat.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

ping, qemu-trivial maybe?

On 2/22/21 3:34 PM, Philippe Mathieu-Daudé wrote:
> Paolo, this series is fully reviewed, can it go via your
> misc tree?
> 
> On 1/11/21 4:20 PM, Philippe Mathieu-Daudé wrote:
>> Trivial prototype change to clarify the use of the 'running'
>> argument of VMChangeStateHandler.
>>
>> Green CI:
>> https://gitlab.com/philmd/qemu/-/pipelines/239497352
>>
>> Philippe Mathieu-Daudé (2):
>>   sysemu/runstate: Let runstate_is_running() return bool
>>   sysemu: Let VMChangeStateHandler take boolean 'running' argument
>>
>>  include/sysemu/runstate.h   | 12 +++++++++---
>>  target/arm/kvm_arm.h        |  2 +-
>>  target/ppc/cpu-qom.h        |  2 +-
>>  accel/xen/xen-all.c         |  2 +-
>>  audio/audio.c               |  2 +-
>>  block/block-backend.c       |  2 +-
>>  gdbstub.c                   |  2 +-
>>  hw/block/pflash_cfi01.c     |  2 +-
>>  hw/block/virtio-blk.c       |  2 +-
>>  hw/display/qxl.c            |  2 +-
>>  hw/i386/kvm/clock.c         |  2 +-
>>  hw/i386/kvm/i8254.c         |  2 +-
>>  hw/i386/kvmvapic.c          |  2 +-
>>  hw/i386/xen/xen-hvm.c       |  2 +-
>>  hw/ide/core.c               |  2 +-
>>  hw/intc/arm_gicv3_its_kvm.c |  2 +-
>>  hw/intc/arm_gicv3_kvm.c     |  2 +-
>>  hw/intc/spapr_xive_kvm.c    |  2 +-
>>  hw/misc/mac_via.c           |  2 +-
>>  hw/net/e1000e_core.c        |  2 +-
>>  hw/nvram/spapr_nvram.c      |  2 +-
>>  hw/ppc/ppc.c                |  2 +-
>>  hw/ppc/ppc_booke.c          |  2 +-
>>  hw/s390x/tod-kvm.c          |  2 +-
>>  hw/scsi/scsi-bus.c          |  2 +-
>>  hw/usb/hcd-ehci.c           |  2 +-
>>  hw/usb/host-libusb.c        |  2 +-
>>  hw/usb/redirect.c           |  2 +-
>>  hw/vfio/migration.c         |  2 +-
>>  hw/virtio/virtio-rng.c      |  2 +-
>>  hw/virtio/virtio.c          |  2 +-
>>  net/net.c                   |  2 +-
>>  softmmu/memory.c            |  2 +-
>>  softmmu/runstate.c          |  4 ++--
>>  target/arm/kvm.c            |  2 +-
>>  target/i386/kvm/kvm.c       |  2 +-
>>  target/i386/sev.c           |  2 +-
>>  target/i386/whpx/whpx-all.c |  2 +-
>>  target/mips/kvm.c           |  4 ++--
>>  ui/gtk.c                    |  2 +-
>>  ui/spice-core.c             |  2 +-
>>  41 files changed, 51 insertions(+), 45 deletions(-)
>>
> 


