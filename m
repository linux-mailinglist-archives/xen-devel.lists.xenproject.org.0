Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 61BF8162565
	for <lists+xen-devel@lfdr.de>; Tue, 18 Feb 2020 12:19:32 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j40sO-0008B8-8v; Tue, 18 Feb 2020 11:17:16 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=171L=4G=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1j40sM-0008B3-8t
 for xen-devel@lists.xenproject.org; Tue, 18 Feb 2020 11:17:14 +0000
X-Inumbo-ID: 35c27ffa-5240-11ea-8155-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 35c27ffa-5240-11ea-8155-12813bfff9fa;
 Tue, 18 Feb 2020 11:17:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1582024632;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=hMe0+RnpB8WJDwcQ44aKV6LJYb0+ZUNgV6BgYvhc9tU=;
 b=BzX8Q8yJnH7Of9jwh18PcyAi4SSdRlj5c2ZL2WfclDvNmc5PJvP3npf/
 tf7Au855wBySbKi+8iaPOMI1uK7+LoAwSBUhbsiuvqBlktXVu3PVdpDma
 RBKXq41N9kDa2ybfDsr/YkGE7vNzaY7sLEQEsrNmo7wi9KuqjbG3rM+SG 4=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
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
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: YeZ/0EmS8fHeT435Rmf8RSpliDbbItgIlvFQVuswV4QAb1yetRy7vtkSZJT0oQDCC8QAGueD8j
 fUtCxrbikxQw8wDwwHVRYRk8jjPqpWamyZEklaS6EYYdU9BUB+z/V2DN3SmU8q5NoiPWIwu+j3
 uw2PirrHV7vdYcnCx1GTPQA5D8jS96Yy0IZKLD8GsRr+Q+rZtf62oWGJB7ttdmk5NwAnPNb3E7
 TNwaIImXTD+iB9qNRJaw0n/J5JBeBur/9MgH7xQ9TxNO5euy6U5Nuvxi5mVPXaIyXX/LWjQVSd
 Kq0=
X-SBRS: 2.7
X-MesageID: 12599922
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,456,1574139600"; d="scan'208";a="12599922"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <24139.51124.66017.255351@mariner.uk.xensource.com>
Date: Tue, 18 Feb 2020 11:17:08 +0000
To: "Durrant, Paul" <pdurrant@amazon.co.uk>
In-Reply-To: <78ccdd687a344eaf92ed8c978dc04f3c@EX13D32EUC003.ant.amazon.com>
References: <20200131150149.2008-1-pdurrant@amazon.com>
 <20200131150149.2008-6-pdurrant@amazon.com>
 <24138.53923.699587.944099@mariner.uk.xensource.com>
 <78ccdd687a344eaf92ed8c978dc04f3c@EX13D32EUC003.ant.amazon.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH v5 5/7] libxl: allow creation of domains
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
 George Dunlap <George.Dunlap@citrix.com>, Jan
 Beulich <jbeulich@suse.com>, Anthony Perard <anthony.perard@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RHVycmFudCwgUGF1bCB3cml0ZXMgKCJSRTogW1BBVENIIHY1IDUvN10gbGlieGw6IGFsbG93IGNy
ZWF0aW9uIG9mIGRvbWFpbnMgd2l0aCBhIHNwZWNpZmllZCBvciByYW5kb20gZG9taWQiKToKPiBO
bywgdGhlIGRvbWFpbiB3aWxsIG5vdCBiZSBsZWFrZWQuIFRoZSBleGlzdGluZyBmYWlsdXJlIGhh
bmRsaW5nIGluIGxpYnhsIHdpbGwgY2xlYW4gdXAgaWYgKmRvbWlkICE9IElOVkFMSURfRE9NSUQu
CgpTb3JyeSBpZiBJIHdhcyBjb25mdXNlZDsgSSB3aWxsIHJlYWQgdGhpcyBhZ2Fpbi4KCj4gPiA+
IGRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS9wdWJsaWMveGVuLmggYi94ZW4vaW5jbHVkZS9wdWJs
aWMveGVuLmgKPiA+ID4gaW5kZXggZDIxOThkZmZhZC4uNzViMTYxOWQwZCAxMDA2NDQKPiA+ID4g
LS0tIGEveGVuL2luY2x1ZGUvcHVibGljL3hlbi5oCj4gPiA+ICsrKyBiL3hlbi9pbmNsdWRlL3B1
YmxpYy94ZW4uaAo+ID4gPiBAQCAtNjE0LDYgKzYxNCw5IEBAIERFRklORV9YRU5fR1VFU1RfSEFO
RExFKG1tdWV4dF9vcF90KTsKPiA+ID4gIC8qIElkbGUgZG9tYWluLiAqLwo+ID4gPiAgI2RlZmlu
ZSBET01JRF9JRExFICAgICAgICAgICB4ZW5fbWtfdWludCgweDdGRkYpCj4gPiA+Cj4gPiA+ICsv
KiBNYXNrIGZvciB2YWxpZCBkb21haW4gaWQgdmFsdWVzICovCj4gPiA+ICsjZGVmaW5lIERPTUlE
X01BU0sgICAgICAgICAgIHhlbl9ta191aW50KDB4N0ZGRikKPiA+IAo+ID4gVGhpcyBuZWVkcyBh
IGh5cGVydmlzb3IgbWFpbnRhaW5lciBhY2suCj4gPiAKPiA+IFBsZWFzZSBzcGxpdCBpdCBpbnRv
IGl0cyBvd24gcGF0Y2gsIHdpdGggYSByYXRpb25hbGUsIGV0Yy4KPiAKPiBPaywgYnV0IGl0IGhh
cyBubyByYXRpb25hbGUgd2l0aG91dCB0aGUgcmVzdCBvZiB0aGlzIHBhdGNoOyBJIGNhbiBvbmx5
IGFzc2VydCB0aGF0IGl0ICd3aWxsIGJlIG5lZWRlZCBieSBhIHN1YnNlcXVlbnQgcGF0Y2gnLgoK
V2hhdCBkbyB0aGUgWGVuIG1haW50YWluZXJzLCBhbmQgbXkgdG9vbHMgY28tbWFpbnRhaW5lcnMg
dGhpbmsgPwoKSSB3YXMgaG9waW5nIGZvciBhIHJhdGlvbmFsZSBhbG9uZyB0aGUgbGluZXMgb2Y6
CgogIFRoaXMgaXMgdXNlZnVsIGZvciBwcm9ncmFtcyB3aGljaCBuZWVkIHRvIFtleHBsYW5hdGlv
bl0sCiAgaW5jbHVkaW5nIGZvciBleGFtcGxlLCBsaWJ4bCwgd2hpY2ggaXMgZ29pbmcgdG8gd2Fu
dCB0bwogIHJhbmRvbWx5IGdlbmVyYXRlIGRvbWlkcy4KCk1heWJlIGl0IG5lZWRzIHNvbWUgZXhw
bGFuYXRpb24gb2Ygd2h5IHRoaXMgYmVsb25ncyBpbiB0aGUgWGVuIHB1YmxpYwpoZWFkZXJzIHJh
dGhlciB0aGFuIGluIHNvbWUgaGVhZGVyIGF2YWlsYWJsZSB0byBsaWJ4YywgbGlieGwgYW5kIG90
aGVyCnRvb2xzIHN0dWZmID8KCklhbi4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
