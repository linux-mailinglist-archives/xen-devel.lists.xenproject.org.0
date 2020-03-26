Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6725619433C
	for <lists+xen-devel@lfdr.de>; Thu, 26 Mar 2020 16:30:43 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jHUQ2-0006xH-Lq; Thu, 26 Mar 2020 15:27:42 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=a2Fc=5L=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jHUQ1-0006xC-4n
 for xen-devel@lists.xenproject.org; Thu, 26 Mar 2020 15:27:41 +0000
X-Inumbo-ID: 539e4d0a-6f76-11ea-880d-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 539e4d0a-6f76-11ea-880d-12813bfff9fa;
 Thu, 26 Mar 2020 15:27:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1585236460;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=1PSTaJ180/RZBpYrNgDsW1McFsnl5htpTr3y5bTuCBo=;
 b=McgZfqIkv8pGxub8o0m731GYEk4VjkLz1KZKZAUUJtHN8Th6T+/MWWKX
 cal3sAGBaU/wKeqqxYG1G24IamFz4pEVIwfVJupENUvv6v4nRwVKDRgX6
 K1Cs5AGk7LFlWw0HE0yboCSMbmeRWTFknfBJXumZUjhnMuOdEu0VMHhK+ s=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: +avkQwAwGZa5zPPDsicSNkXaWTfLGc7iaji3mNSMPFH6UQTjsNi52MqKi8cD69G2NXiyNPWOuG
 kQgpIGmxaA00sXNX+OQ7MNjCUJ+16MWn+cRo/VRtNRFuQkulqJvCNtTVU+KSkXtsmE2UlJwgxT
 D8uh8IHfZH4pIKeKTmBzjsfFvn7vAl/wq8KP9by6DGRvqzJEhWc69DHrO6dpK8UXoSf0z55T1I
 ikSKo/cXSgYueV44N8fWxoA5EB7rGWKkCLzU7sLlude9ZpRdG1M0JkfcUg8ptHrDpD2P26gb55
 dHU=
X-SBRS: 2.7
X-MesageID: 15024593
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,308,1580792400"; d="scan'208";a="15024593"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Thu, 26 Mar 2020 16:27:16 +0100
Message-ID: <20200326152720.36970-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.26.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Subject: [Xen-devel] [PATCH v3 0/4] x86/nvmx: fixes for interrupt injection
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

http://logs.test-lab.xenproject.org/osstest/logs/149051/

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

 xen/arch/x86/hvm/vmx/intr.c       | 21 +++++++++------
 xen/arch/x86/hvm/vmx/vvmx.c       | 43 ++++++++++++++++++++-----------
 xen/include/asm-x86/hvm/vmx/vmx.h |  2 ++
 3 files changed, 43 insertions(+), 23 deletions(-)

-- 
2.26.0


