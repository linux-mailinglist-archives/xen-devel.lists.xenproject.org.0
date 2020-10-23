Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8959C29737F
	for <lists+xen-devel@lfdr.de>; Fri, 23 Oct 2020 18:23:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.11158.29564 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kVzqe-00082C-8a; Fri, 23 Oct 2020 16:23:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 11158.29564; Fri, 23 Oct 2020 16:23:24 +0000
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
	id 1kVzqe-00081k-4d; Fri, 23 Oct 2020 16:23:24 +0000
Received: by outflank-mailman (input) for mailman id 11158;
 Fri, 23 Oct 2020 16:23:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=X6LH=D6=xen.org=paul@srs-us1.protection.inumbo.net>)
 id 1kVzqc-00081e-DL
 for xen-devel@lists.xenproject.org; Fri, 23 Oct 2020 16:23:22 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id dc477e0e-6fda-4b50-a9de-9e1b26c444c1;
 Fri, 23 Oct 2020 16:23:21 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1kVzqa-0008Is-4H; Fri, 23 Oct 2020 16:23:20 +0000
Received: from ec2-18-200-132-236.eu-west-1.compute.amazonaws.com
 ([18.200.132.236] helo=ip-10-0-185-232.eu-west-1.compute.internal)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1kVzqZ-000376-P8; Fri, 23 Oct 2020 16:23:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=X6LH=D6=xen.org=paul@srs-us1.protection.inumbo.net>)
	id 1kVzqc-00081e-DL
	for xen-devel@lists.xenproject.org; Fri, 23 Oct 2020 16:23:22 +0000
X-Inumbo-ID: dc477e0e-6fda-4b50-a9de-9e1b26c444c1
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id dc477e0e-6fda-4b50-a9de-9e1b26c444c1;
	Fri, 23 Oct 2020 16:23:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Message-Id:Date:Subject:Cc:To:From;
	bh=paZPJP/oEG4bKcO58FfOeXtzFY1cQuLkf+AoEVb8yz0=; b=lQAizG/RYyjlJLRghBHH11uGzI
	RDI2HOkkUyN4LrVLyossHeD0s6gIhrXAuutTUV4bxLWw/3xENWQ7FfA+T1v9kBumL5x6JlLHvFWgw
	uaFBi5CwgYi8SjxnjjzkkzURw5vj7vMvQ8iTDFYFLgGkCpugh+vS/Ue90U62dumNWFm8=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <paul@xen.org>)
	id 1kVzqa-0008Is-4H; Fri, 23 Oct 2020 16:23:20 +0000
Received: from ec2-18-200-132-236.eu-west-1.compute.amazonaws.com ([18.200.132.236] helo=ip-10-0-185-232.eu-west-1.compute.internal)
	by xenbits.xenproject.org with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.92)
	(envelope-from <paul@xen.org>)
	id 1kVzqZ-000376-P8; Fri, 23 Oct 2020 16:23:19 +0000
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
Subject: [PATCH 00/25] xl / libxl: named PCI pass-through devices
Date: Fri, 23 Oct 2020 16:22:49 +0000
Message-Id: <20201023162314.2235-1-paul@xen.org>
X-Mailer: git-send-email 2.11.0

From: Paul Durrant <pdurrant@amazon.com>

This series adds support for naming devices added to the assignable list
and then using a name (instead of a BDF) for convenience when attaching
a device to a domain.

The first 15 patches are cleanup. The remaining 10 modify documentation
and add the new functionality.

Paul Durrant (25):
  xl / libxl: s/pcidev/pci and remove DEFINE_DEVICE_TYPE_STRUCT_X
  libxl: use LIBXL_DEFINE_DEVICE_LIST for pci devices
  libxl: use LIBXL_DEFINE_DEVICE_LIST for nic devices
  libxl: s/domainid/domid/g in libxl_pci.c
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

 docs/man/xl-pci-configuration.5.pod  |  218 +++++++
 docs/man/xl.1.pod.in                 |   39 +-
 docs/man/xl.cfg.5.pod.in             |   68 +--
 tools/golang/xenlight/helpers.gen.go |   77 ++-
 tools/golang/xenlight/types.gen.go   |    8 +-
 tools/include/libxl.h                |   67 ++-
 tools/include/libxlutil.h            |    8 +-
 tools/libs/light/libxl_create.c      |    6 +-
 tools/libs/light/libxl_dm.c          |   18 +-
 tools/libs/light/libxl_internal.h    |   53 +-
 tools/libs/light/libxl_nic.c         |   19 +-
 tools/libs/light/libxl_pci.c         | 1072 ++++++++++++++++++----------------
 tools/libs/light/libxl_types.idl     |   19 +-
 tools/libs/util/libxlu_pci.c         |  359 ++++++------
 tools/ocaml/libs/xl/xenlight_stubs.c |   19 +-
 tools/xl/xl_cmdtable.c               |   16 +-
 tools/xl/xl_parse.c                  |   30 +-
 tools/xl/xl_pci.c                    |  164 +++---
 tools/xl/xl_sxp.c                    |   12 +-
 19 files changed, 1337 insertions(+), 935 deletions(-)
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


