Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E5BB16FED7
	for <lists+xen-devel@lfdr.de>; Wed, 26 Feb 2020 13:23:39 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j6vfc-0007zp-Dq; Wed, 26 Feb 2020 12:20:08 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=NxXS=4O=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1j6vfb-0007vz-Nl
 for xen-devel@lists.xenproject.org; Wed, 26 Feb 2020 12:20:07 +0000
X-Inumbo-ID: 50924a6a-5892-11ea-9405-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 50924a6a-5892-11ea-9405-12813bfff9fa;
 Wed, 26 Feb 2020 12:20:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1582719603;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Kt3IzNk6zIe/5QGWPbC+79ZzpGyafp44OJArdpw2w1I=;
 b=cOCInGHBQxWtA/UyIVvqBba6ikCw56bCrevXwwd0nzVudJczsRmxwYdW
 lQB6XZBaGJ68IH2vIEvuNXcooRIoTyyoS1Ybw08Xh+3NOgJcSlZrdz/da
 n2Bu68yFGf+mP/dNZGi1cE8GCm9uRVh9O5qonEsUQ3seE0SLwaHFLGueS 4=;
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
IronPort-SDR: NNiSMpKxrbedS/BuW1+JplYU33nj875M1hKE1pOn5OPOIjfYd7Yuys/3zL/ilUJGrRVZqT8dkU
 gf7CpWlvHnCje8JcG8IXmdFft6PH1kcHu6PbkjAs0xDiRVMmgQaAmpvscszbOKmh9dB6dVJzjS
 2fEiU0s4ggGqqIP5+pY2OPrppV4Uh0Y/GNR+1bY5LPRFeeYo94bK19HACmeXvr8DoCLs5FfvGo
 D0QfCcKUR3gcR40UQ7kviN5zUaT1fVHxqM30nLdepIJfEOpPHaCuJ36Ab85Dxs5vMdNt82/rUi
 OhM=
X-SBRS: 2.7
X-MesageID: 13014350
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,488,1574139600"; d="scan'208";a="13014350"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Wed, 26 Feb 2020 13:19:19 +0100
Message-ID: <20200226121921.28627-3-roger.pau@citrix.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200226121921.28627-1-roger.pau@citrix.com>
References: <20200226121921.28627-1-roger.pau@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v4 2/4] x86: track when in NMI context
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
 Jan Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QWRkIGhlbHBlcnMgdG8gdHJhY2sgd2hlbiBydW5uaW5nIGluIE5NSSBoYW5kbGVyIGNvbnRleHQu
IFRoaXMgaXMKbW9kZWxlZCBhZnRlciB0aGUgaW5faXJxIGhlbHBlcnMuCgpUaGUgU0RNIHN0YXRl
cyB0aGF0IG5vIE5NSSBjYW4gYmUgZGVsaXZlcmVkIHdoaWxlIGhhbmRsaW5nIGEgTk1JCnVudGls
IHRoZSBwcm9jZXNzb3IgaGFzIGV4ZWN1dGVkIGFuIGlyZXQgaW5zdHJ1Y3Rpb24uIEl0J3MgcG9z
c2libGUKaG93ZXZlciB0aGF0IGFub3RoZXIgZmF1bHQgaXMgcmVjZWl2ZWQgd2hpbGUgaGFuZGxp
bmcgdGhlIE5NSSAoYSAjTUMKZm9yIGV4YW1wbGUpLCBhbmQgdGh1cyB0aGUgaXJldCBmcm9tIHRo
YXQgZmF1bHQgd291bGQgYWxsb3cgZnVydGhlcgpOTUlzIHRvIGJlIGluamVjdGVkIHdoaWxlIHN0
aWxsIHByb2Nlc3NpbmcgdGhlIHByZXZpb3VzIG9uZSwgYW5kCmhlbmNlIGFuIGludGVnZXIgaXMg
bmVlZGVkIGluIG9yZGVyIHRvIGtlZXAgdHJhY2sgb2YgaW4gc2VydmljZSBOTUlzLgpUaGUgYWRk
ZWQgbWFjcm9zIG9ubHkgdHJhY2sgd2hlbiB0aGUgZXhlY3V0aW9uIGNvbnRleHQgaXMgaW4gdGhl
IE5NSQpoYW5kbGVyLCBidXQgdGhhdCBkb2Vzbid0IG1lYW4gTk1JcyBhcmUgYmxvY2tlZCBmb3Ig
dGhlIHJlYXNvbnMgbGlzdGVkCmFib3ZlLgoKTm90ZSB0aGF0IHRoZXJlIGFyZSBubyB1c2VycyBv
ZiBpbl9ubWlfaGFuZGxlcigpIGludHJvZHVjZWQgYnkgdGhlCmNoYW5nZSwgZnVydGhlciB1c2Vy
cyB3aWxsIGJlIGFkZGVkIGJ5IGZvbGxvd3VwIGNoYW5nZXMuCgpTaWduZWQtb2ZmLWJ5OiBSb2dl
ciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KLS0tCkNoYW5nZXMgc2luY2UgdjM6
CiAtIFJlbmFtZSB0byBpbl9ubWlfY29udGV4dC4KIC0gRHJvcCBwYXJlbnRoZXNlcyBhcm91bmQg
Y3B1IGluIG5taV9jb3VudC4KCkNoYW5nZXMgc2luY2UgdjI6CiAtIFVzZSBhbiBpbnRlZ2VyIGlu
c3RlYWQgb2YgYSBib29sZWFuIHRvIGtlZXAgdHJhY2sgb2YgaW4gc2VydmljZQogICAjTk1Jcy4K
IC0gTW92ZSBubWlfY291bnQgaW50byB4ODYgc3BlY2lmaWMgaGVhZGVyLgogLSBEcm9wIGxlYWRp
bmcgdW5kZXJzY29yZXMgZnJvbSBfX25taV9jb3VudCBmaWVsZC4KLS0tCiB4ZW4vYXJjaC94ODYv
dHJhcHMuYyAgICAgICAgICB8IDYgKysrKysrCiB4ZW4vaW5jbHVkZS9hc20teDg2L2hhcmRpcnEu
aCB8IDYgKysrKysrCiAyIGZpbGVzIGNoYW5nZWQsIDEyIGluc2VydGlvbnMoKykKCmRpZmYgLS1n
aXQgYS94ZW4vYXJjaC94ODYvdHJhcHMuYyBiL3hlbi9hcmNoL3g4Ni90cmFwcy5jCmluZGV4IDNk
YmM2NmJiNjQuLmY0ZjJjMTNhZTkgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL3g4Ni90cmFwcy5jCisr
KyBiL3hlbi9hcmNoL3g4Ni90cmFwcy5jCkBAIC0xNjkyLDkgKzE2OTIsMTMgQEAgdm9pZCBkb19u
bWkoY29uc3Qgc3RydWN0IGNwdV91c2VyX3JlZ3MgKnJlZ3MpCiAgICAgYm9vbCBoYW5kbGVfdW5r
bm93biA9IGZhbHNlOwogCiAgICAgdGhpc19jcHUobm1pX2NvdW50KSsrOworICAgIG5taV9lbnRl
cigpOwogCiAgICAgaWYgKCBubWlfY2FsbGJhY2socmVncywgY3B1KSApCisgICAgeworICAgICAg
ICBubWlfZXhpdCgpOwogICAgICAgICByZXR1cm47CisgICAgfQogCiAgICAgLyoKICAgICAgKiBB
Y2Nlc3NpbmcgcG9ydCAweDYxIG1heSB0cmFwIHRvIFNNTSB3aGljaCBoYXMgYmVlbiBhY3R1YWxs
eQpAQCAtMTcyMCw2ICsxNzI0LDggQEAgdm9pZCBkb19ubWkoY29uc3Qgc3RydWN0IGNwdV91c2Vy
X3JlZ3MgKnJlZ3MpCiAgICAgICAgIGlmICggIShyZWFzb24gJiAweGMwKSAmJiBoYW5kbGVfdW5r
bm93biApCiAgICAgICAgICAgICB1bmtub3duX25taV9lcnJvcihyZWdzLCByZWFzb24pOwogICAg
IH0KKworICAgIG5taV9leGl0KCk7CiB9CiAKIG5taV9jYWxsYmFja190ICpzZXRfbm1pX2NhbGxi
YWNrKG5taV9jYWxsYmFja190ICpjYWxsYmFjaykKZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRlL2Fz
bS14ODYvaGFyZGlycS5oIGIveGVuL2luY2x1ZGUvYXNtLXg4Ni9oYXJkaXJxLmgKaW5kZXggODAy
ZjkxY2ZkZi4uMDY5ZTQ4ZmNlOSAxMDA2NDQKLS0tIGEveGVuL2luY2x1ZGUvYXNtLXg4Ni9oYXJk
aXJxLmgKKysrIGIveGVuL2luY2x1ZGUvYXNtLXg4Ni9oYXJkaXJxLmgKQEAgLTcsNiArNyw3IEBA
CiB0eXBlZGVmIHN0cnVjdCB7CiAJdW5zaWduZWQgaW50IF9fc29mdGlycV9wZW5kaW5nOwogCXVu
c2lnbmVkIGludCBfX2xvY2FsX2lycV9jb3VudDsKKwl1bnNpZ25lZCBpbnQgbm1pX2NvdW50Owog
CWJvb2xfdCBfX213YWl0X3dha2V1cDsKIH0gX19jYWNoZWxpbmVfYWxpZ25lZCBpcnFfY3B1c3Rh
dF90OwogCkBAIC0xNyw2ICsxOCwxMSBAQCB0eXBlZGVmIHN0cnVjdCB7CiAjZGVmaW5lIGlycV9l
bnRlcigpCShsb2NhbF9pcnFfY291bnQoc21wX3Byb2Nlc3Nvcl9pZCgpKSsrKQogI2RlZmluZSBp
cnFfZXhpdCgpCShsb2NhbF9pcnFfY291bnQoc21wX3Byb2Nlc3Nvcl9pZCgpKS0tKQogCisjZGVm
aW5lIG5taV9jb3VudChjcHUpCQlfX0lSUV9TVEFUKGNwdSwgbm1pX2NvdW50KQorI2RlZmluZSBp
bl9ubWlfaGFuZGxlcigpCShubWlfY291bnQoc21wX3Byb2Nlc3Nvcl9pZCgpKSAhPSAwKQorI2Rl
ZmluZSBubWlfZW50ZXIoKQkJKG5taV9jb3VudChzbXBfcHJvY2Vzc29yX2lkKCkpKyspCisjZGVm
aW5lIG5taV9leGl0KCkJCShubWlfY291bnQoc21wX3Byb2Nlc3Nvcl9pZCgpKS0tKQorCiB2b2lk
IGFja19iYWRfaXJxKHVuc2lnbmVkIGludCBpcnEpOwogCiBleHRlcm4gdm9pZCBhcGljX2ludHJf
aW5pdCh2b2lkKTsKLS0gCjIuMjUuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
