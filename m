Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 98BC6B7EE97
	for <lists+xen-devel@lfdr.de>; Wed, 17 Sep 2025 15:06:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1124990.1467126 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uypdh-0001fi-2U; Wed, 17 Sep 2025 10:43:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1124990.1467126; Wed, 17 Sep 2025 10:43:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uypdg-0001XQ-Og; Wed, 17 Sep 2025 10:43:52 +0000
Received: by outflank-mailman (input) for mailman id 1124990;
 Wed, 17 Sep 2025 10:16:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1BlG=34=rsg.ci.i.u-tokyo.ac.jp=odaki@srs-se1.protection.inumbo.net>)
 id 1uypCy-00062y-AH
 for xen-devel@lists.xenproject.org; Wed, 17 Sep 2025 10:16:16 +0000
Received: from www3579.sakura.ne.jp (www3579.sakura.ne.jp [49.212.243.89])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 53db5649-93af-11f0-9d13-b5c5bf9af7f9;
 Wed, 17 Sep 2025 12:16:10 +0200 (CEST)
Received: from h205.csg.ci.i.u-tokyo.ac.jp (h205.csg.ci.i.u-tokyo.ac.jp
 [133.11.54.205]) (authenticated bits=0)
 by www3579.sakura.ne.jp (8.16.1/8.16.1) with ESMTPSA id 58HAE8s8093528
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Wed, 17 Sep 2025 19:14:21 +0900 (JST)
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
X-Inumbo-ID: 53db5649-93af-11f0-9d13-b5c5bf9af7f9
DKIM-Signature: a=rsa-sha256; bh=lJRKJLkUtQVuwFEISLl+dhYLnOkVsl4daLaMLN8WUus=;
        c=relaxed/relaxed; d=rsg.ci.i.u-tokyo.ac.jp;
        h=From:Subject:Date:Message-Id:To;
        s=rs20250326; t=1758104062; v=1;
        b=oSwItlPy6eUaF3lh0yljm0+YCQBLTh6nG41CDwERnyNvvOnjQMl7mGXP+YZv2tHG
         cQ85oqb0YLQ+StopBgfveBRpVYJohzqiHNNR2JdhLymCdpqUr6t6VXy8GRFHTT9R
         cIb8YmgQYR6vHa7S+mPZP9ORB5wu0etavueW/B/ziXBrRzZpESHRoKJwd8fWH5HF
         PtOMtXTi0fLWCW7X5lvU9RjXpf6e6h0rF+AGzgDO4rbZEcArb5JDrw9/xuhAQlbz
         ITpfxxz0BxXfnbauuAqKB2w9aQQgYlR/uCg4Xs6+Tl+oAD9GziK/hKFkTcd2l0eL
         SCbnL+KlTAWECgXyrOaWzQ==
From: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
Subject: [PATCH v3 0/7] Do not unparent in instance_finalize()
Date: Wed, 17 Sep 2025 19:13:25 +0900
Message-Id: <20250917-use-v3-0-72c2a6887c6c@rsg.ci.i.u-tokyo.ac.jp>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMWJymgC/3XMTQ6CMBCG4auQrm3TH5HUlfcwLsowhdFESAuNh
 HB3C2504fKdzPcsLGIgjOxcLCxgokj9M4c5FAw692yRU5ObaalLaeWJTxG5qRDASuMsSpY/h4C
 eXrtyveXuKI59mHc0qe36u0+KSw6lAud8o7CuLiG2AkiQmPjYP+ZeOBD3gW1Y0l+AKj+AzoA/Q
 uW9MrVH+xdY1/UN5gLO0eQAAAA=
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

Based-on: <cover.1751493467.git.balaton@eik.bme.hu>
("[PATCH v2 00/14] hw/pci-host/raven clean ups")

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

 docs/devel/memory.rst  | 19 ++++++-------------
 hw/core/register.c     |  1 -
 hw/hyperv/hv-balloon.c | 12 +-----------
 hw/sd/sdhci.c          |  4 ----
 hw/vfio/pci-quirks.c   |  9 +--------
 hw/vfio/pci.c          |  4 ----
 hw/vfio/region.c       |  3 ---
 hw/xen/xen_pt_msi.c    | 11 +----------
 8 files changed, 9 insertions(+), 54 deletions(-)
---
base-commit: e101d33792530093fa0b0a6e5f43e4d8cfe4581e
change-id: 20250906-use-37ecc903a9e0

Best regards,
--  
Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>


