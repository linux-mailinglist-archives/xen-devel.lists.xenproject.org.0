Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7697D15060B
	for <lists+xen-devel@lfdr.de>; Mon,  3 Feb 2020 13:22:15 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iyahP-0007tn-Es; Mon, 03 Feb 2020 12:19:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=MGDo=3X=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1iyahO-0007ti-Bq
 for xen-devel@lists.xenproject.org; Mon, 03 Feb 2020 12:19:30 +0000
X-Inumbo-ID: 6d097c4c-467f-11ea-b211-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6d097c4c-467f-11ea-b211-bc764e2007e4;
 Mon, 03 Feb 2020 12:19:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1580732370;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=nPLDyhNNa80+ykmbJS2lvys9u7qY0PccZzJLVRpqPAY=;
 b=RpEURyZ68UrZbfWi1mZ7liA3eGssdTH+lgwFCHxT8prmDn6Ls2KbbG+T
 lo5sKTCZbRmymgTDgLFgtPOO9RLd2gZina6r5SZjJ4N2rXgADn1afGv/R
 7GnBXSM3y7b69xBUE0Lf24H1KDUaC5AWSpKLCuXnVNPViZZwLuLBHv6WN g=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
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
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: ZK0xLk7AqrcaetwlxCpd6E7zY3G5Y+p/bBGy7jlRcLXPkn8JvGS8s99M+YUDcL6eNGVlphLtt7
 qvh3h5s0Ida+GTjxFdGcKazCthGm+KMZlRJbBJr9Vc0e5Q2bNVqNBbSH5bCL1/trqp0zt+qJN/
 dGe50gyU5c/atOhzjYlv+GgIK3aR35iz9IE6tbUbdPkFfIavZqVKA8G23wRRrNRiURZcu7sseX
 TjcZdVBUgTcXA5lvXhjQc1qgB63zrm6EfOjYmqyQjpgfZlYLPdsJU76hHL9ic0cQkVCQfxsLMB
 xwo=
X-SBRS: 2.7
X-MesageID: 12013892
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,397,1574139600"; d="scan'208";a="12013892"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Mon, 3 Feb 2020 13:19:15 +0100
Message-ID: <20200203121919.15748-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v2 0/4] x86/vvmx: fixes to interrupt injection
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
 Ian Jackson <ian.jackson@eu.citrix.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGVsbG8sCgpUaGUgZm9sbG93aW5nIHNlcmllcyBjb250YWluIGZpeGVzIGZvciBuZXN0ZWQgaW50
ZXJydXB0IGluamVjdGlvbi4KClRoYW5rcywgUm9nZXIuCgpSb2dlciBQYXUgTW9ubmUgKDQpOgog
IHg4Ni92dm14OiBmaXggdmlydHVhbCBpbnRlcnJ1cHQgaW5qZWN0aW9uIHdoZW4gQWNrIG9uIGV4
aXQgY29udHJvbCBpcwogICAgdXNlZAogIHg4Ni92dm14OiBmaXggVk1fRVhJVF9BQ0tfSU5UUl9P
Tl9FWElUIGhhbmRsaW5nCiAgeDg2L3Z2bXg6IGRvbid0IGVuYWJsZSBpbnRlcnJ1cHQgd2luZG93
IHdoZW4gdXNpbmcgdmlydCBpbnRyIGRlbGl2ZXJ5CiAgUmV2ZXJ0ICJ0b29scy9saWJ4YzogZGlz
YWJsZSB4MkFQSUMgd2hlbiB1c2luZyBuZXN0ZWQgdmlydHVhbGl6YXRpb24iCgogdG9vbHMvbGli
eGMveGNfY3B1aWRfeDg2LmMgIHwgMTEgLS0tLS0tLS0tLS0KIHhlbi9hcmNoL3g4Ni9odm0vdm14
L2ludHIuYyB8ICAyICstCiB4ZW4vYXJjaC94ODYvaHZtL3ZteC92dm14LmMgfCAxMyArKysrKysr
KysrLS0tCiAzIGZpbGVzIGNoYW5nZWQsIDExIGluc2VydGlvbnMoKyksIDE1IGRlbGV0aW9ucygt
KQoKLS0gCjIuMjUuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
