Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B04A125E26
	for <lists+xen-devel@lfdr.de>; Thu, 19 Dec 2019 10:51:48 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ihsQC-0004A7-IC; Thu, 19 Dec 2019 09:48:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ZYQM=2J=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1ihsQA-0004A0-CH
 for xen-devel@lists.xenproject.org; Thu, 19 Dec 2019 09:48:38 +0000
X-Inumbo-ID: b5cdd888-2244-11ea-b6f1-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b5cdd888-2244-11ea-b6f1-bc764e2007e4;
 Thu, 19 Dec 2019 09:48:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1576748910;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=h/7Sf+EXFgOsivaF0ki2YiC3uBPLV3wwuvq/flvuPSg=;
 b=QvKeHf67GV7iUPWrYRdMr9uL/J49CgTJV2kjaZz0BVAos2DBJhpQuqEy
 yIE+ntmLkJEmBWBdCE/wMfeUiPBiEvIueWHCqC7PhuMe0zeviCx5kjIDV
 NHn2Z6sFds6D11Gjn/Bjz+NKI7qFSiYyZjzpNxhbxliTEqZqw1yDkz58n 0=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: zFmr2ayxq0lBwwKyVPzmYUDTIotOZgRqIIjYV0v8j6BhHEVhGefhDvxlF/bWSsmP8MhW0myzah
 FMXGFayEm61iZv8B5LgK+GPz3o2nW+k9xpNdhNGtCzOxf22INKTvH6EFz9E02DaLgYsp1dwlaj
 YgwDWV/FydyC06JiI2XdAVpwyknrO5dnuFYp8PtvW5TKiFXYoIyF2BXBY5wE/cS4RGn/3mxtKb
 srUqogCJrf7Rq7c3HJJKxPevCpdYaffmRkkncAeVx83LifDFd3amGf7seUFJ/ewTMPLyIYUnDV
 po4=
X-SBRS: 2.7
X-MesageID: 9932676
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,331,1571716800"; 
   d="scan'208";a="9932676"
Date: Thu, 19 Dec 2019 10:48:14 +0100
From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
To: Tamas K Lengyel <tamas.lengyel@intel.com>
Message-ID: <20191219094814.GB11756@Air-de-Roger>
References: <cover.1576697796.git.tamas.lengyel@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1576697796.git.tamas.lengyel@intel.com>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL03.citrite.net (10.69.22.127)
Subject: Re: [Xen-devel] [PATCH v2 00/20] VM forking
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
Cc: Petre
 Pircalabu <ppircalabu@bitdefender.com>, Tamas K Lengyel <tamas@tklengyel.com>,
 Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <george.dunlap@eu.citrix.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>,
 Anthony PERARD <anthony.perard@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Jan Beulich <jbeulich@suse.com>,
 Alexandru Isaila <aisaila@bitdefender.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBEZWMgMTgsIDIwMTkgYXQgMTE6NDA6MzdBTSAtMDgwMCwgVGFtYXMgSyBMZW5neWVs
IHdyb3RlOgo+IFRoZSBmb2xsb3dpbmcgc2VyaWVzIGltcGxlbWVudHMgVk0gZm9ya2luZyBmb3Ig
SW50ZWwgSFZNIGd1ZXN0cyB0byBhbGxvdyBmb3IKPiB0aGUgZmFzdCBjcmVhdGlvbiBvZiBpZGVu
dGljYWwgVk1zIHdpdGhvdXQgdGhlIGFzc29zY2lhdGVkIGhpZ2ggc3RhcnR1cCBjb3N0cwo+IG9m
IGJvb3Rpbmcgb3IgcmVzdG9yaW5nIHRoZSBWTSBmcm9tIGEgc2F2ZWZpbGUuCj4gCj4gSklSQSBp
c3N1ZTogaHR0cHM6Ly94ZW5wcm9qZWN0LmF0bGFzc2lhbi5uZXQvYnJvd3NlL1hFTi04OQo+IAo+
IFRoZSBtYWluIGRlc2lnbiBnb2FsIHdpdGggdGhpcyBzZXJpZXMgaGFzIGJlZW4gdG8gcmVkdWNl
IHRoZSB0aW1lIG9mIGNyZWF0aW5nCj4gdGhlIFZNIGZvcmsgYXMgbXVjaCBhcyBwb3NzaWJsZS4g
VG8gYWNoaWV2ZSB0aGlzIHRoZSBWTSBmb3JraW5nIHByb2Nlc3MgaXMKPiBzcGxpdCBpbnRvIHR3
byBzdGVwczoKPiAgICAgMSkgZm9ya2luZyB0aGUgVk0gb24gdGhlIGh5cGVydmlzb3Igc2lkZTsK
PiAgICAgMikgc3RhcnRpbmcgUUVNVSB0byBoYW5kbGUgdGhlIGJhY2tlZCBmb3IgZW11bGF0ZWQg
ZGV2aWNlcy4KPiAKPiBTdGVwIDEpIGludm9sdmVzIGNyZWF0aW5nIGEgVk0gdXNpbmcgdGhlIG5l
dyAieGwgZm9yay12bSIgY29tbWFuZC4gVGhlCj4gcGFyZW50IFZNIGlzIGV4cGVjdGVkIHRvIHJl
bWFpbiBwYXVzZWQgYWZ0ZXIgZm9ya3MgYXJlIGNyZWF0ZWQgZnJvbSBpdCAod2hpY2gKPiBpcyBk
aWZmZXJlbnQgdGhlbiB3aGF0IHByb2Nlc3MgZm9ya2luZyBub3JtYWxseSBlbnRhaWxzKS4gRHVy
aW5nIHRoaXMgZm9ya2luZwogICAgICAgICAgICAgICBeIHRoYW4KPiBvcGVyYXRpb24gdGhlIEhW
TSBjb250ZXh0IGFuZCBWTSBzZXR0aW5ncyBhcmUgY29waWVkIG92ZXIgdG8gdGhlIG5ldyBmb3Jr
ZWQgVk0uCj4gVGhpcyBvcGVyYXRpb24gaXMgZmFzdCBhbmQgaXQgYWxsb3dzIHRoZSBmb3JrZWQg
Vk0gdG8gYmUgdW5wYXVzZWQgYW5kIHRvIGJlCj4gbW9uaXRvcmVkIGFuZCBhY2Nlc3NlZCB2aWEg
Vk1JLiBOb3RlIGhvd2V2ZXIgdGhhdCB3aXRob3V0IGl0cyBkZXZpY2UgbW9kZWwKPiBydW5uaW5n
IChkZXBlbmRpbmcgb24gd2hhdCBpcyBleGVjdXRpbmcgaW4gdGhlIFZNKSBpdCBpcyBib3VuZCB0
bwo+IG1pc2JlaGF2ZS9jcmFzaCB3aGVuIGl0cyB0cnlpbmcgdG8gYWNjZXNzIGRldmljZXMgdGhh
dCB3b3VsZCBiZSBlbXVsYXRlZCBieQo+IFFFTVUuIFdlIGFudGljaXBhdGUgdGhhdCBmb3IgY2Vy
dGFpbiB1c2UtY2FzZXMgdGhpcyB3b3VsZCBiZSBhbiBhY2NlcHRhYmxlCj4gc2l0dWF0aW9uLCBp
biBjYXNlIGZvciBleGFtcGxlIHdoZW4gZnV6emluZyBpcyBwZXJmb3JtZWQgb2YgY29kZSBzZWdt
ZW50cyB0aGF0Cj4gZG9uJ3QgYWNjZXNzIHN1Y2ggZGV2aWNlcy4KPiAKPiBTdGVwIDIpIGludm9s
dmVzIGxhdW5jaGluZyBRRU1VIHRvIHN1cHBvcnQgdGhlIGZvcmtlZCBWTSwgd2hpY2ggcmVxdWly
ZXMgdGhlCj4gUUVNVSBYZW4gc2F2ZWZpbGUgdG8gYmUgZ2VuZXJhdGVkIG1hbnVhbGx5IGZyb20g
dGhlIHBhcmVudCBWTS4gVGhpcyBjYW4gYmUKPiBhY2NvbXBsaXNoZWQgc2ltcGx5IGJ5IGNvbm5l
Y3RpbmcgdG8gaXRzIFFNUCBzb2NrZXQgYW5kIGlzc3VpbmcgdGhlCj4gInhlbi1zYXZlLWRldmlj
ZXMtc3RhdGUiIGNvbW1hbmQgYXMgZG9jdW1lbnRlZCBieSBRRU1VOgo+IGh0dHBzOi8vZ2l0aHVi
LmNvbS9xZW11L3FlbXUvYmxvYi9tYXN0ZXIvZG9jcy94ZW4tc2F2ZS1kZXZpY2VzLXN0YXRlLnR4
dAo+IE9uY2UgdGhlIFFFTVUgWGVuIHNhdmVmaWxlIGlzIGdlbmVyYXRlZCB0aGUgbmV3ICJ4bCBm
b3JrLWxhdW5jaC1kbSIgY29tbWFuZCBpcwo+IHVzZWQgdG8gbGF1bmNoIFFFTVUgYW5kIGxvYWQg
dGhlIHNwZWNpZmllZCBzYXZlZmlsZSBmb3IgaXQuCgpJTU8gaGF2aW5nIHR3byBkaWZmZXJlbnQg
Y29tbWFuZHMgaXMgY29uZnVzaW5nIGZvciB0aGUgZW5kIHVzZXIsIEkKd291bGQgcmF0aGVyIGhh
dmUgc29tZXRoaW5nIGxpa2U6Cgp4bCBmb3JrLXZtIFstZF0gLi4uCgpXaGVyZSAnLWQnIHdvdWxk
IHByZXZlbnQgZm9ya2luZyBhbnkgdXNlci1zcGFjZSBlbXVsYXRvcnMuIEkgZG9uJ3QKdGhpbmtz
IHRoZXJlJ3MgYSBuZWVkIGZvciBhIHNlcGFyYXRlIGNvbW1hbmQgdG8gZm9yayB0aGUgdW5kZXJs
eWluZwp1c2VyLXNwYWNlIGVtdWxhdG9ycy4KClRoYW5rcywgUm9nZXIuCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
