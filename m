Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B14AB7EEE6
	for <lists+xen-devel@lfdr.de>; Wed, 17 Sep 2025 15:06:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1124993.1467136 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uypdh-0001pd-FZ; Wed, 17 Sep 2025 10:43:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1124993.1467136; Wed, 17 Sep 2025 10:43:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uypdh-0001f7-6x; Wed, 17 Sep 2025 10:43:53 +0000
Received: by outflank-mailman (input) for mailman id 1124993;
 Wed, 17 Sep 2025 10:20:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1BlG=34=rsg.ci.i.u-tokyo.ac.jp=odaki@srs-se1.protection.inumbo.net>)
 id 1uypHL-00076j-TS
 for xen-devel@lists.xenproject.org; Wed, 17 Sep 2025 10:20:47 +0000
Received: from www3579.sakura.ne.jp (www3579.sakura.ne.jp [49.212.243.89])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f80102fe-93af-11f0-9809-7dc792cee155;
 Wed, 17 Sep 2025 12:20:45 +0200 (CEST)
Received: from h205.csg.ci.i.u-tokyo.ac.jp (h205.csg.ci.i.u-tokyo.ac.jp
 [133.11.54.205]) (authenticated bits=0)
 by www3579.sakura.ne.jp (8.16.1/8.16.1) with ESMTPSA id 58HAE8sB093528
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Wed, 17 Sep 2025 19:14:23 +0900 (JST)
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
X-Inumbo-ID: f80102fe-93af-11f0-9809-7dc792cee155
DKIM-Signature: a=rsa-sha256; bh=Nb2IXk8Wd06JvJLljjYiPCsN3a3uINbunrK794JTiso=;
        c=relaxed/relaxed; d=rsg.ci.i.u-tokyo.ac.jp;
        h=From:Date:Subject:Message-Id:To;
        s=rs20250326; t=1758104063; v=1;
        b=Oo5GWWtwzsWYxzsGXA+JY0CJMcCICiVhaS9y1lRGW6PO5yUYUtN7uDfQqIA+lXRU
         Mo+ydn8Pe1RE5VeibUxfmj5y5G6MG0wUf+OtIDjTsYV9r5RXrrMAjWDMp8dKz3yj
         ht41kegl/A3FFKssuK+aJknlqAd3KHu7LRAYDxciSex2hne/1KdIqOXAeuVX1Caj
         Edp+fiXbGzHVqbrHbuqVUH+WZlV97MmCbLcuPv1auKXr0wlmF9c0GsAy+ueVvcIO
         rO3wR19/WdYoURQwly6sr4aZMC4Oj5OmcBHc+GKDta9yK+7chuS/LRxIONFhkHEz
         mhj736rzwMlM6d3TKkXjzw==
From: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
Date: Wed, 17 Sep 2025 19:13:28 +0900
Subject: [PATCH v3 3/7] hw/core/register: Do not unparent in
 instance_finalize()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250917-use-v3-3-72c2a6887c6c@rsg.ci.i.u-tokyo.ac.jp>
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


