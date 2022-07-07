Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F3B256A6D3
	for <lists+xen-devel@lfdr.de>; Thu,  7 Jul 2022 17:25:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.363047.593370 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o9TMp-0004JZ-RG; Thu, 07 Jul 2022 15:24:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 363047.593370; Thu, 07 Jul 2022 15:24:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o9TMp-0004HC-OR; Thu, 07 Jul 2022 15:24:35 +0000
Received: by outflank-mailman (input) for mailman id 363047;
 Thu, 07 Jul 2022 15:24:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AtSF=XM=gmail.com=firemeteor.guo@srs-se1.protection.inumbo.net>)
 id 1o9TMo-0004H6-SS
 for xen-devel@lists.xen.org; Thu, 07 Jul 2022 15:24:34 +0000
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com
 [209.85.208.54]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e73f96f0-fe08-11ec-924f-1f966e50362f;
 Thu, 07 Jul 2022 17:24:33 +0200 (CEST)
Received: by mail-ed1-f54.google.com with SMTP id fd6so23587980edb.5
 for <xen-devel@lists.xen.org>; Thu, 07 Jul 2022 08:24:33 -0700 (PDT)
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
X-Inumbo-ID: e73f96f0-fe08-11ec-924f-1f966e50362f
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=yKIX1Zf5uIz6Xx7Ku3sbPTiazshJJhCh8BzIuZZ0kg8=;
        b=7SeGRBI5rsW/eQ5wbh0wez4473N8g3s9PHAoBaddqwLg5RTwxVA1+9ZfJBS/wo2Ltn
         8sRgr06mzfLhZUO+mTJSfVubprvsi/Hqgv9+8yE7C6ym2i0SXBGz3LKA1hs9N7TvJcuC
         SSZgiikPF2YOovw6G7ZiOsEIpZn77vj5UzihWq+h77ql9JRNLK7MkqKUkPNcRHyfQC/s
         3e6gXE998TyCDXMoavTR0sxJrQzxz3jkx6IjqAT6E0oEwP1cVP/k40iHzktmT2JEQX11
         6T/dJGMAiyvj+TcaA2111FJaeQvJ6H1P4K4Tfuj2iXRgQXdjpMQun+dYR43I/q8Yb8jG
         jYYg==
X-Gm-Message-State: AJIora8E3a7zeeh7R2Feqw9fAtEDdfqzfx3nd/JPN9brPHOXzs7gfzl5
	lKFtKjPdHTd7IfZRu99TLIPjCwdqScsq21/hEmk=
X-Google-Smtp-Source: AGRyM1u31HggXWDgba9zCpkuSwc5LQwhOHw3PqS5C/hDFj7yV2fUdsLujwm5yHmvwKwnCUkGaNvUDmcDYb43hK1orFM=
X-Received: by 2002:a05:6402:84f:b0:437:6293:d264 with SMTP id
 b15-20020a056402084f00b004376293d264mr61516301edz.317.1657207473181; Thu, 07
 Jul 2022 08:24:33 -0700 (PDT)
MIME-Version: 1.0
References: <CAKhsbWb4FyqWBraid=99mfr=_wbXQHfKq6jBszN9-WmV_OiBYw@mail.gmail.com>
 <YsK3/fDX8c0Tzfv0@MacBook-Air-de-Roger.local> <CAKhsbWakmx6Bw+fJZ49pbcmRx68WWuSCpYzJDg7uiYWuEnu0qg@mail.gmail.com>
 <YsLmlIrCBt/Ldg1G@MacBook-Air-de-Roger.local> <CAKhsbWZkbx8WrmuhAO3P_UxFihx_4UZHnUjrKZaFV1uwF6ifEg@mail.gmail.com>
 <CAKhsbWbs_QZ-DN6duUKXGBsNfq0awXFbVJkdZ9SoNxa8ySkRoQ@mail.gmail.com>
 <CAKhsbWZOB4NscA04Ez4e0q1LUHWjH1ugUdY073hoBYUqOEGxeg@mail.gmail.com>
 <YsMP1+6/Txj5s7q/@MacBook-Air-de-Roger.local> <CAKhsbWZmoC3JzZAZ5T1R0aUif3joJq-oncaYVpMcPZ0A1OXxJg@mail.gmail.com>
 <def66a62-e6d5-38bd-2e78-9ad9a7eff14e@suse.com> <CAKhsbWYROUgYti7UE3Of25wKw4uE84UPrC5DkkSLrzR5fS1Cgg@mail.gmail.com>
 <f689313d-cd8e-80b9-d2ea-7120610a487a@suse.com> <CAKhsbWYytY8_3DTqpq4u+SvywuDSK5dgy8dzm1T3TFdP5MJaDQ@mail.gmail.com>
 <ca4e8b79-c831-8c09-6398-b76852dfde53@suse.com>
In-Reply-To: <ca4e8b79-c831-8c09-6398-b76852dfde53@suse.com>
From: "G.R." <firemeteor@users.sourceforge.net>
Date: Thu, 7 Jul 2022 23:24:21 +0800
Message-ID: <CAKhsbWZoeZeyysF+1O9xGvrVBrApHrSbk+GJavHUEHim5hudrA@mail.gmail.com>
Subject: Re: PCI pass-through problem for SN570 NVME SSD
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel <xen-devel@lists.xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, Jul 6, 2022 at 2:33 PM Jan Beulich <jbeulich@suse.com> wrote:
>
> On 06.07.2022 08:25, G.R. wrote:
> > On Tue, Jul 5, 2022 at 7:59 PM Jan Beulich <jbeulich@suse.com> wrote:
> >> Nothing useful in there. Yet independent of that I guess we need to
> >> separate the issues you're seeing. Otherwise it'll be impossible to
> >> know what piece of data belongs where.
> > Yep, I think I'm seeing several different issues here:
> > 1. The FLR related DPC / AER message seen on the 1st attempt only when
> > pciback tries to seize and release the SN570
> >     - Later-on pciback operations appear just fine.
> > 2. MSI-X preparation failure message that shows up each time the SN570
> > is seized by pciback or when it's passed to domU.
> > 3. XEN tries to map BAR from two devices to the same page
> > 4. The "write-back to unknown field" message in QEMU log that goes
> > away with permissive=1 passthrough config.
> > 5. The "irq 16: nobody cared" message shows up *sometimes* in a
> > pattern that I haven't figured out  (See attached)
> > 6. The FreeBSD domU sees the device but fails to use it because low
> > level commands sent to it are aborted.
> > 7. The device does not return to the pci-assignable-list when the domU
> > it was assigned shuts-down. (See attached)
> >
> > #3 appears to be a known issue that could be worked around with
> > patches from the list.
> > I suspect #1 may have something to do with the device itself. It's
> > still not clear if it's deadly or just annoying.
> > I was able to update the firmware to the latest version and confirmed
> > that the new firmware didn't make any noticeable difference.
> >
> > I suspect issue #2, #4, #5, #6, #7 may be related, and the
> > pass-through was not completely successful...
> >
> > Should I expect a debug build of XEN hypervisor to give better
> > diagnose messages, without the debug patch that Roger mentioned?
>
> Well, "expect" is perhaps too much to say, but with problems like
> yours (and even more so with multiple ones) using a debug
> hypervisor (or kernel, if there such a build mode existed) is imo
> always a good idea. As is using as up-to-date a version as
> possible.

I built both 4.14.3 debug version and 4.16.1 release version for
testing purposes.
Unfortunately they gave me absolutely zero information, since both of
them are not able to get through issue #1
the FlR related DPC / AER issue.
With 4.16.1 release, it actually can survive the 'xl
pci-assignable-add' which triggers the first AER failure.
But the 'xl pci-assignable-remove' will lead to xl segmentation fault...
>[  655.041442] xl[975]: segfault at 0 ip 00007f2cccdaf71f sp 00007ffd73a3d4d0 error 4 in libxenlight.so.4.16.0[7f2cccd92000+7c000]
>[  655.041460] Code: 61 06 00 eb 13 66 0f 1f 44 00 00 83 c3 01 39 5c 24 2c 0f 86 1b 01 00 00 48 8b 34 24 89 d8 4d 89 f9 4d 89 f0 4c 89 e9 4c 89 e2 <48> 8b 3c c6 31 c0 48 89 ee e8 53 44 fe ff 83 f8 04 75 ce 48 8b 44
Since I'll need a couple of pci-assignable-add &&
pci-assignable-remove to get to a seemingly normal state, I cannot
proceed from here.

With 4.14.3 debug build, the hypervisor / dom0 reboots on 'xl
pci-assignable-add'.

[  574.623143] pciback 0000:05:00.0: xen_pciback: resetting (FLR, D3,
etc) the device
[  574.623203] pcieport 0000:00:1d.0: DPC: containment event,
status:0x1f11 source:0x0000
[  574.623204] pcieport 0000:00:1d.0: DPC: unmasked uncorrectable error detected
[  574.623209] pcieport 0000:00:1d.0: PCIe Bus Error:
severity=Uncorrected (Non-Fatal), type=Transaction Layer, (Receiver
ID)
[  574.623240] pcieport 0000:00:1d.0:   device [8086:a330] error
status/mask=00200000/00010000
[  574.623261] pcieport 0000:00:1d.0:    [21] ACSViol                (First)
[  575.855026] pciback 0000:05:00.0: not ready 1023ms after FLR; waiting
[  576.895015] pciback 0000:05:00.0: not ready 2047ms after FLR; waiting
[  579.028311] pciback 0000:05:00.0: not ready 4095ms after FLR; waiting
[  583.294910] pciback 0000:05:00.0: not ready 8191ms after FLR; waiting
[  591.614965] pciback 0000:05:00.0: not ready 16383ms after FLR; waiting
[  609.534502] pciback 0000:05:00.0: not ready 32767ms after FLR; waiting
[  643.667069] pciback 0000:05:00.0: not ready 65535ms after FLR; giving up
//<=======The reboot happens somewhere here, not immediately, but
after a while...
//Maybe I can get something from xl dmesg if I was quick enough and
have connected from a second terminal...
[  644.773922] pciback 0000:05:00.0: xen_pciback: reset device
[  644.774050] pciback 0000:05:00.0: xen_pciback:
xen_pcibk_error_detected(bus:5,devfn:0)
[  644.774051] pciback 0000:05:00.0: xen_pciback: device is not found/assigned
[  644.923432] pciback 0000:05:00.0: xen_pciback:
xen_pcibk_error_resume(bus:5,devfn:0)
[  644.923437] pciback 0000:05:00.0: xen_pciback: device is not found/assigned
[  644.923616] pcieport 0000:00:1d.0: AER: device recovery successful



>
> Jan

