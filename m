Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C4FF9788102
	for <lists+xen-devel@lfdr.de>; Fri, 25 Aug 2023 09:39:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.590524.922830 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qZROO-00028r-Bs; Fri, 25 Aug 2023 07:38:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 590524.922830; Fri, 25 Aug 2023 07:38:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qZROO-00026c-9A; Fri, 25 Aug 2023 07:38:04 +0000
Received: by outflank-mailman (input) for mailman id 590524;
 Fri, 25 Aug 2023 07:38:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=czQt=EK=linaro.org=erik.schilling@srs-se1.protection.inumbo.net>)
 id 1qZROL-00026U-Vt
 for xen-devel@lists.xenproject.org; Fri, 25 Aug 2023 07:38:02 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 50b9b7c8-431a-11ee-8783-cb3800f73035;
 Fri, 25 Aug 2023 09:37:59 +0200 (CEST)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-9a2185bd83cso71839566b.0
 for <xen-devel@lists.xenproject.org>; Fri, 25 Aug 2023 00:37:59 -0700 (PDT)
Received: from localhost (i5C7438EA.versanet.de. [92.116.56.234])
 by smtp.gmail.com with ESMTPSA id
 jj27-20020a170907985b00b0099d9dee8108sm655385ejc.149.2023.08.25.00.37.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Aug 2023 00:37:58 -0700 (PDT)
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
X-Inumbo-ID: 50b9b7c8-431a-11ee-8783-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692949079; x=1693553879;
        h=in-reply-to:references:subject:from:to:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TKDVF1m3NAPORZWmYzMpTAG7O89pEDvkhw2Bpci3Vlc=;
        b=EjoWw1hkAMuI7ibDbrDZNk3D/39aqVJgZcrV2+UpHz82wDzmuackS2Vb2Zjmpxcfxo
         0p+U1hGibOpsO5rZzSajQ5u+ldC0xzgXxsHn3cAFSKMewSHof7KwHjRcwjl70Db/bZnX
         Eu+9oWGNRhmOkW8kYmWE7uNE2jSryrSyLM7OIkmPq4h/+BGmM+SEIpsij8/45cuNsODd
         gu0+rwD3ryjuSaTicA4BEOlrLaY9/Jk59DvmGsh0Old7lVBhsmNEtfS/exEF5nQ3JKxF
         3UfOHYCsi2IZdV4DzOcOrMRcL8tg9Qsqvnm6HXk0bB7WQrOMifGrJ6s+ZxM7H/507Hlz
         IY7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692949079; x=1693553879;
        h=in-reply-to:references:subject:from:to:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=TKDVF1m3NAPORZWmYzMpTAG7O89pEDvkhw2Bpci3Vlc=;
        b=ajnPXBua3ulxuEfIa/g28N0i31zNtgpmjd/yNzEFdNyk26TKsS1ymMkTJXPw4EoLYI
         KGNPKTPqGcQWzKNhh84bvjZiMLupu5r9W4ZRDxa7WkI60oXaPr1MtB6uJt/1t6nkdfCd
         ryhCR7BDMa3RuZtQmfye90rS+4NYZhLcv8y6eJtYGeXx2EkRoD8uztincNsVvGeZdlPo
         whDpaj0kIdnLuA4MXFGrk5+QjEQ5Gb/zFJ1FtgT48TllxJSwFzutjfOe8qC83R2KoVTP
         EwkF7A+xpiXnQAT9cRAVZXZrNigoHrm+sJSxP2oqwHKeeWiqG9otdOa9oFQILtM1ss7K
         Z/pw==
X-Gm-Message-State: AOJu0YzilZl5ETjzNiltW+3EFqevmijG9JYR6tyvZf5egbuqDFlJwsXS
	W97AxsdUJOmBLM567+cRbpMcVQ==
X-Google-Smtp-Source: AGHT+IGNuXIyRLSEY2I0HzMyfTwqtarpSo1VjdCpi+ThEh5g0yeDRxfJjqPSRAncnEnBPFnoxwGuPQ==
X-Received: by 2002:a17:907:78c8:b0:9a1:e994:3440 with SMTP id kv8-20020a17090778c800b009a1e9943440mr5020249ejc.4.1692949079310;
        Fri, 25 Aug 2023 00:37:59 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 25 Aug 2023 09:37:58 +0200
Message-Id: <CV1GD1WJK30G.354V5FQOQJ1K7@fedora>
Cc: <xen-devel@lists.xenproject.org>, "Wei Liu" <wl@xen.org>, "Anthony
 PERARD" <anthony.perard@citrix.com>, "Mikko Rapeli"
 <mikko.rapeli@linaro.org>
To: "Leo Yan" <leo.yan@linaro.org>
From: "Erik Schilling" <erik.schilling@linaro.org>
Subject: Re: [PATCH v1] tools/hotplug: systemd: Make dependency on Xen
 device nodes
X-Mailer: aerc 0.15.2
References: <20230825033616.3402812-1-leo.yan@linaro.org>
 <CV1D227LZPCW.2ELMBHY8LE53X@fedora>
 <20230825063640.GA228998@leoy-huanghe.lan>
In-Reply-To: <20230825063640.GA228998@leoy-huanghe.lan>

On Fri Aug 25, 2023 at 8:36 AM CEST, Leo Yan wrote:
> On Fri, Aug 25, 2023 at 07:02:33AM +0200, Erik Schilling wrote:
> > On Fri Aug 25, 2023 at 5:36 AM CEST, Leo Yan wrote:
> > > When system booting up, the kernel module xen_gntdev.ko is loaded and
> > > the device node '/dev/xen/gntdev' is created; later the xenstored
> > > service in systemd launches daemon to open this device node.
> > >
> > > This flow has a race condition between creating the device node in th=
e
> > > kernel module and using the device node in the systemd service.  It's
> > > possible that the xenstored service fails to open the device node due
> > > to the delay of creating the device node.  In the end, xenbus cannot =
be
> > > used between the Dom0 kernel and the Xen hypervisor.
> > >
> > > To resolve this issue, we need to synchronize between udev and system=
d
> > > for the device node.  There have an extra change in the udev rules fo=
r
> > > tagging 'systemd' for Xen device nodes, which notifies device node
> > > creating to systemd; besides udev change, this patch adds dependency =
in
> > > systemd service for waiting the device node.
> > >
> > > Signed-off-by: Leo Yan <leo.yan@linaro.org>
> > > ---
> > >
> > >  The udev rules change is on github:
> > >  https://github.com/systemd/systemd/pull/28962/commits/520340dfea3b6c=
f9fe7a24c9238313b1a5fe8539
> >=20
> > Let's see what they think, but I fear systemd may not be the correct
> > upstream to carry this... Skimming through the rules that they have
> > there, it mostly looks like they only carry rules that are relevant for
> > systemd-related services directly.
>
> Yeah, I share the same concern.  But seems to me, upstreaming change
> to the systemd is the most neat fixing.
>
> > >  tools/hotplug/Linux/systemd/xenstored.service.in | 4 ++--
> > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/tools/hotplug/Linux/systemd/xenstored.service.in b/tools=
/hotplug/Linux/systemd/xenstored.service.in
> > > index 261077dc92..6e48cdb0e7 100644
> > > --- a/tools/hotplug/Linux/systemd/xenstored.service.in
> > > +++ b/tools/hotplug/Linux/systemd/xenstored.service.in
> > > @@ -1,7 +1,7 @@
> > >  [Unit]
> > >  Description=3DThe Xen xenstore
> > > -Requires=3Dproc-xen.mount
> > > -After=3Dproc-xen.mount
> > > +Requires=3Dproc-xen.mount dev-xen-gntdev.device
> > > +After=3Dproc-xen.mount dev-xen-gntdev.device
> >=20
> > I must admit that I am a bit confused why this is enough... During our
> > discussion on Slack, when you quoted from your rule it included
> > `ENV{SYSTEMD_WANTS}=3D"xenstored.service"`. Did you drop that during la=
ter
> > development? Was there additional reasearch involved in dropping it?
>
> Yes, I dropped ENV{SYSTEMD_WANTS}=3D"xenstored.service" and it works well
> at my side.

Hm. Interesting. Could you plot the activations after boot?

    systemd-analyze plot > /tmp/plot.svg

Seeing failure vs success but also the success cases on AVA vs Telechips
may be interesting.

I just did some tests on my workstation where I added dependencies on
a random USB device. If that one was not plugged at all, the service
still happily started. Yet, it obviously seems to do something in your
case... So I fear we may not fully understand the real problem yet.

I must admit that I find this case a bit under-documented. While "Wants"
explicitly says that failling transactions are ignored, there is no
clear statement about what happens in that case with "Requires".

While skimming the docs I also realized that maybe BindsTo=3D would maybe
be more suitable compared to Requires=3D here. But that is unrelated to
the confusion that I have about the original problem.

> My purpose is to upstream the udev rules in systemd as general as
> possible.  As you mentioned, the "xenstored.service" is maintained in Xen
> but not in systemd, for this reason, I would like avoid to add
> "xenstored.service" into udev rules in systemd.
>
> > My understanding was that if devices do not exist when systemd builds
> > its transaction model, dependencies on them will just get tossed out[1]=
.
> > So I would have expected that there should still be a race if
> > the .device does not pull in the service.
>
> Thanks for sharing.  To be honest, I don't know this part.  Doesn't
> systemd parse the service script and let service to wait for specific
> .device until systemd receives notification for the .device?
>
> > Did you hit the race frequently enough to be sure that this fixes it in
> > entirety?
>
> I have two boards.  One on board (Telechips), it's consistently
> reproduce this issue, and after applying the udev rules change and
> this patch, I confirmed the issue is dismissed entirely.
>
> > Is there a place somewhere in the Xen or kernel code where one
> > could add an excessive sleep in order to trigger the race more reliably=
?
>
> On my AVA board with running Xen, I tried to add a long delay (10
> seconds) in the kernel driver 'drivers/xen/gntdev.c', but I can see
> systemd will wait for the kernel modules loading, and then it launches
> Xen services.  Thus I cannot reproduce this issue on my AVA board.

Seeing the systemd-analyze plots would maybe help to understand the
differences here... Does one or the other maybe involve some initrd
stage that already creates devices?

Also: What was the original error that you saw? Was /dev/xen/gntdev
missing entirely? Or did interaction with it fail with some error code?

Can you reproduce the race while booting with systemd.log_level=3Ddebug
and export the full journal of the current boot?

    journalctl -b0 -o export > journal.txt


> So in below flow:
>
> - Step 1: drivers/xen/gntdev.c registers misc device;
> - Step 2: udev creates device node '/dev/xen/gntdev';
> - Step 3: systemd launches xenstored.service.
>
> Seems to me, the race condition happens between step 2 and step 3.  If
> there have any delay in udev for creating device node, then the step3
> for xenstored.service will fail.

Hm... If you see systemd waiting for the module, then Step 2 + 3 should
not be able to race. The service does not set DefaultDependencies=3Dno,
so xenstored.service should only run after sysinit.target is reached.
Since that target depends on the module loading, everything should - in
theory - work out.

- Erik

>
> Thanks for review.
>
> Leo
>
> > [1] "citation-needed": But I vaguely remember dealing with a similar
> >     issue and getting told this on #systemd IRC
> >=20
> > - Erik


