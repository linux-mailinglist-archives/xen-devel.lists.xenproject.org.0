Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DE6454CEBB
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jun 2022 18:33:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.350241.576526 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o1Vwx-00021l-10; Wed, 15 Jun 2022 16:32:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 350241.576526; Wed, 15 Jun 2022 16:32:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o1Vww-0001yd-T3; Wed, 15 Jun 2022 16:32:58 +0000
Received: by outflank-mailman (input) for mailman id 350241;
 Wed, 15 Jun 2022 16:32:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Wv+x=WW=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1o1Vww-0001yX-1M
 for xen-devel@lists.xenproject.org; Wed, 15 Jun 2022 16:32:58 +0000
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [2a00:1450:4864:20::230])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cf9f8e40-ecc8-11ec-bd2c-47488cf2e6aa;
 Wed, 15 Jun 2022 18:32:56 +0200 (CEST)
Received: by mail-lj1-x230.google.com with SMTP id h23so13909929ljl.3
 for <xen-devel@lists.xenproject.org>; Wed, 15 Jun 2022 09:32:56 -0700 (PDT)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id
 y17-20020a2eb011000000b0025a0ca6a0e5sm317893ljk.61.2022.06.15.09.32.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Jun 2022 09:32:55 -0700 (PDT)
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
X-Inumbo-ID: cf9f8e40-ecc8-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=ZF8th8mGWf3SuaAuDD6LprpEpz3Ht4Qh6Ya1fy8DFtc=;
        b=VyhBwthrTIxACGj1/BPHJ/qXWdEw9lDb2CCrSvCFVeXhRBE0CqHpJYDVkHZn3AdjEs
         UgSTGxbvXp/IRCck8Xe3aw24YT7otKdobFo4UiY+fzzoRuFBdMtyNmXu8QsOgvPGWlqO
         oU4DshzigiTvNb8Or1L64azvGCOlpKEF9BhLnSh26jVCtq8VprvjmIVpAxABQZS51ueT
         xt014P2IYnUZiI8QDhPyw2Rcc8UCTgKoZzp1WxY6I8HWIxjkkZoQ3rAMfxZTvYgoiI9E
         CVkAzjm2VJOHQ5pqyBVqtysnykILA5dGfN2OOyMdOCW3QqH3OVI284lqeFru6RHzu5CG
         6/kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=ZF8th8mGWf3SuaAuDD6LprpEpz3Ht4Qh6Ya1fy8DFtc=;
        b=LOxJO8mGECJSHNnQvHLE1P6fGB5jLwNtK+PUV6b7qrud40LbAvPgBySDg7b8a/gS2k
         HOsGGep30vWiqVQ5tc12/iRTmP6uXh+sHX8gL7b6gI4asrRkw6Fz/fQErF0mQsJY8aT7
         Jqtq0p4w2HaA50fb/MDWUvEahCLy4/vKY64Cyua7exqGsHWQEBG5l7c5N4+yKRk27fiF
         jIO2VUCtaJkOuSpWIq3X3JZJCtu8hoOhFLyEyir/k5bRrnavQkO/eeyFlil/dj4IbduR
         Ql7xccZ4EGzswELClZDPnpti/HwtHzZTcv0/+8ueMkTa4Oe1x4Ez6XEZZ60aNREuigeB
         02PA==
X-Gm-Message-State: AJIora9Yks4L9B57965+QAJ/qzoeOjg0wpfU0nrPhQgay6bBIeVmMbKW
	6Zse+7RFEy1WAn+iUaOZAKY=
X-Google-Smtp-Source: AGRyM1uYaDstOGREn7Fl41IHuyNWbMc0681CW2heauSwQ+7Oq/iWA8aY9j/MyJHR+8NxDek5cttl9w==
X-Received: by 2002:a05:651c:b09:b0:25a:44fd:41f with SMTP id b9-20020a05651c0b0900b0025a44fd041fmr318733ljr.366.1655310776113;
        Wed, 15 Jun 2022 09:32:56 -0700 (PDT)
Subject: Re: [PATCH V10 1/3] libxl: Add support for Virtio disk configuration
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: xen-devel@lists.xenproject.org,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@citrix.com>, Nick Rosbrook
 <rosbrookn@gmail.com>, Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>
References: <1655143522-14356-1-git-send-email-olekstysh@gmail.com>
 <1655143522-14356-2-git-send-email-olekstysh@gmail.com>
 <YqnrerEAFXJUCRL1@perard.uk.xensource.com>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <21798651-1254-0c17-5379-224b52a92566@gmail.com>
Date: Wed, 15 Jun 2022 19:32:54 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <YqnrerEAFXJUCRL1@perard.uk.xensource.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US


On 15.06.22 17:23, Anthony PERARD wrote:

Hello Anthony

> On Mon, Jun 13, 2022 at 09:05:20PM +0300, Oleksandr Tyshchenko wrote:
>> diff --git a/tools/libs/light/libxl_disk.c b/tools/libs/light/libxl_disk.c
>> index a5ca778..673b0d6 100644
>> --- a/tools/libs/light/libxl_disk.c
>> +++ b/tools/libs/light/libxl_disk.c
>> @@ -575,6 +660,41 @@ cleanup:
>>       return rc;
>>   }
>>   
>> +static int libxl__device_disk_get_path(libxl__gc *gc, uint32_t domid,
>> +                                       char **path)
>> +{
>> +    const char *xen_dir, *virtio_dir;
>> +    char *xen_path, *virtio_path;
>> +    int rc;
>> +
>> +    /* default path */
>> +    xen_path = GCSPRINTF("%s/device/%s",
>> +                         libxl__xs_libxl_path(gc, domid),
>> +                         libxl__device_kind_to_string(LIBXL__DEVICE_KIND_VBD));
>> +
>> +    rc = libxl__xs_read_checked(gc, XBT_NULL, xen_path, &xen_dir);
>> +    if (rc)
>> +        return rc;
>> +
>> +    virtio_path = GCSPRINTF("%s/device/%s",
>> +                            libxl__xs_libxl_path(gc, domid),
>> +                            libxl__device_kind_to_string(LIBXL__DEVICE_KIND_VIRTIO_DISK));
>> +
>> +    rc = libxl__xs_read_checked(gc, XBT_NULL, virtio_path, &virtio_dir);
>> +    if (rc)
>> +        return rc;
>> +
>> +    if (xen_dir && virtio_dir) {
>> +        LOGD(ERROR, domid, "Invalid configuration, both xen and virtio paths are present");
>> +        return ERROR_INVAL;
>> +    } else if (virtio_dir)
>> +        *path = virtio_path;
>> +    else
>> +        *path = xen_path;
> Small coding style issue, could you use blocks {} on all part of the
> if...else, since you are using them on one of the block? This is
> described in tools/libs/light/CODING_STYLE (5. Block structure).

yes, will do


>
>> diff --git a/tools/xl/xl_block.c b/tools/xl/xl_block.c
>> index 70eed43..f2b0ff5 100644
>> --- a/tools/xl/xl_block.c
>> +++ b/tools/xl/xl_block.c
>> @@ -50,6 +50,11 @@ int main_blockattach(int argc, char **argv)
>>           return 0;
>>       }
>>   
>> +    if (disk.specification != LIBXL_DISK_SPECIFICATION_XEN) {
>> +        fprintf(stderr, "block-attach is only supported for specification xen\n");
> This check prevents a previously working `block-attach` command line
> from working.
>
>      # xl -Tvvv block-attach 0 /dev/vg/guest_disk,raw,hda
>      block-attach is only supported for specification xen
>
> At least, that works by adding ",specification=xen", but it should work
> without it as "xen" is the default (from the man page).

yes, you are right. thank you for pointing this out.


>
> Maybe the check is done too soon, or maybe a better place to do it would
> be in libxl.
>
> libxl__device_disk_setdefault() is called much later, while executing
> libxl_device_disk_add(), so `xl` can't use the default been done there
> to "disk.specification".

I got it.


>
> `xl block-attach` calls libxl_device_disk_add() which I think is only
> called for hotplug of disk. If I recall correctly, libxl__add_disks() is
> called instead at guest creation. So maybe it is possible to do
> something in libxl_device_disk_add(), but that a function defined by a
> macro, and the macro is using the same libxl__device_disk_add() that
> libxl_device_disk_add(). On the other hand, there is a "hotplug"
> parameter to libxl__device_disk_setdefault(), maybe that could be use?

Thank you for digging into the details here.

If I understood correctly your suggestion we simply can drop checks in 
main_blockattach() (and likely main_blockdetach() ?) and add it to 
libxl__device_disk_setdefault().


diff --git a/tools/libs/light/libxl_disk.c b/tools/libs/light/libxl_disk.c
index 9e82adb..96ace09 100644
--- a/tools/libs/light/libxl_disk.c
+++ b/tools/libs/light/libxl_disk.c
@@ -182,6 +182,11 @@ static int libxl__device_disk_setdefault(libxl__gc 
*gc, uint32_t domid,
          disk->transport = LIBXL_DISK_TRANSPORT_MMIO;
      }

+    if (hotplug && disk->specification != LIBXL_DISK_SPECIFICATION_XEN) {
+        LOGD(ERROR, domid, "Hotplug is only supported for specification 
xen");
+        return ERROR_FAIL;
+    }
+
      /* Force Qdisk backend for CDROM devices of guests with a device 
model. */
      if (disk->is_cdrom != 0 &&
          libxl__domain_type(gc, domid) == LIBXL_DOMAIN_TYPE_HVM) {


Is my understanding correct?


I have checked, it works:

root@generic-armv8-xt-dom0:~# xl block-attach DomU /dev/loop0,raw,xvda3
[  762.062874] xen-blkback: backend/vbd/3/51715: using 4 queues, 
protocol 1 (arm-abi)


root@generic-armv8-xt-dom0:~# xl block-attach DomU 
/dev/loop0,raw,xvda3,specification=virtio
libxl: error: libxl_disk.c:186:libxl__device_disk_setdefault: Domain 
3:Hotplug is only supported for specification xen
libxl: error: libxl_device.c:1468:device_addrm_aocomplete: unable to add 
device

>
>
> Cheers,
>
-- 
Regards,

Oleksandr Tyshchenko


