Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B2E9B199319
	for <lists+xen-devel@lfdr.de>; Tue, 31 Mar 2020 12:07:46 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jJDm8-0005km-OE; Tue, 31 Mar 2020 10:05:40 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=fshn=5Q=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jJDm7-0005kh-Bo
 for xen-devel@lists.xenproject.org; Tue, 31 Mar 2020 10:05:39 +0000
X-Inumbo-ID: 2b9d0b54-7337-11ea-ba0b-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2b9d0b54-7337-11ea-ba0b-12813bfff9fa;
 Tue, 31 Mar 2020 10:05:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1585649138;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=LkOuceU/kyJF+42qKD97CI43LQTbZaKeA9PSyw1+C+Q=;
 b=bcOspgjKQ38VCBWS/tqrBG5dL9wdNmteo+el+YmPmrRz3RtmyLjNSDTE
 Q4CV3Hf85DuDCa/2jSTGY6uI3pG4vFdJWyTTgjKFF68W/mIxWrPMZzr4C
 2YhWc4oh0PVUlOphGDG0SXKLgMFlKu6fS/F5SuULiDCbtqGpmBSnxscBr 0=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: lbin39yPXiKuLc9gmrTpkziKv8HOOtxmJeHMIQsd9UFMqdLU1d95kM7h2uO8mHSTmitJd1zguO
 igYMQW5QinyMEXsbgX4yvSy9EVAZTxHSBPh/KN8NQSkisA9lV+IimdmjGP9bHJZtpfarVlZrdn
 qgkMdCgju3kmIrT2Akp4jRNYm+10omckgOSHxAJbUHxm8iERjXSwndc+kWZ9VQmUbWmErcz+Jr
 9QwTQGjbMmN47fOdZX/VYV+vnwxYM1n1bnKrJjLjZ7oF+iFRDA2jK4LX7A/YE6JS9t1IzrRIjV
 s6U=
X-SBRS: 2.7
X-MesageID: 15137742
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,327,1580792400"; d="scan'208";a="15137742"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Subject: [PATCH 00/11] x86/ucode: Cleanup and fixes - Part 4/n (AMD)
Date: Tue, 31 Mar 2020 11:05:20 +0100
Message-ID: <20200331100531.4294-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Jan Beulich <JBeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

The first patch definitely needs backporting.  Second is a good candidate as
well.  Everything else probably not.

This follows similar cleanup on the Intel side, removing gratuitous memory
allocations (both interms of number, and indirection), and fixes several
things to be more uniform (handling of cpu_sig->sig, and parsing of multiple
containers.

Andrew Cooper (11):
  x86/ucode/amd: Fix more potential buffer overruns with microcode parsing
  x86/ucode/amd: Move check_final_patch_levels() to apply_microcode()
  x86/ucode/amd: Don't use void * for microcode_patch->mpb
  x86/ucode/amd: Collect CPUID.1.EAX in collect_cpu_info()
  x86/ucode/amd: Overhaul the equivalent cpu table handling completely
  x86/ucode/amd: Move verify_patch_size() into get_ucode_from_buffer_amd()
  x86/ucode/amd: Alter API for microcode_fits()
  x86/ucode/amd: Rename bufsize to size in cpu_request_microcode()
  x86/ucode/amd: Remove gratuitous memory allocations from cpu_request_microcode()
  x86/ucode/amd: Fold structures together
  x86/ucode/amd: Rework parsing logic in cpu_request_microcode()

 xen/arch/x86/cpu/microcode/amd.c | 512 +++++++++++++--------------------------
 xen/include/asm-x86/microcode.h  |   2 +-
 2 files changed, 176 insertions(+), 338 deletions(-)

-- 
2.11.0


