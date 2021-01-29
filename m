Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D30C4308D94
	for <lists+xen-devel@lfdr.de>; Fri, 29 Jan 2021 20:44:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.78448.142695 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5Zgt-0005Xq-5F; Fri, 29 Jan 2021 19:44:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 78448.142695; Fri, 29 Jan 2021 19:44:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5Zgt-0005XR-2F; Fri, 29 Jan 2021 19:44:23 +0000
Received: by outflank-mailman (input) for mailman id 78448;
 Fri, 29 Jan 2021 19:44:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fGyx=HA=gmail.com=philippe.mathieu.daude@srs-us1.protection.inumbo.net>)
 id 1l5Zgq-0005XM-QA
 for xen-devel@lists.xenproject.org; Fri, 29 Jan 2021 19:44:20 +0000
Received: from mail-wm1-x32c.google.com (unknown [2a00:1450:4864:20::32c])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5fd85a63-e651-429f-b803-975e351c40ca;
 Fri, 29 Jan 2021 19:44:19 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id i9so8081046wmq.1
 for <xen-devel@lists.xenproject.org>; Fri, 29 Jan 2021 11:44:19 -0800 (PST)
Received: from localhost.localdomain (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id w129sm11691194wmb.11.2021.01.29.11.44.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Jan 2021 11:44:18 -0800 (PST)
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
X-Inumbo-ID: 5fd85a63-e651-429f-b803-975e351c40ca
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=l/SsznvUOPafmTl5qUYK0iZ5NhczZABOHV/F9XW5GoQ=;
        b=sxrnsQuWeA96SXzdI19O0VPLqBtiUiE1AgCmUuJ72xn4sZzxOLNlx3EVbAy09NnIHS
         S9TlJmYNYtxtMEqzUkcUXud5glpSUclAAFQiNfte1hT2vUP0OGLPxuSsSv+7MklkJcdP
         uZnSQCyCwUXaegeDqkYW5evcU5p+6hfqlufQXAU/6C0xUn642S8kcVr59Cmw3N2r0Dsq
         SAGBFx6TPIWX3PGTDZwEBIVn3aNUvvfhdqSsgb23sdTjElUWxXN1Un6WhtGCSSeomwkU
         B7Yc3sAA2HENf52Sk/LHvo0fV8+PdzJM4nugiQk4QNeODLYvPOv5StUHB1WmGsq8kiVT
         8qcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :mime-version:content-transfer-encoding;
        bh=l/SsznvUOPafmTl5qUYK0iZ5NhczZABOHV/F9XW5GoQ=;
        b=Hf36JeSATsLx9mvkTI3666vWDt/wxzNAeWBf/RzxfRZFiot3bgtS/xec6YxRIP3CN8
         nW/qYVPrAI+eBwoiPbxV28qO9IYR+clEiPVyxdr+Hh9ceiq2isot8Ep9sktHa84rDLbH
         pnb6rpIKf06/+jtfmwq/LXSCAoJ3FOXMBRVtHuVoZPLGA5d+pkPJMk/bBGza+DGWAjRp
         v0iA1TrRfbDzKE1E+Um9BbZCWgz6XaABRRR+Ajjh5VfOq8SxwMbUFw+YhrrHQQrmiOAZ
         apVCL7BprRitO3a8ZuccdYklzaVzpv7Aof3uW1iFY9Jo7Q9nhq24M9mZu4gdzLmQemMr
         qY9Q==
X-Gm-Message-State: AOAM5338QPtvjYB4F0EWIxG5kWhR4zW0Chepi+r71DtBqhCybdSPIMM6
	wCJ/EMXX3igRycFuiKpcbn8=
X-Google-Smtp-Source: ABdhPJzvrzKRqIhADka2PQRFgCwVG6hn1Fus6E0B9yfr96UGRFZgJAH7j5S3BTBcv9DcDB9ji13fTw==
X-Received: by 2002:a7b:c3d8:: with SMTP id t24mr1052234wmj.35.1611949459188;
        Fri, 29 Jan 2021 11:44:19 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Thomas Huth <thuth@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Paul Durrant <paul@xen.org>,
	qemu-block@nongnu.org,
	John Snow <jsnow@redhat.com>,
	xen-devel@lists.xenproject.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [RFC PATCH 0/4] hw/xen: Fixes to only build the XEN_PV machine
Date: Fri, 29 Jan 2021 20:44:11 +0100
Message-Id: <20210129194415.3925153-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi Alex,=0D
=0D
These are the Xen patches I'm carrying to build the xenpv=0D
machine alone. I haven't tried to build the xenfv one.=0D
=0D
Tagged as RFC because this was part of a draft, so must be=0D
think better, but I don't have much time to finish it.=0D
Anyhow quick review appreciated.=0D
=0D
Missing (out of scope of this draft):=0D
Possibility to build another config than the default-configs/=0D
ones.=0D
=0D
Regards,=0D
=0D
Phil.=0D
=0D
Philippe Mathieu-Daud=C3=A9 (4):=0D
  hw/ide/Kconfig: IDE_ISA requires ISA_BUS=0D
  hw/ide/Kconfig: IDE_PIIX requires IDE_ISA=0D
  hw/xen/Kconfig: Introduce XEN_PV config=0D
  hw/xen: Have the xenpv machine select 9pfs=0D
=0D
 accel/Kconfig  | 1 -=0D
 hw/Kconfig     | 1 +=0D
 hw/ide/Kconfig | 3 ++-=0D
 hw/xen/Kconfig | 7 +++++++=0D
 4 files changed, 10 insertions(+), 2 deletions(-)=0D
 create mode 100644 hw/xen/Kconfig=0D
=0D
-- =0D
2.26.2=0D
=0D

