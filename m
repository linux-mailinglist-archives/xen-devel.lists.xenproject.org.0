Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E991756C6E6
	for <lists+xen-devel@lfdr.de>; Sat,  9 Jul 2022 06:29:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.363717.594419 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oA24F-0002px-KK; Sat, 09 Jul 2022 04:27:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 363717.594419; Sat, 09 Jul 2022 04:27:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oA24F-0002o2-GH; Sat, 09 Jul 2022 04:27:43 +0000
Received: by outflank-mailman (input) for mailman id 363717;
 Sat, 09 Jul 2022 04:27:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NA6z=XO=gmail.com=firemeteor.guo@srs-se1.protection.inumbo.net>)
 id 1oA24E-0002nw-1f
 for xen-devel@lists.xen.org; Sat, 09 Jul 2022 04:27:42 +0000
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com
 [209.85.218.44]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7678e597-ff3f-11ec-bd2d-47488cf2e6aa;
 Sat, 09 Jul 2022 06:27:40 +0200 (CEST)
Received: by mail-ej1-f44.google.com with SMTP id ez10so685311ejc.13
 for <xen-devel@lists.xen.org>; Fri, 08 Jul 2022 21:27:37 -0700 (PDT)
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
X-Inumbo-ID: 7678e597-ff3f-11ec-bd2d-47488cf2e6aa
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rcEJ6NAWK4bKVWVQpG5ax76VwHHhmRjfe+BO7AFwhvE=;
        b=JTm+1Qd7D5jV0E+6Dnh9wB2VJ83q2yv6e/llImagrR/Y2qNaL5fJrqf3EBisPb/Tmu
         Rfh1Dt9py/dMesqADxxobL8Tmh+4NVUO+fnbqOhLjw77m/t2MH3EAYGNaKrMHGlvqD0Z
         lIKj02jepXXD6dxCb80xyTAavDxl8SQRJ7JIPhqCP3e5btpOOSreCnywC1JHIx/HbpkR
         0Hu9XQVdMCg9SoDBgKUJqZ3pIErMxZfDdJg5Vt9bmQpEhkjMSDRly+DFwPKWkkUmRlRy
         tdIeW05wj/Kkf1LCyJEZzx4HgJa4Cdf5P3NEnAL3+XbGgj/Og5cwjiJOjm8S24FbPPe+
         jlyQ==
X-Gm-Message-State: AJIora/iVtnYrEwj/B0kcTD2VZF0NyuZ2oxKd1lL5uViG34W2e8x9SeI
	ILElzIUssOSFfJmzPt4xwJ53J8RLULZLtctVc0M=
X-Google-Smtp-Source: AGRyM1swZbp7KYszXIAzHvD00YYQ8bdnInjt7oFa4o2MPYqXJG3R9UppX/bxOzBIXoDUBh6ySJhyzhZr/0roUmMD0HE=
X-Received: by 2002:a17:907:a05c:b0:72b:347b:4f59 with SMTP id
 gz28-20020a170907a05c00b0072b347b4f59mr1507480ejc.764.1657340857534; Fri, 08
 Jul 2022 21:27:37 -0700 (PDT)
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
 <93c7b016-06f9-e3d2-5a7f-97a5f15c1a86@suse.com> <CAKhsbWYDFeu9ZdgGX-cVhZ3eW7bm6emQqLeb6zbSFJ0Se=0g5A@mail.gmail.com>
In-Reply-To: <CAKhsbWYDFeu9ZdgGX-cVhZ3eW7bm6emQqLeb6zbSFJ0Se=0g5A@mail.gmail.com>
From: "G.R." <firemeteor@users.sourceforge.net>
Date: Sat, 9 Jul 2022 12:27:24 +0800
Message-ID: <CAKhsbWY0G+0J2cbZDeQT0zd38XEW-Gwn+KVYwoZbr-nd7oUDZg@mail.gmail.com>
Subject: Re: PCI pass-through problem for SN570 NVME SSD
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel <xen-devel@lists.xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Anthony Perard <anthony.perard@citrix.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, Jul 8, 2022 at 10:28 AM G.R. <firemeteor@users.sourceforge.net> wrote:
>
> On Fri, Jul 8, 2022 at 12:38 AM Jan Beulich <jbeulich@suse.com> wrote:
> >
> > > I built both 4.14.3 debug version and 4.16.1 release version for
> > > testing purposes.
> > > Unfortunately they gave me absolutely zero information, since both of
> > > them are not able to get through issue #1
> > > the FlR related DPC / AER issue.
> > > With 4.16.1 release, it actually can survive the 'xl
> > > pci-assignable-add' which triggers the first AER failure.
> >
> > Then that's what needs debugging first. Yet from all I've seen so
> > far I'm not sure who one the Xen side could be doing that, the more
> > without themselves being able to repro - this seems more like a
> > Linux side issue (and even outside of the pciback driver).
> >
> Yep, this one is likely not XEN related, as I've seen some discussions
> ([1],[2]) on similar syndrome (not necessarily same root cause
> though).
> The question is why this only shows up during the FLR attempt and if
> following pci-assignable-adds that do not trigger the error are
> actually reliable.
> BTW, I'm under the impression that the device is still usable in dom0
> afterwards, I'll have to double check though...
I think I'm finally making progress here.
Today I verified that the SSD does not survive FLR in Linux as long as
AER / DPC is enabled.
Irrelevant to pciback or whatever driver it attaches to, the same
syndrome can be observed.
And after the unsuccessful FLR, I can't even use the device on dom0 or
the Linux itself.

Forcing disabling ASPM does not fix the issue, as long as AER / DPC
are left enabled.
However, as long as AER / DPC is disabled (through pcie-aspm=off
kernel command-line, which ironically doesn't turn off ASPM),
the SSD device appears to FLR just fine and I'm still able to use it
on the Linux host afterwards.

And what's even better, the same pcie-aspm=off kernel command works in
XEN env too.
The FreeBSD12 domU is now able to access the SSD without issue now!

Thanks,
G.R.

>
> [1] https://patchwork.kernel.org/project/linux-pci/patch/20220408153159.106741-1-kai.heng.feng@canonical.com/
> [2] https://patchwork.kernel.org/project/linux-pci/patch/20220127025418.1989642-1-kai.heng.feng@canonical.com/#24713767
>

