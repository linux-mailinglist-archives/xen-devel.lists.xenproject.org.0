Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E378CBAA4DB
	for <lists+xen-devel@lfdr.de>; Mon, 29 Sep 2025 20:33:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1133114.1471282 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v3IgJ-0000kA-D6; Mon, 29 Sep 2025 18:33:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1133114.1471282; Mon, 29 Sep 2025 18:33:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v3IgJ-0000iJ-AE; Mon, 29 Sep 2025 18:33:03 +0000
Received: by outflank-mailman (input) for mailman id 1133114;
 Mon, 29 Sep 2025 18:33:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=BPw2=4I=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1v3IgH-0000iD-JH
 for xen-devel@lists.xenproject.org; Mon, 29 Sep 2025 18:33:01 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b89a6882-9d62-11f0-9809-7dc792cee155;
 Mon, 29 Sep 2025 20:32:58 +0200 (CEST)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-46e37d6c21eso33440895e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 29 Sep 2025 11:32:57 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46e56f76b21sm21984265e9.19.2025.09.29.11.32.55
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 29 Sep 2025 11:32:56 -0700 (PDT)
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
X-Inumbo-ID: b89a6882-9d62-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759170777; x=1759775577; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gjcLUmOUJAsFuFPIcikgqMGc8qGXLm4Hg2dBmXJH0DU=;
        b=meIvsQwGc4gZNXGXj3KWvSrqDhZ4CX5WeCucR5ESNGsJrjbEl0qB3FOsBCMRTdDDQa
         DEhRan4xo2qb6KA0wacZpxDdLCVdi9rJPBaBF9zT450T61pFATSQ6axJ+a4BP+UbfSDX
         cwaCM7lCiLJdqUqaIXah+Gc9fMUrDa10U5CAf+sbT7dNfpBKV7ip5qIU7EtWpVMKhX1C
         oWzpHp5j74WCoSpm3OYerEH2zlwKd8AvN0jHy9twe7wPJW8ZU4Qu88qY2Yz1g2fsJZf0
         ibTR9ZPTjLeuexcTfJU0g9rQ8Z/HglDqH+uatSkUqtzu8cWx60ZcKiZBoQM9K6R5JJ/q
         MpYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759170777; x=1759775577;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gjcLUmOUJAsFuFPIcikgqMGc8qGXLm4Hg2dBmXJH0DU=;
        b=hSBiiiiaEacoWd+H30/CccrxYWLYIhdPmI9UnkhDa7BN4lcW5llZSvZQ5RhSCPmQHb
         Vs4qWEBMnPFkPNNifIewfrmTT/6LNEPSLJkeGamIbAS4uO50K/bDm4bBVAcDTqlWmAB6
         c2ICU/WxIWo7MjyOZsTbNl344ANkEYX1/2puY6XeeIDfk+JL6wmmY6iqHA4/+waWJo8i
         +unMzdF0HPhIC2LxbRCg/y5Lk8QwgWI2svelFYodhDp5YveNh2rd3uHIFvBbZP6PT6mx
         6oi0hmcbaVQGtUeHoVx2PBMK0ScIIKOU4jadQQKPXahkZfxbpgKR9jd/JvKsSs1TUogk
         crkQ==
X-Forwarded-Encrypted: i=1; AJvYcCU16exZ0M4a9XMG8jnvc8CG8+etAfGlrUi5q6Igm1VUw3A+G0whD3cZRrSbNJahb4yiEFIVmu4tm+M=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyBQRZcCaDnBydAAIVJiqCYnO0QnQdZOzxQ0fo6KqGj0G/HQq57
	ZglNqrLmaYG8z7+2My/wEFyTYcjVCNqhq2ZgsDHZzj7GZvd0CNgyjb2VBxHDFhBTUGs=
X-Gm-Gg: ASbGncsh6Zh7SB1CC1YLfCyqyZClfU0wP1tAt6B6H+Su2SP7r5/8HObsYLUdfnnRuOE
	zm65V586mocEB8lJnI1HJ7f7AXwd7r/0RiXfBJUPW1+986MFSvFXM5wQm8UGmiq+Yq1akrEZhu3
	ah1+qHRLZwCmHaQWohdJMEbOX9+wN3GSEf/0yt/K3G7boBFeT2+6RhHP6+I/zF2cE0StuKdgLZC
	TpGcAsmYGF29s9TjP/x7VvyE3GgH0kr310pFLHYfs1olqhy4+/UIjahbGXmM1LMXDARWwMtb3rK
	lBTKzTU2FFjasnIuEiDiqvCP7BXmP9Udp3REHhcEc7xgiz6RAEvShFUzApKPvoKbvEI/g4DmKv2
	ZMMtK/9PphKQzaCZaA1XnQft00H7C0kDUAlOoBBAv7XRAkk5+5rofhuJ6dbfbEd2P4kcmJVZ1
X-Google-Smtp-Source: AGHT+IGPwe4k1nSiLo3Q7fXg2P2eLKRZ1aglm2SdrtFWVXuSkGkjq+3L8RzYMElaCZp3EfcaDxFBpg==
X-Received: by 2002:a05:600c:350b:b0:46e:36fa:6b40 with SMTP id 5b1f17b1804b1-46e36fa6c4emr125120035e9.24.1759170777268;
        Mon, 29 Sep 2025 11:32:57 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Stefano Garzarella <sgarzare@redhat.com>,
	Reinoud Zandijk <reinoud@netbsd.org>,
	David Hildenbrand <david@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	Sunil Muthuswamy <sunilmut@microsoft.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	David Woodhouse <dwmw2@infradead.org>,
	kvm@vger.kernel.org,
	Eric Farman <farman@linux.ibm.com>,
	Zhao Liu <zhao1.liu@intel.com>,
	xen-devel@lists.xenproject.org,
	Paul Durrant <paul@xen.org>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Halil Pasic <pasic@linux.ibm.com>,
	Jason Herne <jjherne@linux.ibm.com>,
	Marcelo Tosatti <mtosatti@redhat.com>,
	Thomas Huth <thuth@redhat.com>,
	Anthony PERARD <anthony@xenproject.org>,
	qemu-s390x@nongnu.org,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Peter Xu <peterx@redhat.com>,
	Matthew Rosato <mjrosato@linux.ibm.com>
Subject: [PATCH 00/15] system/physmem: Remove cpu_physical_memory _is_io() and _rw()
Date: Mon, 29 Sep 2025 20:32:39 +0200
Message-ID: <20250929183254.85478-1-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

The cpu_physical_memory API is legacy (see commit b7ecba0f6f6):

  ``cpu_physical_memory_*``
  ~~~~~~~~~~~~~~~~~~~~~~~~~

  These are convenience functions which are identical to
  ``address_space_*`` but operate specifically on the system address space,
  always pass a ``MEMTXATTRS_UNSPECIFIED`` set of memory attributes and
  ignore whether the memory transaction succeeded or failed.
  For new code they are better avoided:
  ...

This series removes:
  - cpu_physical_memory_is_io()
  - cpu_physical_memory_rw()
and start converting some
  - cpu_physical_memory_map()
  - cpu_physical_memory_unmap()
calls.

Based-on: <20250922192940.2908002-1-richard.henderson@linaro.org>
          "system/memory: Split address_space_write_rom_internal"

Philippe Mathieu-Daudé (15):
  docs/devel/loads-stores: Stop mentioning
    cpu_physical_memory_write_rom()
  system/memory: Factor address_space_memory_is_io() out
  target/i386/arch_memory_mapping: Use address_space_memory_is_io()
  hw/s390x/sclp: Use address_space_memory_is_io() in sclp_service_call()
  system/physmem: Remove cpu_physical_memory_is_io()
  system/physmem: Pass address space argument to
    cpu_flush_icache_range()
  target/s390x/mmu: Replace [cpu_physical_memory -> address_space]_rw()
  target/i386/whpx: Replace legacy cpu_physical_memory_rw() call
  target/i386/kvm: Replace legacy cpu_physical_memory_rw() call
  target/i386/nvmm: Inline cpu_physical_memory_rw() in nvmm_mem_callback
  hw/xen/hvm: Inline cpu_physical_memory_rw() in rw_phys_req_item()
  system/physmem: Un-inline cpu_physical_memory_read/write()
  system/physmem: Inline cpu_physical_memory_rw() and remove it
  hw/virtio/vhost: Replace legacy cpu_physical_memory_*map() calls
  hw/virtio/virtio: Replace legacy cpu_physical_memory_map() call

 docs/devel/loads-stores.rst            |  6 ++--
 scripts/coccinelle/exec_rw_const.cocci | 22 --------------
 include/exec/cpu-common.h              | 18 ++---------
 include/system/memory.h                | 12 ++++++++
 hw/core/loader.c                       |  2 +-
 hw/s390x/sclp.c                        | 14 ++++++---
 hw/virtio/vhost.c                      |  6 ++--
 hw/virtio/virtio.c                     | 10 +++---
 hw/xen/xen-hvm-common.c                |  8 +++--
 system/physmem.c                       | 42 ++++++++++++++------------
 target/i386/arch_memory_mapping.c      | 10 +++---
 target/i386/kvm/xen-emu.c              |  4 ++-
 target/i386/nvmm/nvmm-all.c            |  5 ++-
 target/i386/whpx/whpx-all.c            |  7 +++--
 target/s390x/mmu_helper.c              |  6 ++--
 15 files changed, 84 insertions(+), 88 deletions(-)

-- 
2.51.0


