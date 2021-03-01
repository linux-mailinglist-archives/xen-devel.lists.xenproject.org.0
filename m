Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 333913285D8
	for <lists+xen-devel@lfdr.de>; Mon,  1 Mar 2021 18:01:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.91801.173210 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lGluy-000639-6i; Mon, 01 Mar 2021 17:01:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 91801.173210; Mon, 01 Mar 2021 17:01:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lGluy-00062n-3V; Mon, 01 Mar 2021 17:01:12 +0000
Received: by outflank-mailman (input) for mailman id 91801;
 Mon, 01 Mar 2021 17:01:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ju5b=H7=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lGluw-00062i-Cv
 for xen-devel@lists.xenproject.org; Mon, 01 Mar 2021 17:01:10 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3960c46e-8c32-4cd4-a32d-4ec41a0b4b2c;
 Mon, 01 Mar 2021 17:01:09 +0000 (UTC)
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
X-Inumbo-ID: 3960c46e-8c32-4cd4-a32d-4ec41a0b4b2c
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1614618069;
  h=from:to:cc:subject:date:message-id:mime-version;
  bh=lYtMvIpYuWI/bvPALsefbxZrve6XvUtyOc1OkhsXeKg=;
  b=Cg8XhYgjgLBiWYdw+bjyhr+6mW22l0gkFk2h2hlH5331b8IPiAicxDEk
   61t8dEIJH/SmD1wlG724cbR1j5XIblDSd560QhV1L/kUwTMrXiDQoUOaI
   VRVgw0wpP4EkDsQym3HpuMNevbTPMzDorXyMuHSTFoCfRhdywnfPvnDfN
   k=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: OFHdRIWBO7xTwzDntzzH7kxZiPIJm/4GyA1W4Dq7McWKYuhTdbJmfvdHLNM+THmcgBOBuG7KAH
 iaXZ2T7LuMbMcJr9xelccqNMquhMbPbhPMO2f58hDSNLbEqsdDBoLEvqNBDz/pt0SCVROaE1Rg
 KPQ+seFKrWE977gSpiEOA8SQMrFXIVMtzlGD+uF0KKue8tJKH3XAE0YggUluO8nlB//rmvlJhv
 Gog7AsXGiVLov41e89lTiq9w7jZcEcHunD0JU+biAUNY2VjutO138CoKb70pOYZmP62mgCijU6
 JgM=
X-SBRS: 5.2
X-MesageID: 39657544
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.81,215,1610427600"; 
   d="scan'208";a="39657544"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<George.Dunlap@eu.citrix.com>, Ian Jackson <iwj@xenproject.org>, Jan Beulich
	<JBeulich@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>, Julien Grall <julien@xen.org>, Juergen Gross <jgross@suse.com>
Subject: [PATCH for-4.15 0/3] tools: ABI checking
Date: Mon, 1 Mar 2021 17:00:41 +0000
Message-ID: <20210301170044.23295-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain

Support in-tree ABI checking for stable libs.

This series highlights a regression from 4.14, which needs fixing before the
3rd patch can be committed.

abi-compliance-checker reports:

  Removed Symbols  3
    xentoolcore_internal.h
      xentoolcore__deregister_active_handle ( Xentoolcore__Active_Handle* ah )
      xentoolcore__register_active_handle ( Xentoolcore__Active_Handle* ah )
      xentoolcore__restrict_by_dup2_null ( int fd )


Another RFC question - this only applies to x86_64 at the moment.  For other
architectures, we'd need to commit other ABI files.

Andrew Cooper (3):
  tools: Check for abi-compliance-checker in ./configure
  tools/libs: Stash the 4.14 API/ABIs for the stable libraries
  tools/libs: Check ABI # DO NOT APPLY YET

 config/Tools.mk.in                                 |    1 +
 tools/configure                                    |   41 +
 tools/configure.ac                                 |    1 +
 tools/libs/.gitignore                              |    2 +
 tools/libs/abi/libxencall.so.1.2-x86_64-abi.dump   |  924 +++++++++++
 .../abi/libxendevicemodel.so.1.3-x86_64-abi.dump   | 1491 +++++++++++++++++
 tools/libs/abi/libxenevtchn.so.1.1-x86_64-abi.dump |  719 ++++++++
 .../abi/libxenforeignmemory.so.1.3-x86_64-abi.dump |  847 ++++++++++
 tools/libs/abi/libxengnttab.so.1.2-x86_64-abi.dump | 1199 ++++++++++++++
 tools/libs/abi/libxenhypfs.so.1.0-x86_64-abi.dump  |  597 +++++++
 .../libs/abi/libxenstore.so.3.0.3-x86_64-abi.dump  | 1711 ++++++++++++++++++++
 .../libs/abi/libxentoolcore.so.1.0-x86_64-abi.dump |  239 +++
 .../libs/abi/libxentoollog.so.1.0-x86_64-abi.dump  |  882 ++++++++++
 tools/libs/call/Makefile                           |    2 +
 tools/libs/devicemodel/Makefile                    |    2 +
 tools/libs/evtchn/Makefile                         |    2 +
 tools/libs/foreignmemory/Makefile                  |    2 +
 tools/libs/gnttab/Makefile                         |    2 +
 tools/libs/hypfs/Makefile                          |    2 +
 tools/libs/libs.mk                                 |   15 +-
 tools/libs/store/Makefile                          |    2 +
 tools/libs/toolcore/Makefile                       |    2 +
 tools/libs/toollog/Makefile                        |    2 +
 23 files changed, 8683 insertions(+), 4 deletions(-)
 create mode 100644 tools/libs/abi/libxencall.so.1.2-x86_64-abi.dump
 create mode 100644 tools/libs/abi/libxendevicemodel.so.1.3-x86_64-abi.dump
 create mode 100644 tools/libs/abi/libxenevtchn.so.1.1-x86_64-abi.dump
 create mode 100644 tools/libs/abi/libxenforeignmemory.so.1.3-x86_64-abi.dump
 create mode 100644 tools/libs/abi/libxengnttab.so.1.2-x86_64-abi.dump
 create mode 100644 tools/libs/abi/libxenhypfs.so.1.0-x86_64-abi.dump
 create mode 100644 tools/libs/abi/libxenstore.so.3.0.3-x86_64-abi.dump
 create mode 100644 tools/libs/abi/libxentoolcore.so.1.0-x86_64-abi.dump
 create mode 100644 tools/libs/abi/libxentoollog.so.1.0-x86_64-abi.dump

-- 
2.11.0


