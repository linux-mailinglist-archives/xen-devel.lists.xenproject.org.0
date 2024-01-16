Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D7CF82F26F
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jan 2024 17:32:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.667896.1039565 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rPmMD-00078r-Dp; Tue, 16 Jan 2024 16:32:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 667896.1039565; Tue, 16 Jan 2024 16:32:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rPmMD-00076e-Av; Tue, 16 Jan 2024 16:32:09 +0000
Received: by outflank-mailman (input) for mailman id 667896;
 Tue, 16 Jan 2024 16:32:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gvQ1=I2=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rPmMC-00076Y-Dz
 for xen-devel@lists.xenproject.org; Tue, 16 Jan 2024 16:32:08 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ca208817-b48c-11ee-98f1-6d05b1d4d9a1;
 Tue, 16 Jan 2024 17:32:07 +0100 (CET)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-a2d04888d3dso431179366b.2
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jan 2024 08:32:07 -0800 (PST)
Received: from [192.168.206.239] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 bl2-20020a170906c24200b00a29d232ab76sm6632041ejb.182.2024.01.16.08.32.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Jan 2024 08:32:06 -0800 (PST)
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
X-Inumbo-ID: ca208817-b48c-11ee-98f1-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705422727; x=1706027527; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:date:cc:to:from
         :subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=pYSpP5C7P5CRoiCT6m2fIVJTuOz33kHURU8Py9UHHp4=;
        b=YUUyg5oogEtULVR5nH3hzuPLmeH5ntUZnuS7IuE09TS97v6RrFUb3+p9IfsA1iwy2V
         Kss9CTn5OUJi8aAZCVJpu/bKh2KG/BGCbyMU4BNnscsSm4K6cQi49zZJjmV33GW/RJeT
         HSJuBUYhuMKzpWQ37Dv3sgRm7YxfSAq0zKVKKiYur6OYdt/Tym1ygsxMjEUnhmwrWkQP
         BUQmMXUZHfEBm+gu15fdSVRLBMq39ASxbkrdUbE+DbHG4lerz3Tfi09kTHOGI16Z8Yi2
         +oiatHp6HQ4PT+zingWheOz4QK6f71MSQAkiTILbTweyQUTJ8i4NHbC+f8IHQIkKN61r
         dr9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705422727; x=1706027527;
        h=mime-version:user-agent:content-transfer-encoding:date:cc:to:from
         :subject:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pYSpP5C7P5CRoiCT6m2fIVJTuOz33kHURU8Py9UHHp4=;
        b=M6ff7CizDf4DbJYiqzrwBBdhXR8i2O+upeyIAhK0AQlnvXjjrBBg//5OA3C2Lg6wft
         jbZb6LicDBRfaGm1ls7Fl2uArsJWuzlQn6bsjIZKdyrDHhOS5/gWgceLJApdz511DgZW
         xM2mF6fG0zAgt8nsyyYOCTVSRAJm6m7k7cff/z+csygxWpsfUKVWSWjR4aXMNoiOdZnR
         YlYWPPdOXewfXBmkaOqfV1rl01KR3a8qpNUePkab36A7pS8DDFCUyZOOtrGH/TKKVmEc
         AXrUjbWjNorpwEGlCzloTkElCnGzOkMaMUw7qfoAUlXZd7Ts5cwZ3HPoY9ePDK8I/yXZ
         ol3Q==
X-Gm-Message-State: AOJu0YwGBpfVCr600TMM+iVWam3Zz07GP+c9KZf/qn/Mji58rjF+iB2D
	vs+phZ6PV8EPkSUT+GoqYdDpra5euac=
X-Google-Smtp-Source: AGHT+IGjy/zlIkV6wg9/2cVTbBYPWnR64Nv3F19z5y4t2tpwUct5gxQadktnCv+fCdVxP5eVLdXk9g==
X-Received: by 2002:a17:907:a0d4:b0:a2d:b74b:26a8 with SMTP id hw20-20020a170907a0d400b00a2db74b26a8mr1984277ejc.77.1705422726525;
        Tue, 16 Jan 2024 08:32:06 -0800 (PST)
Message-ID: <08a2f9bdd7ba1f9e1e8e67fdb48420ee89223b01.camel@gmail.com>
Subject: Xen 4.19 release management plan
From: Oleksii <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Kelly Choi <kelly.choi@cloud.com>, Jan Beulich <jbeulich@suse.com>, 
 Andrew Cooper <andrew.cooper3@citrix.com>, Christopher Clark
 <christopher.w.clark@gmail.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
 <bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
  Rahul Singh <rahul.singh@arm.com>, Henry Wang <Henry.Wang@arm.com>,
 community.manager@xenproject.org,  cardoe@cardoe.com, jgross@suse.com,
 dpsmith@apertussolutions.com, Anthony PERARD <anthony.perard@citrix.com>,
 Wei Liu <wl@xen.org>, Tamas K Lengyel <tamas@tklengyel.com>, Roger Pau
 =?ISO-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,  George Dunlap
 <george.dunlap@citrix.com>, Luca Fancellu <luca.fancellu@arm.com>, "Daniel
 P. Smith" <dpsmith@apertussolutions.com>, committers@xenproject.org
Date: Tue, 16 Jan 2024 18:32:04 +0200
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.2 (3.50.2-1.fc39) 
MIME-Version: 1.0

Hello everyone,

I would like to start tracking which features and changes are expected
in Xen 4.19 for each architecture.

Please reply with items you would like to see in 4.19 so that people
know what is happening and prioritize accordingly.
You're welcome to provide a description and use cases of the feature
you're working on.

On my side:

 RISC-V:
  - full Xen build
  - Dom0 boot ( let me be optimistic. Probably, I have to divide this=20
into small parts. and track them separately ).

 x86:
  - Finish and start sending AMD SEV patches ( note: this is being   =20
developed by my colleagues at Vates, not me ).
    We are currently on phase one:
https://www.mail-archive.com/xen-devel@lists.xenproject.org/msg156388.html
.

Thanks in advance for your cooperation.

I hope you have a nice week.

Best regards,
  Oleksii


