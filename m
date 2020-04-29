Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 81BE91BD2C3
	for <lists+xen-devel@lfdr.de>; Wed, 29 Apr 2020 05:05:10 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jTd1b-0002uJ-2f; Wed, 29 Apr 2020 03:04:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6cw0=6N=gmail.com=gorbak25@srs-us1.protection.inumbo.net>)
 id 1jTd1Z-0002uE-9H
 for xen-devel@lists.xenproject.org; Wed, 29 Apr 2020 03:04:37 +0000
X-Inumbo-ID: 28467d32-89c6-11ea-ae69-bc764e2007e4
Received: from mail-wr1-x441.google.com (unknown [2a00:1450:4864:20::441])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 28467d32-89c6-11ea-ae69-bc764e2007e4;
 Wed, 29 Apr 2020 03:04:36 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id g13so671771wrb.8
 for <xen-devel@lists.xenproject.org>; Tue, 28 Apr 2020 20:04:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=R6q50vp6hRSEnb/zKd1obSRsfWUOxnyEo7uYejY6auA=;
 b=oVdWbkzK4f0DHuYFQTk7fZkYoaZ/hc+B4N3+gC8aedHEAVltwiJ6rH3phiWtzS80ti
 VaQ19JiC6n8L8cOUt1EuX8o2sbTy+vg7tMlIX5v2vsXmoVmpkhfobBtPVipLCSPfnleN
 dvBKET91uwWTlU12jLpUv3i4wTWBXV2aHAefVCXL8ISwNumcL8RFnrRO0zFqkR2CzDif
 9kocUQWlGooEOaVzGdtzP3eLEHp9QHn0NX+kN61JfLc3DgfMi/yDpBuI1yfDk57wfG2E
 sreTZxKU/vJcPngvcim2Z/QeE3dAU33GKhSQbZ7wzlVfXHzBfJSm38T61sIkCunJ4Iqi
 J0Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=R6q50vp6hRSEnb/zKd1obSRsfWUOxnyEo7uYejY6auA=;
 b=ipar+Ar9g/j8+QSC/XR6QGVS4/NKsk7acUyiWdK9XlhxL0devF21g1NNZVgF9L6hYQ
 Orwima2Q5HUGX6I/HS1lnapLP0xVJKv0tD5WiI52gaGwzJ7JRHioLEeesc9b+CyfnpnC
 ACYDTYX54v+N8GNNevgf+CSCFNzZlNxFJnZ+h/De7YJtgpqlHBOf+qCKMBC8vXqYO27U
 0zrUpPTK+GLoaP9advoFo2N7hXappqYryDvBc+JYlfJ7fuSLdKAjZl4/eOA8EZzrC7hN
 kJgMMjQfCh2yuwi4L42MUU5YEF0Hc1rPHiShPNkUUcGmY/83/N2aAbGuRXynigrbD7w1
 tzLA==
X-Gm-Message-State: AGi0PuZc2CrADqpvFM+gqHeZMmarUmRUxl+ll16WC3bE2eWrQ6amrvMV
 s8Jyy0z1aVU2qzvE/aXSX9I=
X-Google-Smtp-Source: APiQypKh84TmqBY76LL+9V6XYeNoWav0vxXwJ7Fz7g8GT3hJ3Fu0UZxeitOY36z79gZqFKFL1stxCQ==
X-Received: by 2002:adf:e681:: with SMTP id r1mr39637110wrm.213.1588129475663; 
 Tue, 28 Apr 2020 20:04:35 -0700 (PDT)
Received: from localhost.localdomain (public-gprs636909.centertel.pl.
 [5.184.31.46])
 by smtp.gmail.com with ESMTPSA id o6sm19713725wrw.63.2020.04.28.20.04.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Apr 2020 20:04:34 -0700 (PDT)
From: Grzegorz Uriasz <gorbak25@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/2] Fix QEMU crashes when passing IGD to a guest VM under
 XEN
Date: Wed, 29 Apr 2020 03:04:07 +0000
Message-Id: <20200429030409.9406-1-gorbak25@gmail.com>
X-Mailer: git-send-email 2.26.1
MIME-Version: 1.0
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
Cc: artur@puzio.waw.pl, Stefano Stabellini <sstabellini@kernel.org>,
 Paul Durrant <paul@xen.org>, jakub@bartmin.ski,
 marmarek@invisiblethingslab.com, Grzegorz Uriasz <gorbak25@gmail.com>,
 Anthony Perard <anthony.perard@citrix.com>, j.nowak26@student.uw.edu.pl,
 xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

This is the v1 cover letter - the patches now include a detailed description of the changes.

Hi,

This patch series is a small subset of a bigger patch set spanning few projects aiming to isolate the GPU
in QUBES OS to a dedicated security domain. I'm doing this together with 3 colleagues as part of our Bachelors thesis.

When passing an Intel Graphic Device to a HVM guest under XEN, QEMU sometimes crashes
when starting the VM. It turns out that the code responsible for setting up
the legacy VBIOS for the IGD contains a bug which results in a memcpy of an undefined size
between the QEMU heap and the physical memory of the guest.

If the size of the memcpy is small enough qemu does not crash - this means that this
bug is actually a small security issue - a hostile guest kernel might determine the memory layout of
QEMU simply by looking at physical memory beyond 0xdffff - this defeats ASLR and might make exploitation
easier if other issues were to be found.

The problem is the current mechanism for obtaining a copy of the ROM of the IGD.
We first allocate a buffer which holds the vbios - the size of which is obtained from sysfs.
We then try to read the rom from sysfs, if we fail then we just return without setting the size of the buffer.
This would be ok if the size of the ROM reported by sysfs would be 0, but the size is always 32 pages as this corresponds
to legacy memory ranges. It turns out that reading the ROM fails on every single device I've tested(spanning few
generations of IGD), which means qemu never sets the size of the buffer and returns a valid pointer to code which
basically does a memcpy of an undefined size.

I'm including two patches.
The first one fixes the security issue by making failing to read the ROM from sysfs fatal.
The second patch introduces a better method for obtaining the VBIOS. I've haven't yet seen a single device on which
the old code was working, the new code basically creates a shadow copy directly by reading from /dev/mem - this
should be fine as a quick grep of the codebase shows that this approach is already being used to handle MSI.
I've tested the new code on few different laptops and it works fine and the guest VMS finally stopped complaining that
the VBIOS tables are missing.

Grzegorz Uriasz (2):
  Fix undefined behaviour
  Improve legacy vbios handling

 hw/xen/xen_pt.c          |  8 +++++--
 hw/xen/xen_pt_graphics.c | 48 +++++++++++++++++++++++++++++++++++++---
 hw/xen/xen_pt_load_rom.c | 13 +++++------
 3 files changed, 57 insertions(+), 12 deletions(-)

-- 
2.26.1


