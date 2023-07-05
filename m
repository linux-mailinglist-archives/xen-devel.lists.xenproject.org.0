Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CC24748866
	for <lists+xen-devel@lfdr.de>; Wed,  5 Jul 2023 17:51:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.559404.874348 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qH4mj-0004zj-Kk; Wed, 05 Jul 2023 15:51:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 559404.874348; Wed, 05 Jul 2023 15:51:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qH4mj-0004xD-HS; Wed, 05 Jul 2023 15:51:17 +0000
Received: by outflank-mailman (input) for mailman id 559404;
 Wed, 05 Jul 2023 15:51:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=rv0Z=CX=tibco.com=gdunlap@srs-se1.protection.inumbo.net>)
 id 1qH4mi-0004x7-62
 for xen-devel@lists.xenproject.org; Wed, 05 Jul 2023 15:51:16 +0000
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [2a00:1450:4864:20::234])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c501f2c6-1b4b-11ee-8611-37d641c3527e;
 Wed, 05 Jul 2023 17:51:13 +0200 (CEST)
Received: by mail-lj1-x234.google.com with SMTP id
 38308e7fff4ca-2b63e5f94f1so11779221fa.1
 for <xen-devel@lists.xenproject.org>; Wed, 05 Jul 2023 08:51:13 -0700 (PDT)
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
X-Inumbo-ID: c501f2c6-1b4b-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1688572273; x=1691164273;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=z07d8C2904EI4u93qwFqu/++JzuP0a72uGQy8qj17lo=;
        b=EV3r1oOBOJjoz3f7pg8q+V3mgfpVQ533HX7PYI8xF8wDZ68Nm2P8BE8iJL8WgVSXJt
         4th3deOpGAKt9z2ErIPQ/zx0mleZEIt8YOnY5cg3ezI/2tVsCVLruXyfjaDl8WyZu50v
         WkCk3kZVW8LvkzpKUw4/hKXhOul4AYetfpnVY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688572273; x=1691164273;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=z07d8C2904EI4u93qwFqu/++JzuP0a72uGQy8qj17lo=;
        b=OprXo2qol6PSuRyNcrZKPgQwMB/zwobfgosPGauawBvreltwUJWhLktZTpHRSVCo7S
         q+JC9J//5mUk7589c0ZP88D1V7FE9sIxXdHmEiKpW8uO5uFPQn8sQWVEEcwvSheCfCHi
         RlMI/wP9VEEIgo4f+LIFY04+JQRe9biaxWXkaqWEYUEt/rvDD74TmRp/BHvWMkzq0X3C
         pioZAk2kUtaFQ5XlfKJ8xITeMjcWjGRgHnQaVZc94G9vfQmx0opD1SHTCzZO4ROaYvR1
         FIzYBBvGOdpEQK1MxSRRHxh/TE9mF757v7Vg6dM5vzjG7xhdfZ7r1Um/9/KHi5jSMEf1
         bJTA==
X-Gm-Message-State: ABy/qLa1FjKkL+6UWlHHQByecgd5VxQPaHdfwGRah8T/YFV3u94if+TK
	x4NuHSz+dWxhJYM3csRzViEol0hVXTOANtvElQu3azfiyVAuzZgB+oH73g==
X-Google-Smtp-Source: APBJJlHeGykRTp7ezA0Ph4ch8J8R1riDQiPvSzfGNlvnCvWHX4JdGe/D37+nNp31BVBfZWEZgBCbvd/LuKtXtAqfbDI=
X-Received: by 2002:a2e:a490:0:b0:2b6:b943:4361 with SMTP id
 h16-20020a2ea490000000b002b6b9434361mr1020355lji.22.1688572272874; Wed, 05
 Jul 2023 08:51:12 -0700 (PDT)
MIME-Version: 1.0
From: George Dunlap <george.dunlap@cloud.com>
Date: Wed, 5 Jul 2023 16:51:02 +0100
Message-ID: <CA+zSX=Y4MwsDSd9oSG1NQyt==YAw9SeRdh=eJxTUhhOx57ihWg@mail.gmail.com>
Subject: Detecting whether dom0 is in a VM
To: Xen-devel <xen-devel@lists.xenproject.org>
Content-Type: multipart/alternative; boundary="00000000000081030f05ffbf5ecb"

--00000000000081030f05ffbf5ecb
Content-Type: text/plain; charset="UTF-8"

Hey all,

The following systemd issue was brought to my attention:

https://github.com/systemd/systemd/issues/28113

I think basically, they want `systemd-detect-virt` return the following
values:

Xen on hardware, from a dom0:  `none`
Xen on hardware, from a domU: `xen`
Xen in a VM, from a dom0: (ideally the virtualization type, or `vm-other`
if not)
Xen in a VM, from a domU: `xen`

Is there a reliable set of tests which would work across all dom0 guest
types / architectures?  If not, can we expose the information somehow?

 -George

--00000000000081030f05ffbf5ecb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hey all,<br><br>The following systemd issue was brought to=
 my attention:<br><br><a href=3D"https://github.com/systemd/systemd/issues/=
28113">https://github.com/systemd/systemd/issues/28113</a><br><br>I think b=
asically, they want `systemd-detect-virt` return the following values:<div>=
<br></div><div>Xen on hardware, from a dom0:=C2=A0 `none`</div><div>Xen on =
hardware, from a domU: `xen`</div><div>Xen in a VM, from a dom0: (ideally t=
he virtualization type, or `vm-other` if not)</div><div>Xen in a VM, from a=
 domU: `xen`</div><div><br></div><div>Is there a reliable set of tests whic=
h would work across all dom0 guest types / architectures?=C2=A0 If not, can=
 we expose the information somehow?</div><div><br></div><div>=C2=A0-George<=
/div></div>

--00000000000081030f05ffbf5ecb--

