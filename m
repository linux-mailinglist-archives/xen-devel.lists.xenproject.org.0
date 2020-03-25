Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C299B19255B
	for <lists+xen-devel@lfdr.de>; Wed, 25 Mar 2020 11:21:58 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jH38H-00017w-Lj; Wed, 25 Mar 2020 10:19:33 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=lu4h=5K=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jH38F-00017d-Pi
 for xen-devel@lists.xenproject.org; Wed, 25 Mar 2020 10:19:31 +0000
X-Inumbo-ID: 1cf42d9e-6e82-11ea-85c5-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1cf42d9e-6e82-11ea-85c5-12813bfff9fa;
 Wed, 25 Mar 2020 10:19:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1585131570;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=XEgDZuOwwNyS0bjk2/uEkpNpG2eAcVVSjm/B+WEIYnY=;
 b=S+a4MqkGQif2DODTtC0mEpXMqvPr4hGkrtQfMFyRaTYoPkdanLCFI9ex
 J+Eb7thOHCDaIbTiugNgfqBZJqQL5jjIdOLvb833xihh4eu8tliA/pHIe
 2fmGBkYAVj5CvL8kH177LkmVt/aLL6/1LLyOwGYJtHuw/+zoWn0BTl1NK 8=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 9JlBUHZpC4DsvhODgViMwrmkhlKfYpHlbJ5q++SWHbWHIvSjCp4Glru0Hwh3JSpIGxhC/p9tzM
 TGz6ZVCsaP2+/wcP0rfNIsiEo6Ua8yCIja2VMd1ENSWXfkNxzhsabq/UyVorOm28d4cGpWRLG5
 lUVOCGlgKl9Assn4IBgIYI/FRYf+k3buhC6HeE9X/sdjVfN1iSugACs6hDTUEDJuo58J6GFM1w
 p/oEhp9ZFUaez7SO0fHU5Zx3oUIBsCahB0jkjJpDbhuy8bUJlgY5TSgmGCJwCJHyqAzXS1swWr
 b+E=
X-SBRS: 2.7
X-MesageID: 15252273
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,304,1580792400"; d="scan'208";a="15252273"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Wed, 25 Mar 2020 11:19:06 +0100
Message-ID: <20200325101910.29168-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.26.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Subject: [Xen-devel] [PATCH v2 0/4] x86/nvmx: fixes for interrupt injection
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
Cc: Kevin Tian <kevin.tian@intel.com>, Jun Nakajima <jun.nakajima@intel.com>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Jan Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hello,

osstest identified a regression caused by my earlier attempt to fix
interrupt injection when using nested VMX. This series aims to fix the
regression, and should unblock several osstest branches.

The following report is from osstest with this series applied:

http://logs.test-lab.xenproject.org/osstest/logs/148979/

Note the last patch (4/4) is the one that actually fixes the issue. Xen
will always use the Ack on exit feature so patches 2/4 and 3/4 don't
change the functionality when running a nested Xen, as it always
requires SVI to be updated.

Thanks, Roger.

Roger Pau Monne (4):
  Revert "x86/vvmx: fix virtual interrupt injection when Ack on exit
    control is used"
  x86/nvmx: only update SVI when using Ack on exit
  x86/nvmx: split updating RVI from SVI in nvmx_update_apicv
  x86/nvmx: update exit bitmap when using virtual interrupt delivery

 xen/arch/x86/hvm/vmx/intr.c       | 21 ++++++++++++--------
 xen/arch/x86/hvm/vmx/vvmx.c       | 33 ++++++++++++++++++++-----------
 xen/include/asm-x86/hvm/vmx/vmx.h |  2 ++
 3 files changed, 36 insertions(+), 20 deletions(-)

-- 
2.26.0


