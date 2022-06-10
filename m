Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 87397546BEB
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jun 2022 19:58:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.346619.572477 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nzisq-00029s-3Q; Fri, 10 Jun 2022 17:57:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 346619.572477; Fri, 10 Jun 2022 17:57:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nzisp-00026y-Ul; Fri, 10 Jun 2022 17:57:19 +0000
Received: by outflank-mailman (input) for mailman id 346619;
 Fri, 10 Jun 2022 17:57:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yiYo=WR=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1nziso-00026s-4v
 for xen-devel@lists.xenproject.org; Fri, 10 Jun 2022 17:57:18 +0000
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [2a00:1450:4864:20::232])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c3a64354-e8e6-11ec-bd2c-47488cf2e6aa;
 Fri, 10 Jun 2022 19:57:16 +0200 (CEST)
Received: by mail-lj1-x232.google.com with SMTP id g25so30358029ljm.2
 for <xen-devel@lists.xenproject.org>; Fri, 10 Jun 2022 10:57:16 -0700 (PDT)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id
 m1-20020a056512014100b0047255d211bbsm4808954lfo.234.2022.06.10.10.57.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Jun 2022 10:57:15 -0700 (PDT)
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
X-Inumbo-ID: c3a64354-e8e6-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=rRWAJcb2Uy8fqgTN/ziwtxpwnfNM4EOEYQHcP0bo1pk=;
        b=gw0+tHuu16wy6+K7ouk9bxSUWhzgUcBuNMmb5Luk6q1vx1AurBND1TmG6dow59+rQn
         4m131lnc19rJUZZaky73f5bQkWfsMJkJN2d1egtG5SoAjGAnAPIhqPfyMCV++dL2L1fi
         d4OWGG2xSp9DHVA0qVD+xg0t++niWb//FJBCEnwiiEeVpVpVRpRyT3qwxL+Wx1KEpwiH
         zDmsxLoCf9zlxP/A67Rf2lPoLDBVjxU3RDJ1zwkLbujbmpeYa0P9UD6lcx8IID191CuD
         Z+Reff/fmzlC8fow/ce8ZUvbh4K6Yn2EOSt7CLM+ojVirh+YSRrLEMmu+RBnQqRL98Qh
         1n3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=rRWAJcb2Uy8fqgTN/ziwtxpwnfNM4EOEYQHcP0bo1pk=;
        b=bF/CdUa0z7JhFf9fKWf4012cTTm4qPrpG7CB4Q264ioN/PAUmf8RwpJrfaQzTsFymH
         n8c+ysW7pFeKk6gJugJbGh8toNM7TQ2bASU7jBpptkC1AGLnw/rBsU+4Br7y3SmzZQRB
         hKgX56vv4oEGlpqH8PzWwgP9x3Wq7juuru2qyGO+psce4GPMZ4jkAWVlTKIsjaPMsUOr
         cpzFoII6JxtcGUPXZSKD8wy54nPndsWw3cvvJtTz9xgxnhcZKSWYQoES2iHgm74inLr6
         C8BflJvfnZwQjQepQHipoKok2OlWNT1QQD7zpZh6i1DEeOjdcDOOhp9/C+Jl+QDaDsDj
         m56g==
X-Gm-Message-State: AOAM531TupMY3QZPqwPaex/PJHZlP5AtEH48ByOaKTNectWnmn2iIIQ4
	YDFyFM/E5WMYdWmDnuOwlLQ=
X-Google-Smtp-Source: ABdhPJxrCkrxRQJuZNW/yt2ICylNXpULVp78oyAB+qOtKd9cdFumUoeQcpDh6MquMjALKUzW7U4PwQ==
X-Received: by 2002:a2e:9b4a:0:b0:258:e01f:bcdf with SMTP id o10-20020a2e9b4a000000b00258e01fbcdfmr4213712ljj.87.1654883836066;
        Fri, 10 Jun 2022 10:57:16 -0700 (PDT)
Subject: Re: [PATCH V9 1/2] libxl: Add support for Virtio disk configuration
From: Oleksandr <olekstysh@gmail.com>
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
 <b653ebad-fc56-2a9e-36bb-59ab19da5db1@gmail.com>
Message-ID: <7e5b42a1-d781-6987-2cf8-35bdd701fff4@gmail.com>
Date: Fri, 10 Jun 2022 20:57:14 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <b653ebad-fc56-2a9e-36bb-59ab19da5db1@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US


On 10.06.22 20:18, Oleksandr wrote:

Hello Anthony

>
> On 10.06.22 18:12, Anthony PERARD wrote:
>
> Hello Anthony
>
>> On Wed, Jun 01, 2022 at 08:57:40PM +0300, Oleksandr Tyshchenko wrote:
>>> diff --git a/tools/libs/light/libxl_disk.c 
>>> b/tools/libs/light/libxl_disk.c
>>> index a5ca778..e90bc25 100644
>>> --- a/tools/libs/light/libxl_disk.c
>>> +++ b/tools/libs/light/libxl_disk.c
>>> @@ -163,6 +163,25 @@ static int 
>>> libxl__device_disk_setdefault(libxl__gc *gc, uint32_t domid,
>>>       rc = libxl__resolve_domid(gc, disk->backend_domname, 
>>> &disk->backend_domid);
>>>       if (rc < 0) return rc;
>>>   +    if (disk->specification == LIBXL_DISK_SPECIFICATION_UNKNOWN)
>>> +        disk->specification = LIBXL_DISK_SPECIFICATION_XEN;
>>> +
>>> +    if (disk->specification == LIBXL_DISK_SPECIFICATION_XEN &&
>>> +        disk->transport != LIBXL_DISK_TRANSPORT_UNKNOWN) {
>>> +        LOGD(ERROR, domid, "Transport is only supported for 
>>> specification virtio");
>>> +        return ERROR_FAIL;
>> Could you return ERROR_INVAL instead?
>
> yes
>
>
>>
>>> +    }
>>> +
>>> +    /* Force transport mmio for specification virtio for now */
>>> +    if (disk->specification == LIBXL_DISK_SPECIFICATION_VIRTIO) {
>>> +        if (!(disk->transport == LIBXL_DISK_TRANSPORT_UNKNOWN ||
>>> +              disk->transport == LIBXL_DISK_TRANSPORT_MMIO)) {
>>> +            LOGD(ERROR, domid, "Unsupported transport for 
>>> specification virtio");
>>> +            return ERROR_FAIL;
>> Same here.
>
> yes
>
>
>>
>>> +        }
>>> +        disk->transport = LIBXL_DISK_TRANSPORT_MMIO;
>>> +    }
>>> +
>>>       /* Force Qdisk backend for CDROM devices of guests with a 
>>> device model. */
>>>       if (disk->is_cdrom != 0 &&
>>>           libxl__domain_type(gc, domid) == LIBXL_DOMAIN_TYPE_HVM) {
>>> @@ -575,6 +660,41 @@ cleanup:
>>>       return rc;
>>>   }
>>>   +static int libxl__device_disk_get_path(libxl__gc *gc, uint32_t 
>>> domid,
>>> +                                       char **path)
>>> +{
>>> +    const char *dir;
>>> +    int rc;
>>> +
>>> +    /*
>>> +     * As we don't know exactly what device kind to be used here, 
>>> guess it
>>> +     * by checking the presence of the corresponding path in Xenstore.
>>> +     * First, try to read path for vbd device (default) and if not 
>>> exists
>>> +     * read path for virtio_disk device. This will work as long as 
>>> both Xen PV
>>> +     * and Virtio disk devices are not assigned to the same guest.
>>> +     */
>>> +    *path = GCSPRINTF("%s/device/%s",
>>> +                      libxl__xs_libxl_path(gc, domid),
>>> + libxl__device_kind_to_string(LIBXL__DEVICE_KIND_VBD));
>>> +
>>> +    rc = libxl__xs_read_checked(gc, XBT_NULL, *path, &dir);
>>> +    if (rc)
>>> +        return rc;
>>> +
>>> +    if (dir)
>>> +        return 0;
>>> +
>>> +    *path = GCSPRINTF("%s/device/%s",
>>> +                      libxl__xs_libxl_path(gc, domid),
>>> + libxl__device_kind_to_string(LIBXL__DEVICE_KIND_VIRTIO_DISK));
>>> +
>>> +    rc = libxl__xs_read_checked(gc, XBT_NULL, *path, &dir);
>>> +    if (rc)
>>> +        return rc;
>>> +
>>> +    return 0;
>> I still don't like this implementation of get_path() which return a
>> different answer depending on the environment which can change from one
>> call to the next. I think get_path() was introduced when the path for
>> the kind of device didn't correspond to the common path which other kind
>> of devices uses. And when get_path() is implemented, it always returns
>> the same answer (see libxl_pci.c for the only implementation).
>>
>> I don't really know how to deal with a type of device that have two
>> different frontend kind at the moment. (But maybe there's something in
>> libxl_usb.c which could be useful as a potential example, but one of the
>> kind doesn't use xenstore so is probably easier to deal with.). So I
>> guess we are stuck with an implementation of get_path() which may return
>> a different answer depending on thing outside of libxl's full control.
>>
>> So, could you at least make it much harder to have libxl's view of a
>> guest in a weird state? I mean:
>> - always check both xenstore paths
>>    -> if both exist, return an error
>>    -> if only one exist, return that one.
>>    -> default to the "vbd" kind, otherwise.
>
> I think I got your idea, will try to do this way

I hope that this (it seems working) function follows your suggestion. If 
no objections, I will use it for V10.


static int libxl__device_disk_get_path(libxl__gc *gc, uint32_t domid,
                                        char **path)
{
     const char *xen_dir, *virtio_dir;
     char *xen_path, *virtio_path;
     int rc;

     xen_path = GCSPRINTF("%s/device/%s",
                          libxl__xs_libxl_path(gc, domid),
libxl__device_kind_to_string(LIBXL__DEVICE_KIND_VBD));

     rc = libxl__xs_read_checked(gc, XBT_NULL, xen_path, &xen_dir);
     if (rc)
         return rc;

     virtio_path = GCSPRINTF("%s/device/%s",
                             libxl__xs_libxl_path(gc, domid),
libxl__device_kind_to_string(LIBXL__DEVICE_KIND_VIRTIO_DISK));

     rc = libxl__xs_read_checked(gc, XBT_NULL, virtio_path, &virtio_dir);
     if (rc)
         return rc;

     if (xen_dir && virtio_dir) {
         LOGD(ERROR, domid, "Invalid configuration, both xen and virtio 
paths are present");
         return ERROR_INVAL;
     } else if (virtio_dir)
         *path = virtio_path;
     else
         *path = xen_path;

     return 0;
}


>
>
>>
>> That would be better than the current implementation which returns the
>> "virtio" path by default.
>
> agree,
>
> making virtio by default wasn't the original intention, it was 
> entirely involuntarily))
>
>
>>
>> Thanks,
>>
-- 
Regards,

Oleksandr Tyshchenko


