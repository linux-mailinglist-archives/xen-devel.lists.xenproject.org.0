Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DBD0E6B3C7A
	for <lists+xen-devel@lfdr.de>; Fri, 10 Mar 2023 11:40:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.508463.783126 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1paa9Q-0005vw-Ce; Fri, 10 Mar 2023 10:39:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 508463.783126; Fri, 10 Mar 2023 10:39:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1paa9Q-0005sg-8j; Fri, 10 Mar 2023 10:39:04 +0000
Received: by outflank-mailman (input) for mailman id 508463;
 Fri, 10 Mar 2023 10:39:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VN0O=7C=redhat.com=thuth@srs-se1.protection.inumbo.net>)
 id 1paa9O-0005rD-By
 for xen-devel@lists.xenproject.org; Fri, 10 Mar 2023 10:39:02 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c3d83f03-bf2f-11ed-87f5-c1b5be75604c;
 Fri, 10 Mar 2023 11:39:00 +0100 (CET)
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-343-gH9lfLG0Mp2ZC7ZZ7qsavQ-1; Fri, 10 Mar 2023 05:38:57 -0500
Received: by mail-wm1-f72.google.com with SMTP id
 l31-20020a05600c1d1f00b003e8626cdd42so1642605wms.3
 for <xen-devel@lists.xenproject.org>; Fri, 10 Mar 2023 02:38:57 -0800 (PST)
Received: from [192.168.0.2] (ip-109-43-178-140.web.vodafone.de.
 [109.43.178.140]) by smtp.gmail.com with ESMTPSA id
 h19-20020a05600c351300b003e2058a7109sm2840339wmq.14.2023.03.10.02.38.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Mar 2023 02:38:55 -0800 (PST)
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
X-Inumbo-ID: c3d83f03-bf2f-11ed-87f5-c1b5be75604c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678444738;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uLsSJ9HfwXSuLvEmI+ykLii9J7TAAUU/sN9QFRCPKLM=;
	b=VZeu/Lcsfy0gsUeMawE77mhMz8FXgeAVsNuaKGl/79LJcri3ev+ajKAFhPjXR8X/ThJ8S2
	leWaB++h4uL5qc80WvWwOpcSlrVdR+cnqROAi5IERyD1XKcVc0nmYlN9wHP4vMCaNaCDDO
	dN9TVSA/GqCF540QvY6V0vzbVTFaF48=
X-MC-Unique: gH9lfLG0Mp2ZC7ZZ7qsavQ-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678444736;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uLsSJ9HfwXSuLvEmI+ykLii9J7TAAUU/sN9QFRCPKLM=;
        b=12gpzv2+1P4TGf0PWcz2ToZYbJET3+G5IqmcIrtK7SSrqJ9ekDWJaOvns2UpNJ1iZZ
         TvnfaFKEN64cv1ACPwlnhjZZRUExtGQ9M2h0N1t0kf4CFD/kVYRY/k5zve8KRA+HK1gw
         YeLZB2/Ciw7KKBDAbcbL8uzaswNGYznublIcF0Ly/O7XeAIToIuiwhKZh2An1ZRuWFW6
         FNTp1JCJH7PpgJx0+DsfdoiYpW9hJhcvHZhnyE2arcT4jyQNcoru/aYouSpDfYBvZWsc
         X5fx5yh2e4YDd6X9yQODbW/3K0v+1YCR0eXFd6Epq06vMf+heqt/lGWlxI40GazqM5ro
         t1EQ==
X-Gm-Message-State: AO0yUKULydi92xq12H85YnLRNztVu8K91ap/GodCZf19VY5HQEpmp/38
	Ou5cjKs8oZsLY1vqEQmcH5RlJbH0YOo/Ul3n3zqcOytN6peVv6nwyPo3paiuPNABrLYR06ws6vJ
	rshYHy+kgwybPocXlYTCW1eF93iA=
X-Received: by 2002:a05:600c:4f44:b0:3eb:383c:1870 with SMTP id m4-20020a05600c4f4400b003eb383c1870mr2188779wmq.11.1678444736263;
        Fri, 10 Mar 2023 02:38:56 -0800 (PST)
X-Google-Smtp-Source: AK7set9TrEJ0rqjEGofCtU/tMmbs/X59NXj5FV3c7sySdDmqWmiZ57yMWYZ+XYP/NP20l27b3iCfjA==
X-Received: by 2002:a05:600c:4f44:b0:3eb:383c:1870 with SMTP id m4-20020a05600c4f4400b003eb383c1870mr2188722wmq.11.1678444735868;
        Fri, 10 Mar 2023 02:38:55 -0800 (PST)
Message-ID: <289e9e47-be6d-1f7f-b0b6-f5b9ed5bc1e8@redhat.com>
Date: Fri, 10 Mar 2023 11:38:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
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
 Siqi Chen <coc.cyqh@gmail.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>,
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Amit Shah <amit@kernel.org>, =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?=
 <marcandre.lureau@redhat.com>, John Snow <jsnow@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Keith Busch <kbusch@kernel.org>, Klaus Jensen <its@irrelevant.dk>,
 Fam Zheng <fam@euphon.net>, Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 "open list:X86 Xen CPUs" <xen-devel@lists.xenproject.org>,
 "open list:virtio-blk" <qemu-block@nongnu.org>,
 "open list:i.MX31 (kzm)" <qemu-arm@nongnu.org>,
 "open list:Old World (g3beige)" <qemu-ppc@nongnu.org>
References: <20230205040737.3567731-1-alxndr@bu.edu>
 <20230205040737.3567731-5-alxndr@bu.edu>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH v6 4/4] hw: replace most qemu_bh_new calls with
 qemu_bh_new_guarded
In-Reply-To: <20230205040737.3567731-5-alxndr@bu.edu>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 05/02/2023 05.07, Alexander Bulekov wrote:
> This protects devices from bh->mmio reentrancy issues.
> 
> Reviewed-by: Darren Kenny <darren.kenny@oracle.com>
> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
> Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
> ---
...
> diff --git a/hw/9pfs/xen-9p-backend.c b/hw/9pfs/xen-9p-backend.c
> index 65c4979c3c..f077c1b255 100644
> --- a/hw/9pfs/xen-9p-backend.c
> +++ b/hw/9pfs/xen-9p-backend.c
> @@ -441,7 +441,9 @@ static int xen_9pfs_connect(struct XenLegacyDevice *xendev)
>           xen_9pdev->rings[i].ring.out = xen_9pdev->rings[i].data +
>                                          XEN_FLEX_RING_SIZE(ring_order);
>   
> -        xen_9pdev->rings[i].bh = qemu_bh_new(xen_9pfs_bh, &xen_9pdev->rings[i]);
> +        xen_9pdev->rings[i].bh = qemu_bh_new_guarded(xen_9pfs_bh,
> +                                                     &xen_9pdev->rings[i],
> +                                                     &DEVICE(xen_9pdev)->mem_reentrancy_guard);

xen_9pdev is not derived from DeviceState, so you must not cast it with 
DEVICE().

> diff --git a/hw/ide/ahci.c b/hw/ide/ahci.c
> index 7ce001cacd..37091150cb 100644
> --- a/hw/ide/ahci.c
> +++ b/hw/ide/ahci.c
> @@ -1508,7 +1508,8 @@ static void ahci_cmd_done(const IDEDMA *dma)
>       ahci_write_fis_d2h(ad);
>   
>       if (ad->port_regs.cmd_issue && !ad->check_bh) {
> -        ad->check_bh = qemu_bh_new(ahci_check_cmd_bh, ad);
> +        ad->check_bh = qemu_bh_new_guarded(ahci_check_cmd_bh, ad,
> +                                           &DEVICE(ad)->mem_reentrancy_guard);
>           qemu_bh_schedule(ad->check_bh);
>       }
>   }

Dito - ad is not derived from DeviceState, so you cannot use DEVICE() here.

(This was causing the crash in the macOS CI job)

> diff --git a/hw/ide/core.c b/hw/ide/core.c
> index 5d1039378f..8c8d1a8ec2 100644
> --- a/hw/ide/core.c
> +++ b/hw/ide/core.c
> @@ -519,7 +519,8 @@ BlockAIOCB *ide_issue_trim(
>   
>       iocb = blk_aio_get(&trim_aiocb_info, s->blk, cb, cb_opaque);
>       iocb->s = s;
> -    iocb->bh = qemu_bh_new(ide_trim_bh_cb, iocb);
> +    iocb->bh = qemu_bh_new_guarded(ide_trim_bh_cb, iocb,
> +                                   &DEVICE(s)->mem_reentrancy_guard);

IDEState s is also not directly derived from DeviceState. Not sure, but 
maybe you can get to the device here in a similar way that is done in 
ide_identify() :

      IDEDevice *dev = s->unit ? s->bus->slave : s->bus->master;

?

> diff --git a/hw/virtio/virtio-balloon.c b/hw/virtio/virtio-balloon.c
> index 746f07c4d2..309cebacc6 100644
> --- a/hw/virtio/virtio-balloon.c
> +++ b/hw/virtio/virtio-balloon.c
> @@ -908,8 +908,9 @@ static void virtio_balloon_device_realize(DeviceState *dev, Error **errp)
>           precopy_add_notifier(&s->free_page_hint_notify);
>   
>           object_ref(OBJECT(s->iothread));
> -        s->free_page_bh = aio_bh_new(iothread_get_aio_context(s->iothread),
> -                                     virtio_ballloon_get_free_page_hints, s);
> +        s->free_page_bh = aio_bh_new_guarded(iothread_get_aio_context(s->iothread),
> +                                             virtio_ballloon_get_free_page_hints, s,
> +                                             &DEVICE(s)->mem_reentrancy_guard);

You could use "dev" instead of "s" here to get rid of the DEVICE() cast.

The remaining changes look fine to me.

  Thomas


