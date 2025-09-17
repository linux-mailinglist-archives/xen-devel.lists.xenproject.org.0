Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DB65B7EEDD
	for <lists+xen-devel@lfdr.de>; Wed, 17 Sep 2025 15:06:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1124982.1467108 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uypdg-0001J9-2I; Wed, 17 Sep 2025 10:43:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1124982.1467108; Wed, 17 Sep 2025 10:43:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uypdf-00018O-Pt; Wed, 17 Sep 2025 10:43:51 +0000
Received: by outflank-mailman (input) for mailman id 1124982;
 Wed, 17 Sep 2025 10:15:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1BlG=34=rsg.ci.i.u-tokyo.ac.jp=odaki@srs-se1.protection.inumbo.net>)
 id 1uypCh-00062y-Jb
 for xen-devel@lists.xenproject.org; Wed, 17 Sep 2025 10:15:59 +0000
Received: from www3579.sakura.ne.jp (www3579.sakura.ne.jp [49.212.243.89])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4ccd3f76-93af-11f0-9d13-b5c5bf9af7f9;
 Wed, 17 Sep 2025 12:15:58 +0200 (CEST)
Received: from h205.csg.ci.i.u-tokyo.ac.jp (h205.csg.ci.i.u-tokyo.ac.jp
 [133.11.54.205]) (authenticated bits=0)
 by www3579.sakura.ne.jp (8.16.1/8.16.1) with ESMTPSA id 58HAE8sE093528
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Wed, 17 Sep 2025 19:14:25 +0900 (JST)
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
X-Inumbo-ID: 4ccd3f76-93af-11f0-9d13-b5c5bf9af7f9
DKIM-Signature: a=rsa-sha256; bh=Uu80FK/yXlnI37NFgIYNtl95VwZCqRjIMZXhhdmhF1M=;
        c=relaxed/relaxed; d=rsg.ci.i.u-tokyo.ac.jp;
        h=From:Date:Subject:Message-Id:To;
        s=rs20250326; t=1758104065; v=1;
        b=QyJv3vZ248Y7SoZ7rWNS++L+0DfaUm9g8fSVALB9v7pLAf6X4hVbSWM39ZMC9y+o
         nOzP1T/LsuuGh8RtkTQzS3ljsikW0nElI4Yo2D9rD3eVoBHS1Fdf58ScQ53giRdt
         GyV3UUD/8nwtM0mYcYMSexmWNGunMYLNOPx8WmKqf0NGjoFzA+gGCyXcWSSDZOKi
         foJw4RAQDbQSw0zLGGJFN1cJ3mryRFuAJWcbDEPv8cvKl2bSK/wxto7+8UgfK8ik
         KyA0vPyq94V9GlrknshqaUrPH5yuJ2W01fFM//XxlJtr8gNFDrwEIYGq0O3B4HlB
         iryWMp26qm5r6DWLySwslA==
From: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
Date: Wed, 17 Sep 2025 19:13:31 +0900
Subject: [PATCH v3 6/7] vfio: Do not unparent in instance_finalize()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250917-use-v3-6-72c2a6887c6c@rsg.ci.i.u-tokyo.ac.jp>
References: <20250917-use-v3-0-72c2a6887c6c@rsg.ci.i.u-tokyo.ac.jp>
In-Reply-To: <20250917-use-v3-0-72c2a6887c6c@rsg.ci.i.u-tokyo.ac.jp>
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

Children are automatically unparented so manually unparenting is
unnecessary.

Worse, automatic unparenting happens before the instance_finalize()
callback of the parent gets called, so object_unparent() calls in
the callback will refer to objects that are already unparented, which
is semantically incorrect.

Signed-off-by: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
---
 hw/vfio/pci-quirks.c | 9 +--------
 hw/vfio/region.c     | 3 ---
 2 files changed, 1 insertion(+), 11 deletions(-)

diff --git a/hw/vfio/pci-quirks.c b/hw/vfio/pci-quirks.c
index 3f002252acfb..83419b1ab58d 100644
--- a/hw/vfio/pci-quirks.c
+++ b/hw/vfio/pci-quirks.c
@@ -1150,15 +1150,12 @@ void vfio_vga_quirk_exit(VFIOPCIDevice *vdev)
 
 void vfio_vga_quirk_finalize(VFIOPCIDevice *vdev)
 {
-    int i, j;
+    int i;
 
     for (i = 0; i < ARRAY_SIZE(vdev->vga->region); i++) {
         while (!QLIST_EMPTY(&vdev->vga->region[i].quirks)) {
             VFIOQuirk *quirk = QLIST_FIRST(&vdev->vga->region[i].quirks);
             QLIST_REMOVE(quirk, next);
-            for (j = 0; j < quirk->nr_mem; j++) {
-                object_unparent(OBJECT(&quirk->mem[j]));
-            }
             g_free(quirk->mem);
             g_free(quirk->data);
             g_free(quirk);
@@ -1198,14 +1195,10 @@ void vfio_bar_quirk_exit(VFIOPCIDevice *vdev, int nr)
 void vfio_bar_quirk_finalize(VFIOPCIDevice *vdev, int nr)
 {
     VFIOBAR *bar = &vdev->bars[nr];
-    int i;
 
     while (!QLIST_EMPTY(&bar->quirks)) {
         VFIOQuirk *quirk = QLIST_FIRST(&bar->quirks);
         QLIST_REMOVE(quirk, next);
-        for (i = 0; i < quirk->nr_mem; i++) {
-            object_unparent(OBJECT(&quirk->mem[i]));
-        }
         g_free(quirk->mem);
         g_free(quirk->data);
         g_free(quirk);
diff --git a/hw/vfio/region.c b/hw/vfio/region.c
index d04c57db630f..b165ab0b9378 100644
--- a/hw/vfio/region.c
+++ b/hw/vfio/region.c
@@ -365,12 +365,9 @@ void vfio_region_finalize(VFIORegion *region)
     for (i = 0; i < region->nr_mmaps; i++) {
         if (region->mmaps[i].mmap) {
             munmap(region->mmaps[i].mmap, region->mmaps[i].size);
-            object_unparent(OBJECT(&region->mmaps[i].mem));
         }
     }
 
-    object_unparent(OBJECT(region->mem));
-
     g_free(region->mem);
     g_free(region->mmaps);
 

-- 
2.51.0


