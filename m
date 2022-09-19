Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 376D95BD814
	for <lists+xen-devel@lfdr.de>; Tue, 20 Sep 2022 01:18:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.409017.651877 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oaQ24-00051e-Jl; Mon, 19 Sep 2022 23:18:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 409017.651877; Mon, 19 Sep 2022 23:18:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oaQ24-0004xm-G8; Mon, 19 Sep 2022 23:18:32 +0000
Received: by outflank-mailman (input) for mailman id 409017;
 Mon, 19 Sep 2022 23:18:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WN4B=ZW=gmail.com=shentey@srs-se1.protection.inumbo.net>)
 id 1oaQ22-0004vz-4n
 for xen-devel@lists.xenproject.org; Mon, 19 Sep 2022 23:18:30 +0000
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [2a00:1450:4864:20::533])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5ea1020b-3871-11ed-9647-05401a9f4f97;
 Tue, 20 Sep 2022 01:18:29 +0200 (CEST)
Received: by mail-ed1-x533.google.com with SMTP id m3so1324025eda.12
 for <xen-devel@lists.xenproject.org>; Mon, 19 Sep 2022 16:18:28 -0700 (PDT)
Received: from localhost.localdomain
 (dynamic-078-054-077-055.78.54.pool.telefonica.de. [78.54.77.55])
 by smtp.gmail.com with ESMTPSA id
 rn24-20020a170906d93800b00780f6071b5dsm4800926ejb.188.2022.09.19.16.18.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Sep 2022 16:18:28 -0700 (PDT)
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
X-Inumbo-ID: 5ea1020b-3871-11ed-9647-05401a9f4f97
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=YuQwXC400wn1XG3lPzRkN46CWgPRCmkTZD5KrMqPnvc=;
        b=OfOTlhHIdUYcoHKPguW/SrroW/2HH31KpnqDNx1VDOdScP9GFw+hcz6wLKt9qwYKmr
         tUiVUE0COMOBBIwnlZk33ru5T+PAhA69FfCE40NYduQ5A2+ZLn3WJwfMhsySvcTEX8NG
         kUvI2CGts6p4THnGkq0xeeKDTU5xPudeCwmi2+6sBCLSQZmuxjpnNtMXwBahzmJp9kZR
         Ylpol3lEYtvuiLAmcekgtLJXtFpD/8AjmspSTSwXdjX14Lafob9CFzE0RecWT58O2Hq9
         Vl+Tlro5icVzofsz7kyjKQ+0/Ll3mwbPbZepIT1+f4hmtu3MFNqsfZTqVJBagsK7iMxp
         9/+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=YuQwXC400wn1XG3lPzRkN46CWgPRCmkTZD5KrMqPnvc=;
        b=oHE6emLB8xbszUOMZBMgLpLA16eL8iPrP/OxndVlLR5292mfos8tiazfKKR+OGM03l
         N2IFNvAvVhc4Cq9jHO+ul0Lymq698O0vKcFQyFMxy7+5TpYTTpU5K1UMaZIl2ZNQwUf3
         ut7Ncg3HUk2cZ01C0aozZFnew7ZK7TkW5RsjCc9N9sdn6dmSunZJrrt+9hoaOUezYHwN
         v0xziZ14pWKTMN55+yG792Ql7qH+TDL4+gRIuesCUUkb/GEdlpxiuUvn39+b9fj655pk
         64lZxL3YsmMMg9D5f9dIfvHR9RpUJEeI6inl1BYcYfEGGiciQmSEXwBoTtPMMtzrDFuu
         kkKA==
X-Gm-Message-State: ACrzQf3eP0I8zkatJhCIT1X4W/rpcCcmnB4tAk3EeJzD4VP0gGk3i+PG
	EkFBif2Aj5EkIUx0yaeiY6o=
X-Google-Smtp-Source: AMsMyM4dA5dnazvKBz2RVfKC8EJQkafmLFlSOVYf1X2uY4aMLi4DKxlHP7A25Z9KlTvDpLqBqvU2+Q==
X-Received: by 2002:a05:6402:1b06:b0:44e:a073:1dd8 with SMTP id by6-20020a0564021b0600b0044ea0731dd8mr16910792edb.391.1663629508436;
        Mon, 19 Sep 2022 16:18:28 -0700 (PDT)
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
Subject: [PATCH 2/9] exec/hwaddr.h: Add missing include
Date: Tue, 20 Sep 2022 01:17:13 +0200
Message-Id: <20220919231720.163121-3-shentey@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220919231720.163121-1-shentey@gmail.com>
References: <20220919231720.163121-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The next commit would not compile w/o the include directive.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 include/exec/hwaddr.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/exec/hwaddr.h b/include/exec/hwaddr.h
index 8f16d179a8..616255317c 100644
--- a/include/exec/hwaddr.h
+++ b/include/exec/hwaddr.h
@@ -3,6 +3,7 @@
 #ifndef HWADDR_H
 #define HWADDR_H
 
+#include "qemu/osdep.h"
 
 #define HWADDR_BITS 64
 /* hwaddr is the type of a physical address (its size can
-- 
2.37.3


