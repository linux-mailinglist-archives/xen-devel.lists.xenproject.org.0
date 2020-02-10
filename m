Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 33F57157F8F
	for <lists+xen-devel@lfdr.de>; Mon, 10 Feb 2020 17:19:06 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j1Bjr-0007l3-SD; Mon, 10 Feb 2020 16:16:47 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8uky=36=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1j1Bjr-0007ky-32
 for xen-devel@lists.xenproject.org; Mon, 10 Feb 2020 16:16:47 +0000
X-Inumbo-ID: bb5a8b24-4c20-11ea-b4e2-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id bb5a8b24-4c20-11ea-b4e2-12813bfff9fa;
 Mon, 10 Feb 2020 16:16:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1581351406;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=B0SrpHRAruDPclPisjvcX4c0FLCH3dqtFiKjBjT+vT4=;
 b=JNQ1Kyc7zVb12bzHvyjI4gt7OAeoN92UOR/9ZX885Rc/aA8ZRpKWSAPP
 4zkr8NYH89+rRhHBjpNvs+U2MrrrWdrA7X1QLSJ/PGpPpo/9uwLHJhP2W
 1vVviyV2uJHIW8KNq/jp6Ue1FnMlT+HFUiSFkHRRywIBBFIICQex6tXsk U=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
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
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: V+MW8w7a3MmnLYyqtckf3zAmWgo7X2Rj9Lg5h5wR1g2EXyvgY/cbbCmp7d2VsPk1U66jy9cyak
 N3re7nVCJfmDbpaGcx6ZK82ysxTUQxaqLm9QOEfWH7sFOhJs3RZnXpY0Q8Xv1zIN5il4V/HBDz
 uK5mWWeod+M0sJii8VrXGDP+9bySaz15XkbMiS+1aS1JQhpounumqorJIjzdWCJUIKwzRzhCVw
 iDlBT9+O3jy5LmKiEFVNPTCzlAPPbXv9gkYj59ApFcry90OWedwTpQCnjlHmkyEU1zD9nEtGBY
 yyI=
X-SBRS: 2.7
X-MesageID: 12834144
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,425,1574139600"; d="scan'208";a="12834144"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <24129.33258.215019.878642@mariner.uk.xensource.com>
Date: Mon, 10 Feb 2020 16:16:42 +0000
To: Christopher Clark <christopher.w.clark@gmail.com>
In-Reply-To: <20200210043516.1996-2-christopher.w.clark@gmail.com>
References: <20200210043516.1996-1-christopher.w.clark@gmail.com>
 <20200210043516.1996-2-christopher.w.clark@gmail.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH 1/2] pygrub: fix python3 cross-compile:
 install with INSTALL_PYTHON_PROG
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Rich Persaud <persaur@gmail.com>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Q2hyaXN0b3BoZXIgQ2xhcmsgd3JpdGVzICgiW1BBVENIIDEvMl0gcHlncnViOiBmaXggcHl0aG9u
MyBjcm9zcy1jb21waWxlOiBpbnN0YWxsIHdpdGggSU5TVEFMTF9QWVRIT05fUFJPRyIpOgo+IElu
c3RhbGwgcHlncnViIHdpdGggSU5TVEFMTF9QWVRIT05fUFJPRywgYXMgcGVyIHRoZSBvdGhlciBY
ZW4gcHl0aG9uCj4gZXhlY3V0YWJsZXMsIHRvIGVuc3VyZSB0aGF0IHRoZSBoYXNoYmFuZyBwYXRo
IHRvIHRoZSBpbnRlcnByZXRlcgo+IGlzIHdyaXR0ZW4gY29ycmVjdGx5IGluIGNyb3NzLWNvbXBp
bGUgYnVpbGRzLCBlZy4gd2l0aCBPcGVuRW1iZWRkZWQuCgpIcm0uICBUaGVyZSBpcyBkZWZpbml0
ZWx5IGEgYnVnIGhlcmUgYW5kIEkgdGhpbmsKdG9vbHMvcHl0aG9uL2luc3RhbGwtd3JhcCBuZWVk
cyB0byBiZSBjYWxsZWQuCgpXaGF0IEkgZG9uJ3QgdW5kZXJzdGFuZCBpcy4uLgoKPiBkaWZmIC0t
Z2l0IGEvdG9vbHMvcHlncnViL01ha2VmaWxlIGIvdG9vbHMvcHlncnViL01ha2VmaWxlCj4gaW5k
ZXggMzA2M2M0OTk4Zi4uYjRmNmYxMGRkZCAxMDA2NDQKPiAtLS0gYS90b29scy9weWdydWIvTWFr
ZWZpbGUKPiArKysgYi90b29scy9weWdydWIvTWFrZWZpbGUKPiBAQCAtMTgsNiArMTgsOCBAQCBp
bnN0YWxsOiBhbGwKPiAgCUNDPSIkKENDKSIgQ0ZMQUdTPSIkKFBZX0NGTEFHUykiIExERkxBR1M9
IiQoUFlfTERGTEFHUykiICQoUFlUSE9OKSBcCj4gIAkJc2V0dXAucHkgaW5zdGFsbCAtLXJlY29y
ZCAkKElOU1RBTExfTE9HKSAkKFBZVEhPTl9QUkVGSVhfQVJHKSBcCj4gIAkJIC0tcm9vdD0iJChE
RVNURElSKSIgLS1pbnN0YWxsLXNjcmlwdHM9JChMSUJFWEVDX0JJTikgLS1mb3JjZQo+ICsJcm0g
LWYgJChERVNURElSKS8kKExJQkVYRUNfQklOKS9weWdydWIKPiArCSQoSU5TVEFMTF9QWVRIT05f
UFJPRykgc3JjL3B5Z3J1YiAkKERFU1RESVIpLyQoTElCRVhFQ19CSU4pL3B5Z3J1Ygo+ICAJc2V0
IC1lOyBpZiBbICQoYmluZGlyKSAhPSAkKExJQkVYRUNfQklOKSAtYSBcCj4gIAkgICAgICAgICAg
ICAgImByZWFkbGluayAtZiAkKERFU1RESVIpLyQoYmluZGlyKWAiICE9IFwKPiAgCSAgICAgICAg
ICAgICAiYHJlYWRsaW5rIC1mICQoTElCRVhFQ19CSU4pYCIgXTsgdGhlbiBcCgouLi4gd2h5IHRo
aXMgaXMgdGhlIHJpZ2h0IGFwcHJvYWNoIGluIHRvb2xzL3B5Z3J1YiB3aGVuIGl0IGlzICpub3Qq
CnRoZSBhcHByb2FjaCB1c2VkIGluIHRvb2xzL3B5dGhvbiwgd2hlcmUgaW5zdGFsbC13cmFwIGxp
dmVzLCBhbmQgd2hpY2gKaXMgdGhlIG90aGVyIGRpcmVjdG9yeSB3aGljaCBoYXMgYSBzZXR1cC5w
eS4KCnRvb2xzL3B5dGhvbiBzZWVtcyB0byB1c2UgJChJTlNUQUxMX1BST0cpIGFuZCBub3QgaGF2
ZSBhbnl0aGluZyBpbgpgc2NyaXB0cycgaW4gc2V0dXAucHkuICBJcyB0aGF0IHdyb25nLCB0b28g
PwoKUGVyaGFwcyBpbnN0ZWFkIG9mIHRoZSBybSwgcHlncnViL3NldHVwLnB5IHNob3VsZCBsb3Nl
IHRoZSBsaW5lCiAgICAgIHNjcmlwdHMgPSBbInNyYy9weWdydWIiXSwKPwoKT3IgaXMgdGhlcmUg
bWF5YmUgYSB3YXkgdG8gZ2V0IHNldHVwLnB5IHRvIHVzZSBhIGRpZmZlcmVudCBgaW5zdGFsbCcg
PwoKVGhhbmtzLApJYW4uCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
