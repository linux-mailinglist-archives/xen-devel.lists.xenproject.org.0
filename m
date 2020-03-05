Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA91D17AECF
	for <lists+xen-devel@lfdr.de>; Thu,  5 Mar 2020 20:14:33 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j9vv6-0003Ui-Kv; Thu, 05 Mar 2020 19:12:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Ek+B=4W=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1j9vv4-0003Ud-VT
 for xen-devel@lists.xenproject.org; Thu, 05 Mar 2020 19:12:31 +0000
X-Inumbo-ID: 421e16c4-5f15-11ea-90c4-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 421e16c4-5f15-11ea-90c4-bc764e2007e4;
 Thu, 05 Mar 2020 19:12:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1583435550;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=I4HjMQmt77x6VgZga2pymfYstGc1F9jRwRCvSMSvJ7s=;
 b=S+2yThjC05Oi4xjbqQlo4hBT94Y6D54BzGZKgKVakArq1ntwUiARNqzk
 Ld2rzeq19xyatc0BdTmMkFwbXx4sNWVEw5+ViqmEuR+fbjqatpNco9a4i
 LOnoIiq16KU0Ox0gJqcyDlewQpXZkfKnFAku6Ojlk1Jts3u3SU6Kdpe/s s=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
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
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 5FYm77Kv1tsN2/3ad5U6CRr8lNUvIrgv69Rm5PBzRdvjKl+9EF2bTUkg9geUmx6Xhwda9JP2R8
 YxeDHQvS5qZQ51VGi4+VXM6ray8HtbvXLMMAywJ43VURbarJ3lD+GtHytAcXsCqLr5VpbgdD/y
 NMOiOJxAF6egh7WGnAohM92qUBNPKAkAtYuvmXMlDCKHOXdb2wh07fJAB8t8WCMNSDmoIyNdLx
 Q4rZu0uisEvOtHJ2N6UOwd2F8StIrLmql6TAyAY9BILqbSAX5M4PLzDBevsGzym/b6vrsZyHy2
 toQ=
X-SBRS: 2.7
X-MesageID: 13669642
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,519,1574139600"; d="scan'208";a="13669642"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <24161.20250.380522.853769@mariner.uk.xensource.com>
Date: Thu, 5 Mar 2020 19:12:26 +0000
To: Jason Andryuk <jandryuk@gmail.com>
In-Reply-To: <CAKf6xpu=X0a1-AsBJ=JwzBFo0evdk0JtQoAWXShkyatWy1BAOA@mail.gmail.com>
References: <20200226152013.12200-1-jandryuk@gmail.com>
 <20200226152013.12200-2-jandryuk@gmail.com>
 <24150.37734.588539.567057@mariner.uk.xensource.com>
 <CAKf6xpu=X0a1-AsBJ=JwzBFo0evdk0JtQoAWXShkyatWy1BAOA@mail.gmail.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH 1/2] tools/helpers: Introduce
 cmp-fd-file-inode utility
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
 Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SmFzb24gQW5kcnl1ayB3cml0ZXMgKCJSZTogW1BBVENIIDEvMl0gdG9vbHMvaGVscGVyczogSW50
cm9kdWNlIGNtcC1mZC1maWxlLWlub2RlIHV0aWxpdHkiKToKPiBJJ2QgYmUgaGFwcHkgdG8gdXNl
IHN0YXQgaWYgaXQgd29ya3MuICBUaGUgY29tbWVudCBpbiBsb2NraW5nLnNoIGFib3ZlCj4gdGhl
IHVzYWdlIGlzOgo+ICAgICAgICAgIyBXZSBjYW4ndCBqdXN0IHN0YXQgL2Rldi9zdGRpbiBvciAv
cHJvYy9zZWxmL2ZkLyRfbG9ja2ZkIG9yCj4gICAgICAgICAjIHVzZSBiYXNoJ3MgdGVzdCAtZWYg
YmVjYXVzZSB0aG9zZSBhbGwgZ28gdGhyb3VnaCB3aGF0IGlzCj4gICAgICAgICAjIGFjdHVhbGx5
IGEgc3ludGhldGljIHN5bWxpbmsgaW4gL3Byb2MgYW5kIHdlIGFyZW4ndAo+ICAgICAgICAgIyBn
dWFyYW50ZWVkIHRoYXQgb3VyIHN0YXQoMikgd29uJ3QgbG9zZSB0aGUgcmFjZSB3aXRoIGFuCj4g
ICAgICAgICAjIHJtKDEpIGJldHdlZW4gcmVhZGluZyB0aGUgc3ludGhldGljIGxpbmsgYW5kIHRy
YXZlcnNpbmcgdGhlCj4gICAgICAgICAjIGZpbGUgc3lzdGVtIHRvIGZpbmQgdGhlIGludW0uICBQ
ZXJsIGlzIHZlcnkgZmFzdCBzbyB1c2UgdGhhdC4KPiAKPiAuLi53aGljaCBJIHRob3VnaHQgcnVs
ZWQgb3V0IHN0YXQuCgpXZWxsIHJlYWQuCgpJIGhhdmUgZG9uZSBzb21lIG1vcmUgdGVzdGluZyBh
bmQgaW4gbXkgdGVzdHMgKG9uIERlYmlhbiBzdHJldGNoKQogICAgc3RhdCAtTCAtIDxzb21lLWZp
bGUKZG9lcyB0aGlzCiAgICBmc3RhdDY0KDAsIHtzdF9tb2RlPVNfSUZSRUd8MDY2NCwgc3Rfc2l6
ZT0xMTc4NDQsIC4uLn0pID0gMAooYWNjb3JkaW5nIHRvIHN0cmFjZSkgd2hpY2ggaXMgcHJlY2lz
ZWx5IHdoYXQgaXMgbmVlZGVkLgoKT2RkbHksIGl0IGFsc28gZG9lcyB0aGlzCiAgICBmc3RhdDY0
KDEsIHtzdF9tb2RlPVNfSUZDSFJ8MDYyMCwgc3RfcmRldj1tYWtlZGV2KDEzNiwgMTcxKSwgLi4u
fSkgPSAwCmJ1dCBpdCBkb2Vzbid0IHNlZW0gdG8gZG8gYW55dGhpbmcgd2l0aCB0aGUgcmVzdWx0
cywgc28gSSB0aGluawp0aGF0J3MgaGFybWxlc3MuCgpJIHdyb3RlIHRoYXQgY29tbWVudCBpbiAy
MDEyLiAgUHJlc3VtYWJseSBgc3RhdCAtTCAtJyBoYXMgYXBwZWFyZWQgaW4KdGhlIG1lYW50aW1l
LgoKVGhlIHN5bnRoZXRpYyBzeW1saW5rIG1heSBiZSBhIHJlZCBoZXJyaW5nIGFueXdheTsgbm93
YWRheXMgYXQgbGVhc3QsCkkgYW0gdG9sZCBieSBzb21lb25lIHdobyByZWFkIHRoZSBMaW51eCBr
ZXJuZWwgc291cmNlIHRoYXQKICB0aGUgbmFtZSBjb21lcyBmcm9tIHRoZSBgcmVhZGxpbmsnIG1l
dGhvZCBvbiB0aGUgbGluayBpbm9kZSwgYnV0IGEKICBkaWZmZXJlbnQgbWV0aG9kIGVudGlyZWx5
IC0tIGBnZXRfbGluaycgLS0gaXMgdXNlZCBieSBgbmFtZWknIHRvCiAgYWN0dWFsbHkgcmVzb2x2
ZSB0aGUgbGluayB0byBhIGRlc3RpbmF0aW9uIGlub2RlLgoKQnV0IHVzaW5nIGAtJyBpcyBjbGVh
cmx5IGZpbmUsIGxpa2UgdGhpcyBJIHRoaW5rOgoKbWFyaW5lcjp+PiBzdGF0IC1jJUQuJWkgLUwg
LSB0IDx0CmZlMDQuODQ0MzA3CmZlMDQuODQ0MzA3Cm1hcmluZXI6fj4KClNvcnJ5IHRvIG11ZGR5
IHRoZSB3YXRlcnMuCgpJYW4uCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
