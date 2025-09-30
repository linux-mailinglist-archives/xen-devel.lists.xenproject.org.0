Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BFD01BAB4AE
	for <lists+xen-devel@lfdr.de>; Tue, 30 Sep 2025 06:14:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1133432.1471541 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v3Rk6-0006jL-5i; Tue, 30 Sep 2025 04:13:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1133432.1471541; Tue, 30 Sep 2025 04:13:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v3Rk6-0006gL-1w; Tue, 30 Sep 2025 04:13:34 +0000
Received: by outflank-mailman (input) for mailman id 1133432;
 Tue, 30 Sep 2025 04:13:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=MDOg=4J=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1v3Rk4-0006gD-VF
 for xen-devel@lists.xenproject.org; Tue, 30 Sep 2025 04:13:33 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d1ce8993-9db3-11f0-9809-7dc792cee155;
 Tue, 30 Sep 2025 06:13:29 +0200 (CEST)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-46e2826d5c6so40782205e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 29 Sep 2025 21:13:29 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46e5707c1e7sm37549775e9.21.2025.09.29.21.13.27
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 29 Sep 2025 21:13:28 -0700 (PDT)
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
X-Inumbo-ID: d1ce8993-9db3-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759205609; x=1759810409; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LfIkfL6gj/tPGL1om2pz6zaZ+tStdg+utOiTzyFtZrQ=;
        b=K7jpT3DjTJD3s99tOHTZPSGFj6ANryua6Ti9qTDQow7a8PcopqsJl3vDO5Jnr0W6Iv
         iqkZsh1cd6ebDtTP8C7siVY3tEP+bzhOowMuXXbcycijdr5GOBqHuJcloxZq0zLLZc2W
         qkMe74XCf3vrMUFBWvlSVvJW7bhhabdiEiIJcsxl3vJf6kGDfwM/N4+PChv0mHSh48s3
         bsDAMJCkmHqF84HmSKzYEMg7078X+E+FP0uLMS1Y/tqWWmqOcOMUyKXfCYP9daR4yPhi
         185wGSz6+0CGEAoR8+p9QQWpVGOwkK58y9TS0iKjAR0oJyyAeoXcFLVjcF1mMeCsA7uv
         uizQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759205609; x=1759810409;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LfIkfL6gj/tPGL1om2pz6zaZ+tStdg+utOiTzyFtZrQ=;
        b=lhSPxa3oS/v6sE/QGCNiLPKGNyYrkhQElz9inNceqUAtpImRRnoTgeLCiQcKLyv2Vg
         BUI1Toome8SEJt0rgt5L768lHZXIoV+O0UHns/+NT2zIE/EsOp+AndCPJBPoXA0yDJX+
         S95vS9+0s8JAPbFLIQFpam+NCokmGJS11Q3F8SWJttR/GoQ37/KVEnbJ5xTkmd3cra1c
         9ZaJiJSKb8OZ5rPFn2xbh7rjjr6+yrRlSbVKOrn1sXJBPBMNdREnFcCBNzurV606D3Wj
         di1QZzNF3CIOWtxfMJrOltKQRc60lEOMcZqKRhZEtbaeLrPHePpiaNYL7ToWlmsdoDDF
         6bwA==
X-Forwarded-Encrypted: i=1; AJvYcCVv1U3MA2ZlsUvLtkdrNesZDFiCpFu01Bsjo6kQLsTLNcp6aRiWSW2ZWsRwxBz7wHTRMArIo5rLIRg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwX/Pe2MtcB3HYyRqKQjROCnvfPBzCDJqoMlbeE8cvT4XNmeB56
	+zsyd723+ESg7vCkBcKv6XdLsCFuS3CO5agJqhv1zWyQZmIuoaZ3958Ic4RpbVnKEg8=
X-Gm-Gg: ASbGncvORB92v+H+8MUoU+JgfeWIE+P7j6LIrVaks0lxGqkif9j58qapun0oHRLnySl
	GxPc8QC+wT/0gfacbURlBKfC030aDQLcK9mx0k0lrM2TbwTbDxzMH7dNCysx9pBuO505nz+5d9i
	mb0xyYV/Jyfv+HTzaCK6JnaUTRzI55geOIvG0sS9yf5AkYX2qHJD5OmJ4i8zd8KQu3bmMk3zQC9
	lNs0Kp3rLEgdbUuTdc6z57pXgUo3clkArDZ2+1kLJcHskME9Qx5gIZLKTacFk+BIrwUwEE26Uag
	dz3qojMIPMXlFApAwTwV9e2gccCJgrLSYc8KvZhqdIR3szc1ttFjlhffU78RyjFIUGyby8HNR8y
	0spRW/olRmZHpRCubkXzxnx57AlCDmDSkUAoMFKqwEo2305JhVe4HjShOI+UNQp7nYOk/VrQCE4
	wXNVWKxM+Fa0oQuezIGhPU
X-Google-Smtp-Source: AGHT+IGJB5LpSuDvwMbeYMOlRXcgfKRnczQzMLqCO1F91RV/zBDeRDsDtJpaavO640EWA/h8XFRCSw==
X-Received: by 2002:a05:600c:608d:b0:46e:4f25:aace with SMTP id 5b1f17b1804b1-46e510d28edmr61572215e9.6.1759205608862;
        Mon, 29 Sep 2025 21:13:28 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Jason Herne <jjherne@linux.ibm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Stefano Garzarella <sgarzare@redhat.com>,
	xen-devel@lists.xenproject.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	Anthony PERARD <anthony@xenproject.org>,
	Paul Durrant <paul@xen.org>,
	Eric Farman <farman@linux.ibm.com>,
	Marcelo Tosatti <mtosatti@redhat.com>,
	Halil Pasic <pasic@linux.ibm.com>,
	Matthew Rosato <mjrosato@linux.ibm.com>,
	Reinoud Zandijk <reinoud@netbsd.org>,
	Zhao Liu <zhao1.liu@intel.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sunil Muthuswamy <sunilmut@microsoft.com>,
	kvm@vger.kernel.org,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Peter Xu <peterx@redhat.com>,
	Thomas Huth <thuth@redhat.com>,
	qemu-s390x@nongnu.org,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	David Hildenbrand <david@redhat.com>
Subject: [PATCH v2 00/17] system/physmem: Remove cpu_physical_memory _is_io() and _rw()
Date: Tue, 30 Sep 2025 06:13:08 +0200
Message-ID: <20250930041326.6448-1-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

Since v1:
- Removed extra 'len' arg in address_space_is_io (rth)

---

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

Philippe Mathieu-Daudé (17):
  docs/devel/loads-stores: Stop mentioning
    cpu_physical_memory_write_rom()
  system/memory: Better describe @plen argument of flatview_translate()
  system/memory: Factor address_space_is_io() out
  target/i386/arch_memory_mapping: Use address_space_memory_is_io()
  hw/s390x/sclp: Use address_space_memory_is_io() in sclp_service_call()
  system/physmem: Remove cpu_physical_memory_is_io()
  system/physmem: Pass address space argument to
    cpu_flush_icache_range()
  hw/s390x/sclp: Replace [cpu_physical_memory -> address_space]_r/w()
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
 scripts/coccinelle/exec_rw_const.cocci | 22 ------------
 include/exec/cpu-common.h              | 18 ++--------
 include/system/memory.h                | 16 +++++++--
 hw/core/loader.c                       |  2 +-
 hw/s390x/sclp.c                        | 14 +++++---
 hw/virtio/vhost.c                      |  6 ++--
 hw/virtio/virtio.c                     | 10 +++---
 hw/xen/xen-hvm-common.c                |  8 +++--
 system/physmem.c                       | 48 ++++++++++++++------------
 target/i386/arch_memory_mapping.c      | 10 +++---
 target/i386/kvm/xen-emu.c              |  4 ++-
 target/i386/nvmm/nvmm-all.c            |  5 ++-
 target/i386/whpx/whpx-all.c            |  7 ++--
 target/s390x/mmu_helper.c              |  6 ++--
 15 files changed, 89 insertions(+), 93 deletions(-)

-- 
2.51.0


