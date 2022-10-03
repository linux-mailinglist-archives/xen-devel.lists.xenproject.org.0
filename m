Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BAFE35F280C
	for <lists+xen-devel@lfdr.de>; Mon,  3 Oct 2022 06:52:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.414755.659139 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ofDPi-0006Bo-Pm; Mon, 03 Oct 2022 04:50:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 414755.659139; Mon, 03 Oct 2022 04:50:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ofDPi-00069J-Ka; Mon, 03 Oct 2022 04:50:46 +0000
Received: by outflank-mailman (input) for mailman id 414755;
 Mon, 03 Oct 2022 04:47:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=F43x=2E=gmail.com=ksc2093@srs-se1.protection.inumbo.net>)
 id 1ofDMa-0005LV-5o
 for xen-devel@lists.xenproject.org; Mon, 03 Oct 2022 04:47:32 +0000
Received: from mail-ua1-x92c.google.com (mail-ua1-x92c.google.com
 [2607:f8b0:4864:20::92c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7ca5b4f9-42d6-11ed-964a-05401a9f4f97;
 Mon, 03 Oct 2022 06:47:30 +0200 (CEST)
Received: by mail-ua1-x92c.google.com with SMTP id h25so1188186uao.13
 for <xen-devel@lists.xenproject.org>; Sun, 02 Oct 2022 21:47:30 -0700 (PDT)
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
X-Inumbo-ID: 7ca5b4f9-42d6-11ed-964a-05401a9f4f97
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date;
        bh=0knQzcN1+igXN7erVVnZ8k1FnrHLXX3xSGYYoKdk4lw=;
        b=QJZXDQ4qwXjnkeb5YTraa2TGk22X357OOj4xVci3c1OPcsjLHGO8NNpb02qVdCneG3
         w65W7SUuH1XM5ppg6dYeROZS+avOk6QnHJmROSAaFlnzZUjaBtVJFPpduZ2OVRZnXzuB
         nyr4q/X7G3CDTC5UnzGr7kmBOxrFS1s20FNGPCCWPkAik5t+sjuVtJR9szH7h0+HjPgT
         Yn1OqNpRS0XRy37FdXLbgN1Ic613kKENZTYYi/gVmukyDsEA65Ro5IV6LPCsc847cVX0
         PAtFg7vnDzqkyZ12fG55rpwOWFS6YRisNOaIUuuoOFw811Ifa9LoOJ0rKV4A+C9y8GWY
         Yw1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date;
        bh=0knQzcN1+igXN7erVVnZ8k1FnrHLXX3xSGYYoKdk4lw=;
        b=fGCQKHy1YFsl7yqwcjGkTsgAOBq1dIivF/K9iHQww6qEOYPUKh39py+0F69TwvrsAa
         yBS2kguULJFOMybMBlsloeh4CqIcD5DZxtzn/84ncZptJ5hWx8OTDq0/IGNBqO0Zk9oA
         d3uiQyj3ynYEdjTaKL0k/5Xu7mfeKIK4ACvI28QSQ1kfk4rfYZgYws/A5ToCwsPdfiOC
         +uEXGqWMXV4QB1QZCKghsSNA/lqNBeOll+NZ/y0hulroWsLF6wKrwUWCEL8G4U5/SZ+J
         MMZQDk9SJ3+DsL9yae1GAzKLPITy2d4G+c6TH300gmBotkfP5dBPtwR97tUXPr+0lvBU
         PhSA==
X-Gm-Message-State: ACrzQf1NkisBRf6S6GBMp7vB6x4zQswgpcABxvi2PFcTrqBiWHAy9Xsd
	HckPtasJLHurYIk5kktFzuOcJTv7EFbXYfhenlacU1kRLPc=
X-Google-Smtp-Source: AMsMyM7+hIe7ovJPqPnODbSmknvFNzXJhAwbrJkk9W2mi3qEnkZc0THatsrBPn0IvubpAWx7swaLdBsB5+H+4TaDMBc=
X-Received: by 2002:ab0:5711:0:b0:3b5:13e0:23b4 with SMTP id
 s17-20020ab05711000000b003b513e023b4mr9117671uaa.101.1664772449269; Sun, 02
 Oct 2022 21:47:29 -0700 (PDT)
MIME-Version: 1.0
From: sarath chandu <ksc2093@gmail.com>
Date: Mon, 3 Oct 2022 10:17:18 +0530
Message-ID: <CAFWs62=ZPLF6RTQawKH=5ofEtBsXf-hmUq+TPEX=b2Uwj1P=0g@mail.gmail.com>
Subject: Re:Xen compatability and performance for imx8qm target with Andriod
 Auto as Guest Os
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, julien@xen.org
Content-Type: multipart/alternative; boundary="000000000000787bbf05ea1a0a87"

--000000000000787bbf05ea1a0a87
Content-Type: text/plain; charset="UTF-8"

*Hi Team,*
*I am trying to port xen hypervisor on i.MX8QM EVK. Planning to port
xen-image as DOM0,*
*Automotive Grade Linux as guest1 & Automotive Android as guest2.*
*Can you please guide me with the steps for porting android as a guest?*
*What are the drivers & packages that need to be included to achieve this?*
*Looking forward to hearing from you.*






*Regards,*

*Ksc.*

--000000000000787bbf05ea1a0a87
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><b>Hi Team,</b><br></div><div dir=3D"auto"><div style=
=3D"color:black;font-size:12pt;font-family:Calibri,Arial,Helvetica,sans-ser=
if"><div><b>I am trying to port xen hypervisor on i.MX8QM EVK. Planning to =
port xen-image as DOM0,</b></div>
<div><b>Automotive Grade Linux as guest1 &amp; Automotive Android as guest2=
.</b></div>
<div><b>Can you please guide me with the steps for porting android as a gue=
st?</b></div></div>
<div style=3D"color:black;font-size:12pt;font-family:Calibri,Arial,Helvetic=
a,sans-serif"><b>What are the drivers &amp; packages that need to be includ=
ed to achieve this?</b><br aria-hidden=3D"true">
</div>
<div style=3D"color:black;font-size:12pt;font-family:Calibri,Arial,Helvetic=
a,sans-serif"><b>Looking forward to hearing=C2=A0from=C2=A0you.</b></div><d=
iv style=3D"color:black;font-size:12pt;font-family:Calibri,Arial,Helvetica,=
sans-serif"><b><br></b></div><div style=3D"color:black;font-size:12pt;font-=
family:Calibri,Arial,Helvetica,sans-serif"><b><br></b></div><div style=3D"c=
olor:black;font-size:12pt;font-family:Calibri,Arial,Helvetica,sans-serif"><=
b><br></b></div><div style=3D"color:black;font-size:12pt;font-family:Calibr=
i,Arial,Helvetica,sans-serif"><b><br></b></div><div style=3D"color:black;fo=
nt-size:12pt;font-family:Calibri,Arial,Helvetica,sans-serif"><b><br></b></d=
iv><div style=3D"color:black;font-size:12pt;font-family:Calibri,Arial,Helve=
tica,sans-serif"><b><br></b></div><div style=3D"color:black;font-size:12pt;=
font-family:Calibri,Arial,Helvetica,sans-serif"><b>Regards,</b></div><div s=
tyle=3D"color:black;font-size:12pt;font-family:Calibri,Arial,Helvetica,sans=
-serif"><b>Ksc.<br></b></div><div style=3D"color:black;font-size:12pt;font-=
family:Calibri,Arial,Helvetica,sans-serif"><b><br></b></div><div style=3D"c=
olor:black;font-size:12pt;font-family:Calibri,Arial,Helvetica,sans-serif"><=
b><br></b></div><div dir=3D"auto"><br></div></div>
</div>

--000000000000787bbf05ea1a0a87--

