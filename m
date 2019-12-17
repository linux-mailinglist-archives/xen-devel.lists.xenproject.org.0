Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 22817122D7D
	for <lists+xen-devel@lfdr.de>; Tue, 17 Dec 2019 14:53:42 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ihDEo-0007lv-Nv; Tue, 17 Dec 2019 13:50:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=UMsG=2H=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1ihDEn-0007lN-2D
 for xen-devel@lists.xenproject.org; Tue, 17 Dec 2019 13:50:09 +0000
X-Inumbo-ID: 1e19cd88-20d4-11ea-88e7-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1e19cd88-20d4-11ea-88e7-bc764e2007e4;
 Tue, 17 Dec 2019 13:50:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1576590601;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=4p3kNmGaylaZ5Y0P9rAk8EWRyR7xVR/T8n6pJCGyySM=;
 b=Dz7jmTg1fesnJ8UZnvWstnhBD4ljvJFs12KXi4c86fYjaCZddtq/KuL8
 kJQTIxgNHE9fzuV66IrdRReBZeIzWLIXJTS54ClQ68tqL5EqVtVVVNeVc
 3euz4I/WSPd9JzXRmxQysUyqKqZlpdr7hk4hgYXIeK+VdR8J50wWOIcnN s=;
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: vP0fG9y8OEBKMuRvzBNS+FETm9La9TyZFhPaeqERxOQA+s3A6aWAv55EXOvLh313OuMTo+fun2
 8d6KH6xv5HAN4Eigl+3UB5FRDaavLEmKWosGYKVHmfrm+LnGt4QYcfToTRrMDn4Vml5SYf3/F+
 KK79jOxX4EREC9gJ4LbqOXQkU9hyICy0azcO0J9bVFfaY2qJEZZix7bkKvR/qgg8txD2kasDoW
 HbS9Cpi5OgjJAMd9y0APd9AyqN1tPhKnIniPWiuf9Wc/0y8sQMkczuqmM9nXCEqvyYQZYW5bVv
 0PM=
X-SBRS: 2.7
X-MesageID: 9815603
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,325,1571716800"; 
   d="scan'208";a="9815603"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Tue, 17 Dec 2019 13:49:56 +0000
Message-ID: <20191217134956.15137-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH] libxc/restore: Fix error message for
 unrecognised stream version
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Ian Jackson <Ian.Jackson@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlIEV4cGVjdGVkIGFuZCBHb3QgdmFsdWVzIGFyZSByZW5kZXJlZCBpbiB0aGUgd3Jvbmcgb3Jk
ZXIuCgpTaWduZWQtb2ZmLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXgu
Y29tPgotLS0KQ0M6IElhbiBKYWNrc29uIDxJYW4uSmFja3NvbkBjaXRyaXguY29tPgpDQzogV2Vp
IExpdSA8d2xAeGVuLm9yZz4KClRoaXMgd2FudHMgYmFja3BvcnRpbmcgdG8gdGhlIHN0YWJsZSB0
cmVlcwotLS0KIHRvb2xzL2xpYnhjL3hjX3NyX3Jlc3RvcmUuYyB8IDIgKy0KIDEgZmlsZSBjaGFu
Z2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL3Rvb2xzL2xp
YnhjL3hjX3NyX3Jlc3RvcmUuYyBiL3Rvb2xzL2xpYnhjL3hjX3NyX3Jlc3RvcmUuYwppbmRleCBl
YTdiMDMzOWVmLi4xYWM0MDRiOTdiIDEwMDY0NAotLS0gYS90b29scy9saWJ4Yy94Y19zcl9yZXN0
b3JlLmMKKysrIGIvdG9vbHMvbGlieGMveGNfc3JfcmVzdG9yZS5jCkBAIC0zNiw3ICszNiw3IEBA
IHN0YXRpYyBpbnQgcmVhZF9oZWFkZXJzKHN0cnVjdCB4Y19zcl9jb250ZXh0ICpjdHgpCiAgICAg
ZWxzZSBpZiAoIGloZHIudmVyc2lvbiAhPSBJSERSX1ZFUlNJT04gKQogICAgIHsKICAgICAgICAg
RVJST1IoIkludmFsaWQgVmVyc2lvbjogRXhwZWN0ZWQgJWQsIEdvdCAlZCIsCi0gICAgICAgICAg
ICAgIGloZHIudmVyc2lvbiwgSUhEUl9WRVJTSU9OKTsKKyAgICAgICAgICAgICAgSUhEUl9WRVJT
SU9OLCBpaGRyLnZlcnNpb24pOwogICAgICAgICByZXR1cm4gLTE7CiAgICAgfQogICAgIGVsc2Ug
aWYgKCBpaGRyLm9wdGlvbnMgJiBJSERSX09QVF9CSUdfRU5ESUFOICkKLS0gCjIuMTEuMAoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
