Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E5EB9861B6
	for <lists+xen-devel@lfdr.de>; Wed, 25 Sep 2024 16:59:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.804056.1214944 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stTUG-00009p-V9; Wed, 25 Sep 2024 14:59:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 804056.1214944; Wed, 25 Sep 2024 14:59:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stTUG-00007G-Rd; Wed, 25 Sep 2024 14:59:28 +0000
Received: by outflank-mailman (input) for mailman id 804056;
 Wed, 25 Sep 2024 14:59:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oIHX=QX=cloud.com=kelly.choi@srs-se1.protection.inumbo.net>)
 id 1stTUF-0008R0-IQ
 for xen-devel@lists.xenproject.org; Wed, 25 Sep 2024 14:59:27 +0000
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [2a00:1450:4864:20::12d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c2519e42-7b4e-11ef-a0ba-8be0dac302b0;
 Wed, 25 Sep 2024 16:59:27 +0200 (CEST)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-5365aa568ceso8235181e87.0
 for <xen-devel@lists.xenproject.org>; Wed, 25 Sep 2024 07:59:27 -0700 (PDT)
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
X-Inumbo-ID: c2519e42-7b4e-11ef-a0ba-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1727276366; x=1727881166; darn=lists.xenproject.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=KiF+pDx6/TaWiQWe/iuYOt1UB0wHj613v8Zm87OIt00=;
        b=QRTPTyp9hmoYTb41CEnMAzB8DvC2PCWlpkPcOKGBzevmQ8l/77X1revyZ7/KqWw1wg
         MC5WoVlm/82Icmdjpbi0rqLG2W++6fiaL4YRhXxdREIEzIQHm/ViiHmBhywZhzuw0E2g
         fDFgETVg8C3jCEK69C8EV60yjIuO6Gv32yy9Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727276366; x=1727881166;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KiF+pDx6/TaWiQWe/iuYOt1UB0wHj613v8Zm87OIt00=;
        b=BdNobMfrFZB6tqkhDh4O6J8LRQD2iV3mHUk+PgZO4hQ5bxG3Fea01S6JhsVQW2EOYt
         MCFarhtWo81sXXPFtzzLaZdYlMRO4yH+FqsnsoPUJPorRfO0EXRI3/HgJ8nhD2Q7RZI8
         S2+CgwP6pYBKcsR6GpaZSJCKHBXxHaiIEsjP7MOKPPKIGBfANJbxiePmjFdoeNRvr5Y9
         01mAt1VPflttyLOwCXgaH8AMwCKBc1zrYbunYGcAUR5dk40mZoxAn0qGbDywADBaT4t8
         UK8Lo+TRG+l5+kmzeOxMqsEjkR53anLAFIcPkauuI/goIScNE//whXiHGWj5ZtCTNZrI
         9QMQ==
X-Gm-Message-State: AOJu0Yzwxl3SczMZMMifvu24Jpx+g9PAQZDCGEqOc3GgwfmquKi4kLnp
	o0aWMcbxeNCzr/QU/f/hS5Z80nNJYs0H+U2m2pytCj9EcuiGd8ZLfunyV3sK8WB9WMpyJbhfRUU
	3arbpKt2+dqgKLg8AxUdjF0ZH48UTxc9bQ+g0m4wf20Kr5moN
X-Google-Smtp-Source: AGHT+IGbup5Nlh0J9cWO3HND8AUVXRN2/0BCWQWL8K73SvxXJdN7NJpXdMbuqARSQ8PwjwR0UJKx5U5vdCPtMDRwQ80=
X-Received: by 2002:ac2:4e10:0:b0:52e:933f:f1fa with SMTP id
 2adb3069b0e04-538801a6a64mr2312105e87.61.1727276366046; Wed, 25 Sep 2024
 07:59:26 -0700 (PDT)
MIME-Version: 1.0
From: Kelly Choi <kelly.choi@cloud.com>
Date: Wed, 25 Sep 2024 15:58:50 +0100
Message-ID: <CAO-mL=wCxPT+QiDW0Cb-LTQrkcfNTT8Eo_2kWsWHLrKJkhs8Mw@mail.gmail.com>
Subject: [POLL] Interest in next Xen Project meetup (Cambridge)
To: xen-devel <xen-devel@lists.xenproject.org>, xen-users@lists.xenproject.org
Content-Type: multipart/alternative; boundary="0000000000003a573a0622f2de4d"

--0000000000003a573a0622f2de4d
Content-Type: text/plain; charset="UTF-8"

Hi all,

Quick poll to gather interest for next Xen Project/Zephyr meetup in
Cambridge.
*Date: 24th October 2024*

We are also seeking two speakers for demos/lightning talks.

Could you reply with a +1 if interested in attending?
Just looking to gather numbers for now.

Kelly Choi
Community Manager
Xen Project <https://xenproject.org/>

--0000000000003a573a0622f2de4d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi all,<div><br></div><div>Quick poll to gather interest f=
or next Xen Project/Zephyr meetup in Cambridge.</div><div><b>Date: 24th Oct=
ober 2024</b></div><div><br></div><div>We are also seeking two speakers for=
 demos/lightning talks.=C2=A0</div><div><br></div><div>Could you reply with=
 a +1 if interested in attending?</div><div>Just looking to gather numbers =
for now.=C2=A0</div><div><div><div dir=3D"ltr" class=3D"gmail_signature" da=
ta-smartmail=3D"gmail_signature"><div dir=3D"ltr"><div><br></div><div>Kelly=
 Choi<br></div><div><div style=3D"color:rgb(136,136,136)">Community Manager=
</div><div style=3D"color:rgb(136,136,136)"><a href=3D"https://xenproject.o=
rg/" target=3D"_blank">Xen Project</a><br></div></div></div></div></div></d=
iv></div>

--0000000000003a573a0622f2de4d--

