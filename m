Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FD179ACF6C
	for <lists+xen-devel@lfdr.de>; Wed, 23 Oct 2024 17:51:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.824766.1238949 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t3de4-0005e2-NL; Wed, 23 Oct 2024 15:51:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 824766.1238949; Wed, 23 Oct 2024 15:51:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t3de4-0005bq-KK; Wed, 23 Oct 2024 15:51:36 +0000
Received: by outflank-mailman (input) for mailman id 824766;
 Wed, 23 Oct 2024 15:51:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9cWG=RT=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1t3de3-0005bd-8T
 for xen-devel@lists.xenproject.org; Wed, 23 Oct 2024 15:51:35 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ad91b7b1-9156-11ef-a0be-8be0dac302b0;
 Wed, 23 Oct 2024 17:51:33 +0200 (CEST)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-a99f1fd20c4so942103866b.0
 for <xen-devel@lists.xenproject.org>; Wed, 23 Oct 2024 08:51:33 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9a912ee592sm493214466b.79.2024.10.23.08.51.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Oct 2024 08:51:32 -0700 (PDT)
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
X-Inumbo-ID: ad91b7b1-9156-11ef-a0be-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729698693; x=1730303493; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cG3Nd1yIMK8FzQpFwj6QOUTMN380D85LctnvHR1B1cw=;
        b=EFnRUHisv0UR4c1YcNXfvvA/dhiA+UXj/PTwFMY+Bb9EMW9Hhy+jupbUTMvsE3OEP7
         nHXgsamsVOA4WkrGoBzdsqgIWvcAJwIcstB13C5T3cOk9Z/ciH6s1pOmUOr56rzK9bNf
         FfV0lzkLgc3NZMl98/7di3w7+tAYLR8A3J+C1T2wKNTuphZ56yVx2EPPAtDI8LzUIJRX
         nm//7C3/6wyyscK1L0X2DcoazLuMGLoBFB/x1gzvgWG8E1Jf7SdmiYmMA/f/aiP+6f8r
         y8pRcA+aUvxUGuAnileCKqqF1WwBuurPJqofiIAep0ctmQEKhC3MgCWoHSztC9+Nx44w
         4dSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729698693; x=1730303493;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cG3Nd1yIMK8FzQpFwj6QOUTMN380D85LctnvHR1B1cw=;
        b=FerdeiPwCRs36Ze92eH55MHnkmw5vEG8X7Ez3oLabmsdYh70ZddIjz0A+1AbxJkR5T
         yh036KXG5ONuTlujedTXteM6pGnENYMfgd7p8V8hdRbqOvdVJ+ilc+S0fA/Ka+ulSpEa
         sIMRuIUW1xTC88iBixqk/9trSQ1te7IbidJcByE8FI2ozqwemyL5SwYYKMLsH6iD3cfW
         sO7V7/uSSvzE/9p2OsdhJUVBbFzJP/eL7imlR/ai+nKDoC4cm7jpt2ansRhb1nkuflXS
         eIVe97zRUI4JCarwOgvXp4Xw0jrATdHkBKNvl5ig184CD4SnvZjdP84jw8nytD45BdFD
         oVtA==
X-Gm-Message-State: AOJu0Yx7EwKkQewQspPiBkQ2y+8ZOvr7qTN/g417PClhr+Vs7FUzGmDq
	Yk98AYLnB/3kQEZyAxg+LIjhXlk8CYC2WLxWFyyDqHbPNpybqgc7+m2LiQ==
X-Google-Smtp-Source: AGHT+IEXjtZEvNvhT2dC8yuE2E+E1nOG61XRGZGpg7SD6pUte/51Ch9igaAhIdIFgMwDWNI9uV3sGA==
X-Received: by 2002:a17:907:1ca3:b0:a9a:80f9:d4e0 with SMTP id a640c23a62f3a-a9abf8a3f91mr233926266b.34.1729698692517;
        Wed, 23 Oct 2024 08:51:32 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Connor Davis <connojdavis@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v2 0/3] Setup memory management for RISC-V
Date: Wed, 23 Oct 2024 17:50:21 +0200
Message-ID: <cover.1729697111.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Finish initializing the memory subsystem by mapping the direct map and
frame table.
In the case of RISC-V 64, which has a large virtual address space
(the minimum supported MMU mode is Sv39, providing TB of VA space),
so frame table is mapped starting from physical address
0 to ram_end.
This simplifies the calculations and thereby improves performance for
page_to_mfn(), mfn_to_page() as there is no frametable_base_pdx or
frametable_base_mfn ( if CONFIG_PDX_COMPRESSION=n).
XENHEAP_VIRT_START is introduced which is equal to directmap_virt_start which
is aligned with ram start to have superpages mapping and reduce pressure only
TLB.
In addition, initialize the VMAP_DEFAULT region, finalize the boot allocator,
and update the system state from early_boot to boot.

Introduce share_xen_page_with_guest() to deal with linkage error:
  riscv64-linux-gnu-ld: prelink.o: in function `tasklet_kill':
  /build/xen/common/tasklet.c:176: undefined reference to
     `share_xen_page_with_guest'
  riscv64-linux-gnu-ld: ./.xen-syms.0: hidden symbol `share_xen_page_with_guest'
    isn't defined riscv64-linux-gnu-ld: final link failed: bad value

The function maddr_to_virt() is introduced as part of this patch series, as
setup_directmap_mappings() uses it indirectly through mfn_to_virt().

virt_to_maddr() is updated as it is started to use XENHEAP_VIRT_START which is
introduced in this patch series.

---
Changes in V2:
 - update the cover letter message.
 - merge first 3 patches to "introduce setup_mm()" patch as after setup_mm()
   rework all the things in first two patches of v1 started to use changes
   introduced in "introduce setup_mm()" patch.
 - add Acked-by for some patch series.
 - All other details please look at the specific patch.
---

Oleksii Kurochko (3):
  xen/riscv: introduce setup_mm()
  xen/riscv: initialize the VMAP_DEFAULT virtual range
  xen/riscv: finalize boot allocator and transition to boot state

 xen/arch/riscv/include/asm/config.h |   1 +
 xen/arch/riscv/include/asm/mm.h     |  13 ++-
 xen/arch/riscv/include/asm/setup.h  |   2 +
 xen/arch/riscv/mm.c                 | 132 ++++++++++++++++++++++++++--
 xen/arch/riscv/pt.c                 |   6 ++
 xen/arch/riscv/setup.c              |  14 +++
 xen/arch/riscv/stubs.c              |  10 +++
 7 files changed, 168 insertions(+), 10 deletions(-)

-- 
2.47.0


