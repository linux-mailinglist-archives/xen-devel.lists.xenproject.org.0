Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EA33455453A
	for <lists+xen-devel@lfdr.de>; Wed, 22 Jun 2022 12:20:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.353728.580699 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o3xTQ-0008DY-1P; Wed, 22 Jun 2022 10:20:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 353728.580699; Wed, 22 Jun 2022 10:20:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o3xTP-0008BM-Ux; Wed, 22 Jun 2022 10:20:35 +0000
Received: by outflank-mailman (input) for mailman id 353728;
 Wed, 22 Jun 2022 10:20:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sIgH=W5=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1o3xTO-0008BG-HM
 for xen-devel@lists.xenproject.org; Wed, 22 Jun 2022 10:20:34 +0000
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [2a00:1450:4864:20::236])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f338e0b7-f214-11ec-bd2d-47488cf2e6aa;
 Wed, 22 Jun 2022 12:20:33 +0200 (CEST)
Received: by mail-lj1-x236.google.com with SMTP id b23so10187209ljh.7
 for <xen-devel@lists.xenproject.org>; Wed, 22 Jun 2022 03:20:33 -0700 (PDT)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id
 be25-20020a05651c171900b0025a877115e1sm265981ljb.76.2022.06.22.03.20.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Jun 2022 03:20:32 -0700 (PDT)
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
X-Inumbo-ID: f338e0b7-f214-11ec-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=BRog1sj+gmItJaQDKR7qvCAZWvkZ7pMz9+40o0vf0Gk=;
        b=UUojOJ/3GhSFIDFWciEjoZf31boWvOwfY/A6y80DZ2AqPaRsjijeEEkpKd45yfIx5X
         T5qwiHEcn+WfjIIofETUIL7tz5LDB4zY9kp9MXSk6OQPXBGINu1crWi36K4nlSPbmcb5
         ns2UU7VZZeTIkiEYmto2v5NIYv2eILa9rB1/5m64RuLA/T0D6ZO6Un72OVDXzcAUPK+l
         PPhyMaBqxhtQ7JBQjyj1kQGTXUr7u1jwMg9s0CMFPrR/rrEjUDhn9YWO0WIMfv01mIdK
         RsQBg9tKET+3y74+Bak6nDomvtwsGEXS410Cmc+nH5udKp7knt0HGyjhmQU3pC/HNiwM
         N4RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=BRog1sj+gmItJaQDKR7qvCAZWvkZ7pMz9+40o0vf0Gk=;
        b=Tt3cuywUqOZ3H2xb/nsSOAJdk0EyEiBmre5GQW+JzEc3JEotHh42znLKpV30/1ixxR
         A2hw1JJEdmfdY3PPndIPMDf4GuaZ2vwyPgHkUCxHKzreTqamrYS2mgk5C03GNcf02qs7
         yof2rNUxTksjczdMMsAr8Rp3h4w0psUXRfpFbe/haw63Fm9njRZ3REQPJFJ9Vu59h+F3
         U221fggfEtEAh0CDCW48kRhhrd/nNRtxCOc11klQ8V/B/n5IxsmwImU2AkiNqGreIrSw
         wPxZJjErV9rwQYeBSKRn+t2FzBuzwDx1POpi1tHZW9enMcgJTIg7DruLx/oW2A3CoZDj
         M3qA==
X-Gm-Message-State: AJIora/9Cgi6jYSDKPLlyDMGwwx+mXNjD/ADGdtV0DpTUGqpspvMZ31D
	jO635p4fno7HfDTxBpu09i4=
X-Google-Smtp-Source: AGRyM1vNLGnKO9vo5sGvPhUVSiHmsOOuuHKaW0/zVzi+GGSxVG3rdNUjYtWUArgnCHBYbBTSu/+bRQ==
X-Received: by 2002:a05:651c:2105:b0:255:90b3:835c with SMTP id a5-20020a05651c210500b0025590b3835cmr1466695ljq.414.1655893233121;
        Wed, 22 Jun 2022 03:20:33 -0700 (PDT)
Subject: Re: [PATCH v3 0/3] virtio: support requiring restricted access per
 device
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org,
 x86@kernel.org, linux-s390@vger.kernel.org, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, linux-arch@vger.kernel.org
Cc: Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, Andy Lutomirski
 <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Arnd Bergmann <arnd@arndb.de>, Russell King <linux@armlinux.org.uk>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 linux-arm-kernel@lists.infradead.org
References: <20220622063838.8854-1-jgross@suse.com>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <7eb66aec-df40-4e12-8211-8a6db4ad6060@gmail.com>
Date: Wed, 22 Jun 2022 13:20:30 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20220622063838.8854-1-jgross@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 22.06.22 09:38, Juergen Gross wrote:

Hello Juergen

> Instead of an all or nothing approach add support for requiring
> restricted memory access per device.
>
> Changes in V3:
> - new patches 1 + 2
> - basically complete rework of patch 3
>
> Juergen Gross (3):
>    virtio: replace restricted mem access flag with callback
>    kernel: remove platform_has() infrastructure
>    xen: don't require virtio with grants for non-PV guests
>
>   MAINTAINERS                            |  8 --------
>   arch/arm/xen/enlighten.c               |  4 +++-
>   arch/s390/mm/init.c                    |  4 ++--
>   arch/x86/mm/mem_encrypt_amd.c          |  4 ++--
>   arch/x86/xen/enlighten_hvm.c           |  4 +++-
>   arch/x86/xen/enlighten_pv.c            |  5 ++++-
>   drivers/virtio/Kconfig                 |  4 ++++
>   drivers/virtio/Makefile                |  1 +
>   drivers/virtio/virtio.c                |  4 ++--
>   drivers/virtio/virtio_anchor.c         | 18 +++++++++++++++++
>   drivers/xen/Kconfig                    |  9 +++++++++
>   drivers/xen/grant-dma-ops.c            | 10 ++++++++++
>   include/asm-generic/Kbuild             |  1 -
>   include/asm-generic/platform-feature.h |  8 --------
>   include/linux/platform-feature.h       | 19 ------------------
>   include/linux/virtio_anchor.h          | 19 ++++++++++++++++++
>   include/xen/xen-ops.h                  |  6 ++++++
>   include/xen/xen.h                      |  8 --------
>   kernel/Makefile                        |  2 +-
>   kernel/platform-feature.c              | 27 --------------------------
>   20 files changed, 84 insertions(+), 81 deletions(-)
>   create mode 100644 drivers/virtio/virtio_anchor.c
>   delete mode 100644 include/asm-generic/platform-feature.h
>   delete mode 100644 include/linux/platform-feature.h
>   create mode 100644 include/linux/virtio_anchor.h
>   delete mode 100644 kernel/platform-feature.c

I have tested the series on Arm64 guest using Xen hypervisor and didn't 
notice any issues.


I assigned two virtio-mmio devices to the guest:
#1 - grant dma device (required DT binding is present, so 
xen_is_grant_dma_device() returns true), virtio-mmio modern transport 
(backend offers VIRTIO_F_VERSION_1, VIRTIO_F_ACCESS_PLATFORM)
#2 - non grant dma device (required DT binding is absent, so 
xen_is_grant_dma_device() returns false), virtio-mmio legacy transport 
(backend does not offer these flags)


# CONFIG_XEN_VIRTIO is not set

both works, and both do not use grant mappings for virtio


CONFIG_XEN_VIRTIO=y
# CONFIG_XEN_VIRTIO_FORCE_GRANT is not set

both works, #1 uses grant mappings for virtio, #2 does not use it


CONFIG_XEN_VIRTIO=y
CONFIG_XEN_VIRTIO_FORCE_GRANT=y

only #1 works and uses grant mappings for virtio, #2 was rejected by 
validation in virtio_features_ok()


You can add my:
Tested-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com> # Arm64 
guest using Xen


>
-- 
Regards,

Oleksandr Tyshchenko


