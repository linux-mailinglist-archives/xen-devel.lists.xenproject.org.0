Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 94520E9E15
	for <lists+xen-devel@lfdr.de>; Wed, 30 Oct 2019 15:57:58 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iPpNA-00037H-MZ; Wed, 30 Oct 2019 14:54:56 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Sl5I=YX=citrix.com=sergey.dyasli@srs-us1.protection.inumbo.net>)
 id 1iPpNA-00037A-0u
 for xen-devel@lists.xen.org; Wed, 30 Oct 2019 14:54:56 +0000
X-Inumbo-ID: 3a462352-fb25-11e9-9527-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3a462352-fb25-11e9-9527-12813bfff9fa;
 Wed, 30 Oct 2019 14:54:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1572447293;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ClBlg4LOZcLVFDwmTrXHTdImx6BfKZ8+xcbOVOeppUg=;
 b=AIaug4ToAn30C5KzkMSJ/kx/dmW8Wkai+5uJqHad/zlBPJnUwPYdFzM2
 bqc1RokMjz+XR/5ZGTxHnZeLUSyxYKed6N6G7SVQF/w7QpSGVCnrwqepD
 wSrgFWI1hJD44ps0v9clx6KzA8ZK4MzMmkS9/xkHd8ND4otYcyBdwSfRQ o=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=sergey.dyasli@citrix.com;
 spf=Pass smtp.mailfrom=sergey.dyasli@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 sergey.dyasli@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="sergey.dyasli@citrix.com";
 x-sender="sergey.dyasli@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 sergey.dyasli@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="sergey.dyasli@citrix.com";
 x-sender="sergey.dyasli@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="sergey.dyasli@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: /M35e83IU9XoxzKQLgJoYaq2JIPxtOti2vBDYqxlVKr4a73x69w4wtVYV1cjNxzklz0Ojnexn7
 Hcw/eVh7afYjSVxV9hH3/O+1GW9tODC0gsDlKE40l2BxuDjLhixRVeuCFoW1vcGEQKv8ooIfLz
 c9p651xtsqfAjHEOQy74QhV1a/YzPlevZPW6deRB0cNta6jCD18m+azCD2bhFImCD9fjOfnm6A
 Ceso0hnf57wLRyJFBsWiNV7ZWCc2TaVdKjwVpNfBlKze/Mpgmmd4YBqk86BrMzCzAiYWCeGhpV
 Ako=
X-SBRS: 2.7
X-MesageID: 8094668
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.68,247,1569297600"; 
   d="scan'208";a="8094668"
From: Sergey Dyasli <sergey.dyasli@citrix.com>
To: <xen-devel@lists.xen.org>
Date: Wed, 30 Oct 2019 14:54:47 +0000
Message-ID: <20191030145447.11122-2-sergey.dyasli@citrix.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191030145447.11122-1-sergey.dyasli@citrix.com>
References: <20191030145447.11122-1-sergey.dyasli@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v2 for 4.13 2/2] x86/e820: fix 640k - 1M region
 reservation logic
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
IHJlZ2lvbiB0eXBlIGNoYW5nZSBpbiB2aXJ0dWFsaXNlZCBlbnZpcm9ubWVudHMsCnRydXN0aW5n
IHdoYXRldmVyIG1lbW9yeSBtYXAgb3VyIGh5cGVydmlzb3IgaGFzIHByb3ZpZGVkLgoKU2lnbmVk
LW9mZi1ieTogU2VyZ2V5IER5YXNsaSA8c2VyZ2V5LmR5YXNsaUBjaXRyaXguY29tPgotLS0KQ0M6
IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KQ0M6IEFuZHJldyBDb29wZXIgPGFuZHJl
dy5jb29wZXIzQGNpdHJpeC5jb20+CkNDOiBXZWkgTGl1IDx3bEB4ZW4ub3JnPgpDQzogIlJvZ2Vy
IFBhdSBNb25uw6kiIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KQ0M6IEp1ZXJnZW4gR3Jvc3MgPGpn
cm9zc0BzdXNlLmNvbT4KLS0tCiB4ZW4vYXJjaC94ODYvZTgyMC5jIHwgNSArKystLQogMSBmaWxl
IGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS94
ZW4vYXJjaC94ODYvZTgyMC5jIGIveGVuL2FyY2gveDg2L2U4MjAuYwppbmRleCA4ZThhMmM0ZTFi
Li4zMGFiOGQ5YjM1IDEwMDY0NAotLS0gYS94ZW4vYXJjaC94ODYvZTgyMC5jCisrKyBiL3hlbi9h
cmNoL3g4Ni9lODIwLmMKQEAgLTMxOCw5ICszMTgsMTAgQEAgc3RhdGljIGludCBfX2luaXQgY29w
eV9lODIwX21hcChzdHJ1Y3QgZTgyMGVudHJ5ICogYmlvc21hcCwgdW5zaWduZWQgaW50IG5yX21h
cCkKIAogICAgICAgICAvKgogICAgICAgICAgKiBTb21lIEJJT1NlcyBjbGFpbSBSQU0gaW4gdGhl
IDY0MGsgLSAxTSByZWdpb24uCi0gICAgICAgICAqIE5vdCByaWdodC4gRml4IGl0IHVwLgorICAg
ICAgICAgKiBOb3QgcmlnaHQuIEZpeCBpdCB1cCwgYnV0IG9ubHkgd2hlbiBydW5uaW5nIG9uIGJh
cmUgbWV0YWwuCiAgICAgICAgICAqLwotICAgICAgICBpZiAodHlwZSA9PSBFODIwX1JBTSkgewor
ICAgICAgICBpZiAoICFjcHVfaGFzX2h5cGVydmlzb3IgJiYgdHlwZSA9PSBFODIwX1JBTSApCisg
ICAgICAgIHsKICAgICAgICAgICAgIGlmIChzdGFydCA8IDB4MTAwMDAwVUxMICYmIGVuZCA+IDB4
QTAwMDBVTEwpIHsKICAgICAgICAgICAgICAgICBpZiAoc3RhcnQgPCAweEEwMDAwVUxMKQogICAg
ICAgICAgICAgICAgICAgICBhZGRfbWVtb3J5X3JlZ2lvbihzdGFydCwgMHhBMDAwMFVMTC1zdGFy
dCwgdHlwZSk7Ci0tIAoyLjE3LjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
