Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A98D8C016B
	for <lists+xen-devel@lfdr.de>; Fri, 27 Sep 2019 10:47:51 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDlsv-0002wL-I0; Fri, 27 Sep 2019 08:45:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=jwcO=XW=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1iDlst-0002va-F2
 for xen-devel@lists.xenproject.org; Fri, 27 Sep 2019 08:45:51 +0000
X-Inumbo-ID: 34f23cf4-e103-11e9-9670-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by localhost (Halon) with ESMTPS
 id 34f23cf4-e103-11e9-9670-12813bfff9fa;
 Fri, 27 Sep 2019 08:45:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1569573951;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=AHh/TahT7xr074yN05zmjHuMGPgWrSYfAYv0UrhBN+o=;
 b=KfwUxAhnrImb192uTEahOdRrSTkZAtsYFfBhrghjIwS8Tgu0KgyKai5X
 X43VE2E4bKlUAPxk0KUgUZXw9ozYnVDPJzKRkAUlo9T82o4s9pOnb1XwJ
 UwNird+OscxIim4MlieASxEuswcUSRx/dpbB1iM2T7OvjmPIFQhgH5nT2 I=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: L4qxvJJ+Q97HUN1s0F92av/iJw6acEQPo4PcLDTzcNHr7xl5Fk0XEQ5gqquOgurMwWVwgAhFHQ
 DXy1Yuf828NLi3syMRbId228Ny2bA0K0ZD92pq4BIpf9sSq6MlgZguSeRSPxSAZ1y/jdqz0quB
 c1AM4m1IHnlMxdqsHFPCB4/SzY5I1OW8gLB2rtQAt07A3pQaFa63OIXGURzuCQzV0+sDKPARh7
 ajAXtExlQOruznVIMqU5JFdOhNXeWZwnEGYdjMUwCezlti6JnHxHy/VgQt6YwHJwJRGh234BUP
 4C0=
X-SBRS: 2.7
X-MesageID: 6164758
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,554,1559534400"; 
   d="scan'208";a="6164758"
Date: Fri, 27 Sep 2019 10:45:42 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Paul Durrant <Paul.Durrant@citrix.com>
Message-ID: <20190927084542.yggl5mxomuntieel@Air-de-Roger>
References: <20190903161428.7159-1-roger.pau@citrix.com>
 <20190903161428.7159-10-roger.pau@citrix.com>
 <8b2ae16a846a4e88bf264a8d5a768a37@AMSPEX02CL03.citrite.net>
 <20190926150718.omalmgpxuxsezbov@Air-de-Roger>
 <75f89532a65446cb92a72b31aed96d5e@AMSPEX02CL03.citrite.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <75f89532a65446cb92a72b31aed96d5e@AMSPEX02CL03.citrite.net>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH v2 09/11] vpci: register as an internal
 ioreq server
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Konrad
 Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>, "Tim \(Xen.org\)" <tim@xen.org>,
 George Dunlap <George.Dunlap@citrix.com>, Julien Grall <julien.grall@arm.com>,
 Jan Beulich <jbeulich@suse.com>, Ian Jackson <Ian.Jackson@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBTZXAgMjcsIDIwMTkgYXQgMTA6Mjk6MjFBTSArMDIwMCwgUGF1bCBEdXJyYW50IHdy
b3RlOgo+ID4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0KPiA+IEZyb206IFJvZ2VyIFBhdSBN
b25uZSA8cm9nZXIucGF1QGNpdHJpeC5jb20+Cj4gPiBTZW50OiAyNiBTZXB0ZW1iZXIgMjAxOSAx
NjowNwo+ID4gVG86IFBhdWwgRHVycmFudCA8UGF1bC5EdXJyYW50QGNpdHJpeC5jb20+Cj4gPiBD
YzogeGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnOyBJYW4gSmFja3NvbiA8SWFuLkphY2tz
b25AY2l0cml4LmNvbT47IFdlaSBMaXUgPHdsQHhlbi5vcmc+OyBBbmRyZXcKPiA+IENvb3BlciA8
QW5kcmV3LkNvb3BlcjNAY2l0cml4LmNvbT47IEdlb3JnZSBEdW5sYXAgPEdlb3JnZS5EdW5sYXBA
Y2l0cml4LmNvbT47IEphbiBCZXVsaWNoCj4gPiA8amJldWxpY2hAc3VzZS5jb20+OyBKdWxpZW4g
R3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPjsgS29ucmFkIFJ6ZXN6dXRlayBXaWxrCj4gPiA8
a29ucmFkLndpbGtAb3JhY2xlLmNvbT47IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlA
a2VybmVsLm9yZz47IFRpbSAoWGVuLm9yZykgPHRpbUB4ZW4ub3JnPgo+ID4gU3ViamVjdDogUmU6
IFtQQVRDSCB2MiAwOS8xMV0gdnBjaTogcmVnaXN0ZXIgYXMgYW4gaW50ZXJuYWwgaW9yZXEgc2Vy
dmVyCj4gPiAKPiA+IE9uIFR1ZSwgU2VwIDEwLCAyMDE5IGF0IDAzOjQ5OjQxUE0gKzAyMDAsIFBh
dWwgRHVycmFudCB3cm90ZToKPiA+ID4gPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+ID4g
PiA+IEZyb206IFJvZ2VyIFBhdSBNb25uZSA8cm9nZXIucGF1QGNpdHJpeC5jb20+Cj4gPiA+ID4g
U2VudDogMDMgU2VwdGVtYmVyIDIwMTkgMTc6MTQKPiA+ID4gPiBUbzogeGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCj4gPiA+ID4gQ2M6IFJvZ2VyIFBhdSBNb25uZSA8cm9nZXIucGF1QGNp
dHJpeC5jb20+OyBJYW4gSmFja3NvbiA8SWFuLkphY2tzb25AY2l0cml4LmNvbT47IFdlaSBMaXUK
PiA+ID4gPiA8d2xAeGVuLm9yZz47IEFuZHJldyBDb29wZXIgPEFuZHJldy5Db29wZXIzQGNpdHJp
eC5jb20+OyBHZW9yZ2UgRHVubGFwIDxHZW9yZ2UuRHVubGFwQGNpdHJpeC5jb20+Owo+ID4gSmFu
Cj4gPiA+ID4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+OyBKdWxpZW4gR3JhbGwgPGp1bGll
bi5ncmFsbEBhcm0uY29tPjsgS29ucmFkIFJ6ZXN6dXRlayBXaWxrCj4gPiA+ID4gPGtvbnJhZC53
aWxrQG9yYWNsZS5jb20+OyBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5v
cmc+OyBUaW0gKFhlbi5vcmcpCj4gPiA8dGltQHhlbi5vcmc+Owo+ID4gPiA+IFBhdWwgRHVycmFu
dCA8UGF1bC5EdXJyYW50QGNpdHJpeC5jb20+Cj4gPiA+ID4gU3ViamVjdDogW1BBVENIIHYyIDA5
LzExXSB2cGNpOiByZWdpc3RlciBhcyBhbiBpbnRlcm5hbCBpb3JlcSBzZXJ2ZXIKPiA+ID4gPiBA
QCAtNDc4LDYgKzQ4MCw2NyBAQCB2b2lkIHZwY2lfd3JpdGUocGNpX3NiZGZfdCBzYmRmLCB1bnNp
Z25lZCBpbnQgcmVnLCB1bnNpZ25lZCBpbnQgc2l6ZSwKPiA+ID4gPiAgICAgIHNwaW5fdW5sb2Nr
KCZwZGV2LT52cGNpLT5sb2NrKTsKPiA+ID4gPiAgfQo+ID4gPiA+Cj4gPiA+ID4gKyNpZmRlZiBf
X1hFTl9fCj4gPiA+ID4gK3N0YXRpYyBpbnQgaW9yZXFfaGFuZGxlcihzdHJ1Y3QgdmNwdSAqdiwg
aW9yZXFfdCAqcmVxLCB2b2lkICpkYXRhKQo+ID4gPiA+ICt7Cj4gPiA+ID4gKyAgICBwY2lfc2Jk
Zl90IHNiZGY7Cj4gPiA+ID4gKwo+ID4gPiA+ICsgICAgaWYgKCByZXEtPnR5cGUgPT0gSU9SRVFf
VFlQRV9JTlZBTElEQVRFICkKPiA+ID4gPiArICAgICAgICAvKgo+ID4gPiA+ICsgICAgICAgICAq
IElnbm9yZSBpbnZhbGlkYXRlIHJlcXVlc3RzLCB0aG9zZSBjYW4gYmUgcmVjZWl2ZWQgZXZlbiB3
aXRob3V0Cj4gPiA+ID4gKyAgICAgICAgICogaGF2aW5nIGFueSBtZW1vcnkgcmFuZ2VzIHJlZ2lz
dGVyZWQsIHNlZSBzZW5kX2ludmFsaWRhdGVfcmVxLgo+ID4gPiA+ICsgICAgICAgICAqLwo+ID4g
PiA+ICsgICAgICAgIHJldHVybiBYODZFTVVMX09LQVk7Cj4gPiA+Cj4gPiA+IEluIGdlbmVyYWws
IEkgd29uZGVyIHdoZXRoZXIgaW50ZXJuYWwgc2VydmVycyB3aWxsIGV2ZXIgbmVlZCB0byBkZWFs
IHdpdGggaW52YWxpZGF0ZT8gVGhlIGNvZGUgb25seQo+ID4gZXhpc3RzIHRvIGdldCBRRU1VIHRv
IGRyb3AgaXRzIG1hcCBjYWNoZSBhZnRlciBhIGRlY3JlYXNlX3Jlc2VydmF0aW9uIHNvIHRoYXQg
dGhlIHBhZ2UgcmVmcyBnZXQKPiA+IGRyb3BwZWQuCj4gPiAKPiA+IEkgdGhpbmsgdGhlIGJlc3Qg
c29sdXRpb24gaGVyZSBpcyB0byByZW5hbWUgaHZtX2Jyb2FkY2FzdF9pb3JlcSB0bwo+ID4gaHZt
X2Jyb2FkY2FzdF9pb3JlcV9leHRlcm5hbCBhbmQgc3dpdGNoIGl0J3MgY2FsbGVycy4gQm90aAo+
ID4gc2VuZF90aW1lb2Zmc2V0X3JlcSBhbmQgc2VuZF9pbnZhbGlkYXRlX3JlcSBzZWVtIG9ubHkg
cmVsZXZhbnQgdG8KPiA+IGV4dGVybmFsIGlvcmVxIHNlcnZlcnMuCj4gCj4gc2VuZF90aW1lb2Zm
c2V0X3JlcSgpIGlzIHJlbGljIHdoaWNoIG91Z2h0IHRvIGJlIHJlcGxhY2VkIHdpdGggYW5vdGhl
ciBtZWNoYW5pc20gSU1PLi4uCj4gCj4gV2hlbiBhbiBIVk0gZ3Vlc3Qgd3JpdGVzIGl0cyBSVEMs
IGEgbmV3ICd0aW1lb2Zmc2V0JyB2YWx1ZSAob2Zmc2V0IG9mIFJUQyBmcm9tIGhvc3QgdGltZSkg
aXMgY2FsY3VsYXRlZCAoYWxzbyBhcHBsaWVkIHRvIHRoZSBQViB3YWxsY2xvY2spIGFuZCBhZHZl
cnRpc2VkIHZpYSB0aGlzIGlvcmVxLiBJbiBYZW5TZXJ2ZXIsIHRoaXMgaXMgcGlja2VkIHVwIGJ5
IFFFTVUsIGZvcndhcmRlZCB2aWEgUU1QIHRvIFhBUEkgYW5kIHRoZW4gd3JpdHRlbiBpbnRvIHRo
ZSBWTSBtZXRhLWRhdGEgKHdoaWNoIHRoYW4gY2F1c2VzIGl0IHRvIGJlIHdyaXR0ZW4gaW50byB4
ZW5zdG9yZSB0b28pLiBBbGwgdGhpcyBpcyBzbyB0aGF0IHRoYXQgZ3Vlc3QncyBSVEMgY2FuIGJl
IHNldCBjb3JyZWN0bHkgd2hlbiBpdCBpcyByZWJvb3RlZC4uLiBUaGVyZSBoYXMgdG8gYmUgYSBi
ZXR0ZXIgd2F5IChlLmcuIGV4dHJhY3RpbmcgUlRDIHZpYSBodm0gY29udGV4dCBhbmQgc2F2aW5n
IGl0IGJlZm9yZSBjbGVhbmluZyB1cCB0aGUgZG9tYWluKS4KPiAKPiBzZW5kX2ludmFsaWRhdGVf
cmVxKCkgaXMgcmVsZXZhbnQgZm9yIGFueSBlbXVsYXRvciBtYWludGFpbmluZyBhIGNhY2hlIG9m
IGd1ZXN0LT5ob3N0IG1lbW9yeSBtYXBwaW5ncyB3aGljaCwgSSBndWVzcywgY291bGQgaW5jbHVk
ZSBpbnRlcm5hbCBlbXVsYXRvcnMgZXZlbiBpZiB0aGlzIGlzIG5vdCB0aGUgY2FzZSBhdCB0aGUg
bW9tZW50LgoKTWF5YmUsIGJ1dCBJIHdvdWxkIGV4cGVjdCBhbiBpbnRlcm5hbCBlbXVsYXRvciB0
byBnZXQgYSByZWZlcmVuY2Ugb24KdGhlIGdmbiBpZiBpdCBkb2VzIG5lZWQgdG8ga2VlcCBpdCBp
biBzb21lIGtpbmQgb2YgY2FjaGUsIG9yIGVsc2UgSQpkb24ndCB0aGluayBjb2RlIGluIHRoZSBo
eXBlcnZpc29yIHNob3VsZCBiZSBrZWVwaW5nIHN1Y2ggcmVmZXJlbmNlcy4KSU1PIEkgd291bGQg
c3RhcnQgYnkgbm90IGZvcndhcmRpbmcgaW52YWxpZGF0ZSByZXF1ZXN0cyB0byBpbnRlcm5hbApl
bXVsYXRvcnMuIFdlIGNhbiBhbHdheXMgY2hhbmdlIHRoaXMgaW4gdGhlIGZ1dHVyZSBpZiB3ZSBj
b21lIHVwIHdpdGgKYSB1c2UtY2FzZXMgdGhhdCBuZWVkcyBpdC4KClRoYW5rcywgUm9nZXIuCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
