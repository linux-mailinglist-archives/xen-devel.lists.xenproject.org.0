Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D1B9B21C5
	for <lists+xen-devel@lfdr.de>; Fri, 13 Sep 2019 16:19:56 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i8mOM-00026A-Sg; Fri, 13 Sep 2019 14:17:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Qndu=XI=citrix.com=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1i8mOL-000265-7g
 for xen-devel@lists.xenproject.org; Fri, 13 Sep 2019 14:17:41 +0000
X-Inumbo-ID: 3e613cd6-d631-11e9-b299-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3e613cd6-d631-11e9-b299-bc764e2007e4;
 Fri, 13 Sep 2019 14:17:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1568384261;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=s03K5ghMWyGx4OtNzq7Lq79i6IEdpZYYlDkFA+AVtcA=;
 b=ZrIgwM02chm3F3vxt8rhIN3xUnLamzaLwx+c0Ja17YOWFxuDINy/uMpg
 H9uVmdVy6ZT+dZOcSjOokrzqlf8J/QDFvkkItXbkkLqsmZh9jZ4CbIVxt
 JXXJy3l9aS4f6/LSO7mpdUWGgv9P0jp1y+uWAdbx6qrN2ok5m8X7LouZS M=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=Paul.Durrant@citrix.com;
 spf=Pass smtp.mailfrom=Paul.Durrant@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 Paul.Durrant@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 Paul.Durrant@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 5Gg2drEgK63FyKW2CNSJol7n8yomTP+4xLVRdrXErylXYYrUhy9UUcw2VKu1+jR+ELRXUo8/Vi
 SuVaE0W/1mrgb9q7ZSpAw4N5or+A10iDdy9RPYRaGzgoU2ozikhjRzMj3ioMc0M+7zOfsG5qu+
 MNewZCNQf4hmv6fAgpqXu2mJ89Lgd4mp9tEiapC69TQ6Tc6nIuJdhwYW+vGmmHwevMJQC1X+A7
 32aslmC0ph03UqestbdebPNAshJ+Au6j9IR8iUQooPIzK9tbZEwbi4nzU9o5B00edY7hfGUCho
 fHs=
X-SBRS: 2.7
X-MesageID: 5593297
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,501,1559534400"; 
   d="scan'208";a="5593297"
From: Paul Durrant <Paul.Durrant@citrix.com>
To: Roger Pau Monne <roger.pau@citrix.com>, Jan Beulich <jbeulich@suse.com>
Thread-Topic: [PATCH v11.1 3/6] sysctl / libxl: report whether IOMMU/HAP page
 table sharing is supported
Thread-Index: AQHVaiPWsY0upY3KjUqZUIdUedXUHKcpf3gAgAAmTpA=
Date: Fri, 13 Sep 2019 14:17:32 +0000
Message-ID: <09577e72d61147cb8dda4d92c11ce61d@AMSPEX02CL03.citrite.net>
References: <20190913105826.2704-1-paul.durrant@citrix.com>
 <20190913105826.2704-4-paul.durrant@citrix.com>
 <e79beeb5-7288-c8fd-8823-feaf8d4e7e77@suse.com>
 <20190913135336.k7g7rem5awttvsmo@Air-de-Roger>
In-Reply-To: <20190913135336.k7g7rem5awttvsmo@Air-de-Roger>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v11.1 3/6] sysctl / libxl: report whether
 IOMMU/HAP page table sharing is supported
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
Cc: Kevin Tian <kevin.tian@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>, WeiLiu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>, David Scott <dave@recoil.org>,
 "Tim \(Xen.org\)" <tim@xen.org>, George Dunlap <George.Dunlap@citrix.com>,
 Julien Grall <julien.grall@arm.com>,
 Christian Lindig <christian.lindig@citrix.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, Ian
 Jackson <Ian.Jackson@citrix.com>, Anthony
 Perard <anthony.perard@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+IEZyb206IFJvZ2VyIFBhdSBNb25uZSA8cm9n
ZXIucGF1QGNpdHJpeC5jb20+Cj4gU2VudDogMTMgU2VwdGVtYmVyIDIwMTkgMTQ6NTQKPiBUbzog
SmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgo+IENjOiBQYXVsIER1cnJhbnQgPFBhdWwu
RHVycmFudEBjaXRyaXguY29tPjsgeGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnOyBTdXJh
dmVlIFN1dGhpa3VscGFuaXQKPiA8c3VyYXZlZS5zdXRoaWt1bHBhbml0QGFtZC5jb20+OyBKdWxp
ZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPjsgQW5kcmV3IENvb3Blcgo+IDxBbmRyZXcu
Q29vcGVyM0BjaXRyaXguY29tPjsgQW50aG9ueSBQZXJhcmQgPGFudGhvbnkucGVyYXJkQGNpdHJp
eC5jb20+OyBDaHJpc3RpYW4gTGluZGlnCj4gPGNocmlzdGlhbi5saW5kaWdAY2l0cml4LmNvbT47
IEdlb3JnZSBEdW5sYXAgPEdlb3JnZS5EdW5sYXBAY2l0cml4LmNvbT47IElhbiBKYWNrc29uCj4g
PElhbi5KYWNrc29uQGNpdHJpeC5jb20+OyBLZXZpbiBUaWFuIDxrZXZpbi50aWFuQGludGVsLmNv
bT47IFN0ZWZhbm8gU3RhYmVsbGluaQo+IDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPjsgS29ucmFk
IFJ6ZXN6dXRlayBXaWxrIDxrb25yYWQud2lsa0BvcmFjbGUuY29tPjsgRGF2aWQgU2NvdHQKPiA8
ZGF2ZUByZWNvaWwub3JnPjsgVGltIChYZW4ub3JnKSA8dGltQHhlbi5vcmc+OyBXZWlMaXUgPHds
QHhlbi5vcmc+Cj4gU3ViamVjdDogUmU6IFtQQVRDSCB2MTEuMSAzLzZdIHN5c2N0bCAvIGxpYnhs
OiByZXBvcnQgd2hldGhlciBJT01NVS9IQVAgcGFnZSB0YWJsZSBzaGFyaW5nIGlzCj4gc3VwcG9y
dGVkCj4gCj4gT24gRnJpLCBTZXAgMTMsIDIwMTkgYXQgMDE6MTA6MThQTSArMDIwMCwgSmFuIEJl
dWxpY2ggd3JvdGU6Cj4gPiAtLS0gYS90b29scy9vY2FtbC9saWJzL3hjL3hlbmN0cmwubWxpCj4g
PiArKysgYi90b29scy9vY2FtbC9saWJzL3hjL3hlbmN0cmwubWxpCj4gPiBAQCAtNTcsNyArNTcs
NiBAQCB0eXBlIGRvbWFpbl9jcmVhdGVfZmxhZyA9Cj4gPiAgICB8IENERl9PT1NfT0ZGCj4gPiAg
ICB8IENERl9YU19ET01BSU4KPiA+ICAgIHwgQ0RGX0lPTU1VCj4gPiAtCj4gCj4gU3RyYXkgZGVs
ZXRpb24/CgpZZXMsIGl0IGlzLiBJdCBnZXRzIGZpeGVkIHVwIGJ5IGEgbGF0ZXIgcGF0Y2ggdGhv
dWdoLgoKPiAKPiA+IC0tLSBhL3hlbi9pbmNsdWRlL3B1YmxpYy9zeXNjdGwuaAo+ID4gKysrIGIv
eGVuL2luY2x1ZGUvcHVibGljL3N5c2N0bC5oCj4gPiBAQCAtOTYsOSArOTYsMTMgQEAgc3RydWN0
IHhlbl9zeXNjdGxfdGJ1Zl9vcCB7Cj4gPiAgLyogVGhlIHBsYXRmb3JtIHN1cHBvcnRzIHNvZnR3
YXJlIHBhZ2luZy4gKi8KPiA+ICAjZGVmaW5lIF9YRU5fU1lTQ1RMX1BIWVNDQVBfc2hhZG93ICAg
ICAgIDQKPiA+ICAjZGVmaW5lIFhFTl9TWVNDVExfUEhZU0NBUF9zaGFkb3cgICAgICAgICgxdTw8
X1hFTl9TWVNDVExfUEhZU0NBUF9zaGFkb3cpCj4gPiArLyogVGhlIHBsYXRmb3JtIHN1cHBvcnRz
IHNoYXJpbmcgb2YgSEFQIHBhZ2UgdGFibGVzIHdpdGggdGhlIElPTU1VLiAqLwo+ID4gKyNkZWZp
bmUgX1hFTl9TWVNDVExfUEhZU0NBUF9pb21tdV9oYXBfcHRfc2hhcmUgNQo+ID4gKyNkZWZpbmUg
WEVOX1NZU0NUTF9QSFlTQ0FQX2lvbW11X2hhcF9wdF9zaGFyZSAgXAo+ID4gKyAgICAoMXUgPDwg
X1hFTl9TWVNDVExfUEhZU0NBUF9pb21tdV9oYXBfcHRfc2hhcmUpCj4gCj4gSSB3b3VsZCBkcm9w
IHRoZSBfaGFwIHBhcnQgb2YgdGhpcywgc2luY2UgSSBkb24ndCB0aGluayBpdCBhZGRzIG11Y2gs
Cj4gaXQncyBub3QgbGlrZSB0aGUgaW9tbXUgcGFnZSB0YWJsZXMgY2FuIGJlIHNoYXJlZCB3aXRo
IGFueXRoaW5nIGVsc2U/Cj4gCj4gSSBkb24ndCBoYXZlIGEgc3Ryb25nIG9waW5pb24sIGFuZCBn
aXZlbiB0aGF0IHRoZSBjb2RlIGFscmVhZHkgbWFrZXMKPiBleHRlbnNpdmUgdXNlIG9mIGlvbW11
X2hhcF9wdF9zaGFyZSBJIHdvdWxkIGJlIGZpbmUgd2l0aCB0aGF0Lgo+IAo+IFdpdGggdGhlIHJl
bW92ZWQgbmV3bGluZSBmaXhlZCAoaWYgYXBwbGljYWJsZSk6Cj4gCj4gUmV2aWV3ZWQtYnk6IFJv
Z2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgoKVGhhbmtzLAoKICBQYXVsCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
