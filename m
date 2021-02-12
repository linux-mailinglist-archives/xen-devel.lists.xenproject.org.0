Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 28C5431A1E6
	for <lists+xen-devel@lfdr.de>; Fri, 12 Feb 2021 16:41:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.84316.158138 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lAaZ4-0001PT-Mb; Fri, 12 Feb 2021 15:41:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 84316.158138; Fri, 12 Feb 2021 15:41:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lAaZ4-0001Of-IQ; Fri, 12 Feb 2021 15:41:02 +0000
Received: by outflank-mailman (input) for mailman id 84316;
 Fri, 12 Feb 2021 15:41:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=o46S=HO=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lAaZ2-0000ix-PI
 for xen-devel@lists.xenproject.org; Fri, 12 Feb 2021 15:41:00 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5c825c4b-0a26-462a-891b-669940f5c0bc;
 Fri, 12 Feb 2021 15:40:22 +0000 (UTC)
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
X-Inumbo-ID: 5c825c4b-0a26-462a-891b-669940f5c0bc
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1613144422;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Rz8UsAOinQtm3EzgaPvbSv/VidINXBxSC5At43dOJUQ=;
  b=D+/bns3hGvQNEpInGTrxn6sKpTUm/pnfRvOMnP41AbvTJtHOW3C32Cw5
   0VqK9q/AA5Ut1rzZD2tDjb/14vxQKKikE79wB6XGBl9X8zOAvaRBDxXd1
   16WSqYCOWaTxGburDuqVdRgtXyynHalwMjjMmZD9dyqVSh+xm0jrEgYcN
   E=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: +Wf30pnhbcD3GN9U9MLRbwvAkNGL9BlifUKjHxW3NtKLlThUKO1VZbaKVnqwO3KvD8YsRhWnfG
 MPiUbmNFZcEJ/QpmO9/gK8ds3y2k64xPl8lLVsfPIrmjvaYHoxeNHoGqnb5F3/5VMDVHuYDpsl
 Sbd0Ma5Gob6Ko9fSx4m7sOK5oDKcIDWYejrsydTAXdzcItpn95YAhMV54DUbO1B8xybaerd9me
 HZ9qEfMTQRsTJTICi2Dzh/rMq2QVDREALg8q3gg8K23Xvnp3VZrPiWb0kS8v/bs9MZk9q60aII
 PkQ=
X-SBRS: 5.2
X-MesageID: 37344043
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.81,174,1610427600"; 
   d="scan'208";a="37344043"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson
	<iwj@xenproject.org>, Wei Liu <wl@xen.org>, Anthony PERARD
	<anthony.perard@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Juergen Gross <jgross@suse.com>
Subject: [PATCH for-4.15 00/10] tools: Support to use abi-dumper on libraries
Date: Fri, 12 Feb 2021 15:39:43 +0000
Message-ID: <20210212153953.4582-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

The first 6 patches are fixes to build with the -Og optimisation level, which
is an expectation of abi-dumper and a good idea generally.  There are 2
definite bugfixes, and 4 of more questionable usefulness.  All fixes are
simple.

The next patch switches to -Og by default.  This is potentially risky - I've
fixed up all build failures that Gitlab CI can spot, but I don't guarentee
that I've fixed all of them.  However, it only affects debug builds - release
builds are unchanged, and we're before -RC1 so have plenty of time to react to
any fallout.

The final 3 patches arrange for abi-dumper to run if it is available in the
build environment.  This is strictly optional, has no effect if abi-dumper
isn't in the build environment, and writes out one extra file if present.


With this tooling place, we can now add support to OSSTest to check for ABI
breakges in builds.

Andrew Cooper (10):
  tools/xl: Fix exit code for `xl vkbattach`
  tools/libxg: Fix uninitialised variable in write_x86_cpu_policy_records()
  tools/libxg: Fix uninitialised variable in meminit()
  tools/libxl: Fix uninitialised variable in libxl__domain_get_device_model_uid()
  tools/libxl: Fix uninitialised variable in libxl__write_stub_dmargs()
  stubdom/xenstored: Fix uninitialised variables in lu_read_state()
  tools: Use -Og for debug builds when available
  tools: Check for abi-dumper in ./configure
  tools/libs: Add rule to generate headers.lst
  tools/libs: Write out an ABI analysis when abi-dumper is available

 config/Tools.mk.in                  |  1 +
 tools/Rules.mk                      |  5 +++--
 tools/configure                     | 41 +++++++++++++++++++++++++++++++++++++
 tools/configure.ac                  |  1 +
 tools/libs/.gitignore               |  1 +
 tools/libs/guest/xg_dom_arm.c       |  2 +-
 tools/libs/guest/xg_sr_common_x86.c |  6 ++++++
 tools/libs/libs.mk                  | 18 +++++++++++++++-
 tools/libs/light/libxl_dm.c         |  6 ++----
 tools/xenstore/xenstored_control.c  |  2 +-
 tools/xl/xl_vkb.c                   |  3 ++-
 11 files changed, 76 insertions(+), 10 deletions(-)
 create mode 100644 tools/libs/.gitignore

-- 
2.11.0


