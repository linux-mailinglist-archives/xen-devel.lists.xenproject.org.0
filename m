Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D72AD5F3C18
	for <lists+xen-devel@lfdr.de>; Tue,  4 Oct 2022 06:26:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.415151.659665 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ofZVG-00069a-Mk; Tue, 04 Oct 2022 04:25:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 415151.659665; Tue, 04 Oct 2022 04:25:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ofZVG-000672-JL; Tue, 04 Oct 2022 04:25:58 +0000
Received: by outflank-mailman (input) for mailman id 415151;
 Tue, 04 Oct 2022 04:18:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gpva=2F=gmail.com=degakiran05@srs-se1.protection.inumbo.net>)
 id 1ofZOV-0004ba-2I
 for xen-devel@lists.xenproject.org; Tue, 04 Oct 2022 04:18:59 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id aa5a90cf-439b-11ed-964a-05401a9f4f97;
 Tue, 04 Oct 2022 06:18:57 +0200 (CEST)
Received: by mail-wr1-x431.google.com with SMTP id w18so10701483wro.7
 for <xen-devel@lists.xenproject.org>; Mon, 03 Oct 2022 21:18:57 -0700 (PDT)
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
X-Inumbo-ID: aa5a90cf-439b-11ed-964a-05401a9f4f97
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date;
        bh=fNzeIGDDvx4Pqf/DNH0EYVFOQSwH+vSq1bIJXQJp+CQ=;
        b=liHQoh04KiwpktNtNBwfFQz4yCrpbysYCYltvvhk5AhE4hX+w4+fq7lvCmTHMClzbM
         FGATds0L9hquxXM98gE3N7dihSVAXjompEvx7zKTW7uUtHOThlT5TWuheEBObUeHR3zH
         WPFtJiHV7+RtD3hk/QStO8bJAmElpcmXyaNEod5RomAyR+TDVh/3mehmTk6M62vFGfOz
         dJwVIeB13uAkvMWfaNVRSE/JGnJstrS3U+kTQ7OhoeIGr9muaN9aUnFSagvj00bDl9k0
         MegRyW6afKw3OvbY1srm0PltOpV9NfkCWiOcmV+qfi1INl1wBGg8PmnERfFVT32Ggz6q
         E0Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date;
        bh=fNzeIGDDvx4Pqf/DNH0EYVFOQSwH+vSq1bIJXQJp+CQ=;
        b=NA/kmevFfu/f3PqYPt52Qserp7doOQNYxA8RGgdGOZo4esgOXo9TsaqYk/uYT/1QN5
         prT7mRaxRGUK8aA6V3OxIlkLffDOrcG1JdP7d4yqdKUlxDj60erzpA1AVZFaRc6M2GDQ
         cEaAZpuPF7g2hraukGT/KqN9RNVA86SszUxZ399irZ+VxnczJhQ6ekzQC+OQPAaZN9xO
         lLdqRLYYHtux2HD7Ez8/O5Chy8oteudkxK6TQWQh4xRRUbuA+EtD/zVcOF+ehQY5Z/WT
         lzOtm8HiBBFeHr7IfPen9Evwla3bVmuOdKt8BvhvSowSy0sdbT7gMYySfOQ1RspHSivH
         gcqw==
X-Gm-Message-State: ACrzQf1H+5JhDBCa/0338SRb9cibg+1pth695+3Xn+fxcYnlHXAlfUQD
	yqzahZRnbvJfypI3VF1/48TbS2vWUKhMXkPVDB+CslwQWYM=
X-Google-Smtp-Source: AMsMyM6/vPXDKnheG1uZPDp6CCpVxGc1YD6dnjUoGJ9MjS8QzjQ7emygwysVmW4a+oLqrqVHCyQPkypuEOjmOaArAKo=
X-Received: by 2002:a05:6000:1c18:b0:22b:13e3:19d3 with SMTP id
 ba24-20020a0560001c1800b0022b13e319d3mr15178468wrb.699.1664857136725; Mon, 03
 Oct 2022 21:18:56 -0700 (PDT)
MIME-Version: 1.0
From: dega kiran <degakiran05@gmail.com>
Date: Tue, 4 Oct 2022 09:48:20 +0530
Message-ID: <CADY+DPLf10UtUWE7Y9zZvN0NRFkGtV7ah3dg8t4wYWrF=8R2LQ@mail.gmail.com>
Subject: Free Rtos porting on XEN
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, ulien Grall <julien@xen.org>
Content-Type: multipart/alternative; boundary="0000000000003c84b105ea2dc2d1"

--0000000000003c84b105ea2dc2d1
Content-Type: text/plain; charset="UTF-8"

Hi ,

I am trying to port FREERtos on XEN . But not getting any
concrete information for porting.

I am following https://github.com/GaloisInc/FreeRTOS-Xen

but getting a lot of errors.

Please Let me know how to follow the porting process.


Thank you,
Dega.

--0000000000003c84b105ea2dc2d1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi ,<div><br></div><div>I am trying to port FREERtos=C2=A0=
on XEN . But not getting any concrete=C2=A0information for porting.</div><d=
iv><br></div><div>I am following=C2=A0<a href=3D"https://github.com/GaloisI=
nc/FreeRTOS-Xen" target=3D"_blank" dir=3D"ltr" rel=3D"noopener nofollow nor=
eferrer" class=3D"gmail-oiM5sf" style=3D"text-decoration-line:none;backgrou=
nd:rgba(32,33,36,0.04);font-size:14px;margin:0px;padding:0px;vertical-align=
:baseline;font-family:Roboto,sans-serif;white-space:pre-wrap">https://githu=
b.com/GaloisInc/FreeRTOS-Xen</a></div><div><br></div><div>but getting a lot=
 of errors.</div><div><br></div><div>Please Let me know how to follow the p=
orting process.</div><div><br></div><div><br></div><div>Thank you,</div><di=
v>Dega.</div><div><br></div></div>

--0000000000003c84b105ea2dc2d1--

