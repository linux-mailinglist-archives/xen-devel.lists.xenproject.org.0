Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 72D83A3A2AD
	for <lists+xen-devel@lfdr.de>; Tue, 18 Feb 2025 17:26:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.891994.1300998 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkQQS-00041J-T6; Tue, 18 Feb 2025 16:26:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 891994.1300998; Tue, 18 Feb 2025 16:26:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkQQS-0003z1-QQ; Tue, 18 Feb 2025 16:26:24 +0000
Received: by outflank-mailman (input) for mailman id 891994;
 Tue, 18 Feb 2025 16:26:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vlVU=VJ=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1tkQQR-0003yu-HM
 for xen-devel@lists.xenproject.org; Tue, 18 Feb 2025 16:26:23 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 16a90943-ee15-11ef-9aa7-95dc52dad729;
 Tue, 18 Feb 2025 17:26:21 +0100 (CET)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-38f2b7ce319so3487735f8f.2
 for <xen-devel@lists.xenproject.org>; Tue, 18 Feb 2025 08:26:21 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38f258dd5acsm15632990f8f.35.2025.02.18.08.26.19
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 18 Feb 2025 08:26:20 -0800 (PST)
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
X-Inumbo-ID: 16a90943-ee15-11ef-9aa7-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739895981; x=1740500781; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2VWhH/aV83Ufh8SIHunv7uipo1SrYPllVbk9DR0oCs0=;
        b=cuZREPs6WZyhzxs3QL8eVfUTYcBULE4xMVFqFkfepJaLVjnvfx/8x4kqE6gneyC+y7
         52spHXHlqE/BpIooefdUeIxT+WVVPxbQC5HBLTucGNM0NAWTUap/1c87Uh/IhkbHIOwg
         zEEboovGvTnd/YL9J5A9XWcTy+9vT1g3LtDty/riB6ZV1vBWcq/P6ykyB0QmkBP7FEBn
         im665Qlj6O9UwU2TADnV3ujUCoc9yppsTcLUfU9oZUr2R5uw2kleY7mp0fKUIXIqxzn9
         1gD98d/jR7CKEGtLZLs3dqkc85WWT1W3jkQkZ+M6QcxaMu2IDNPweJyTzMMSlo6MzlO0
         1p8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739895981; x=1740500781;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2VWhH/aV83Ufh8SIHunv7uipo1SrYPllVbk9DR0oCs0=;
        b=JM5Gsax0+1PWBrtDHjAcHDE7uQMmYqVknld8RNd28bIMuvR+OC2BSK4OW+dVIDsq0F
         TEJUekd7DQzUY3bNeWpiNpamn5A8VMfZbT73majfxImEJ+DC7TtaGRECooYg82MgUz1C
         tJWrz7y+4LyTl/rSojDPFV8iIqhRoUaTpL95aSObOsgECinTrCjvWk1Cn7Bu6dNz0ZU7
         ZYqrBLYMtSEVKk1aesrjnpxSE83PZFYN4yatXQ+XKNj9HqL4dUKMskGroakPe7HM85Ti
         BdPSZtKhnu/O6PGTyAgdSao0oLQUr6vDkTS5r4IYYdwkFCnt9Q+4m9c9q6xTSCa9KLGE
         f+MQ==
X-Forwarded-Encrypted: i=1; AJvYcCVbIENL1K25Qc/+qCEl9iM18anduv7zyD41gY7YXYAdlO2EogM8lVf1f6Lhm4Hqcf8HdSy4ymslUXg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwZGEz+g4L4RlSL6GU1vZ/sNQgIuyMRYOjHI0tO3YVJ9Z5R9BXm
	g6J4y9NnWBDbsJcEvBcevrwUSwUnUkw7+fuOvc9TdQbXvvMw80K0QazlNA/bDH0=
X-Gm-Gg: ASbGnctg+0Lr4PQzmSCwISa5VIv+zOKaAXQD1LPI+uL1YABO/ovi31Xrzq7Xhi4XM0y
	8HTo1CYsK5n2d6QaEt3pHdUtId//e5gaGREtPNi5Kq0OvZrnuTvvBDXSlEpHbugsYtp2eh0NuQ1
	6LHwY/pYVpRbONKnzTTQlCwvWnd7Esir85oBBN4ttfagr3SgdmCPUGKwmHF4YKuCTtIrj5Ui8X9
	csBsbUGqR/bs1cSHIjXc50g+ZmoIhIGa0N5/i6v0sJJg4ILObHsHgXh5g1odA7oqIlaJ8ArU5Xq
	LCHlvbxk3nQJog6rbtt5mf7uyljZCHy42DrkpVUt4jAWBLG5k1htGI+GAbEHyD0BzQ==
X-Google-Smtp-Source: AGHT+IFltgIW1pf2A6pUM0b/oA9q9b3pyi2cmLiOj30p5/uqeQ9g6h67rtI/kDn+UE0OnBoMAdnj3g==
X-Received: by 2002:a05:6000:1565:b0:38f:3e39:20a1 with SMTP id ffacd0b85a97d-38f58782cb8mr86075f8f.11.1739895980927;
        Tue, 18 Feb 2025 08:26:20 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
	xen-devel@lists.xenproject.org,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Anthony PERARD <anthony@xenproject.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Paul Durrant <paul@xen.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Juergen Gross <jgross@suse.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Eduardo Habkost <eduardo@habkost.net>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Vikram Garhwal <vikram.garhwal@bytedance.com>,
	Thomas Huth <thuth@redhat.com>,
	Jan Beulich <jbeulich@suse.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [PATCH 0/8] xen: Build fixes and dust removal
Date: Tue, 18 Feb 2025 17:26:10 +0100
Message-ID: <20250218162618.46167-1-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

Hi,

While preparing another pull request I wanted to run my changes
with Xen and failed at testing on a 32-bit ARM host. Apparently
the config isn't used (at least we don't test it at all since
more than 4 years). Therefore I'm directly dropping it.
The rest are #include and Kconfig cleanups.

Regards,

Phil.

Philippe Mathieu-Daudé (8):
  accel/Kconfig: Link XenPVH with GPEX PCIe bridge
  hw/arm: Do not expose the virt machine on Xen-only binary
  hw/arm/xen-pvh: Do not allow specifying any CPU type
  hw/xen/xen-pvh: Reduce included headers
  hw/xen/xen-hvm: Reduce included headers
  hw/xen/xen-bus: Reduce included headers
  hw/xen/xen-legacy-backend: Remove unused 'net/net.h' header
  meson: Remove support for Xen on 32-bit ARM hosts

 docs/about/removed-features.rst     |  5 +++++
 meson.build                         |  3 ---
 include/hw/xen/xen-bus.h            |  3 ++-
 include/hw/xen/xen-hvm-common.h     | 14 +++-----------
 include/hw/xen/xen-legacy-backend.h |  1 -
 include/hw/xen/xen-pvh-common.h     |  8 ++++----
 hw/arm/xen-pvh.c                    |  2 ++
 hw/arm/xen-stubs.c                  |  5 ++---
 hw/i386/xen/xen-hvm.c               |  5 +++++
 hw/i386/xen/xen-pvh.c               |  1 +
 hw/xen/xen-hvm-common.c             |  6 ++++++
 hw/xen/xen-pvh-common.c             |  6 ++----
 accel/Kconfig                       |  1 +
 hw/arm/Kconfig                      |  1 +
 14 files changed, 34 insertions(+), 27 deletions(-)

-- 
2.47.1


