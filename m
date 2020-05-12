Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 794151CED70
	for <lists+xen-devel@lfdr.de>; Tue, 12 May 2020 09:01:27 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jYOu0-0004Oy-Jx; Tue, 12 May 2020 07:00:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cB0z=62=gmail.com=philippe.mathieu.daude@srs-us1.protection.inumbo.net>)
 id 1jYOtz-0004Or-GS
 for xen-devel@lists.xenproject.org; Tue, 12 May 2020 07:00:31 +0000
X-Inumbo-ID: 43340e86-941e-11ea-b9cf-bc764e2007e4
Received: from mail-wr1-x443.google.com (unknown [2a00:1450:4864:20::443])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 43340e86-941e-11ea-b9cf-bc764e2007e4;
 Tue, 12 May 2020 07:00:29 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id y3so13931704wrt.1
 for <xen-devel@lists.xenproject.org>; Tue, 12 May 2020 00:00:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uzSFoHvo+LUbrscxwLzY12kA7xl8hv+snls8859rSqE=;
 b=MKr7oaKIpdvu+7LhBS2ehzLga85rG20OmN/PQECwyNW6HJtJzgNbzn6/VSmt4HvpaE
 PCKkjxQ0SA9tDrjwV2vTRFt33MrBgYxXvJmW3xKfeh/jSPmVCKrB3mCNpYWS26HX3o5O
 hlh2XRl77sADIzjOQD3FhYzhGwWsvB5BiIRbRqJcq1rHxnkK6RXA18djF/X0TIRbJyDn
 w32lo0jVIS5hyOvbEactOn62WitR6SoI48eG9jU8v5NFciT+6Ug1P8t2rQ2nPvMv008M
 V6i7jvjYu8DN9SMM2V5Ykxmbtqbcxq4MNOc0Hft0mb7XvhhkZNICRLM4vW532M5F8WP6
 cBgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=uzSFoHvo+LUbrscxwLzY12kA7xl8hv+snls8859rSqE=;
 b=JidafzB5H+LPJQv4oaQ/speldc7wgCoBnvHe6NTVd2t6bP0VNd2QmhRuJidv3fJyBW
 NWCH/skb2TrrfoZFP8redYjvcNlOMwK25QFCDsEGGzDQnlciRcENgefhSlVAPCyTzs1P
 P0n8p37nTfITRxF5WxPGEEKbYSYsjK8BCBMy4VY6KanhQejoXINdKaR6dHC1CzFIdscs
 glkKFiFCYwgsZ4vibO5+mBwHmOOTJhn2W4yyXI4g3Lndc5Ar1VlkFEfO/hKoscMYo3A5
 sGjBil1zgOzYWjgPAGP0Caj/NIFqFbwYeQr9cJVtq8VtlbHJsnyWvQQMgBi/FEE3JtcH
 vTpw==
X-Gm-Message-State: AGi0PuaeVxdWTd54Rfc2aOhZCHmNxYQw2a3I2wyKaeC4SM7gqsXC4jHx
 hEC2raz5MurGrR+ooOU9z+0=
X-Google-Smtp-Source: APiQypIs8M6gmDURfLOfQu5RtZ1Um8Xav+XMDqYjUSpzJEC+9fnPgiw4rV1mWuxxF/9/Y3/iVbp1ow==
X-Received: by 2002:a5d:6b8c:: with SMTP id n12mr23302823wrx.107.1589266828240; 
 Tue, 12 May 2020 00:00:28 -0700 (PDT)
Received: from localhost.localdomain (17.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.17])
 by smtp.gmail.com with ESMTPSA id i17sm30322243wml.23.2020.05.12.00.00.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 May 2020 00:00:27 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 1/3] target: Remove unnecessary CPU() cast
Date: Tue, 12 May 2020 09:00:18 +0200
Message-Id: <20200512070020.22782-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200512070020.22782-1-f4bug@amsat.org>
References: <20200512070020.22782-1-f4bug@amsat.org>
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Paul Durrant <paul@xen.org>,
 Jason Wang <jasowang@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 BALATON Zoltan <balaton@eik.bme.hu>, Gerd Hoffmann <kraxel@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>, qemu-block@nongnu.org,
 qemu-trivial@nongnu.org, David Hildenbrand <david@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Joel Stanley <joel@jms.id.au>, Anthony Perard <anthony.perard@citrix.com>,
 xen-devel@lists.xenproject.org, David Gibson <david@gibson.dropbear.id.au>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Corey Minyard <minyard@acm.org>,
 Richard Henderson <richard.henderson@linaro.org>,
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

which expands to:

  ((CPUState *)object_dynamic_cast_assert((Object *)(obj), (name),
                                          __FILE__, __LINE__, __func__))

This assertion can only fail when @obj points to something other
than its stated type, i.e. when we're in undefined behavior country.

Remove the unnecessary CPU() casts when we already know the pointer
is of CPUState type.

Patch created mechanically using spatch with this script:

  @@
  typedef CPUState;
  CPUState *s;
  @@
  -   CPU(s)
  +   s

Acked-by: David Gibson <david@gibson.dropbear.id.au>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
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
2.21.3


