Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A4A052CD907
	for <lists+xen-devel@lfdr.de>; Thu,  3 Dec 2020 15:25:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.43530.78202 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kkpY9-0000R3-F3; Thu, 03 Dec 2020 14:25:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 43530.78202; Thu, 03 Dec 2020 14:25:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kkpY9-0000Qe-Am; Thu, 03 Dec 2020 14:25:37 +0000
Received: by outflank-mailman (input) for mailman id 43530;
 Thu, 03 Dec 2020 14:25:36 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>) id 1kkpY8-0000QZ-5G
 for xen-devel@lists.xenproject.org; Thu, 03 Dec 2020 14:25:36 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1kkpY7-0006LH-Qf; Thu, 03 Dec 2020 14:25:35 +0000
Received: from host86-183-162-145.range86-183.btcentralplus.com
 ([86.183.162.145] helo=u2f063a87eabd5f.home)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1kkpY7-00015c-Gs; Thu, 03 Dec 2020 14:25:35 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:
	Subject:Cc:To:From; bh=sOVGNlxZA253QNyLwDoA0fXRW+6qHDxeO7BrGEiay3g=; b=2WLHyC
	BtCak28PDg8o7CoSLJSYwMmL+Tp0NrQs8PIc24kkXXwPkaVx4f6e08CtTnw4xNyvVi+vbF5getldg
	kg37vkOyBpHgY+brkDUh/bsuLx9kMvPwMege8vdRpnHQYVWiG9LVBJaHTK3De8Q464efD58VNDfAx
	zPssWSsGEqA=;
From: Paul Durrant <paul@xen.org>
To: xen-devel@lists.xenproject.org
Cc: Paul Durrant <pdurrant@amazon.com>
Subject: [PATCH v5 00/23] xl / libxl: named PCI pass-through devices
Date: Thu,  3 Dec 2020 14:25:11 +0000
Message-Id: <20201203142534.4017-1-paul@xen.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

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

 docs/man/xl-pci-configuration.5.pod  |  218 ++++++
 docs/man/xl.1.pod.in                 |   39 +-
 docs/man/xl.cfg.5.pod.in             |   68 +-
 tools/golang/xenlight/helpers.gen.go |   77 +-
 tools/golang/xenlight/types.gen.go   |    8 +-
 tools/include/libxl.h                |   67 +-
 tools/include/libxlutil.h            |    8 +-
 tools/libs/light/libxl_create.c      |    6 +-
 tools/libs/light/libxl_device.c      |   70 +-
 tools/libs/light/libxl_dm.c          |   18 +-
 tools/libs/light/libxl_internal.h    |   55 +-
 tools/libs/light/libxl_pci.c         | 1048 ++++++++++++++------------
 tools/libs/light/libxl_types.idl     |   19 +-
 tools/libs/util/libxlu_pci.c         |  379 +++++-----
 tools/ocaml/libs/xl/xenlight_stubs.c |   19 +-
 tools/xl/xl_cmdtable.c               |   16 +-
 tools/xl/xl_parse.c                  |   28 +-
 tools/xl/xl_pci.c                    |  159 ++--
 tools/xl/xl_sxp.c                    |   12 +-
 19 files changed, 1376 insertions(+), 938 deletions(-)
 create mode 100644 docs/man/xl-pci-configuration.5.pod

-- 
2.20.1


