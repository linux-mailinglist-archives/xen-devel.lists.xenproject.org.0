Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C5157EB26F
	for <lists+xen-devel@lfdr.de>; Tue, 14 Nov 2023 15:38:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.632617.986863 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2uYa-0003dc-Nm; Tue, 14 Nov 2023 14:38:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 632617.986863; Tue, 14 Nov 2023 14:38:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2uYa-0003b6-K6; Tue, 14 Nov 2023 14:38:24 +0000
Received: by outflank-mailman (input) for mailman id 632617;
 Tue, 14 Nov 2023 14:38:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6V1E=G3=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1r2uYZ-0003b0-I0
 for xen-devel@lists.xenproject.org; Tue, 14 Nov 2023 14:38:23 +0000
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [2a00:1450:4864:20::531])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7549639d-82fb-11ee-9b0e-b553b5be7939;
 Tue, 14 Nov 2023 15:38:21 +0100 (CET)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-53d8320f0easo8826642a12.3
 for <xen-devel@lists.xenproject.org>; Tue, 14 Nov 2023 06:38:21 -0800 (PST)
Received: from m1x-phil.lan (cac94-h02-176-184-25-155.dsl.sta.abo.bbox.fr.
 [176.184.25.155]) by smtp.gmail.com with ESMTPSA id
 r17-20020aa7da11000000b0054554a7bbedsm5137696eds.24.2023.11.14.06.38.18
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 14 Nov 2023 06:38:20 -0800 (PST)
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
X-Inumbo-ID: 7549639d-82fb-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699972701; x=1700577501; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FMnSSW8jr/cJKCHmkfkuNGM9r6aQH+5mtjx4iGXWqMs=;
        b=ug+S+JF5YTME10h3AaavGVTS50+Fx1dl08oJgJny0WHWkkHYENOihLTiHpJb9zaUgD
         c79II6O0ljWYaR3kKmD634cdT99UqfGpTS0ZXdhsKK84zk5cqec1I9NMFWaQJnbbXPZO
         hJP99XaqmR0hiWcVs/Arj0bxjVGRC9RtJQO9UHQTmAbCydueaJgdAi3AF3EANuCm8pxt
         Hhghj+/RrECo2nK1bc6o5MhVQfIjDnL7H1LI6zRCGCmiJg0uwNXyGP30lvZG2VBv7RKD
         pTiU5P9ooBCkMV4m1vx0cMPSoo/hxSQPNTvJbpO1x+4HgDpt3rOrXEpSvo1acttYpuJK
         B9AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699972701; x=1700577501;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FMnSSW8jr/cJKCHmkfkuNGM9r6aQH+5mtjx4iGXWqMs=;
        b=QO0OefdzPSDfvu/hn2MJXst0ezM+Pe3HgfGgIo7Xg9F/GxccnO+nCNEh630rvA4tkq
         f3NtVmw8A8TQNvESlntfOQn2XZDgl8cZdLEy839POavaPpI/CiN9o4xO8cwEr+t4lEEd
         NEdC43BqR0NtOT/R/jB+LjC+NkaRHLHb0BNlH9GQ4NaNi04So701fXP1wAUa20oUTOaE
         Wekzoc7tqYPnzyCT2t8fp+BekVN3oivOv5vagt3XZQyd4KP0wtZqIza8nsyXqrXwsTi+
         T6kxmVHu77L3OOKagB0FKXikWx00Mg6FVThMJG4I27CwkX4heGa5hxMEuX4u0D8jJfRG
         9crg==
X-Gm-Message-State: AOJu0Yx1JkZwNNxYIsgBL+BNQHAOM1hCFk45yCwBAtuP2/B8dv8jD954
	7u2eStvCLbfJqYQ/yS5w+zQllA==
X-Google-Smtp-Source: AGHT+IGalhPiUDY/2vhmD3Lr4wAa0t8q7dAjDO0/CMsaGIPZeXHvHP6kcXfcCCLtVPKEbEl31jhTGg==
X-Received: by 2002:aa7:cf12:0:b0:526:9cfb:c12 with SMTP id a18-20020aa7cf12000000b005269cfb0c12mr6182599edy.38.1699972700668;
        Tue, 14 Nov 2023 06:38:20 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: David Woodhouse <dwmw@amazon.co.uk>,
	qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Paul Durrant <paul@xen.org>,
	qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	xen-devel@lists.xenproject.org,
	qemu-block@nongnu.org,
	Anthony Perard <anthony.perard@citrix.com>,
	kvm@vger.kernel.org,
	Thomas Huth <thuth@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH-for-9.0 v2 00/19] hw/xen: Have most of Xen files become target-agnostic
Date: Tue, 14 Nov 2023 15:37:56 +0100
Message-ID: <20231114143816.71079-1-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

Missing review: 4-10,13,16,18-19

Since v1:
- Rework handle_ioreq() patch (Richard)
- Call xen_enabled() and remove various stubs
- Use QEMU_ALIGNED() in xen_blkif header
- Rename ram_memory -> xen_memory
- Have files using Xen API also use its CPPFLAGS
- Add missing license
- Added Avocado tag
- Added R-b tags

Hi,

After discussing with Alex Bennée I realized most Xen code
should be target-agnostic. David Woodhouse confirmed that
last week, so I had a quick look and here is the result.

More work is required to be able to instanciate Xen HW in
an heterogeneous machine, but this doesn't make sense yet
until we can run multiple accelerators concurrently.

Tested running on x86_64/aarch64 Linux hosts:

  $ make check-avocado AVOCADO_TAGS='guest:xen'

Regards,

Phil.

Philippe Mathieu-Daudé (19):
  tests/avocado: Add 'guest:xen' tag to tests running Xen guest
  sysemu/xen: Forbid using Xen headers in user emulation
  sysemu/xen-mapcache: Check Xen availability with
    CONFIG_XEN_IS_POSSIBLE
  system/physmem: Do not include 'hw/xen/xen.h' but 'sysemu/xen.h'
  hw/display: Restrict xen_register_framebuffer() call to Xen
  hw/pci/msi: Restrict xen_is_pirq_msi() call to Xen
  hw/xen: Remove unnecessary xen_hvm_inject_msi() stub
  hw/xen: Remove unused Xen stubs
  hw/block/xen_blkif: Align structs with QEMU_ALIGNED() instead of
    #pragma
  hw/xen: Rename 'ram_memory' global variable as 'xen_memory'
  hw/xen/xen_arch_hvm: Rename prototypes using 'xen_arch_' prefix
  hw/xen: Merge 'hw/xen/arch_hvm.h' in 'hw/xen/xen-hvm-common.h'
  hw/xen: Remove use of 'target_ulong' in handle_ioreq()
  hw/xen: Use target-agnostic qemu_target_page_bits()
  hw/xen: Reduce inclusion of 'cpu.h' to target-specific sources
  hw/xen/xen_pt: Add missing license
  hw/xen: Extract 'xen_igd.h' from 'xen_pt.h'
  hw/i386/xen: Compile 'xen-hvm.c' with Xen CPPFLAGS
  hw/xen: Have most of Xen files become target-agnostic

 hw/block/xen_blkif.h            |  8 +++-----
 hw/xen/xen_pt.h                 | 24 ++++++++++--------------
 include/hw/arm/xen_arch_hvm.h   |  9 ---------
 include/hw/i386/xen_arch_hvm.h  | 11 -----------
 include/hw/xen/arch_hvm.h       |  5 -----
 include/hw/xen/xen-hvm-common.h |  9 +++++++--
 include/hw/xen/xen_igd.h        | 33 +++++++++++++++++++++++++++++++++
 include/sysemu/xen-mapcache.h   |  3 ++-
 include/sysemu/xen.h            |  8 ++++----
 accel/xen/xen-all.c             |  1 +
 hw/arm/xen_arm.c                | 12 ++++++------
 hw/display/vga.c                |  5 ++++-
 hw/i386/pc_piix.c               |  1 +
 hw/i386/xen/xen-hvm.c           | 18 +++++++++---------
 hw/pci/msi.c                    |  3 ++-
 hw/xen/xen-hvm-common.c         | 23 ++++++++++++-----------
 hw/xen/xen_pt.c                 |  3 ++-
 hw/xen/xen_pt_config_init.c     |  3 ++-
 hw/xen/xen_pt_graphics.c        |  3 ++-
 hw/xen/xen_pt_stub.c            |  2 +-
 stubs/xen-hw-stub.c             | 28 ----------------------------
 system/physmem.c                |  2 +-
 accel/xen/meson.build           |  2 +-
 hw/block/dataplane/meson.build  |  2 +-
 hw/i386/xen/meson.build         |  4 +++-
 hw/xen/meson.build              | 21 ++++++++++-----------
 tests/avocado/boot_xen.py       |  3 +++
 tests/avocado/kvm_xen_guest.py  |  1 +
 28 files changed, 121 insertions(+), 126 deletions(-)
 delete mode 100644 include/hw/arm/xen_arch_hvm.h
 delete mode 100644 include/hw/i386/xen_arch_hvm.h
 delete mode 100644 include/hw/xen/arch_hvm.h
 create mode 100644 include/hw/xen/xen_igd.h

-- 
2.41.0


