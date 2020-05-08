Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B0A21CA5B4
	for <lists+xen-devel@lfdr.de>; Fri,  8 May 2020 10:08:17 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jWy2s-0004fn-8E; Fri, 08 May 2020 08:07:46 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EkJI=6W=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1jWy2r-0004fi-1e
 for xen-devel@lists.xenproject.org; Fri, 08 May 2020 08:07:45 +0000
X-Inumbo-ID: fea55bc7-9102-11ea-9fcd-12813bfff9fa
Received: from us-smtp-1.mimecast.com (unknown [207.211.31.81])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id fea55bc7-9102-11ea-9fcd-12813bfff9fa;
 Fri, 08 May 2020 08:07:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588925263;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=lsVYqGBtTkxgpJepH+D6TJxoO78gJAP4vg9zK14/HUc=;
 b=BFOsSxeChGhwyvitefLCkmoIxOsdwRsDiHA0OwZBwPWIkhnxei/Q3QBVF04nZX3sw6kFu4
 JRef51DWnWS1nkaT2TgS5fzUWJQIUtU4hayBYeUoqfX/WVK4KBZFMmnzKz2nYeJux1D9ah
 KJS+vrOihfAn2UNvPKcxW8+vpuXvBQs=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-451-Qc-WHqHzMhiYSOsomuqowA-1; Fri, 08 May 2020 04:07:41 -0400
X-MC-Unique: Qc-WHqHzMhiYSOsomuqowA-1
Received: by mail-wr1-f71.google.com with SMTP id g10so514129wrr.10
 for <xen-devel@lists.xenproject.org>; Fri, 08 May 2020 01:07:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zjPOOqjFPt4tAr2EgDf+wraBoTpFRAsGJe9UIuI6ceQ=;
 b=bZerd3EaqWHyZDIfUVm4SNyCRL2xV68BDBgGWiVT2oNjMZD89h8HKSs986AlfdCxDl
 VEdAhuamCmcJNykppYUfUt09Eq+GZyhf9awRsZKCVPrlSXnPmtaYCwS+qpddo5TWqrjc
 Wlf5hbYo/NnZKkiICSWt36k6iTC9NSHP+sVLiZdl0QC57ybcW/52krW9cs1s+b8xZj6L
 eTA9zw3vcKoN89Q6Dj/OqQm7VR10EsOadwBHWwNV25WRAX8VlhvJkJNSGdKZDbUJX2Y6
 Bf1KLI/j3fZaHlvMKdjLCnTh9VSRVYUKO7cOlru0MPgPPPlhvN5qvohencoZ03ryULrB
 sHkA==
X-Gm-Message-State: AGi0PubFagOQbLfDxW2IVZnxfqSZh5Hq/W31+DJzrvLtjkwO+x34tJGa
 sYK1SsGaNJhgv1o86SKTZGfxr6/xeoaKhFqBHtKlVeONRBlanc/+Q7L73Oh3cRHcXE7bCRzXEd2
 cIXS7grmuOCw/9kzoaMoJ5VfmcsI=
X-Received: by 2002:a7b:cbc6:: with SMTP id n6mr15838021wmi.155.1588925260460; 
 Fri, 08 May 2020 01:07:40 -0700 (PDT)
X-Google-Smtp-Source: APiQypIe+hKHXvjzeDcgPVLdfTohkt78fgSMzmCSKrRSdn3j/e/e+bwypmyK/i5YdwMWhV4+LWV5Tg==
X-Received: by 2002:a7b:cbc6:: with SMTP id n6mr15837999wmi.155.1588925260304; 
 Fri, 08 May 2020 01:07:40 -0700 (PDT)
Received: from x1w.redhat.com (17.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.17])
 by smtp.gmail.com with ESMTPSA id b82sm12514617wmh.1.2020.05.08.01.07.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 May 2020 01:07:39 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/2] accel: Move Xen accelerator code under accel/xen/
Date: Fri,  8 May 2020 10:07:36 +0200
Message-Id: <20200508080738.2646-1-philmd@redhat.com>
X-Mailer: git-send-email 2.21.3
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Paul Durrant <paul@xen.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, xen-devel@lists.xenproject.org,
 Anthony Perard <anthony.perard@citrix.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 Richard Henderson <rth@twiddle.net>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Supersedes: <20200507155813.16169-1-philmd@redhat.com>

Philippe Mathieu-Daud=C3=A9 (2):
  exec: Check Xen is enabled before calling the Xen API
  accel: Move Xen accelerator code under accel/xen/

 include/exec/ram_addr.h                    | 10 ++++--
 include/hw/xen/xen.h                       | 11 ------
 include/sysemu/xen.h                       | 40 ++++++++++++++++++++++
 hw/xen/xen-common.c =3D> accel/xen/xen-all.c |  3 ++
 hw/acpi/piix4.c                            |  2 +-
 hw/i386/pc.c                               |  1 +
 hw/i386/pc_piix.c                          |  1 +
 hw/i386/pc_q35.c                           |  1 +
 hw/i386/xen/xen-hvm.c                      |  1 +
 hw/i386/xen/xen_platform.c                 |  1 +
 hw/isa/piix3.c                             |  1 +
 hw/pci/msix.c                              |  1 +
 migration/savevm.c                         |  2 +-
 softmmu/vl.c                               |  2 +-
 stubs/xen-hvm.c                            |  9 -----
 target/i386/cpu.c                          |  2 +-
 MAINTAINERS                                |  2 ++
 accel/Makefile.objs                        |  1 +
 accel/xen/Makefile.objs                    |  1 +
 hw/xen/Makefile.objs                       |  2 +-
 20 files changed, 66 insertions(+), 28 deletions(-)
 create mode 100644 include/sysemu/xen.h
 rename hw/xen/xen-common.c =3D> accel/xen/xen-all.c (99%)
 create mode 100644 accel/xen/Makefile.objs

--=20
2.21.3


