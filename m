Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D033D309F43
	for <lists+xen-devel@lfdr.de>; Sun, 31 Jan 2021 23:36:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.79464.144603 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6LKP-0008Ax-GW; Sun, 31 Jan 2021 22:36:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 79464.144603; Sun, 31 Jan 2021 22:36:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6LKP-0008AY-Cy; Sun, 31 Jan 2021 22:36:21 +0000
Received: by outflank-mailman (input) for mailman id 79464;
 Sun, 31 Jan 2021 22:36:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jhrf=HC=gmail.com=malus.brandywine@srs-us1.protection.inumbo.net>)
 id 1l6LKO-0008AT-MC
 for xen-devel@lists.xenproject.org; Sun, 31 Jan 2021 22:36:20 +0000
Received: from mail-vs1-xe2c.google.com (unknown [2607:f8b0:4864:20::e2c])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 93c78b62-cb74-4d96-b63b-7ecfced8ae0f;
 Sun, 31 Jan 2021 22:36:19 +0000 (UTC)
Received: by mail-vs1-xe2c.google.com with SMTP id i12so5126485vsq.6
 for <xen-devel@lists.xenproject.org>; Sun, 31 Jan 2021 14:36:19 -0800 (PST)
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
X-Inumbo-ID: 93c78b62-cb74-4d96-b63b-7ecfced8ae0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=TTLRclvXYZhhR4No0MxGMp72irWhCBXK3o8tr7CTc4s=;
        b=FHwL4ewTNBpqnjcfK06x7MZa4OIlLhBm3cRy+BbO/+uMM5hI3K7HPxSCVwdUvJtiHs
         ZQHZJ2UXSnu3vlKzR8QIzbVnvcn7mlg6Nntqtn/v4i7FTlObymseAfBG3XKULvPwiAut
         d1wGqwfEoIaMQ1pjuVY/dc9wGCTaXJRctFHtekXljtQJJHaZoI3iKjsddmd/J0i5IkH0
         JcRjE7gLMFrdkQys6LB2zTCfzt7140NAFDeRvhbMi1VKuX7nTJsEXQLCTRBy1oqmXkl/
         wyyeQjaBHv1UUBZEiViQy8frbt1wyHIwfEW1P46oe463GqGJkXxWgolGdzh4HvdZG8ww
         TpEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=TTLRclvXYZhhR4No0MxGMp72irWhCBXK3o8tr7CTc4s=;
        b=LlVv4v1pi1MH+b4PdEXrwzJN+UkbAzwl4IXAHQ24EEhdApto6XyfUiIAQCwihY6hlI
         FwjdnkqkMlZO0dO+LIdwqyaWW8L0nNYyJCYnhaJS4thCiBd4B532VqOgOhBfr1YMFk7/
         qzvVHdYFXtCbcBP7iEThhpuaTlPzgHKqh4d4QcG3G/1lJ8yH1c8FOQtGgSx7/LJwTiY+
         /PBkkurconUU+GR6ORhGEYTAg28S2ujHh22T2JSZGwv6so7FGS+TbnqGkXQ5M0mHuYno
         qhVAdzN2zcHE/4D4+ZyLXjHCAnLTPKXapq02LdX2Vj8qH1gK0du+m1wESSzEMxKChvUu
         TrbA==
X-Gm-Message-State: AOAM531ypw5u/axIRtHrzhtWXhVBjEJAKigM36d039ZgzrlK66Tw/xqU
	Yfxl9AWj5+L7dOZHxcfVXnQpgEGvG5JlTf6rLnY=
X-Google-Smtp-Source: ABdhPJwKqm9yF/6Mti1m05o7QeJKXkj7E4dwuyQXspp5SYBw293OfYmBpvU+sflUQCkFYgZF6pBdVqpK23PiTP3awg8=
X-Received: by 2002:a05:6102:82a:: with SMTP id k10mr7581628vsb.43.1612132579506;
 Sun, 31 Jan 2021 14:36:19 -0800 (PST)
MIME-Version: 1.0
References: <CABfawhnvgFLU=VmaqmKyf8DNeVcXoXTD2=XpiwnL0OikC1_z4w@mail.gmail.com>
In-Reply-To: <CABfawhnvgFLU=VmaqmKyf8DNeVcXoXTD2=XpiwnL0OikC1_z4w@mail.gmail.com>
From: Nataliya Korovkina <malus.brandywine@gmail.com>
Date: Sun, 31 Jan 2021 17:36:08 -0500
Message-ID: <CADz_WD4HAno_s1pLhEfE5h3vyyUimkQe_i=UJ5n=LG9sJ+a3Lw@mail.gmail.com>
Subject: Re: Xen 4.14.1 on RPI4: device tree generation failed
To: Tamas K Lengyel <tamas.k.lengyel@gmail.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="UTF-8"

Hi Tamas,

I had another problem with device tree built with this script (rpixen.sh)...

No promises, but it's worth trying on clean tree:
make O=.build-arm64 ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- -j $(nproc) dtbs
(instead of broadcom/${DTBFILE})

Good luck,
Nataliya

On Sun, Jan 31, 2021 at 2:07 PM Tamas K Lengyel
<tamas.k.lengyel@gmail.com> wrote:
>
> Hi all,
> I'm trying to boot Xen 4.14.1 on my RPI4 with the 5.10 kernel, built
> using https://github.com/tklengyel/xen-rpi4-builder/tree/update.
> Everything builds fine and Xen boots but then I get this error:
>
> (XEN) *** LOADING DOMAIN 0 ***
> (XEN) Loading d0 kernel from boot module @ 0000000000480000
> (XEN) Allocating 1:1 mappings totalling 2048MB for dom0:
> (XEN) BANK[0] 0x00000008000000-0x00000028000000 (512MB)
> (XEN) BANK[1] 0x00000030000000-0x00000038000000 (128MB)
> (XEN) BANK[2] 0x00000080000000-0x000000c0000000 (1024MB)
> (XEN) BANK[3] 0x000000d8000000-0x000000f0000000 (384MB)
> (XEN) Grant table range: 0x00000000200000-0x00000000240000
> (XEN) Unable to retrieve address 0 for /scb/pcie@7d500000/pci@1,0/usb@1,0
> (XEN) Device tree generation failed (-22).
> (XEN)
> (XEN) ****************************************
> (XEN) Panic on CPU 0:
> (XEN) Could not set up DOM0 guest OS
> (XEN) ****************************************
> (XEN)
> (XEN) Reboot in five seconds...
>
>
> Does anyone have an idea what might be going wrong here? I tried
> building the dtb without using the dtb overlay but it didn't seem to
> do anything.
>
> Thanks,
> Tamas
>

