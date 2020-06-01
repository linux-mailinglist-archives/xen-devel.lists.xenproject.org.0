Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F1AAC1EA5DC
	for <lists+xen-devel@lfdr.de>; Mon,  1 Jun 2020 16:30:16 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jflRY-0005Ol-B1; Mon, 01 Jun 2020 14:29:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+AG4=7O=gmail.com=philippe.mathieu.daude@srs-us1.protection.inumbo.net>)
 id 1jflRW-0005Og-QM
 for xen-devel@lists.xenproject.org; Mon, 01 Jun 2020 14:29:34 +0000
X-Inumbo-ID: 4fd15c88-a414-11ea-9947-bc764e2007e4
Received: from mail-wm1-x331.google.com (unknown [2a00:1450:4864:20::331])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4fd15c88-a414-11ea-9947-bc764e2007e4;
 Mon, 01 Jun 2020 14:29:33 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id f185so11593464wmf.3
 for <xen-devel@lists.xenproject.org>; Mon, 01 Jun 2020 07:29:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZM7/znQriD0UhsswZg6MLv2Z3oBcZnpOAq0NEHbW664=;
 b=GGgHYPRiatHdFDW9BVH8eF+dSyAynNmKp7tCKjge/3dzd5/m4+sDYh6i+4CuC5eLnk
 d0K9s7FRYLtW94rL93bIkN/F7acb+khmY4E/jXZ1+TK0lKJF6DwpIBoGcy9+FjiVQ8J9
 7rFPUqqlrBtnqHcc5XCpn7TgT39xntNtLVatlVAThT01V8OoIhDmcEhbQwH+v9/vTefx
 QbSfJSl1P16H7ir6sCNJi5IW6OyYMHqgHYolpGT/KvNvl6YtjqK/ZBPCr7uPoowpHCVJ
 jwhp67uNSCvqURSdBp37Z4gJjZsIkxpb3v1DRn+Brn7MWWRG4OMLkp7HpEQbF9T+B8Xc
 fbvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=ZM7/znQriD0UhsswZg6MLv2Z3oBcZnpOAq0NEHbW664=;
 b=ToAZhxgcMOP6nm0qzcBbZ04/H9pJj/A99k7oJr0u+kty4drShD72uJQEe1oeBJEiG+
 bYAkNoD96NbCrhoYf3O2XTErIGkj4u7dH/+/nQB4Ei1Fr3SkJSVTFuqK7ZbAAjyPpwHo
 vhr4pGqgaHssHkeDqSYdAqyMh02Qbu7lxe5DADIkwOl1fi+5tSIMc5xHCCbzYs6OLINg
 EOYQWKeHMztUg7NcwVcPvhksJ9eO/qpHEM0sexpDB1wQQBlQkJyfR9jmWOMwAViKEAE1
 eNIWRxSqI/ynCC84WG9qvbf/R9tnLjgm5CKKGn37/aR491IdfnY+bOeUWq1UPEogaJlz
 ZU+g==
X-Gm-Message-State: AOAM530WV5R5+qBERrXu5GjtoMW/9+JqPhBFQgyAnbHIeKElxWg9Mtj/
 +nMwGlOJZUsJNSxLD0KQj50=
X-Google-Smtp-Source: ABdhPJwufRnQl4HmwANVRDq93UByxPUJbZfC4pM9aQ9eCt/8cwII0ubngoSEbHzq8tnEDNEvDybD9g==
X-Received: by 2002:a1c:998c:: with SMTP id b134mr22850671wme.78.1591021773028; 
 Mon, 01 Jun 2020 07:29:33 -0700 (PDT)
Received: from localhost.localdomain (43.red-83-51-162.dynamicip.rima-tde.net.
 [83.51.162.43])
 by smtp.gmail.com with ESMTPSA id u12sm6824954wrq.90.2020.06.01.07.29.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Jun 2020 07:29:32 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/8] hw: Fix some incomplete memory region size
Date: Mon,  1 Jun 2020 16:29:22 +0200
Message-Id: <20200601142930.29408-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.3
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
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Andrew Jeffery <andrew@aj.id.au>, Helge Deller <deller@gmx.de>,
 Paul Durrant <paul@xen.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-trivial@nongnu.org, qemu-arm@nongnu.org,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Joel Stanley <joel@jms.id.au>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Richard Henderson <rth@twiddle.net>, qemu-ppc@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Series fully reviewed.

Since v1:
- Add parenthesis on the Xen patch (Paul Durrant)
- Add Peter's R-b tags

memory_region_set_size() handle the 16 Exabytes limit by
special-casing the UINT64_MAX value.
This is not a problem for the 32-bit maximum, 4 GiB, but
in some places we incorrectly use UINT32_MAX instead of
4 GiB, and end up missing 1 byte in the memory region.

This series fixes the cases I encountered.
Also included few patches while reviewing, I replaced some
magic values by the IEC binary prefix equivalent.

Regards,

Phil.

Philippe Mathieu-Daudé (8):
  hw/arm/aspeed: Correct DRAM container region size
  hw/pci-host/prep: Correct RAVEN bus bridge memory region size
  hw/pci/pci_bridge: Correct pci_bridge_io memory region size
  hw/pci/pci_bridge: Use the IEC binary prefix definitions
  hw/pci-host: Use the IEC binary prefix definitions
  hw/hppa/dino: Use the IEC binary prefix definitions
  hw/i386/xen/xen-hvm: Use the IEC binary prefix definitions
  target/i386/cpu: Use the IEC binary prefix definitions

 hw/arm/aspeed.c         | 2 +-
 hw/hppa/dino.c          | 4 ++--
 hw/i386/xen/xen-hvm.c   | 3 ++-
 hw/pci-host/i440fx.c    | 3 ++-
 hw/pci-host/prep.c      | 2 +-
 hw/pci-host/q35.c       | 2 +-
 hw/pci-host/versatile.c | 5 +++--
 hw/pci/pci_bridge.c     | 7 ++++---
 target/i386/cpu.c       | 2 +-
 9 files changed, 17 insertions(+), 13 deletions(-)

-- 
2.21.3


