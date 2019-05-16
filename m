Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EECF2038C
	for <lists+xen-devel@lfdr.de>; Thu, 16 May 2019 12:35:51 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hRDh4-0004lc-IO; Thu, 16 May 2019 10:32:58 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=wixq=TQ=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1hRDh2-0004lF-B6
 for xen-devel@lists.xenproject.org; Thu, 16 May 2019 10:32:56 +0000
X-Inumbo-ID: f6fcc0e8-77c5-11e9-8980-bc764e045a96
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id f6fcc0e8-77c5-11e9-8980-bc764e045a96;
 Thu, 16 May 2019 10:32:55 +0000 (UTC)
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=SoftFail smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@MIAPEX02MSOL01.citrite.net
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=23.29.105.83;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: SoftFail (esa4.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com is inclined to not designate
 23.29.105.83 as permitted sender) identity=mailfrom;
 client-ip=23.29.105.83; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 include:spf.citrix.com
 include:spf2.citrix.com include:ironport.citrix.com
 exists:%{i}._spf.mta.salesforce.com ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@MIAPEX02MSOL01.citrite.net) identity=helo;
 client-ip=23.29.105.83; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@MIAPEX02MSOL01.citrite.net";
 x-conformance=sidf_compatible
IronPort-SDR: ertSoQqsKa389r0aixBWIU2nEifXVqy2tRbGucgiXRxq7+OpN0Is4kts9mnG16R6DWo9khQJSD
 /tY5bxGP/JJtz7C7StfZKt5rsYsA06aooxp/x6m2ypTYZzvpHAmxEeUvs6jCvWFVMyk1j9SmYu
 9Aodrm36rrnoi0jPI+l5fIRzXKEDttEwnp77v4NIREQcPxcMt/HmV7s5iAckl8OYM7k0bLDqAl
 yQrHM61m7RaDt2nI4p37LRMdE5fQO0BiCuJBBN9+ViYnUHX1bGjNcwENFoKpzZ/gGgyT877MTK
 NQU=
X-SBRS: 2.7
X-MesageID: 512566
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 23.29.105.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.60,476,1549947600"; 
   d="scan'208";a="512566"
Date: Thu, 16 May 2019 12:32:38 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <JBeulich@suse.com>
Message-ID: <20190516103238.pm6ducegde3xw5wz@Air-de-Roger>
References: <5CD2CDEC020000780022CC95@prv1-mh.provo.novell.com>
 <5CD2CFA1020000780022CCA6@prv1-mh.provo.novell.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5CD2CFA1020000780022CCA6@prv1-mh.provo.novell.com>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH 1/4] x86/IRQ: don't keep EOI timer running
 without need
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>,
 Konrad Rzeszutek
 Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBNYXkgMDgsIDIwMTkgYXQgMDY6NDY6MjVBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gVGhlIHRpbWVyIG5lZWRzIHRvIHJlbWFpbiBhY3RpdmUgb25seSB1bnRpbCBhbGwgcGVu
ZGluZyBJUlEgaW5zdGFuY2VzCj4gaGF2ZSBzZWVuIEVPSXMgZnJvbSB0aGVpciByZXNwZWN0aXZl
IGRvbWFpbnMuIFN0b3AgaXQgd2hlbiB0aGUgaW4tZmxpZ2h0Cj4gY291bnQgaGFzIHJlYWNoZWQg
emVybyBpbiBkZXNjX2d1ZXN0X2VvaSgpLiBOb3RlIHRoYXQgdGhpcyBpcyByYWNlIGZyZWUKPiAo
d2l0aCBfX2RvX0lSUV9ndWVzdCgpKSwgYXMgdGhlIElSUSBkZXNjcmlwdG9yIGxvY2sgaXMgYmVp
bmcgaGVsZCBhdAo+IHRoYXQgcG9pbnQuCj4gCj4gQWxzbyBwdWxsIHVwIHN0b3BwaW5nIG9mIHRo
ZSB0aW1lciBpbiBfX2RvX0lSUV9ndWVzdCgpIGl0c2VsZjogSW5zdGVhZAo+IG9mIHN0b3BwaW5n
IGl0IGltbWVkaWF0ZWx5IGJlZm9yZSByZS1zZXR0aW5nLCBzdG9wIGl0IGFzIHNvb24gYXMgd2Un
dmUKPiBtYWRlIGl0IHBhc3QgYW55IGVhcmx5IHJldHVybnMgZnJvbSB0aGUgZnVuY3Rpb24gKGFu
ZCBoZW5jZSB3ZSdyZSBzdXJlCj4gaXQnbGwgZ2V0IHNldCBhZ2FpbikuCj4gCj4gRmluYWxseSBi
YWlsIGZyb20gdGhlIGFjdHVhbCB0aW1lciBoYW5kbGVyIGluIGNhc2Ugd2UgZmluZCB0aGUgdGlt
ZXIKPiBhbHJlYWR5IGFjdGl2ZSBhZ2FpbiBieSB0aGUgdGltZSB3ZSd2ZSBtYW5hZ2VkIHRvIGFj
cXVpcmUgdGhlIElSUQo+IGRlc2NyaXB0b3IgbG9jay4gV2l0aG91dCB0aGlzIHdlIG1heSBmb3Jj
aWJseSBFT0kgYW4gSVJRIGltbWVkaWF0ZWx5Cj4gYWZ0ZXIgaXQgZ290IHNlbnQgdG8gYSBndWVz
dC4gRm9yIHRoaXMsIHRpbWVyX2lzX2FjdGl2ZSgpIGdldHMgc3BsaXQgb3V0Cj4gb2YgYWN0aXZl
X3RpbWVyKCksIGRlbGliZXJhdGVseSBtb3ZpbmcganVzdCBvbmUgb2YgdGhlIHR3byBBU1NFUlQo
KXMgKHRvCj4gYWxsb3cgdGhlIGZ1bmN0aW9uIHRvIGJlIHVzZWQgYWxzbyBvbiBhIG5ldmVyIGlu
aXRpYWxpemVkIHRpbWVyKS4KCkFGQUlDVCB0aW1lcl9pc19hY3RpdmUgaXMgZXhjbHVzaXZlbHkg
dXNlZCBpbiBpcnFfZ3Vlc3RfZW9pX3RpbWVyX2ZuLAp3aGljaCBtdXN0IGhhdmUgaW5pdGlhbGl6
ZWQgdGhlIHRpbWVyIGluIG9yZGVyIGZvcgppcnFfZ3Vlc3RfZW9pX3RpbWVyX2ZuIHRvIGJlIGNh
bGxlZCwgYW5kIGhlbmNlIEknbSBub3Qgc3VyZSB3aHkgeW91Cm5lZWQgdG8gYmUgYWJsZSB0byBj
YWxsIHRpbWVyX2lzX2FjdGl2ZSB3aXRoIGFuIHVuaW5pdGlhbGl6ZWQgdGltZXIuCgpJcyB0aGlz
IG1heWJlIHVzZWQgYnkgb3RoZXIgcGF0Y2hlcz8KClRoYW5rcywgUm9nZXIuCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
