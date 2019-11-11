Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 60219F75E3
	for <lists+xen-devel@lfdr.de>; Mon, 11 Nov 2019 15:04:21 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iUAFQ-0007hr-A6; Mon, 11 Nov 2019 14:00:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=VDtj=ZD=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1iUAFO-0007hm-N3
 for xen-devel@lists.xenproject.org; Mon, 11 Nov 2019 14:00:50 +0000
X-Inumbo-ID: a9bf6bb4-048b-11ea-9631-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a9bf6bb4-048b-11ea-9631-bc764e2007e4;
 Mon, 11 Nov 2019 14:00:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1573480850;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=lheMHHh7hPlOVp3VRGBvCSfAWQOgHNrje3jXeB84lZ0=;
 b=fXb1vcHe/waQ+f2AeuputHHMNPhwH4ZIJLVUw7f1vs+15zMfok2gv2/1
 XlrIlmRk7iIkuSxo1n/cvSkCnKVIIPZQZ+9V9z6Pc/4GVw7bSQ2gqpRG1
 puuA1HcP8a8pWcjKzKBSVWA969v2GFYh60VAXYXHoyaq9pOjCAhRYKKTg g=;
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
IronPort-SDR: sF5dk+SvYJHGb7GnVMEV4u24pS71cQHsGex1/TVRUE7R/fIsyEoTpEvVMpSdew6KQbJk6ythka
 245zJl1KubEIEcjzTml2WVqtJswxLpBsEzQYkUneZQDjfwdCkEYLxwpducUve+BxSKaiJ0TvXC
 dFYdLtPs1FhCrw6+by1G22anxD/6kNuUIOYs0QHfoNW69iXux6B9AeS4WI/73jWFB1ZfG/P54J
 QFIF+qSvoTjlZEdzkztuW5BPd0JuTCDiiAl38TJN/QE08+pxX3bDkjNaCh95UMYwS4SlzOdbS2
 fXo=
X-SBRS: 2.7
X-MesageID: 8137685
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.68,293,1569297600"; d="scan'208,217";a="8137685"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <24009.27021.89542.532323@mariner.uk.xensource.com>
Date: Mon, 11 Nov 2019 14:00:45 +0000
To: Sander Eikelenboom <linux@eikelenboom.it>
In-Reply-To: <46208d46-a203-2a4a-824f-e4962e9c8b91@eikelenboom.it>
References: <20191108185001.3319-1-ian.jackson@eu.citrix.com>
 <1095f982-8336-0e85-8245-0d74467e2895@eikelenboom.it>
 <24009.16196.627425.877118@mariner.uk.xensource.com>
 <46208d46-a203-2a4a-824f-e4962e9c8b91@eikelenboom.it>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [OSSTEST PATCH 00/13] Speed up and restore host
 history
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
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

U2FuZGVyIEVpa2VsZW5ib29tIHdyaXRlcyAoIlJlOiBbWGVuLWRldmVsXSBbT1NTVEVTVCBQQVRD
SCAwMC8xM10gU3BlZWQgdXAgYW5kIHJlc3RvcmUgaG9zdCBoaXN0b3J5Iik6Cj4gL21lIGlzIGR1
Y2tpbmcgdW5kZXIgdGhlIHRhYmxlIDspCj4gU2VlbXMgdG8gYmUgcXVpdGUgYSBsb3Qgb2YgaW50
cmFjYXRlIFBlcmwsIEkgbmV2ZXIgd2FzIGEgcHJpbmNlIG9mIFBlcmwKPiBhbmQgdGhhdCBoYXNu
J3QgZ290IGFueSBiZXR0ZXIgYnkgbm90IHVzaW5nIGl0IGFjdGl2ZWx5IHRoZSBwYXN0IHllYXJz
LgoKSGVoLiAgQWx0aG91Z2ggaXQncyBnZW5lcmFsbHkgbm90IHN1cHBvc2VkIHRvIGJlIGludHJp
Y2F0ZS4gIEkgaGF2ZQp0cmllZCB0byBrZWVwIGl0IGZhaXJseSBzdHJhaWdodGZvcndhcmQuCgo+
IE5vdCByZWFsbHksIGJ1dCBlc3BlY2lhbGx5IGFwcGx5aW5nIHN0eWxlIHRvIGFsdGVybmF0aW5n
IHJvd3MgaXMgbm93Cj4gcXVpdGUgc2ltcGxlIHdpdGggcHNldWRvIGNsYXNzZXM6Cj4gCj4gIHRy
Om50aC1jaGlsZChldmVuKXsKPiAgICBiYWNrZ3JvdW5kLWNvbG9yOiBncmV5Owo+ICB9Cj4gCj4g
IHRyOm50aC1jaGlsZChldmVuKXsKPiAgICBiYWNrZ3JvdW5kLWNvbG9yOiB3aGl0ZTsKPiAgfQo+
IAo+IFlvdSBjb3VsZCBzdHVmZiB0aGlzIGluIGEgPGhlYWQ+PHN0eWxlPiAuLi4gPC9zdHlsZT48
L2hlYWQ+LAo+IHNvIHlvdSBkb24ndCBoYXZlIHRvIHJlcGVhdCB0aGlzIGV2ZXJ5IHJvdyBmb3Ig
dGhlIGNvbW1vbiBjYXNlLgo+IEZvciBhbnkgc3BlY2lhbCBjYXNlcyB5b3UgY291bGQgb3ZlcnJ1
bGUgYmFzZWQgb24gY2xhc3MuCj4gSSBoYXBwZW4gdG8gZmluZCBpdCBvbmUgb2YgdGhlIG1vc3Qg
dXNlZnVsIENTUyBmZWF0dXJlcy4KCkludGVyZXN0aW5nLiAgTW1tLiAgKEFsdGhvdWdoIHlvdXIg
dmlnbmV0dGUgYWJvdmUgb3VnaHQgdG8gaGF2ZSBhbgpgb2RkJyBpbiBpdCBJIHRoaW5rLi4uKQoK
PiA+IE1heWJlLCBidXQgY3VycmVudGx5IHRoZSBhcmNoYWVvbG9neSBhbGdvcml0aG0gaXMgbm90
IGV4cHJlc3NlZAo+ID4gZW50aXJlbHkgaW4gU1FMIHNvIGl0IGNvdWxkbid0IGJlIGEgbWF0ZXJp
YWxpc2VkIHZpZXcuICBBbmQgY29udmVydGluZwo+ID4gaXQgdG8gU1FMIHdvdWxkIGJlIGFubm95
aW5nIGJlY2F1c2UgU1FMIGlzIGEgcmF0aGVyIHBvb3IgcHJvZ3JhbW1pbmcKPiA+IGxhbmd1YWdl
Lgo+IAo+IEl0IGlzIGEgcG9vciBwcm9ncmFtbWluZyBsYW5ndWFnZSwgYnV0IGl0IGlzIHZlcnkg
Z29vZCBhdCByZXRyaWV2aW5nIGFuZAo+IG1vZGlmeWluZyBkYXRhLiBTb21ldGltZXMgaXQgdGFr
ZXMgc29tZSBlZmZvcnQgdG8gd3JhcCB5b3VyIGhlYWQgYXJvdW5kCj4gdGhlIHdheSB5b3UgaGF2
ZSB0byBzcGVjaWZ5IHdoYXQgZGF0YSB5b3Ugd2FudCBhbmQgaW4gd2hhdCBmb3IsIHdpdGhvdXQK
PiBiZWluZyB0byBleHBsaWNpdCBpbiBob3cgaXQgaXMgc3VwcG9zZWQgdG8gYmUgcmV0cmlldmVk
LgoKSW5kZWVkIHNvLgoKPiBJZiBJIHJlbWVtYmVyIGNvcnJlY3RseSBQb3N0Z3JlcyBpcyBiZWlu
ZyB1c2VkLCBwZXJoYXBzIHRoZXJlIGlzIHN0dWxsCj4gc29tZSByZWxhdGl2ZWx5IGxvdyBoYW5n
aW5nIGZydWl0IHdoZW4gYW5hbHl6aW5nIHRoZSBwZXJmb3JtYW5jZSBvZiB0aGUKPiBxdWVyaWVz
IHlvdSBydW4gYXQgdGhlIGFjdHVhbCBkYXRhLgoKWWVzLiAgT25lIG9mIHRoZSBiaWdnZXN0IHBy
b2JsZW1zIGlzIEkgcmVhbGx5IHdhbnQgdG8gbWFrZSBhbiBpbmRleCBvbgpydW52YXIgKnZhbHVl
cyouICBCdXQgaWYgSSBkbyB0aGF0IHRoZW4gcm91dGluZSBydW52YXIgdXBkYXRlcyBoYXZlIHRv
CnVwZGF0ZSB0aGF0IGluZGV4LiAgU28gd2hhdCBJIHdhbnQgaXMgYSBwYXJ0aWFsIGluZGV4IGJ1
dCB0aGUgcm93cyBvZgpydW52YXJzIHdoaWNoIGFyZSBpbmRleGVkIG91Z2h0IHRvIGJlIGNvbnRy
b2xsZWQgYnkgdGhlIGNvcnJlc3BvbmRpbmcKcm93IG9mIHRoZSBmbGlnaHRzIHRhYmxlLgoKSSBh
bSBjb25zaWRlcmluZyBkZW5vcm1hbGlzaW5nIHRoaXMgYnkgaW5jbHVkaW5nIGEgYGZpbmFsaXNl
ZCcgYml0IGluCnRoZSBydW52YXJzIHRhYmxlLiAgQnV0IG5vdCBub3cuLi4KCj4gSSB3aWxsIHRh
a2UgYSBsb29rIGF0IHRoZSBjb2RlIHNvbWV3aGVyZSB0aGlzIG9yIG5leHQgd2VlayBhbmQgc2Vl
IGlmIEkKPiBjYW4gZ2V0IGFueSBmYW1pbGlhcml0eSB3aXRoIGl0IGFuZCBwZXJoYXBzIGVuZCB1
cCB3aXRoIHNvbWUgY29udHJpYnV0aW9ucy4KCkFsbCBjb250cmlidXRpb25zIGFuZCBzdWdnZXN0
aW9ucyBhcmUgd2VsY29tZS4KClJlZ2FyZHMsCklhbi4KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
