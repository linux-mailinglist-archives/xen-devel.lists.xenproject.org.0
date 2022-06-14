Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 06DA854B445
	for <lists+xen-devel@lfdr.de>; Tue, 14 Jun 2022 17:12:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.349141.575324 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o18DS-0006km-Hs; Tue, 14 Jun 2022 15:12:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 349141.575324; Tue, 14 Jun 2022 15:12:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o18DS-0006i4-F1; Tue, 14 Jun 2022 15:12:26 +0000
Received: by outflank-mailman (input) for mailman id 349141;
 Tue, 14 Jun 2022 15:12:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2Dja=WV=linaro.org=richard.henderson@srs-se1.protection.inumbo.net>)
 id 1o18DQ-0006hy-AY
 for xen-devel@lists.xenproject.org; Tue, 14 Jun 2022 15:12:24 +0000
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [2607:f8b0:4864:20::1029])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 639a4456-ebf4-11ec-a26a-b96bd03d9e80;
 Tue, 14 Jun 2022 17:12:22 +0200 (CEST)
Received: by mail-pj1-x1029.google.com with SMTP id
 gc3-20020a17090b310300b001e33092c737so9318983pjb.3
 for <xen-devel@lists.xenproject.org>; Tue, 14 Jun 2022 08:12:22 -0700 (PDT)
Received: from [192.168.159.227] ([50.208.55.229])
 by smtp.gmail.com with ESMTPSA id
 y9-20020a170902864900b00168c1668a49sm7368707plt.85.2022.06.14.08.11.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Jun 2022 08:12:20 -0700 (PDT)
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
X-Inumbo-ID: 639a4456-ebf4-11ec-a26a-b96bd03d9e80
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=YM2YngzMkaGIWHpkf6M7ADa9V1hMmADYOG1MXNhlzWE=;
        b=Hua16gKf/ZBdAKXYPXFTnxhFrivxJk4e10lo8ixeYNmksvupoHrmXJ2RGnzwEJq9iv
         kBa31EaF9odSqcB9dv9APd67sxav2GhXvynfpLM6KVmzCrzPlM35sYCDPOfdKsc8+d/D
         my1JQ0/AMOCSnpUjDjjYrWiNTuNXuxbGtaEpanQNHqAsSfl/85olI3ai83sD21BSd0xn
         NV14E/MWURYOtWYbmQPtZyQXRECtXIv+zkG5/YC6EVzSXvEHSjw0Hn7kyRCtBDmDkn5F
         e/I+I/ofG/P/cmMt2Ekj5q0ZZSMAlnh1BBUogdRk3TRiDOpWzu2Dsh8lpQGinhxeit/C
         s2mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=YM2YngzMkaGIWHpkf6M7ADa9V1hMmADYOG1MXNhlzWE=;
        b=ZmkMAVOQpDYuwm24hZWpwCzagdsIAqCDmZvJPTJXcHetHIm19N4J8ZklO5IJiAtHlz
         WEu7xdLHLpK3dl0f9wmIeQOwCkInBKxKUsOVRQjrb/k8SLvUEon7Xtz91GaKeRzVz+3l
         lT0ajpIHa3XstwphGMqW//m4PXrlKT/F69wesuueiS1DDuWtkznNNhE0D8a2+yb7qt4o
         rtpWg4s4R4WPu079Syb3S3vlv4zkSV0WX+w9XSyG8C38iR4XgBUDKTsy79+OcMqdTBPi
         wGmA+Xr6yOFnKEjrBXgXwsh02GekijVK/g08/7DkD6vbWLh3o2TPKyUa105h1wNJlstb
         AU9w==
X-Gm-Message-State: AJIora//g5TT0oYX0l734U/QwxSyr950j6BJT9uEkc3GK25ljj3f2MWZ
	y7gSOEz5bt0xiN/gSdXU0O1Nrw==
X-Google-Smtp-Source: AGRyM1tjRZAqa5I7tdwTBMIp6PN2CGs2N7UY/5qPMrgEvGZ2f/pTTPIaidozXKlXn7LAd1/g8WZySA==
X-Received: by 2002:a17:90a:6849:b0:1ea:d05a:223a with SMTP id e9-20020a17090a684900b001ead05a223amr823789pjm.173.1655219541080;
        Tue, 14 Jun 2022 08:12:21 -0700 (PDT)
Message-ID: <ba496d86-3883-c7e2-9e06-76b62e111aa5@linaro.org>
Date: Tue, 14 Jun 2022 08:11:43 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PULL 00/15] Kraxel 20220614 patches
Content-Language: en-US
To: Gerd Hoffmann <kraxel@redhat.com>, qemu-devel@nongnu.org
Cc: Akihiko Odaki <akihiko.odaki@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 xen-devel@lists.xenproject.org, Paul Durrant <paul@xen.org>,
 Anthony Perard <anthony.perard@citrix.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 "Hongren (Zenithal) Zheng" <i@zenithal.me>,
 "Michael S. Tsirkin" <mst@redhat.com>, "Canokeys.org"
 <contact@canokeys.org>, Stefano Stabellini <sstabellini@kernel.org>
References: <20220614121610.508356-1-kraxel@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220614121610.508356-1-kraxel@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 6/14/22 05:15, Gerd Hoffmann wrote:
> The following changes since commit debd0753663bc89c86f5462a53268f2e3f680f60:
> 
>    Merge tag 'pull-testing-next-140622-1' of https://github.com/stsquad/qemu into staging (2022-06-13 21:10:57 -0700)
> 
> are available in the Git repository at:
> 
>    git://git.kraxel.org/qemu tags/kraxel-20220614-pull-request
> 
> for you to fetch changes up to b95b56311a0890da0c9f7fc624529c3d7f8dbce0:
> 
>    virtio-gpu: Respect UI refresh rate for EDID (2022-06-14 10:34:37 +0200)
> 
> ----------------------------------------------------------------
> usb: add CanoKey device, fixes for ehci + redir
> ui: fixes for gtk and cocoa, rework refresh rate
> virtio-gpu: scanout flush fix

Applied, thanks.  Please update https://wiki.qemu.org/ChangeLog/7.1 as appropriate.


r~


> 
> ----------------------------------------------------------------
> 
> Akihiko Odaki (4):
>    ui/cocoa: Fix poweroff request code
>    ui/console: Do not return a value with ui_info
>    ui: Deliver refresh rate via QemuUIInfo
>    virtio-gpu: Respect UI refresh rate for EDID
> 
> Arnout Engelen (1):
>    hw/usb/hcd-ehci: fix writeback order
> 
> Dongwon Kim (1):
>    virtio-gpu: update done only on the scanout associated with rect
> 
> Hongren (Zenithal) Zheng (6):
>    hw/usb: Add CanoKey Implementation
>    hw/usb/canokey: Add trace events
>    meson: Add CanoKey
>    docs: Add CanoKey documentation
>    docs/system/devices/usb: Add CanoKey to USB devices examples
>    MAINTAINERS: add myself as CanoKey maintainer
> 
> Joelle van Dyne (1):
>    usbredir: avoid queuing hello packet on snapshot restore
> 
> Volker Rümelin (2):
>    ui/gtk-gl-area: implement GL context destruction
>    ui/gtk-gl-area: create the requested GL context version
> 
>   meson_options.txt                |   2 +
>   hw/usb/canokey.h                 |  69 +++++++
>   include/hw/virtio/virtio-gpu.h   |   1 +
>   include/ui/console.h             |   4 +-
>   include/ui/gtk.h                 |   2 +-
>   hw/display/virtio-gpu-base.c     |   7 +-
>   hw/display/virtio-gpu.c          |   4 +
>   hw/display/virtio-vga.c          |   5 +-
>   hw/display/xenfb.c               |  14 +-
>   hw/usb/canokey.c                 | 313 +++++++++++++++++++++++++++++++
>   hw/usb/hcd-ehci.c                |   5 +-
>   hw/usb/redirect.c                |   3 +-
>   hw/vfio/display.c                |   8 +-
>   ui/console.c                     |   6 -
>   ui/gtk-egl.c                     |   4 +-
>   ui/gtk-gl-area.c                 |  42 ++++-
>   ui/gtk.c                         |  45 +++--
>   MAINTAINERS                      |   8 +
>   docs/system/device-emulation.rst |   1 +
>   docs/system/devices/canokey.rst  | 168 +++++++++++++++++
>   docs/system/devices/usb.rst      |   4 +
>   hw/usb/Kconfig                   |   5 +
>   hw/usb/meson.build               |   5 +
>   hw/usb/trace-events              |  16 ++
>   meson.build                      |   6 +
>   scripts/meson-buildoptions.sh    |   3 +
>   ui/cocoa.m                       |   6 +-
>   ui/trace-events                  |   2 +
>   28 files changed, 707 insertions(+), 51 deletions(-)
>   create mode 100644 hw/usb/canokey.h
>   create mode 100644 hw/usb/canokey.c
>   create mode 100644 docs/system/devices/canokey.rst
> 


