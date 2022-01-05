Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CF65A4854F3
	for <lists+xen-devel@lfdr.de>; Wed,  5 Jan 2022 15:45:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.253627.434840 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n57XG-0001lH-G0; Wed, 05 Jan 2022 14:45:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 253627.434840; Wed, 05 Jan 2022 14:45:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n57XG-0001ir-C5; Wed, 05 Jan 2022 14:45:06 +0000
Received: by outflank-mailman (input) for mailman id 253627;
 Wed, 05 Jan 2022 14:45:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2VPG=RV=gmail.com=highlimner@srs-se1.protection.inumbo.net>)
 id 1n57XF-0001il-28
 for xen-devel@lists.xenproject.org; Wed, 05 Jan 2022 14:45:05 +0000
Received: from mail-ua1-x932.google.com (mail-ua1-x932.google.com
 [2607:f8b0:4864:20::932])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1100eaf0-6e36-11ec-81c0-a30af7de8005;
 Wed, 05 Jan 2022 15:45:04 +0100 (CET)
Received: by mail-ua1-x932.google.com with SMTP id p1so47344058uap.9
 for <xen-devel@lists.xenproject.org>; Wed, 05 Jan 2022 06:45:04 -0800 (PST)
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
X-Inumbo-ID: 1100eaf0-6e36-11ec-81c0-a30af7de8005
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to;
        bh=p61GO9GBcIUgdhTp+82hV3V4jgStybmIyxjj3jsN93s=;
        b=SppU30ivyM1Iv6A++cRoyP6lwYCTFRlYcsjpNIsZVdvJ9ItTGjb790KaRxvG0UbzK2
         VjkRfx2xV/CiHH1YeOLC9itN5JcbBBeSX1RJq8uBuDRDOKcpBvCWYcfWcrlFcxnqbmEU
         kdTFI8WJ+VE7T2imwYxwgAGohYEjL4vWZT7j/tFtK89rhuqz4XetKzUyUVxc02Y+Plsp
         RwMN8CU2ZCVJfpsEO3jmEDL0XqO73UYrA7/m27zpcNOL+kFzLQHYW2Drag7T6Jpwaowh
         BTDacJwfbBLYbL9nNlzzkDFp9peJ/P+2NULgUGKexUrLQDbRi+SyvRZUNcbLzFX0vpRm
         tdwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=p61GO9GBcIUgdhTp+82hV3V4jgStybmIyxjj3jsN93s=;
        b=VOyTek/HpoCQSyhP1UJRdZazjBG0VpNkbbQT1pcUj9CPSvs0r+zZNC/l046MfPD3wp
         VTAPLIdJCpcUNKuIXmb7i+gXSB8f8fpEdSMqUoOJzpmzgvclIGWdMH5e+p3vub/lDw0L
         vQ9zJ9In8BNSjtp3uXBjLYzkOfKq8T5s4lczOxPPPd7qpYuMed+MHaLz/dl4IOIGRYbj
         cc1ETh/xgGvWTxQx0LQo5+BzQL31QM986RQKH9DWSUhMh35fqCkLoROe4w/BE6g5j2zy
         fF2ZJBNjH07ZbONybPsLB42Q5vZ2bwwUKl9btgRdqn3ZLg3QB5un4mQkzv69KXxyK89X
         h/og==
X-Gm-Message-State: AOAM532rBR0jab1k8TfXs8klRJE4jwSY2eqRFpUk76HMHUMiL4PcKkDa
	+4g6YmufPV2gjWPJhc2WuJvSwX4zPdQAmJ3/whIqz6LQuw/VTTJy
X-Google-Smtp-Source: ABdhPJzmVp0uORduuVyxx7DAUy0CJumWOJXXsbhpoaQ7Fq/0iEXnJi2kA7STEUcN2Ffc2ffDEb0gwbkN2ys86gxUyug=
X-Received: by 2002:a67:3085:: with SMTP id w127mr17357221vsw.72.1641393902717;
 Wed, 05 Jan 2022 06:45:02 -0800 (PST)
MIME-Version: 1.0
From: amir masoud noohi <highlimner@gmail.com>
Date: Wed, 5 Jan 2022 18:14:24 +0330
Message-ID: <CAN2gxUQmsa=ONQqj0-3PZ2oxp-QVMgsm0BQ+q=-LWwmWTqwMZg@mail.gmail.com>
Subject: scheduler credit capture
To: xen-devel@lists.xenproject.org
Content-Type: multipart/alternative; boundary="000000000000820f5305d4d6cced"

--000000000000820f5305d4d6cced
Content-Type: text/plain; charset="UTF-8"

Hi Everyone,

Today I'm looking for capturing vCPU credit for both credit1 and credit2.
How can I do that?

-- 
*Regards*
*Noohi*
*noohi.org <https://noohi.org>*

--000000000000820f5305d4d6cced
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-family:trebuche=
t ms,sans-serif">Hi Everyone,</div><div class=3D"gmail_default" style=3D"fo=
nt-family:trebuchet ms,sans-serif"><br></div><div class=3D"gmail_default" s=
tyle=3D"font-family:trebuchet ms,sans-serif">Today I&#39;m looking for capt=
uring vCPU credit for both credit1 and credit2.=C2=A0</div><div class=3D"gm=
ail_default" style=3D"font-family:trebuchet ms,sans-serif">How can I do tha=
t?=C2=A0</div><div><br></div>-- <br><div dir=3D"ltr" class=3D"gmail_signatu=
re" data-smartmail=3D"gmail_signature"><div dir=3D"ltr"><div><div dir=3D"lt=
r"><div><div dir=3D"ltr"><div><div dir=3D"ltr"><div><div dir=3D"ltr"><div d=
ir=3D"ltr"><b><font color=3D"#999999">Regards</font></b></div><div dir=3D"l=
tr"><font color=3D"#999999"><b>Noohi</b></font></div><div dir=3D"ltr"><b><a=
 href=3D"https://noohi.org" target=3D"_blank"><font color=3D"#999999">noohi=
.org</font></a></b></div></div></div></div></div></div></div></div></div></=
div></div></div>

--000000000000820f5305d4d6cced--

