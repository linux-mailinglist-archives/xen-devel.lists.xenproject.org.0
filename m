Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB7496D52CF
	for <lists+xen-devel@lfdr.de>; Mon,  3 Apr 2023 22:47:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.517606.803201 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjR5C-0001H0-R6; Mon, 03 Apr 2023 20:47:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 517606.803201; Mon, 03 Apr 2023 20:47:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjR5C-0001E3-OM; Mon, 03 Apr 2023 20:47:18 +0000
Received: by outflank-mailman (input) for mailman id 517606;
 Mon, 03 Apr 2023 20:47:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fvMM=72=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1pjR5A-0001Dx-IY
 for xen-devel@lists.xenproject.org; Mon, 03 Apr 2023 20:47:16 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b77cc6db-d260-11ed-85db-49a42c6b2330;
 Mon, 03 Apr 2023 22:47:15 +0200 (CEST)
Received: by mail-wm1-x32b.google.com with SMTP id
 d11-20020a05600c3acb00b003ef6e6754c5so15174647wms.5
 for <xen-devel@lists.xenproject.org>; Mon, 03 Apr 2023 13:47:15 -0700 (PDT)
Received: from [192.168.69.115] (pas38-h02-176-184-5-132.dsl.sta.abo.bbox.fr.
 [176.184.5.132]) by smtp.gmail.com with ESMTPSA id
 l32-20020a05600c1d2000b003f0321c22basm19001040wms.12.2023.04.03.13.47.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Apr 2023 13:47:14 -0700 (PDT)
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
X-Inumbo-ID: b77cc6db-d260-11ed-85db-49a42c6b2330
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680554835;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lQW83CaEFIKTAbTGMK7zJAXx2zCsHH8oRPYKrzlIxPw=;
        b=fNGh2NV6/uj7FXzhYWT2H2X1iMgLhYqx5DQL6GwdoEYEHkvIK7KGPOYxFcq407H4T+
         SPpDo7z8o68YlOOG65fHhKTjYHMuzp3pjBoINet7XgMWmiIsuJq1JC7vZu25hbshHqkm
         4ePpZieKILGkS/7UVLBCblFqD/mw2XE4aUt4Op92vlqL4PkWxCqswfJkmLEw9eJJvlmP
         BOjt3AZDAkZEszXzDqBSBhAJ0++TjQg0Qhn2xutvRsF0zqVsrFK49JBMJ94rsnhv/u5Z
         UHdh2GTjPUtx1NU5SFlV6jvmMTsWTt8WzXQWdclyISmEQ/TtGy22fxDk3RZzbbD9OIHP
         dbUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680554835;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lQW83CaEFIKTAbTGMK7zJAXx2zCsHH8oRPYKrzlIxPw=;
        b=M8YdRhSIDmLFK17YKeoEiDcq/gmUuUqaiSkGZ7ygQVVKeOIV4NR8nwP5vIXo35bmR4
         h+weTKi+Y4+XACyJ4KLUN7goNemqtXa4TNrsklyHhYM8Tmn8YMLFcVnqtme/5Nj6C75+
         V2j3RTlknhpnzf7PpXQwMti3ZMZvwRQKlcuKG9PfYLrjUpqCYJt/yMUPXRRXjiKYsFtl
         Wp72D1SW1TZX3QXsH5QqsLVlA2Qj1Tx/0BWqzzhMydfBzuGZWauXpQygtlVr1IN5E54p
         R3f/BWk2VURVZj2c0FxEnujgZ0u67dISFaHqAbgpLIx8VdJYcON85RewfE1tNgP0bWmu
         xOxQ==
X-Gm-Message-State: AAQBX9cqQwhdwD5DvpT9g51M+o6btFiW86yCqL2/hWdfS6cCZi4rd+gO
	Hy3PY3gghG/ja+O/jr/TXBLexA==
X-Google-Smtp-Source: AKy350YJckSFRktwO+Ap2UM2V7mr6N7rsDxT5yrMXbEjRUK205rt4FU3Ijr4q2cDcOnc7yvmq+n7YQ==
X-Received: by 2002:a05:600c:3789:b0:3ee:b3bf:5f7c with SMTP id o9-20020a05600c378900b003eeb3bf5f7cmr491399wmr.23.1680554835048;
        Mon, 03 Apr 2023 13:47:15 -0700 (PDT)
Message-ID: <2bbe988c-0802-55c3-b2a3-05e3f94e2f04@linaro.org>
Date: Mon, 3 Apr 2023 22:47:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.0
Subject: Re: [PATCH 01/13] virtio-scsi: avoid race between unplug and
 transport event
Content-Language: en-US
To: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Julia Suvorova <jusual@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Peter Lieven <pl@kamp.de>,
 Coiby Xu <Coiby.Xu@gmail.com>, xen-devel@lists.xenproject.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Stefano Garzarella <sgarzare@redhat.com>, qemu-block@nongnu.org,
 Eduardo Habkost <eduardo@habkost.net>, Paul Durrant <paul@xen.org>,
 "Richard W.M. Jones" <rjones@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Aarushi Mehta <mehta.aaru20@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Fam Zheng <fam@euphon.net>,
 David Woodhouse <dwmw2@infradead.org>, Stefan Weil <sw@weilnetz.de>,
 Juan Quintela <quintela@redhat.com>, Xie Yongji <xieyongji@bytedance.com>,
 Hanna Reitz <hreitz@redhat.com>, Ronnie Sahlberg <ronniesahlberg@gmail.com>,
 eesposit@redhat.com, "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>
References: <20230403183004.347205-1-stefanha@redhat.com>
 <20230403183004.347205-2-stefanha@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230403183004.347205-2-stefanha@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/4/23 20:29, Stefan Hajnoczi wrote:
> Only report a transport reset event to the guest after the SCSIDevice
> has been unrealized by qdev_simple_device_unplug_cb().
> 
> qdev_simple_device_unplug_cb() sets the SCSIDevice's qdev.realized field
> to false so that scsi_device_find/get() no longer see it.
> 
> scsi_target_emulate_report_luns() also needs to be updated to filter out
> SCSIDevices that are unrealized.
> 
> These changes ensure that the guest driver does not see the SCSIDevice
> that's being unplugged if it responds very quickly to the transport
> reset event.
> 
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>   hw/scsi/scsi-bus.c    |  3 ++-
>   hw/scsi/virtio-scsi.c | 18 +++++++++---------
>   2 files changed, 11 insertions(+), 10 deletions(-)
> 
> diff --git a/hw/scsi/scsi-bus.c b/hw/scsi/scsi-bus.c
> index c97176110c..f9bd064833 100644
> --- a/hw/scsi/scsi-bus.c
> +++ b/hw/scsi/scsi-bus.c
> @@ -487,7 +487,8 @@ static bool scsi_target_emulate_report_luns(SCSITargetReq *r)
>               DeviceState *qdev = kid->child;
>               SCSIDevice *dev = SCSI_DEVICE(qdev);
>   
> -            if (dev->channel == channel && dev->id == id && dev->lun != 0) {
> +            if (dev->channel == channel && dev->id == id && dev->lun != 0 &&
> +                qatomic_load_acquire(&dev->qdev.realized)) {

Would this be more useful as a qdev_is_realized() helper?

