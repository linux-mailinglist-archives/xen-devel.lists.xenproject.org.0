Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 85F4156A70D
	for <lists+xen-devel@lfdr.de>; Thu,  7 Jul 2022 17:36:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.363065.593402 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o9TYa-0007R8-I6; Thu, 07 Jul 2022 15:36:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 363065.593402; Thu, 07 Jul 2022 15:36:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o9TYa-0007OT-EB; Thu, 07 Jul 2022 15:36:44 +0000
Received: by outflank-mailman (input) for mailman id 363065;
 Thu, 07 Jul 2022 15:36:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AtSF=XM=gmail.com=firemeteor.guo@srs-se1.protection.inumbo.net>)
 id 1o9TYY-0006sY-Bu
 for xen-devel@lists.xen.org; Thu, 07 Jul 2022 15:36:42 +0000
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com
 [209.85.218.44]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 990e0413-fe0a-11ec-bd2d-47488cf2e6aa;
 Thu, 07 Jul 2022 17:36:41 +0200 (CEST)
Received: by mail-ej1-f44.google.com with SMTP id r21so4303408eju.0
 for <xen-devel@lists.xen.org>; Thu, 07 Jul 2022 08:36:41 -0700 (PDT)
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
X-Inumbo-ID: 990e0413-fe0a-11ec-bd2d-47488cf2e6aa
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=k9zvRBTAarQDBW+yV0xbSQ9HXjuCg1/YQ0xUJVgLye8=;
        b=C8EQ/2k6WaordlwWa8Vhquhi6QIIsUWRqmUXwVYlDI2t/hLii7/5/8rmKuASSrpZ3g
         Yc7T5tB8FI9+GR0PKfopz5bD9meT567b4B/R2Wr6VsJcDzW/Li9uOQslflhwNYJmZUlM
         sVR30UOEESh09S/FNU2KlcMs3zbMKa4Hg95KWVoIe5Bov5CzilGKZjsNjOyXbn5cDjiM
         VrkZtO2cFXp60idCzOs8tMEbiJrMbofxrYbYrZuTQEGV1RzvJJWZ7+2IBvrYgFwE0hcA
         yUGQ/e4Hcb1AZUBZsowtzOXwAHLAK2KMzkzqtI0T5J2KGwsEOu5eA+ly4DHifTocNvva
         0Nqg==
X-Gm-Message-State: AJIora/5AUjr8RhIQdbF3WRIcmmi/qLKDga5MyTyNqcyuKADdXsRZHas
	ZXgtdJtmrE5RDXKczkS6otlzScvy7FPRfIlQBrU=
X-Google-Smtp-Source: AGRyM1t69BBXuQvouWBuAE+8agGyOBw6h/nlwjgXF1lmuCaBsDWVQCAge3WAmb9wo0oEzVPHPxk1fEZDtawbMkQr7xY=
X-Received: by 2002:a17:906:9b8a:b0:722:e50e:2a6d with SMTP id
 dd10-20020a1709069b8a00b00722e50e2a6dmr46464711ejc.724.1657208200872; Thu, 07
 Jul 2022 08:36:40 -0700 (PDT)
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
In-Reply-To: <CAKhsbWZoeZeyysF+1O9xGvrVBrApHrSbk+GJavHUEHim5hudrA@mail.gmail.com>
From: "G.R." <firemeteor@users.sourceforge.net>
Date: Thu, 7 Jul 2022 23:36:28 +0800
Message-ID: <CAKhsbWaeniirR5ZiOn_ixa51Z_HrfiAQ3mUpevykxTjo+o8G-g@mail.gmail.com>
Subject: Re: PCI pass-through problem for SN570 NVME SSD
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel <xen-devel@lists.xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, Jul 7, 2022 at 11:24 PM G.R. <firemeteor@users.sourceforge.net> wrote:
>
> On Wed, Jul 6, 2022 at 2:33 PM Jan Beulich <jbeulich@suse.com> wrote:
> >
> > > Should I expect a debug build of XEN hypervisor to give better
> > > diagnose messages, without the debug patch that Roger mentioned?
> >
> > Well, "expect" is perhaps too much to say, but with problems like
> > yours (and even more so with multiple ones) using a debug
> > hypervisor (or kernel, if there such a build mode existed) is imo
> > always a good idea. As is using as up-to-date a version as
> > possible.
>
> I built both 4.14.3 debug version and 4.16.1 release version for
> testing purposes.
> Unfortunately they gave me absolutely zero information, since both of
> them are not able to get through issue #1
> the FlR related DPC / AER issue.
> With 4.16.1 release, it actually can survive the 'xl
> pci-assignable-add' which triggers the first AER failure.
> But the 'xl pci-assignable-remove' will lead to xl segmentation fault...
> >[  655.041442] xl[975]: segfault at 0 ip 00007f2cccdaf71f sp 00007ffd73a3d4d0 error 4 in libxenlight.so.4.16.0[7f2cccd92000+7c000]
> >[  655.041460] Code: 61 06 00 eb 13 66 0f 1f 44 00 00 83 c3 01 39 5c 24 2c 0f 86 1b 01 00 00 48 8b 34 24 89 d8 4d 89 f9 4d 89 f0 4c 89 e9 4c 89 e2 <48> 8b 3c c6 31 c0 48 89 ee e8 53 44 fe ff 83 f8 04 75 ce 48 8b 44
> Since I'll need a couple of pci-assignable-add &&
> pci-assignable-remove to get to a seemingly normal state, I cannot
> proceed from here.
>
> With 4.14.3 debug build, the hypervisor / dom0 reboots on 'xl
> pci-assignable-add'.
>
> [  574.623143] pciback 0000:05:00.0: xen_pciback: resetting (FLR, D3,
> etc) the device
> [  574.623203] pcieport 0000:00:1d.0: DPC: containment event,
> status:0x1f11 source:0x0000
> [  574.623204] pcieport 0000:00:1d.0: DPC: unmasked uncorrectable error detected
> [  574.623209] pcieport 0000:00:1d.0: PCIe Bus Error:
> severity=Uncorrected (Non-Fatal), type=Transaction Layer, (Receiver
> ID)
> [  574.623240] pcieport 0000:00:1d.0:   device [8086:a330] error
> status/mask=00200000/00010000
> [  574.623261] pcieport 0000:00:1d.0:    [21] ACSViol                (First)
> [  575.855026] pciback 0000:05:00.0: not ready 1023ms after FLR; waiting
> [  576.895015] pciback 0000:05:00.0: not ready 2047ms after FLR; waiting
> [  579.028311] pciback 0000:05:00.0: not ready 4095ms after FLR; waiting
> [  583.294910] pciback 0000:05:00.0: not ready 8191ms after FLR; waiting
> [  591.614965] pciback 0000:05:00.0: not ready 16383ms after FLR; waiting
> [  609.534502] pciback 0000:05:00.0: not ready 32767ms after FLR; waiting
> [  643.667069] pciback 0000:05:00.0: not ready 65535ms after FLR; giving up
> //<=======The reboot happens somewhere here, not immediately, but
> after a while...
> //Maybe I can get something from xl dmesg if I was quick enough and
> have connected from a second terminal...

Unfortunately I didn't see anything from xl dmesg...
I wish the 'xl dmesg' can support the follow mode (dmesg -w) that the
Linux dmesg does.
Here I have to manually repeat this command. The machine suddenly
freezes after the 'giving up' message is out.
I see nothing special in the log. Maybe I'm just not lucky enough to
catch the output, not sure.

