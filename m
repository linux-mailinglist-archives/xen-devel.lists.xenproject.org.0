Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D3552EB1B2
	for <lists+xen-devel@lfdr.de>; Tue,  5 Jan 2021 18:46:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.62109.109769 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwqPt-0005ND-F2; Tue, 05 Jan 2021 17:46:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 62109.109769; Tue, 05 Jan 2021 17:46:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwqPt-0005Mo-Bg; Tue, 05 Jan 2021 17:46:45 +0000
Received: by outflank-mailman (input) for mailman id 62109;
 Tue, 05 Jan 2021 17:46:44 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>) id 1kwqPs-0005Mj-Pm
 for xen-devel@lists.xenproject.org; Tue, 05 Jan 2021 17:46:44 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1kwqPs-0006IF-KD; Tue, 05 Jan 2021 17:46:44 +0000
Received: from ec2-34-243-106-223.eu-west-1.compute.amazonaws.com
 ([34.243.106.223] helo=ip-10-0-70-185.eu-west-1.compute.internal)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1kwqPs-0008Uy-CL; Tue, 05 Jan 2021 17:46:44 +0000
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
	s=20200302mail; h=Message-Id:Date:Subject:Cc:To:From;
	bh=yZdO1/S7xU7wk1yEHKDFUXxP4bGBPiqKZESj4DlztGA=; b=160fEIwlUICDmsRe1tgD/KTkED
	Ea/IZujxcziJi7OGGxp+QKRTYHWDMxooNzIhA+KgJpygR+oKTR6ZjaNFK+lKgvh+I21FWYItbKjKk
	RyDjU7paCC1v9yma8kttpN3BuKq1BJvYTA29oiXa+/fa5BbHMrg9QppNjVwXrFGqM0A0=;
From: Paul Durrant <paul@xen.org>
To: xen-devel@lists.xenproject.org
Cc: Paul Durrant <pdurrant@amazon.com>
Subject: [PATCH v7 0/7]  xl / libxl: named PCI pass-through devices
Date: Tue,  5 Jan 2021 17:46:35 +0000
Message-Id: <20210105174642.2754-1-paul@xen.org>
X-Mailer: git-send-email 2.11.0

From: Paul Durrant <pdurrant@amazon.com>

These are re-worked versions of the remaining patches from v6 of the series
that were reverted by commit ac6a0af3870b "Revert patches that break libxl
API".

Paul Durrant (7):
  docs/man: modify xl(1) in preparation for naming of assignable devices
  libxlu: introduce xlu_pci_parse_spec_string()
  libxl: stop setting 'vdevfn' in pci_struct_fill()
  libxl: add 'name' field to 'libxl_device_pci' in the IDL...
  xl: support naming of assignable devices
  docs/man: modify xl-pci-configuration(5) to add 'name' field to
    PCI_SPEC_STRING
  libxl / libxlu: support 'xl pci-attach/detach' by name

 docs/man/xl-pci-configuration.5.pod |  25 ++-
 docs/man/xl.1.pod.in                |  19 +-
 tools/include/libxl.h               |   6 +
 tools/include/libxlutil.h           |   8 +-
 tools/libs/light/libxl_pci.c        | 133 ++++++++++++--
 tools/libs/light/libxl_types.idl    |  13 +-
 tools/libs/util/libxlu_pci.c        | 353 +++++++++++++++++++-----------------
 tools/xl/xl_cmdtable.c              |  16 +-
 tools/xl/xl_parse.c                 |   4 +-
 tools/xl/xl_pci.c                   | 120 ++++++++----
 10 files changed, 457 insertions(+), 240 deletions(-)

-- 
2.11.0


