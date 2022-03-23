Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C6654E5743
	for <lists+xen-devel@lfdr.de>; Wed, 23 Mar 2022 18:18:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.293990.499640 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nX4cW-0004dM-GR; Wed, 23 Mar 2022 17:18:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 293990.499640; Wed, 23 Mar 2022 17:18:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nX4cW-0004a4-C9; Wed, 23 Mar 2022 17:18:04 +0000
Received: by outflank-mailman (input) for mailman id 293990;
 Wed, 23 Mar 2022 17:18:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=s5zF=UC=gmail.com=philippe.mathieu.daude@srs-se1.protection.inumbo.net>)
 id 1nX4cV-0004Zy-Ia
 for xen-devel@lists.xenproject.org; Wed, 23 Mar 2022 17:18:03 +0000
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com
 [2607:f8b0:4864:20::1032])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 317cb5dc-aacd-11ec-a405-831a346695d4;
 Wed, 23 Mar 2022 18:18:02 +0100 (CET)
Received: by mail-pj1-x1032.google.com with SMTP id jx9so2356624pjb.5
 for <xen-devel@lists.xenproject.org>; Wed, 23 Mar 2022 10:18:02 -0700 (PDT)
Received: from localhost.localdomain (198.red-83-50-65.dynamicip.rima-tde.net.
 [83.50.65.198]) by smtp.gmail.com with ESMTPSA id
 p7-20020a17090a2d8700b001c785d6c1ffsm292709pjd.28.2022.03.23.10.17.55
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 23 Mar 2022 10:18:00 -0700 (PDT)
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
X-Inumbo-ID: 317cb5dc-aacd-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+l8uJm4CIqAcDOfVATSJ4rR/JXp8ZgwRxCX0NecHXmE=;
        b=CnJlMkzsqA1I0/mH2Lot6kLWsBC+yd0FigFPsBdJnkvWTCH7AGqvoK/3WSA/+IxdaM
         xzOZ/VWLKH2P+0+bY20wQCU1lvUg8UzUPGW8HGCn0xzOLSPN2nt/ryv4GGzFYdN1tA+j
         Dfuv6ALbCgaaTrVsNykkAPPQy1hp0ahfhA/Z6FXCTCwuKYjAFQuE/tkfghxuOvsYEJ2j
         WQXj4PxLPnHgTxgC34WolXx3T6YRrD4OrtlvBepJ+nquWnqnl6jJX+Uq017Y0DtIUEwx
         08sjphUWRYRsamVcoWbigH5wwmpaIogIzsNhOLxSWdBl46U0PoZkNmoYI8GpEX2N1xKE
         KDRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+l8uJm4CIqAcDOfVATSJ4rR/JXp8ZgwRxCX0NecHXmE=;
        b=5SJYOmDaQKGX7j6rj7m3xereoKqqNwb2TmD0I4Begf+H4OB8rW6eFqD+AdqAVMFXej
         2VXlOluyoWyanoE/CCTRwm2nzwi7xflsA3oFKPERQuzcWxuD+3hRjiTjJNgVBVL+BCXE
         7ZP4EUOabDxlJSS+kwf9aFWe8Vmi3Th4liGHXlZxnEzGKuzbsQ4M9ep1R9sCjRN9Bma+
         n6XekPyiLKxwoRTeY5topuv8RNoLvLqR20HXyvP8U0bKfMssU6MWt9KLu4W+qAj+ZERT
         XaH8/uqKgqka1ye9UnXTpoEIBZowLPEY6DUFfYkBO6zQp1ssBDqnIl8zISLDEdVNtInG
         YIog==
X-Gm-Message-State: AOAM530k9KejGvqplEziJIkuO5qiwmoyIEU/Z3JLJajwyY0d0N9edkDf
	AA9pGvi+6GFSN54tVK7foTE=
X-Google-Smtp-Source: ABdhPJyfNBPOJNSh1Ki6UbOUdxvcE3eiFy8Opq35BV6fw0og6EdkbvGhNha3qWs7W41vFPcTu8uFnQ==
X-Received: by 2002:a17:902:b902:b0:154:bb05:ddb9 with SMTP id bf2-20020a170902b90200b00154bb05ddb9mr1084944plb.14.1648055881126;
        Wed, 23 Mar 2022 10:18:01 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philippe.mathieu.daude@gmail.com>
To: qemu-devel@nongnu.org
Cc: Wenchao Wang <wenchao.wang@intel.com>,
	Laurent Vivier <lvivier@redhat.com>,
	David Hildenbrand <david@redhat.com>,
	Yanan Wang <wangyanan55@huawei.com>,
	Cameron Esfahani <dirty@apple.com>,
	Marcelo Tosatti <mtosatti@redhat.com>,
	Sunil Muthuswamy <sunilmut@microsoft.com>,
	Anthony Perard <anthony.perard@citrix.com>,
	haxm-team@intel.com,
	Paul Durrant <paul@xen.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	xen-devel@lists.xenproject.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	Roman Bolshakov <r.bolshakov@yadro.com>,
	Reinoud Zandijk <reinoud@netbsd.org>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Kamil Rytarowski <kamil@netbsd.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Peter Xu <peterx@redhat.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Thomas Huth <thuth@redhat.com>,
	Colin Xu <colin.xu@intel.com>
Subject: [PATCH v4 00/13] accel: Fix vCPU memory leaks
Date: Wed, 23 Mar 2022 18:17:38 +0100
Message-Id: <20220323171751.78612-1-philippe.mathieu.daude@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

Hi,

This is a respin of Mark 'vCPU hotunplug related memory leaks' v3:
https://lore.kernel.org/qemu-devel/20220321141409.3112932-1-mark.kanda@oracle.com/

Instead I refactored to extract the common common_vcpu_thread_create()
from all accelerators (except TCG/RR, which requires a special-casing).

Not well tested...

Mark Kanda (3):
  cpu: Free cpu->cpu_ases in cpu_address_space_destroy()
  softmmu/cpus: Free cpu->thread in generic_destroy_vcpu_thread()
  softmmu/cpus: Free cpu->halt_cond in generic_destroy_vcpu_thread()

Philippe Mathieu-Daudé (10):
  target/i386/kvm: Free xsave_buf when destroying vCPU
  target/i386/hvf: Free resources when vCPU is destroyed
  accel/hvf: Remove pointless assertion
  accel/tcg: Init TCG cflags in vCPU thread handler
  accel/tcg: Reorganize tcg_accel_ops_init()
  accel-ops: Introduce create_vcpu_thread_precheck / postcheck handlers
  accel/tcg: Extract rr_create_vcpu_thread_precheck()
  accel/all: Extract common_vcpu_thread_create()
  accel-ops: Introduce common_vcpu_thread_destroy() and .precheck
    handler
  accel/tcg: Add rr_destroy_vcpu_thread_precheck()

 accel/accel-softmmu.c             |  2 +-
 accel/dummy-cpus.c                | 15 +----------
 accel/hvf/hvf-accel-ops.c         | 24 +++--------------
 accel/kvm/kvm-accel-ops.c         | 17 +++---------
 accel/qtest/qtest.c               |  3 ++-
 accel/tcg/tcg-accel-ops-mttcg.c   | 27 +++----------------
 accel/tcg/tcg-accel-ops-mttcg.h   |  3 +--
 accel/tcg/tcg-accel-ops-rr.c      | 44 +++++++++++++++----------------
 accel/tcg/tcg-accel-ops-rr.h      |  7 +++--
 accel/tcg/tcg-accel-ops.c         | 22 +++++++++-------
 accel/xen/xen-all.c               |  2 +-
 cpu.c                             |  1 +
 include/exec/cpu-common.h         |  7 +++++
 include/sysemu/accel-ops.h        |  9 ++++++-
 include/sysemu/cpus.h             |  4 +--
 softmmu/cpus.c                    | 40 +++++++++++++++++++++++++---
 softmmu/physmem.c                 |  5 ++++
 target/i386/hax/hax-accel-ops.c   | 20 ++------------
 target/i386/hvf/hvf.c             |  2 ++
 target/i386/kvm/kvm.c             |  2 ++
 target/i386/nvmm/nvmm-accel-ops.c | 17 +++---------
 target/i386/whpx/whpx-accel-ops.c | 20 +++-----------
 22 files changed, 127 insertions(+), 166 deletions(-)

-- 
2.35.1


