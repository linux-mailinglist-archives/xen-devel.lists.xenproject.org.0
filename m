Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ABADBCE6FF7
	for <lists+xen-devel@lfdr.de>; Mon, 29 Dec 2025 15:21:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1194055.1512552 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vaE7w-0001GE-CB; Mon, 29 Dec 2025 14:21:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1194055.1512552; Mon, 29 Dec 2025 14:21:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vaE7w-0001EP-8P; Mon, 29 Dec 2025 14:21:40 +0000
Received: by outflank-mailman (input) for mailman id 1194055;
 Mon, 29 Dec 2025 14:21:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UciX=7D=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1vaE7u-0001EJ-IS
 for xen-devel@lists.xenproject.org; Mon, 29 Dec 2025 14:21:38 +0000
Received: from mail-yw1-x112b.google.com (mail-yw1-x112b.google.com
 [2607:f8b0:4864:20::112b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id aef4d2b6-e4c1-11f0-b15c-2bf370ae4941;
 Mon, 29 Dec 2025 15:21:37 +0100 (CET)
Received: by mail-yw1-x112b.google.com with SMTP id
 00721157ae682-78fc7893c93so59085037b3.2
 for <xen-devel@lists.xenproject.org>; Mon, 29 Dec 2025 06:21:37 -0800 (PST)
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
X-Inumbo-ID: aef4d2b6-e4c1-11f0-b15c-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767018096; x=1767622896; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z444mcpbqBo/U3loZCXm/YDc96pZitp2FUUv2yw0WA0=;
        b=Z/i5+HVZG0bs+zxhOvmygyDU28xkMsfLUQ7NGIc8KQVvvCf+gOlWHYsnwIXVK4uQNq
         0OMcDQMI91AcJvanht7wxGf9oyHRxwM0e657eqeqgiSE/ZN0qv6YtHN+Z5jc1kGXYKGo
         d6RJXzui/C6AD2oMPGvlddX+jkoXugXXe8hLqzsBuxl10NxUEkuI1QN7fGrdAnnEKQ1n
         NbRrUbFOAdfuTWUDqhb6RS1M6kgdwNWV+1jahA5reKSkGkWVnIpPmqcmBK8nhAuVs/UN
         oykQ7ryxLcKY4ryxYk3kLJEnHLdeExWQv2k0v9g3I050DFIyAkBr1AkphxYChL7tfygR
         WErg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767018096; x=1767622896;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=z444mcpbqBo/U3loZCXm/YDc96pZitp2FUUv2yw0WA0=;
        b=k+7fhv890TrZHgeGTt8kDNGOjD7ktTOc5duiRlawAPUkfw5LPoTA91g/9vH03yLUhb
         JeSVe8Uspmmkop9Xa9iR75FnAUHb1/7WTJM+CJjqOKpdZ6NBV/R5DNYfu9dZi6Rg/scl
         6++UTdX5lVxEVDX/pce+wgR3+kfPD2JdILqapEf2xzgDTKJ0X+YfDe20Zm9bKVGTozaE
         bdo5Lg1uYAv07VGHKixDUEqWYg485Sv4Kq0z3JawX7mcbE0j62aHdTQXXVTdVFY46awJ
         +2Z5AmpI1Db027cm+BlF2HELIqa7aYDJWtMm96F/rW7gDhVi77qpMzPqcY/VrT4xObUW
         w98w==
X-Gm-Message-State: AOJu0YwcBjdSRfQWYxyl6h4H88o98FfWt/hsrkXi2h9H/t9m6dMHf29m
	mIU8Xezu2A9Qr//yQtwd6sw0bi+3Ooh2gaUHwLpjA8MX3ELAldOe2Eu9zabka/w1XPxVSl0oioJ
	m+bjXDpviRUvjgLPS/nE/AwIDlFrwM1U=
X-Gm-Gg: AY/fxX7vmozi9GABhRX1E4nqWa3bETrBH3vwVO6L8qURtwlKsqrU39e1AX6hB7n31pD
	rTBYv6H23/KIVsgzCOl1rUdx9AALV5UE9Vl1j/5F8gM0RXpLHBmbYIu51qDtyKXS0Lol8y7tlsN
	vIUCp43j3mvounQTGS24NBaZjB3/IMNX/32/Task/J8ZamNQapKoXxBZqyLMk4asQSIzQQ9uD62
	QhN4ZQBJh4JhL9QJHWCfFFUqz1U2nn63UgpgRRte5HuzFibU73ddRXMTJl/+AfDl2MqNVqHUTJN
	3DotaUgipx6FcHzw/1J8/71QRLM=
X-Google-Smtp-Source: AGHT+IE9pEDqQtHUb/bjKuaIbCji207bhi5Fj7d175ksfCH14OxIzBJa59UWW1hNX02X0Cly7DhAr5t4UcyCaP6dTok=
X-Received: by 2002:a05:690c:6311:b0:788:17ef:4ecf with SMTP id
 00721157ae682-78fb407e423mr287567217b3.50.1767018095747; Mon, 29 Dec 2025
 06:21:35 -0800 (PST)
MIME-Version: 1.0
References: <dg8zeLW4X3RWRJt-1jas5pAqHft5GbxYxS5mNwc4ONE8tDEruL1-5a_e-vQu1RdOUWsMXxKe_Igcewy2zcbnOfkaGVG7y6hXLcLd78HI1po=@proton.me>
In-Reply-To: <dg8zeLW4X3RWRJt-1jas5pAqHft5GbxYxS5mNwc4ONE8tDEruL1-5a_e-vQu1RdOUWsMXxKe_Igcewy2zcbnOfkaGVG7y6hXLcLd78HI1po=@proton.me>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Mon, 29 Dec 2025 09:21:24 -0500
X-Gm-Features: AQt7F2rbJsKstOaPs8sxnLYFgI_7U_kAosD5WrmQNWz1AFMLiwrBNgAjF9ZJHkM
Message-ID: <CAKf6xpsN_RnY2dHnXKj_-UySf1z0auye2qy=KHOEhcBbZ1un9A@mail.gmail.com>
Subject: Re: Cpufreq drivers not working on T480S
To: Milky <milky_way_303030@proton.me>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Milky,

On Sat, Dec 27, 2025 at 9:23=E2=80=AFAM Milky <milky_way_303030@proton.me> =
wrote:
>
> System is T480s with i5-8250U and Libreboot, booting Qubes R4.2 with Xen =
4.17.5.
>
> I=E2=80=99ve tested the following configurations:
>
> 1. `GRUB_CMDLINE_XEN_DEFAULT=3D"cpufreq=3Dxen:performance"` as per [the x=
en docs](https://xenbits.xen.org/docs/unstable/misc/xen-command-line.html#c=
pufreq)
> 2. `GRUB_CMDLINE_XEN_DEFAULT=3D"cpufreq=3Ddom0-kernel dom0_vcpus_pin"` as=
 per [the xen wiki](http://wiki.xenproject.org/wiki/Xen_power_management#Do=
main0_based_cpufreq); tho I suspect this option might be deprecated.
> 3. `GRUB_CMDLINE_XEN_DEFAULT=3D"cpufreq=3Dxen:hwp"`, which should have ac=
tivated [this patch from the Qubes team](https://github.com/QubesOS/qubes-v=
mm-xen/pull/158).

The dom0-kernel option is a legacy configuration and doesn't really
work.  You don't want it.  From the logs below, #1 and #3 enable HWP.

>
> In all cases, `cat /proc/cpuinfo` reports the fixed value `cpu Mhz: 1800`=
, confirmed also using `dmidecode`. `sysbench` in an AppVM with max vcpus c=
onsistently reports about 1600 events per second, while the dom0 CPU stats =
in the previous commands remain unchanged.

Xen domains don't see real-time updates of CPU frequency, so it's
working as intended.  xenpm is the way to query Xen for CPU info.

>`xenpm start 10 | grep 'Avg freq'` reports bizarre values, like `609350368=
 KHz`.

In my testing with HWP, CPU frequency was reported correctly by xenpm.
My 4.8GHz cpu shows 47xx MHz under load, but it would also throttle
down after a bit.

Ok, I previously wrote:
"""
The output of `xenpm get-cpufreq-average`
under HWP looks reasonable for scaling all the way up to 4800MHz
(which can only be hit briefly before throttling down) - I think I've
only seen ~4700MHz as a maximum in my use, and them it may drop to
~4200MHz for extended preiods.  Maybe try that command on your test
system?
"""

That is with the version of HWP upstreamed, which is a later version
than Qubes included in R4.2.

>
> The following commands were also checked:
>
> ```
> $ xenpm get-cpufreq-para
> [CPU0] failed to get cpufreq parameter
> <...>
>
> $ xenpm get-cpufreq-states
> <no output>
>
> $ lsmod | grep 'xen_acpi_processor'
> <no output>
>
> $ modprobe xen_acpi_processor
> modprobe: ERROR: could not insert 'xen_acpi_processor': No such device

Are you sure you are running these commands from dom0?  It looks like
xen_acpi_processor returns -ENODEV/No such device when modprobed from
a domU and not dom0.  You need dom0 to query Xen for this information.

> ```
>
> Based on (this Xen mailing list message)[https://old-list-archives.xen.or=
g/archives/html/xen-devel/2020-01/msg02588.html], the `xen-acpi-processor` =
module is what enables dom0 to pass critical information to Xen. Thus, it s=
eems a big part of the problem is that `xen-acpi-processor` is refusing to =
load.
>
> To rule out causes independent of Xen/Qubes, I booted using a Debian Live=
 image. `sysbench` consistently reported 4000 events per second, while `/sy=
s/cpuinfo` reliably showed a jump from 900Mhz to 3.4GHz.
>
> In conclusion, only under Qubes/Xen, something seems to block the scaling=
 drivers from working on this system.
>
> For each of the configurations above, I am pasting the complete output of=
 `xl dmesg`. Let me know if there is anything else I should do.
>
> ```
> ########################################################################
> # `cpufreq=3Dxen:performance`
>
> (XEN) Built-in command line: ept=3Dexec-sp spec-ctrl=3Dunpriv-mmio
>  Xen 4.17.5
> (XEN) Xen version 4.17.5 (mockbuild@[unknown]) (gcc (GCC) 12.3.1 20230508=
 (Red Hat 12.3.1-1)) debug=3Dn Fri Aug 22 16:12:56 CEST 2025

> (XEN) HWP: 1 notify: 1 act-window: 1 energy-perf: 1 pkg-level: 0 peci: 0
> (XEN) HWP: Hardware Duty Cycling (HDC) supported, enabled
> (XEN) HWP: HW_FEEDBACK not supported
> (XEN) Using HWP for cpufreq

HWP enabled

> ########################################################################
> # `cpufreq=3Ddom0-kernel dom0_vcpus_pin`
>
> (XEN) Built-in command line: ept=3Dexec-sp spec-ctrl=3Dunpriv-mmio
>  Xen 4.17.5
> (XEN) Xen version 4.17.5 (mockbuild@[unknown]) (gcc (GCC) 12.3.1 20230508=
 (Red Hat 12.3.1-1)) debug=3Dn Fri Aug 22 16:12:56 CEST 2025

No HWP line.

> ########################################################################
> # `cpufreq=3Dxen:hwp`
>
> (XEN) Built-in command line: ept=3Dexec-sp spec-ctrl=3Dunpriv-mmio
>  Xen 4.17.5
> (XEN) Xen version 4.17.5 (mockbuild@[unknown]) (gcc (GCC) 12.3.1 20230508=
 (Red Hat 12.3.1-1)) debug=3Dn Fri Aug 22 16:12:56 CEST 2025

> (XEN) Command line: placeholder cpufreq=3Dxen:hwp,verbose loglvl=3Dall do=
m0_mem=3Dmin:1024M dom0_mem=3Dmax:4096M ucode=3Dscan smt=3Doff gnttab_max_f=
rames=3D2048 gnttab_max_maptrack_frames=3D4096 no-real-mode edd=3Doff

> (XEN) HWP: 1 notify: 1 act-window: 1 energy-perf: 1 pkg-level: 0 peci: 0
> (XEN) HWP: Hardware Duty Cycling (HDC) supported, enabled
> (XEN) HWP: HW_FEEDBACK not supported
> (XEN) Using HWP for cpufreq

And HWP enabled again.

Regards,
Jason

