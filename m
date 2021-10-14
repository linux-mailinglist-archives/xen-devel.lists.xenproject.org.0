Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C109E42D858
	for <lists+xen-devel@lfdr.de>; Thu, 14 Oct 2021 13:41:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.209270.365674 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1maz6W-0003u3-Ho; Thu, 14 Oct 2021 11:40:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 209270.365674; Thu, 14 Oct 2021 11:40:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1maz6W-0003sG-En; Thu, 14 Oct 2021 11:40:56 +0000
Received: by outflank-mailman (input) for mailman id 209270;
 Thu, 14 Oct 2021 11:40:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+gDO=PC=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1maz6V-0003sA-Gd
 for xen-devel@lists.xenproject.org; Thu, 14 Oct 2021 11:40:55 +0000
Received: from mail-wr1-x433.google.com (unknown [2a00:1450:4864:20::433])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id aae84a1f-e9be-42bc-88db-1b916233777e;
 Thu, 14 Oct 2021 11:40:54 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id y3so18596244wrl.1
 for <xen-devel@lists.xenproject.org>; Thu, 14 Oct 2021 04:40:54 -0700 (PDT)
Received: from otyshchenko.router ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id g16sm2151359wrs.90.2021.10.14.04.40.52
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 14 Oct 2021 04:40:53 -0700 (PDT)
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
X-Inumbo-ID: aae84a1f-e9be-42bc-88db-1b916233777e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id;
        bh=2B6ffoE1T+Ba8jSZoqM2d9GfJE5GrmzdiCnzToqEBN4=;
        b=WSDnXXR7zArz4AlakF7fvJlWYyoGyeZyPPnujPwDjIPb8DqgXYg0LQfhgJE26GXQ/V
         1LQWTVMeNDJdYHbkATPNrsXDWg7pxHhpDY7DYtsGejPnBbB670CiMnvYZaCUEw2gfn5G
         jyC/0l9iSuSGsS+9X75f+DSK6OD+AhrVCzKN8+s51mO7hgGCfjQHiJMAiT85JnjNPQf4
         EzveZHf5ULJJpKE4baZpIc9RgvpIk1YEUs5tUJ+sGJK4nupZABnbNvMqvXemG0fsGLGM
         pQHeHsxIytpxt45ciVDHImUMCdqw1IKrWeRE7QLd5K0qLuiGWwtlWDol0i4eDaJTspnW
         ix+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=2B6ffoE1T+Ba8jSZoqM2d9GfJE5GrmzdiCnzToqEBN4=;
        b=xGLBEcfLq1BrUFXis4snoeqQhLf2izGQfkvA1plst8m4ALAkW+8AQYgJ47/WglHgRh
         fsPaUospeNSt+FL7Ctgp6uwQXoHetJWsIlS5vurkxJ58s7XprNg1YWze0mnTmWWl6QM4
         CE5f+nCZj3c0vSdN61mxV6JM64f5eza2Dn3V2gTBweK3Aw2CYCiIZLF0rswyF+aaKcP+
         jXNT3i3+n5WnoAjvoptanc79GNnJ320QXH9TeOpyoGyb2judX7wdfzO1QiVOXN94xB3+
         CJHlmBgf25XOXf2uVOPhYmAvPa+qcjbEo5dWGkmbeS9YGsjCDBhjfg9hPqzZNilTcira
         K3SA==
X-Gm-Message-State: AOAM531rYK8WHB9mNYijm9T++roK6ZhMVJfEOocoZc2s5mVczxgjHc2c
	75iTica/GTGx4jvsUNhccN5/qrUsWKM=
X-Google-Smtp-Source: ABdhPJxKVZhpO01Gpygyoo1zIaFZvKuAXjU73lrB+UDLxee/mfTyrggtPUkb1Oo8ZDhBi/6zza9YeQ==
X-Received: by 2002:adf:a1cc:: with SMTP id v12mr6229915wrv.48.1634211653404;
        Thu, 14 Oct 2021 04:40:53 -0700 (PDT)
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Juergen Gross <jgross@suse.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Henry Wang <Henry.Wang@arm.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Wei Chen <Wei.Chen@arm.com>
Subject: [PATCH V7 0/2] Add handling of extended regions (safe ranges) on Arm (Was "xen/memory: Introduce a hypercall to provide unallocated space")
Date: Thu, 14 Oct 2021 14:40:43 +0300
Message-Id: <1634211645-26912-1-git-send-email-olekstysh@gmail.com>
X-Mailer: git-send-email 2.7.4

From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

You can find an initial discussion at [1]-[7].

The extended region (safe range) is a region of guest physical address space
which is unused and could be safely used to create grant/foreign mappings instead
of wasting real RAM pages from the domain memory for establishing these mappings.

The extended regions are chosen at the domain creation time and advertised
to it via "reg" property under hypervisor node in the guest device-tree
(the indexes for extended regions are 1...N).
No device tree bindings update is needed, guest infers the presense of extended
regions from the number of regions in "reg" property.
New compatible/property will be needed (but only after this patch [8] or alternative
goes in) to indicate that "region 0 is safe to use". Until this patch is merged it is
not safe to use extended regions for the grant table space.

The extended regions are calculated differently for direct mapped Dom0 (with and without
IOMMU) and non-direct mapped DomUs.

Please note the following limitations:
- The extended region feature is only supported for 64-bit domain currently.
- The ACPI case is not covered.

Please note that support for Dom0 was already committed, so these patches are remaining DomU bits.

Xen patch series is also available at [9]. The corresponding Linux patch series is at [10]
for now (last 4 patches).

Tested on Renesas Salvator-X board + H3 ES3.0 SoC (Arm64) with updated virtio-disk backend [11]
running in Dom0 (256MB RAM) and DomD (2GB RAM). In both cases the backend pre-maps DomU memory
which is 3GB. All foreign memory gets mapped into extended regions (so the amount of RAM in
the backend domain is not reduced). No issues were observed.

[1] https://lore.kernel.org/xen-devel/1627489110-25633-1-git-send-email-olekstysh@gmail.com/
[2] https://lore.kernel.org/xen-devel/1631034578-12598-1-git-send-email-olekstysh@gmail.com/
[3] https://lore.kernel.org/xen-devel/1631297924-8658-1-git-send-email-olekstysh@gmail.com/
[4] https://lore.kernel.org/xen-devel/1632437334-12015-1-git-send-email-olekstysh@gmail.com/
[5] https://lore.kernel.org/xen-devel/1632955927-27911-1-git-send-email-olekstysh@gmail.com/
[6] https://lore.kernel.org/xen-devel/1633519346-3686-1-git-send-email-olekstysh@gmail.com/
[7] https://lore.kernel.org/xen-devel/1633974539-7380-1-git-send-email-olekstysh@gmail.com/
[8] https://lore.kernel.org/xen-devel/1632425551-18910-1-git-send-email-olekstysh@gmail.com/
[9] https://github.com/otyshchenko1/xen/commits/map_opt_ml8
[10] https://github.com/otyshchenko1/linux/commits/map_opt_ml4
[11] https://github.com/otyshchenko1/virtio-disk/commits/map_opt_next

Oleksandr Tyshchenko (2):
  xen/arm: Introduce gpaddr_bits field to struct
    xen_domctl_getdomaininfo
  libxl/arm: Add handling of extended regions for DomU

 tools/include/libxl.h            |   8 +++
 tools/include/xenctrl.h          |   1 +
 tools/libs/ctrl/xc_domain.c      |   1 +
 tools/libs/light/libxl_arm.c     | 106 +++++++++++++++++++++++++++++++++++++--
 tools/libs/light/libxl_domain.c  |   1 +
 tools/libs/light/libxl_types.idl |   1 +
 xen/arch/arm/domctl.c            |   2 +
 xen/arch/x86/domctl.c            |   1 +
 xen/common/domctl.c              |   4 +-
 xen/common/sysctl.c              |   2 +-
 xen/include/public/arch-arm.h    |   5 ++
 xen/include/public/domctl.h      |   3 ++
 xen/include/public/sysctl.h      |   2 +-
 13 files changed, 128 insertions(+), 9 deletions(-)

-- 
2.7.4


