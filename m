Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 31BEC5BD815
	for <lists+xen-devel@lfdr.de>; Tue, 20 Sep 2022 01:18:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.409022.651898 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oaQ2F-0005uE-B3; Mon, 19 Sep 2022 23:18:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 409022.651898; Mon, 19 Sep 2022 23:18:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oaQ2F-0005qQ-7p; Mon, 19 Sep 2022 23:18:43 +0000
Received: by outflank-mailman (input) for mailman id 409022;
 Mon, 19 Sep 2022 23:18:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WN4B=ZW=gmail.com=shentey@srs-se1.protection.inumbo.net>)
 id 1oaQ2D-0004MC-7c
 for xen-devel@lists.xenproject.org; Mon, 19 Sep 2022 23:18:41 +0000
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [2a00:1450:4864:20::52f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6580164a-3871-11ed-bad8-01ff208a15ba;
 Tue, 20 Sep 2022 01:18:40 +0200 (CEST)
Received: by mail-ed1-x52f.google.com with SMTP id z13so1318179edb.13
 for <xen-devel@lists.xenproject.org>; Mon, 19 Sep 2022 16:18:40 -0700 (PDT)
Received: from localhost.localdomain
 (dynamic-078-054-077-055.78.54.pool.telefonica.de. [78.54.77.55])
 by smtp.gmail.com with ESMTPSA id
 rn24-20020a170906d93800b00780f6071b5dsm4800926ejb.188.2022.09.19.16.18.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Sep 2022 16:18:39 -0700 (PDT)
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
X-Inumbo-ID: 6580164a-3871-11ed-bad8-01ff208a15ba
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=08Zu8gSbNoVwH6SgINHBVlRGcpHDOzJ+Q2vxMgjaChc=;
        b=LfVaavpRhFpUWtJPmOxeHcORJMDqIlM8LXxn6uYegGeyIw7Hse/ODmgBL9aKBhrBR+
         QDDcqQqAdIZTX3WL1AetyE3jL8Z7UfxdRlbeYmgC3KxoQ1JGUO5P/z0aHKwwmXDVbECj
         AuFfIQm7sMB0W8Fn1uWO/41uzUy2iQROSJACK1zFtCB5Ab5h3m+zMu7WKhoWQK1NOfC6
         FGmzCigSE7vWW/M9qBClZbQwtO4eC/7gkX0vt5SaBL49Jx2Ea8iuUqxrqNunzGJXm1oE
         JWUZFC3ZmBZazxQinxj2ElsyYVRjc4rohZ/gwlRQDOLEWPgCW/Y5CMxXPPgmtldeeeIg
         RE6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=08Zu8gSbNoVwH6SgINHBVlRGcpHDOzJ+Q2vxMgjaChc=;
        b=ne3b8uXK7cG3w9DqD8bw14bQMv6ywk/eJmiWR78no8E7QrdNUwFyVQFxB0UnDztQaO
         3g9+fczmgrAbrSsYrgtsdo4I3PEyGkaXNWz/YzN5xv3YQn4r2IzUgG4K8dkjEK0RhnGB
         s5yNeFbHmEq8Sp+ex679yInzMdeMuYdTY0ci0JQk/tPOPIn5RmWZMNkSKkFxKeK/k31q
         DDe+81mFpLVN9jFhxpYhFMlq3g3suYJ7/a7zKP8ED2k4yf83JeQdG8+X1YvV+t683wJ0
         3nJVCt3PGm4VTAXPxkjfxUIIo8hrzWwtU2OVOeFIpnLKrk8r9TnWvZjpYKwJKSy8PIeb
         rxmw==
X-Gm-Message-State: ACrzQf3ipP9RzL0TbyYsT/Ifqz6vgq+ocXcR39bkSdLVqychBMRvMVRj
	MzsfFtDu5+BG0MgBGwdWJgU=
X-Google-Smtp-Source: AMsMyM6+ebOfksS7/dKAeoPOeQiFYFMU9VBsL7Wg1bKooGg4PafvZv5MknBjnq/lOyGHV8ZLR+girw==
X-Received: by 2002:a05:6402:50ca:b0:451:a711:1389 with SMTP id h10-20020a05640250ca00b00451a7111389mr17116111edb.239.1663629520004;
        Mon, 19 Sep 2022 16:18:40 -0700 (PDT)
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
Subject: [PATCH 4/9] hw/ppc/spapr: Fix code style problems reported by checkpatch
Date: Tue, 20 Sep 2022 01:17:15 +0200
Message-Id: <20220919231720.163121-5-shentey@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220919231720.163121-1-shentey@gmail.com>
References: <20220919231720.163121-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 include/hw/ppc/spapr.h | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/include/hw/ppc/spapr.h b/include/hw/ppc/spapr.h
index 530d739b1d..04a95669ab 100644
--- a/include/hw/ppc/spapr.h
+++ b/include/hw/ppc/spapr.h
@@ -848,7 +848,8 @@ static inline uint64_t ppc64_phys_to_real(uint64_t addr)
 
 static inline uint32_t rtas_ld(target_ulong phys, int n)
 {
-    return ldl_be_phys(&address_space_memory, ppc64_phys_to_real(phys + 4*n));
+    return ldl_be_phys(&address_space_memory,
+                       ppc64_phys_to_real(phys + 4 * n));
 }
 
 static inline uint64_t rtas_ldq(target_ulong phys, int n)
@@ -858,7 +859,7 @@ static inline uint64_t rtas_ldq(target_ulong phys, int n)
 
 static inline void rtas_st(target_ulong phys, int n, uint32_t val)
 {
-    stl_be_phys(&address_space_memory, ppc64_phys_to_real(phys + 4*n), val);
+    stl_be_phys(&address_space_memory, ppc64_phys_to_real(phys + 4 * n), val);
 }
 
 typedef void (*spapr_rtas_fn)(PowerPCCPU *cpu, SpaprMachineState *sm,
-- 
2.37.3


