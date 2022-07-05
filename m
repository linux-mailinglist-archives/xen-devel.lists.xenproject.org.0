Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE501567AE8
	for <lists+xen-devel@lfdr.de>; Wed,  6 Jul 2022 01:49:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.361727.591368 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8sHa-0001VE-FA; Tue, 05 Jul 2022 23:48:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 361727.591368; Tue, 05 Jul 2022 23:48:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8sHa-0001SN-By; Tue, 05 Jul 2022 23:48:42 +0000
Received: by outflank-mailman (input) for mailman id 361727;
 Tue, 05 Jul 2022 23:48:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Zbt5=XK=gmail.com=asr7247@srs-se1.protection.inumbo.net>)
 id 1o8sHY-0001SH-HF
 for xen-devel@lists.xenproject.org; Tue, 05 Jul 2022 23:48:40 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fe2c1dd3-fcbc-11ec-bd2d-47488cf2e6aa;
 Wed, 06 Jul 2022 01:48:39 +0200 (CEST)
Received: by mail-ej1-x62b.google.com with SMTP id ay16so24266895ejb.6
 for <xen-devel@lists.xenproject.org>; Tue, 05 Jul 2022 16:48:39 -0700 (PDT)
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
X-Inumbo-ID: fe2c1dd3-fcbc-11ec-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to;
        bh=IBaieNh81j3eG/6AbXAFBlYHy2DeNc7YIGUU+pf4AOg=;
        b=Y2tmj+WDjW3izOHwBHZQBJe5PTj553ADBVg3UPezPTikMNuGeaQ0GApe/RUxODQIFy
         T0wl5Teqs6+3Gf32puXW/Ck6T78o0EWMUVY4w78TQ22gbszEwUUn42IbQW5oYX/6kSZI
         xJQ3suVJoyKO2uRJNO/qPNIJFkOa3Ub4Kel0H/qxBR9TO4FOBugTcnRmJqaKGunQF126
         IdhnknMuM1CQeuWnWBqLMlnjJ/t0rl6v5Y9Wf2SaU6z3rMAOH6L26ODlv31d/3B1oIhm
         eLA5nyMn3f9xQ4feOf3ZPuUuOg6zVByJCYr4/GCnuvXsiW38kRK4RsiRczEU2zeb/uH7
         DN4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=IBaieNh81j3eG/6AbXAFBlYHy2DeNc7YIGUU+pf4AOg=;
        b=1mtZWadIa7NkC8QUSWUjpn8Clr6mt/pXkpoOzsFE1ryTMwzPMFxBJppiGxGEhBKAb1
         vMcB03n63KaR8yCCztUm2h7l+gNTotoSI8QchotirHrmDaXTK+n0+XDrqliFitDVhIrH
         RkE8uEl1y+KgcBFg4OYjBIw1zgWZKZk9u8+3Aeqh1wQS8mR/F61b6f0GmWCb1mD96Q42
         s9ErqskTfGDOLAsGzOtZBnIypWWr7jCrNQ6JtnYk8QIrVcP2GkKZinoZiuSrd0w7vTGh
         f8j+rs6HwwVYUOg2Tidqa2899mCa3WKGgXjyoMi6YBb9C3eVi5V5o+Lx2RCwmIbdNmoX
         bdfQ==
X-Gm-Message-State: AJIora9u70iHn31KqraUcQLE4AvjqaszFuxVftEup032NRwb68bygUfG
	G2IK+S5fl9b9jQ4RvQRw8bgI+AGNqG/xZODRn5opayMFouuJWT39
X-Google-Smtp-Source: AGRyM1sMOSNGf2NTEeH/FnFLd4T33iiFVluDkixp9qJ4D59DJFqa67eRgABlhwSFfnp4WhBPlXjxaCA5v+e1CMDHmB0=
X-Received: by 2002:a17:906:6a20:b0:726:7675:e15a with SMTP id
 qw32-20020a1709066a2000b007267675e15amr35293872ejc.668.1657064918510; Tue, 05
 Jul 2022 16:48:38 -0700 (PDT)
MIME-Version: 1.0
From: A Sudheer <asr7247@gmail.com>
Date: Wed, 6 Jul 2022 05:18:19 +0530
Message-ID: <CABg_PyKHi8QUHhgD9v7CLCHvYPwNcaZP6x2_VJA5eZ2GuLOBmg@mail.gmail.com>
Subject: access uart, i2c IO devices in DomU
To: xen-devel@lists.xenproject.org
Content-Type: multipart/alternative; boundary="000000000000d671c505e3177dd4"

--000000000000d671c505e3177dd4
Content-Type: text/plain; charset="UTF-8"

Hi All,

On Xen-4.16 with Ubuntu-22.04 Dom0 and Ubuntu-22.04 HVM DomU, i need to
access IO devices like UART and I2C.
I am able to access them in Dom0. Can someone let me know how to access
them in DomU. What are the cfg options to be provided ?

Thanks
Sudheer

--000000000000d671c505e3177dd4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi All,=C2=A0<div><br></div><div>On Xen-4.16 with Ubuntu-2=
2.04 Dom0 and Ubuntu-22.04 HVM DomU, i need to access=C2=A0IO devices like =
UART and I2C.<br></div><span class=3D"gmail-im" style=3D"color:rgb(80,0,80)=
"><div>I am able to access them in Dom0. Can someone let me know how to acc=
ess them in DomU. What are the cfg options to be provided ?</div><div><br><=
/div><div>Thanks=C2=A0<br></div><font color=3D"#888888"><div>Sudheer</div><=
div><br></div></font></span></div>

--000000000000d671c505e3177dd4--

