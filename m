Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FF8AB11F2
	for <lists+xen-devel@lfdr.de>; Thu, 12 Sep 2019 17:18:09 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i8QpK-0000N8-4o; Thu, 12 Sep 2019 15:16:06 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=GjwE=XH=citrix.com=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1i8QpI-0000N3-Q6
 for xen-devel@lists.xenproject.org; Thu, 12 Sep 2019 15:16:04 +0000
X-Inumbo-ID: 392b13c0-d570-11e9-959c-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 392b13c0-d570-11e9-959c-12813bfff9fa;
 Thu, 12 Sep 2019 15:15:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1568301359;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=x0ib6NLGTxY5+v4S2EE3NqXlHjp57FOukSnc0biB1As=;
 b=F1ha9q++bmmEXpEuqdCPJB2M59Lr0uVTNrKY8KT7ep6JAAalrdmaQ615
 KrZ43LwYR2iKBjClVXDFaojEUo5RE08TTZsoPGpqqMCYHK5r25eCA9xLY
 5urY3reTft0Qe28MQLpB5RVziz6XeP3Ckx0e4O3GtACVrJFsm3F98KMgA 4=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=Paul.Durrant@citrix.com;
 spf=Pass smtp.mailfrom=Paul.Durrant@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 Paul.Durrant@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 Paul.Durrant@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 3+/XlMaJNZuDstqazJtQZzKvQtp77ZoKO5tNHMiw/prNrShaiJy+Cz5ecWtYVgNu3TEKWwdsax
 I4uzmv5YSCdVmE6ZvGpI0WilGgbjNCAJxkTMmtC8X+h0diFOR3VfeWe5a+7AzM8+oPaQn//np0
 BW7omwHnP5uGusFPi/n1xK12Uwsb3gAe/mbTlKCZywkrETlQ+w6w0iJUC39s2qJ70AGxe5LC2G
 8CimoSLUErrqw2+WcwgVUDBfjtBIRWyrzu0Qbf68CbraMl2oooKT0HPj33bgnLMOj50wuP2Wq1
 msA=
X-SBRS: 2.7
X-MesageID: 5489132
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,497,1559534400"; 
   d="scan'208";a="5489132"
From: Paul Durrant <Paul.Durrant@citrix.com>
To: Anthony Perard <anthony.perard@citrix.com>
Thread-Topic: [PATCH v2 3/3] xen: perform XenDevice clean-up in XenBus watch
 handler
Thread-Index: AQHVaWP1a6uo9FDbNkeviSOLMWhOMKcoAmKAgAAj/tA=
Date: Thu, 12 Sep 2019 15:15:30 +0000
Message-ID: <c71d01fbe7ab46d78992fe30fd2e550d@AMSPEX02CL03.citrite.net>
References: <20190912121646.29148-1-paul.durrant@citrix.com>
 <20190912121646.29148-4-paul.durrant@citrix.com>
 <20190912150417.GD1308@perard.uk.xensource.com>
In-Reply-To: <20190912150417.GD1308@perard.uk.xensource.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v2 3/3] xen: perform XenDevice clean-up in
 XenBus watch handler
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+IEZyb206IEFudGhvbnkgUEVSQVJEIDxhbnRo
b255LnBlcmFyZEBjaXRyaXguY29tPgo+IFNlbnQ6IDEyIFNlcHRlbWJlciAyMDE5IDE2OjA0Cj4g
VG86IFBhdWwgRHVycmFudCA8UGF1bC5EdXJyYW50QGNpdHJpeC5jb20+Cj4gQ2M6IHFlbXUtZGV2
ZWxAbm9uZ251Lm9yZzsgeGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnOyBTdGVmYW5vIFN0
YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+Cj4gU3ViamVjdDogUmU6IFtQQVRDSCB2
MiAzLzNdIHhlbjogcGVyZm9ybSBYZW5EZXZpY2UgY2xlYW4tdXAgaW4gWGVuQnVzIHdhdGNoIGhh
bmRsZXIKPiAKPiBPbiBUaHUsIFNlcCAxMiwgMjAxOSBhdCAwMToxNjo0NlBNICswMTAwLCBQYXVs
IER1cnJhbnQgd3JvdGU6Cj4gPiBDbGVhbmluZyB1cCBvZmZpbmUgWGVuRGV2aWNlIG9iamVjdHMg
ZGlyZWN0bHkgaW4KPiAgICAgICAgICAgICAgIF4gb2ZmbGluZQo+IAo+ID4geGVuX2RldmljZV9i
YWNrZW5kX2NoYW5nZWQoKSBpcyBkYW5nZXJvdXMgYXMgeGVuX2RldmljZV91bnJlYWxpemUoKSB3
aWxsCj4gPiBtb2RpZnkgdGhlIHdhdGNoIGxpc3QgdGhhdCBpcyBiZWluZyB3YWxrZWQuIEV2ZW4g
dGhlIFFMSVNUX0ZPUkVBQ0hfU0FGRSgpCj4gPiB1c2VkIGluIG5vdGlmaWVyX2xpc3Rfbm90aWZ5
KCkgaXMgaW5zdWZmaWNpZW50IGFzICp0d28qIG5vdGlmaWVycyAoZm9yCj4gPiB0aGUgZnJvbnRl
bmQgYW5kIGJhY2tlbmQgd2F0Y2hlcykgYXJlIHJlbW92ZWQsIHRodXMgcG90ZW50aWFsbHkgcmVu
ZGVyaW5nCj4gPiB0aGUgJ25leHQnIHBvaW50ZXIgdW5zYWZlLgo+ID4KPiA+IFRoZSBzb2x1dGlv
biBpcyB0byB1c2UgdGhlIFhlbkJ1cyBiYWNrZW5kX3dhdGNoIGhhbmRsZXIgdG8gZG8gdGhlIGNs
ZWFuLXVwCj4gPiBpbnN0ZWFkLCBhcyBpdCBpcyBpbnZva2VkIHdoaWxzdCB3YWxraW5nIGEgc2Vw
YXJhdGUgd2F0Y2ggbGlzdC4KPiA+Cj4gPiBUaGlzIHBhdGNoIHRoZXJlZm9yZSBhZGRzIGEgbmV3
ICdvZmZsaW5lX2RldmljZXMnIGxpc3QgdG8gWGVuQnVzLCB0byB3aGljaAo+ID4gb2ZmbGluZSBk
ZXZpY2VzIGFyZSBhZGRlZCBieSB4ZW5fZGV2aWNlX2JhY2tlbmRfY2hhbmdlZCgpLiBUaGUgWGVu
QnVzCj4gPiBiYWNrZW5kX3dhdGNoIHJlZ2lzdHJhdGlvbiBpcyBhbHNvIGNoYW5nZWQgdG8gbm90
IG9ubHkgaW52b2tlCj4gPiB4ZW5fYnVzX2VudW1lcmF0ZSgpIGJ1dCBhbHNvIGEgbmV3IHhlbl9i
dXNfY2xlYW51cCgpIGZ1bmN0aW9uLCB3aGljaCB3aWxsCj4gPiB3YWxrICdvZmZsaW5lX2Rldmlj
ZXMnIGFuZCBwZXJmb3JtIHRoZSBuZWNlc3NhcnkgYWN0aW9ucy4KPiA+IEZvciBzYWZldHkgYSBh
biBleHRyYSAnb25saW5lJyBjaGVjayBpcyBhbHNvIGFkZGVkIHRvCj4gICAgICAgICAgICAgIF4g
b25lICdhJyB0b28gbWFueT8KPiAKPiA+IHhlbl9idXNfdHlwZV9lbnVtZXJhdGUoKSB0byBtYWtl
IHN1cmUgdGhhdCBubyBhdHRlbXB0IGlzIG1hZGUgdG8gY3JlYXRlIGEKPiA+IG5ldyBYZW5EZXZp
Y2Ugb2JqZWN0IGZvciBhIGJhY2tlbmQgdGhhdCBpcyBvZmZsaW5lLgo+ID4KPiA+IE5PVEU6IFRo
aXMgcGF0Y2ggYWxzbyBpbmNsdWRlIHNvbWUgY29zbWV0aWMgY2hhbmdlczoKPiA+ICAgICAgIC0g
c3Vic3RpdHV0ZSB0aGUgbG9jYWwgdmFyaWFibGUgbmFtZSAnYmFja2VuZF9zdGF0ZScKPiA+ICAg
ICAgICAgaW4geGVuX2J1c190eXBlX2VudW1lcmF0ZSgpIHdpdGggJ3N0YXRlJywgc2luY2UgdGhl
cmUKPiA+ICAgICAgICAgaXMgbm8gYW1iaWd1aXR5IHdpdGggYW55IG90aGVyIHN0YXRlIGluIHRo
YXQgY29udGV4dC4KPiA+ICAgICAgIC0gY2hhbmdlIHhlbl9kZXZpY2Vfc3RhdGVfaXNfYWN0aXZl
KCkgdG8KPiA+ICAgICAgICAgeGVuX2RldmljZV9mcm9udGVuZF9pc19hY3RpdmUoKSAoYW5kIHBh
c3MgYSBYZW5EZXZpY2UgZGlyZWN0bHkpCj4gPiAgICAgICAgIHNpbmNlIHRoZSBzdGF0ZSB0ZXN0
cyBjb250YWluZWQgdGhlcmVpbiBvbmx5IGFwcGx5IHRvIGEgZnJvbnRlbmQuCj4gPiAgICAgICAt
IHVzZSAnc3RhdGUnIHJhdGhlciB0aGVuICd4ZW5kZXYtPmJhY2tlbmRfc3RhdGUnIGluCj4gPiAg
ICAgICAgIHhlbl9kZXZpY2VfYmFja2VuZF9jaGFuZ2VkKCkgdG8gc2hvcnRlbiB0aGUgY29kZS4K
PiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBQYXVsIER1cnJhbnQgPHBhdWwuZHVycmFudEBjaXRyaXgu
Y29tPgo+ID4gLS0tCj4gPgo+ID4gdjI6Cj4gPiAgLSBNYWtlIHN1cmUgd2UgZG9uJ3QgdHJ5IHRv
IGFkZCBhIFhlbkRldmljZSB0byAnb2ZmbGluZV9kZXZpY2VzJyBtb3JlIHRoYW4KPiA+ICAgIG9u
Y2UKPiA+IC0tLQo+ID4KPiA+ICAgICAgLyoKPiA+ICAgICAgICogSWYgYSBiYWNrZW5kIGlzIHN0
aWxsICdvbmxpbmUnIHRoZW4gd2Ugc2hvdWxkIGxlYXZlIGl0IGFsb25lIGJ1dCwKPiA+IC0gICAg
ICogaWYgYSBiYWNrZW5kIGlzIG5vdCAnb25saW5lJywgdGhlbiB0aGUgZGV2aWNlIHNob3VsZCBi
ZSBkZXN0cm95ZWQKPiA+IC0gICAgICogb25jZSB0aGUgc3RhdGUgaXMgQ2xvc2VkLgo+ID4gKyAg
ICAgKiBpZiBhIGJhY2tlbmQgaXMgbm90ICdvbmxpbmUnLCB0aGVuIHRoZSBkZXZpY2UgaXMgYSBj
YW5kaWRhdGUKPiA+ICsgICAgICogZm9yIGRlc3RydWN0aW9uLiBIZW5jZSBhZGQgaXQgdG8gdGhl
ICdvZmZsaW5lJyBsaXN0IHRvIGJlIGNsZWFuZWQKPiA+ICsgICAgICogYnkgeGVuX2J1c19jbGVh
bnVwKCkuCj4gPiAgICAgICAqLwo+ID4gLSAgICBpZiAoIXhlbmRldi0+YmFja2VuZF9vbmxpbmUg
JiYKPiA+IC0gICAgICAgICh4ZW5kZXYtPmJhY2tlbmRfc3RhdGUgPT0gWGVuYnVzU3RhdGVDbG9z
ZWQgfHwKPiA+IC0gICAgICAgICB4ZW5kZXYtPmJhY2tlbmRfc3RhdGUgPT0gWGVuYnVzU3RhdGVJ
bml0aWFsaXNpbmcgfHwKPiA+IC0gICAgICAgICB4ZW5kZXYtPmJhY2tlbmRfc3RhdGUgPT0gWGVu
YnVzU3RhdGVJbml0V2FpdCB8fAo+ID4gLSAgICAgICAgIHhlbmRldi0+YmFja2VuZF9zdGF0ZSA9
PSBYZW5idXNTdGF0ZVVua25vd24pKSB7Cj4gPiAtICAgICAgICBFcnJvciAqbG9jYWxfZXJyID0g
TlVMTDsKPiA+ICsgICAgaWYgKCFvbmxpbmUgJiYKPiA+ICsgICAgICAgIChzdGF0ZSA9PSBYZW5i
dXNTdGF0ZUNsb3NlZCB8fCAgc3RhdGUgPT0gWGVuYnVzU3RhdGVJbml0aWFsaXNpbmcgfHwKPiA+
ICsgICAgICAgICBzdGF0ZSA9PSBYZW5idXNTdGF0ZUluaXRXYWl0IHx8IHN0YXRlID09IFhlbmJ1
c1N0YXRlVW5rbm93bikgJiYKPiA+ICsgICAgICAgICFRTElTVF9ORVhUKHhlbmRldiwgbGlzdCkp
IHsKPiAKPiBDb3VsZCB5b3UgYWRkIGEgbm90ZSBhYm91dCB0aGlzIFFMSVNUX05FWFQ/IEkgZG9u
J3QgdGhpbmsgaXQncyBnb2luZyB0bwo+IGJlIG9idmlvdXMgZW5vdWdoIHdoeSB3ZSBjaGVjayB0
aGF0IHRoZXJlIGFyZSBubyBuZXh0IGl0ZW0uIEkgbWlnaHQgb25seQo+IHVuZGVyc3RhbmQgaXQg
anVzdCBiZWNhdXNlIG9mIHlvdXIgcmVwbHkgdG8gdGhlIHYxIG9mIHRoZSBwYXRjaC4KPiAoV2Vs
bCB0aGUgY2hhbmdlbG9nIG9mIHRoZSBwYXRjaCBhbHNvIHBvaW50IG91dCB3aGF0IGl0J3MgZm9y
LikKPiAKClN1cmUsIGl0J3Mgd29ydGggYSBjb21tZW50LgoKPiA+ICsgICAgICAgIFhlbkJ1cyAq
eGVuYnVzID0gWEVOX0JVUyhxZGV2X2dldF9wYXJlbnRfYnVzKERFVklDRSh4ZW5kZXYpKSk7Cj4g
Pgo+ID4gLSAgICAgICAgaWYgKCF4ZW5fYmFja2VuZF90cnlfZGV2aWNlX2Rlc3Ryb3koeGVuZGV2
LCAmbG9jYWxfZXJyKSkgewo+ID4gLSAgICAgICAgICAgIG9iamVjdF91bnBhcmVudChPQkpFQ1Qo
eGVuZGV2KSk7Cj4gPiAtICAgICAgICB9Cj4gPiArICAgICAgICBRTElTVF9JTlNFUlRfSEVBRCgm
eGVuYnVzLT5vZmZsaW5lX2RldmljZXMsIHhlbmRldiwgbGlzdCk7Cj4gPgo+ID4gLSAgICAgICAg
aWYgKGxvY2FsX2Vycikgewo+ID4gLSAgICAgICAgICAgIGVycm9yX3JlcG9ydF9lcnIobG9jYWxf
ZXJyKTsKPiA+IC0gICAgICAgIH0KPiA+ICsgICAgICAgIC8qCj4gPiArICAgICAgICAgKiBSZS13
cml0ZSB0aGUgc3RhdGUgdG8gY2F1c2UgYSBYZW5CdXMgYmFja2VuZF93YXRjaCBub3RpZmljYXRp
b24sCj4gPiArICAgICAgICAgKiByZXN1bHRpbmcgaW4gYSBjYWxsIHRvIHhlbl9idXNfY2xlYW51
cCgpLgo+ID4gKyAgICAgICAgICovCj4gPiArICAgICAgICB4ZW5fZGV2aWNlX2JhY2tlbmRfcHJp
bnRmKHhlbmRldiwgInN0YXRlIiwgIiV1Iiwgc3RhdGUpOwo+IAo+IEl0IGtpbmQgb2YgZmVlbHMg
d3JvbmcgdG8gcmVseSBvbiB4ZW5zdG9yZSB0byBub3RpZnkgUUVNVSdzIHhlbmJ1cwo+IGRyaXZl
ciB0aGF0IGEgZGV2aWNlIG5lZWRzIGNsZWFudXAuIEJ1dCB0aGF0IGRvZXMgdGhlIGpvYi4KPiAK
CkkgaGFkIG9yaWdpbmFsbHkgY29uc2lkZXJlZCBzZXR0aW5nIHVwIGFuIGV2ZW50IG5vdGlmaWVy
IGJ1dCB0aGF0IHNlZW1lZCBsaWtlIG1vcmUgZmRzIHRoYW4gd2VyZSBzdHJpY3RseSBuZWNlc3Nh
cnkgOy0pCgo+IFdpdGggYSBub3RlIGFib3V0IHRoZSB1c2Ugb2YgUUxJU1RfTkVYVCBhbmQgdGhl
IGZldyB0eXBvIGZpeGVkLCB0aGUKPiBwYXRjaCB3aWxsIGJlIGdvb2QgdG8gZ28uCj4gCgpDb29s
LiBJJ2xsIHRpZHkgdXAgYW5kIHNlbmQgYSB2My4KCiAgUGF1bAoKPiBUaGFua3MsCj4gCj4gLS0K
PiBBbnRob255IFBFUkFSRAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
