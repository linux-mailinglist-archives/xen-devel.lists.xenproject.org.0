Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 232FF6E5C42
	for <lists+xen-devel@lfdr.de>; Tue, 18 Apr 2023 10:37:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.522634.812124 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pogq5-0001DN-Cp; Tue, 18 Apr 2023 08:37:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 522634.812124; Tue, 18 Apr 2023 08:37:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pogq5-0001Ax-8t; Tue, 18 Apr 2023 08:37:25 +0000
Received: by outflank-mailman (input) for mailman id 522634;
 Tue, 18 Apr 2023 08:37:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Bo8Z=AJ=gmail.com=oleshiiwood@srs-se1.protection.inumbo.net>)
 id 1pogq3-0001An-V0
 for xen-devel@lists.xen.org; Tue, 18 Apr 2023 08:37:23 +0000
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [2607:f8b0:4864:20::1029])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3bee4f77-ddc4-11ed-8611-37d641c3527e;
 Tue, 18 Apr 2023 10:37:21 +0200 (CEST)
Received: by mail-pj1-x1029.google.com with SMTP id
 98e67ed59e1d1-246f856d751so1190988a91.0
 for <xen-devel@lists.xen.org>; Tue, 18 Apr 2023 01:37:21 -0700 (PDT)
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
X-Inumbo-ID: 3bee4f77-ddc4-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681807040; x=1684399040;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=yRPrXtmzxxhm9JhqjWU6Zz+KRFX0fxE7jKn9cCkTvrs=;
        b=juIKaEjC+NUpKkXZExMjgHs/lwMxg05ktmRPu62knYKgo0YjoAZ13NE94eqPWOLiFd
         xaY6rMfpZsRjt/pILupd1qnbUl01XmtxHXnJZL8/sn8pIcuYKLw0J2FTqSyFrHaj6jcW
         fTews0T8IZWUxTQpPk01lPOlodl0Te5us1hy415SPnPW9LlgF8jjqhDEUwiaMKP5jK9G
         Lpo5rOOCE6XdRy2UGV9Uwpp7gE24qLvLrtc4c7ZuRNd93Wh2ryIC621rj+CZE2v/frMZ
         87vOlNkoEzDBVxzVJ+XWlnmc5gK0fJO02rtAxxA6gX7CHiZA8ahtHkW4eHmKFZyfF/EO
         FGAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681807040; x=1684399040;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yRPrXtmzxxhm9JhqjWU6Zz+KRFX0fxE7jKn9cCkTvrs=;
        b=adeg0DMsAYSeRCJtETCLYSsxmhXPSueCd+nHffEpP59nSv8MEC6weS63PQC5yEgEFS
         r9nYuzn4V8Vs9HFv7HdMw+qeA1RJ3hboF7mRXY2VnObvPKIwzMCfa8OCmOkmEr4pxXkN
         +vAYzJAfAgM5NqM6TWiH+8KHRGixrVkrFYd/VwXdfYO2ntglqM1jJ2VnUB0nki8b/p87
         vgIjFp5k6a8YB0BMgIxYb/JhwMGCplwH0QBT6ULrW/DyLTXxM6tJOJ0JmgBYLvx3eTew
         ZWyKBuFtKOWn9x+OD9p/cimqFl3SmrUIo6ya9fqBX9z+JO2OcJzXTSq2qje5bUV6PWZa
         CVGw==
X-Gm-Message-State: AAQBX9cRueSULq4Flwm/c5DsgsOzBZOv3dvUTApIPLtIGWWQPCECh1Rk
	Hr8/atPKvezwStl+mSXWdRRROucWQXLWx4tau2tL7fn34yTVGg==
X-Google-Smtp-Source: AKy350aDhwRAL7m8rjqZTn6EfJK8v60x7ZEwTGZpHPOCbIA20opLbRCaSlPkCrbVTr8khRZRs8jE4bMYkt/RVzCeck4=
X-Received: by 2002:a17:90a:fd87:b0:23e:f8e2:9ed3 with SMTP id
 cx7-20020a17090afd8700b0023ef8e29ed3mr1282535pjb.43.1681807039731; Tue, 18
 Apr 2023 01:37:19 -0700 (PDT)
MIME-Version: 1.0
From: Oleg Nikitenko <oleshiiwood@gmail.com>
Date: Tue, 18 Apr 2023 11:43:23 +0300
Message-ID: <CA+SAi2uwrKFYN1tkYJ1_LVC-f+b-xb46RWTUv6wDOUO41yx8zg@mail.gmail.com>
Subject: xen cache colors in ARM
To: xen-devel@lists.xen.org
Content-Type: multipart/alternative; boundary="0000000000002f1b4805f9983792"

--0000000000002f1b4805f9983792
Content-Type: text/plain; charset="UTF-8"

Hello,

I tried to turn on this scheme and ran into panic.
Where was I wrong ?

Xen command line
xen,xen-bootargs = "console=dtuart dtuart=serial0 dom0_mem=1600M
dom0_max_vcpus=2 dom0_vcpus_pin bootscrub=0 vwfi=native sched=null
timer_slop=0 way_szize=65536 xen_colors=0-3 dom0_colors=4-7";

Xen config color build settings
CONFIG_COLORING=y

Xen log:
(XEN) I/O virtualisation enabled
(XEN)  - Dom0 mode: Relaxed
(XEN) P2M: 40-bit IPA with 40-bit PA and 8-bit VMID
(XEN) P2M: 3 levels with order-1 root, VTCR 0x0000000080023558
(XEN) Scheduling granularity: cpu, 1 CPU per sched-resource
(XEN) Coloring general information
(XEN) Way size: 64kB
(XEN) Max. number of colors available: 16
(XEN) Xen color(s): [ 0 ]
(XEN) alternatives: Patching with alt table 00000000002cc690 ->
00000000002ccc0c
(XEN) Color array allocation failed for dom0
(XEN)
(XEN) ****************************************
(XEN) Panic on CPU 0:
(XEN) Error creating domain 0
(XEN) ****************************************
(XEN)
(XEN) Reboot in five seconds...

Regards,
Oleg

--0000000000002f1b4805f9983792
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hello,</div><div><br></div><div>I tried to turn on th=
is scheme and ran into panic.</div><div>Where was I wrong ?</div><div><br><=
/div>Xen command line<br><div>xen,xen-bootargs =3D &quot;console=3Ddtuart d=
tuart=3Dserial0 dom0_mem=3D1600M dom0_max_vcpus=3D2 dom0_vcpus_pin bootscru=
b=3D0 vwfi=3Dnative sched=3Dnull timer_slop=3D0 way_szize=3D65536 xen_color=
s=3D0-3 dom0_colors=3D4-7&quot;;</div><div><br></div><div>Xen config color =
build settings</div><div>CONFIG_COLORING=3Dy</div><div><br></div><div>Xen l=
og:</div><div>(XEN) I/O virtualisation enabled<br>(XEN) =C2=A0- Dom0 mode: =
Relaxed<br>(XEN) P2M: 40-bit IPA with 40-bit PA and 8-bit VMID<br>(XEN) P2M=
: 3 levels with order-1 root, VTCR 0x0000000080023558<br>(XEN) Scheduling g=
ranularity: cpu, 1 CPU per sched-resource<br>(XEN) Coloring general informa=
tion<br>(XEN) Way size: 64kB<br>(XEN) Max. number of colors available: 16<b=
r>(XEN) Xen color(s):	[ 0 ]<br>(XEN) alternatives: Patching with alt table =
00000000002cc690 -&gt; 00000000002ccc0c<br>(XEN) Color array allocation fai=
led for dom0<br>(XEN) <br>(XEN) ****************************************<br=
>(XEN) Panic on CPU 0:<br>(XEN) Error creating domain 0<br>(XEN) **********=
******************************<br>(XEN) <br>(XEN) Reboot in five seconds...=
</div><div><br></div><div>Regards,</div><div>Oleg<br></div></div>

--0000000000002f1b4805f9983792--

