Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C17E75BD819
	for <lists+xen-devel@lfdr.de>; Tue, 20 Sep 2022 01:19:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.409032.651920 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oaQ2S-00076x-82; Mon, 19 Sep 2022 23:18:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 409032.651920; Mon, 19 Sep 2022 23:18:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oaQ2S-00074H-3q; Mon, 19 Sep 2022 23:18:56 +0000
Received: by outflank-mailman (input) for mailman id 409032;
 Mon, 19 Sep 2022 23:18:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WN4B=ZW=gmail.com=shentey@srs-se1.protection.inumbo.net>)
 id 1oaQ2Q-0004vz-7N
 for xen-devel@lists.xenproject.org; Mon, 19 Sep 2022 23:18:54 +0000
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [2a00:1450:4864:20::533])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6d5d8fe1-3871-11ed-9647-05401a9f4f97;
 Tue, 20 Sep 2022 01:18:53 +0200 (CEST)
Received: by mail-ed1-x533.google.com with SMTP id m3so1325007eda.12
 for <xen-devel@lists.xenproject.org>; Mon, 19 Sep 2022 16:18:53 -0700 (PDT)
Received: from localhost.localdomain
 (dynamic-078-054-077-055.78.54.pool.telefonica.de. [78.54.77.55])
 by smtp.gmail.com with ESMTPSA id
 rn24-20020a170906d93800b00780f6071b5dsm4800926ejb.188.2022.09.19.16.18.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Sep 2022 16:18:52 -0700 (PDT)
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
X-Inumbo-ID: 6d5d8fe1-3871-11ed-9647-05401a9f4f97
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=5XlQ1VpPqIV9nkbL5heHBJQIeqw1Mqo2GOdHAQq5+II=;
        b=V1Xkq1+a6hse0yYR3fG7QmZf7eJLZ9IHXShDEimvhNxJCgJXQZEhiB7rS29v8mOpv8
         P6Q/NgzpGGR1zjQswFV9oVsIkApjiLp/TuMLa8asbQeDVSJ9xcqsRDBMPPfvubQ/ud8M
         6dma9SHs8xseeoX1geC075YVhTJkg5UYKK9V145qBxKkDYQso+5CEuESYbx9GpS5ITt/
         geAPZY2mvKURWXNpdq+82LS5ePfVg2MiJ8HHMrB93gDn3YIy3WMpYdI3RCQ1Wj2jPwFe
         D51PhycmYQXgI5PX3syysunfpaQHEnp6cVcDiO8I65JrGDV+oaRZA47creHSMX5+vVkK
         EpTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=5XlQ1VpPqIV9nkbL5heHBJQIeqw1Mqo2GOdHAQq5+II=;
        b=yQUShdS5fT3BNKT9Bg5DoZAt98IQLCS+iIujlvkWIRdyk7jNSOwVGQndzJohVO5OYz
         npA/DXcRlGY2Onv9SGDeqFEi0XxA8gKDGsoWXnqp9T5I5rO25WCWIPJHGQELDKfSuRih
         +bf+36lFnvKZ3wZFBRLG7IVbrHpvF8mcZ3aZJYoSOT8cmo2lMVtAEUHEfzWP6RvnAuif
         XbHmfIp3ZGM5HxfXkZWmee9Yd8jroaJZZMgmOg9Kh+FGROMT2K9ewAQpnwxlfkEH4ViH
         H5mfh0v3oQHSSsU3pEcEiA69RHY6ih6bnebav3R5hgjbnNMDZXQTeFGl3B5vyq9980OR
         E63w==
X-Gm-Message-State: ACrzQf1KZS3HRa3w2CodtE/Dp4axDmRCZcFxrla7BmjF1LeJ2SllzjUK
	TEXRPLFNR1Sin4ZKHLRiG50=
X-Google-Smtp-Source: AMsMyM6LQ7zX0snjJOKDhu4y1VtCyR5HxEAeYDZgQV0qmXEZF7bGIa6sBksILYTX9vlQa3QJPxyguw==
X-Received: by 2002:a05:6402:2711:b0:451:327a:365f with SMTP id y17-20020a056402271100b00451327a365fmr17131653edd.315.1663629533162;
        Mon, 19 Sep 2022 16:18:53 -0700 (PDT)
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
Subject: [PATCH 6/9] target/loongarch/cpu: Remove unneeded include directive
Date: Tue, 20 Sep 2022 01:17:17 +0200
Message-Id: <20220919231720.163121-7-shentey@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220919231720.163121-1-shentey@gmail.com>
References: <20220919231720.163121-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The cpu is used in both user and system emulation context while sysbus.h
is system-only. Remove it since it's not needed anyway. Furthermore, it
would cause a compile error in the next commit.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 target/loongarch/cpu.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/target/loongarch/cpu.h b/target/loongarch/cpu.h
index dce999aaac..c9ed2cb3e7 100644
--- a/target/loongarch/cpu.h
+++ b/target/loongarch/cpu.h
@@ -13,7 +13,6 @@
 #include "hw/registerfields.h"
 #include "qemu/timer.h"
 #include "exec/memory.h"
-#include "hw/sysbus.h"
 
 #define IOCSRF_TEMP             0
 #define IOCSRF_NODECNT          1
-- 
2.37.3


