Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C9113217473
	for <lists+xen-devel@lfdr.de>; Tue,  7 Jul 2020 18:51:35 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jsqoE-0000Hn-1P; Tue, 07 Jul 2020 16:51:06 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Gwtg=AS=redhat.com=armbru@srs-us1.protection.inumbo.net>)
 id 1jsqoD-0000Ey-08
 for xen-devel@lists.xenproject.org; Tue, 07 Jul 2020 16:51:05 +0000
X-Inumbo-ID: 0b8b342a-c072-11ea-8dc2-12813bfff9fa
Received: from us-smtp-delivery-1.mimecast.com (unknown [205.139.110.61])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 0b8b342a-c072-11ea-8dc2-12813bfff9fa;
 Tue, 07 Jul 2020 16:51:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594140663;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=10CNakQ3NgheZX/vjI8iYykwppKbLWYe9EuKJd8Y9yA=;
 b=i0puxRCVJ2B2kPGU/OlWHDSw16Xf+e/6zYSK1PTpMNTXfLmneesYGKZ8MCS1WhdqznFC3o
 Wt1Mr2CrnvahpiDZgAFXseau/47/FAkh8h6+rDREK2yyjhr3HKmQX0sKR7PkxB5pBUhrsu
 d8BQV+bTkyELZ5y9oLwxrQKay4oVSXo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-354-dQR7_YpFNua-zqFIhuDs5w-1; Tue, 07 Jul 2020 12:50:50 -0400
X-MC-Unique: dQR7_YpFNua-zqFIhuDs5w-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F2A12461;
 Tue,  7 Jul 2020 16:50:48 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-143.ams2.redhat.com
 [10.36.112.143])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8DE0F5D9F3;
 Tue,  7 Jul 2020 16:50:48 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 1B50B1132FD2; Tue,  7 Jul 2020 18:50:37 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v12 0/8] error: auto propagated local_err part I
Date: Tue,  7 Jul 2020 18:50:29 +0200
Message-Id: <20200707165037.1026246-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
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
Cc: Kevin Wolf <kwolf@redhat.com>, vsementsov@virtuozzo.com,
 Michael Roth <mdroth@linux.vnet.ibm.com>, qemu-block@nongnu.org,
 Paul Durrant <paul@xen.org>, Laszlo Ersek <lersek@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, groug@kaod.org,
 Max Reitz <mreitz@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

To speed things up, I'm taking the liberty to respin Vladimir's series
with my documentation amendments.

After my documentation work, I'm very much inclined to rename
ERRP_AUTO_PROPAGATE() to ERRP_GUARD().  The fact that it propagates
below the hood is detail.  What matters to its users is that it lets
them use @errp more freely.  Thoughts?

Based-on: Message-Id: <20200707160613.848843-1-armbru@redhat.com>

Available from my public repository https://repo.or.cz/qemu/armbru.git
on branch error-auto.

v12: (based on "[PATCH v4 00/45] Less clumsy error checking")
01: Comments merged properly with recent commit "error: Document Error
API usage rules", and edited for clarity.  Put ERRP_AUTO_PROPAGATE()
before its helpers, and touch up style.
01-08: Commit messages tweaked

Vladimir's cover letter for v11:

v11: (based-on "[PATCH v2 00/44] Less clumsy error checking")
01: minor rebase of documentation, keep r-bs
02: - minor comment tweaks [Markus]
    - use explicit file name in MAINTAINERS instead of pattern
    - add Markus's r-b
03,07,08: rabase changes, drop r-bs


v11 is available at
 https://src.openvz.org/scm/~vsementsov/qemu.git #tag up-auto-local-err-partI-v11
v10 is available at
 https://src.openvz.org/scm/~vsementsov/qemu.git #tag up-auto-local-err-partI-v10

In these series, there is no commit-per-subsystem script, each generated
commit is generated in separate.

Still, generating commands are very similar, and looks like

    sed -n '/^<Subsystem name>$/,/^$/{s/^F: //p}' MAINTAINERS | \
    xargs git ls-files | grep '\.[hc]$' | \
    xargs spatch \
        --sp-file scripts/coccinelle/auto-propagated-errp.cocci \
        --macro-file scripts/cocci-macro-file.h \
        --in-place --no-show-diff --max-width 80

Note, that in each generated commit, generation command is the only
text, indented by 8 spaces in 'git log -1' output, so, to regenerate all
commits (for example, after rebase, or change in coccinelle script), you
may use the following command:

git rebase -x "sh -c \"git show --pretty= --name-only | xargs git checkout HEAD^ -- ; git reset; git log -1 | grep '^        ' | sh\"" HEAD~6

Which will start automated interactive rebase for generated patches,
which will stop if generated patch changed
(you may do git commit --amend to apply updated generated changes).

Note:
  git show --pretty= --name-only   - lists files, changed in HEAD
  git log -1 | grep '^        ' | sh   - rerun generation command of HEAD


Check for compilation of changed .c files
git rebase -x "sh -c \"git show --pretty= --name-only | sed -n 's/\.c$/.o/p' | xargs make -j9\"" HEAD~6

Vladimir Sementsov-Ogievskiy (8):
  error: New macro ERRP_AUTO_PROPAGATE()
  scripts: Coccinelle script to use ERRP_AUTO_PROPAGATE()
  sd: Use ERRP_AUTO_PROPAGATE()
  pflash: Use ERRP_AUTO_PROPAGATE()
  fw_cfg: Use ERRP_AUTO_PROPAGATE()
  virtio-9p: Use ERRP_AUTO_PROPAGATE()
  nbd: Use ERRP_AUTO_PROPAGATE()
  xen: Use ERRP_AUTO_PROPAGATE()

 scripts/coccinelle/auto-propagated-errp.cocci | 337 ++++++++++++++++++
 include/block/nbd.h                           |   1 +
 include/qapi/error.h                          | 163 ++++++++-
 block/nbd.c                                   |   7 +-
 hw/9pfs/9p-local.c                            |  12 +-
 hw/9pfs/9p.c                                  |   1 +
 hw/block/dataplane/xen-block.c                |  17 +-
 hw/block/pflash_cfi01.c                       |   7 +-
 hw/block/pflash_cfi02.c                       |   7 +-
 hw/block/xen-block.c                          | 102 +++---
 hw/nvram/fw_cfg.c                             |  14 +-
 hw/pci-host/xen_igd_pt.c                      |   7 +-
 hw/sd/sdhci-pci.c                             |   7 +-
 hw/sd/sdhci.c                                 |  21 +-
 hw/sd/ssi-sd.c                                |  10 +-
 hw/xen/xen-backend.c                          |   7 +-
 hw/xen/xen-bus.c                              |  92 ++---
 hw/xen/xen-host-pci-device.c                  |  27 +-
 hw/xen/xen_pt.c                               |  25 +-
 hw/xen/xen_pt_config_init.c                   |  17 +-
 nbd/client.c                                  |   5 +
 nbd/server.c                                  |   5 +
 MAINTAINERS                                   |   1 +
 23 files changed, 659 insertions(+), 233 deletions(-)
 create mode 100644 scripts/coccinelle/auto-propagated-errp.cocci

-- 
2.26.2


