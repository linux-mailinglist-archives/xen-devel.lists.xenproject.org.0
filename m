Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A571C600AA5
	for <lists+xen-devel@lfdr.de>; Mon, 17 Oct 2022 11:27:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.424250.671546 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1okMPF-0007sQ-Jq; Mon, 17 Oct 2022 09:27:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 424250.671546; Mon, 17 Oct 2022 09:27:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1okMPF-0007qN-Gz; Mon, 17 Oct 2022 09:27:33 +0000
Received: by outflank-mailman (input) for mailman id 424250;
 Mon, 17 Oct 2022 09:27:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=O24q=2S=gmail.com=vsuneja63@srs-se1.protection.inumbo.net>)
 id 1okMPE-0007nU-Cl
 for xen-devel@lists.xenproject.org; Mon, 17 Oct 2022 09:27:32 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ecc49422-4dfd-11ed-8fd0-01056ac49cbb;
 Mon, 17 Oct 2022 11:27:31 +0200 (CEST)
Received: by mail-ej1-x62d.google.com with SMTP id k2so23508799ejr.2
 for <xen-devel@lists.xenproject.org>; Mon, 17 Oct 2022 02:27:31 -0700 (PDT)
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
X-Inumbo-ID: ecc49422-4dfd-11ed-8fd0-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=NRvAeIU2zHo3eaeWipFFyokuAQvh8SGGjYzCxFApbaQ=;
        b=cgi4Dsf9tAzbRx9Rr4K/AP4Rb/RfdZfx78qcZOjDVSlKZcROm/EyialG3nGiyvOzio
         wmc2WLhYYJ3lcXKBhpF+xpQ0TBfD+qEDg7SIxr2jvKqGk1We65+rHScWavglqEKOs2DN
         c8f4nnAioXvO0G0xGvfVd8ReYeUH3f0c04YbIqmehDPrfbLTo4IlhtGwvFb8B2PCuUYM
         l/0v4MKUHRivJkNDVm5cZSgiPTroQLJus5MEBOvtG248t+n4eVx6BqoO9kHNvhjN9Jbj
         OnZ7rrZj+EQYNeGxMW0STPpntnzClRfcwYLROQVe+a28U48jvOH12GdzC2Yy5zBCJkJD
         pZ0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NRvAeIU2zHo3eaeWipFFyokuAQvh8SGGjYzCxFApbaQ=;
        b=vrp/utqhnzpTH71L17V9OS//+AyRFDryZtQrUl4124b3JvxcGvbAIjowuriZuL/s3V
         +kzWfoZ6HGr1IqeyN4WL4Z/5iCbuNaH0i2VCZH/CFpKWWMIBnf5USy5uB8CF3+YoeCE3
         RVWBer/wkE6XtdiOpPSMdhF5K9P8puvoDO+THP1kI1Q6KCGUZM0mjRSMkEPM7EKPr/wo
         F8Tvgage7ne0LvXBXputRRF7YuqmLjvvAnpn/dAWIJjsxqSN0VKtojY9d6b4D9PYd6ED
         69123ZRd+yaYSkcg1JkbxY6FYJI2iDj3xemW49KTZx9eyOhygyU6C1ubAW5PfGPP67PF
         7/rg==
X-Gm-Message-State: ACrzQf0So4EiWZy6165JgKWMKl45ocwvSJ0g6ERPgNvt+h4i4MfLBosd
	NxcGYRyW00P+aPR7zdyi+N+SYBs9LmviCY/yRZiMLAkq0Ww=
X-Google-Smtp-Source: AMsMyM6ZIzD7KufpSpivJbHIdgYZ6/T4Kj7fYOexDxjKpJvFr10g4BM7IFOwuJ1pZb5LMkIWuSi5mH41xkTz0wRq8EI=
X-Received: by 2002:a17:906:dc89:b0:78d:5616:4c24 with SMTP id
 cs9-20020a170906dc8900b0078d56164c24mr7956357ejc.118.1665998850323; Mon, 17
 Oct 2022 02:27:30 -0700 (PDT)
MIME-Version: 1.0
From: Vipul Suneja <vsuneja63@gmail.com>
Date: Mon, 17 Oct 2022 14:57:18 +0530
Message-ID: <CALAP8f--jyG=ufJ9WGtL6qoeGdsykjNK85G3q50SzJm5+wOzhQ@mail.gmail.com>
Subject: Porting Xen in raspberry pi4B
To: xen-devel@lists.xenproject.org, 
	Stefano Stabellini <sstabellini@kernel.org>
Content-Type: multipart/alternative; boundary="000000000000ab78ab05eb379568"

--000000000000ab78ab05eb379568
Content-Type: text/plain; charset="UTF-8"

Hi,

Thanks!

I have ported xen minimal image as DOM0 & custom wayland GUI based image as
DOMU in raspberry pi4B. I am trying to make GUI display up for guest
machine. I tried using sdl, included below line in guest.conf file
*vfb= [ 'sdl=1' ]*

But it is throwing below error:










*root@raspberrypi4-64:~/guest1# xl create -c guest1.cfgParsing config from
guest1.cfglibxl: error: libxl_qmp.c:1400:qmp_ev_fd_callback: Domain 3:error
on QMP socket: Connection reset by peerlibxl: error:
libxl_qmp.c:1439:qmp_ev_fd_callback: Domain 3:Error happened with the QMP
connection to QEMUlibxl: error:
libxl_dm.c:3351:device_model_postconfig_done: Domain 3:Post DM startup
configs failed, rc=-26libxl: error:
libxl_create.c:1867:domcreate_devmodel_started: Domain 3:device model did
not start: -26libxl: error: libxl_aoutils.c:646:libxl__kill_xs_path: Device
Model already exitedlibxl: error: libxl_domain.c:1183:libxl__destroy_domid:
Domain 3:Non-existant domainlibxl: error:
libxl_domain.c:1137:domain_destroy_callback: Domain 3:Unable to destroy
guestlibxl: error: libxl_domain.c:1064:domain_destroy_cb: Domain
3:Destruction of domain failed*

Another way is VNC, i could install tigervnc in DOM0 but same i couldn't in
guest machine because it doesn't support x11(supports wayland only). I am
completely blocked here, Need your support to enable the display up.
Any alternative of VNC which could work in both x11 & wayland supported
images?

Any input on VNC, SDL or any other way to proceed on this? Looking forward
to hearing from you.

Regards,
Vipul Kumar

--000000000000ab78ab05eb379568
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<div><br></div><div>Thanks!</div><div><br></div><div>I =
have ported xen minimal image as DOM0 &amp; custom wayland GUI based image =
as DOMU in raspberry pi4B. I am trying to make GUI display up for=C2=A0gues=
t machine. I tried using=C2=A0sdl, included below line in guest.conf file</=
div><div><b><i>vfb=3D [ &#39;sdl=3D1&#39; ]</i></b></div><div><b><i><br></i=
></b></div><div>But it is throwing below error:</div><div><br></div><div><b=
><i>root@raspberrypi4-64:~/guest1# xl create -c guest1.cfg<br>Parsing confi=
g from guest1.cfg<br>libxl: error: libxl_qmp.c:1400:qmp_ev_fd_callback: Dom=
ain 3:error on QMP socket: Connection reset by peer<br>libxl: error: libxl_=
qmp.c:1439:qmp_ev_fd_callback: Domain 3:Error happened with the QMP connect=
ion to QEMU<br>libxl: error: libxl_dm.c:3351:device_model_postconfig_done: =
Domain 3:Post DM startup configs failed, rc=3D-26<br>libxl: error: libxl_cr=
eate.c:1867:domcreate_devmodel_started: Domain 3:device model did not start=
: -26<br>libxl: error: libxl_aoutils.c:646:libxl__kill_xs_path: Device Mode=
l already exited<br>libxl: error: libxl_domain.c:1183:libxl__destroy_domid:=
 Domain 3:Non-existant domain<br>libxl: error: libxl_domain.c:1137:domain_d=
estroy_callback: Domain 3:Unable to destroy guest<br>libxl: error: libxl_do=
main.c:1064:domain_destroy_cb: Domain 3:Destruction of domain failed</i></b=
><br></div><div><b><i><br></i></b></div><div>Another way is VNC, i could in=
stall tigervnc in DOM0 but same i couldn&#39;t in guest machine because it =
doesn&#39;t support x11(supports wayland only). I am completely blocked her=
e, Need your support to enable the display up.</div><div>Any alternative of=
 VNC which could work in both x11 &amp; wayland supported images?</div><div=
><br></div><div>Any input on VNC, SDL or any other way to proceed on this? =
Looking forward to hearing from you.</div><div><br></div><div>Regards,</div=
><div>Vipul Kumar</div></div>

--000000000000ab78ab05eb379568--

