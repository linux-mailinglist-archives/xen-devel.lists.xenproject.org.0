Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 73878B9837C
	for <lists+xen-devel@lfdr.de>; Wed, 24 Sep 2025 06:40:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1128837.1469057 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v1HHy-0004Kd-IK; Wed, 24 Sep 2025 04:39:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1128837.1469057; Wed, 24 Sep 2025 04:39:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v1HHy-0004At-DF; Wed, 24 Sep 2025 04:39:34 +0000
Received: by outflank-mailman (input) for mailman id 1128837;
 Wed, 24 Sep 2025 04:39:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1tVB=4D=rsg.ci.i.u-tokyo.ac.jp=odaki@srs-se1.protection.inumbo.net>)
 id 1v1HHw-0003tj-3L
 for xen-devel@lists.xenproject.org; Wed, 24 Sep 2025 04:39:32 +0000
Received: from www3579.sakura.ne.jp (www3579.sakura.ne.jp [49.212.243.89])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7478f1a8-9900-11f0-9d14-b5c5bf9af7f9;
 Wed, 24 Sep 2025 06:39:30 +0200 (CEST)
Received: from h205.csg.ci.i.u-tokyo.ac.jp (h205.csg.ci.i.u-tokyo.ac.jp
 [133.11.54.205]) (authenticated bits=0)
 by www3579.sakura.ne.jp (8.16.1/8.16.1) with ESMTPSA id 58O4bSmt091795
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Wed, 24 Sep 2025 13:37:39 +0900 (JST)
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
X-Inumbo-ID: 7478f1a8-9900-11f0-9d14-b5c5bf9af7f9
DKIM-Signature: a=rsa-sha256; bh=stt1PYHjZPmmH11DgDaK1e3bftbIHLz7TmtRdVRF/9A=;
        c=relaxed/relaxed; d=rsg.ci.i.u-tokyo.ac.jp;
        h=From:Date:Subject:Message-Id:To;
        s=rs20250326; t=1758688659; v=1;
        b=lKHDilw5Fq1/cnZFtWrkLQsf0wSND4A4CU0I4JhwbBbzg1lFKYlm5Q6wiWuBCtxG
         CBRYgMu6tQ2BVB7pBZ4GKpjKjWSZFTvVUm0oTmudZfXEsN8GNwYfzHYCC7V2sEjn
         SWwyuMCezPLlRWJoNUlfxXyyK+NclfnGNRTrHEZnjUWn2czlf+auXXMRtpwS0RGD
         0eOCj+jtWsvogScD6U0vQbVzanTlRUywY+cLXorEA1hhfKVYP1sH1Uj43IJdxQUo
         kvY6GCE+/eIZjhpVu+LCvIvEwMqhx+YtYzSwQh4kYV8v9fTB/B5MDHg2SQtUp3+c
         sOnfgKokiFWh2MNIuOFJvA==
From: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
Date: Wed, 24 Sep 2025 13:37:20 +0900
Subject: [PATCH v4 1/7] docs/devel: Do not unparent in instance_finalize()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250924-use-v4-1-07c6c598f53d@rsg.ci.i.u-tokyo.ac.jp>
References: <20250924-use-v4-0-07c6c598f53d@rsg.ci.i.u-tokyo.ac.jp>
In-Reply-To: <20250924-use-v4-0-07c6c598f53d@rsg.ci.i.u-tokyo.ac.jp>
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

Remove the instruction to call object_unparent(), and the exception
of the "do not call object_unparent()" rule for instance_finalize().

Signed-off-by: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
---
 docs/devel/memory.rst | 17 ++++++-----------
 1 file changed, 6 insertions(+), 11 deletions(-)

diff --git a/docs/devel/memory.rst b/docs/devel/memory.rst
index 42d3ca29c431..11858543f256 100644
--- a/docs/devel/memory.rst
+++ b/docs/devel/memory.rst
@@ -165,17 +165,14 @@ and finalized one by one.  The order in which memory regions will be
 finalized is not guaranteed.
 
 If however the memory region is part of a dynamically allocated data
-structure, you should call object_unparent() to destroy the memory region
-before the data structure is freed.  For an example see VFIOMSIXInfo
-and VFIOQuirk in hw/vfio/pci.c.
+structure, you should free the memory region in the instance_finalize
+callback.  For an example see VFIOMSIXInfo and VFIOQuirk in
+hw/vfio/pci.c.
 
 You must not destroy a memory region as long as it may be in use by a
 device or CPU.  In order to do this, as a general rule do not create or
-destroy memory regions dynamically during a device's lifetime, and only
-call object_unparent() in the memory region owner's instance_finalize
-callback.  The dynamically allocated data structure that contains the
-memory region then should obviously be freed in the instance_finalize
-callback as well.
+destroy memory regions dynamically during a device's lifetime, and must
+never call object_unparent().
 
 If you break this rule, the following situation can happen:
 
@@ -201,9 +198,7 @@ this exception is rarely necessary, and therefore it is discouraged,
 but nevertheless it is used in a few places.
 
 For regions that "have no owner" (NULL is passed at creation time), the
-machine object is actually used as the owner.  Since instance_finalize is
-never called for the machine object, you must never call object_unparent
-on regions that have no owner, unless they are aliases or containers.
+machine object is actually used as the owner.
 
 
 Overlapping regions and priority

-- 
2.51.0


