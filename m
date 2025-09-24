Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FBA0B98383
	for <lists+xen-devel@lfdr.de>; Wed, 24 Sep 2025 06:40:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1128834.1469036 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v1HHx-0003wD-Gk; Wed, 24 Sep 2025 04:39:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1128834.1469036; Wed, 24 Sep 2025 04:39:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v1HHx-0003uE-Dy; Wed, 24 Sep 2025 04:39:33 +0000
Received: by outflank-mailman (input) for mailman id 1128834;
 Wed, 24 Sep 2025 04:39:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1tVB=4D=rsg.ci.i.u-tokyo.ac.jp=odaki@srs-se1.protection.inumbo.net>)
 id 1v1HHu-0003tj-E6
 for xen-devel@lists.xenproject.org; Wed, 24 Sep 2025 04:39:31 +0000
Received: from www3579.sakura.ne.jp (www3579.sakura.ne.jp [49.212.243.89])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 734bab1e-9900-11f0-9d14-b5c5bf9af7f9;
 Wed, 24 Sep 2025 06:39:28 +0200 (CEST)
Received: from h205.csg.ci.i.u-tokyo.ac.jp (h205.csg.ci.i.u-tokyo.ac.jp
 [133.11.54.205]) (authenticated bits=0)
 by www3579.sakura.ne.jp (8.16.1/8.16.1) with ESMTPSA id 58O4bSms091795
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Wed, 24 Sep 2025 13:37:38 +0900 (JST)
 (envelope-from odaki@rsg.ci.i.u-tokyo.ac.jp)
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
X-Inumbo-ID: 734bab1e-9900-11f0-9d14-b5c5bf9af7f9
DKIM-Signature: a=rsa-sha256; bh=4Lrx+OHmEWMxnbxoN2F7Ox37ZHsYr5d+IsqXMnVqT1o=;
        c=relaxed/relaxed; d=rsg.ci.i.u-tokyo.ac.jp;
        h=From:Subject:Date:Message-Id:To;
        s=rs20250326; t=1758688659; v=1;
        b=UAXiXKO4Ji2vMqO4/0Y9wj6BVXDQ0BLFjbEBQlzZfWNdKZ7EehKftBG/zVO7C2CD
         gZMA31hZQaPekdxCHeEquvjPWsJ+tNGhTgp3tH4qQ++pq3IOJn0j5WbkZhrmtH0P
         8J4BUrEuD5GSWFI7bGB/xClYcXwviVMSPSwBpsOq0aemdfD/EnhdyjvbU6IA/gVg
         yZJMAHLl/323C6NqM3uIurnJq0/txBN/IPFkMf9CrwXtbQp6+cLx/gbIiXkGbPDB
         /VcwOelMjazEgXZIaR+olA4iYG20nC81SCiN0e/gP4FYvURae3M1ucgYB4HCJ2Cp
         bfMmFGxBXYoh+4tIcWKsRw==
From: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
Subject: [PATCH v4 0/7] Do not unparent in instance_finalize()
Date: Wed, 24 Sep 2025 13:37:19 +0900
Message-Id: <20250924-use-v4-0-07c6c598f53d@rsg.ci.i.u-tokyo.ac.jp>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAH9102gC/33MTQ6CMBCG4auYrm3TH6HgynsYF3WYQjWxpAUiI
 dzdAhtc6PKdzPdMJGJwGMn5MJGAg4vOv1KcjgcCjXnVSF2VmkguM17ynPYRqdIIUHJlSuQkfbY
 BrXuvyvWWunGx82Fc0UEs1+/9ICinkAkwxlYC7/oSYs3AMcd62vnn6JkB9mjJgg1yB4hsA2QC7
 Am0tULdLZZ/AbUH9AaoBGgJ0uRFoSGHn8A8zx+kFuP8JQEAAA==
X-Change-ID: 20250906-use-37ecc903a9e0
To: qemu-devel@nongnu.org
Cc: Alex Williamson <alex.williamson@redhat.com>,
        =?utf-8?q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>,
        Paolo Bonzini <pbonzini@redhat.com>,
        =?utf-8?q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
        Eduardo Habkost <eduardo@habkost.net>, Peter Xu <peterx@redhat.com>,
        David Hildenbrand <david@redhat.com>,
        =?utf-8?q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
        Richard Henderson <richard.henderson@linaro.org>,
        Helge Deller <deller@gmx.de>,
        =?utf-8?q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Gerd Hoffmann <kraxel@redhat.com>, John Snow <jsnow@redhat.com>,
        qemu-block@nongnu.org, Keith Busch <kbusch@kernel.org>,
        Klaus Jensen <its@irrelevant.dk>, Jesper Devantier <foss@defmacro.it>,
        Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
        Nicholas Piggin <npiggin@gmail.com>, qemu-ppc@nongnu.org,
        John Levon <john.levon@nutanix.com>,
        Thanos Makatos <thanos.makatos@nutanix.com>,
        Yanan Wang <wangyanan55@huawei.com>,
        BALATON Zoltan <balaton@eik.bme.hu>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Daniel Henrique Barboza <danielhb413@gmail.com>,
        David Gibson <david@gibson.dropbear.id.au>,
        Harsh Prateek Bora <harshpb@linux.ibm.com>,
        Alexey Kardashevskiy <aik@ozlabs.ru>,
        =?utf-8?q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
        Fabiano Rosas <farosas@suse.de>, Thomas Huth <thuth@redhat.com>,
        Laurent Vivier <lvivier@redhat.com>,
        Peter Maydell <peter.maydell@linaro.org>,
        Aurelien Jarno <aurelien@aurel32.net>,
        Aleksandar Rikalo <arikalo@gmail.com>,
        Max Filippov <jcmvbkbc@gmail.com>,
        =?utf-8?q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>,
        Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
        Artyom Tarasenko <atar4qemu@gmail.com>,
        Alistair Francis <alistair@alistair23.me>,
        "Maciej S. Szmigiero" <maciej.szmigiero@oracle.com>,
        Bin Meng <bmeng.cn@gmail.com>,
        Stefano Stabellini <sstabellini@kernel.org>,
        Anthony PERARD <anthony@xenproject.org>, Paul Durrant <paul@xen.org>,
        "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
        xen-devel@lists.xenproject.org,
        Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
X-Mailer: b4 0.15-dev-179e8

Supersedes: <20240829-memory-v1-1-ac07af2f4fa5@daynix.com>
("[PATCH] docs/devel: Prohibit calling object_unparent() for memory region")

Children are automatically unparented so manually unparenting is
unnecessary.

Worse, automatic unparenting happens before the instance_finalize()
callback of the parent gets called, so object_unparent() calls in
the callback will refer to objects that are already unparented, which
is semantically incorrect.

Signed-off-by: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
---
Changes in v4:
- Removed Based-on:.
- Restored the examples of VFIOMSIXInfo and VFIOQuirk in
  docs/devel/memory.rst.
- Ensured that the timing to call object_unparent() and free memory
  regions is mentioned once for each.
- Link to v3: https://lore.kernel.org/qemu-devel/20250917-use-v3-0-72c2a6887c6c@rsg.ci.i.u-tokyo.ac.jp

Changes in v3:
- Added patches to remove other object_unparent() calls in
  instance_finalize().
- Dropped patch "qdev: Automatically delete memory subregions" and the
  succeeding patches to avoid Ccing many.
- Link to v2: https://lore.kernel.org/qemu-devel/20250915-use-v2-0-f4c7ff13bfe9@rsg.ci.i.u-tokyo.ac.jp

Changes in v2:
- Added a reference to "[PATCH] docs/devel: Prohibit calling
  object_unparent() for memory region", which does something similar to
  patch "docs/devel: Do not unparent in instance_finalize()" but I
  forgot I sent it in the past.
- Fixed a typo in patch
  "docs/devel: Do not unparent in instance_finalize()" and
  "[PATCH 02/22] vfio/pci: Do not unparent in instance_finalize()".
- Dropped patches to move address_space_init() calls; I intend to
  QOM-ify to fix memory leaks automatically as discussed in the
  following thread:
  https://lore.kernel.org/qemu-devel/cd21698f-db77-eb75-6966-d559fdcab835@eik.bme.hu/
  But the QOM-ification will be big so I'll send it as a separate
  series.
- Rebased on top of "[PATCH v2 00/14] hw/pci-host/raven clean ups".
  https://lore.kernel.org/qemu-devel/cover.1751493467.git.balaton@eik.bme.hu/
- Link to v1: https://lore.kernel.org/qemu-devel/20250906-use-v1-0-c51caafd1eb7@rsg.ci.i.u-tokyo.ac.jp

---
Akihiko Odaki (7):
      docs/devel: Do not unparent in instance_finalize()
      vfio/pci: Do not unparent in instance_finalize()
      hw/core/register: Do not unparent in instance_finalize()
      hv-balloon: hw/core/register: Do not unparent in instance_finalize()
      hw/sd/sdhci: Do not unparent in instance_finalize()
      vfio: Do not unparent in instance_finalize()
      hw/xen: Do not unparent in instance_finalize()

 docs/devel/memory.rst  | 17 ++++++-----------
 hw/core/register.c     |  1 -
 hw/hyperv/hv-balloon.c | 12 +-----------
 hw/sd/sdhci.c          |  4 ----
 hw/vfio/pci-quirks.c   |  9 +--------
 hw/vfio/pci.c          |  4 ----
 hw/vfio/region.c       |  3 ---
 hw/xen/xen_pt_msi.c    | 11 +----------
 8 files changed, 9 insertions(+), 52 deletions(-)
---
base-commit: ab8008b231e758e03c87c1c483c03afdd9c02e19
change-id: 20250906-use-37ecc903a9e0

Best regards,
--  
Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>


