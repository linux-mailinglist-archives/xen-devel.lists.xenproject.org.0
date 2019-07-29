Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CBC6578B82
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jul 2019 14:15:16 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hs4Vg-0006c2-4z; Mon, 29 Jul 2019 12:12:12 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=hB3/=V2=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hs4Ve-0006bl-PC
 for xen-devel@lists.xenproject.org; Mon, 29 Jul 2019 12:12:10 +0000
X-Inumbo-ID: 16772d31-b1fa-11e9-8980-bc764e045a96
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 16772d31-b1fa-11e9-8980-bc764e045a96;
 Mon, 29 Jul 2019 12:12:09 +0000 (UTC)
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: aq2XepDnFyMLnK9OtWXd6SgrQQAcA/e+Cw3RfAxXnxYoNAVf9Ib/mcXkpBpY04FaTAisXmYPfS
 Qg9d8HoLWcCiCqHhiv4nFsIGwSyowaNbvK07yvZduz2yHEu0bs21xjsRU/ccHfbs2P6Rcxittp
 Ov2KqvUhFUr2B4x5iAQ24+fFuvu9eg+RqYHXlChhJvBZyPypolgO/XIr6j7EmLqsxCvjuqYejW
 oz6IEz+kUxnyMXBcTbZ82tXuKGs9tUoGHXE1wNCjQMZq9vTHlCKyMEUNDP3ZNbmd0yMLt2AtYX
 1K4=
X-SBRS: 2.7
X-MesageID: 3672658
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,322,1559534400"; 
   d="scan'208";a="3672658"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Mon, 29 Jul 2019 13:11:55 +0100
Message-ID: <20190729121204.13559-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190729121204.13559-1-andrew.cooper3@citrix.com>
References: <20190729121204.13559-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v3 01/10] page-alloc: Clamp get_free_buddy() to
 online nodes
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

ZC0+bm9kZV9hZmZpbml0eSBkZWZhdWx0cyB0byBOT0RFX01BU0tfQUxMIHdoaWNoIGhhcyBiaXRz
IHNldCBvdXRzaWRlIG9mCm5vZGVfb25saW5lX21hcC4gIFRoaXMgaW4gdHVybiBjYXVzZXMgdGhl
IGxvb3AgaW4gZ2V0X2ZyZWVfYnVkZHkoKSB0byB3YXN0ZQplZmZvcnQgaXRlcmF0aW5nIG92ZXIg
b2ZmbGluZSBub2Rlcy4KCkFsd2F5cyBjbGFtcCBkLT5ub2RlX2FmZmluaXR5IHRvIG5vZGVfb25s
aW5lX21hcCB3aGVuIGluIHVzZS4KClNpZ25lZC1vZmYtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJl
dy5jb29wZXIzQGNpdHJpeC5jb20+CkFja2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3Vz
ZS5jb20+Ci0tLQpDQzogSmFuIEJldWxpY2ggPEpCZXVsaWNoQHN1c2UuY29tPgpDQzogV2VpIExp
dSA8d2xAeGVuLm9yZz4KQ0M6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29t
PgpDQzogU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPgpDQzogSnVs
aWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KQ0M6IEdlb3JnZSBEdW5sYXAgPGdlb3Jn
ZS5kdW5sYXBAZXUuY2l0cml4LmNvbT4KCnYzOgogKiBSZWJhc2UgdG8gYmVmb3JlIHRoZSBub2Rl
bWFzayBBUEkgY2xlYW51cCwgdG8gbWFrZSBpdCBlYXNpZXIgdG8gYmFja3BvcnQuCnYyOgogKiBS
ZWJhc2Ugb3ZlciB0aGUgbm9kZW1hc2sgQVBJIGNoYW5nZSwgYW5kIGltcGxlbWVudCB3aXRoIGEg
c2luZ2xlCiAgIG5vZGVzX2FuZCgpCi0tLQogeGVuL2NvbW1vbi9wYWdlX2FsbG9jLmMgfCA5ICsr
KysrKysrLQogMSBmaWxlIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoK
ZGlmZiAtLWdpdCBhL3hlbi9jb21tb24vcGFnZV9hbGxvYy5jIGIveGVuL2NvbW1vbi9wYWdlX2Fs
bG9jLmMKaW5kZXggNDRhNzJkMGIxOS4uZWZhNDM3YzdkZiAxMDA2NDQKLS0tIGEveGVuL2NvbW1v
bi9wYWdlX2FsbG9jLmMKKysrIGIveGVuL2NvbW1vbi9wYWdlX2FsbG9jLmMKQEAgLTgxMSwxMSAr
ODExLDE4IEBAIHN0YXRpYyBzdHJ1Y3QgcGFnZV9pbmZvICpnZXRfZnJlZV9idWRkeSh1bnNpZ25l
ZCBpbnQgem9uZV9sbywKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBj
b25zdCBzdHJ1Y3QgZG9tYWluICpkKQogewogICAgIG5vZGVpZF90IGZpcnN0LCBub2RlID0gTUVN
Rl9nZXRfbm9kZShtZW1mbGFncyksIHJlcV9ub2RlID0gbm9kZTsKLSAgICBub2RlbWFza190IG5v
ZGVtYXNrID0gZCA/IGQtPm5vZGVfYWZmaW5pdHkgOiBub2RlX29ubGluZV9tYXA7CisgICAgbm9k
ZW1hc2tfdCBub2RlbWFzayA9IG5vZGVfb25saW5lX21hcDsKICAgICB1bnNpZ25lZCBpbnQgaiwg
em9uZSwgbm9kZW1hc2tfcmV0cnkgPSAwOwogICAgIHN0cnVjdCBwYWdlX2luZm8gKnBnOwogICAg
IGJvb2wgdXNlX3Vuc2NydWJiZWQgPSAobWVtZmxhZ3MgJiBNRU1GX25vX3NjcnViKTsKIAorICAg
IC8qCisgICAgICogZC0+bm9kZV9hZmZpbml0eSBpcyBvdXIgcHJlZmVycmVkIGFsbG9jYXRpb24g
c2V0IGlmIHByb3ZpZGVkLCBidXQgaXQKKyAgICAgKiBtYXkgaGF2ZSBiaXQgc2V0IG91dHNpZGUg
b2Ygbm9kZV9vbmxpbmVfbWFwLiAgQ2xhbXAgaXQuCisgICAgICovCisgICAgaWYgKCBkICkKKyAg
ICAgICAgbm9kZXNfYW5kKG5vZGVtYXNrLCBub2RlbWFzaywgZC0+bm9kZV9hZmZpbml0eSk7CisK
ICAgICBpZiAoIG5vZGUgPT0gTlVNQV9OT19OT0RFICkKICAgICB7CiAgICAgICAgIGlmICggZCAh
PSBOVUxMICkKLS0gCjIuMTEuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
