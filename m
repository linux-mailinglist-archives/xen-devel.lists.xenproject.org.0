Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D77131BB68F
	for <lists+xen-devel@lfdr.de>; Tue, 28 Apr 2020 08:31:05 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jTJlV-0000En-TJ; Tue, 28 Apr 2020 06:30:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wX7d=6M=gmail.com=gorbak25@srs-us1.protection.inumbo.net>)
 id 1jTJkb-0007ym-QT
 for xen-devel@lists.xenproject.org; Tue, 28 Apr 2020 06:29:49 +0000
X-Inumbo-ID: a8812798-8919-11ea-b9cf-bc764e2007e4
Received: from mail-wr1-x444.google.com (unknown [2a00:1450:4864:20::444])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a8812798-8919-11ea-b9cf-bc764e2007e4;
 Tue, 28 Apr 2020 06:29:48 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id k1so23236866wrx.4
 for <xen-devel@lists.xenproject.org>; Mon, 27 Apr 2020 23:29:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6BE++WsHDYO/WOBqJLui7tOCRnqB8ihSSf6W8ZHJC58=;
 b=nM9hl7S7+RQTxl+m0wJsf+Uu39xU2juocV+4M9QJrHIoCFJvGsuda+dbtbNNNC/9/9
 mVR8wmkJ/tJRrYnmlLK4j1TcQwphdLKdugvkCOYO6oZXIfwLH4JGEAQUC0zUS633O5bH
 rLVNnETO10FU58TlVyXSCb4qyjobuNqSUn3sRZ5/M+6BLkAmigKTu/9rErt+DYJgO+x1
 UeiUS5fGO5n2RRKGY0yR8Ubx+h7aTmb3FbV4osINY5RLLa9a371bXCr7MChrtwdPuqoJ
 6utk6llcKNACK+u1/711wpRJJRLljc1j1q5eS+Ai0alnoDUWafB2vpccVKZtKav+Ws+I
 ziIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6BE++WsHDYO/WOBqJLui7tOCRnqB8ihSSf6W8ZHJC58=;
 b=lwt63TqmMIO0TJ2Iia8IDYUwpgclgyDj5BA1eRc+MpGSJmDBmqeRWh7bqXbv/f7l2T
 XlnIruGeIgl4UO58X1uyCrbT8ux2B6EqeWK2WdThCkeEvH1eYKfWx6h6i7HocLs/97Vg
 /ygwc6z1HWJXdg+xuUXpNH2zuPX0n1kpWhJ37HA8hj9eGoSyr8byZrS5LNS7iHWkeo8Y
 3nEsW2687mzOwAsKu93pX7I1R5c4kQAgDLyTg5+GWR3Wev2U3HhjyLi7FGYi6UNq5Xtz
 UhCSngK6xyWbAsAjEbZRbeah+AAWj7RJLZ1/IVgBrbsfZ2Y3jhnMuPPSPHbp6blA8V+d
 e//w==
X-Gm-Message-State: AGi0PuarvOu+Qde1KlRygcQn5ITLbHOWvH0euiIr0KiLhYEDmdf7uVux
 YMdMad9fuel8bXXIgXUePuM=
X-Google-Smtp-Source: APiQypKMJeOYX3PcohWzIS41hAKPeyC3HjuX1SjsDhBdVcAyjumoMDzsHpT/1m0Gnu0C1B4RG+D8jw==
X-Received: by 2002:adf:dd8a:: with SMTP id x10mr31936913wrl.308.1588055387873; 
 Mon, 27 Apr 2020 23:29:47 -0700 (PDT)
Received: from localhost.localdomain (public-gprs351065.centertel.pl.
 [37.47.2.154])
 by smtp.gmail.com with ESMTPSA id a205sm2030564wmh.29.2020.04.27.23.29.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Apr 2020 23:29:47 -0700 (PDT)
From: Grzegorz Uriasz <gorbak25@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/2] Fix QEMU crashes when passing IGD to a guest VM under XEN
Date: Tue, 28 Apr 2020 06:28:45 +0000
Message-Id: <20200428062847.7764-1-gorbak25@gmail.com>
X-Mailer: git-send-email 2.26.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 28 Apr 2020 06:30:43 +0000
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


