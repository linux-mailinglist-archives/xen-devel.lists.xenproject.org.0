Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB1512613E4
	for <lists+xen-devel@lfdr.de>; Tue,  8 Sep 2020 17:55:52 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kFfy7-0005kA-CW; Tue, 08 Sep 2020 15:55:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=cV5b=CR=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1kFfy5-0005k5-S6
 for xen-devel@lists.xenproject.org; Tue, 08 Sep 2020 15:55:38 +0000
X-Inumbo-ID: 0959607c-2291-4cec-b7af-2185c5f54fc0
Received: from us-smtp-1.mimecast.com (unknown [207.211.31.81])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 0959607c-2291-4cec-b7af-2185c5f54fc0;
 Tue, 08 Sep 2020 15:55:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599580536;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=9j8LNni0K0Ze9zlV3rWaTDC98qmRJvn1PKy4tvgP9TY=;
 b=DnDH0IpsjL9arnao1Z0dgGVnw6Kk6Aki5t4VKZCLDRJDWnv5IA7NpNcMKLDfroblJXqdFd
 4omnByLBZ18C75sVb1rlne2/iSw9SiazocTXKCHKujYDw9OHeeyPcM9QI4GEOTJH6OlnSk
 rVBTCfvs3dqkKyCt3EEvJuDkov6/trM=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-505-1PyS7s3hNTWIw0Anxe7kwA-1; Tue, 08 Sep 2020 11:55:34 -0400
X-MC-Unique: 1PyS7s3hNTWIw0Anxe7kwA-1
Received: by mail-wm1-f72.google.com with SMTP id w3so4891753wmg.4
 for <xen-devel@lists.xenproject.org>; Tue, 08 Sep 2020 08:55:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9j8LNni0K0Ze9zlV3rWaTDC98qmRJvn1PKy4tvgP9TY=;
 b=X5r9Mokwe/bucdoK198AVb+H4O4r8rFT91HbJ6Ntmmv07kGHuooSBZvEHRt/WQru/K
 s0hV0knQsZ4VFpn5DbYiJmmhEvg+AQCssW5Iuz9TL7cNF+Xz2SyEYtSzJhfvSPizNzp2
 o7qaJMYHPTq+PHQ6WN1aJ3yrHbcWOeUxpdrRwuKYsPmvkgn5Y1Vpd/iumLLkP1eu8Wm5
 nHvz6+6aqXYnc/YTq1CoTr8GYBETCxMJkNHCWHlxN4GWnz4RxrDUCvM06jGEYLMrgEIh
 CxyoQ5Mx3Yq0JrCsPk2DqOB9VpML4LPIqJMkyTWf4sSmvUITt3GVJaSO2VXSfgw3mvR+
 /2Mg==
X-Gm-Message-State: AOAM530Dt9Mqa/Am8UUlyM7y0EnGX3KEaziau6m61yFZb6Z+R8sJ/9ZT
 jXnLM3xBG/e+1nJT1BHyIL1XajcEKvW5kQQp8T5oQkcaFyqmUN7sgBXlFmrahJfHqVFlOrln90z
 v1X1KFq9pwYn2oiRHI5gHYAjIKVA=
X-Received: by 2002:adf:f082:: with SMTP id n2mr290527wro.35.1599580532999;
 Tue, 08 Sep 2020 08:55:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyxYkBgGzzaWKvpOFlNbbbbP9lrh/psCt3R+tnd0FsuRZrWeLF+XgkSPHCNZYgHHlXHTFCwjQ==
X-Received: by 2002:adf:f082:: with SMTP id n2mr290518wro.35.1599580532824;
 Tue, 08 Sep 2020 08:55:32 -0700 (PDT)
Received: from localhost.localdomain (65.red-83-57-170.dynamicip.rima-tde.net.
 [83.57.170.65])
 by smtp.gmail.com with ESMTPSA id t1sm30401380wmi.16.2020.09.08.08.55.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Sep 2020 08:55:32 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <rth@twiddle.net>,
 Anthony Perard <anthony.perard@citrix.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 xen-devel@lists.xenproject.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Paul Durrant <paul@xen.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH v2 0/6] hw/xen: Housekeeping
Date: Tue,  8 Sep 2020 17:55:24 +0200
Message-Id: <20200908155530.249806-1-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hard to make an exciting cover of this series.

Basically:
- Make better separation between Xen accel and Xen hardware,
- Move stuff around to restrict PCMachineState to hw/i386/.

Since v1:
- added missing include in stubs/xen-hw-stub.c
- added missing 'exec/cpu-common.h' for ram_addr_t

(Due to a bug in 'make', while rebasing the archives
 might not be updated... so I missed this missing
 hunk as hw/core/libhwcore.fa didn't rebuilt stubs/)

Philippe Mathieu-Daudé (6):
  hw/i386/q35: Remove unreachable Xen code on Q35 machine
  hw/i386/xen: Rename X86/PC specific function as xen_hvm_init_pc()
  sysemu/xen: Add missing 'exec/cpu-common.h' header for ram_addr_t type
  stubs: Split accelerator / hardware related stubs
  hw/xen: Split x86-specific declaration from generic hardware ones
  typedefs: Restrict PCMachineState to 'hw/i386/pc.h'

 include/hw/i386/pc.h     |  4 ++--
 include/hw/xen/xen-x86.h | 15 ++++++++++++
 include/hw/xen/xen.h     |  2 --
 include/qemu/typedefs.h  |  1 -
 include/sysemu/xen.h     |  2 ++
 accel/stubs/xen-stub.c   | 41 +-------------------------------
 hw/i386/pc_piix.c        |  8 +++----
 hw/i386/pc_q35.c         | 13 ++---------
 hw/i386/xen/xen-hvm.c    |  3 ++-
 stubs/xen-hw-stub.c      | 50 ++++++++++++++++++++++++++++++++++++++++
 MAINTAINERS              |  1 +
 stubs/meson.build        |  1 +
 12 files changed, 80 insertions(+), 61 deletions(-)
 create mode 100644 include/hw/xen/xen-x86.h
 create mode 100644 stubs/xen-hw-stub.c

-- 
2.26.2


