Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 80116BABFF2
	for <lists+xen-devel@lfdr.de>; Tue, 30 Sep 2025 10:22:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1133828.1471878 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v3VcD-0007Po-Le; Tue, 30 Sep 2025 08:21:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1133828.1471878; Tue, 30 Sep 2025 08:21:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v3VcD-0007ON-I4; Tue, 30 Sep 2025 08:21:41 +0000
Received: by outflank-mailman (input) for mailman id 1133828;
 Tue, 30 Sep 2025 08:21:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=MDOg=4J=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1v3VcB-0007Nn-E6
 for xen-devel@lists.xenproject.org; Tue, 30 Sep 2025 08:21:39 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 773d3e50-9dd6-11f0-9d14-b5c5bf9af7f9;
 Tue, 30 Sep 2025 10:21:29 +0200 (CEST)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-46e3af7889fso31676175e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 30 Sep 2025 01:21:29 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46e2ab31f1dsm257244235e9.13.2025.09.30.01.21.27
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 30 Sep 2025 01:21:28 -0700 (PDT)
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
X-Inumbo-ID: 773d3e50-9dd6-11f0-9d14-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759220489; x=1759825289; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YvhoIhSsQDGRzJiqmuuLIQQZhU1t8TAbJtfU17YXnRc=;
        b=CmJEbr26SXJ88WCjc2yFgqTlkUa1LiUGCPFnCXDE5b4qpQGLrE9KYyfCi48ulS9+Di
         3aj9S/p1hMKM2mYVMuGm+C8x7PMAjjZmByLpBHl4E4JHLpk7oxZ/Z2+pLKMv09jqGhQm
         KZfJUh84ajeWz6wOmmuaCDD1l7auUB7YtbJMArW3Us6FV4ppr9hDpGStBxNsJl8ShqQD
         l1+7wah+6AfO6zJYmF8SjnBRnqXd3+Q5VidlxHqibxaPnJjMn4FTNAeayhNEW8PfUpje
         Zl7N/IiCx/vquFwA/2BTd32GGDmO88+Xmd9Kqit550CnNEMoOzrJwA5vLpfUj1W/9qiE
         1Ngg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759220489; x=1759825289;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YvhoIhSsQDGRzJiqmuuLIQQZhU1t8TAbJtfU17YXnRc=;
        b=LoQuukdXrKej9zU15W4wEeTOyc3DC+7gLQsUHHfojuM7czbjU/xo39q3vADAMfmeYH
         AaZX6ufbxj8WA25giLpP8t1grW5XrfE0qDwdKwOUXFWKSx1TThSFrDPR/PKi+guU94pB
         GmM3qecql+2JbIWQesdNvMJTr64hb8yIqxwwFwOuYdmciFTOjUcFG5Ehz4NbRCq6T+z0
         nW45AhcTpve9+4/i8Lj2HjJBblJYqg+avQoQnY5oQFJiYEAjyD2PaWinb47os2BbyQ50
         bXhDThVbHjIhj1zFu2xVak1jS0sojOCMf50zVMGkUVvRAit+i8Kqaeeb+567v7gvoSwq
         z5aQ==
X-Forwarded-Encrypted: i=1; AJvYcCUNEZ2CIRh0fKe1VXqAx9jrZxObtYHCxD7HnmavJgWCdUZmbdsczXxiO6cEOAd6xTzKyBthSc5X67g=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxNyUowp14oAu4/ttrjv8hEtXjLl8UUlPPZv+9TBnWC4nQQNi6c
	fszVQnoCw2eGqZktzwaPj1NjH0Dy3yS0/73cQOQr4dthEMjsGJ21Kj6Kr2BCakWsmBQ=
X-Gm-Gg: ASbGnct65jDNXH6G/yVwrMIX46rBPmL94Vq5aohhKqHyeyFlgsIi7Q7W+ZeMX0mG+c2
	x2u9JEHADApBEc2UYoXUTjmbU+Cd93cnZS+BwnQ3MHMItpaFiYDd4jQtqRReCHeKgmRsaJQJ9kf
	LMlCYgNCmyrXS7hQ2nQGG4Gw4oooy2gmQ6kjU9Ds6DE9SmrvjpbOVknbg2wO2S07dqBHOmTGp44
	CCCZ66x8ceNyRcAsGnQ0CmSt9O4wh2dP+PlALPFqnEf1XuitW/zMi3b5V+gWwU/I9YiDrsb1bo0
	eud1/g6Bc0RxuTrwSVjAU8dOIWIQNW1F3ia2ta2DM4B4ZdFN31snTUsAiKj4C+6yTieJvOLz8gR
	DZlwmQBYNbQ9p6H2Pgsl0o0wYKvRUQS8Ems5Gupk8rKGtwUOMzKwTnK08ZIs9+hPRd61xuDE2LC
	sW8Y/7roFRTUt/7/4pZ6JZ
X-Google-Smtp-Source: AGHT+IH0LOZYhQvlCCwRE6HguOW9UpuwkFMjTOLA/D/C2ktVUpzuFK1TrAy7o+BecbtxQsJYTDH8eA==
X-Received: by 2002:a05:600c:8209:b0:46e:376a:c9db with SMTP id 5b1f17b1804b1-46e376acfbbmr166369605e9.26.1759220489083;
        Tue, 30 Sep 2025 01:21:29 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Cc: Marcelo Tosatti <mtosatti@redhat.com>,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	Reinoud Zandijk <reinoud@netbsd.org>,
	Peter Xu <peterx@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Zhao Liu <zhao1.liu@intel.com>,
	David Hildenbrand <david@redhat.com>,
	Halil Pasic <pasic@linux.ibm.com>,
	kvm@vger.kernel.org,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	xen-devel@lists.xenproject.org,
	Stefano Garzarella <sgarzare@redhat.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Sunil Muthuswamy <sunilmut@microsoft.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Matthew Rosato <mjrosato@linux.ibm.com>,
	qemu-s390x@nongnu.org,
	Paul Durrant <paul@xen.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Anthony PERARD <anthony@xenproject.org>,
	Jason Herne <jjherne@linux.ibm.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Thomas Huth <thuth@redhat.com>,
	Eric Farman <farman@linux.ibm.com>
Subject: [PATCH v3 00/18] system/physmem: Remove cpu_physical_memory _is_io() and _rw()
Date: Tue, 30 Sep 2025 10:21:07 +0200
Message-ID: <20250930082126.28618-1-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

Since v1:
- Removed extra 'len' arg in address_space_is_io (rth)
Since v2:
- Fixed vhost change
- Better describe cpu_physical_memory_rw() removal (thuth)

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

Philippe Mathieu-Daudé (18):
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
  system/physmem: Avoid cpu_physical_memory_rw when is_write is constant
  system/physmem: Remove legacy cpu_physical_memory_rw()
  hw/virtio/vhost: Replace legacy cpu_physical_memory_*map() calls
  hw/virtio/virtio: Replace legacy cpu_physical_memory_map() call

 docs/devel/loads-stores.rst            |  6 +--
 scripts/coccinelle/exec_rw_const.cocci | 22 -----------
 include/exec/cpu-common.h              | 18 +--------
 include/system/memory.h                | 16 +++++++-
 hw/core/loader.c                       |  2 +-
 hw/s390x/sclp.c                        | 14 ++++---
 hw/virtio/vhost.c                      |  7 +++-
 hw/virtio/virtio.c                     | 10 +++--
 hw/xen/xen-hvm-common.c                |  8 ++--
 system/physmem.c                       | 51 ++++++++++++++------------
 target/i386/arch_memory_mapping.c      | 10 ++---
 target/i386/kvm/xen-emu.c              |  4 +-
 target/i386/nvmm/nvmm-all.c            |  5 ++-
 target/i386/whpx/whpx-all.c            |  7 +++-
 target/s390x/mmu_helper.c              |  6 ++-
 15 files changed, 92 insertions(+), 94 deletions(-)

-- 
2.51.0


