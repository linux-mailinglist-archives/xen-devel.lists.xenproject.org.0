Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DF43CCCF75
	for <lists+xen-devel@lfdr.de>; Thu, 18 Dec 2025 18:28:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1190022.1510687 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vWHna-0002XU-Sr; Thu, 18 Dec 2025 17:28:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1190022.1510687; Thu, 18 Dec 2025 17:28:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vWHna-0002Uh-Q2; Thu, 18 Dec 2025 17:28:22 +0000
Received: by outflank-mailman (input) for mailman id 1190022;
 Thu, 18 Dec 2025 17:28:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YG3a=6Y=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vWHna-0002UZ-6K
 for xen-devel@lists.xenproject.org; Thu, 18 Dec 2025 17:28:22 +0000
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [2a00:1450:4864:20::529])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f2f839be-dc36-11f0-b15b-2bf370ae4941;
 Thu, 18 Dec 2025 18:28:21 +0100 (CET)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-64175dfc338so1676982a12.0
 for <xen-devel@lists.xenproject.org>; Thu, 18 Dec 2025 09:28:21 -0800 (PST)
Received: from fedora (user-109-243-71-38.play-internet.pl. [109.243.71.38])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-64b585b53c1sm3209423a12.5.2025.12.18.09.28.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Dec 2025 09:28:19 -0800 (PST)
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
X-Inumbo-ID: f2f839be-dc36-11f0-b15b-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766078900; x=1766683700; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tvtRY9zMhGFYrUi8ZWXK2j7PbU+9ofe0PtgkUeWeJTA=;
        b=csKMPgdnBHhrY1A9T8AUjaSXtBdYhLH/wZ36/OS+8B1ZHMLfzMzt64XgtwIQIP6GWj
         AGvS0BXeXJvc0jK9sr2m+AmvBIHQJbPF8skJpXheIeJZNc7MDKdmx+qRGJmPFfAIcYEC
         z1BwBr6j+72Q/9qfEZrolkwdNKBwKU40TOngcV11z2+3qHCEk9g9RP9PiGE9Or3N0leU
         t4BJogZ88yGR4LIBA+a8i0CFEuYCFTksV6d+d39uUUMHon/tVS+p4sIPm69oqH/FqcVc
         Uv1UprT3pzqMgjQ38CKNBoDrXaadZpv+ObQKW9JAOkFAYKsbz5WiJhELC2enMTm5nFN5
         yucw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766078900; x=1766683700;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tvtRY9zMhGFYrUi8ZWXK2j7PbU+9ofe0PtgkUeWeJTA=;
        b=AY8eIULmGA1djtiAnFxX1rGN4sEwFlZkcHnWKceOXOoJ5mXJitQnY5muCv/kbcjG+G
         IJpKFB+bzMzsoNaLm3QFD8W6EGHL8QZBggZ7GcyUtrt+jf0AOfkJE9pU9sRBN3xB3sgz
         XmfNRuxjKwHoTeU81I78hEOAgQo/xnI7l5U27zVBN0KQmD/+eDtoh5UI8oD2c7CBeHpe
         zUvVdo71SabnGd26lL1PPOzPIZS+R5dPQFCHsx8GDwLmApsjNsQeK3bMfHwWSKpBhU0Y
         z6f/RNQW69sXEOAYWT01xH40n2aTDICziWU332PTmoJ9XkNxdbP9jbI3cK3C+uCQlKij
         Ny6w==
X-Gm-Message-State: AOJu0YxWJJSpJoKAUbzhD/y0ls7sEzlRHSEuf6N2Daw9pqYPrtr/21xu
	1bWNl/NL4zc2zWF/k0W880jE1PybyYhqqc9BdwrzoUbjyGDInqgu9uP4T28aOA==
X-Gm-Gg: AY/fxX6km4eYs//jj0yd1gzTL8X+Om8FSDhQ/git9XLjkPnpWeDNwMobil9sucDXnPa
	oh3Bww0Qh69cEjQ3B7u/NG/72BSD0jSF1cJRlZirbr4YjHbWvYxmsSwV0gCm0bAp9Nx45Zd6RHj
	bUkAkvvuF80kiUz0NvsQoyz7IGdfJjWCZ9SvnQGtMwShPWdORqp/3Ka93cqZ11DLx0y+IpR93EY
	WsGB9/p6AfEF+3XOiJFdc/BByEu9GBab+yQQ9mdG+XwEbm5f7aaLvt2AneG8w2MXh6wXzVyz/Io
	OScUrsqbZoHkuv+gM7IngIN8dqlNmUq/Uy+VS0+lWmzR7I+uleYzFZwO5Zp0XfC3Ov+vZSw3zo0
	ti0Wajjh4trRfq/wCyay83pBn0cNi+qcnahRZ0nDPs7kP6DYHpqXZVOQOdPBRJVhP3AOJa7OfJ9
	PU1FUMSFMuIHMAH5IxlOd5U7FSf2kRsoXn5j0zndraPRyL/JHqHlb3q08=
X-Google-Smtp-Source: AGHT+IGPD+oDnTKpEVZLFDRg0kkPGbJ+eCYF3xJoE326ho4SiUlAggTqnnw4hrNZQjAjI0fp6KEJhg==
X-Received: by 2002:a05:6402:146f:b0:64b:7ab2:9f83 with SMTP id 4fb4d7f45d1cf-64b8edb758emr123995a12.31.1766078900141;
        Thu, 18 Dec 2025 09:28:20 -0800 (PST)
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
Subject: [PATCH v2 0/4] Move alloc/free_vcpu_struct() to common code
Date: Thu, 18 Dec 2025 18:28:05 +0100
Message-ID: <cover.1766053253.git.oleksii.kurochko@gmail.com>
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
  xen/arm: optimize the size of struct vcpu
  xen/arm: drop MAX_PAGES_PER_VCPU
  xen: move alloc/free_vcpu_struct() to common code
  xen/common: make {alloc,free}_domain_struct() static

 xen/arch/arm/domain.c             | 32 --------------
 xen/arch/arm/gic-vgic.c           | 48 ++++++++++-----------
 xen/arch/arm/include/asm/domain.h |  2 +-
 xen/arch/arm/vgic-v3.c            | 34 +++++++--------
 xen/arch/arm/vgic.c               | 72 +++++++++++++++++--------------
 xen/arch/arm/vgic/vgic-init.c     | 10 ++++-
 xen/arch/arm/vgic/vgic-v2.c       |  4 +-
 xen/arch/arm/vgic/vgic.c          | 50 ++++++++++-----------
 xen/arch/ppc/stubs.c              | 10 -----
 xen/arch/riscv/stubs.c            | 10 -----
 xen/arch/x86/domain.c             | 17 +-------
 xen/arch/x86/include/asm/domain.h |  3 ++
 xen/common/domain.c               | 26 ++++++++++-
 xen/include/xen/domain.h          |  8 ----
 14 files changed, 145 insertions(+), 181 deletions(-)

-- 
2.52.0


