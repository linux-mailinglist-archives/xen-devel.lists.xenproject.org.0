Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1265C1E9981
	for <lists+xen-devel@lfdr.de>; Sun, 31 May 2020 19:39:04 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jfRuf-0003XJ-3O; Sun, 31 May 2020 17:38:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yblG=7N=gmail.com=philippe.mathieu.daude@srs-us1.protection.inumbo.net>)
 id 1jfRud-0003XE-Co
 for xen-devel@lists.xenproject.org; Sun, 31 May 2020 17:38:19 +0000
X-Inumbo-ID: 83958332-a365-11ea-8993-bc764e2007e4
Received: from mail-wr1-x432.google.com (unknown [2a00:1450:4864:20::432])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 83958332-a365-11ea-8993-bc764e2007e4;
 Sun, 31 May 2020 17:38:18 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id p5so3252198wrw.9
 for <xen-devel@lists.xenproject.org>; Sun, 31 May 2020 10:38:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=szrK4QZPlIWx7hRKiEEGeyw3BNLUYHyOmBgpWr2R+Zs=;
 b=RRupkXgrGQxJyX5hU1YPGP3v77tjIwZaUEnwXH0Ycbz02nIC6z6jqL9K8VtpiGoZir
 oA5pe+0bmwn1mXRbgMEVLrpCh0d0sQKIqycavfwLuiXSOjZIKwvCbubwBhoyDEBNPMCT
 s+JJpU2UR3ihqsLIA18rk+lRx9dyVpfl+cDN3EjfVf2e36iXhgEEGnJ27Qv/8ZBGlMox
 ykuYCjITpXiI6USr1w2maE1SCHGk41hkpnblFQV9vLwdJzdQ3YlpFxieC+56rAU2D7yq
 5PNPRsTkvV+wrpFl90mqzCJzSIssp7+Q7OTmU3vfT7rPQLnXsnh1Vs2G+XHB/+/JcrN8
 ISPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=szrK4QZPlIWx7hRKiEEGeyw3BNLUYHyOmBgpWr2R+Zs=;
 b=iaEx/eA5Oy1smoexw5EvhpmlJJan0tebB+f5rkecZP4x1mIqUk3EgCw7eaezH4EF3o
 b1rS6wK4UrjKVfld4D043hpn9ki3OYif1EfNqW7sbFUYNFYQaHNxuB/n8TQBoMJci/Fi
 NE+HSYjon57+mHol8rgyvSQhSmgRSow7ASCLHws3KRQorF0d6BX4GugnT9FvbBWc2rlz
 ouLbeyS5RLOBhpO7JKTADfiAV04TBH1HlhLbTaD9U+u7Sl+Py6o7Y5+FH2Vns0GCrpgh
 4NrUDSO9IFZdiyKhfjql34Q/vsLwtAAzLexX4CMQn7JW544wbRVKPxjqii+8PBwkIDl/
 OLdA==
X-Gm-Message-State: AOAM531O4/O5du2Q7rERE2vP3Mz6Zvn1aViY4BBEOw+iNPp9HXh3jn0m
 fJZ7Qnz5naMuoK426upaSpY=
X-Google-Smtp-Source: ABdhPJzi1VbONK1FgNfUM2ScOB+Tk4wTN8mIKjCc/CNlbtzbBZvFo/IjBHFzqkbrQE86Hdu0UVxctg==
X-Received: by 2002:adf:8b55:: with SMTP id v21mr19093025wra.187.1590946697876; 
 Sun, 31 May 2020 10:38:17 -0700 (PDT)
Received: from localhost.localdomain (43.red-83-51-162.dynamicip.rima-tde.net.
 [83.51.162.43])
 by smtp.gmail.com with ESMTPSA id l19sm7973121wmj.14.2020.05.31.10.38.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 31 May 2020 10:38:16 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/8] hw: Fix some incomplete memory region size
Date: Sun, 31 May 2020 19:38:06 +0200
Message-Id: <20200531173814.8734-1-f4bug@amsat.org>
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


