Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D5F4E1E9987
	for <lists+xen-devel@lfdr.de>; Sun, 31 May 2020 19:39:06 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jfRvI-0003kj-BO; Sun, 31 May 2020 17:39:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yblG=7N=gmail.com=philippe.mathieu.daude@srs-us1.protection.inumbo.net>)
 id 1jfRvH-0003k2-Ak
 for xen-devel@lists.xenproject.org; Sun, 31 May 2020 17:38:59 +0000
X-Inumbo-ID: 8a6dad42-a365-11ea-8993-bc764e2007e4
Received: from mail-wm1-x343.google.com (unknown [2a00:1450:4864:20::343])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8a6dad42-a365-11ea-8993-bc764e2007e4;
 Sun, 31 May 2020 17:38:30 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id r9so8601143wmh.2
 for <xen-devel@lists.xenproject.org>; Sun, 31 May 2020 10:38:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jnJt4nNSB0E2pLIKum3vjItQrLzo5DO2iXhJKs1nBc8=;
 b=kPgx3uRgc7TXjjpq1UvXYDhszlo8l3sRGueug/C8vRhLjgvZQ5Mieac9b318WBFJ2/
 aeYe32r9/P1YQ0T5IBGEZZ7DL+Wy3+63lPgyyyIx0+YmMwTp5IOUGd2IT1wgrMl/x1tR
 KJz6LeuNQroYjMDQHIcgiF8BdxJylz7XpfRhndCHWb8t1o//QCW5SH5/lCsvTvNfTjTe
 II8tGrhBafOYy7pR3oJLWiTvPSFZijdqdapNq7SavzV2LWsL6fiHgv7zZkvxDTXFVwkn
 nhmlNB2/Qmcnalw8/VjytMqmdx2T42K5JNc3hbG2/fcaGN2tjOK+OXLUHm3TmUzbuQVt
 aGQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=jnJt4nNSB0E2pLIKum3vjItQrLzo5DO2iXhJKs1nBc8=;
 b=BclZ/uhSNDChlhpBIjhhQnuYxq1KSsoNlKJtbIHkK4+FDVmiiXv9Qp4gkl6C00h/9n
 VQPd5IJ3KKS41AYyr8eqfQYNMwqDWpJq14KcfybMlakMX0VZeErtC0eWbANfudMW0d+j
 XdME3d1sxdC7WEziyNafl2ycPV05AYZqc7wcbCVfjyWAvas2TbHLer5HaWnFsVZrc7yt
 +YtbPR7a9S4lk5ahPX/xoHhDWvwBFcFjGENqgMp7+5psCvZqwKf84l7fZcNeZzE4lqne
 120q5IGbFJnpNDR97/ipjlG0Fr2TY1zEEUk7Pc71ehJsBSN+JxdCZG61i4W8ZI/21WYK
 f1Dg==
X-Gm-Message-State: AOAM5307va8P9V6xYF0vK/uULZE2df6x/Rro7lHA62di05sB/mOqEspY
 Q5iEJYnoAwWhKKrcZoXj/2A=
X-Google-Smtp-Source: ABdhPJzC9j6ttjFbMxV1i2cC0ijncxDDP5cwavA0spex0KcuX2eB8xIhSwUxzBVMqmUzJNtm/2Oq4w==
X-Received: by 2002:a7b:cc82:: with SMTP id p2mr17828736wma.101.1590946709508; 
 Sun, 31 May 2020 10:38:29 -0700 (PDT)
Received: from localhost.localdomain (43.red-83-51-162.dynamicip.rima-tde.net.
 [83.51.162.43])
 by smtp.gmail.com with ESMTPSA id l19sm7973121wmj.14.2020.05.31.10.38.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 31 May 2020 10:38:28 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 8/8] target/i386/cpu: Use the IEC binary prefix definitions
Date: Sun, 31 May 2020 19:38:14 +0200
Message-Id: <20200531173814.8734-9-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200531173814.8734-1-f4bug@amsat.org>
References: <20200531173814.8734-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Paul Durrant <paul@xen.org>,
 Andrew Jeffery <andrew@aj.id.au>, Helge Deller <deller@gmx.de>,
 "Michael S. Tsirkin" <mst@redhat.com>, Joel Stanley <joel@jms.id.au>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-trivial@nongnu.org, qemu-arm@nongnu.org,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 qemu-ppc@nongnu.org, Richard Henderson <rth@twiddle.net>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

IEC binary prefixes ease code review: the unit is explicit.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/i386/cpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 3733d9a279..33ce4861fb 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -6159,7 +6159,7 @@ static void x86_cpu_machine_done(Notifier *n, void *unused)
     if (smram) {
         cpu->smram = g_new(MemoryRegion, 1);
         memory_region_init_alias(cpu->smram, OBJECT(cpu), "smram",
-                                 smram, 0, 1ull << 32);
+                                 smram, 0, 4 * GiB);
         memory_region_set_enabled(cpu->smram, true);
         memory_region_add_subregion_overlap(cpu->cpu_as_root, 0, cpu->smram, 1);
     }
-- 
2.21.3


