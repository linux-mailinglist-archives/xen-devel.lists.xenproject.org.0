Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D0A4014DFE5
	for <lists+xen-devel@lfdr.de>; Thu, 30 Jan 2020 18:27:58 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ixDZp-00051V-2Z; Thu, 30 Jan 2020 17:26:01 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=m3I1=3T=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1ixDZn-00051N-KJ
 for xen-devel@lists.xenproject.org; Thu, 30 Jan 2020 17:25:59 +0000
X-Inumbo-ID: 94503996-4385-11ea-8aca-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 94503996-4385-11ea-8aca-12813bfff9fa;
 Thu, 30 Jan 2020 17:25:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1580405158;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=AjgbTB9snqvWZnqm7ODoH07zCyQLj1B6PIT/MGdCLbI=;
 b=W2iaTCgA65gDbHJUEBu1krF+k3B60XmvTFIdVMihaYlVO9ofLHwAJTkm
 +knieA2DBmS2y1o43GVM+xQG0YcmcI5l7vgidotobeUUDl8i/+cGCz3RH
 /i6TmZpjZ8NLVPxg3hwegEusv/dJWz4/JchH4SdNIweHFU59r6JRRfVCv 8=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: nXNX+cKewNlB7OUY4d3GrHOEQqIi/hj38AXZEcRZsEHm6WR+mlaUrYCi1VrBdQ3j3moa5HAD3s
 S45CsUskRo5SG05QZffBdDKK/Y1EPCPkMTe0HY0FMPLsv6pev7uOHExCwK0+wmuqNLUgOq+iGo
 V9SWkHNvPPpTWzgYkMoRHJhqkjqSuIt3MYNGBaUTQmUgEJvz7OqUhxVkh88HNm/WZApK/wFwgu
 PulKJrZigotusErz9NB566O/0JG4C+h1MSrCamAma+XmKqUu1Y1s2IUj3Of+Muu/Ic1aVl8eT8
 4XA=
X-SBRS: 2.7
X-MesageID: 12130103
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,382,1574139600"; d="scan'208";a="12130103"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <24115.4515.335032.366833@mariner.uk.xensource.com>
Date: Thu, 30 Jan 2020 17:25:55 +0000
To: Paul Durrant <pdurrant@amazon.com>
In-Reply-To: <20200122144446.919-6-pdurrant@amazon.com>
References: <20200122144446.919-1-pdurrant@amazon.com>
 <20200122144446.919-6-pdurrant@amazon.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH v4 5/7] libxl: allow creation of domains
 with a specified or random domid
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>, Jason Andryuk <jandryuk@gmail.com>,
 George Dunlap <George.Dunlap@citrix.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

UGF1bCBEdXJyYW50IHdyaXRlcyAoIltQQVRDSCB2NCA1LzddIGxpYnhsOiBhbGxvdyBjcmVhdGlv
biBvZiBkb21haW5zIHdpdGggYSBzcGVjaWZpZWQgb3IgcmFuZG9tIGRvbWlkIik6Cj4gVGhpcyBw
YXRjaCBhZGRzIGEgJ2RvbWlkJyBmaWVsZCB0byBsaWJ4bF9kb21haW5fY3JlYXRlX2luZm8gYW5k
IHRoZW4KPiBtb2RpZmllcyBsaWJ4bF9fZG9tYWluX21ha2UoKSB0byBoYXZlIFhlbiB1c2UgdGhh
dCB2YWx1ZSBpZiBpdCBpcyB2YWxpZC4KPiBJZiB0aGUgZG9taWQgdmFsdWUgaXMgaW52YWxpZCB0
aGVuIFhlbiB3aWxsIGNob29zZSB0aGUgZG9taWQsIGFzIGJlZm9yZSwKPiB1bmxlc3MgdGhlIHZh
bHVlIGlzIHRoZSBuZXcgc3BlY2lhbCBSQU5ET01fRE9NSUQgdmFsdWUgYWRkZWQgdG8gdGhlIEFQ
SS4KPiBUaGlzIHZhbHVlIGluc3RydWN0cyBsaWJ4bF9fZG9tYWluX21ha2UoKSB0byBjaG9vc2Ug
YSByYW5kb20gZG9taWQgdmFsdWUKPiBmb3IgWGVuIHRvIHVzZS4KPiAKPiBJZiBYZW4gZGV0ZXJt
aW5lcyB0aGF0IGEgZG9taWQgc3BlY2lmaWVkIHRvIG9yIGNob3NlbiBieQo+IGxpYnhsX19kb21h
aW5fbWFrZSgpIGNvLWluY2lkZXMgd2l0aCBhbiBleGlzdGluZyBkb21haW4gdGhlbiB0aGUgY3Jl
YXRlCj4gb3BlcmF0aW9uIHdpbGwgZmFpbC4gSW4gdGhpcyBjYXNlLCBpZiBSQU5ET01fRE9NSUQg
d2FzIHNwZWNpZmllZCB0bwo+IGxpYnhsX19kb21haW5fbWFrZSgpIHRoZW4gYSBuZXcgcmFuZG9t
IHZhbHVlIHdpbGwgYmUgY2hvc2VuIGFuZCB0aGUgY3JlYXRlCj4gb3BlcmF0aW9uIHdpbGwgYmUg
cmUtdHJpZWQsIG90aGVyd2lzZSBsaWJ4bF9fZG9tYWluX21ha2UoKSB3aWxsIGZhaWwuCj4gCj4g
QWZ0ZXIgWGVuIGhhcyBzdWNjZXNzZnVsbHkgY3JlYXRlZCBhIG5ldyBkb21haW4sIGxpYnhsX19k
b21haW5fbWFrZSgpIHdpbGwKPiBjaGVjayB3aGV0aGVyIGl0cyBkb21pZCBtYXRjaGVzIGFueSBy
ZWNlbnRseSB1c2VkIGRvbWlkIHZhbHVlcy4gSWYgaXQgZG9lcwo+IHRoZW4gdGhlIGRvbWFpbiB3
aWxsIGJlIGRlc3Ryb3llZC4gSWYgdGhlIGRvbWlkIHVzZWQgaW4gY3JlYXRpb24gd2FzCj4gc3Bl
Y2lmaWVkIHRvIGxpYnhsX19kb21haW5fbWFrZSgpIHRoZW4gaXQgd2lsbCBmYWlsIGF0IHRoaXMg
cG9pbnQsCj4gb3RoZXJ3aXNlIHRoZSBjcmVhdGUgb3BlcmF0aW9uIHdpbGwgYmUgcmUtdHJpZWQg
d2l0aCBlaXRoZXIgYSBuZXcgcmFuZG9tCj4gb3IgWGVuLXNlbGVjdGVkIGRvbWlkIHZhbHVlLgou
Li4KPiAtICAgICAgICByZXQgPSB4Y19kb21haW5fY3JlYXRlKGN0eC0+eGNoLCBkb21pZCwgJmNy
ZWF0ZSk7Cj4gKyAgICAgICAgaWYgKGxpYnhsX2RvbWlkX3ZhbGlkX2d1ZXN0KGluZm8tPmRvbWlk
KSkKPiArICAgICAgICAgICAgKmRvbWlkID0gaW5mby0+ZG9taWQ7Cj4gKwo+ICsgICAgYWdhaW46
Cj4gKyAgICAgICAgZm9yICg7Oykgewo+ICsgICAgICAgICAgICBpZiAoaW5mby0+ZG9taWQgPT0g
UkFORE9NX0RPTUlEKSB7Cj4gKyAgICAgICAgICAgICAgICB1aW50MTZfdCB2Owo+ICsKPiArICAg
ICAgICAgICAgICAgIHJldCA9IGxpYnhsX19yYW5kb21fYnl0ZXMoZ2MsICh2b2lkICopJnYsIHNp
emVvZih2KSk7Cj4gKyAgICAgICAgICAgICAgICBpZiAocmV0IDwgMCkKPiArICAgICAgICAgICAg
ICAgICAgICBicmVhazsKPiArCj4gKyAgICAgICAgICAgICAgICB2ICY9IERPTUlEX01BU0s7Cj4g
KyAgICAgICAgICAgICAgICBpZiAoIWxpYnhsX2RvbWlkX3ZhbGlkX2d1ZXN0KHYpKQo+ICsgICAg
ICAgICAgICAgICAgICAgIGNvbnRpbnVlOwo+ICsKPiArICAgICAgICAgICAgICAgICpkb21pZCA9
IHY7Cj4gKyAgICAgICAgICAgIH0KPiArCj4gKyAgICAgICAgICAgIHJldCA9IHhjX2RvbWFpbl9j
cmVhdGUoY3R4LT54Y2gsIGRvbWlkLCAmY3JlYXRlKTsKPiArICAgICAgICAgICAgaWYgKHJldCA9
PSAwIHx8IGVycm5vICE9IEVFWElTVCB8fCBpbmZvLT5kb21pZCAhPSBSQU5ET01fRE9NSUQpCj4g
KyAgICAgICAgICAgICAgICBicmVhazsKPiArICAgICAgICB9Cj4gKwo+ICAgICAgICAgIGlmIChy
ZXQgPCAwKSB7Cj4gICAgICAgICAgICAgIExPR0VEKEVSUk9SLCAqZG9taWQsICJkb21haW4gY3Jl
YXRpb24gZmFpbCIpOwo+ICsgICAgICAgICAgICAqZG9taWQgPSBJTlZBTElEX0RPTUlEOwo+ICsg
ICAgICAgICAgICByYyA9IEVSUk9SX0ZBSUw7Cj4gKyAgICAgICAgICAgIGdvdG8gb3V0Owo+ICsg
ICAgICAgIH0KPiArCj4gKyAgICAgICAgaWYgKGxpYnhsX19pc19kb21pZF9yZWNlbnQoZ2MsICpk
b21pZCkpIHsKPiArICAgICAgICAgICAgaWYgKCpkb21pZCA9PSBpbmZvLT5kb21pZCkgLyogZG9t
aWQgd2FzIHNwZWNpZmllZCAqLwo+ICsgICAgICAgICAgICAgICAgTE9HRUQoRVJST1IsICpkb21p
ZCwgImRvbWFpbiBpZCByZWNlbnRseSB1c2VkIik7Cj4gKwo+ICsgICAgICAgICAgICByZXQgPSB4
Y19kb21haW5fZGVzdHJveShjdHgtPnhjaCwgKmRvbWlkKTsKPiArICAgICAgICAgICAgaWYgKCFy
ZXQpIHsKPiArICAgICAgICAgICAgICAgICpkb21pZCA9IElOVkFMSURfRE9NSUQ7Cj4gKwo+ICsg
ICAgICAgICAgICAgICAgLyogSWYgdGhlIGRvbWlkIHdhcyBub3Qgc3BlY2lmaWVkIHRoZW4gaGF2
ZSBhbm90aGVyIGdvICovCj4gKyAgICAgICAgICAgICAgICBpZiAoIWxpYnhsX2RvbWlkX3ZhbGlk
X2d1ZXN0KGluZm8tPmRvbWlkKSkKPiArICAgICAgICAgICAgICAgICAgICBnb3RvIGFnYWluOwo+
ICsgICAgICAgICAgICB9CgpZb3UgaGF2ZSB3cml0dGVuIHRoaXMgYXMgdHdvIG5lc3RlZCBsb29w
cywgb25lIG9mIHdoaWNoIGlzIGltcGxlbWVudGVkCmFzIGEgZ290bywgYnV0IGFjdHVhbGx5IGxv
Z2ljYWxseSB0aGlzIGlzIHN1cmVseSBvbmx5IG9uZSBsb29wID8KUGxlYXNlIGNvdWxkIHlvdSBy
ZW9yZ2FuaXNlIHRoaXMgYW5kIHRoZW4gSSdsbCByZWFkIGl0IGFnYWluLi4uCgpUaGFua3MsCklh
bi4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
