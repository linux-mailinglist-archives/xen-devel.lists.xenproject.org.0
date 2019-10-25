Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C35DE4EA9
	for <lists+xen-devel@lfdr.de>; Fri, 25 Oct 2019 16:13:09 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iO0Ik-0000Gs-4U; Fri, 25 Oct 2019 14:10:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=6Phy=YS=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1iO0Ii-0000Gn-J7
 for xen-devel@lists.xenproject.org; Fri, 25 Oct 2019 14:10:48 +0000
X-Inumbo-ID: 3dda205e-f731-11e9-beca-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3dda205e-f731-11e9-beca-bc764e2007e4;
 Fri, 25 Oct 2019 14:10:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1572012648;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=mMOKjuVQ5K3oEqM0kmEpbV+shb4vFKfHWjbLjO6Om70=;
 b=Mcgt99aEzxVq1O4DiATvWDrsJTIZ0Hzmuj4p0zVPXDdh8hmvXn9LvW+Y
 Q2bqTSN6C4dgTu9S2v4DpbDswSONC2eWvCbPVukDS/pzxUPa6cD254w2G
 iHRVbGMUCL9NSwyqBJQCZnE1MLWdTPJLbpZ08TvWl1Ilnf/TMRLigWjdV I=;
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
IronPort-SDR: Shc4SOKEtqt/mihIYrtHmXZ5L5Q5sBHemNKqsboqawNIXOYS55ZuP/ohfUldEgE7YV7lC3PQG1
 sap/1l+/pbJD+TGsAnUKe9rMHHKK0dbQ49irgrzRlOP3+J9glUDm4nlFYM0zZsD8GkfqreswvI
 G9uPWP8qWXMXkas7H9FRqcVmpZZoVn9IqA+P7YQZF2514pDJ3tNUG2YcnTZO5g062WubPmuS8v
 m1mSfpztte9iL+2rivCKz/Vm+42xF9+ew8XMLOyyWh7/4JtXJWJLCIBM7fdEqp89p0rhouh1zc
 pPA=
X-SBRS: 2.7
X-MesageID: 7530771
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.68,228,1569297600"; 
   d="scan'208";a="7530771"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <23987.612.478471.499314@mariner.uk.xensource.com>
Date: Fri, 25 Oct 2019 15:10:44 +0100
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
In-Reply-To: <a4f42a12-6154-c072-8a7b-5597400b2953@citrix.com>
References: <F6091989-2145-435A-8CE8-66BF7172C0C2@citrix.com>
 <f249ef17-359b-1aa4-3704-0f22968b78e0@citrix.com>
 <a4f42a12-6154-c072-8a7b-5597400b2953@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] Tagging livepatch-build-tools.git with Xen releases
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
Cc: =?iso-8859-1?Q?J=FCrgen_Gro=DF?= <jgross@suse.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>, 'Jan Beulich' <JBeulich@suse.com>,
 Lars Kurth <lars.kurth@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QW5kcmV3IENvb3BlciB3cml0ZXMgKCJSZTogW1hlbi1kZXZlbF0gVGFnZ2luZyBsaXZlcGF0Y2gt
YnVpbGQtdG9vbHMuZ2l0IHdpdGggWGVuIHJlbGVhc2VzIik6Cj4gT24gMjUvMTAvMjAxOSAxMzoy
NywgUm9zcyBMYWdlcndhbGwgd3JvdGU6Cj4gPiBPbiAxMC8yNS8xOSAxMjowNSBQTSwgTGFycyBL
dXJ0aCB3cm90ZToKPiA+PiBIaSBhbGwsCj4gPj4KPiA+PiBJIGFtIHdvbmRlcmluZyB3aGV0aGVy
IHdlIHNob3VsZCB0YWcgbGl2ZXBhdGNoLWJ1aWxkLXRvb2xzLmdpdCB3aXRoCj4gPj4gWGVuIHJl
bGVhc2VzCj4gPj4KPiA+Cj4gPiBJIHRob3VnaHQgdGhpcyBoYWQgYmVlbiBkaXNjdXNzZWQgYmVm
b3JlIGJ1dCBJIGNhbid0IGZpbmQgYW55dGhpbmcgaW4KPiA+IG15IGFyY2hpdmVzLgo+IAo+IEkg
cmVjYWxsIGEgZGlzY3Vzc2lvbiBhdCB0aGUgdGltZSBhcyB3ZWxsLgo+IAo+ID4gSU1PIGxpdmVw
YXRjaC1idWlsZC10b29scyBpcyBhIHNlcGFyYXRlIHRvb2wgdGhhdCBkb2Vzbid0IG5lZWQgdG8g
bW92ZQo+ID4gaW4gbG9ja3N0ZXAgd2l0aCBYZW4uIEkgd291bGQgYWx3YXlzIHJlY29tbWVuZCB1
c2luZyB0aGUgdGlwIGNvbW1pdAo+ID4gc2luY2UgYnVncyBvZnRlbiBnZXQgZml4ZWQgYXJvdW5k
IHRoZSB0aW1lIHRoYXQgcGF0Y2hpbmcgaXMgbmVlZGVkLgo+ID4gVGhlcmVmb3JlIEkgZG9uJ3Qg
c2VlIGFueSB2YWx1ZSBpbiB0YWdnaW5nIGl0IGZvciB0aGUgdGltZSBiZWluZy4KPiAKPiArMiB0
byBub3QgYmVpbmcgaW4gbG9ja3N0ZXAuwqAgSXQgaGVscHMgbWFzc2l2ZWx5IHdpdGggZG93bnN0
cmVhbSB1c2FiaWxpdHkuCgpXZSBjYW4gc3RpbGwgdGFnIHRoaW5ncyB3aXRoIFhlbiByZWxlYXNl
IHZlcnNpb25zIGp1c3QgdG8gZGVzaWduYXRlCndoYXQgd2UgY29uc2lkZXIgcGFydCBvZiB0aGUg
b3ZlcmFsbCBwcm9qZWN0IHJlbGVhc2UsIHdpdGhvdXQgaW1wbHlpbmcKdGhhdCB0aGUgdHdvIG5l
ZWQgdG8gYmUgaW4gbG9ja3N0ZXAuCgpJYW4uCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
