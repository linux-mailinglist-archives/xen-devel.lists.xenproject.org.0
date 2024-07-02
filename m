Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AD4D09238EA
	for <lists+xen-devel@lfdr.de>; Tue,  2 Jul 2024 10:53:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.752049.1160182 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sOYt3-0005IS-EL; Tue, 02 Jul 2024 08:29:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 752049.1160182; Tue, 02 Jul 2024 08:29:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sOYt3-0005GD-B4; Tue, 02 Jul 2024 08:29:17 +0000
Received: by outflank-mailman (input) for mailman id 752049;
 Tue, 02 Jul 2024 08:29:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/Tas=OC=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sOYt2-0005G2-PK
 for xen-devel@lists.xenproject.org; Tue, 02 Jul 2024 08:29:16 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2a0edd60-384d-11ef-958a-bbd156597b9e;
 Tue, 02 Jul 2024 10:29:15 +0200 (CEST)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-a72477a60fbso459692566b.2; 
 Tue, 02 Jul 2024 01:29:14 -0700 (PDT)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a72ab0b84d5sm396596466b.223.2024.07.02.01.29.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jul 2024 01:29:12 -0700 (PDT)
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
X-Inumbo-ID: 2a0edd60-384d-11ef-958a-bbd156597b9e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719908953; x=1720513753; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:date:cc:to:from
         :subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=u1lrZR3lXTld0yG1mwu1WQ84fBBuSrC1ZjxB5m6Syhk=;
        b=U+4rIXtJe86SUJsFFcZydROdqiijyaPSb5C99KfaMHLM/Zt3qGS3hKBfCl1c7KfALW
         +nAMZj/6h9XiLFFJY4BKdUieYujByjx6x66IBsX84GypGyxeck1a/JeIFPiCmcUQSCVf
         DbdoPe1JTURMi1xRx5jdd7ReLsGgYhfjcPPloPlZy2BBxgpN4XRA31A5KfjIZ5g01Mkj
         fdqSVyn5FRYX4m1z6TrLWY6Qbg4GR65BMyg5496a0GQ7VLYu1lDtHYK2FfHOW78UB5Is
         gP8B+vzs93VPH04YTWnaDCjtDmXc2Hz69R2bGJcvv5xMp6Cm+XCb9FELuUOFPRLAsWVm
         e2vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719908953; x=1720513753;
        h=mime-version:user-agent:content-transfer-encoding:date:cc:to:from
         :subject:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u1lrZR3lXTld0yG1mwu1WQ84fBBuSrC1ZjxB5m6Syhk=;
        b=b85gO36w/F1MfqdzGfJg8zGrigk+AbdfI9ZOcqdEb5K4N0F+WsbNMF1IMtB25qt4OI
         VJyNMbOvXFc0gT+OIdGXsuckGUEMeJYCAfgu3Fc54dhlW6XbA4O/04K/eOc1wvS1xyUO
         Iz9s8XvmBW2NZ+vInhrXiHrpcCu/ZZ/+rCpCI///X75aqkkQZwEfYsj1JoOagCBu63GI
         Ko4if9YUCJbrPSCwn8MZfjb3LE1VRoFWtPBMxYqJ20v1UoJlGe8jjKINZKqiiQqCFLSX
         UlC1lnsSpb7/53fHynM2f2rYTeyZVlccWYwwbMs9ZLtiE+Fd10KI7zlvQMaLjgSRkesv
         Tz+w==
X-Forwarded-Encrypted: i=1; AJvYcCWFj1Vy6RK3SG09A58rxkSRN+67GHl4qbD+f9ZlLj25jSIOOmAitKigO2/slKGLJ5rwMnCcvUXqzRuy9ngiXoMYKGawtVwZ61ddjbFzZ5ZfyaU=
X-Gm-Message-State: AOJu0Yx8c2/srQttvIjyBmKKkRIJXCFVjOwMA1pK3m/p3F+hYhq/RUoN
	A8tgTCN8PBSTdgLMl1S9fRFzhYWPMzr3Do5rKVj8fWz74cy7y/PaB38n3DS6
X-Google-Smtp-Source: AGHT+IGgnw05706l5f8ftgxQx2/12CCbmUzvgz7BnnKbKxpE5QfagLVWa7ep2rOe5QaqSSqhtelkrQ==
X-Received: by 2002:a17:906:c141:b0:a6f:73df:15d1 with SMTP id a640c23a62f3a-a751441f05dmr541846766b.7.1719908952756;
        Tue, 02 Jul 2024 01:29:12 -0700 (PDT)
Message-ID: <979c22a8a9c253d490fd87cdc825962cb905f3e2.camel@gmail.com>
Subject: Xen 4.19 rc1
From: Oleksii <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: xen-users@lists.xenproject.org, xen-announce@lists.xenproject.org
Date: Tue, 02 Jul 2024 10:29:12 +0200
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.2 (3.52.2-1.fc40app2) 
MIME-Version: 1.0

Hi all,

Xen 4.19 rc1 is tagged. You can check that out from xen.git:

git://xenbits.xen.org/xen.git 4.19.0-rc1

For your convenience there is also a tarball and the signature at:
https://downloads.xenproject.org/release/xen/4.19.0-rc1/xen-4.19.0-rc1.tar.=
gz

And the signature is at:
https://downloads.xenproject.org/release/xen/4.19.0-rc1/xen-4.19.0-rc1.tar.=
gz.sig

Please send bug reports and test reports to
xen-devel@lists.xenproject.org<mailto:xen-devel@lists.xenproject.org>.
When sending bug reports, please CC relevant maintainers and me
(oleskii.kurochko@gmail.com<mailto:oleskii.kurochko@gmail.com).

Best regards,
 Oleksii

