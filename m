Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 46F51134951
	for <lists+xen-devel@lfdr.de>; Wed,  8 Jan 2020 18:27:08 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ipF4M-0003HP-Fl; Wed, 08 Jan 2020 17:24:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=/AM3=25=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1ipF4K-0003HG-T3
 for xen-devel@lists.xenproject.org; Wed, 08 Jan 2020 17:24:32 +0000
X-Inumbo-ID: bb5387d8-323b-11ea-b861-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id bb5387d8-323b-11ea-b861-12813bfff9fa;
 Wed, 08 Jan 2020 17:24:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1578504271;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=HODhukAblgEi0KXLUXq3HGsv6ZoaQdq52eo34hySp9w=;
 b=PwwkJDvzsvvKUxMpRnZXaqo6Y5UVH8ET+ZrLdckD0moa65tX3VVBjOmg
 4l3P37Fm53bwQiZU3p0ZR8ScQthzA5WJ4AD9M0QEub1n2QaKJ/bl+YkaU
 l0iXhjqjPzzT4cNL5DjFfNRdYqGSNhwg8DHlqSNZXhmkjLHhvhAlV+Bwl U=;
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
IronPort-SDR: ysDd3iCRJ/zspTRASs9biTVVpV+E0ZxAMGIG7HZvr/Lk58GSXcjZJxZEnP7Q9945zK4gXwbeRi
 EJp+hNV5Wpq66eKft0040D3VyJJkgPGOKaCRZYXaj448MyQZLucsvkfkIgZWWUCNjrXeBAIpyV
 Jm4q5nuVrigRQQN5V9iiVMtP0dLciyHQ7l8UiXZImOYz0J3qAACKLSAyvB+EhuvPJMFLvWoLPC
 o7omIXwLXT2rXTYLHl9GwVYjlJ2A0f+O4klz/bJyVGinIZrAACVwGSzvS+qaQAW45YJkbWU0aK
 /KU=
X-SBRS: 2.7
X-MesageID: 11012568
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,410,1571716800"; d="scan'208";a="11012568"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Wed, 8 Jan 2020 17:24:28 +0000
Message-ID: <20200108172428.28672-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v2] x86/mem_sharing: Fix RANDCONFIG build
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Tamas K Lengyel <tamas@tklengyel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VHJhdmlzIHJlcG9ydHM6IGh0dHBzOi8vdHJhdmlzLWNpLm9yZy9hbmR5aGhwL3hlbi9qb2JzLzYz
Mzc1MTgxMQoKICBtZW1fc2hhcmluZy5jOjM2MToxMzogZXJyb3I6ICdybWFwX2hhc19lbnRyaWVz
JyBkZWZpbmVkIGJ1dCBub3QgdXNlZCBbLVdlcnJvcj11bnVzZWQtZnVuY3Rpb25dCiAgIHN0YXRp
YyBib29sIHJtYXBfaGFzX2VudHJpZXMoY29uc3Qgc3RydWN0IHBhZ2VfaW5mbyAqcGFnZSkKICAg
ICAgICAgICAgICAgXgogIGNjMTogYWxsIHdhcm5pbmdzIGJlaW5nIHRyZWF0ZWQgYXMgZXJyb3Jz
CgpUaGlzIGhhcHBlbnMgaW4gYSByZWxlYXNlIGJ1aWxkIChkaXNhYmxlcyBNRU1fU0hBUklOR19B
VURJVCkgd2hlbgpDT05GSUdfTUVNX1NIQVJJTkcgaXMgZW5hYmxlZC4KCkV4cGFuZCBib3RoIHRy
aXZpYWwgaGVscGVycyBpbnRvIHRoZWlyIHNpbmdsZSBjYWxsc2l0ZS4KClNpZ25lZC1vZmYtYnk6
IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+Ci0tLQpDQzogVGFtYXMg
SyBMZW5neWVsIDx0YW1hc0B0a2xlbmd5ZWwuY29tPgoKdjI6CiAqIEV4cGFuZCwgcmF0aGVyIHRo
YW4gbWFyayBhcyBfX21heWJlX3VudXNlZAotLS0KIHhlbi9hcmNoL3g4Ni9tbS9tZW1fc2hhcmlu
Zy5jIHwgMTYgKystLS0tLS0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygr
KSwgMTQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L21tL21lbV9zaGFy
aW5nLmMgYi94ZW4vYXJjaC94ODYvbW0vbWVtX3NoYXJpbmcuYwppbmRleCBkZGYxZjBmOWY5Li42
NGRkMzY4OWRmIDEwMDY0NAotLS0gYS94ZW4vYXJjaC94ODYvbW0vbWVtX3NoYXJpbmcuYworKysg
Yi94ZW4vYXJjaC94ODYvbW0vbWVtX3NoYXJpbmcuYwpAQCAtMzUxLDE4ICszNTEsNiBAQCBzdGF0
aWMgZ2ZuX2luZm9fdCAqcm1hcF9yZXRyaWV2ZSh1aW50MTZfdCBkb21haW5faWQsIHVuc2lnbmVk
IGxvbmcgZ2ZuLAogICAgIHJldHVybiBOVUxMOwogfQogCi0vKiBSZXR1cm5zIHRydWUgaWYgdGhl
IHJtYXAgaGFzIG9ubHkgb25lIGVudHJ5LiBPKDEpIGNvbXBsZXhpdHkuICovCi1zdGF0aWMgYm9v
bCBybWFwX2hhc19vbmVfZW50cnkoY29uc3Qgc3RydWN0IHBhZ2VfaW5mbyAqcGFnZSkKLXsKLSAg
ICByZXR1cm4gcm1hcF9jb3VudChwYWdlKSA9PSAxOwotfQotCi0vKiBSZXR1cm5zIHRydWUgaWYg
dGhlIHJtYXAgaGFzIGFueSBlbnRyaWVzLiBPKDEpIGNvbXBsZXhpdHkuICovCi1zdGF0aWMgYm9v
bCBybWFwX2hhc19lbnRyaWVzKGNvbnN0IHN0cnVjdCBwYWdlX2luZm8gKnBhZ2UpCi17Ci0gICAg
cmV0dXJuIHJtYXBfY291bnQocGFnZSkgIT0gMDsKLX0KLQogLyoKICAqIFRoZSBpdGVyYXRvciBo
aWRlcyB0aGUgZGV0YWlscyBvZiBob3cgdGhlIHJtYXAgaXMgaW1wbGVtZW50ZWQuIFRoaXMKICAq
IGludm9sdmVzIHNwbGl0dGluZyB0aGUgbGlzdF9mb3JfZWFjaF9zYWZlIG1hY3JvIGludG8gdHdv
IHN0ZXBzLgpAQCAtNTMxLDcgKzUxOSw3IEBAIHN0YXRpYyBpbnQgYXVkaXQodm9pZCkKICAgICAg
ICAgfQogCiAgICAgICAgIC8qIENoZWNrIHdlIGhhdmUgYSBsaXN0ICovCi0gICAgICAgIGlmICgg
KCFwZy0+c2hhcmluZykgfHwgIXJtYXBfaGFzX2VudHJpZXMocGcpICkKKyAgICAgICAgaWYgKCAo
IXBnLT5zaGFyaW5nKSB8fCBybWFwX2NvdW50KHBnKSA9PSAwICkKICAgICAgICAgewogICAgICAg
ICAgICAgTUVNX1NIQVJJTkdfREVCVUcoIm1mbiAlbHggc2hhcmVkLCBidXQgZW1wdHkgZ2ZuIGxp
c3QhXG4iLAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgbWZuX3gobWZuKSk7CkBAIC0x
MjIwLDcgKzEyMDgsNyBAQCBpbnQgX19tZW1fc2hhcmluZ191bnNoYXJlX3BhZ2Uoc3RydWN0IGRv
bWFpbiAqZCwKICAgICAgKiBEbyB0aGUgYWNjb3VudGluZyBmaXJzdC4gSWYgYW55dGhpbmcgZmFp
bHMgYmVsb3csIHdlIGhhdmUgYmlnZ2VyCiAgICAgICogYmlnZ2VyIGZpc2ggdG8gZnJ5LiBGaXJz
dCwgcmVtb3ZlIHRoZSBnZm4gZnJvbSB0aGUgbGlzdC4KICAgICAgKi8KLSAgICBsYXN0X2dmbiA9
IHJtYXBfaGFzX29uZV9lbnRyeShwYWdlKTsKKyAgICBsYXN0X2dmbiA9IHJtYXBfY291bnQocGFn
ZSkgPT0gMTsKICAgICBpZiAoIGxhc3RfZ2ZuICkKICAgICB7CiAgICAgICAgIC8qCi0tIAoyLjEx
LjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
