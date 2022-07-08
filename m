Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 49EDF56B0A1
	for <lists+xen-devel@lfdr.de>; Fri,  8 Jul 2022 04:29:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.363193.593625 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o9djx-0003ln-Gu; Fri, 08 Jul 2022 02:29:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 363193.593625; Fri, 08 Jul 2022 02:29:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o9djx-0003ih-Dd; Fri, 08 Jul 2022 02:29:09 +0000
Received: by outflank-mailman (input) for mailman id 363193;
 Fri, 08 Jul 2022 02:29:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WbXf=XN=gmail.com=firemeteor.guo@srs-se1.protection.inumbo.net>)
 id 1o9djv-0003iY-Qq
 for xen-devel@lists.xen.org; Fri, 08 Jul 2022 02:29:07 +0000
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com
 [209.85.218.46]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bcb103d2-fe65-11ec-924f-1f966e50362f;
 Fri, 08 Jul 2022 04:29:06 +0200 (CEST)
Received: by mail-ej1-f46.google.com with SMTP id u15so11024172ejx.9
 for <xen-devel@lists.xen.org>; Thu, 07 Jul 2022 19:29:05 -0700 (PDT)
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
X-Inumbo-ID: bcb103d2-fe65-11ec-924f-1f966e50362f
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8vRMTEoe5E+ukqrDk6mXa763umsMszb5H3XKeVL2Zrk=;
        b=lfibtCZkBgCAU59J7+g/vOum2kbb8VxXgoKMSOdQc59FUs/Au9p2jzhF0yjBQEaO5s
         Oen1fLmXkMulzVSqUtK8I/eX73Rv+geOY9Atpj99kgcAvnvXpxAfTME43MQmsy0W491S
         y76U1DnmP+AS86OEVDMMM6SfGxouWrPiDU1/ihJ0zHLxj+D63PqojQna6GMnpnwgyz3v
         NCVE2EK5C9B6mFhrq1RjsZxkumN05KvhvUapZHiGZy/VeBllPnrect54OU5vpAa6DyNt
         inLYhb2Bd4gYSJvOCAYz7q0Wb2ZDfLd+lbUHrW+512QD+iRsLzfKP8okCBp7NqQ9c3IF
         JPog==
X-Gm-Message-State: AJIora+873JIE4DnLnmog+hauQm5gSsZmwYFkN5JHeQdCDTyUcT3kCSb
	YFhlNMvo5AvrvtutJLuYNtAtBT/FlcEm/5WjIo0kieg8/2g=
X-Google-Smtp-Source: AGRyM1s3BL1HsKMX/YujdcpJjgjjaAxFGZhF+l2Ha46HSeAMFN9jhhRtrp/01+vPzzKCLsQN6h/yZTXKi3umfcna9bc=
X-Received: by 2002:a17:907:2814:b0:72a:3758:e948 with SMTP id
 eb20-20020a170907281400b0072a3758e948mr1261665ejc.8.1657247344904; Thu, 07
 Jul 2022 19:29:04 -0700 (PDT)
MIME-Version: 1.0
References: <CAKhsbWb4FyqWBraid=99mfr=_wbXQHfKq6jBszN9-WmV_OiBYw@mail.gmail.com>
 <YsK3/fDX8c0Tzfv0@MacBook-Air-de-Roger.local> <CAKhsbWakmx6Bw+fJZ49pbcmRx68WWuSCpYzJDg7uiYWuEnu0qg@mail.gmail.com>
 <YsLmlIrCBt/Ldg1G@MacBook-Air-de-Roger.local> <CAKhsbWZkbx8WrmuhAO3P_UxFihx_4UZHnUjrKZaFV1uwF6ifEg@mail.gmail.com>
 <CAKhsbWbs_QZ-DN6duUKXGBsNfq0awXFbVJkdZ9SoNxa8ySkRoQ@mail.gmail.com>
 <CAKhsbWZOB4NscA04Ez4e0q1LUHWjH1ugUdY073hoBYUqOEGxeg@mail.gmail.com>
 <YsMP1+6/Txj5s7q/@MacBook-Air-de-Roger.local> <CAKhsbWZmoC3JzZAZ5T1R0aUif3joJq-oncaYVpMcPZ0A1OXxJg@mail.gmail.com>
 <def66a62-e6d5-38bd-2e78-9ad9a7eff14e@suse.com> <CAKhsbWYROUgYti7UE3Of25wKw4uE84UPrC5DkkSLrzR5fS1Cgg@mail.gmail.com>
 <f689313d-cd8e-80b9-d2ea-7120610a487a@suse.com> <CAKhsbWYytY8_3DTqpq4u+SvywuDSK5dgy8dzm1T3TFdP5MJaDQ@mail.gmail.com>
 <ca4e8b79-c831-8c09-6398-b76852dfde53@suse.com> <CAKhsbWZoeZeyysF+1O9xGvrVBrApHrSbk+GJavHUEHim5hudrA@mail.gmail.com>
 <93c7b016-06f9-e3d2-5a7f-97a5f15c1a86@suse.com>
In-Reply-To: <93c7b016-06f9-e3d2-5a7f-97a5f15c1a86@suse.com>
From: "G.R." <firemeteor@users.sourceforge.net>
Date: Fri, 8 Jul 2022 10:28:52 +0800
Message-ID: <CAKhsbWYDFeu9ZdgGX-cVhZ3eW7bm6emQqLeb6zbSFJ0Se=0g5A@mail.gmail.com>
Subject: Re: PCI pass-through problem for SN570 NVME SSD
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel <xen-devel@lists.xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Anthony Perard <anthony.perard@citrix.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, Jul 8, 2022 at 12:38 AM Jan Beulich <jbeulich@suse.com> wrote:
>
> On 07.07.2022 17:24, G.R. wrote:
> > On Wed, Jul 6, 2022 at 2:33 PM Jan Beulich <jbeulich@suse.com> wrote:
> >>
> >> On 06.07.2022 08:25, G.R. wrote:
> >>> On Tue, Jul 5, 2022 at 7:59 PM Jan Beulich <jbeulich@suse.com> wrote:
> >>>> Nothing useful in there. Yet independent of that I guess we need to
> >>>> separate the issues you're seeing. Otherwise it'll be impossible to
> >>>> know what piece of data belongs where.
> >>> Yep, I think I'm seeing several different issues here:
> >>> 1. The FLR related DPC / AER message seen on the 1st attempt only when
> >>> pciback tries to seize and release the SN570
> >>>     - Later-on pciback operations appear just fine.
> >>> 2. MSI-X preparation failure message that shows up each time the SN570
> >>> is seized by pciback or when it's passed to domU.
> >>> 3. XEN tries to map BAR from two devices to the same page
> >>> 4. The "write-back to unknown field" message in QEMU log that goes
> >>> away with permissive=1 passthrough config.
> >>> 5. The "irq 16: nobody cared" message shows up *sometimes* in a
> >>> pattern that I haven't figured out  (See attached)
> >>> 6. The FreeBSD domU sees the device but fails to use it because low
> >>> level commands sent to it are aborted.
> >>> 7. The device does not return to the pci-assignable-list when the domU
> >>> it was assigned shuts-down. (See attached)
> >>>
> >>> #3 appears to be a known issue that could be worked around with
> >>> patches from the list.
> >>> I suspect #1 may have something to do with the device itself. It's
> >>> still not clear if it's deadly or just annoying.
> >>> I was able to update the firmware to the latest version and confirmed
> >>> that the new firmware didn't make any noticeable difference.
> >>>
> >>> I suspect issue #2, #4, #5, #6, #7 may be related, and the
> >>> pass-through was not completely successful...
> >>>
> >>> Should I expect a debug build of XEN hypervisor to give better
> >>> diagnose messages, without the debug patch that Roger mentioned?
> >>
> >> Well, "expect" is perhaps too much to say, but with problems like
> >> yours (and even more so with multiple ones) using a debug
> >> hypervisor (or kernel, if there such a build mode existed) is imo
> >> always a good idea. As is using as up-to-date a version as
> >> possible.
> >
> > I built both 4.14.3 debug version and 4.16.1 release version for
> > testing purposes.
> > Unfortunately they gave me absolutely zero information, since both of
> > them are not able to get through issue #1
> > the FlR related DPC / AER issue.
> > With 4.16.1 release, it actually can survive the 'xl
> > pci-assignable-add' which triggers the first AER failure.
>
> Then that's what needs debugging first. Yet from all I've seen so
> far I'm not sure who one the Xen side could be doing that, the more
> without themselves being able to repro - this seems more like a
> Linux side issue (and even outside of the pciback driver).
>
Yep, this one is likely not XEN related, as I've seen some discussions
([1],[2]) on similar syndrome (not necessarily same root cause
though).
The question is why this only shows up during the FLR attempt and if
following pci-assignable-adds that do not trigger the error are
actually reliable.
BTW, I'm under the impression that the device is still usable in dom0
afterwards, I'll have to double check though...

[1] https://patchwork.kernel.org/project/linux-pci/patch/20220408153159.106741-1-kai.heng.feng@canonical.com/
[2] https://patchwork.kernel.org/project/linux-pci/patch/20220127025418.1989642-1-kai.heng.feng@canonical.com/#24713767

> > But the 'xl pci-assignable-remove' will lead to xl segmentation fault...
> >> [  655.041442] xl[975]: segfault at 0 ip 00007f2cccdaf71f sp 00007ffd73a3d4d0 error 4 in libxenlight.so.4.16.0[7f2cccd92000+7c000]
> >> [  655.041460] Code: 61 06 00 eb 13 66 0f 1f 44 00 00 83 c3 01 39 5c 24 2c 0f 86 1b 01 00 00 48 8b 34 24 89 d8 4d 89 f9 4d 89 f0 4c 89 e9 4c 89 e2 <48> 8b 3c c6 31 c0 48 89 ee e8 53 44 fe ff 83 f8 04 75 ce 48 8b 44
>
> That'll need debugging. Cc-ing Anthony for awareness, but I'm sure
> he'll need more data to actually stand a chance of doing something
> about it.
>
> Is there any chance you could be doing some debugging work yourself,
> at the very least to figure out where this (apparent) NULL deref is
> happening?
Yep, I can collect the call-stack for sure.

>
> Jan

