Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FC98BB33DA
	for <lists+xen-devel@lfdr.de>; Thu, 02 Oct 2025 10:42:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1135390.1472501 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v4Et6-00084O-43; Thu, 02 Oct 2025 08:42:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1135390.1472501; Thu, 02 Oct 2025 08:42:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v4Et6-000827-0q; Thu, 02 Oct 2025 08:42:08 +0000
Received: by outflank-mailman (input) for mailman id 1135390;
 Thu, 02 Oct 2025 08:42:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9sj0=4L=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1v4Et4-000821-PN
 for xen-devel@lists.xenproject.org; Thu, 02 Oct 2025 08:42:06 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ac894014-9f6b-11f0-9d14-b5c5bf9af7f9;
 Thu, 02 Oct 2025 10:42:05 +0200 (CEST)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-3ee130237a8so507527f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 02 Oct 2025 01:42:05 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4255d8ab8b0sm2683613f8f.18.2025.10.02.01.42.03
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 02 Oct 2025 01:42:04 -0700 (PDT)
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
X-Inumbo-ID: ac894014-9f6b-11f0-9d14-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759394525; x=1759999325; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NTegPe0Bb/he6v221vBe7onQOEmqDcWQ9UUafnugHrk=;
        b=E600LnmNOkKKUaFqkoP6plBaNOMvx2gx4OhflxzoQIEK4XbZetCzPu+upC+h6A0e84
         Q4c3pNGTqF2ll/fbm1+2ozdgv33pCnzo48tvyCLBThviGuuDFwSk7ffpOHpdXd3IG9PS
         6KyOAAiGChXGRGaJgDlXxG9EJ5V63+WgCiUq4mFN1EHM1Ua3KxoCAycV7C/QaplSCBlJ
         tKyqjaDLyqsusJjs591jbaJ4bf/cFf6Q5JSwfusPEIXWd87sjsm1xntNhmW7qUf0zPmi
         JHfcS8oBtxhyip3yTi1O98OA2HxG9Q0jrQQNeQ1y0qSthplQB/GHPn4BoJvV6fVjkAHM
         iuWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759394525; x=1759999325;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NTegPe0Bb/he6v221vBe7onQOEmqDcWQ9UUafnugHrk=;
        b=KLsfyeGaHrnAcisqUTgX2IunoHMT+c4AuaRYau3mxpTX0ocSmK7IL5MrOWk7kzyB1W
         KHE2ZpkYk1GCh7BEFuXRKfDHlwwD7z6SQlRbgtskXnEU5Ukhi2U3xbmvNN9+cOCGq1Ou
         2V/21AvA7MYeDqXBxGB3YoHZxD3ysQTpnPfUIFpgxGCMtuhlbE31oiD84JoVuUvsE1zc
         B2dTs793ybAYKTzCijGkG8QHzBDsNzfWB/qXbCVfNlOh9COD1GkCfW5mC0rs+nYXYJOm
         gMNw0zTLroCzBU5L0Mu6RaR1wYWZ0vLmM47lr3f+3cEOKajwW+n+ghPsfS1T3UW62vPc
         LhXQ==
X-Forwarded-Encrypted: i=1; AJvYcCUezAfq+PKGE2zyALJu+EIGQcfEL2hb9oReU+KNKYIVfu6ex6fItWcPPlreh6OOTFKuKSSCe1SbM9A=@lists.xenproject.org
X-Gm-Message-State: AOJu0YypmYBgOWJBvxv+8ba61Ap8DGTxPmQabHq4tMPVdkbhdGCfaKvl
	by9gx8ZHZcwK9O4uabzQhNmJ2uF9iw2QIDp7hIAWCOEOk3ZF0zgUvKC0ksYirqmbV7o=
X-Gm-Gg: ASbGnct3N+D9U5nJ2q7p72yhwcM4dwUNLmFxmHHlMuW9h/a3TKdRjddH0+HUfmKmYQm
	jquFi1zWn/+2IjmYT3kcgmhV2oydeMHpSANdZ974k2Wy/JewSDhNrwazMBvJe38pLT0UPaA/rZ6
	4fQEBm8qmk26joRSntgUAI/BtPOFtXHjPWQ8WtXGADBAt8RzyiymKGmx0mVZE44UoMg6XFwiyNk
	uiW542YbSTWLrhVvPY9R/E8MRMkiVJUfLJWUVTfNgBbIiipX2+t4OWiLk8lppvYLWMHFeNeMtHb
	C0gkWHgmYNs6ibVWfYgwFdpt9OLlPsgENfDrUpQ4uHEKxssGmg7CzkcP8ROHv0GDad9x6vEiZyq
	PFDcMSG0VVGlhkaDtPKuBykhCossXR4xmFeh+0XsFIKbr1W/m8LI93v+vE+HIqPlnLc1dfol/4e
	ddy7ByG4+EzPD6mf9F338vzgQdoITP5Q==
X-Google-Smtp-Source: AGHT+IG73iHN+13Rh40JFYt36cqDPiR27XBT7Y9OfRVKOo6LBiQqBv7ff1ie3ldwhto5T24zRQdzaQ==
X-Received: by 2002:a05:6000:240e:b0:3eb:5e99:cbbc with SMTP id ffacd0b85a97d-425577ecad9mr3404901f8f.9.1759394524821;
        Thu, 02 Oct 2025 01:42:04 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org,
	kvm@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v4 00/17] system/physmem: Remove cpu_physical_memory _is_io() and _rw()
Date: Thu,  2 Oct 2025 10:41:45 +0200
Message-ID: <20251002084203.63899-1-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

(Series fully reviewed)

Since v3:
- Do not describe flatview_translate()'s plen argument
- Use cpu->as instead of cpu_get_address_space(idx=0)
Since v2:
- Fixed vhost change
- Better describe cpu_physical_memory_rw() removal (thuth)
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

 docs/devel/loads-stores.rst            |  6 ++--
 scripts/coccinelle/exec_rw_const.cocci | 22 --------------
 include/exec/cpu-common.h              | 18 ++---------
 include/system/memory.h                | 11 +++++++
 hw/core/loader.c                       |  2 +-
 hw/s390x/sclp.c                        | 14 ++++++---
 hw/virtio/vhost.c                      |  7 +++--
 hw/virtio/virtio.c                     | 10 +++---
 hw/xen/xen-hvm-common.c                |  8 +++--
 system/physmem.c                       | 42 ++++++++++++++------------
 target/i386/arch_memory_mapping.c      | 10 +++---
 target/i386/kvm/xen-emu.c              |  4 ++-
 target/i386/nvmm/nvmm-all.c            |  5 ++-
 target/i386/whpx/whpx-all.c            |  7 +++--
 target/s390x/mmu_helper.c              |  7 +++--
 15 files changed, 85 insertions(+), 88 deletions(-)

-- 
2.51.0


