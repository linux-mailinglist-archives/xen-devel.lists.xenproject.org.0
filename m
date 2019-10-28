Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DCE1E7468
	for <lists+xen-devel@lfdr.de>; Mon, 28 Oct 2019 16:05:27 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iP6X4-0006xQ-AW; Mon, 28 Oct 2019 15:02:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=qotU=YV=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1iP6X3-0006xG-39
 for xen-devel@lists.xenproject.org; Mon, 28 Oct 2019 15:02:09 +0000
X-Inumbo-ID: e4f7ce04-f993-11e9-8aca-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e4f7ce04-f993-11e9-8aca-bc764e2007e4;
 Mon, 28 Oct 2019 15:02:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1572274921;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=zADf9FFjrV7ii/wjQhpkkWO3a4mXTRJk6r64uN0XXPw=;
 b=S7OMDGofQsbaN+DOGuhp58Pex+W2TBHva600qnmjKq32QincUMlTocme
 u8W6ovsyoawI7D6ayeFtGm8jbPnbGstMPd8Krmv8t+7AU1b/EfQLXEPD6
 onSqkkfHjwUg9WO1h4O3Deeu7jrkyCkRQ6Q4USgvrIz15wPJACZaaZfCE Q=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: z0+xADyDlv17pxSRe6AN+8Fg23qAPgVIMbHKcBF/lKpXtdyqM2g3pGldk/jroTwvUiNn3pSKA/
 3u47XanV4ahykpp+G5mY1O8kK4YQTBYw3TomyHZ2a+rSEh6fw62GB/AoWmAT06UfW92nDiYBHN
 yZozQcaRigx0xZcgCjOCl3UsaEn7OUJcZIEFQCjx3wK0r1ADhq/agmPufj1YVUEEIlDr/imFJU
 oJ+eVhzOotdGpTwouUGdzA0nVjywdA6WH/YRj6Ana8dfWVU5fausxDOalmsIO0ZngJSQzvxwvC
 +kw=
X-SBRS: 2.7
X-MesageID: 7870495
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.68,240,1569297600"; 
   d="scan'208";a="7870495"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Mon, 28 Oct 2019 15:01:50 +0000
Message-ID: <20191028150152.21179-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH for-4.13 0/2] x86/vtx: Corrections to errata
 workarounds
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
Cc: Juergen Gross <jgross@suse.com>, Kevin Tian <kevin.tian@intel.com>,
 Jan Beulich <JBeulich@suse.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Jun Nakajima <jun.nakajima@intel.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QW5kcmV3IENvb3BlciAoMik6CiAgeDg2L3Z0eDogQ29ycmVjdGlvbnMgdG8gQkZEOTMgZXJyYXRh
IHdvcmthcm91bmQKICB4ODYvdnR4OiBGaXhlcyB0byBIYXN3ZWxsL0Jyb2Fkd2VsbCBMQlIgVFNY
IGVycmF0YQoKIHhlbi9hcmNoL3g4Ni9odm0vdm14L3ZteC5jIHwgMTA4ICsrKysrKysrKysrKysr
KysrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDU2IGluc2Vy
dGlvbnMoKyksIDUyIGRlbGV0aW9ucygtKQoKLS0gCjIuMTEuMAoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
