Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7087E2ADD6B
	for <lists+xen-devel@lfdr.de>; Tue, 10 Nov 2020 18:52:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.23569.50418 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kcXoF-0002z5-Cb; Tue, 10 Nov 2020 17:51:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 23569.50418; Tue, 10 Nov 2020 17:51:59 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kcXoF-0002yM-8Q; Tue, 10 Nov 2020 17:51:59 +0000
Received: by outflank-mailman (input) for mailman id 23569;
 Tue, 10 Nov 2020 17:51:57 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=l7/2=EQ=xen.org=paul@srs-us1.protection.inumbo.net>)
 id 1kcXoD-0002tQ-1a
 for xen-devel@lists.xenproject.org; Tue, 10 Nov 2020 17:51:57 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 15803b96-49c3-4874-8997-a74a4a0e91db;
 Tue, 10 Nov 2020 17:51:52 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1kcXo6-0006YX-Cq; Tue, 10 Nov 2020 17:51:50 +0000
Received: from host109-146-187-185.range109-146.btcentralplus.com
 ([109.146.187.185] helo=u2f063a87eabd5f.home)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1kcXo6-0007RC-2V; Tue, 10 Nov 2020 17:51:50 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=l7/2=EQ=xen.org=paul@srs-us1.protection.inumbo.net>)
	id 1kcXoD-0002tQ-1a
	for xen-devel@lists.xenproject.org; Tue, 10 Nov 2020 17:51:57 +0000
X-Inumbo-ID: 15803b96-49c3-4874-8997-a74a4a0e91db
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 15803b96-49c3-4874-8997-a74a4a0e91db;
	Tue, 10 Nov 2020 17:51:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:
	Subject:Cc:To:From; bh=qVlFu9hM29FvShCiNe/TR6XZRyXI3nvUfa1dpCTnNDA=; b=sAFef9
	lU/G2ebAMJaNLqsHsjWUWgUH40+t7mKY2kLHL4MZVSrmrXzkKbsAjXMl0EIfWpkGMGlMjA2MVYtMn
	yJkw+h5zX9JfUIvHI5gPIr4Fw34EVDmXnw7PM8ajAmAevLMHMnOjJ/TGmX3T+OlptRECKh0yaZzbu
	mD6z6mzQXmU=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <paul@xen.org>)
	id 1kcXo6-0006YX-Cq; Tue, 10 Nov 2020 17:51:50 +0000
Received: from host109-146-187-185.range109-146.btcentralplus.com ([109.146.187.185] helo=u2f063a87eabd5f.home)
	by xenbits.xenproject.org with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <paul@xen.org>)
	id 1kcXo6-0007RC-2V; Tue, 10 Nov 2020 17:51:50 +0000
From: Paul Durrant <paul@xen.org>
To: xen-devel@lists.xenproject.org
Cc: Paul Durrant <pdurrant@amazon.com>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Christian Lindig <christian.lindig@citrix.com>,
	David Scott <dave@recoil.org>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>,
	Nick Rosbrook <rosbrookn@ainfosec.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v2 00/24] xl / libxl: named PCI pass-through devices
Date: Tue, 10 Nov 2020 17:51:23 +0000
Message-Id: <20201110175147.7067-1-paul@xen.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Paul Durrant <pdurrant@amazon.com>

Paul Durrant (24):
  xl / libxl: s/pcidev/pci and remove DEFINE_DEVICE_TYPE_STRUCT_X
  libxl: use LIBXL_DEFINE_DEVICE_LIST for pci devices
  libxl: use LIBXL_DEFINE_DEVICE_LIST for nic devices
  libxl: s/detatched/detached in libxl_pci.c
  libxl: remove extraneous arguments to do_pci_remove() in libxl_pci.c
  libxl: stop using aodev->device_config in libxl__device_pci_add()...
  libxl: generalise 'driver_path' xenstore access functions in
    libxl_pci.c
  libxl: remove unnecessary check from libxl__device_pci_add()
  libxl: remove get_all_assigned_devices() from libxl_pci.c
  libxl: make sure callers of libxl_device_pci_list() free the list
    after use
  libxl: add libxl_device_pci_assignable_list_free()...
  libxl: use COMPARE_PCI() macro is_pci_in_array()...
  libxl: add/recover 'rdm_policy' to/from PCI backend in xenstore
  libxl: Make sure devices added by pci-attach are reflected in the
    config
  docs/man: extract documentation of PCI_SPEC_STRING from the xl.cfg
    manpage...
  docs/man: improve documentation of PCI_SPEC_STRING...
  docs/man: fix xl(1) documentation for 'pci' operations
  libxl: introduce 'libxl_pci_bdf' in the idl...
  libxlu: introduce xlu_pci_parse_spec_string()
  libxl: modify
    libxl_device_pci_assignable_add/remove/list/list_free()...
  docs/man: modify xl(1) in preparation for naming of assignable devices
  xl / libxl: support naming of assignable devices
  docs/man: modify xl-pci-configuration(5) to add 'name' field to
    PCI_SPEC_STRING
  xl / libxl: support 'xl pci-attach/detach' by name

 docs/man/xl-pci-configuration.5.pod  |  218 ++++++
 docs/man/xl.1.pod.in                 |   39 +-
 docs/man/xl.cfg.5.pod.in             |   68 +-
 tools/golang/xenlight/helpers.gen.go |   77 +-
 tools/golang/xenlight/types.gen.go   |    8 +-
 tools/include/libxl.h                |   67 +-
 tools/include/libxlutil.h            |    8 +-
 tools/libs/light/libxl_create.c      |    6 +-
 tools/libs/light/libxl_dm.c          |   18 +-
 tools/libs/light/libxl_internal.h    |   53 +-
 tools/libs/light/libxl_nic.c         |   19 +-
 tools/libs/light/libxl_pci.c         | 1030 ++++++++++++++------------
 tools/libs/light/libxl_types.idl     |   19 +-
 tools/libs/util/libxlu_pci.c         |  379 +++++-----
 tools/ocaml/libs/xl/xenlight_stubs.c |   19 +-
 tools/xl/xl_cmdtable.c               |   16 +-
 tools/xl/xl_parse.c                  |   28 +-
 tools/xl/xl_pci.c                    |  159 ++--
 tools/xl/xl_sxp.c                    |   12 +-
 19 files changed, 1308 insertions(+), 935 deletions(-)
 create mode 100644 docs/man/xl-pci-configuration.5.pod
---
Cc: Anthony PERARD <anthony.perard@citrix.com>
Cc: Christian Lindig <christian.lindig@citrix.com>
Cc: David Scott <dave@recoil.org>
Cc: George Dunlap <george.dunlap@citrix.com>
Cc: Ian Jackson <iwj@xenproject.org>
Cc: Nick Rosbrook <rosbrookn@ainfosec.com>
Cc: Wei Liu <wl@xen.org>
-- 
2.20.1


