Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CDA402C1F4A
	for <lists+xen-devel@lfdr.de>; Tue, 24 Nov 2020 09:02:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.35426.66950 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khTH3-00088t-Cs; Tue, 24 Nov 2020 08:02:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 35426.66950; Tue, 24 Nov 2020 08:02:05 +0000
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
	id 1khTH3-00088P-9R; Tue, 24 Nov 2020 08:02:05 +0000
Received: by outflank-mailman (input) for mailman id 35426;
 Tue, 24 Nov 2020 08:02:04 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>) id 1khTH2-00087m-6p
 for xen-devel@lists.xenproject.org; Tue, 24 Nov 2020 08:02:04 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1khTH0-000605-PU; Tue, 24 Nov 2020 08:02:02 +0000
Received: from ec2-54-145-241-208.compute-1.amazonaws.com ([54.145.241.208]
 helo=ip-10-0-29-170.ec2.internal)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1khTH0-0001hp-KF; Tue, 24 Nov 2020 08:02:02 +0000
Received: from mail.xenproject.org ([104.130.215.37])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <paul@xen.org>)
	id 1khTH2-00087m-6p
	for xen-devel@lists.xenproject.org; Tue, 24 Nov 2020 08:02:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Message-Id:Date:Subject:Cc:To:From;
	bh=W2WouK8f1AdKprWs2W2fVtTJuFUfHceJRHCSdCahaSQ=; b=MsD+wVyKQplcN23uxPrBM9f3n5
	KqYMhJENpml4skZH+kKFFKNLzYMOK+JfEP17ZlyREUDAgZaYms2akQCpauGt28Q3/XwW58rWHaXKD
	iAnHQ7av6UUw2lkHuER2RpRBgdWnDAa2WkaSTLwyZs0AViDRRQavvXMRT2WceeKtJwsI=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <paul@xen.org>)
	id 1khTH0-000605-PU; Tue, 24 Nov 2020 08:02:02 +0000
Received: from ec2-54-145-241-208.compute-1.amazonaws.com ([54.145.241.208] helo=ip-10-0-29-170.ec2.internal)
	by xenbits.xenproject.org with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.92)
	(envelope-from <paul@xen.org>)
	id 1khTH0-0001hp-KF; Tue, 24 Nov 2020 08:02:02 +0000
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
Subject: [PATCH v4 00/23] xl / libxl: named PCI pass-through devices
Date: Tue, 24 Nov 2020 08:01:36 +0000
Message-Id: <20201124080159.11912-1-paul@xen.org>
X-Mailer: git-send-email 2.11.0

From: Paul Durrant <pdurrant@amazon.com>

Paul Durrant (23):
  xl / libxl: s/pcidev/pci and remove DEFINE_DEVICE_TYPE_STRUCT_X
  libxl: make libxl__device_list() work correctly for
    LIBXL__DEVICE_KIND_PCI...
  libxl: Make sure devices added by pci-attach are reflected in the
    config
  libxl: add/recover 'rdm_policy' to/from PCI backend in xenstore
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

 docs/man/xl-pci-configuration.5.pod  |  218 +++++++
 docs/man/xl.1.pod.in                 |   39 +-
 docs/man/xl.cfg.5.pod.in             |   68 +--
 tools/golang/xenlight/helpers.gen.go |   77 ++-
 tools/golang/xenlight/types.gen.go   |    8 +-
 tools/include/libxl.h                |   67 ++-
 tools/include/libxlutil.h            |    8 +-
 tools/libs/light/libxl_create.c      |    6 +-
 tools/libs/light/libxl_device.c      |   66 ++-
 tools/libs/light/libxl_dm.c          |   18 +-
 tools/libs/light/libxl_internal.h    |   55 +-
 tools/libs/light/libxl_pci.c         | 1048 ++++++++++++++++++----------------
 tools/libs/light/libxl_types.idl     |   19 +-
 tools/libs/util/libxlu_pci.c         |  359 ++++++------
 tools/ocaml/libs/xl/xenlight_stubs.c |   19 +-
 tools/xl/xl_cmdtable.c               |   16 +-
 tools/xl/xl_parse.c                  |   30 +-
 tools/xl/xl_pci.c                    |  163 +++---
 tools/xl/xl_sxp.c                    |   12 +-
 19 files changed, 1367 insertions(+), 929 deletions(-)
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
2.11.0


