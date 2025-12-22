Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CCBA4CD6B06
	for <lists+xen-devel@lfdr.de>; Mon, 22 Dec 2025 17:40:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1192200.1511573 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vXixV-0005Un-IR; Mon, 22 Dec 2025 16:40:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1192200.1511573; Mon, 22 Dec 2025 16:40:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vXixV-0005RI-C0; Mon, 22 Dec 2025 16:40:33 +0000
Received: by outflank-mailman (input) for mailman id 1192200;
 Mon, 22 Dec 2025 16:40:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ACBk=64=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vXixT-0004kh-En
 for xen-devel@lists.xenproject.org; Mon, 22 Dec 2025 16:40:31 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id eb469f45-df54-11f0-9cce-f158ae23cfc8;
 Mon, 22 Dec 2025 17:40:26 +0100 (CET)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-b72b495aa81so685659666b.2
 for <xen-devel@lists.xenproject.org>; Mon, 22 Dec 2025 08:40:26 -0800 (PST)
Received: from fedora (user-109-243-71-38.play-internet.pl. [109.243.71.38])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8037f3e271sm1137038366b.60.2025.12.22.08.40.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Dec 2025 08:40:25 -0800 (PST)
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
X-Inumbo-ID: eb469f45-df54-11f0-9cce-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766421626; x=1767026426; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=J0lqSF3LowgT5w/o27SncoJ4nvC1Ks9j0BUdu4U/rs8=;
        b=lP2Sxj+43kxTvOZ2Ea3v53wU8JQi2xk9GzG21Qh5ooSPGRCIxKfgtBjvjYCZEvAqJp
         NP8V7pF7q9BSWlyyrN4bzf8SVhKpwmu1mo5okepAilwe2BBd6pSHts8yBfbadQdeSm/5
         QWSAbsk8e7A4RjM2qWpNWO/b4Eu1wpTEd/znzVTWrxjhcwFoIiN0We5oNlaFu8Fhcuj5
         pF1/mh9gAr95zp82zfnEt+P2S3x0Jq+fhbV6F5L7YfgPA4Xd8mSIk52uZxNKur/Am2B6
         fSyqU5mCy1+kaWu11A0all/1IOqe/4PbZkUPTPEIuTthb8q7KeQeXQ1aKhDNU530nKMG
         c2Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766421626; x=1767026426;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J0lqSF3LowgT5w/o27SncoJ4nvC1Ks9j0BUdu4U/rs8=;
        b=FJIQRyfewq57D9i9BmvVMThMs6JNDn/i0deiGqXQLKdyOXYTlepo0Sp6kLHTwmsqbA
         xQDTD5ZRPo7VGrte8AF/3QdbbL2oX/eZHOvXoNUCIYXVmsuHKNX0/kcD5abzzLX2u2sH
         1nnNadetAEMZMjevpxT5owlqhZBA/Ecp6WF3wPf+3AlbvlucgcaRnUSgMnV99WVQ5m4y
         G3eAVezIn1m12dYh71h2XxQauw6IA4y6HH1qYmvUhLQiKdvREIMieCM8vuCrcRLlvouf
         oetTSzlBkmCJ0xTPAv6ceu/izTJO8ndhClR4ZEyZDLQ3Xs9hgsxFGGygyq0znWlVh2fd
         6RWA==
X-Gm-Message-State: AOJu0Yy3QtpxRjjuGbXoJ+zxOomj0Oa4b6Lgx523OsJ+yMNd255m62XM
	08CCPskxhfgaqKXKZNxNAsgnUvryR1BVBis1rPwLmn3alr9xNMZ+tF19eSKtqA==
X-Gm-Gg: AY/fxX6j6m79eDIGXS9aXO9lk7XUptViIIF8hlpJ6UGLIkzIOC/bZPlTRvaz7WtEoFi
	5ak/cbHCaHXED96BYCXGbouReCfF8hNQIy/3sFrdq+Jl9kbCRco5Zb1gDtQXAYtovaNxJzuMPTz
	pTa1xco5sD//XkGJ/frhl2Dno7XJGVe56KVLhn9k9svYhicved3o7nBrN2hPm88myp5iwnsg20R
	1XI4i85H5vGdW5SuAAmzGSykBsMbZEGh5PSjOfe3XXgwvXMYjPBtpBDXFTgkXmoSohTJo4+YXWu
	lpCjtyjxammgT+rOXzPdrKYz5qa8Awztw585HeDkh+5VgHFeARivYBeOIT6OVteeDKxqHV+47E3
	Y/6GlV2FixZslmyK9NzcrUMr0ubJgauI9ObsxmZSNPXfl2Hj7DXRWvEpwtXrojOlrmfpcD5WS0x
	zf2wR/DVeflM/O2qYdLNXH9ylHIxjj6sfCMUspEw1rRMjzbKwMETBbRF8=
X-Google-Smtp-Source: AGHT+IE4wbMk7NpxqruoqWKvwE6nd5qAk0AkJrXo/d8jlSh2VoFnM+PpWVLdVGSwT30cAtRhGDHavw==
X-Received: by 2002:a17:906:dc90:b0:b73:21af:99d4 with SMTP id a640c23a62f3a-b8036f96725mr1170033566b.24.1766421625743;
        Mon, 22 Dec 2025 08:40:25 -0800 (PST)
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
Subject: [PATCH v3 0/4] Move alloc/free_vcpu_struct() to common code
Date: Mon, 22 Dec 2025 17:40:10 +0100
Message-ID: <cover.1766404618.git.oleksii.kurochko@gmail.com>
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

CI: https://gitlab.com/xen-project/people/olkur/xen/-/pipelines/2228022495

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


