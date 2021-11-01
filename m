Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3991E44231C
	for <lists+xen-devel@lfdr.de>; Mon,  1 Nov 2021 23:10:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.219425.380220 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mhfUX-0007s5-R6; Mon, 01 Nov 2021 22:09:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 219425.380220; Mon, 01 Nov 2021 22:09:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mhfUX-0007px-Lw; Mon, 01 Nov 2021 22:09:21 +0000
Received: by outflank-mailman (input) for mailman id 219425;
 Mon, 01 Nov 2021 22:09:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=z02t=PU=redhat.com=quintela@srs-us1.protection.inumbo.net>)
 id 1mhfUV-0007pl-Uw
 for xen-devel@lists.xenproject.org; Mon, 01 Nov 2021 22:09:20 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [216.205.24.124])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 48062fba-59dd-4727-ad3d-190af613b836;
 Mon, 01 Nov 2021 22:09:18 +0000 (UTC)
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-393-_dseDoJZNLCO2oPxmaRC9g-1; Mon, 01 Nov 2021 18:09:15 -0400
Received: by mail-wm1-f69.google.com with SMTP id
 k25-20020a05600c1c9900b00332f798ba1dso174559wms.4
 for <xen-devel@lists.xenproject.org>; Mon, 01 Nov 2021 15:09:15 -0700 (PDT)
Received: from localhost (static-233-86-86-188.ipcom.comunitel.net.
 [188.86.86.233])
 by smtp.gmail.com with ESMTPSA id i15sm630121wmb.20.2021.11.01.15.09.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Nov 2021 15:09:13 -0700 (PDT)
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
X-Inumbo-ID: 48062fba-59dd-4727-ad3d-190af613b836
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1635804558;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=UcUIBTO6A2A6Mr3DNTGimCFNhmnrVDJGDlnfgcY6wsE=;
	b=AbbEtOqV5+v9HxPUyMgPaJBRNs5rFG57PZzamI8JbU1O28Ar0ZkzItmo8wX5JeyGJ3lnfM
	6ZAgG+yyzP+ddHGZOCA83YZz5N+JN7TW2hZJSjZ3Kq4bgxYYlaN/RvPO0KYMg3KrVofEC3
	lWZlhKYK0/WNgQbTqg7phKFYVD95YNo=
X-MC-Unique: _dseDoJZNLCO2oPxmaRC9g-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=mg126+9me9ZhZB/Tacp08IAkZeaGvGDXykNGOzkIohU=;
        b=fb+FhMtZ9nNS5KwSWKJvWGSd+POIbRy1UFwlH9CvEuiaCmfQfBuCPUQ5m3xMEEAJSt
         Gy5bscYruo0PrWigkqNk1kyVnQBM4jHiP8bwgp/jqgZkYFF6R2u/TnAbLkNP2+xh0pJj
         /4Ij3MrtM3q1Qf1YMFMnlQQ/5ynUgdSKwOWtV4tQyeH1hUsLuyhDIJYcIZsHewTYNsPZ
         h3Cey7nDGnmPzF9Wmoc2cPMLDdpCi5CEZCqwNtqKcG05g5c3XCdFMLW0zZ49vn7b5woR
         +s9qogKbMCXpNVs0mUNzryCadpnXA4QAtUT4vRIFV/eMBpI8QghdtdfLh7HX8YNuTWMi
         f3Yw==
X-Gm-Message-State: AOAM533b72YJ9YBItTlREBmhUQtHq8RHXXdB38pE2aoYIQ+P7gGisAoR
	+JVg+EniLDwYEUjPIsONXVsStcNhyh4XUHeoVImnVMjuV+zGFpi0v621nPwxr7CoqifIzM+CaPD
	lvYakb1xr5Xlai6sNYwGCQvW4cS0=
X-Received: by 2002:a5d:6e8c:: with SMTP id k12mr40207231wrz.401.1635804554337;
        Mon, 01 Nov 2021 15:09:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwiYqS6XG9xwq0Xi+0IIDYOMlQDxPDwjRqxs0xc44YT7VvgO+jFUiosfcGK1mj6k1mDxUBPBw==
X-Received: by 2002:a5d:6e8c:: with SMTP id k12mr40207187wrz.401.1635804554086;
        Mon, 01 Nov 2021 15:09:14 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Markus Armbruster <armbru@redhat.com>,
	David Hildenbrand <david@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	xen-devel@lists.xenproject.org,
	Richard Henderson <richard.henderson@linaro.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Eric Blake <eblake@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	kvm@vger.kernel.org,
	Peter Xu <peterx@redhat.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Paul Durrant <paul@xen.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	Juan Quintela <quintela@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Anthony Perard <anthony.perard@citrix.com>
Subject: [PULL 00/20] Migration 20211031 patches
Date: Mon,  1 Nov 2021 23:08:52 +0100
Message-Id: <20211101220912.10039-1-quintela@redhat.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following changes since commit af531756d25541a1b3b3d9a14e72e7fedd941a2e=
:=0D
=0D
  Merge remote-tracking branch 'remotes/philmd/tags/renesas-20211030' into =
staging (2021-10-30 11:31:41 -0700)=0D
=0D
are available in the Git repository at:=0D
=0D
  https://github.com/juanquintela/qemu.git tags/migration-20211031-pull-req=
uest=0D
=0D
for you to fetch changes up to 826b8bc80cb191557a4ce7cf0e155b436d2d1afa:=0D
=0D
  migration/dirtyrate: implement dirty-bitmap dirtyrate calculation (2021-1=
1-01 22:56:44 +0100)=0D
=0D
----------------------------------------------------------------=0D
Migration Pull request=0D
=0D
Hi=0D
=0D
this includes pending bits of migration patches.=0D
=0D
- virtio-mem support by David Hildenbrand=0D
- dirtyrate improvements by Hyman Huang=0D
- fix rdma wrid by Li Zhijian=0D
- dump-guest-memory fixes by Peter Xu=0D
=0D
Pleas apply.=0D
=0D
Thanks, Juan.=0D
=0D
----------------------------------------------------------------=0D
=0D
David Hildenbrand (8):=0D
  memory: Introduce replay_discarded callback for RamDiscardManager=0D
  virtio-mem: Implement replay_discarded RamDiscardManager callback=0D
  migration/ram: Handle RAMBlocks with a RamDiscardManager on the=0D
    migration source=0D
  virtio-mem: Drop precopy notifier=0D
  migration/postcopy: Handle RAMBlocks with a RamDiscardManager on the=0D
    destination=0D
  migration: Simplify alignment and alignment checks=0D
  migration/ram: Factor out populating pages readable in=0D
    ram_block_populate_pages()=0D
  migration/ram: Handle RAMBlocks with a RamDiscardManager on background=0D
    snapshots=0D
=0D
Hyman Huang(=C3=A9=C2=BB=E2=80=9E=C3=A5=E2=80=B9=E2=80=A1) (6):=0D
  KVM: introduce dirty_pages and kvm_dirty_ring_enabled=0D
  memory: make global_dirty_tracking a bitmask=0D
  migration/dirtyrate: introduce struct and adjust DirtyRateStat=0D
  migration/dirtyrate: adjust order of registering thread=0D
  migration/dirtyrate: move init step of calculation to main thread=0D
  migration/dirtyrate: implement dirty-ring dirtyrate calculation=0D
=0D
Hyman Huang(=E9=BB=84=E5=8B=87) (2):=0D
  memory: introduce total_dirty_pages to stat dirty pages=0D
  migration/dirtyrate: implement dirty-bitmap dirtyrate calculation=0D
=0D
Li Zhijian (1):=0D
  migration/rdma: Fix out of order wrid=0D
=0D
Peter Xu (3):=0D
  migration: Make migration blocker work for snapshots too=0D
  migration: Add migrate_add_blocker_internal()=0D
  dump-guest-memory: Block live migration=0D
=0D
 qapi/migration.json            |  48 ++++-=0D
 include/exec/memory.h          |  41 +++-=0D
 include/exec/ram_addr.h        |  13 +-=0D
 include/hw/core/cpu.h          |   1 +=0D
 include/hw/virtio/virtio-mem.h |   3 -=0D
 include/migration/blocker.h    |  16 ++=0D
 include/sysemu/kvm.h           |   1 +=0D
 migration/dirtyrate.h          |  21 +-=0D
 migration/ram.h                |   1 +=0D
 accel/kvm/kvm-all.c            |   7 +=0D
 accel/stubs/kvm-stub.c         |   5 +=0D
 dump/dump.c                    |  19 ++=0D
 hw/i386/xen/xen-hvm.c          |   4 +-=0D
 hw/virtio/virtio-mem.c         |  92 ++++++---=0D
 migration/dirtyrate.c          | 367 ++++++++++++++++++++++++++++++---=0D
 migration/migration.c          |  30 +--=0D
 migration/postcopy-ram.c       |  40 +++-=0D
 migration/ram.c                | 180 ++++++++++++++--=0D
 migration/rdma.c               | 138 +++++++++----=0D
 softmmu/memory.c               |  43 +++-=0D
 hmp-commands.hx                |   8 +-=0D
 migration/trace-events         |   2 +=0D
 softmmu/trace-events           |   1 +=0D
 23 files changed, 909 insertions(+), 172 deletions(-)=0D
=0D
--=20=0D
2.33.1=0D
=0D


