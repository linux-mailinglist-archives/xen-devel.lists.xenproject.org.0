Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 360C8EAFC1
	for <lists+xen-devel@lfdr.de>; Thu, 31 Oct 2019 13:02:17 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iQ96Q-0004Zv-3r; Thu, 31 Oct 2019 11:58:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Kehi=YY=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1iQ96O-0004Zq-OH
 for xen-devel@lists.xenproject.org; Thu, 31 Oct 2019 11:58:56 +0000
X-Inumbo-ID: cf6e4394-fbd5-11e9-9540-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id cf6e4394-fbd5-11e9-9540-12813bfff9fa;
 Thu, 31 Oct 2019 11:58:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1572523135;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=6KpluSfwbTHfy0VcNGS1wAu9fu8ko4pNnMNdnNpxnAo=;
 b=YQ6pDK8daI+7NS9FE5IEPjdl61TNpdUYbq+vaDt6/GA043jIRWrN1VJL
 clW3n4lASMOKbNnFL+0JuriN9AjKmZui7rvgQNYqowVBBIEct+Wo9C60F
 tHojQkKRmdFwPhLVw2zXTos5/0ZaYiWXGn33Bnk67sNqVvprT66vnO9nH Q=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: ys8uMz+PtS/QRhfxr5+JZUltNUo5WAf7W1FIqVRd7jNZi7PN09SECDKnd+/5uv9l/+o8LAewF6
 Ns6jw75iAWK0s1zCdYP6hE2JS8yoSaXF7Bk5qWqwwrvb1tCc7ZJZCBFuzqIkrVFkjOi5cAJE8u
 DqY19w1W/1EDIWhT1erSX7Pkj8dg5EYAayvX4UfY2VtXd/ZtoTd9+KtBCzRa9pP5Mi0gTzkGgT
 J7f8RDqPg3B8Q7SqnDo4Dln6kvlsiMfIQ+qryc4ou0vDPo1ltR4ODtYaOIc3vEueOs3ONhfIJe
 8gE=
X-SBRS: 2.7
X-MesageID: 7669727
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.68,250,1569297600"; 
   d="scan'208";a="7669727"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Thu, 31 Oct 2019 12:58:29 +0100
Message-ID: <20191031115829.74378-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH for-4.13] x86/shim: copy back the result of
 EVTCHNOP_status
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
Cc: Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Wei Liu <wl@xen.org>, Jan Beulich <jbeulich@suse.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlIGV2ZW50IGNoYW5uZWwgZGF0YSB3YXMgbm90IGNvcGllZCBiYWNrIHRvIGd1ZXN0IG1lbW9y
eSwgZml4IHRoaXMKYnkgZG9pbmcgdGhlIGNvcHkuCgpTaWduZWQtb2ZmLWJ5OiBSb2dlciBQYXUg
TW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KLS0tCkNjOiBKdWVyZ2VuIEdyb3NzIDxqZ3Jv
c3NAc3VzZS5jb20+Ci0tLQogeGVuL2FyY2gveDg2L3B2L3NoaW0uYyB8IDMgKysrCiAxIGZpbGUg
Y2hhbmdlZCwgMyBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L3B2L3No
aW0uYyBiL3hlbi9hcmNoL3g4Ni9wdi9zaGltLmMKaW5kZXggNDMyOWVhYWVmZS4uMzViZjM5NDVh
YyAxMDA2NDQKLS0tIGEveGVuL2FyY2gveDg2L3B2L3NoaW0uYworKysgYi94ZW4vYXJjaC94ODYv
cHYvc2hpbS5jCkBAIC01MTQsNiArNTE0LDkgQEAgc3RhdGljIGxvbmcgcHZfc2hpbV9ldmVudF9j
aGFubmVsX29wKGludCBjbWQsIFhFTl9HVUVTVF9IQU5ETEVfUEFSQU0odm9pZCkgYXJnKQogICAg
ICAgICBlbHNlCiAgICAgICAgICAgICByYyA9IHhlbl9oeXBlcmNhbGxfZXZlbnRfY2hhbm5lbF9v
cChFVlRDSE5PUF9zdGF0dXMsICZzdGF0dXMpOwogCisgICAgICAgIGlmICggIXJjICYmIF9fY29w
eV90b19ndWVzdChhcmcsICZzdGF0dXMsIDEpICkKKyAgICAgICAgICAgIHJjID0gLUVGQVVMVDsK
KwogICAgICAgICBicmVhazsKICAgICB9CiAKLS0gCjIuMjMuMAoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
