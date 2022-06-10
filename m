Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B4BC6546B91
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jun 2022 19:19:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.346608.572459 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nziHm-0005Jg-3p; Fri, 10 Jun 2022 17:19:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 346608.572459; Fri, 10 Jun 2022 17:19:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nziHl-0005Hi-Vn; Fri, 10 Jun 2022 17:19:01 +0000
Received: by outflank-mailman (input) for mailman id 346608;
 Fri, 10 Jun 2022 17:19:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yiYo=WR=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1nziHk-0005Hc-D4
 for xen-devel@lists.xenproject.org; Fri, 10 Jun 2022 17:19:00 +0000
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [2a00:1450:4864:20::12e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6a649eb2-e8e1-11ec-8901-93a377f238d6;
 Fri, 10 Jun 2022 19:18:59 +0200 (CEST)
Received: by mail-lf1-x12e.google.com with SMTP id t25so43810743lfg.7
 for <xen-devel@lists.xenproject.org>; Fri, 10 Jun 2022 10:18:59 -0700 (PDT)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id
 j22-20020a056512109600b0047255d210e7sm4797634lfg.22.2022.06.10.10.18.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Jun 2022 10:18:58 -0700 (PDT)
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
X-Inumbo-ID: 6a649eb2-e8e1-11ec-8901-93a377f238d6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=afV9wUg31EG03L2a2kkqqSnmRWnpT+KqkYxw5XyGGz0=;
        b=pFhj/d+stsV9G5X4+UW9nTOrrJrxbZQQwArXKeVBrD0i575Y7V7JJw46H7h6/4JaxE
         iXKPTFxnOErPH/X5+b4c/QYFydSnhH412AXukyyWiQuuSU59JPJgbUU3jZTZmHcrwav6
         wOMv63j+GE53xEXoTt3RkUn78M0hK6ZPbFXKToGPhxrgB8FqKCNhiGNH4WBSKiLlKjfD
         BiFEYkVbVBpNifbPSza1UVcJ23nV86mHOOU+CHNmt3am+kwdqy0FtRgjiHBj+RdGv7yP
         MjPYryl4bHLejJel0rcZguOXhsUTy9OaGCjoaEj+p2bZlpTQ6jd07uZ45fd8qSY6zPtH
         bwDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=afV9wUg31EG03L2a2kkqqSnmRWnpT+KqkYxw5XyGGz0=;
        b=gEHXuengsHFbKCFuVsZFuvzRfNYJyahdUXh8NdLR+5R9hPdzgAAibqs30/7WPfAk9h
         VA60diizfRo/CuD9LwFlLAt1CNEaOt3bGehJqHjrSSy9H9y+Qd3hNvoXAFuJ6U1odgEt
         Yq/NPCeTzAjYGAZUWS+CYMaN0+N/sX2wrWX7mVw3yYGlC3ls3UZUcJoND5ffKhHrsz00
         ro628W9nXzqvBHXV6QzEmDTAZ5F76PbQZTBvkL/MhQAB5KKZj+C8Ff1trIb28dqrU9tf
         7zOnwEH/RKot3FrF3QV1ZVRrCJt12Qh5PVCCL5gG6kz3A8Zmm40cGhk+qWyQrG543THG
         04FQ==
X-Gm-Message-State: AOAM531aAK846rSZzS/0/lR8roLWrAQNCxfOygD7ITk+LBsZVQ99sPSa
	Q8JT1LBqedSgpYj7bl79TLtiy+cGZvQSIg==
X-Google-Smtp-Source: ABdhPJxRoQugrS1fWvfLnhwTmgvw+qj8hXVKnGbxFhEKRi7phPKNSX8ZiMn8Kg9XxQjT/nDFgCtf4g==
X-Received: by 2002:a05:6512:515:b0:479:11a0:8132 with SMTP id o21-20020a056512051500b0047911a08132mr27112856lfb.344.1654881538779;
        Fri, 10 Jun 2022 10:18:58 -0700 (PDT)
Subject: Re: [PATCH V9 1/2] libxl: Add support for Virtio disk configuration
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: xen-devel@lists.xenproject.org,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@citrix.com>, Nick Rosbrook
 <rosbrookn@gmail.com>, Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>
References: <1654106261-28044-1-git-send-email-olekstysh@gmail.com>
 <1654106261-28044-2-git-send-email-olekstysh@gmail.com>
 <YqNbwtWrIdYWRG9c@perard.uk.xensource.com>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <b653ebad-fc56-2a9e-36bb-59ab19da5db1@gmail.com>
Date: Fri, 10 Jun 2022 20:18:57 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <YqNbwtWrIdYWRG9c@perard.uk.xensource.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 10.06.22 18:12, Anthony PERARD wrote:

Hello Anthony

> On Wed, Jun 01, 2022 at 08:57:40PM +0300, Oleksandr Tyshchenko wrote:
>> diff --git a/tools/libs/light/libxl_disk.c b/tools/libs/light/libxl_disk.c
>> index a5ca778..e90bc25 100644
>> --- a/tools/libs/light/libxl_disk.c
>> +++ b/tools/libs/light/libxl_disk.c
>> @@ -163,6 +163,25 @@ static int libxl__device_disk_setdefault(libxl__gc *gc, uint32_t domid,
>>       rc = libxl__resolve_domid(gc, disk->backend_domname, &disk->backend_domid);
>>       if (rc < 0) return rc;
>>   
>> +    if (disk->specification == LIBXL_DISK_SPECIFICATION_UNKNOWN)
>> +        disk->specification = LIBXL_DISK_SPECIFICATION_XEN;
>> +
>> +    if (disk->specification == LIBXL_DISK_SPECIFICATION_XEN &&
>> +        disk->transport != LIBXL_DISK_TRANSPORT_UNKNOWN) {
>> +        LOGD(ERROR, domid, "Transport is only supported for specification virtio");
>> +        return ERROR_FAIL;
> Could you return ERROR_INVAL instead?

yes


>
>> +    }
>> +
>> +    /* Force transport mmio for specification virtio for now */
>> +    if (disk->specification == LIBXL_DISK_SPECIFICATION_VIRTIO) {
>> +        if (!(disk->transport == LIBXL_DISK_TRANSPORT_UNKNOWN ||
>> +              disk->transport == LIBXL_DISK_TRANSPORT_MMIO)) {
>> +            LOGD(ERROR, domid, "Unsupported transport for specification virtio");
>> +            return ERROR_FAIL;
> Same here.

yes


>
>> +        }
>> +        disk->transport = LIBXL_DISK_TRANSPORT_MMIO;
>> +    }
>> +
>>       /* Force Qdisk backend for CDROM devices of guests with a device model. */
>>       if (disk->is_cdrom != 0 &&
>>           libxl__domain_type(gc, domid) == LIBXL_DOMAIN_TYPE_HVM) {
>> @@ -575,6 +660,41 @@ cleanup:
>>       return rc;
>>   }
>>   
>> +static int libxl__device_disk_get_path(libxl__gc *gc, uint32_t domid,
>> +                                       char **path)
>> +{
>> +    const char *dir;
>> +    int rc;
>> +
>> +    /*
>> +     * As we don't know exactly what device kind to be used here, guess it
>> +     * by checking the presence of the corresponding path in Xenstore.
>> +     * First, try to read path for vbd device (default) and if not exists
>> +     * read path for virtio_disk device. This will work as long as both Xen PV
>> +     * and Virtio disk devices are not assigned to the same guest.
>> +     */
>> +    *path = GCSPRINTF("%s/device/%s",
>> +                      libxl__xs_libxl_path(gc, domid),
>> +                      libxl__device_kind_to_string(LIBXL__DEVICE_KIND_VBD));
>> +
>> +    rc = libxl__xs_read_checked(gc, XBT_NULL, *path, &dir);
>> +    if (rc)
>> +        return rc;
>> +
>> +    if (dir)
>> +        return 0;
>> +
>> +    *path = GCSPRINTF("%s/device/%s",
>> +                      libxl__xs_libxl_path(gc, domid),
>> +                      libxl__device_kind_to_string(LIBXL__DEVICE_KIND_VIRTIO_DISK));
>> +
>> +    rc = libxl__xs_read_checked(gc, XBT_NULL, *path, &dir);
>> +    if (rc)
>> +        return rc;
>> +
>> +    return 0;
> I still don't like this implementation of get_path() which return a
> different answer depending on the environment which can change from one
> call to the next. I think get_path() was introduced when the path for
> the kind of device didn't correspond to the common path which other kind
> of devices uses. And when get_path() is implemented, it always returns
> the same answer (see libxl_pci.c for the only implementation).
>
> I don't really know how to deal with a type of device that have two
> different frontend kind at the moment. (But maybe there's something in
> libxl_usb.c which could be useful as a potential example, but one of the
> kind doesn't use xenstore so is probably easier to deal with.). So I
> guess we are stuck with an implementation of get_path() which may return
> a different answer depending on thing outside of libxl's full control.
>
> So, could you at least make it much harder to have libxl's view of a
> guest in a weird state? I mean:
> - always check both xenstore paths
>    -> if both exist, return an error
>    -> if only one exist, return that one.
>    -> default to the "vbd" kind, otherwise.

I think I got your idea, will try to do this way


>
> That would be better than the current implementation which returns the
> "virtio" path by default.

agree,

making virtio by default wasn't the original intention, it was entirely 
involuntarily))


>
> Thanks,
>
-- 
Regards,

Oleksandr Tyshchenko


