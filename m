Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AC09720415
	for <lists+xen-devel@lfdr.de>; Thu, 16 May 2019 13:06:37 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hREB5-0007oy-6p; Thu, 16 May 2019 11:03:59 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=wixq=TQ=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1hREB3-0007ot-8U
 for xen-devel@lists.xenproject.org; Thu, 16 May 2019 11:03:57 +0000
X-Inumbo-ID: 4bd24c23-77ca-11e9-8980-bc764e045a96
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 4bd24c23-77ca-11e9-8980-bc764e045a96;
 Thu, 16 May 2019 11:03:55 +0000 (UTC)
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=SoftFail smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@MIAPEX02MSOL02.citrite.net
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=23.29.105.83;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: SoftFail (esa3.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com is inclined to not designate
 23.29.105.83 as permitted sender) identity=mailfrom;
 client-ip=23.29.105.83; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 include:spf.citrix.com
 include:spf2.citrix.com include:ironport.citrix.com
 exists:%{i}._spf.mta.salesforce.com ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@MIAPEX02MSOL02.citrite.net) identity=helo;
 client-ip=23.29.105.83; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@MIAPEX02MSOL02.citrite.net";
 x-conformance=sidf_compatible
IronPort-SDR: 7psgUkcxVGxMkVvW0S9XVof7JWK/mzQIHyz6GpC3+c+I+UDcfW3SYGgCtMBp+39JiJwDoRsPoe
 9o/m6K/+zsbTCNTfTe8kruQEL9prjfz90tkhGXmjFzzm2S+A6zjUXe1fl7wZjrf5OrePFkiBH4
 h8eAzAUZdIQveF8RXmkIdHs7KGM4coS6DG0BdHdKLs78AKgD2ko70vtF+ePrcjt1H/pBzRVylt
 k3NCjiBLae7iT0j0Q8SWbRAgDjnv3isFCr/gLwiLySwdWFg8+khqENL7PUKOog6xdkxlPqvH0F
 yCw=
X-SBRS: 2.7
X-MesageID: 518005
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 23.29.105.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.60,476,1549947600"; 
   d="scan'208";a="518005"
Date: Thu, 16 May 2019 13:03:44 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <JBeulich@suse.com>
Message-ID: <20190516110344.mfifufhzrd4cjdlx@Air-de-Roger>
References: <5CD2CDEC020000780022CC95@prv1-mh.provo.novell.com>
 <5CD2CFA1020000780022CCA6@prv1-mh.provo.novell.com>
 <20190516103238.pm6ducegde3xw5wz@Air-de-Roger>
 <5CDD406E020000780022F906@prv1-mh.provo.novell.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5CDD406E020000780022F906@prv1-mh.provo.novell.com>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
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
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBNYXkgMTYsIDIwMTkgYXQgMDQ6NTA6MjJBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDE2LjA1LjE5IGF0IDEyOjMyLCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdy
b3RlOgo+ID4gT24gV2VkLCBNYXkgMDgsIDIwMTkgYXQgMDY6NDY6MjVBTSAtMDYwMCwgSmFuIEJl
dWxpY2ggd3JvdGU6Cj4gPj4gVGhlIHRpbWVyIG5lZWRzIHRvIHJlbWFpbiBhY3RpdmUgb25seSB1
bnRpbCBhbGwgcGVuZGluZyBJUlEgaW5zdGFuY2VzCj4gPj4gaGF2ZSBzZWVuIEVPSXMgZnJvbSB0
aGVpciByZXNwZWN0aXZlIGRvbWFpbnMuIFN0b3AgaXQgd2hlbiB0aGUgaW4tZmxpZ2h0Cj4gPj4g
Y291bnQgaGFzIHJlYWNoZWQgemVybyBpbiBkZXNjX2d1ZXN0X2VvaSgpLiBOb3RlIHRoYXQgdGhp
cyBpcyByYWNlIGZyZWUKPiA+PiAod2l0aCBfX2RvX0lSUV9ndWVzdCgpKSwgYXMgdGhlIElSUSBk
ZXNjcmlwdG9yIGxvY2sgaXMgYmVpbmcgaGVsZCBhdAo+ID4+IHRoYXQgcG9pbnQuCj4gPj4gCj4g
Pj4gQWxzbyBwdWxsIHVwIHN0b3BwaW5nIG9mIHRoZSB0aW1lciBpbiBfX2RvX0lSUV9ndWVzdCgp
IGl0c2VsZjogSW5zdGVhZAo+ID4+IG9mIHN0b3BwaW5nIGl0IGltbWVkaWF0ZWx5IGJlZm9yZSBy
ZS1zZXR0aW5nLCBzdG9wIGl0IGFzIHNvb24gYXMgd2UndmUKPiA+PiBtYWRlIGl0IHBhc3QgYW55
IGVhcmx5IHJldHVybnMgZnJvbSB0aGUgZnVuY3Rpb24gKGFuZCBoZW5jZSB3ZSdyZSBzdXJlCj4g
Pj4gaXQnbGwgZ2V0IHNldCBhZ2FpbikuCj4gPj4gCj4gPj4gRmluYWxseSBiYWlsIGZyb20gdGhl
IGFjdHVhbCB0aW1lciBoYW5kbGVyIGluIGNhc2Ugd2UgZmluZCB0aGUgdGltZXIKPiA+PiBhbHJl
YWR5IGFjdGl2ZSBhZ2FpbiBieSB0aGUgdGltZSB3ZSd2ZSBtYW5hZ2VkIHRvIGFjcXVpcmUgdGhl
IElSUQo+ID4+IGRlc2NyaXB0b3IgbG9jay4gV2l0aG91dCB0aGlzIHdlIG1heSBmb3JjaWJseSBF
T0kgYW4gSVJRIGltbWVkaWF0ZWx5Cj4gPj4gYWZ0ZXIgaXQgZ290IHNlbnQgdG8gYSBndWVzdC4g
Rm9yIHRoaXMsIHRpbWVyX2lzX2FjdGl2ZSgpIGdldHMgc3BsaXQgb3V0Cj4gPj4gb2YgYWN0aXZl
X3RpbWVyKCksIGRlbGliZXJhdGVseSBtb3ZpbmcganVzdCBvbmUgb2YgdGhlIHR3byBBU1NFUlQo
KXMgKHRvCj4gPj4gYWxsb3cgdGhlIGZ1bmN0aW9uIHRvIGJlIHVzZWQgYWxzbyBvbiBhIG5ldmVy
IGluaXRpYWxpemVkIHRpbWVyKS4KPiA+IAo+ID4gQUZBSUNUIHRpbWVyX2lzX2FjdGl2ZSBpcyBl
eGNsdXNpdmVseSB1c2VkIGluIGlycV9ndWVzdF9lb2lfdGltZXJfZm4sCj4gPiB3aGljaCBtdXN0
IGhhdmUgaW5pdGlhbGl6ZWQgdGhlIHRpbWVyIGluIG9yZGVyIGZvcgo+ID4gaXJxX2d1ZXN0X2Vv
aV90aW1lcl9mbiB0byBiZSBjYWxsZWQsIGFuZCBoZW5jZSBJJ20gbm90IHN1cmUgd2h5IHlvdQo+
ID4gbmVlZCB0byBiZSBhYmxlIHRvIGNhbGwgdGltZXJfaXNfYWN0aXZlIHdpdGggYW4gdW5pbml0
aWFsaXplZCB0aW1lci4KPiAKPiBJdCdzIG5vdCBuZWVkZWQgaGVyZSwgYnV0IEkgY29uc2lkZXIg
dGhpcyB1c2VmdWwgYmVoYXZpb3Igd2hlbiB1c2VkCj4gb3V0c2lkZSBvZiB0aGUgc3BlY2lmaWMg
dGltZXIncyBoYW5kbGVyLgo+IAo+ID4gSXMgdGhpcyBtYXliZSB1c2VkIGJ5IG90aGVyIHBhdGNo
ZXM/Cj4gCj4gTm9uZSB0aGF0IEkgd291bGQgaGF2ZSBpbiB0aGUgd29ya3MuCgpUaGVuIElNTyBJ
IHdvdWxkIHJhdGhlciBtYWtlIHRpbWVyX2lzX2FjdGl2ZSBhIHJlcGxhY2VtZW50IGZvcgphY3Rp
dmVfdGltZXIgKG9yIGp1c3QgbW92ZSBhY3RpdmVfdGltZXIgdG8gdGhlIGhlYWRlcikgaWYgdGhl
cmUncyBubwp1c2VyIHRoYXQgY2FuIGNhbGwgdGltZXJfaXNfYWN0aXZlIHdpdGggYW4gdW5pbml0
aWFsaXplZCB0aW1lci4gSWU6IEkKd291bGQga2VlcCB0aGUgYXNzZXJ0cyBhcyByZXN0cmljdGl2
ZSBhcyBwb3NzaWJsZSB1bmxlc3MgdGhlcmUncyBhCnVzZXIgdGhhdCByZXF1aXJlcyBsZXNzIHJl
c3RyaWN0aXZlIGFzc2VydGlvbnMuCgpBbnl3YXksIHRoZSBjaGFuZ2UgaXMgYW4gaW1wcm92ZW1l
bnQsIHNvIHdpdGggb3Igd2l0aG91dCB0aGF0IGNoYW5nZWQ6CgpSZXZpZXdlZC1ieTogUm9nZXIg
UGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+CgpUaGFua3MuCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
