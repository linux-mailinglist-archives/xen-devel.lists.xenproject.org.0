Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BDE3B983B0
	for <lists+xen-devel@lfdr.de>; Wed, 24 Sep 2025 06:44:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1128903.1469106 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v1HMc-0008Jb-4v; Wed, 24 Sep 2025 04:44:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1128903.1469106; Wed, 24 Sep 2025 04:44:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v1HMc-0008HV-0h; Wed, 24 Sep 2025 04:44:22 +0000
Received: by outflank-mailman (input) for mailman id 1128903;
 Wed, 24 Sep 2025 04:44:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1tVB=4D=rsg.ci.i.u-tokyo.ac.jp=odaki@srs-se1.protection.inumbo.net>)
 id 1v1HMa-0008Gs-Sd
 for xen-devel@lists.xenproject.org; Wed, 24 Sep 2025 04:44:20 +0000
Received: from www3579.sakura.ne.jp (www3579.sakura.ne.jp [49.212.243.89])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 201c4b3c-9901-11f0-9809-7dc792cee155;
 Wed, 24 Sep 2025 06:44:18 +0200 (CEST)
Received: from h205.csg.ci.i.u-tokyo.ac.jp (h205.csg.ci.i.u-tokyo.ac.jp
 [133.11.54.205]) (authenticated bits=0)
 by www3579.sakura.ne.jp (8.16.1/8.16.1) with ESMTPSA id 58O4bSmv091795
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Wed, 24 Sep 2025 13:37:40 +0900 (JST)
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
X-Inumbo-ID: 201c4b3c-9901-11f0-9809-7dc792cee155
DKIM-Signature: a=rsa-sha256; bh=kiY10umG59rX3Ai7tv8N39IcOWzLTG5ZJdgQouDTy2w=;
        c=relaxed/relaxed; d=rsg.ci.i.u-tokyo.ac.jp;
        h=From:Date:Subject:Message-Id:To;
        s=rs20250326; t=1758688660; v=1;
        b=bYISStphDJwegYwwc2rICh89XnoVbrBbd3Jr4ouFuJjLVwyeUjtqjTleQ7UE6nED
         5vJ/TcBEBn6sqzYTNLaB0oj75gpOKIDdYgCYt5vEDn3Mh8WY/o+35Ii2LIHZkf4e
         i53fFpswin9p5Dm26bNuRVKY1LjWr0XkMmbBPdYo07Jdh9cSvgRGW4Nw0i6V/Sac
         oeN0eaoO9HSSEzaOTVMKg4JVUIVXrmZozVIxOLaPkgluMFw3jzAe5zFT85PN1xe8
         yYj56giV4oVv2QBk7zRIo+fuDGTQ5cYYRBMn5TcacbjlD+WA4psk/qNrLJOGp3yq
         4VVjbYMEuou5BrRW0FwIqw==
From: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
Date: Wed, 24 Sep 2025 13:37:22 +0900
Subject: [PATCH v4 3/7] hw/core/register: Do not unparent in
 instance_finalize()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250924-use-v4-3-07c6c598f53d@rsg.ci.i.u-tokyo.ac.jp>
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

Signed-off-by: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
---
 hw/core/register.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/hw/core/register.c b/hw/core/register.c
index 8f63d9f227c4..3340df70b06e 100644
--- a/hw/core/register.c
+++ b/hw/core/register.c
@@ -314,7 +314,6 @@ RegisterInfoArray *register_init_block64(DeviceState *owner,
 
 void register_finalize_block(RegisterInfoArray *r_array)
 {
-    object_unparent(OBJECT(&r_array->mem));
     g_free(r_array->r);
     g_free(r_array);
 }

-- 
2.51.0


