Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F0D4A19BF37
	for <lists+xen-devel@lfdr.de>; Thu,  2 Apr 2020 12:21:36 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jJwwJ-0000nW-10; Thu, 02 Apr 2020 10:19:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8h32=5S=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jJwwI-0000nR-0e
 for xen-devel@lists.xenproject.org; Thu, 02 Apr 2020 10:19:10 +0000
X-Inumbo-ID: 639b82e8-74cb-11ea-b58d-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 639b82e8-74cb-11ea-b58d-bc764e2007e4;
 Thu, 02 Apr 2020 10:19:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1585822749;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=dc9Q1KqMtzHb/7Vp1JB2gXgnUkuZQ+2HrfBCTKTQXRg=;
 b=FJJe1Coc57XRZ+pzZFjfNVByTMqGcMZMc7N1ZbRVhX1d9Arb6oCnBcjY
 f0P1BL1M5oEHA8wmh21C9GS3x2o1DtmMpnnALj4dxxh7OBqIotDqmDugA
 xMb2cImbzQht6vpv92a/ZwDS+4FXAs3d0dnwMJLQej5c6Irjce6k3DZlR E=;
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
IronPort-SDR: kyipUPC2HfB9xduEOYQJsloT3kkZkzLzewYpWmolnTaVrXX2fmbJYmB2XOPbJJjQpHsl23O7oj
 6FXgtkAAE6tZkbhkNmtT5eEGAnXMcLWVJYQGRuW40PrPpMfTLp3maP2xXled3f5X2ViLrJ+GyP
 IxgiuDV9Vzm2g+wKBg10a00y12AGZLgs4MGxlkbaIZOrj6IFlO+BOz7PbR/cAaEcKrAyWrv6Rz
 Wrq8a6KrdjN/S0n0zbh9Bm2ckT++PV6kZWWys3XFfDqD2p/fSuvxX4mhSnLqg3sSV46uKiyNTh
 5Ks=
X-SBRS: 2.7
X-MesageID: 15277742
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,335,1580792400"; d="scan'208";a="15277742"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Subject: [PATCH 0/5] x86/ucode: Cleanup part 5/n
Date: Thu, 2 Apr 2020 11:18:57 +0100
Message-ID: <20200402101902.28234-1-andrew.cooper3@citrix.com>
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

Some fairly minor changes while I wait for more answers from vendors.  I'm
annoyed that I didn't spot patch 2 earlier, because it would have simplied
some of the previous cleanup work.  Oh well...

Andrew Cooper (5):
  x86/ucode/intel: Remove CPUID from collect_cpu_info()
  x86/ucode: Drop ops->match_cpu()
  x86/ucode: Don't try to cope with NULL pointers in apply_microcode()
  x86/ucode: Drop ops->free_patch()
  x86/ucode: Simplify the ops->collect_cpu_info() API

 xen/arch/x86/cpu/microcode/amd.c     | 24 ++++--------------------
 xen/arch/x86/cpu/microcode/core.c    | 18 ++++++++----------
 xen/arch/x86/cpu/microcode/intel.c   | 29 ++++-------------------------
 xen/arch/x86/cpu/microcode/private.h | 18 ++++++------------
 4 files changed, 22 insertions(+), 67 deletions(-)

-- 
2.11.0


