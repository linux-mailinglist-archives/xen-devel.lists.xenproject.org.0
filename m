Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E6F0724C655
	for <lists+xen-devel@lfdr.de>; Thu, 20 Aug 2020 21:41:06 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k8qQR-0004wu-Sx; Thu, 20 Aug 2020 19:40:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=eCh+=B6=zededa.com=roman@srs-us1.protection.inumbo.net>)
 id 1k8qQQ-0004wp-Sg
 for xen-devel@lists.xenproject.org; Thu, 20 Aug 2020 19:40:38 +0000
X-Inumbo-ID: 0ba22bfa-04e6-4d65-b9a3-ca0dee26e99b
Received: from mail-ua1-x92a.google.com (unknown [2607:f8b0:4864:20::92a])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0ba22bfa-04e6-4d65-b9a3-ca0dee26e99b;
 Thu, 20 Aug 2020 19:40:37 +0000 (UTC)
Received: by mail-ua1-x92a.google.com with SMTP id g20so924557uap.8
 for <xen-devel@lists.xenproject.org>; Thu, 20 Aug 2020 12:40:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zededa.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=sEjRaMa08FCRuVLxcXhfsYscbDMRmhGoKjv5MqDNVyc=;
 b=ZTYrltOUcaBAOchWVCgZ7YR4XOax7ZjdoU4UXyS2FjzP6xJn+S7UbNapUsGj2sCV4p
 coImfWmX6/PgsYzwwt0NstEI0ZFOgr5N2debhORErdYdZQ4chbg982Wv4RDUnUxwnDV7
 c4Q7LbcUL9BjfCMd5S4wGRabaaxiQITJgAkuAuOizFP5vH4ZcC0ssrK+0FsYsAJz6vNb
 jr5RMlDxBeR3768AAhjiY6w8NE369WuDhvH6AlaYmh9lqhSrnovBrMbj1kAptP61bNmz
 hGOH/4gvduqUfHqv4aOHw12FBSfofQ3XCtZy1Qazs7ayL9LhaUwPelhyoYXZEpHDZmf7
 qWlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=sEjRaMa08FCRuVLxcXhfsYscbDMRmhGoKjv5MqDNVyc=;
 b=NYa5R+86iVYxJFXXts9YmEcyxc4b/0+DNMEhuMePz5t1OVdOa/cAY7D1pFELjBfrub
 RzVCY9txROZ5SHT2aqE8AZLIYZwj8g07GqSex+MUA81C49DmHn7IlVx9cs9ac39Ro9g7
 ON1yvj+4b3RgL4MfDqnrImyVG0Muw4GkpNaCzAfj86E8769cXCM776DO02NR46yqie7o
 NYPLWWJY8/xkOOnPIT+Zqux5/VHCMj/3zz/3JA0V9bWWAnkvbe16WciU63DJz4uDI0h2
 dOv8rnkHcGIvVHysUgaZmSbEfjoLFG1mAMa4tIqjDGPDF+BBmqpeUn+jCNCf5u2kZuX2
 cisw==
X-Gm-Message-State: AOAM53080mxfD+EtCActF6Hm+f1wEOqZ4NGaV93U0OADoNhhvxlcOHQf
 8hTACDWSF0OjfIvC7i8vTOlgZOQGcVFRGzEVxHZcmw==
X-Google-Smtp-Source: ABdhPJxkAVyiook3HrazWFZHrieP/b8YvtCt/lJ5YhFqadac/DDv9npz0IZn1QMd8/qZ7PtAtIsdMa7YPp9u+pAB800=
X-Received: by 2002:ab0:63c1:: with SMTP id i1mr225574uap.120.1597952437577;
 Thu, 20 Aug 2020 12:40:37 -0700 (PDT)
MIME-Version: 1.0
References: <E5E6537A-3F6C-40C6-87AB-09546225F93D@gmail.com>
In-Reply-To: <E5E6537A-3F6C-40C6-87AB-09546225F93D@gmail.com>
From: Roman Shaposhnik <roman@zededa.com>
Date: Thu, 20 Aug 2020 12:40:18 -0700
Message-ID: <CAMmSBy_SDT5R3139OWsjtZPZiyP_GVZFeqA4Gg-Hhycf+ZgzuA@mail.gmail.com>
Subject: Re: Xen 4.14.0 fails on Dell IoT Gateway without efi=no-rs
To: Rich Persaud <persaur@gmail.com>
Cc: George Dunlap <dunlapg@umich.edu>, Jan Beulich <JBeulich@suse.com>, 
 Xen-devel <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, 
 Paul Durrant <paul@xen.org>, George Dunlap <george.dunlap@citrix.com>, 
 =?UTF-8?Q?Piotr_Kr=C3=B3l?= <piotr.krol@3mdeb.com>, 
 =?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Thu, Aug 20, 2020 at 6:10 AM Rich Persaud <persaur@gmail.com> wrote:
>
> On Aug 20, 2020, at 07:24, George Dunlap <dunlapg@umich.edu> wrote:
>
>
> =EF=BB=BF
> On Thu, Aug 20, 2020 at 9:35 AM Jan Beulich <jbeulich@suse.com> wrote:
>>
>>
>> As far as making cases like this work by default, I'm afraid it'll
>> need to be proposed to replace me as the maintainer of EFI code in
>> Xen. I will remain on the position that it is not acceptable to
>> apply workarounds for firmware issues by default unless they're
>> entirely benign to spec-conforming systems. DMI data based enabling
>> of workarounds, for example, is acceptable in the common case, as
>> long as the matching pattern isn't unreasonably wide.
>
>
> It sort of sounds like it would be useful to have a wider discussion on t=
his then, to hash out what exactly it is we want to do as a project.
>
>  -George
>
>
> Sometimes a middle ground is possible, e.g. see this Nov 2019 thread abou=
t a possible Xen Kconfig option for EFI_NONSPEC_COMPATIBILITY, targeting Ed=
ge/IoT/laptop hardware:
>
> https://lists.archive.carbon60.com/xen/devel/571670#571670

Yup. Having that top-level knob is exactly what I had in mind as the first =
step.
We can debate whether it needs to be on or off by default later, but having
it is a very burning problem. Otherwise distros like EVE and QubesOS just
to give you two obvious examples have a very difficult time sharing "best
practices" of what works on those types of devices.

> In the years to come, edge devices will only grow in numbers.  Some will =
be supported in production for more than a decade, which will require new l=
ong-term commercial support mechanisms for device BIOS, rather than firmwar=
e engineers shifting focus after a device is launched.

That's exactly what we're seeing with ZEDEDA customers.

> In parallel to (opt-in) Xen workarounds for a constrained and documented =
set of firmware issues, we need more industry efforts to support open firmw=
are, like coreboot and OCP Open System Firmware with minimum binary blobs. =
 At least one major x86 OEM is expected to ship open firmware in one of the=
ir popular devices, which may encourage competing OEM devices to follow.
>
> PC Engines APU2 (dual-core AMD, 4GB RAM, 6W TDP, triple NIC + LTE) is one=
 available edge device which supports Xen and has open (coreboot) firmware.=
  It would be nice to include APU2 in LF Edge support, if only to provide c=
ompetition to OEM devices with buggy firmware. Upcoming Intel Tiger Lake (C=
ore) and Elkhart Lake (Atom Tremont) are expected to expand edge-relevant s=
ecurity features, which would make such devices attractive to Xen deploymen=
ts.

Funny you should mention it -- APU2 is my weekend project for this
coming weekend to make EVE/Xen run on it out-of-the box. I'll be using
SeaBIOS payload for now, but the ultimate goal is to turn EVE into a
payload itself.

> We also need edge software vendors to encourage device OEMs to enable ope=
n firmware via coreboot, OCP OSF, Intel MinPlatform and similar programs. S=
ee https://software.intel.com/content/www/us/en/develop/articles/minimum-pl=
atform-architecture-open-source-uefi-firmware-for-intel-based-platforms.htm=
l and other talks from the open firmware conference, https://osfc.io/archiv=
e

Thanks,
Roman.

