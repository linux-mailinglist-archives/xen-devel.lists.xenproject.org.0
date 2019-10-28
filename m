Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F402E6E99
	for <lists+xen-devel@lfdr.de>; Mon, 28 Oct 2019 09:59:20 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iP0p4-0000FI-NN; Mon, 28 Oct 2019 08:56:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=THtN=YV=citrix.com=sergey.dyasli@srs-us1.protection.inumbo.net>)
 id 1iP0p3-0000FD-4w
 for xen-devel@lists.xen.org; Mon, 28 Oct 2019 08:56:21 +0000
X-Inumbo-ID: cebe6b26-f960-11e9-beca-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id cebe6b26-f960-11e9-beca-bc764e2007e4;
 Mon, 28 Oct 2019 08:56:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1572252981;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=A3yqLJaNeHYuV0CtjI/X78wIbwXhoOE8A3aqwUfMMsQ=;
 b=PH2zHyF4QBDQVneVPI/YmTkRkPmRSInzcbwAj6N6my87xZk6TgLNmjD7
 bbu/B/w0YzsZKM3mIiIU7KkSVhoa87skc945gR5u9ZBRURPXpd4wTvAho
 fV0TOyuJymWpd/X+fTMzkXEiI4X8K0GsBcyeIZLHArSvIl3YDIoMZmVRs w=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=sergey.dyasli@citrix.com;
 spf=Pass smtp.mailfrom=sergey.dyasli@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 sergey.dyasli@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="sergey.dyasli@citrix.com";
 x-sender="sergey.dyasli@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 sergey.dyasli@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="sergey.dyasli@citrix.com";
 x-sender="sergey.dyasli@citrix.com";
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
 envelope-from="sergey.dyasli@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: QbYuGacpdowKG4ktexxiUBByE/SvCyuJCErMzfJ8i4DhX66Xm0HAuz0DQ2TbSLYZep9mSBjEg3
 6AwayIka0eCweQIFAPF3WVhy8cD7xYYR/KcKoUF0dEe9i3J8x+aRIdvd9AhqmVZzt6eFQuVAbC
 fkq4HVexB06PVfK5bXJ7upSaJxYUyKfKH3AeasCDnIzEjXt3Tg8HspRN4uHeBSiHSrvFyVF5yd
 /eM5ehOnsi9NV7YA2G4irLkuNyO3xMI5RJpM2qWmSNdIgRwCEjQeyjfzSIAJlOejqg5br3H5aA
 aU0=
X-SBRS: 2.7
X-MesageID: 7491467
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.68,239,1569297600"; 
   d="scan'208";a="7491467"
From: Sergey Dyasli <sergey.dyasli@citrix.com>
To: <xen-devel@lists.xen.org>
Date: Mon, 28 Oct 2019 08:56:03 +0000
Message-ID: <20191028085603.32037-1-sergey.dyasli@citrix.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH for 4.13] x86/shim: don't reserve 640k - 1M
 region in E820
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
Cc: Juergen Gross <jgross@suse.com>, Sergey Dyasli <sergey.dyasli@citrix.com>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Q29udmVydGluZyBhIGd1ZXN0IGZyb20gUFYgdG8gUFYtaW4tUFZIIG1ha2VzIHRoZSBndWVzdCB0
byBoYXZlIDM4NGsKbGVzcyBtZW1vcnksIHdoaWNoIG1heSBjb25mdXNlIGd1ZXN0J3MgYmFsbG9v
biBkcml2ZXIuIFRoaXMgaGFwcGVucwpiZWNhdXNlIFhlbiB1bmNvbmRpdGlvbmFsbHkgcmVzZXJ2
ZXMgNjQwayAtIDFNIHJlZ2lvbiBpbiBFODIwIGRlc3BpdGUKdGhlIGZhY3QgdGhhdCBpdCdzIHJl
YWxseSBhIHVzYWJsZSBSQU0gaW4gUFZIIGJvb3QgbW9kZS4KCkZpeCB0aGlzIGJ5IHNraXBwaW5n
IHRoZSByZWdpb24gdHlwZSBjaGFuZ2UgZm9yIHB2LXNoaW0gbW9kZS4KClNpZ25lZC1vZmYtYnk6
IFNlcmdleSBEeWFzbGkgPHNlcmdleS5keWFzbGlAY2l0cml4LmNvbT4KLS0tClRoZSBjb25kaXRp
b24gY2FuIGJlIHJlbGF4ZWQgdG8gYmUganVzdCAhcHZoX2Jvb3QgaWYgdGhlcmUgYXJlIG5vCnBs
YW5zIHRvIHN1cHBvcnQgVkdBIE1NSU8gLyBST01zIGZvciBQVkggZ3Vlc3RzLgoKQ0M6IEphbiBC
ZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KQ0M6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29w
ZXIzQGNpdHJpeC5jb20+CkNDOiBXZWkgTGl1IDx3bEB4ZW4ub3JnPgpDQzogIlJvZ2VyIFBhdSBN
b25uw6kiIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KQ0M6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0Bz
dXNlLmNvbT4KLS0tCiB4ZW4vYXJjaC94ODYvZTgyMC5jIHwgNSArKystLQogMSBmaWxlIGNoYW5n
ZWQsIDMgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS94ZW4vYXJj
aC94ODYvZTgyMC5jIGIveGVuL2FyY2gveDg2L2U4MjAuYwppbmRleCA4ZThhMmM0ZTFiLi41NGMy
YWU3MGM0IDEwMDY0NAotLS0gYS94ZW4vYXJjaC94ODYvZTgyMC5jCisrKyBiL3hlbi9hcmNoL3g4
Ni9lODIwLmMKQEAgLTMxOCw5ICszMTgsMTAgQEAgc3RhdGljIGludCBfX2luaXQgY29weV9lODIw
X21hcChzdHJ1Y3QgZTgyMGVudHJ5ICogYmlvc21hcCwgdW5zaWduZWQgaW50IG5yX21hcCkKIAog
ICAgICAgICAvKgogICAgICAgICAgKiBTb21lIEJJT1NlcyBjbGFpbSBSQU0gaW4gdGhlIDY0MGsg
LSAxTSByZWdpb24uCi0gICAgICAgICAqIE5vdCByaWdodC4gRml4IGl0IHVwLgorICAgICAgICAg
KiBOb3QgcmlnaHQuIEZpeCBpdCB1cCwgZXhjZXB0IGZvciBwdi1zaGltIGNhc2UuCiAgICAgICAg
ICAqLwotICAgICAgICBpZiAodHlwZSA9PSBFODIwX1JBTSkgeworICAgICAgICBpZiAoICEocHZf
c2hpbSAmJiBwdmhfYm9vdCkgJiYgdHlwZSA9PSBFODIwX1JBTSApCisgICAgICAgIHsKICAgICAg
ICAgICAgIGlmIChzdGFydCA8IDB4MTAwMDAwVUxMICYmIGVuZCA+IDB4QTAwMDBVTEwpIHsKICAg
ICAgICAgICAgICAgICBpZiAoc3RhcnQgPCAweEEwMDAwVUxMKQogICAgICAgICAgICAgICAgICAg
ICBhZGRfbWVtb3J5X3JlZ2lvbihzdGFydCwgMHhBMDAwMFVMTC1zdGFydCwgdHlwZSk7Ci0tIAoy
LjE3LjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
