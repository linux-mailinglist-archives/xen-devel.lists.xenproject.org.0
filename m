Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9085818DA1C
	for <lists+xen-devel@lfdr.de>; Fri, 20 Mar 2020 22:28:16 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jFP8Y-0003t0-FS; Fri, 20 Mar 2020 21:25:02 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=EUly=5F=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jFP8W-0003sv-DO
 for xen-devel@lists.xenproject.org; Fri, 20 Mar 2020 21:25:00 +0000
X-Inumbo-ID: 40a20f5d-6af1-11ea-be18-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 40a20f5d-6af1-11ea-be18-12813bfff9fa;
 Fri, 20 Mar 2020 21:24:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1584739499;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=vEdQWTeM4mFNe9Mt6mPSYLqN/wfy+VIZpDdUFeiiR+w=;
 b=NP+NIXJXw2v93Xpsn2h5vW+vcySw8YOwPErks7TO2Z/zfpowpHNUZl2m
 UbobILhp+RDTVNBASfy85CxPYVAYYVA0QiCOMO04EgpK4BQSbkxswWHa6
 akvfLsaVD6wGtw9IUiweLWj95kMNkuPu85iDSonsYJCdmMdc6D7qMScXG M=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
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
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: UpRC7IfYNjI515Q9Rsm62huPIfvhEgzKb5ZCvjVJ+KL203AZ6T670Pq+yLqmqD0SBCm52BS3ln
 5j08OKVQLDaQerJNV05wjut4jfnFX2yPrYEKJsiCvCrlvkXeaoIjiBOI2xjKtwGdN72I4EGvcv
 W8IwFZob75IJxZERoKCFCdohtp2Oev/OeqVU1kwxbh3tkQ6592sVVMz5cqmR2PsTpF47gk2ZSK
 qy/alxyPFG4bDwAjDXJfv+G0mGExoJ4lLsQxHEWwCc1ztfku4iOY1DzKcQNiZKHCAnksKyFA+N
 wtA=
X-SBRS: 2.7
X-MesageID: 14716096
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,286,1580792400"; d="scan'208";a="14716096"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Fri, 20 Mar 2020 21:24:48 +0000
Message-ID: <20200320212453.21685-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 0/4] x86/ucode: Cleanup - Part 2/n
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Jan Beulich <JBeulich@suse.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VHdvIG1pbm9yIGJ1Z2ZpeGVzLCBhbmQgdHdvIG1pbm9yIGNsZWFudXBzIHdpdGggbWlub3IgYmVu
ZWZpdHMgdG8gb3RoZXIgY29kZQphcyB3ZWxsLgoKVGhlcmUgaXMgbm8gZGVwZW5kZW5jeSBvbiB0
aGUgcmVtYWluaW5nIHBpZWNlcyBvZiB0aGUgUGFydCAxIHNlcmllcy4KCkFuZHJldyBDb29wZXIg
KDQpOgogIHg4Ni91Y29kZS9hbWQ6IEZpeCBhc3NlcnRpb24gaW4gY29tcGFyZV9wYXRjaCgpCiAg
eDg2L3Vjb2RlOiBGaXggZXJyb3IgcGF0aHMgaW4gYXBwbHlfbWljcm9jb2RlKCkKICB4ZW46IERy
b3AgcmF3X3NtcF9wcm9jZXNzb3JfaWQoKQogIHhlbjogSW50cm9kdWNlIGEgeG1lbWR1cF9ieXRl
cygpIGhlbHBlcgoKIHhlbi9hcmNoL3g4Ni9jcHUvbWljcm9jb2RlL2FtZC5jICAgfCAyNyArKysr
KysrKysrKy0tLS0tLS0tLS0tLS0tLS0KIHhlbi9hcmNoL3g4Ni9jcHUvbWljcm9jb2RlL2ludGVs
LmMgfCAyOSArKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLQogeGVuL2luY2x1ZGUvYXNtLWFy
bS9zbXAuaCAgICAgICAgICB8ICAyICstCiB4ZW4vaW5jbHVkZS9hc20teDg2L3NtcC5oICAgICAg
ICAgIHwgIDIgKy0KIHhlbi9pbmNsdWRlL3hlbi9zbXAuaCAgICAgICAgICAgICAgfCAgMiAtLQog
eGVuL2luY2x1ZGUveGVuL3htYWxsb2MuaCAgICAgICAgICB8IDExICsrKysrKysrKysrCiA2IGZp
bGVzIGNoYW5nZWQsIDM3IGluc2VydGlvbnMoKyksIDM2IGRlbGV0aW9ucygtKQoKLS0gCjIuMTEu
MAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
