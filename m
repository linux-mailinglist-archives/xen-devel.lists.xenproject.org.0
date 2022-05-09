Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5610951FE08
	for <lists+xen-devel@lfdr.de>; Mon,  9 May 2022 15:23:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.324545.546647 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1no3MH-0002jR-FF; Mon, 09 May 2022 13:23:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 324545.546647; Mon, 09 May 2022 13:23:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1no3MH-0002hd-Bc; Mon, 09 May 2022 13:23:29 +0000
Received: by outflank-mailman (input) for mailman id 324545;
 Mon, 09 May 2022 13:23:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=q9uc=VR=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1no3MG-0002hX-1X
 for xen-devel@lists.xenproject.org; Mon, 09 May 2022 13:23:28 +0000
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [2a00:1450:4864:20::134])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2ee86ba5-cf9b-11ec-8fc4-03012f2f19d4;
 Mon, 09 May 2022 15:23:15 +0200 (CEST)
Received: by mail-lf1-x134.google.com with SMTP id p26so10507767lfh.10
 for <xen-devel@lists.xenproject.org>; Mon, 09 May 2022 06:23:27 -0700 (PDT)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id
 h5-20020a056512338500b0047255d2111csm1941442lfg.75.2022.05.09.06.23.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 May 2022 06:23:25 -0700 (PDT)
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
X-Inumbo-ID: 2ee86ba5-cf9b-11ec-8fc4-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=1K2obVx3YG8QEPrenU4QI5guJQ8Phbo/6yP70JTaawU=;
        b=ctuOdHCyg4DfJDMuVyrfXjafqsIBGrPq9u27BiBAquJftMSjYFJ55Dztcsr8bNMn0w
         oeM//L+QbMc5cqR/YL4ZYXu9SspJYNvQLipuO/dxUV/COK7qJD4YPieEuwN+Da6gnICg
         tiL5ifQOF61sLM7j5k+TfKf3keD2QE9+mfbjkcLau1uokLQ0TJXXWGRj10hWZc6mNTCY
         ZiPlrCXkxh/d8AP+hVzj144bdbLZ6gunWEeo3XTOHdZMf+1T4Dk4fDvhUDM82hKq6q3x
         a24gfPwl0eQuynyAnF+v9tUB7WbmPEsnBDi3opOHoOjQkJbqyH8fYmRySBDQ1lHi3t+I
         lY6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=1K2obVx3YG8QEPrenU4QI5guJQ8Phbo/6yP70JTaawU=;
        b=DUjh/Eb0Uqjrv1QWktIlfIv0P8WIdLR/aeEDWz2zLdlZ+8o+4v7aINZMzC9CmZgI+d
         HE6Pu9PN/1lYvhxwbWwmAGMEAMDJfgFm9fH6q/ZcTT7MDs1DqLa+qN72V8csebMpfWli
         AeIMeQ6wwPfctn8K31ex6VIYglG4gR7p2lAzrnMau2TO2rIm5JiNKSxxSYiXhQTFkhoY
         GR5tU2Nzh2z6mZ3rk84XX1AShITT/DjellbMdFLt+L2cxNg97//9uzb3CmeazQdnksI2
         ycr+2TCHLiwHg27dKp8EIGfv2tytfR/0KjyRvtSs6+GBC/YynjRl3byjo6yTRREP0Vkx
         CsRg==
X-Gm-Message-State: AOAM532UDEopi24ndeVqOLma6nfTU8OXfvQ2QKdMDXBEJKIR7bO84XK9
	yGWkVP9TaGMuLvwzPkeMTgY=
X-Google-Smtp-Source: ABdhPJy54uNV0a0Y5a5xZUhU6QHCMVecZmAJ2frVW6KAYppShjM44jXuH8rdrMemcTVYgMIiSG1E7g==
X-Received: by 2002:ac2:4c49:0:b0:473:ca4f:9345 with SMTP id o9-20020ac24c49000000b00473ca4f9345mr12622420lfk.203.1652102606387;
        Mon, 09 May 2022 06:23:26 -0700 (PDT)
Subject: Re: [PATCH v3 00/21] xen: simplify frontend side ring setup
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org,
 linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
 netdev@vger.kernel.org, linux-scsi@vger.kernel.org,
 linux-usb@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-integrity@vger.kernel.org, linux-pci@vger.kernel.org
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Jens Axboe <axboe@kernel.dk>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "James E.J. Bottomley"
 <jejb@linux.ibm.com>, "Martin K. Petersen" <martin.petersen@oracle.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 alsa-devel@alsa-project.org, Peter Huewe <peterhuewe@gmx.de>,
 Jarkko Sakkinen <jarkko@kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 Bjorn Helgaas <bhelgaas@google.com>
References: <20220505081640.17425-1-jgross@suse.com>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <409fb110-646a-2973-aff3-c97fdfb9bfbc@gmail.com>
Date: Mon, 9 May 2022 16:23:24 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20220505081640.17425-1-jgross@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 05.05.22 11:16, Juergen Gross wrote:

Hello Juergen.



> Many Xen PV frontends share similar code for setting up a ring page
> (allocating and granting access for the backend) and for tearing it
> down.
>
> Create new service functions doing all needed steps in one go.
>
> This requires all frontends to use a common value for an invalid
> grant reference in order to make the functions idempotent.
>
> Changes in V3:
> - new patches 1 and 2, comments addressed
>
> Changes in V2:
> - new patch 9 and related changes in patches 10-18
>
> Juergen Gross (21):
>    xen: update grant_table.h
>    xen/grant-table: never put a reserved grant on the free list
>    xen/blkfront: switch blkfront to use INVALID_GRANT_REF
>    xen/netfront: switch netfront to use INVALID_GRANT_REF
>    xen/scsifront: remove unused GRANT_INVALID_REF definition
>    xen/usb: switch xen-hcd to use INVALID_GRANT_REF
>    xen/drm: switch xen_drm_front to use INVALID_GRANT_REF
>    xen/sound: switch xen_snd_front to use INVALID_GRANT_REF
>    xen/dmabuf: switch gntdev-dmabuf to use INVALID_GRANT_REF
>    xen/shbuf: switch xen-front-pgdir-shbuf to use INVALID_GRANT_REF
>    xen: update ring.h
>    xen/xenbus: add xenbus_setup_ring() service function
>    xen/blkfront: use xenbus_setup_ring() and xenbus_teardown_ring()
>    xen/netfront: use xenbus_setup_ring() and xenbus_teardown_ring()
>    xen/tpmfront: use xenbus_setup_ring() and xenbus_teardown_ring()
>    xen/drmfront: use xenbus_setup_ring() and xenbus_teardown_ring()
>    xen/pcifront: use xenbus_setup_ring() and xenbus_teardown_ring()
>    xen/scsifront: use xenbus_setup_ring() and xenbus_teardown_ring()
>    xen/usbfront: use xenbus_setup_ring() and xenbus_teardown_ring()
>    xen/sndfront: use xenbus_setup_ring() and xenbus_teardown_ring()
>    xen/xenbus: eliminate xenbus_grant_ring()


For the patches that touch PV display (#07, #16), PV sound (#08, #20) 
and shared buffer framework used by both frontends (#10):

Reviewed-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>


Also I didn't see any issues with these frontends while testing on Arm64 
based board.
So, you can also add:

[Arm64 only]
Tested-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>


Thanks!


>
>   drivers/block/xen-blkfront.c                |  57 +++----
>   drivers/char/tpm/xen-tpmfront.c             |  18 +--
>   drivers/gpu/drm/xen/xen_drm_front.h         |   9 --
>   drivers/gpu/drm/xen/xen_drm_front_evtchnl.c |  43 ++----
>   drivers/net/xen-netfront.c                  |  85 ++++-------
>   drivers/pci/xen-pcifront.c                  |  19 +--
>   drivers/scsi/xen-scsifront.c                |  31 +---
>   drivers/usb/host/xen-hcd.c                  |  65 ++------
>   drivers/xen/gntdev-dmabuf.c                 |  13 +-
>   drivers/xen/grant-table.c                   |  12 +-
>   drivers/xen/xen-front-pgdir-shbuf.c         |  18 +--
>   drivers/xen/xenbus/xenbus_client.c          |  82 +++++++---
>   include/xen/grant_table.h                   |   2 -
>   include/xen/interface/grant_table.h         | 161 ++++++++++++--------
>   include/xen/interface/io/ring.h             |  19 ++-
>   include/xen/xenbus.h                        |   4 +-
>   sound/xen/xen_snd_front_evtchnl.c           |  44 ++----
>   sound/xen/xen_snd_front_evtchnl.h           |   9 --
>   18 files changed, 287 insertions(+), 404 deletions(-)
>
-- 
Regards,

Oleksandr Tyshchenko


