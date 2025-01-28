Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CC9F0A20EAA
	for <lists+xen-devel@lfdr.de>; Tue, 28 Jan 2025 17:34:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.878657.1288849 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tcoXS-00073y-DO; Tue, 28 Jan 2025 16:34:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 878657.1288849; Tue, 28 Jan 2025 16:34:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tcoXS-00070q-9t; Tue, 28 Jan 2025 16:34:10 +0000
Received: by outflank-mailman (input) for mailman id 878657;
 Tue, 28 Jan 2025 16:34:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=C4cq=UU=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1tcoXR-00070a-87
 for xen-devel@lists.xenproject.org; Tue, 28 Jan 2025 16:34:09 +0000
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com
 [2a00:1450:4864:20::643])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b1b17942-dd95-11ef-99a4-01e77a169b0f;
 Tue, 28 Jan 2025 17:34:07 +0100 (CET)
Received: by mail-ej1-x643.google.com with SMTP id
 a640c23a62f3a-aaf57c2e0beso1173066966b.3
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jan 2025 08:34:07 -0800 (PST)
Received: from localhost.localdomain ([217.156.233.154])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab6973090d0sm534810966b.18.2025.01.28.08.34.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jan 2025 08:34:06 -0800 (PST)
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
X-Inumbo-ID: b1b17942-dd95-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1738082046; x=1738686846; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kxkQhfjKvrf8HHDrNJTtmA9R4L9LSQEslDN3hWnIrF0=;
        b=gsqdnKNKa6hLcd+rz3BS+OCgECHBXNcRexl86HOASokHyDY7hbmSEzeJXH/shNTenW
         tdCxecUlSsPGvEljWoQqGqi3ZkD7sqcyFgKB9VYlg1KB/sIKwrMml1vQdHwsxDJ+85dt
         J5/jAC/f1ZtY7zv2j5YHG/lDhZlM4id3ZF4q4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738082046; x=1738686846;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kxkQhfjKvrf8HHDrNJTtmA9R4L9LSQEslDN3hWnIrF0=;
        b=eJmU+WUvVHzt4W4wMBNV7yaXVtrWaJjRNJYXToLB1nkjcOTFndY46192WREOacmzv+
         n0jXJ52sbQhCWEHJx4fcQF1cQoZM+l24yTi8/BTPYGkF/V4ZWaRkuWa/M/Gb2macOh4R
         zhEAviE5fmucN5rl2AhXA3UWgu1uAS6OFQI+vCgs3HMV8r2GGgM0nrAFxhj8UApcS7aM
         ne9hRcjbu929BSGtJxH8RMdXOP5PLgg8RbXZKfEpWUNQM2yBL/Lf9f1GPdtMvgxea968
         YQ3quLKmcVWLke5kFVfN4uCbmOx7dNqGK9DP49P2sdFnN9PPM+ji/Kl4oTsf6BJ/Eopw
         W8eA==
X-Gm-Message-State: AOJu0YxLr+57ZQk2YOiUBHT6t1qQwgaxS6x3G/7JyQdJg1AtpwN4bX4K
	wN5KTaOQtDqGMps8717cB14+xjgPZES1REikBDrVm8rQyF0fuOHF2+Ev/c7Jx0XJmyv0pckd11M
	jyuIePQ==
X-Gm-Gg: ASbGncs/6+gF64xC/wKZxTVMQ0vnwi6ZeB1Nu9YXVjDFc8A1SkaFuaVXFfkiVUwGdfP
	8PQqNSQ0L1sCgFtm/lQlWY6ib9A6lrRMvqAHg5UyTKpMEmrAc9++YsbBBTdcJQhueUKueLRJdFu
	0HMJjsFSufL2ZUCA7lf7wvZ97zjPoVnn+kOurMHN5H/TToD32cN8md/DVIIfmr7RWneMu6o2RGD
	h9L6MRJa3zInjwxyXPMskgetUqqXuPUPrUVPMpc/e94VwT4CdRojr8nDN/zVz2DHQphMwsc2MUg
	jVLB/eMmB6EWklSA+E88Mf6963fW3oW5GUQuJENG
X-Google-Smtp-Source: AGHT+IEK6szVFEF/wz7XSVOj9YqpHityyfgkfOrDcP3vfyGQmfgp0qRqWAJBhw8l4b3iKbD8wOm51A==
X-Received: by 2002:a17:907:969f:b0:ab2:b863:b7fa with SMTP id a640c23a62f3a-ab38b43b915mr4376791066b.44.1738082046581;
        Tue, 28 Jan 2025 08:34:06 -0800 (PST)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: [PATCH 0/3] tools/hvmloader: Decouple APIC IDs from vCPU IDs
Date: Tue, 28 Jan 2025 16:33:39 +0000
Message-ID: <20250128163342.1491-1-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The hypervisor, hvmloader and the toolstack currently engage in a shared
assumption that for every vCPU apicid == 2 * vcpuid. This series removes such
assumption from hvmloader, by making it read the APIC ID of each vCPU and
storing it for later use.

The last patch prevents writing an MP Tables should we have vCPUs that can not
be represented there. That's at the moment dead code because all vCPUs are
currently representable in 8 bits. This will inavitably stop being true in the
future after we increase the maximum number of guest vCPUs.

This short series is extracted from v7 of the much longer "Expose consistent
topology to guests".

  https://lore.kernel.org/xen-devel/20241021154600.11745-5-alejandro.vallejo@cloud.com/

Changes with respect to the original patch on each individual patch.

Alejandro Vallejo (3):
  tools/hvmloader: Retrieve (x2)APIC IDs from the APs themselves
  tools/hvmloader: Replace LAPIC_ID() with cpu_to_apicid[]
  tools/hvmloader: Skip writing MP tables if any CPU has an APIC ID >=
    255

 tools/firmware/hvmloader/config.h    |  4 ++-
 tools/firmware/hvmloader/hvmloader.c | 12 ++++---
 tools/firmware/hvmloader/mp_tables.c |  2 +-
 tools/firmware/hvmloader/smp.c       | 47 +++++++++++++++++++++++++++-
 tools/firmware/hvmloader/util.c      |  2 +-
 5 files changed, 59 insertions(+), 8 deletions(-)

-- 
2.48.1


