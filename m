Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AD812A50E8F
	for <lists+xen-devel@lfdr.de>; Wed,  5 Mar 2025 23:26:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.902775.1310780 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpxBc-0002kR-Gc; Wed, 05 Mar 2025 22:25:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 902775.1310780; Wed, 05 Mar 2025 22:25:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpxBc-0002iX-Dm; Wed, 05 Mar 2025 22:25:56 +0000
Received: by outflank-mailman (input) for mailman id 902775;
 Wed, 05 Mar 2025 22:06:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ysEN=VY=malwation.com=kagan.isildak@srs-se1.protection.inumbo.net>)
 id 1tpwsb-0006ro-0N
 for xen-devel@lists.xenproject.org; Wed, 05 Mar 2025 22:06:17 +0000
Received: from mail-oo1-xc2e.google.com (mail-oo1-xc2e.google.com
 [2607:f8b0:4864:20::c2e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 067c57de-fa0e-11ef-9898-31a8f345e629;
 Wed, 05 Mar 2025 23:06:02 +0100 (CET)
Received: by mail-oo1-xc2e.google.com with SMTP id
 006d021491bc7-5fe86c16f5dso4063eaf.1
 for <xen-devel@lists.xenproject.org>; Wed, 05 Mar 2025 14:06:02 -0800 (PST)
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
X-Inumbo-ID: 067c57de-fa0e-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=malwation.com; s=google; t=1741212361; x=1741817161; darn=lists.xenproject.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=M5hCnZbYP5dUn03pFzViTItIx1J8XbSrIgN3JhUNevA=;
        b=iIdW+Sty/dizZlZ7NQSNMzmjH6GSBP7Lt4RxzgkEXYgzcvSbtGfbl2qx+6UHRwMc6G
         tLxSHBWqn9zoVch3ogVv64cT6IPk4aqOPzOUUyC+dcZ4qZSjt1ocKH0lG7qXBgHDZRHB
         FtmjSyxR8LRe3Rbd2ufh5jeQiU5m4N1bm6Dh3O0MUupRkeyqunzkQBl/1oRv+w/UK9A5
         n5D7S58X5PsCUY5NYL/tjkmPbEDuMmh4+0FIh5H/xKWZhby0YzkvJL2mJhr9NmtxhVOg
         HKOLh4SssjN2GRntkMlKSHgPS49I8f4obe2IOf24kIYfgIstV/ics/zcKGjcsAODzZhc
         1I4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741212361; x=1741817161;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=M5hCnZbYP5dUn03pFzViTItIx1J8XbSrIgN3JhUNevA=;
        b=QrTbZkBxQj1GbXqxO0XvtNFO/Gx6lDh96dCdc36IYYTQ6JgnYl2Q9jlfuXI5HCSgw9
         9m7sTzwJksIcpBh59TSCEmvjwuXqHt47TV8tmVCMvT/Fe5k35RGJ0gAZ88zxWlSLmjjy
         LEaNFfcC8taXsQPemcvy87m8yolT9XGczTdMDsVyeIfGuErW7SgykILEH9TCMrdJ2bGt
         oCftUVY4BKSYPDuIENrB1q2DkdPIXwVjJqOp2meAO05lTjG7JEi/kHcPABmjPId+djgl
         3WIoP2KOSdAPNqgBaCS0WvS7bJFxO4cji/VFJfzdx+tkI0tTSpsXrBtLhdt487B/wPtW
         u6HQ==
X-Gm-Message-State: AOJu0YwHeg/01/lP/0rlA1dapjrrd3GhZtNBqeEKXIClLDhlZEHurb8b
	+iTTzQ0M9sQB4SwATRJO5yq7+6RA3VfNDLt0/E8oUJSX6A0JL0uyUJLWSyfImhBUdLadPDOQezA
	yjEgnT0i/9P6mx9BE0aPs3k0GUm/kfGr/ArGo62kjOx8CmAYCbYul95Gp
X-Gm-Gg: ASbGncu9J+K72TLC+iGuHKkpbeCTG9m03OsVOqW2TEaehVQ12teRFGamektDt5xNDB+
	fQ6oX3y8hwVP/jXEHh7XYKFGVvL28vjt1ccDzaXJnAVY3WiVHekczwrfgdGvowx/YMvx91eej18
	mFHpSuDXRaT+8W75zP7hWCyps=
X-Google-Smtp-Source: AGHT+IGRowsngn07NCsyZTcdbLfd6yMbnpb4znYTPW3Ym2gzPIIXMCq7jw26S3Qm2pxKTjGP6N9eaN2983BBxLZc6KI=
X-Received: by 2002:a05:6870:2192:b0:29e:76c8:be2e with SMTP id
 586e51a60fabf-2c21cd20179mr2887455fac.28.1741212361101; Wed, 05 Mar 2025
 14:06:01 -0800 (PST)
MIME-Version: 1.0
From: =?UTF-8?B?S0HEnkFOIEnFnklMREFL?= <kagan.isildak@malwation.com>
Date: Thu, 6 Mar 2025 01:05:50 +0300
X-Gm-Features: AQ5f1Jp0BZUIcsEM4ZJvNyQLKtAMwqyfxXDv55iUDWhh-tF4-ayiR9SrZrlpCaA
Message-ID: <CABDHFN7uk0JdehT3R0f_PvRgT-thdNyywppekmjLWfSq13dNKQ@mail.gmail.com>
Subject: BUG - running new version on nested virtualization
To: xen-devel@lists.xenproject.org, xen-users@lists.xenproject.org
Content-Type: multipart/alternative; boundary="00000000000043304c062f9f986d"

--00000000000043304c062f9f986d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hey there

I'm facing weird issue. At my lab env. i'm building xen 4.18 and make deb
package than i use it on virtual machine which running on esxi with CPU
features for nested virtualization and there's no problem. (I can create vm
and able to do all operational things etc.)

Last week i tried to migrate 4.19 and 4.20 but Xen get stuck on booting and
at debug log i just see error about mounting /proc/xen (mount: /proc/xen:
mount point does not exist.) I've no f... idea why it caused. (At my all
tries, i used fresh install of ubuntu server 22.04, 24.04)

Is there any one faced issue and is there special things to do in build
phase for nested virtualization? (I didn't change anything while building
4.18, i'm just using stable branch)

Regards
Ka=C4=9Fan

--00000000000043304c062f9f986d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D""><font face=3D"mono=
space">Hey there</font></div><div class=3D"gmail_default" style=3D""><font =
face=3D"monospace"><br></font></div><div class=3D"gmail_default" style=3D""=
><font face=3D"monospace">I&#39;m facing weird issue. At my lab env. i&#39;=
m building xen 4.18 and make deb package than i use it on virtual machine w=
hich running on esxi with CPU features for nested virtualization and there&=
#39;s no problem. (I can create vm and able to do all operational things et=
c.)</font></div><div class=3D"gmail_default" style=3D""><font face=3D"monos=
pace"><br></font></div><div class=3D"gmail_default" style=3D""><font face=
=3D"monospace">Last week i tried to migrate 4.19 and 4.20 but Xen get stuck=
 on booting and at debug log i just see error about mounting /proc/xen (mou=
nt: /proc/xen: mount point does not exist.) I&#39;ve no f... idea why it ca=
used. (At my all tries, i used fresh install of ubuntu server 22.04, 24.04)=
</font></div><div class=3D"gmail_default" style=3D""><font face=3D"monospac=
e"><br></font></div><div class=3D"gmail_default" style=3D""><font face=3D"m=
onospace">Is there any one faced issue and is there special things to do in=
 build phase for nested virtualization? (I didn&#39;t change anything while=
 building 4.18, i&#39;m just using stable branch)=C2=A0</font></div><div cl=
ass=3D"gmail_default" style=3D""><font face=3D"monospace"><br></font></div>=
<div class=3D"gmail_default" style=3D""><font face=3D"monospace">Regards</f=
ont></div><div class=3D"gmail_default" style=3D""><font face=3D"monospace">=
Ka=C4=9Fan</font></div><br></div>

--00000000000043304c062f9f986d--

