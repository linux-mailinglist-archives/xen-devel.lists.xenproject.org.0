Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C13F27BB9D3
	for <lists+xen-devel@lfdr.de>; Fri,  6 Oct 2023 15:55:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.613635.954294 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qolHT-0005yt-R8; Fri, 06 Oct 2023 13:54:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 613635.954294; Fri, 06 Oct 2023 13:54:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qolHT-0005x5-OO; Fri, 06 Oct 2023 13:54:15 +0000
Received: by outflank-mailman (input) for mailman id 613635;
 Fri, 06 Oct 2023 13:54:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+U/E=FU=cloud.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1qolHR-0005wz-TH
 for xen-devel@lists.xenproject.org; Fri, 06 Oct 2023 13:54:14 +0000
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d2eb3dfc-644f-11ee-9b0d-b553b5be7939;
 Fri, 06 Oct 2023 15:54:10 +0200 (CEST)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-3214cdb4b27so2048079f8f.1
 for <xen-devel@lists.xenproject.org>; Fri, 06 Oct 2023 06:54:10 -0700 (PDT)
Received: from localhost.localdomain
 (cpc92320-cmbg19-2-0-cust35.5-4.cable.virginm.net. [82.13.64.36])
 by smtp.gmail.com with ESMTPSA id
 g7-20020a056000118700b003143c9beeaesm1716813wrx.44.2023.10.06.06.54.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Oct 2023 06:54:08 -0700 (PDT)
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
X-Inumbo-ID: d2eb3dfc-644f-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1696600449; x=1697205249; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pdVnJ3LbpA+IOpEvZoVsmn1JP9gqoux810A5+xViGDc=;
        b=wXNPFxHBLQasaACYS103WA7SYQZTEU/Vcn7jd9RXGFlRuF0edq9g3/KumQTewEx94g
         00r0W7VvaRs9KMRulcNsF32ny6+Oj7WBAx81axQdOk+/5THfKp6DgKrz9quyer1tGBIq
         g4/Fbor8oymVPAgwwYCrmmRgFFMabZuV4qsIk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696600449; x=1697205249;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pdVnJ3LbpA+IOpEvZoVsmn1JP9gqoux810A5+xViGDc=;
        b=sYszjhdMQ0STgFRB97NZTCQSyrpchx4OBXenUKPi/GeTYXOPSupEDLCwnqLz6qmTyl
         MbwDyKAH3feu039kbnUu21DZPLY2JvKQ43GLm7zlvikEX3179JfiTe4a0rA2Dr+S4o1r
         Ab1S4j0s9DjsDmSE6feq6sIAhaxPCqmWPACBzu10aU4lLMggfxF9EPcI9LxZibRZkrMW
         2h9AXwvQxoQV2v2YE0oLnJgnufdUhHzk62yQyeqFsTz1m8wNn7lm2s+Brt0UhsOW/Lje
         z8fBpdZhR1zbq2cAyLBqIsUxijGYjoDh3KTHULHF+udpCe7kVe3FPN4GMkvdc12WhYfj
         7L2Q==
X-Gm-Message-State: AOJu0YzsC23/N+19QI75K77q/zY1Cv6EHLcaTeGjJSWSDOb3+L/1Vm8T
	29Fvu4dqytlNpu8yMwmscJT1IcPKWaUkG0bB4Y0=
X-Google-Smtp-Source: AGHT+IH6jRkG2r2yOB28nP4pAJfzl0dKSxJmwlCqN7Srbc6W6hIPYBJfewY7vjlW1IGhVBa85apRrA==
X-Received: by 2002:adf:cc8a:0:b0:319:82c9:8e7d with SMTP id p10-20020adfcc8a000000b0031982c98e7dmr7597360wrj.31.1696600449187;
        Fri, 06 Oct 2023 06:54:09 -0700 (PDT)
From: Anthony PERARD <anthony.perard@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Henry Wang <Henry.Wang@arm.com>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [XEN PATCH] get_maintainer: Add THE REST for sections with reviewers only
Date: Fri,  6 Oct 2023 14:54:06 +0100
Message-Id: <20231006135406.52750-1-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Sometime, a contributer would like to be CCed on part of the changes,
and it could happen that we end-up with a section that doesn't have
any maintainer, but a Ack from a maintainer would still be needed.

Rework get_maintainer so if there's no maintainers beside THE REST, it
doesn't drop THE REST emails.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---

Notes:
    Soon, the RISCV section might be the first (I think) section without
    maintainer and without been nested in another section other than THE
    REST.
    
    Tests by checking that the following comnands returns the expected emails.
    ./scripts/get_maintainer.pl -f tools/libs/Makefile
    ./scripts/get_maintainer.pl -f xen/arch/riscv/Makefile
    ./scripts/get_maintainer.pl -f xen/arch/arm/Makefile
    
    An extra '--sections' argument list all sections, including THE REST.

 scripts/get_maintainer.pl | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/scripts/get_maintainer.pl b/scripts/get_maintainer.pl
index cf629cdf3c..533d0df72a 100755
--- a/scripts/get_maintainer.pl
+++ b/scripts/get_maintainer.pl
@@ -732,8 +732,15 @@ sub get_maintainers {
         my @email_new;
         my $do_replace = 0;
         foreach my $email (@email_to) {
-            if ($email->[1] ne 'supporter:THE REST') {
+            # Replace @email_to list with a list which drop "THE REST" if
+            # there's a role other than "reviewer", that is if there's a
+            # maintainer/supporter in a section other than THE REST.
+            if ($email->[1] ne 'supporter:THE REST' and $email->[1] ne 'reviewer') {
                 $do_replace = 1;
+            }
+            # Prepare a new list without "THE REST", to be used if $do_replace
+            # is true.
+            if ($email->[1] ne 'supporter:THE REST') {
                 push @email_new, $email;
             }
         }
-- 
Anthony PERARD


