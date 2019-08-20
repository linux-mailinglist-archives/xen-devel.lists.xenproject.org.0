Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ADA3E95C90
	for <lists+xen-devel@lfdr.de>; Tue, 20 Aug 2019 12:49:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i01dy-0005Ms-FY; Tue, 20 Aug 2019 10:45:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=MO/K=WQ=citrix.com=igor.druzhinin@srs-us1.protection.inumbo.net>)
 id 1i01dx-0005Mn-6C
 for xen-devel@lists.xenproject.org; Tue, 20 Aug 2019 10:45:37 +0000
X-Inumbo-ID: a42d8374-c337-11e9-b90c-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a42d8374-c337-11e9-b90c-bc764e2007e4;
 Tue, 20 Aug 2019 10:45:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1566297936;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=+T2J6o/vqBMLiS3ZawS4BmSq52pGoqXHblUSv2g83Ww=;
 b=HcljaNAykrsjBNgR3heHGgx8c490urYUEl9rL6jMZaUYkyf/9VxQB6W5
 CyebOPGjOaizbWmi1do510L6bjRgG9dBx++Z8JUPX/4uWZBXIhg7BWrzM
 34z1qPHOIkZ45xal7bHp04zDT/s5kl4KhHkewAv/I+P7/HDTom8jIFut4 U=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=igor.druzhinin@citrix.com;
 spf=Pass smtp.mailfrom=igor.druzhinin@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 igor.druzhinin@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="igor.druzhinin@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 igor.druzhinin@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="igor.druzhinin@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: voll20o0NevNNM80z6mKyFgEww8c/RfFRX6zbrqIrxU4UZAPkfMML6TB7q8mMmTlI9yqmraagA
 qGqxxArhbTMY24noVwxtO10LTT2RL2fKeRjpfedrX5Lsr+k2EHZikXCmO+o3BTK3X0HsP26W7F
 yNzhmPEZ21pxJy0U4CCIr/HftL0782GhahuF22+Ysc6cLBMZGcR04ke2kkbDhKd4+oBNb6Aqg8
 v8+40pcc+71A0vu/6aY7DcOBin6n80/8vccc1UscPy6B7TGxsC9A3jNirhpaVdvbQkMRwUwabs
 bOY=
X-SBRS: 2.7
X-MesageID: 4676819
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,408,1559534400"; 
   d="scan'208";a="4676819"
To: Christian Lindig <christian.lindig@citrix.com>
References: <1566240335-6614-1-git-send-email-igor.druzhinin@citrix.com>
 <7DFC36D5-7354-4D82-87A6-364FEDEAFAFC@citrix.com>
From: Igor Druzhinin <igor.druzhinin@citrix.com>
Message-ID: <d61c8e5e-eb9b-755f-0917-b4d009c64d74@citrix.com>
Date: Tue, 20 Aug 2019 11:45:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <7DFC36D5-7354-4D82-87A6-364FEDEAFAFC@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] tools/oxenstored: port XS_INTRODUCE evtchn
 rebind function from cxenstored
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Ian Jackson <Ian.Jackson@citrix.com>, "wl@xen.org" <wl@xen.org>,
 David Scott <dave@recoil.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjAvMDgvMjAxOSAwOToyMSwgQ2hyaXN0aWFuIExpbmRpZyB3cm90ZToKPj4gKwkJCWlmIChE
b21haW4uZ2V0X21mbiBlZG9tKSA9IG1mbiAmJiAoQ29ubmVjdGlvbnMuZmluZF9kb21haW4gY29u
cyBkb21pZCkgIT0gY29uIHRoZW4gYmVnaW4KPiAKPiBUaGlzIHNob3VsZCB1c2UgPD4gaW5zdGVh
ZCBvZiAhPSBiZWNhdXNlICE9IGlzIHBvaW50ZXIgaW5lcXVhbGl0eSBpbiBPQ2FtbC4gVGhlIHBh
cmVudGhlc2VzIGFyZSBub3Qgc3RyaWN0bHkgbmVjZXNzYXJ5IGJlY2F1c2UgZnVuY3Rpb24gYXBw
bGljYXRpb24gaGFzIHByZWNlZGVuY2UuIFNvOgo+IAo+IAlpZiBEb21haW4uZ2V0X21mbiBlZG9t
ID0gbWZuICYmIENvbm5lY3Rpb25zLmZpbmRfZG9tYWluIGNvbnMgZG9taWQgPD4gY29uIHRoZW4g
YmVnaW4KPiAKCkJ1dCBJIGFjdHVhbGx5IHdhbnQgdG8gY29tcGFyZSBwb2ludGVycyBoZXJlIC0g
dGhlIGlkZWEgaXMgdGhhdCB0aGUKY29ubmVjdGlvbiBvYmplY3QgaW4gdGhlIGhhc2h0YWJsZSBp
bmRleGVkIGJ5IGRvbWlkIGlzIG5vdCB0aGUgc2FtZSBhcwpjb25uZWN0aW9uIHRoYXQgd2UgZ290
IFhTX0lOVFJPRFVDRSBtZXNzYWdlIGZyb20uIChzZWUKdG9vbHMveGVuc3RvcmUveGVuc3Ryb3Jl
ZF9kb21haW4uYykKCklnb3IKCj4+IE9uIDE5IEF1ZyAyMDE5LCBhdCAxOTo0NSwgSWdvciBEcnV6
aGluaW4gPGlnb3IuZHJ1emhpbmluQGNpdHJpeC5jb20+IHdyb3RlOgo+Pgo+PiBDIHZlcnNpb24g
b2YgeGVuc3RvcmVkIGhhZCB0aGlzIGFiaWxpdHkgc2luY2UgNjFhYWVkMGQ1ICgiQWxsb3cKPj4g
WFNfSU5UUk9EVUNFIHRvIGJlIHVzZWQgZm9yIHJlYmluZGluZyB0aGUgeGVuc3RvcmUgZXZ0Y2hu
LiIpIGZyb20gMjAwNy4KPj4gQ29weSBpdCBhcyBpcyB0byBPY2FtbCB2ZXJzaW9uLgo+Pgo+PiBT
aWduZWQtb2ZmLWJ5OiBJZ29yIERydXpoaW5pbiA8aWdvci5kcnV6aGluaW5AY2l0cml4LmNvbT4K
Pj4gLS0tCj4+IHRvb2xzL29jYW1sL3hlbnN0b3JlZC9kb21haW4ubWwgIHwgNiArKysrKy0KPj4g
dG9vbHMvb2NhbWwveGVuc3RvcmVkL3Byb2Nlc3MubWwgfCA4ICsrKysrKystCj4+IDIgZmlsZXMg
Y2hhbmdlZCwgMTIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPj4KPj4gZGlmZiAtLWdp
dCBhL3Rvb2xzL29jYW1sL3hlbnN0b3JlZC9kb21haW4ubWwgYi90b29scy9vY2FtbC94ZW5zdG9y
ZWQvZG9tYWluLm1sCj4+IGluZGV4IGIwYTAxYjAuLmFlYjE4NWYgMTAwNjQ0Cj4+IC0tLSBhL3Rv
b2xzL29jYW1sL3hlbnN0b3JlZC9kb21haW4ubWwKPj4gKysrIGIvdG9vbHMvb2NhbWwveGVuc3Rv
cmVkL2RvbWFpbi5tbAo+PiBAQCAtMjMsOSArMjMsOSBAQCB0eXBlIHQgPQo+PiB7Cj4+IAlpZDog
WGVuY3RybC5kb21pZDsKPj4gCW1mbjogbmF0aXZlaW50Owo+PiAtCXJlbW90ZV9wb3J0OiBpbnQ7
Cj4+IAlpbnRlcmZhY2U6IFhlbm1tYXAubW1hcF9pbnRlcmZhY2U7Cj4+IAlldmVudGNobjogRXZl
bnQudDsKPj4gKwltdXRhYmxlIHJlbW90ZV9wb3J0OiBpbnQ7Cj4+IAltdXRhYmxlIHBvcnQ6IFhl
bmV2ZW50Y2huLnQgb3B0aW9uOwo+PiAJbXV0YWJsZSBiYWRfY2xpZW50OiBib29sOwo+PiAJbXV0
YWJsZSBpb19jcmVkaXQ6IGludDsgKCogdGhlIHJvdW5kcyBvZiByaW5nIHByb2Nlc3MgbGVmdCB0
byBkbywgZGVmYXVsdCBpcyAwLAo+PiBAQCAtNzEsNiArNzEsMTAgQEAgbGV0IG5vdGlmeSBkb20g
PSBtYXRjaCBkb20ucG9ydCB3aXRoCj4+IAlFdmVudC5ub3RpZnkgZG9tLmV2ZW50Y2huIHBvcnQK
Pj4KPj4gbGV0IGJpbmRfaW50ZXJkb21haW4gZG9tID0KPj4gKwliZWdpbiBtYXRjaCBkb20ucG9y
dCB3aXRoCj4+ICsJfCBOb25lIC0+ICgpCj4+ICsJfCBTb21lIHBvcnQgLT4gRXZlbnQudW5iaW5k
IGRvbS5ldmVudGNobiBwb3J0Cj4+ICsJZW5kOwo+PiAJZG9tLnBvcnQgPC0gU29tZSAoRXZlbnQu
YmluZF9pbnRlcmRvbWFpbiBkb20uZXZlbnRjaG4gZG9tLmlkIGRvbS5yZW1vdGVfcG9ydCk7Cj4+
IAlkZWJ1ZyAiYm91bmQgZG9tYWluICVkIHJlbW90ZSBwb3J0ICVkIHRvIGxvY2FsIHBvcnQgJXMi
IGRvbS5pZCBkb20ucmVtb3RlX3BvcnQgKHN0cmluZ19vZl9wb3J0IGRvbS5wb3J0KQo+Pgo+PiBk
aWZmIC0tZ2l0IGEvdG9vbHMvb2NhbWwveGVuc3RvcmVkL3Byb2Nlc3MubWwgYi90b29scy9vY2Ft
bC94ZW5zdG9yZWQvcHJvY2Vzcy5tbAo+PiBpbmRleCA4YTdlNTM4Li5mZjVjOTQ4IDEwMDY0NAo+
PiAtLS0gYS90b29scy9vY2FtbC94ZW5zdG9yZWQvcHJvY2Vzcy5tbAo+PiArKysgYi90b29scy9v
Y2FtbC94ZW5zdG9yZWQvcHJvY2Vzcy5tbAo+PiBAQCAtNDA4LDcgKzQwOCwxMyBAQCBsZXQgZG9f
aW50cm9kdWNlIGNvbiBfdCBkb21haW5zIGNvbnMgZGF0YSA9Cj4+IAkJaW4KPj4gCWxldCBkb20g
PQo+PiAJCWlmIERvbWFpbnMuZXhpc3QgZG9tYWlucyBkb21pZCB0aGVuCj4+IC0JCQlEb21haW5z
LmZpbmQgZG9tYWlucyBkb21pZAo+PiArCQkJbGV0IGVkb20gPSBEb21haW5zLmZpbmQgZG9tYWlu
cyBkb21pZCBpbgo+PiArCQkJaWYgKERvbWFpbi5nZXRfbWZuIGVkb20pID0gbWZuICYmIChDb25u
ZWN0aW9ucy5maW5kX2RvbWFpbiBjb25zIGRvbWlkKSAhPSBjb24gdGhlbiBiZWdpbgo+PiArCQkJ
CSgqIFVzZSBYU19JTlRST0RVQ0UgZm9yIHJlY3JlYXRpbmcgdGhlIHhlbmJ1cyBldmVudC1jaGFu
bmVsLiAqKQo+PiArCQkJCWVkb20ucmVtb3RlX3BvcnQgPC0gcG9ydDsKPj4gKwkJCQlEb21haW4u
YmluZF9pbnRlcmRvbWFpbiBlZG9tOwo+PiArCQkJZW5kOwo+PiArCQkJZWRvbQo+PiAJCWVsc2Ug
dHJ5Cj4+IAkJCWxldCBuZG9tID0gRG9tYWlucy5jcmVhdGUgZG9tYWlucyBkb21pZCBtZm4gcG9y
dCBpbgo+PiAJCQlDb25uZWN0aW9ucy5hZGRfZG9tYWluIGNvbnMgbmRvbTsKPj4gLS0gCj4+IDIu
Ny40Cj4+Cj4gCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
