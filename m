Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 41E3E1A60A1
	for <lists+xen-devel@lfdr.de>; Sun, 12 Apr 2020 23:11:01 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jNjrj-0007Da-DG; Sun, 12 Apr 2020 21:10:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=pqw0=54=gmail.com=philippe.mathieu.daude@srs-us1.protection.inumbo.net>)
 id 1jNjrh-00072p-Qs
 for xen-devel@lists.xenproject.org; Sun, 12 Apr 2020 21:10:05 +0000
X-Inumbo-ID: fa21079a-7d01-11ea-83d8-bc764e2007e4
Received: from mail-wr1-x443.google.com (unknown [2a00:1450:4864:20::443])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fa21079a-7d01-11ea-83d8-bc764e2007e4;
 Sun, 12 Apr 2020 21:10:03 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id i10so8378278wrv.10
 for <xen-devel@lists.xenproject.org>; Sun, 12 Apr 2020 14:10:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eWubfF2iDWfZ1hbsO/IXecVFoz0dDRJS/Xj5DAW2JNo=;
 b=TKsyfLjrtirKrDYfamB6nSrrR1fPhrULfxHjh5dsXKznOBbWceZZrZQvEgoeZxVwzh
 lyJwOD9688ualAfVSJptSzKTDdFxJmthHKBJK+Zzg977Bw1z5adwWSDk7qwbN0r+btX/
 VgcDBQWB1idyVqirNa1KnHS0CTnRxSpja5/oIGNROIK0uS38xV2hbPpj/ESifO26aecS
 t++f3fH9j6yhpg5IpeK0CdEbMOlUMsAvicHE/sEEZptPqxP5EE1D4KJgdxQse8zEOmnv
 WuYFZdR7TlOo5Wtd9u6MzWOwp5xvBCfBKt/2HASpFTnxjpmuCx3jFscSZH0JywZchrBM
 nEZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=eWubfF2iDWfZ1hbsO/IXecVFoz0dDRJS/Xj5DAW2JNo=;
 b=oLwgYip9i337YhuotGWwIUz46Bo2ZhGvhRAhvB+a/MR8qSbgO35KCUtuLw08YS15Td
 w0EK4xzo8bDxhiOHoam7cvUn217oKI1fMn0c9whksqDOJRzohVEWkKeX31jy6EUU2l0J
 MekdU+OfZoLXduBIKyR/CJ/8YIiHJZrAarytmAauHSA+FU9bNzx7VHxoGzMutMpUGcaI
 r+V/McGP+ROQYJgcYVml42ybUewa9XVAbbf0mtfrXwRhAwKYdEe5vFqi+RimrXD1jcqi
 drIdSThKeXlJtZhLwUD0a/LCv/lQa/ojcHEa2YHM/Dk/jVyarrVbj/cFGVxqq0eOLZW+
 SZ+g==
X-Gm-Message-State: AGi0PuZim3CAfxE22fM38hSGO7J+ZnWbQEy4VmN1IAsbglvty16C9d44
 aQIyI4Lj1Exh4FtGlXpRk1Q=
X-Google-Smtp-Source: APiQypIm1u1/S0kMjoDLIIDr4V7cLU5DYZtELtqiKjq5NrnqQBzkjtQPdfba4f3psDwbQLE84Uft9A==
X-Received: by 2002:adf:cc8c:: with SMTP id p12mr15464439wrj.165.1586725803042; 
 Sun, 12 Apr 2020 14:10:03 -0700 (PDT)
Received: from localhost.localdomain (116.red-83-42-57.dynamicip.rima-tde.net.
 [83.42.57.116])
 by smtp.gmail.com with ESMTPSA id o16sm12553602wrs.44.2020.04.12.14.09.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Apr 2020 14:10:02 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-5.1 1/3] target: Remove unnecessary CPU() cast
Date: Sun, 12 Apr 2020 23:09:52 +0200
Message-Id: <20200412210954.32313-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200412210954.32313-1-f4bug@amsat.org>
References: <20200412210954.32313-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 David Hildenbrand <david@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 BALATON Zoltan <balaton@eik.bme.hu>, Gerd Hoffmann <kraxel@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>, qemu-block@nongnu.org,
 Paul Durrant <paul@xen.org>, Markus Armbruster <armbru@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Joel Stanley <joel@jms.id.au>, Anthony Perard <anthony.perard@citrix.com>,
 xen-devel@lists.xenproject.org, David Gibson <david@gibson.dropbear.id.au>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Corey Minyard <minyard@acm.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, Peter Chubb <peter.chubb@nicta.com.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 John Snow <jsnow@redhat.com>, Richard Henderson <rth@twiddle.net>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Andrew Jeffery <andrew@aj.id.au>, Cornelia Huck <cohuck@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

The CPU() macro is defined as:

  #define CPU(obj) ((CPUState *)(obj))

Remove an unnecessary CPU() cast.

Patch created mechanically using spatch with this script:

  @@
  typedef CPUState;
  CPUState *s;
  @@
  -   CPU(s)
  +   s

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/ppc/mmu_helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/ppc/mmu_helper.c b/target/ppc/mmu_helper.c
index 86c667b094..8972714775 100644
--- a/target/ppc/mmu_helper.c
+++ b/target/ppc/mmu_helper.c
@@ -1820,7 +1820,7 @@ static inline void do_invalidate_BAT(CPUPPCState *env, target_ulong BATu,
     if (((end - base) >> TARGET_PAGE_BITS) > 1024) {
         /* Flushing 1024 4K pages is slower than a complete flush */
         LOG_BATS("Flush all BATs\n");
-        tlb_flush(CPU(cs));
+        tlb_flush(cs);
         LOG_BATS("Flush done\n");
         return;
     }
-- 
2.21.1


