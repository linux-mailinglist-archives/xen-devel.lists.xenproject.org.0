Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F430772CE
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jul 2019 22:35:23 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hr6tF-0007S2-Fu; Fri, 26 Jul 2019 20:32:33 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=fOBC=VX=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hr6tD-0007Ri-9t
 for xen-devel@lists.xenproject.org; Fri, 26 Jul 2019 20:32:31 +0000
X-Inumbo-ID: 7b1ecb16-afe4-11e9-82ba-4318581a012c
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7b1ecb16-afe4-11e9-82ba-4318581a012c;
 Fri, 26 Jul 2019 20:32:27 +0000 (UTC)
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 2qGDk3Fcpv3iFgZlTq1SQxCz+ePirgQ85xL1K86CoKu8yD11XfOUNatRfJVfiA8XL/gFUaFzqa
 5UIEpThnJe+kmOtd/TyG3IHy4zy1VmoOg8w6hSYxe/GJZKSKw9oVQaLfIu62jhe5ULWPCkaqZA
 A5zX2sscGzOvs81GbaoFWPfMTstr7VPW3IzhYe+ocbJZrUaWmhhV/La+dWqwNTvO5uFXRlFoM8
 GD65036jO4osQaFUrLsOzcHIYF2sYuGAqG+x5UnZh1VyoBBv4ic/PGucH+IoIApBA8Z/kNr5MO
 6Io=
X-SBRS: 2.7
X-MesageID: 3492871
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,312,1559534400"; 
   d="scan'208";a="3492871"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Fri, 26 Jul 2019 21:32:20 +0100
Message-ID: <20190726203222.4833-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v2 0/2] x86/xpti: Don't leak TSS-adjacent percpu
 data via Meltdown
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien.grall@arm.com>,
 Jan Beulich <JBeulich@suse.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

UmV3b3JrZWQgdG8gYWxsb3cgREVGSU5FX1BFUl9DUFVfUEFHRV9BTElHTkVEKCkgdG8gc3BlY2lm
eSB0aGUKX19hbGlnbmVkKFBBR0VfU0laRSkgaXRzZWxmLgoKQW5kcmV3IENvb3BlciAoMik6CiAg
eGVuL2xpbms6IEludHJvZHVjZSAuYnNzLnBlcmNwdS5wYWdlX2FsaWduZWQKICB4ODYveHB0aTog
RG9uJ3QgbGVhayBUU1MtYWRqYWNlbnQgcGVyY3B1IGRhdGEgdmlhIE1lbHRkb3duCgogeGVuL2Fy
Y2gvYXJtL3hlbi5sZHMuUyAgICAgICAgICB8ICA1ICsrKy0tCiB4ZW4vYXJjaC94ODYvc2V0dXAu
YyAgICAgICAgICAgIHwgIDMgLS0tCiB4ZW4vYXJjaC94ODYvdHJhcHMuYyAgICAgICAgICAgIHwg
IDYgKysrKysrCiB4ZW4vYXJjaC94ODYveGVuLmxkcy5TICAgICAgICAgIHwgIDcgKysrKystLQog
eGVuL2luY2x1ZGUvYXNtLWFybS9wZXJjcHUuaCAgICB8ICA2ICsrLS0tLQogeGVuL2luY2x1ZGUv
YXNtLXg4Ni9wZXJjcHUuaCAgICB8ICA2ICsrLS0tLQogeGVuL2luY2x1ZGUvYXNtLXg4Ni9wcm9j
ZXNzb3IuaCB8ICA0ICsrLS0KIHhlbi9pbmNsdWRlL3hlbi9wZXJjcHUuaCAgICAgICAgfCAxMCAr
KysrKysrKy0tCiA4IGZpbGVzIGNoYW5nZWQsIDI4IGluc2VydGlvbnMoKyksIDE5IGRlbGV0aW9u
cygtKQoKLS0gCjIuMTEuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
