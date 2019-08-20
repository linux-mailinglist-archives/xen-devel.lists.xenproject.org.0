Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B6D1958E2
	for <lists+xen-devel@lfdr.de>; Tue, 20 Aug 2019 09:51:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hzyrM-0006LQ-75; Tue, 20 Aug 2019 07:47:16 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=B9c3=WQ=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1hzyrK-0006Kt-Mm
 for xen-devel@lists.xenproject.org; Tue, 20 Aug 2019 07:47:14 +0000
X-Inumbo-ID: b88b7c54-c31e-11e9-8bf4-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b88b7c54-c31e-11e9-8bf4-12813bfff9fa;
 Tue, 20 Aug 2019 07:47:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1566287232;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=RUiS026x3UoXIPpEiwbYqYOwA4brbvUv/LrOLG3lazU=;
 b=Z9UuUdcx/yqN6g53ypmxgsyQ2u6EG5J2/tFHmG5wPolihHA7rSuhFOpE
 GRnedbzfQnzdesGF1LXu71Kevo1eGNHUqifCRAswBz7G7Srwgz+cUcJvA
 6vDkAdJBWm4IWtZQpaZy0DuhoqiLPZ1G0liomgJCjI9+vXVRVeD2FD5me Y=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: qxO94If4Ee/9ampuZ/DBysc6hF3A48daUYS4FM5WGeEYvIqqGU4BFokMBOhYcz0xQfBD2pe/XY
 HIP7PbsvYvrlkpqxg+9Fr0JpOhChh8qMmLDIOLOTt/IhyKNOvIPlxbZOKmCNlAxehYNZhfoiqN
 E0xICkEcUMbXAczMusvaSvG3OmhzKVUWFWzQVh0tWLVOg05FXmHmyc0p1GXIJ7EStbLSDxVybQ
 q9RPBTEayrEGfL5efGAZQ4nWZQ/aI8LfntpS+9dmQUxTtCtJYp9h0hpjGFuEtSA98tQWO4lh7L
 I7s=
X-SBRS: 2.7
X-MesageID: 4638500
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,408,1559534400"; 
   d="scan'208";a="4638500"
Date: Tue, 20 Aug 2019 09:47:04 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <JBeulich@suse.com>
Message-ID: <20190820074704.62lcxjq4etzdr5wc@Air-de-Roger>
References: <20190726133331.91482-1-roger.pau@citrix.com>
 <20190726133331.91482-2-roger.pau@citrix.com>
 <1274ba66-a510-7ee0-23db-ff61de2634f7@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1274ba66-a510-7ee0-23db-ff61de2634f7@suse.com>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH 1/3] kconfig: include default toolchain
 values
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
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Doug Goldstein <cardoe@cardoe.com>,
 TimDeegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBKdWwgMjksIDIwMTkgYXQgMDM6MzE6MzFQTSArMDAwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gT24gMjYuMDcuMjAxOSAxNTozMywgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+ID4gSW5j
bHVkZSBjb25maWcvJChPUykubWsgd2hpY2ggY29udGFpbnMgdGhlIGRlZmF1bHQgdmFsdWVzIGZv
ciB0aGUKPiA+IHRvb2xjaGFpbiB2YXJpYWJsZXMuIFRoaXMgcmVtb3ZlcyB0aGUgbmVlZCB0byBw
YXNzIEhPU1R7Q0MvQ1hYfSBhcwo+ID4gcGFyYW1ldGVycyBmcm9tIHRoZSBoaWdoIGxldmVsIG1h
a2UgdGFyZ2V0IG9yIHRvIGRlZmF1bHQgdGhlbSB0bwo+ID4gZ2NjL2crKyBpZiB1bnNldC4KPiAK
PiAgRnJvbSB0aGlzIGRlc2NyaXB0aW9uIEkgdGhvdWdodCByZXZpZXdpbmcgd291bGQgYmUgc3Ry
YWlnaHRmb3J3YXJkLgo+IEhvd2V2ZXIsIC4uLgo+IAo+ID4gLS0tIGEveGVuL3Rvb2xzL2tjb25m
aWcvTWFrZWZpbGUua2NvbmZpZwo+ID4gKysrIGIveGVuL3Rvb2xzL2tjb25maWcvTWFrZWZpbGUu
a2NvbmZpZwo+ID4gQEAgLTM1LDE1ICszNSwxNCBAQCBLQlVJTERfREVGQ09ORklHIDo9ICQoQVJD
SClfZGVmY29uZmlnCj4gPiAgICMgcHJvdmlkZSBvdXIgc2hlbGwKPiA+ICAgQ09ORklHX1NIRUxM
IDo9ICQoU0hFTEwpCj4gPiAgIAo+ID4gLSMgcHJvdmlkZSB0aGUgaG9zdCBjb21waWxlcgo+ID4g
LUhPU1RDQyA/PSBnY2MKPiA+IC1IT1NUQ1hYID89IGcrKwo+ID4gLQo+ID4gICAjIGZvcmNlIHRh
cmdldAo+ID4gICBQSE9OWSArPSBGT1JDRQo+ID4gICAKPiA+ICAgRk9SQ0U6Cj4gPiAgIAo+ID4g
KyMgU2V0cyB0b29sY2hhaW4gYmluYXJpZXMgdG8gdXNlCj4gPiAraW5jbHVkZSAkKFhFTl9ST09U
KS9jb25maWcvJChzaGVsbCB1bmFtZSAtcykubWsKPiA+ICsKPiA+ICAgIyBpbmNsdWRlIHRoZSBv
cmlnaW5hbCBNYWtlZmlsZSBhbmQgTWFrZWZpbGUuaG9zdCBmcm9tIExpbnV4Cj4gPiAgIGluY2x1
ZGUgJChzcmMpL01ha2VmaWxlCj4gPiAgIGluY2x1ZGUgJChzcmMpL01ha2VmaWxlLmhvc3QKPiAK
PiAuLi4gbmVpdGhlciB0aGUgbWFrZSBmaWxlIGhlcmUgbm9yIHRoZSB0d28gb25lcyBpbmNsdWRl
ZCAoaW4KPiBjb250ZXh0IGFib3ZlKSBpbmNsdWRlIGFueSBvdGhlciBmaWxlIChhZmFpY3MpIHRo
YXQgd291bGQgbGVhZCB0bwo+IEhPU1RDQyBiZWluZyBkZWZpbmVkLiBBbmQgbm90aGluZyB1bmRl
ciAkKFhFTl9ST09UKS9jb25maWcvIGxvb2tzCj4gdG8gZGVmaW5lIGl0IGVpdGhlci4gSSBndWVz
cyBJJ20gbWlzc2luZyBzb21ldGhpbmcsIGFzIEknbSBzdXJlCj4gdGhpcyBpcyB3b3JraW5nIGZv
ciB5b3UuCgpPaCwgdGhhdCdzIG15IGZhdWx0LiBUaGVyZSdzIGEgcHJlLXBhdGNoIG1pc3Npbmcg
aW4gdGhpcyBzZXJpZXMuIFRoZQpzZXJpZXMgc2hvdWxkIGhhdmUgYmVlbiA0IHBhdGNoZXMsIG5v
dCAzLiBHaXZlbiB0aGUgY29tbWVudHMgdG8gdGhlCm90aGVyIHBhdGNoZXMgSSB3aWxsIGhvbGQg
b2ZmIHNlbmRpbmcgYSBuZXcgdmVyc2lvbiB1bnRpbCB3ZSBnZXQKY29uc2Vuc3VzLgoKVGhhbmtz
LCBSb2dlci4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
