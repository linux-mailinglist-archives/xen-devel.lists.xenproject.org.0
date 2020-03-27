Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F02DC19571A
	for <lists+xen-devel@lfdr.de>; Fri, 27 Mar 2020 13:31:20 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jHo6x-00064I-L7; Fri, 27 Mar 2020 12:29:19 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=o0RR=5M=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jHo6v-00063m-EA
 for xen-devel@lists.xenproject.org; Fri, 27 Mar 2020 12:29:17 +0000
X-Inumbo-ID: 8fc4058a-7026-11ea-8967-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8fc4058a-7026-11ea-8967-12813bfff9fa;
 Fri, 27 Mar 2020 12:29:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1585312152;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=QIn+HbCt09bH2s2pP3ZW4jSUTu7VPH7/fp3mxbQHYWY=;
 b=Ip30WLI2GFCtK2JEThLHQrbzRd8OFXA7cD6UhhWYZ8vS5ZKEvOoc+QEZ
 vesy2yUUQjbxyS2u8e72KkxtsPhkcKxKzIl1UaOpnyq+tJOONRWWcADST
 +6H+UK2wj2OOIMi3/l81iNVa2wN++O3USV/FkzVJXSj4XHkH5mPAEu+wJ A=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: c2FegZZ56brQh0AHwjn7uBRQ14ucefTYz7zR7xYDgYu5yRqKSOnSzb8rDNjpLKLYTvmnj+MtPN
 mM0nD3UNX0XMKEqGa3k21vq6vgrVxZzcMJ4Thj1SCcOE5JBkGHqIiEm5K11/Fmzv61BQ/xtGZT
 YsGMyhKey1f8usNnUqNhf48Mt5f1Zu3p4IaJRkxUuO4vHWMkOs+iBVPG5ORaVyizIbdfZo+0T2
 DeNtmezW4zvZJcbpY+UMeM+43Popd86xD4fS+kokaYTE50xTS4yA7seuxlJO8AxnTUcYzLmucs
 gEo=
X-SBRS: 2.7
X-MesageID: 14735336
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,312,1580792400"; d="scan'208";a="14735336"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Fri, 27 Mar 2020 12:28:54 +0000
Message-ID: <20200327122901.11569-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Subject: [Xen-devel] [PATCH v2 0/7] x86/ucode: Cleanup and fixes - Part 3/n
 (Intel)
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

This supercedes the remnants of the Part 1 series, using Jan's suggested
alternative for making struct microcode_patch opaque.

Andrew Cooper (7):
  x86/ucode: Remove unnecessary indirection in struct microcode_patch
  x86/ucode/intel: Adjust microcode_sanity_check() to not take void *
  x86/ucode/intel: Remove gratuitous memory allocations from cpu_request_microcode()
  x86/ucode/intel: Reimplement get_{data,total}size() helpers
  x86/ucode/intel: Clean up microcode_update_match()
  x86/ucode/intel: Clean up microcode_sanity_check()
  x86/ucode/intel: Fold structures together

 xen/arch/x86/cpu/microcode/amd.c     |  30 ++-
 xen/arch/x86/cpu/microcode/core.c    |   3 +-
 xen/arch/x86/cpu/microcode/intel.c   | 362 +++++++++++++++++------------------
 xen/arch/x86/cpu/microcode/private.h |  11 +-
 4 files changed, 187 insertions(+), 219 deletions(-)

-- 
2.11.0


