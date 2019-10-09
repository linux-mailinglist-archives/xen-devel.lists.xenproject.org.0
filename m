Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0677FD19F6
	for <lists+xen-devel@lfdr.de>; Wed,  9 Oct 2019 22:43:29 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iIIkw-0000kg-5k; Wed, 09 Oct 2019 20:40:22 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=oEee=YC=citrix.com=igor.druzhinin@srs-us1.protection.inumbo.net>)
 id 1iIIku-0000kI-BW
 for xen-devel@lists.xenproject.org; Wed, 09 Oct 2019 20:40:20 +0000
X-Inumbo-ID: fcb423a8-ead4-11e9-97f9-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id fcb423a8-ead4-11e9-97f9-12813bfff9fa;
 Wed, 09 Oct 2019 20:40:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1570653611;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=3yZ+qX2raC25cFSjaFhjUelclgLPU8erspmvsYEsNS4=;
 b=VVggxNDJvqdnkBQ3HChiSCvf+YKfQhA2p/6uc/s2Lml+AJ66HJOtzxv7
 VQmJiV8dxrvFrXOxlM3sttfimaPyHO9aJQ8HQ7R77eVr8bDxm+CIDdBzE
 cn0OMbHs59Hm/J9l/xVlYup11Nke4bIM8aLaJwhm0NG93dqOg3+uM7H0t 0=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=igor.druzhinin@citrix.com;
 spf=Pass smtp.mailfrom=igor.druzhinin@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 igor.druzhinin@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="igor.druzhinin@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 igor.druzhinin@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="igor.druzhinin@citrix.com";
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
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: ttgu0X3XqvrCWE/ECLqmST/sVuA+DDT4DqhYmuZh4+6ID8971R9PIM2O+pbKZUQk4rhnR1h7Xg
 1qkUm5OvRvLPYi9KhAcGqEFQpz1BgzWXsKkH/pTc4zotqIlle+LyVHFdmSd3iHuApOnMt+EcKj
 lBxPp+EIKEvV/mPbYBHuLmadqMVewFWNgGVNg42J8XJdOy8aN+U7ooMyUyYQS6CCjIbUOOrRe/
 mO+tveP0yGLQZ76gBavX2K1OJb/NKjJD/qBwx+bGqXXTSOihKbYiALJU8xCo5PGPqGZgE7bms4
 obU=
X-SBRS: 2.7
X-MesageID: 6761495
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.67,277,1566878400"; 
   d="scan'208";a="6761495"
From: Igor Druzhinin <igor.druzhinin@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Wed, 9 Oct 2019 21:40:03 +0100
Message-ID: <1570653603-9889-4-git-send-email-igor.druzhinin@citrix.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1570653603-9889-1-git-send-email-igor.druzhinin@citrix.com>
References: <1570653603-9889-1-git-send-email-igor.druzhinin@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH for-4.13 v2 3/3] efi/boot: make sure graphics
 mode is set while booting through MB2
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
Cc: jgross@suse.com, Igor Druzhinin <igor.druzhinin@citrix.com>, wl@xen.org,
 andrew.cooper3@citrix.com, jbeulich@suse.com, roger.pau@citrix.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SWYgYSBib290bG9hZGVyIGlzIHVzaW5nIG5hdGl2ZSBkcml2ZXIgaW5zdGVhZCBvZiBFRkkgR09Q
IGl0IG1pZ2h0CnJlc2V0IGdyYXBoaWNzIG1vZGUgdG8gYmUgZGlmZmVyZW50IGZyb20gd2hhdCBo
YXMgYmVlbiBvcmlnaW5hbGx5IHNldApieSBmaXJtd2FyZS4gV2hpbGUgYm9vdGluZyB0aHJvdWdo
IE1CMiBYZW4gZWl0aGVyIG5lZWQgdG8gcGFyc2UgdmlkZW8Kc2V0dGluZyBwYXNzZWQgYnkgTUIy
IGFuZCB1c2UgdGhlbSBpbnN0ZWFkIG9mIHdoYXQgR09QIHJlcG9ydHMgb3IKcmVzZXQgdGhlIG1v
ZGUgdG8gc3luY2hyb25pc2UgaXQgd2l0aCBmaXJtd2FyZSAtIHByZWZlciB0aGUgbGF0dGVyLgoK
T2JzZXJ2ZWQgd2hpbGUgYm9vdGluZyBYZW4gdXNpbmcgTUIyIHdpdGggRUZJIEdSVUIyIGNvbXBp
bGVkIHdpdGgKYWxsIHBvc3NpYmxlIHZpZGVvIGRyaXZlcnMgd2hlcmUgbmF0aXZlIGRyaXZlcnMg
dGFrZSBwcmlvcml0eSBvdmVyIGZpcm13YXJlLgoKU2lnbmVkLW9mZi1ieTogSWdvciBEcnV6aGlu
aW4gPGlnb3IuZHJ1emhpbmluQGNpdHJpeC5jb20+Ci0tLQogeGVuL2NvbW1vbi9lZmkvYm9vdC5j
IHwgOCArKysrKystLQogMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlv
bnMoLSkKCmRpZmYgLS1naXQgYS94ZW4vY29tbW9uL2VmaS9ib290LmMgYi94ZW4vY29tbW9uL2Vm
aS9ib290LmMKaW5kZXggNmNlZjQyOS4uNmIwNjljNCAxMDA2NDQKLS0tIGEveGVuL2NvbW1vbi9l
ZmkvYm9vdC5jCisrKyBiL3hlbi9jb21tb24vZWZpL2Jvb3QuYwpAQCAtMTA1MSw4ICsxMDUxLDEy
IEBAIHN0YXRpYyB2b2lkIF9faW5pdCBlZmlfc2V0X2dvcF9tb2RlKEVGSV9HUkFQSElDU19PVVRQ
VVRfUFJPVE9DT0wgKmdvcCwgVUlOVE4gZ29wCiAgICAgRUZJX1NUQVRVUyBzdGF0dXM7CiAgICAg
VUlOVE4gaW5mb19zaXplOwogCi0gICAgLyogU2V0IGdyYXBoaWNzIG1vZGUuICovCi0gICAgaWYg
KCBnb3BfbW9kZSA8IGdvcC0+TW9kZS0+TWF4TW9kZSAmJiBnb3BfbW9kZSAhPSBnb3AtPk1vZGUt
Pk1vZGUgKQorICAgIC8qCisgICAgICogU2V0IGdyYXBoaWNzIG1vZGUgdG8gYSBzZWxlY3RlZCBv
bmUgYW5kIHJlc2V0IGl0IGlmIHdlIGRpZG4ndCBjb21lCisgICAgICogZGlyZWN0bHkgZnJvbSBF
RkkgbG9hZGVyIGFzIHZpZGVvIHNldHRpbmdzIG1pZ2h0IGhhdmUgYmVlbiBhbHJlYWR5IG1vZGlm
aWVkLgorICAgICAqLworICAgIGlmICggZ29wX21vZGUgPCBnb3AtPk1vZGUtPk1heE1vZGUgJiYK
KyAgICAgICAgIChnb3BfbW9kZSAhPSBnb3AtPk1vZGUtPk1vZGUgfHwgIWVmaV9lbmFibGVkKEVG
SV9MT0FERVIpKSApCiAgICAgICAgIGdvcC0+U2V0TW9kZShnb3AsIGdvcF9tb2RlKTsKIAogICAg
IC8qIEdldCBncmFwaGljcyBhbmQgZnJhbWUgYnVmZmVyIGluZm8uICovCi0tIAoyLjcuNAoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
