Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A9B765BD811
	for <lists+xen-devel@lfdr.de>; Tue, 20 Sep 2022 01:18:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.409016.651866 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oaQ1x-0004ef-Ao; Mon, 19 Sep 2022 23:18:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 409016.651866; Mon, 19 Sep 2022 23:18:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oaQ1x-0004cM-6E; Mon, 19 Sep 2022 23:18:25 +0000
Received: by outflank-mailman (input) for mailman id 409016;
 Mon, 19 Sep 2022 23:18:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WN4B=ZW=gmail.com=shentey@srs-se1.protection.inumbo.net>)
 id 1oaQ1v-0004MC-Iz
 for xen-devel@lists.xenproject.org; Mon, 19 Sep 2022 23:18:23 +0000
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [2a00:1450:4864:20::535])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5affec36-3871-11ed-bad8-01ff208a15ba;
 Tue, 20 Sep 2022 01:18:22 +0200 (CEST)
Received: by mail-ed1-x535.google.com with SMTP id z2so1412038edi.1
 for <xen-devel@lists.xenproject.org>; Mon, 19 Sep 2022 16:18:22 -0700 (PDT)
Received: from localhost.localdomain
 (dynamic-078-054-077-055.78.54.pool.telefonica.de. [78.54.77.55])
 by smtp.gmail.com with ESMTPSA id
 rn24-20020a170906d93800b00780f6071b5dsm4800926ejb.188.2022.09.19.16.18.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Sep 2022 16:18:22 -0700 (PDT)
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
X-Inumbo-ID: 5affec36-3871-11ed-bad8-01ff208a15ba
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=Fjo518UYX1pucjz3VPXRbua9nNVIHRhAk9ua0pzX1XA=;
        b=lbugUhiXpcHvVHxmNQCd7XhVHqDDxchx16Djox3J75B7ePDdncyCGse6eZA2NqPqFh
         hr1ilTebkO5lbr+2+TZ5mEGLS4PtyKRFbfCqqAv12AEVAMkQWO0zrazSj3q2ZqeRKBT/
         NbDJbiJXOnw+DznNgyjbvAx0+B4DavYnJ8efSi50qdYGRhMcVApJ9LYs+43cIJnPnFH9
         p7WTSOkQVMZ/TBIgKfij+g6XFoQIUWCHughrTftkcd/1hY2CNeeMm/CAqplFQVur0kCT
         P6Vi6hDAGyycMZR5ghfx4ycMPoY3eP4zAl+AtKcz4IBZGYhSpX7tdpCvm4nrUNQHxaPV
         fQVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=Fjo518UYX1pucjz3VPXRbua9nNVIHRhAk9ua0pzX1XA=;
        b=JZVvydJR8bFgKXJxRTpjmPA+aLxXk02b1DDdGISGpzrDNOYqcLJThpK63OGc9kBALf
         KfOtv8oux9N3FJsBgKdh21P42gHl3eayJjoYl5dour4jr7Y/WAxUgi+1xEmTPhc8WnmE
         rUTcAVMv6dXu4AhSGex8uv4N1Iub9RfkS4/JcJAX0rFXzkluYdc2ZmOPlyPl8YQgCC5Q
         +mCjOn6qiv8Y3i8XR+pb70a+ZDVn29Evis8iiDEyqDO0lonSGAnC1jdtCQG4y0lSPWKB
         chU1WXngTVHfm3Zj4DpXuGfDKjQlF+ZJVs3k9goFLynhSytBvt/hP9CU1zlIGuAky9DM
         t3ew==
X-Gm-Message-State: ACrzQf0gg9fjqcZEuIUPhoL0b7D3He9uLpkuuQyUFB3n8oeoxD9qss2o
	IlhsiasTm/eG/i5TN32XnMc=
X-Google-Smtp-Source: AMsMyM59+Un1+bbndkQl90bc+w6Ku/wLNzkfWCb5H+mf7flr0JF2IyQRo4Sr55rK2P8tkNt3yzBwMA==
X-Received: by 2002:a50:fc9a:0:b0:454:6a56:7d27 with SMTP id f26-20020a50fc9a000000b004546a567d27mr470765edq.73.1663629502405;
        Mon, 19 Sep 2022 16:18:22 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
	Bandan Das <bsd@redhat.com>,
	Matthew Rosato <mjrosato@linux.ibm.com>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	Sergio Lopez <slp@redhat.com>,
	Alexey Kardashevskiy <aik@ozlabs.ru>,
	Xiaojuan Yang <yangxiaojuan@loongson.cn>,
	Cameron Esfahani <dirty@apple.com>,
	Michael Rolnik <mrolnik@gmail.com>,
	Song Gao <gaosong@loongson.cn>,
	Jagannathan Raman <jag.raman@oracle.com>,
	Greg Kurz <groug@kaod.org>,
	Kamil Rytarowski <kamil@netbsd.org>,
	Peter Xu <peterx@redhat.com>,
	Joel Stanley <joel@jms.id.au>,
	Alistair Francis <Alistair.Francis@wdc.com>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	haxm-team@intel.com,
	Roman Bolshakov <r.bolshakov@yadro.com>,
	Markus Armbruster <armbru@redhat.com>,
	Eric Auger <eric.auger@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	qemu-block@nongnu.org,
	Eduardo Habkost <eduardo@habkost.net>,
	=?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
	qemu-ppc@nongnu.org,
	Cornelia Huck <cohuck@redhat.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Helge Deller <deller@gmx.de>,
	Stefano Stabellini <sstabellini@kernel.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-riscv@nongnu.org,
	Stafford Horne <shorne@gmail.com>,
	Paul Durrant <paul@xen.org>,
	Havard Skinnemoen <hskinnemoen@google.com>,
	Elena Ufimtseva <elena.ufimtseva@oracle.com>,
	Alexander Graf <agraf@csgraf.de>,
	Thomas Huth <thuth@redhat.com>,
	Alex Williamson <alex.williamson@redhat.com>,
	Wenchao Wang <wenchao.wang@intel.com>,
	Tony Krowiak <akrowiak@linux.ibm.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	qemu-s390x@nongnu.org,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Eric Farman <farman@linux.ibm.com>,
	Reinoud Zandijk <reinoud@netbsd.org>,
	Alexander Bulekov <alxndr@bu.edu>,
	Yanan Wang <wangyanan55@huawei.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Gerd Hoffmann <kraxel@redhat.com>,
	Tyrone Ting <kfting@nuvoton.com>,
	xen-devel@lists.xenproject.org,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	John Snow <jsnow@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Darren Kenny <darren.kenny@oracle.com>,
	kvm@vger.kernel.org,
	Qiuhao Li <Qiuhao.Li@outlook.com>,
	John G Johnson <john.g.johnson@oracle.com>,
	Bin Meng <bin.meng@windriver.com>,
	Sunil Muthuswamy <sunilmut@microsoft.com>,
	Max Filippov <jcmvbkbc@gmail.com>,
	qemu-arm@nongnu.org,
	Marcelo Tosatti <mtosatti@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Andrew Jeffery <andrew@aj.id.au>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Halil Pasic <pasic@linux.ibm.com>,
	"Maciej S. Szmigiero" <maciej.szmigiero@oracle.com>,
	Jason Wang <jasowang@redhat.com>,
	David Hildenbrand <david@redhat.com>,
	Laurent Vivier <laurent@vivier.eu>,
	Alistair Francis <alistair@alistair23.me>,
	Jason Herne <jjherne@linux.ibm.com>,
	Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH 1/9] hw/riscv/sifive_e: Fix inheritance of SiFiveEState
Date: Tue, 20 Sep 2022 01:17:12 +0200
Message-Id: <20220919231720.163121-2-shentey@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220919231720.163121-1-shentey@gmail.com>
References: <20220919231720.163121-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

SiFiveEState inherits from SysBusDevice while it's TypeInfo claims it to
inherit from TYPE_MACHINE. This is an inconsistency which can cause
undefined behavior such as memory corruption.

Change SiFiveEState to inherit from MachineState since it is registered
as a machine.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 include/hw/riscv/sifive_e.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/hw/riscv/sifive_e.h b/include/hw/riscv/sifive_e.h
index 83604da805..d738745925 100644
--- a/include/hw/riscv/sifive_e.h
+++ b/include/hw/riscv/sifive_e.h
@@ -22,6 +22,7 @@
 #include "hw/riscv/riscv_hart.h"
 #include "hw/riscv/sifive_cpu.h"
 #include "hw/gpio/sifive_gpio.h"
+#include "hw/boards.h"
 
 #define TYPE_RISCV_E_SOC "riscv.sifive.e.soc"
 #define RISCV_E_SOC(obj) \
@@ -41,7 +42,7 @@ typedef struct SiFiveESoCState {
 
 typedef struct SiFiveEState {
     /*< private >*/
-    SysBusDevice parent_obj;
+    MachineState parent_obj;
 
     /*< public >*/
     SiFiveESoCState soc;
-- 
2.37.3


