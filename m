Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 972C91155D0
	for <lists+xen-devel@lfdr.de>; Fri,  6 Dec 2019 17:54:18 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1idGpG-0005KC-Mo; Fri, 06 Dec 2019 16:51:30 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=7dmx=Z4=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1idGpF-0005K7-GX
 for xen-devel@lists.xenproject.org; Fri, 06 Dec 2019 16:51:29 +0000
X-Inumbo-ID: a554736f-1848-11ea-839c-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a554736f-1848-11ea-839c-12813bfff9fa;
 Fri, 06 Dec 2019 16:51:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1575651089;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=2GRToQqoD1NieBgK5Ja7fDM4sy1Y+1+0IvRdyzLoJBc=;
 b=hwWqUWH69/Iwi3U4dTnVsf7rIguSHTmc25WmEGZN1uyXbGckPsqG5QvS
 pTHfUO+Zdd/O+Ir3BpSpQq/RREW7ZXUv+D541JFofKk03FhvbdjlnN0yy
 g9C+i3/JpArNPE/7EHdxU9OBkBvVo7XDM+cGh83zZKDjW2ZsDxr0g720O E=;
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
IronPort-SDR: PS6tWbST76tXlU+1qkyOtY7g6K0OhfKcx3O7HkYmUlQysK+8iaOG+PhdirmAfv45GQiLcIwHnW
 kjkzbytHTsVTnnFCj9+YlBoE+EUInJf6z4a3CjtHviA07jmPaVHhFJmYrTu0brQeQ1TaiYdpaA
 4T1AK3vuWLnrOExOKg8pmnh/aYkhSMeDB+ERfIlwE4xc09B0X62GmbkCoEcpCHjiEhmtMOXT+3
 VNVyQxrmui32hKIJy2IqHFWhAnDhGU18njQWTrjVsChySpfaltHck/CsubmaddaBUG4s+K3jA4
 EP0=
X-SBRS: 2.7
X-MesageID: 9318889
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,285,1571716800"; 
   d="scan'208";a="9318889"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <24042.34572.522244.289318@mariner.uk.xensource.com>
Date: Fri, 6 Dec 2019 16:51:24 +0000
To: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
 <Andrew.Cooper3@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>, "Konrad
 Rzeszutek Wilk" <konrad.wilk@oracle.com>, George Dunlap
 <George.Dunlap@citrix.com>
In-Reply-To: <24027.60461.969376.752788@mariner.uk.xensource.com>
References: <osstest-144289-mainreport@xen.org>
 <6278a67e-bd65-39d6-0322-32e8e7538457@suse.com>
 <24027.60461.969376.752788@mariner.uk.xensource.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: [Xen-devel] debina hang after "random: crng init done"
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SWFuIEphY2tzb24gd3JpdGVzICgiUmU6IFtYZW4tZGV2ZWxdIFt4ZW4tdW5zdGFibGUgdGVzdF0g
MTQ0Mjg5OiB0b2xlcmFibGUgRkFJTCIpOgo+IEphbiBCZXVsaWNoIHdyaXRlcyAoIlJlOiBbWGVu
LWRldmVsXSBbeGVuLXVuc3RhYmxlIHRlc3RdIDE0NDI4OTogdG9sZXJhYmxlIEZBSUwiKToKPiA+
IE9uIDI1LjExLjIwMTkgMTQ6NTgsIG9zc3Rlc3Qgc2VydmljZSBvd25lciB3cm90ZToKPiAuLi4K
PiA+ID4gIHRlc3QtYW1kNjQtYW1kNjQtbGlidmlydC14c20gIDcgeGVuLWJvb3QgICAgICAgICAg
ICAgICAgICAgZmFpbCBwYXNzIGluIDE0NDI4Mwo+ID4gCj4gPiBPdGhlciB0aGFuIHRoZSBzaGVs
bCBwcm9tcHQgbm90IGFwcGVhcmluZywgSSBjYW4ndCBzZWUgYW55Cj4gPiBpbmRpY2F0aW9uIG9m
IHdoYXQgbWF5IGhhdmUgZ29uZSB3cm9uZyBoZXJlIGZvciB3aGljaCByZWFzb24uCj4gCj4gVGhl
IGxhc3QgbWVzc2FnZSBwcmludGVkIHdhcwo+ICAgcmFuZG9tOiBjcm5nIGluaXQgZG9uZQo+IAo+
IFRoaXMgc2VlbWVkIGZhbWlsaWFyLiAgU2VhcmNoaW5nIG15IGVtYWlsIGZvdW5kCj4gCj4gICBv
c3N0ZXN0IHNlcnZpY2Ugb3duZXIgd3JpdGVzICgiW29zc3Rlc3QgdGVzdF0gMTQzNDkzOiByZWdy
ZXNzaW9ucyAtIEZBSUwiKToKPiAgID4gZmxpZ2h0IDE0MzQ5MyBvc3N0ZXN0IHJlYWwgW3JlYWxd
Cj4gICA+IGh0dHA6Ly9sb2dzLnRlc3QtbGFiLnhlbnByb2plY3Qub3JnL29zc3Rlc3QvbG9ncy8x
NDM0OTMvCj4gICA+IAo+ICAgPiBSZWdyZXNzaW9ucyA6LSgKPiAgID4gCj4gICA+IFRlc3RzIHdo
aWNoIGRpZCBub3Qgc3VjY2VlZCBhbmQgYXJlIGJsb2NraW5nLAo+ICAgPiBpbmNsdWRpbmcgdGVz
dHMgd2hpY2ggY291bGQgbm90IGJlIHJ1bjoKPiAgID4gIHRlc3QtYW1kNjQtYW1kNjQtcGFpciAg
ICAgICAgMTAgeGVuLWJvb3Qvc3JjX2hvc3QgICAgICAgIGZhaWwgUkVHUi4gdnMuIDE0MzM5Mgo+
IAo+ICAgSSBkb24ndCBrbm93IHdoYXQgdGhpcyBpcy4gIExpbnV4IGZhaWxzIHRvIGJvb3QgdW5k
ZXIgWGVuLiAgVGhlIGxhc3QKPiAgIG1lc3NhZ2UgaXMKPiAgICAgcmFuZG9tOiBjcm5nIGluaXQg
ZG9uZQo+ICAgQnV0IGl0IGRvZXNuJ3Qgc2VlbSBhdCBhbGwgcHJvYmFibGUgdGhhdCB0aGlzIGlz
IGFueXRoaW5nIHRvIGRvCj4gICB3aXRoIG9zc3Rlc3QuCj4gCj4gVGhhdCB3YXMgd2l0aCBkZWJp
bmExLgo+IAo+IFNvIGVpdGhlciBib3RoIHRoZXNlIGhvc3RzIGhhdmUgYSBzaW1pbGFyIGhhcmR3
YXJlIGZhdWx0LCBvciB0aGVyZSBpcwo+IHNvbWV0aGluZyBlbHNlIHdyb25nLgoKSGkuICBJcyBp
dCBwb3NzaWJsZSB0aGF0IHNvbWUgeDg2IG9yIGtlcm5lbCBleHBlcnQgY291bGQgaGVscCB0bwpp
bnZlc3RpZ2F0ZSB0aGlzID8KCkkgaGF2ZSBhIHJlcHJvIHdpdGggRGViaWFuIGJ1c3RlciwgdG9v
LCBoZXJlOgogIGh0dHA6Ly9sb2dzLnRlc3QtbGFiLnhlbnByb2plY3Qub3JnL29zc3Rlc3QvbG9n
cy8xNDQzMTIvdGVzdC1hbWQ2NC1pMzg2LXhsLXJhdy9pbmZvLmh0bWwKCkkgbWVudGlvbiB0aGlz
IGJlY2F1c2UgdGhlIGVhcmxpZXIgbG9ncywgYWJvdmUsIG1heSBoYXZlIGV4cGlyZWQuCgpUaGFu
a3MsCklhbi4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
