Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FF85309C9F
	for <lists+xen-devel@lfdr.de>; Sun, 31 Jan 2021 15:18:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.79293.144365 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6DYP-0000pI-89; Sun, 31 Jan 2021 14:18:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 79293.144365; Sun, 31 Jan 2021 14:18:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6DYP-0000ov-3u; Sun, 31 Jan 2021 14:18:17 +0000
Received: by outflank-mailman (input) for mailman id 79293;
 Sun, 31 Jan 2021 14:18:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jslU=HC=gmail.com=philippe.mathieu.daude@srs-us1.protection.inumbo.net>)
 id 1l6DYN-0000oq-20
 for xen-devel@lists.xenproject.org; Sun, 31 Jan 2021 14:18:15 +0000
Received: from mail-wr1-x42a.google.com (unknown [2a00:1450:4864:20::42a])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e8a9a8d4-6976-4edd-83c6-ada0e32231f6;
 Sun, 31 Jan 2021 14:18:14 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id c4so11040275wru.9
 for <xen-devel@lists.xenproject.org>; Sun, 31 Jan 2021 06:18:14 -0800 (PST)
Received: from localhost.localdomain (7.red-83-57-171.dynamicip.rima-tde.net.
 [83.57.171.7])
 by smtp.gmail.com with ESMTPSA id r1sm22987356wrl.95.2021.01.31.06.18.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 31 Jan 2021 06:18:12 -0800 (PST)
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
X-Inumbo-ID: e8a9a8d4-6976-4edd-83c6-ada0e32231f6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GIWi9Z1K5+Z4chfPUGDZEKduFG1scZeAuKlobFer7yw=;
        b=B3upva1lQImpCXKT2vTlYyyQV8k8gXmcJgk/jifDewGX/O23kvIvcIOPz7kKVJpR7x
         920BievNMu18AleB7g5GsHYC0g5DBU4l5S2ZDO2XGLKtNJ9FjP5t20fxa8amDbIKAD+y
         rWqUvmQ7huoVpAJashDPVCjB0LF+Uvwx6wZ0orEInCJ2PyIjQQbf4kjfq+5gZtEAXkL5
         iXlwIJZ+/DMrY0N9ZXeGqKOD9AYd9gv/eOCHfRwSnj/6wWE/FpvSS5wNnzbIMV4cS7aZ
         c0CnB3Tk7I07XXMYMlsU+HFTuNEAh6HlYVV5CTer4bxYg4+9VTJMk4MRJOylgmuToHdI
         mneQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :mime-version:content-transfer-encoding;
        bh=GIWi9Z1K5+Z4chfPUGDZEKduFG1scZeAuKlobFer7yw=;
        b=XzguOGjW4qSMYILZEDjIVo15KmrCwzTbhMrAw8+Ife6m/tOnFbWV8LT9H6ojAM3Bwc
         cQoJUSftKXKBwByHFiPrCR5B7tdJ+bCSKRsq5UNrAgCDrEbLFhcn+IP+a+5nI1AcHL9C
         w+ol4GKiCIA2N/jXTt9JjhjYSjen2RWHlAg+x5yiYdTDnOyjqIrH45CqJHyd8cEPrA6o
         U6WwPSPOFOKlUCatRI+yMlpucfgXa3lOHLVqr9FEyjURvai9+4Vv5NeBSWtb3Q7QUboi
         Ibz98oQdZ8ZtxXS8QQg7BMMvAiuEHQgP1Mp1GpW1bDO4y/4xvt3e0SfnUn8xbzcIlA04
         cg9w==
X-Gm-Message-State: AOAM533eheD0G5h0Ebsn37d0oYU9BFSABxMbsNygPpJwURofmI9cFYKX
	+ayqPUoXhlsiAKgV838+7s4=
X-Google-Smtp-Source: ABdhPJwFOGm4rX1EnPajx3ScVugKdJeHifUetp3ME+GKNn1wQu8EPRfmaBqHqyu/OY0jZxvGzPiGYQ==
X-Received: by 2002:adf:f747:: with SMTP id z7mr13664612wrp.384.1612102693419;
        Sun, 31 Jan 2021 06:18:13 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Paul Durrant <paul@xen.org>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	xen-devel@lists.xenproject.org,
	Anthony Perard <anthony.perard@citrix.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v2 0/4] hw/xen: Introduce XEN_FV/XEN_PV Kconfig
Date: Sun, 31 Jan 2021 15:18:06 +0100
Message-Id: <20210131141810.293186-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Sort the Xen buildsys glue a bit.=0D
=0D
v2: Considered Paolo's comments from v1=0D
=0D
Supersedes: <20210129194415.3925153-1-f4bug@amsat.org>=0D
=0D
Philippe Mathieu-Daud=C3=A9 (4):=0D
  meson: Do not build Xen x86_64-softmmu on Aarch64=0D
  hw/i386/xen: Introduce XEN_FV Kconfig=0D
  hw/xen/Kconfig: Introduce XEN_PV config=0D
  hw/xen: Have Xen machines select 9pfs=0D
=0D
 meson.build             | 5 +++--=0D
 accel/Kconfig           | 1 -=0D
 hw/Kconfig              | 1 +=0D
 hw/i386/Kconfig         | 2 ++=0D
 hw/i386/xen/Kconfig     | 6 ++++++=0D
 hw/i386/xen/meson.build | 2 +-=0D
 hw/xen/Kconfig          | 8 ++++++++=0D
 7 files changed, 21 insertions(+), 4 deletions(-)=0D
 create mode 100644 hw/i386/xen/Kconfig=0D
 create mode 100644 hw/xen/Kconfig=0D
=0D
-- =0D
2.26.2=0D
=0D

