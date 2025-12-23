Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 75E15CDA054
	for <lists+xen-devel@lfdr.de>; Tue, 23 Dec 2025 18:02:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1192704.1511829 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vY5m0-0000tY-Bf; Tue, 23 Dec 2025 17:02:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1192704.1511829; Tue, 23 Dec 2025 17:02:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vY5m0-0000ro-7R; Tue, 23 Dec 2025 17:02:12 +0000
Received: by outflank-mailman (input) for mailman id 1192704;
 Tue, 23 Dec 2025 17:02:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wtgv=65=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vY5ly-0000rG-AS
 for xen-devel@lists.xenproject.org; Tue, 23 Dec 2025 17:02:10 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1d579e5b-e021-11f0-9cce-f158ae23cfc8;
 Tue, 23 Dec 2025 18:02:08 +0100 (CET)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-b7633027cb2so943054766b.1
 for <xen-devel@lists.xenproject.org>; Tue, 23 Dec 2025 09:02:08 -0800 (PST)
Received: from fedora (user-109-243-71-38.play-internet.pl. [109.243.71.38])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b80464e01d9sm1306260566b.42.2025.12.23.09.02.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Dec 2025 09:02:06 -0800 (PST)
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
X-Inumbo-ID: 1d579e5b-e021-11f0-9cce-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766509327; x=1767114127; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AL9s5eQCDlp/jS7cJI39ZlUgxp9ZnoLTFinnEWek9Q4=;
        b=ZbXYL/Rf3AwSYkxtqjtmQzYrzmqpoApu3I0raDp/I4q6wtYwntZyoFGs8RBGWHH+RW
         TKx1v/Yn2lbfDYZnAegR1NGS+64ln/aEAH/qPF/m/40axF57ZADaQ+GDP9CW0Hrix2gE
         h47uZ2IhjUiEtN8VgeYse64VCZG77MPgeQM6l1VZOadOOx4QJb7LhLeUOhqTnNAURYKa
         uEQ+U2k6mXfe9S4yjfY+BthfX7JGgQEYoiPMPUssVyoXd/sMo8OkO7Pu8PbC2lYkiReM
         WAWk8X2OGDDa+39xFdgEty0PztdyQcdHI6qftz6TPjig7ozz/wpLwgSwv/M0Sog0OaH6
         nYSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766509327; x=1767114127;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AL9s5eQCDlp/jS7cJI39ZlUgxp9ZnoLTFinnEWek9Q4=;
        b=WVjz1aPPyRuvEcRcMe4bR/KOHdM7D7dtn23LNCluPXHkcC/CoAOgnhSR13D/zhc++s
         tKcgrTHrrbtfmG8CLW2UcdmhR5RfYqd+yigNFiUYjq0Ya+nQl7WEIbsVxmbSgxIS3FBe
         yjVgEQFhVzv9CdsTGLSCHb2CaF58XFrbmL0ZgQYr37mmf3Iupku2PaUuSzkPf/BIfX/c
         2UhQz3o1JOf3TKNGkOKkWJJJtcQblxQqjMkDjWwhkQaSiZEqwd5DNca4ZWat0gmRWAXh
         +vDTQGNguqr5RA+gNVdROCglGmOIUpqLQSw7BmRaA05h6CTtkr21q3B6lJ2VGlfq6hnI
         1GPA==
X-Gm-Message-State: AOJu0YxLRL4FXnq25S60RSuWcgiNCDIr3rgDdNEMRp8utT2Ktc6iwwcM
	lmegfj6v7zg83Hph+uyA9vjZGw1QtoO0Hl99ltpNs/TwNxvDFedPVdUvu7zkjQ==
X-Gm-Gg: AY/fxX6F4r92kYGlXTjvA+GPOYYnFM4K27vCuPLIjz7K2u/iBfWnKZZqWSICy2JYe3E
	rmQefA99LJwk1M0sp9ujLC1IDs5jefjq0g2Is31UVQ235Sv1MHyS1JmVHEcBBBs16OEwrd+tEVl
	vHgkamB04SF/nJQcqIyrRpwueWEe1GKqP6PajPYAxDbIitzMqMH9aS+2rZhNSbgXajB1ttBSryw
	zy/g9EaKuTDE0e9VrXBGCz42CP9+B9xRsucMFJZgAHMGS3NNml4u+b0hgJGs0OarFvB9KoWwmT4
	Ce5vtZgKULCGMie4anKcEm8QjDYkrcXqrGiyLw0qOnIvcKh3P5JqnV1yVE3CSTrDZUkL9sxHt77
	NzWGmbq/ngF+USEMM7EEWTXVaM3VXACDitvYF3DWgXROfBndJdX8nCOVrpOEJe2pr2vOh8lnDQz
	9FY5POT1hoXUY/d9dQH7NLZrTsthqrYQdNrNSpkcEh+RRIVUgRYADWABc=
X-Google-Smtp-Source: AGHT+IGROxnnp4h9ydnlIrdA9uoJ1oZ1qS8YHrcxvTqsfHiWCiAAs1/4+Qp3mG8237Kv5EQMU+V8ew==
X-Received: by 2002:a17:907:9622:b0:b76:7b85:f630 with SMTP id a640c23a62f3a-b803717a135mr1576602966b.34.1766509327063;
        Tue, 23 Dec 2025 09:02:07 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Timothy Pearson <tpearson@raptorengineering.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Connor Davis <connojdavis@gmail.com>
Subject: [PATCH v4 0/4] Move alloc/free_vcpu_struct() to common code
Date: Tue, 23 Dec 2025 18:01:54 +0100
Message-ID: <cover.1766504313.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As it was suggested in [1] it would be better to allocate one page for struct
vcpu for all arch-es. To do that it is needed to align Arm code to allocate
one page (as there is a case(when CONFIG_NEW_VGIC=y) when Arm64 will require
to allocate two pages). As a result, the following patches for Arm have been
introduced:
 - [PATCH v2 1/4] xen/arm: optimize the size of struct vcpu
 - [PATCH v2 2/4] xen/arm: drop MAX_PAGES_PER_VCPU

This patches are dependency for:
 - [PATCH v2 3/4] xen: move alloc/free_vcpu_struct() to common code

Also, as a part of this patch series another clean up is done which makes
{alloc,free}_domain_struct() static.

[1] https://lore.kernel.org/xen-devel/f8a9be3a-a0c6-496a-806f-40760dca5aee@suse.com/T/#m275dfcbdccef0461fa9a8acef072403f18091768

CI: https://gitlab.com/xen-project/people/olkur/xen/-/pipelines/2230207975

---
Changes in v4:
 - Address the comments recieved for v3.
---
Changes in v3:
 - Come up with a different way to optimize struct vcpu for Arm.
 - Merge patches "[PATCH v2 2/4] xen/arm: drop MAX_PAGES_PER_VCPU]" and
   "[PATCH v2 4/4] xen/common: make {alloc,free}_domain_struct() static"
   together.
 - Clean up vcpu_vgic_free() a little bit.
---
Changes in v2:
 - Introduce new patches for Arm:
     - [PATCH v2 1/4] xen/arm: optimize the size of struct vcpu
     - [PATCH v2 2/4] xen/arm: drop MAX_PAGES_PER_VCPU
    to allocate one page for struct vcpu in common code for all the arch-es.
 - Introduce patch to clean up xen/domain.h a little bit:
     - [PATCH v2 4/4] xen/common: make {alloc,free}_domain_struct() static
 - Address the comments from v1:
     - [PATCH v2 3/4] xen: move alloc/free_vcpu_struct() to common code
---

Oleksii Kurochko (4):
  xen/arm: vcpu_vgic_free() updates
  xen/arm: optimize the size of struct vcpu
  xen: move alloc/free_vcpu_struct() to common code
  xen/common: make {alloc,free}_domain_struct() static

 xen/arch/arm/domain.c               | 32 ---------------
 xen/arch/arm/include/asm/new_vgic.h |  2 +-
 xen/arch/arm/include/asm/vgic.h     |  2 +-
 xen/arch/arm/vgic.c                 |  5 +--
 xen/arch/arm/vgic/vgic-init.c       |  9 ++++-
 xen/arch/ppc/stubs.c                | 10 -----
 xen/arch/riscv/stubs.c              | 10 -----
 xen/arch/x86/domain.c               | 24 -----------
 xen/arch/x86/include/asm/domain.h   | 12 ++++++
 xen/common/domain.c                 | 62 +++++++++++++++++++----------
 xen/include/xen/domain.h            |  8 ----
 11 files changed, 64 insertions(+), 112 deletions(-)

-- 
2.52.0


