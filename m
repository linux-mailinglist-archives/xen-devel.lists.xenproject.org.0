Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 51B5A7E9296
	for <lists+xen-devel@lfdr.de>; Sun, 12 Nov 2023 21:30:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.631213.984247 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2H4y-0002q5-BQ; Sun, 12 Nov 2023 20:29:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 631213.984247; Sun, 12 Nov 2023 20:29:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2H4y-0002nw-8L; Sun, 12 Nov 2023 20:29:12 +0000
Received: by outflank-mailman (input) for mailman id 631213;
 Sun, 12 Nov 2023 20:29:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mXgX=GZ=gmail.com=xadimgnik@srs-se1.protection.inumbo.net>)
 id 1r2H4w-0002nE-QZ
 for xen-devel@lists.xenproject.org; Sun, 12 Nov 2023 20:29:10 +0000
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 22a0b9e8-819a-11ee-98da-6d05b1d4d9a1;
 Sun, 12 Nov 2023 21:29:10 +0100 (CET)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-32f78dcf036so2817066f8f.0
 for <xen-devel@lists.xenproject.org>; Sun, 12 Nov 2023 12:29:10 -0800 (PST)
Received: from [192.168.199.91] (54-240-197-234.amazon.com. [54.240.197.234])
 by smtp.gmail.com with ESMTPSA id
 l35-20020a05600c1d2300b0040839fcb217sm5902154wms.8.2023.11.12.12.29.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 12 Nov 2023 12:29:08 -0800 (PST)
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
X-Inumbo-ID: 22a0b9e8-819a-11ee-98da-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699820949; x=1700425749; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:organization:content-language
         :references:cc:to:subject:reply-to:user-agent:mime-version:date
         :message-id:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/jNU331KITmkVsASw63ZPNUrO3e5vY6PR21jPlzvpZI=;
        b=fbIImqPvJhZ+c6UUYJ+b9kgTEx4rBL7Mq7/UMCIgR1VJcyy5pBO54huMH78DxaUeXd
         R+hDVyO9rilttWdc5VcB8PBvIs+RVKiqYhSrLu6Sstxyur+BoK801eJMBU+gzIAOiXMH
         13MbZV1EpPwpPrLwTkB/d4lRQY0LN5ATEPP+pnxcEO7TIl5a3K8KHW3m2INQE7LwO2Mq
         rvYfosMvErDN+KylShENRxS7hCggEMlPlf/fS0dDfXJBQ/IoCgpmqOsvbP6en/eli/o+
         Slt4o9LrPpRQKnDv6yDsaxXVFehldepftMDJX6BHL1cyfUgI32fI3nJjXK7VThcjo06C
         Tylg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699820949; x=1700425749;
        h=content-transfer-encoding:in-reply-to:organization:content-language
         :references:cc:to:subject:reply-to:user-agent:mime-version:date
         :message-id:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/jNU331KITmkVsASw63ZPNUrO3e5vY6PR21jPlzvpZI=;
        b=b4VyufnVTWQ2oaQz+xG3t1XIp782td8HOWiq2o9KefWpg+DyG8Ix1cH494Z1/IfYKF
         tmD+WlcS8ooRoiY0jJ9zNysYbxRz0apHTsLSS2wSKIXM7gBcRvRKVE+QiFY7dXx1mXkb
         0NOit44kUKjXyy2X0KHnW+vjgJFYSugTK3Jlqsj+C8cI6dQD/tmW5G9apx/r2YqOmWo8
         FcseuzmJI7eYR0GkoinxtVikh9XvAOcRJo2Q7W/+v6xBTyI8h42gL3Z8IQolookHqYRA
         HGHLf+EeikKu6bG7c51SCm+1M7Cr/hPCz/BEITaxhfWQQg6MYESGKiKWCmOkoOLRSibI
         ky+w==
X-Gm-Message-State: AOJu0Ywjdf65yTeOEIWkFpEIiXa3uKcXZYVXKKBsoPWDsmnQuRd3oqDf
	23sti9kCjrGI36i18eZhqJ0=
X-Google-Smtp-Source: AGHT+IHOKXokV7EvaxoktV/LuS2AMerDvb5WvSP7RrTRcuvvQ0GFkNLwrvplBq2qwQ+GgfBFMpcYdQ==
X-Received: by 2002:a5d:64ae:0:b0:32d:d2aa:ed21 with SMTP id m14-20020a5d64ae000000b0032dd2aaed21mr8254274wrp.28.1699820949407;
        Sun, 12 Nov 2023 12:29:09 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <ac83b5b0-1def-47b5-9466-7fe42dba7ccd@xen.org>
Date: Sun, 12 Nov 2023 15:29:06 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: paul@xen.org
Subject: Re: [PATCH v1 1/7] xen-block: Do not write frontend nodes
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Cc: Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>, Kevin Wolf <kwolf@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>,
 "open list:X86 Xen CPUs" <xen-devel@lists.xenproject.org>,
 "open list:Block layer core" <qemu-block@nongnu.org>
References: <20231110204207.2927514-1-volodymyr_babchuk@epam.com>
 <20231110204207.2927514-2-volodymyr_babchuk@epam.com>
Content-Language: en-US
Organization: Xen Project
In-Reply-To: <20231110204207.2927514-2-volodymyr_babchuk@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/11/2023 15:42, Volodymyr Babchuk wrote:
> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> 
> The PV backend running in other than Dom0 domain (non toolstack domain)
> is not allowed to write frontend nodes. The more, the backend does not
> need to do that at all, this is purely toolstack/xl devd business.
> 
> I do not know for what reason the backend does that here, this is not really
> needed, probably it is just a leftover and all xen_device_frontend_printf()
> instances should go away completely.
>

It is not a leftover and it is needed in the case that QEMU is 
instantiating the backend unilaterally... i.e. without the involvement 
of any Xen toolstack.
Agreed that, if QEMU, is running in a deprivileged context, that is not 
an option. The correct way to determined this though is whether the 
device is being created via the QEMU command line or whether is being 
created because XenStore nodes written by a toolstack were discovered.
In the latter case there should be a XenBackendInstance that corresponds 
to the XenDevice whereas in the former case there should not be. For 
example, see xen_backend_try_device_destroy()

   Paul


> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
> ---
>   hw/block/xen-block.c | 11 +++++++----
>   hw/xen/xen-bus.c     |  2 +-
>   2 files changed, 8 insertions(+), 5 deletions(-)
> 
> diff --git a/hw/block/xen-block.c b/hw/block/xen-block.c
> index a07cd7eb5d..dc4d477c22 100644
> --- a/hw/block/xen-block.c
> +++ b/hw/block/xen-block.c
> @@ -221,6 +221,7 @@ static void xen_block_realize(XenDevice *xendev, Error **errp)
>       XenBlockVdev *vdev = &blockdev->props.vdev;
>       BlockConf *conf = &blockdev->props.conf;
>       BlockBackend *blk = conf->blk;
> +    XenBus *xenbus = XEN_BUS(qdev_get_parent_bus(DEVICE(xendev)));
>   
>       if (vdev->type == XEN_BLOCK_VDEV_TYPE_INVALID) {
>           error_setg(errp, "vdev property not set");
> @@ -280,10 +281,12 @@ static void xen_block_realize(XenDevice *xendev, Error **errp)
>   
>       xen_device_backend_printf(xendev, "info", "%u", blockdev->info);
>   
> -    xen_device_frontend_printf(xendev, "virtual-device", "%lu",
> -                               vdev->number);
> -    xen_device_frontend_printf(xendev, "device-type", "%s",
> -                               blockdev->device_type);
> +    if (xenbus->backend_id == 0) {
> +        xen_device_frontend_printf(xendev, "virtual-device", "%lu",
> +                                   vdev->number);
> +        xen_device_frontend_printf(xendev, "device-type", "%s",
> +                                   blockdev->device_type);
> +    }
>   
>       xen_device_backend_printf(xendev, "sector-size", "%u",
>                                 conf->logical_block_size);
> diff --git a/hw/xen/xen-bus.c b/hw/xen/xen-bus.c
> index ece8ec40cd..06d5192aca 100644
> --- a/hw/xen/xen-bus.c
> +++ b/hw/xen/xen-bus.c
> @@ -1048,7 +1048,7 @@ static void xen_device_realize(DeviceState *dev, Error **errp)
>       xen_device_backend_set_online(xendev, true);
>       xen_device_backend_set_state(xendev, XenbusStateInitWait);
>   
> -    if (!xen_device_frontend_exists(xendev)) {
> +    if (!xen_device_frontend_exists(xendev) && xenbus->backend_id == 0) {
>           xen_device_frontend_printf(xendev, "backend", "%s",
>                                      xendev->backend_path);
>           xen_device_frontend_printf(xendev, "backend-id", "%u",


