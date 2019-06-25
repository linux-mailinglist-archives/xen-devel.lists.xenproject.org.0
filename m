Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C152055269
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jun 2019 16:46:40 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hfmgP-00033m-AO; Tue, 25 Jun 2019 14:44:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Ot0M=UY=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hfmgO-00033h-Le
 for xen-devel@lists.xenproject.org; Tue, 25 Jun 2019 14:44:28 +0000
X-Inumbo-ID: ba2b56ee-9757-11e9-b050-9f325b346f34
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ba2b56ee-9757-11e9-b050-9f325b346f34;
 Tue, 25 Jun 2019 14:44:25 +0000 (UTC)
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: UEdUF6x2biZlXPYpShersNQuP8GGGoypxJNbcnalodYmrezOj9ZFgA9N7zzskk9KwLoJAqJuHL
 piFfKC4rasvQjYnElX55hCXk3a8xyaS+UPpWLotYbgmUg9n13R++LnDG02O92CbNxu+q9hBxpS
 gtsMHR3y3POzM4mLfgWJ3vchKVVtuVtIbDJkjq9cr/dz2akhhF9u4ZE8+uA7snJEuOEMNbuqzY
 LCqvwkU7VMiAqcF9Fgsj42F78AapP+EwOLe9nakZ1sGaENfFZAaSsPh+6p2KLceMG08CXMr+Mc
 VN8=
X-SBRS: 2.7
X-MesageID: 2215123
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,416,1557201600"; 
   d="scan'208";a="2215123"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Tue, 25 Jun 2019 15:43:48 +0100
Message-ID: <20190625144350.6176-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190625144350.6176-1-andrew.cooper3@citrix.com>
References: <20190625144350.6176-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 1/3] page-alloc: Rename the first_node local
 variable
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
 George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien.grall@arm.com>,
 Jan Beulich <JBeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Zmlyc3Rfbm9kZSBpcyB0aGUgbmFtZSBvZiBhIGxvY2FsIHZhcmlhYmxlLCBhbmQgcGFydCBvZiB0
aGUgbm9kZW1hc2sgQVBJLiAgVGhlCm9ubHkgcmVhc29uIHRoaXMgY29tcGlsZXMgaXMgYmVjYXVz
ZSB0aGUgbm9kZW1hc2sgQVBJIGlzIGltcGxlbWVudGVkIGFzIGEKbWFjcm8gcmF0aGVyIHRoYW4g
YW4gaW5saW5lIGZ1bmN0aW9uLgoKSXQgaXMgY29uZnVzaW5nIHRvIHJlYWQsIGFuZCBicmVha3Mg
d2hlbiB0aGUgbm9kZW1hc2sgQVBJIGlzIGNsZWFuZWQgdXAuClJlbmFtZSB0aGUgbG9jYWwgdmFy
aWFibGUgdG8ganVzdCAnZmlyc3QnIHdoaWNoIGlzIHN0aWxsIGNsZWFyIGluIGNvbnRleHQuCgpO
byBmdW5jdGlvbmFsIGNoYW5nZS4KClNpZ25lZC1vZmYtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJl
dy5jb29wZXIzQGNpdHJpeC5jb20+Ci0tLQpDQzogSmFuIEJldWxpY2ggPEpCZXVsaWNoQHN1c2Uu
Y29tPgpDQzogV2VpIExpdSA8d2xAeGVuLm9yZz4KQ0M6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2Vy
LnBhdUBjaXRyaXguY29tPgpDQzogU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJu
ZWwub3JnPgpDQzogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KQ0M6IEdlb3Jn
ZSBEdW5sYXAgPGdlb3JnZS5kdW5sYXBAZXUuY2l0cml4LmNvbT4KCnYyOgogKiBOZXcKLS0tCiB4
ZW4vY29tbW9uL3BhZ2VfYWxsb2MuYyB8IDEwICsrKysrLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA1
IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2NvbW1vbi9w
YWdlX2FsbG9jLmMgYi94ZW4vY29tbW9uL3BhZ2VfYWxsb2MuYwppbmRleCA3ODI1ZmQ4YzQyLi43
YmJiNDRmN2QxIDEwMDY0NAotLS0gYS94ZW4vY29tbW9uL3BhZ2VfYWxsb2MuYworKysgYi94ZW4v
Y29tbW9uL3BhZ2VfYWxsb2MuYwpAQCAtODEwLDcgKzgxMCw3IEBAIHN0YXRpYyBzdHJ1Y3QgcGFn
ZV9pbmZvICpnZXRfZnJlZV9idWRkeSh1bnNpZ25lZCBpbnQgem9uZV9sbywKICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1bnNpZ25lZCBpbnQgb3JkZXIsIHVuc2lnbmVk
IGludCBtZW1mbGFncywKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBj
b25zdCBzdHJ1Y3QgZG9tYWluICpkKQogewotICAgIG5vZGVpZF90IGZpcnN0X25vZGUsIG5vZGUg
PSBNRU1GX2dldF9ub2RlKG1lbWZsYWdzKSwgcmVxX25vZGUgPSBub2RlOworICAgIG5vZGVpZF90
IGZpcnN0LCBub2RlID0gTUVNRl9nZXRfbm9kZShtZW1mbGFncyksIHJlcV9ub2RlID0gbm9kZTsK
ICAgICBub2RlbWFza190IG5vZGVtYXNrID0gZCA/IGQtPm5vZGVfYWZmaW5pdHkgOiBub2RlX29u
bGluZV9tYXA7CiAgICAgdW5zaWduZWQgaW50IGosIHpvbmUsIG5vZGVtYXNrX3JldHJ5ID0gMDsK
ICAgICBzdHJ1Y3QgcGFnZV9pbmZvICpwZzsKQEAgLTgzMiw3ICs4MzIsNyBAQCBzdGF0aWMgc3Ry
dWN0IHBhZ2VfaW5mbyAqZ2V0X2ZyZWVfYnVkZHkodW5zaWduZWQgaW50IHpvbmVfbG8sCiAgICAg
ICAgIEFTU0VSVF9VTlJFQUNIQUJMRSgpOwogICAgICAgICByZXR1cm4gTlVMTDsKICAgICB9Ci0g
ICAgZmlyc3Rfbm9kZSA9IG5vZGU7CisgICAgZmlyc3QgPSBub2RlOwogCiAgICAgLyoKICAgICAg
KiBTdGFydCB3aXRoIHJlcXVlc3RlZCBub2RlLCBidXQgZXhoYXVzdCBhbGwgbm9kZSBtZW1vcnkg
aW4gcmVxdWVzdGVkCkBAIC04NzgsMTkgKzg3OCwxOSBAQCBzdGF0aWMgc3RydWN0IHBhZ2VfaW5m
byAqZ2V0X2ZyZWVfYnVkZHkodW5zaWduZWQgaW50IHpvbmVfbG8sCiAgICAgICAgIHsKICAgICAg
ICAgICAgIC8qIFZlcnkgZmlyc3Qgbm9kZSBtYXkgYmUgY2FsbGVyLXNwZWNpZmllZCBhbmQgb3V0
c2lkZSBub2RlbWFzay4gKi8KICAgICAgICAgICAgIEFTU0VSVCghbm9kZW1hc2tfcmV0cnkpOwot
ICAgICAgICAgICAgZmlyc3Rfbm9kZSA9IG5vZGUgPSBmaXJzdF9ub2RlKG5vZGVtYXNrKTsKKyAg
ICAgICAgICAgIGZpcnN0ID0gbm9kZSA9IGZpcnN0X25vZGUobm9kZW1hc2spOwogICAgICAgICAg
ICAgaWYgKCBub2RlIDwgTUFYX05VTU5PREVTICkKICAgICAgICAgICAgICAgICBjb250aW51ZTsK
ICAgICAgICAgfQogICAgICAgICBlbHNlIGlmICggKG5vZGUgPSBuZXh0X25vZGUobm9kZSwgbm9k
ZW1hc2spKSA+PSBNQVhfTlVNTk9ERVMgKQogICAgICAgICAgICAgbm9kZSA9IGZpcnN0X25vZGUo
bm9kZW1hc2spOwotICAgICAgICBpZiAoIG5vZGUgPT0gZmlyc3Rfbm9kZSApCisgICAgICAgIGlm
ICggbm9kZSA9PSBmaXJzdCApCiAgICAgICAgIHsKICAgICAgICAgICAgIC8qIFdoZW4gd2UgaGF2
ZSB0cmllZCBhbGwgaW4gbm9kZW1hc2ssIHdlIGZhbGwgYmFjayB0byBvdGhlcnMuICovCiAgICAg
ICAgICAgICBpZiAoIChtZW1mbGFncyAmIE1FTUZfZXhhY3Rfbm9kZSkgfHwgbm9kZW1hc2tfcmV0
cnkrKyApCiAgICAgICAgICAgICAgICAgcmV0dXJuIE5VTEw7CiAgICAgICAgICAgICBub2Rlc19h
bmRub3Qobm9kZW1hc2ssIG5vZGVfb25saW5lX21hcCwgbm9kZW1hc2spOwotICAgICAgICAgICAg
Zmlyc3Rfbm9kZSA9IG5vZGUgPSBmaXJzdF9ub2RlKG5vZGVtYXNrKTsKKyAgICAgICAgICAgIGZp
cnN0ID0gbm9kZSA9IGZpcnN0X25vZGUobm9kZW1hc2spOwogICAgICAgICAgICAgaWYgKCBub2Rl
ID49IE1BWF9OVU1OT0RFUyApCiAgICAgICAgICAgICAgICAgcmV0dXJuIE5VTEw7CiAgICAgICAg
IH0KLS0gCjIuMTEuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
