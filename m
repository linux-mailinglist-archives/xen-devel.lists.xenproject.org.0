Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 371A010D5E4
	for <lists+xen-devel@lfdr.de>; Fri, 29 Nov 2019 13:54:50 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iafkh-00008n-JZ; Fri, 29 Nov 2019 12:52:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=3pi/=ZV=amazon.com=prvs=22965b742=pdurrant@srs-us1.protection.inumbo.net>)
 id 1iafkg-00008i-KR
 for xen-devel@lists.xenproject.org; Fri, 29 Nov 2019 12:52:02 +0000
X-Inumbo-ID: 097f2d0e-12a7-11ea-a55d-bc764e2007e4
Received: from smtp-fw-9101.amazon.com (unknown [207.171.184.25])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 097f2d0e-12a7-11ea-a55d-bc764e2007e4;
 Fri, 29 Nov 2019 12:52:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1575031922; x=1606567922;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=yyRAFCuKee3fVm9zkPCTsalsj6fgiO7XYF7Ec/6mBnc=;
 b=JF8tcnJjlNDLqfcFWG5zguR7rasotPxEg9wiupu6JxLBERekGQwEDYJa
 TvXOHafU179RHscAtDjrwnmsDp4NxGU16HT8RuQb+PwKMYz4hAQMDIC0w
 z0kDSnnk9z+MNCLN8eOij9hXX+cF+xFzf7mBTVpHL3hWspy4M3bEQb2tn U=;
IronPort-SDR: 6Cgf6FdlK9TjyCTQ8KsQMsaQVvOrep7tyAzOIyfp7sbiTagquPY1nvYMD1ywD9TdfWDjCw8XD9
 LneYVZ4tWUMg==
X-IronPort-AV: E=Sophos;i="5.69,257,1571702400"; 
   d="scan'208";a="2160513"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-2a-1c1b5cdd.us-west-2.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-9101.sea19.amazon.com with ESMTP;
 29 Nov 2019 12:51:50 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
 by email-inbound-relay-2a-1c1b5cdd.us-west-2.amazon.com (Postfix) with ESMTPS
 id 373CAA1E51; Fri, 29 Nov 2019 12:51:49 +0000 (UTC)
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.82) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Fri, 29 Nov 2019 12:51:48 +0000
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D32EUC003.ant.amazon.com (10.43.164.24) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Fri, 29 Nov 2019 12:51:47 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1367.000;
 Fri, 29 Nov 2019 12:51:47 +0000
From: "Durrant, Paul" <pdurrant@amazon.com>
To: Anthony PERARD <anthony.perard@citrix.com>
Thread-Topic: [PATCH-for-4.13 v5] Rationalize max_grant_frames and
 max_maptrack_frames handling
Thread-Index: AQHVpgw4W1UbyWJxu02lwfLbqnwkDKeiGdeAgAAAcrA=
Date: Fri, 29 Nov 2019 12:51:47 +0000
Message-ID: <b6aa51e207aa44eca1acb027e5765d24@EX13D32EUC003.ant.amazon.com>
References: <20191128165224.2959-1-pdurrant@amazon.com>
 <20191129124607.GD1155@perard.uk.xensource.com>
In-Reply-To: <20191129124607.GD1155@perard.uk.xensource.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.165.244]
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH-for-4.13 v5] Rationalize max_grant_frames
 and max_maptrack_frames handling
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George
 Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, George
 Dunlap <george.dunlap@citrix.com>,
 =?iso-8859-1?Q?Marek_Marczykowski-G=F3recki?=
 <marmarek@invisiblethingslab.com>, Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+IEZyb206IEFudGhvbnkgUEVSQVJEIDxhbnRo
b255LnBlcmFyZEBjaXRyaXguY29tPgo+IFNlbnQ6IDI5IE5vdmVtYmVyIDIwMTkgMTI6NDYKPiBU
bzogRHVycmFudCwgUGF1bCA8cGR1cnJhbnRAYW1hem9uLmNvbT4KPiBDYzogeGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnOyBHZW9yZ2UgRHVubGFwCj4gPGdlb3JnZS5kdW5sYXBAY2l0cml4
LmNvbT47IElhbiBKYWNrc29uIDxpYW4uamFja3NvbkBldS5jaXRyaXguY29tPjsgV2VpCj4gTGl1
IDx3bEB4ZW4ub3JnPjsgQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT47
IEdlb3JnZSBEdW5sYXAKPiA8R2VvcmdlLkR1bmxhcEBldS5jaXRyaXguY29tPjsgSmFuIEJldWxp
Y2ggPGpiZXVsaWNoQHN1c2UuY29tPjsgSnVsaWVuCj4gR3JhbGwgPGp1bGllbkB4ZW4ub3JnPjsg
S29ucmFkIFJ6ZXN6dXRlayBXaWxrIDxrb25yYWQud2lsa0BvcmFjbGUuY29tPjsKPiBTdGVmYW5v
IFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+OyBNYXJlayBNYXJjenlrb3dza2kt
R8OzcmVja2kKPiA8bWFybWFyZWtAaW52aXNpYmxldGhpbmdzbGFiLmNvbT47IFZvbG9keW15ciBC
YWJjaHVrCj4gPFZvbG9keW15cl9CYWJjaHVrQGVwYW0uY29tPjsgUm9nZXIgUGF1IE1vbm7DqSA8
cm9nZXIucGF1QGNpdHJpeC5jb20+Cj4gU3ViamVjdDogUmU6IFtQQVRDSC1mb3ItNC4xMyB2NV0g
UmF0aW9uYWxpemUgbWF4X2dyYW50X2ZyYW1lcyBhbmQKPiBtYXhfbWFwdHJhY2tfZnJhbWVzIGhh
bmRsaW5nCj4gCj4gT24gVGh1LCBOb3YgMjgsIDIwMTkgYXQgMDQ6NTI6MjRQTSArMDAwMCwgUGF1
bCBEdXJyYW50IHdyb3RlOgo+ID4gZGlmZiAtLWdpdCBhL3Rvb2xzL2xpYnhsL2xpYnhsLmggYi90
b29scy9saWJ4bC9saWJ4bC5oCj4gPiBpbmRleCA0OWI1NmZhMWEzLi5hMmE1ZDMyMWM1IDEwMDY0
NAo+ID4gLS0tIGEvdG9vbHMvbGlieGwvbGlieGwuaAo+ID4gKysrIGIvdG9vbHMvbGlieGwvbGli
eGwuaAo+ID4gQEAgLTM2NCw4ICszNjQsOCBAQAo+ID4gICAqLwo+ID4gICNkZWZpbmUgTElCWExf
SEFWRV9CVUlMRElORk9fR1JBTlRfTElNSVRTIDEKPiA+Cj4gPiAtI2RlZmluZSBMSUJYTF9NQVhf
R1JBTlRfRlJBTUVTX0RFRkFVTFQgMzIKPiA+IC0jZGVmaW5lIExJQlhMX01BWF9NQVBUUkFDS19G
UkFNRVNfREVGQVVMVCAxMDI0Cj4gPiArI2RlZmluZSBMSUJYTF9NQVhfR1JBTlRfRlJBTUVTX0RF
RkFVTFQgLTEKPiA+ICsjZGVmaW5lIExJQlhMX01BWF9NQVBUUkFDS19GUkFNRVNfREVGQVVMVCAt
MQo+ID4KPiA+ICAvKgo+ID4gICAqIExJQlhMX0hBVkVfQlVJTERJTkZPXyogaW5kaWNhdGVzIHRo
YXQgbGlieGxfZG9tYWluX2J1aWxkX2luZm8gaGFzCj4gPiBkaWZmIC0tZ2l0IGEvdG9vbHMvbGli
eGwvbGlieGxfdHlwZXMuaWRsIGIvdG9vbHMvbGlieGwvbGlieGxfdHlwZXMuaWRsCj4gPiBpbmRl
eCAwNTQ2ZDc4NjVhLi42M2UyOWJiMmZiIDEwMDY0NAo+ID4gLS0tIGEvdG9vbHMvbGlieGwvbGli
eGxfdHlwZXMuaWRsCj4gPiArKysgYi90b29scy9saWJ4bC9saWJ4bF90eXBlcy5pZGwKPiA+IEBA
IC01MTEsOCArNTExLDggQEAgbGlieGxfZG9tYWluX2J1aWxkX2luZm8gPQo+IFN0cnVjdCgiZG9t
YWluX2J1aWxkX2luZm8iLFsKPiA+Cj4gPiAgICAgICgidm51bWFfbm9kZXMiLCBBcnJheShsaWJ4
bF92bm9kZV9pbmZvLCAibnVtX3ZudW1hX25vZGVzIikpLAo+ID4KPiA+IC0gICAgKCJtYXhfZ3Jh
bnRfZnJhbWVzIiwgICAgdWludDMyLCB7J2luaXRfdmFsJzoKPiAnTElCWExfTUFYX0dSQU5UX0ZS
QU1FU19ERUZBVUxUJ30pLAo+ID4gLSAgICAoIm1heF9tYXB0cmFja19mcmFtZXMiLCB1aW50MzIs
IHsnaW5pdF92YWwnOgo+ICdMSUJYTF9NQVhfTUFQVFJBQ0tfRlJBTUVTX0RFRkFVTFQnfSksCj4g
PiArICAgICgibWF4X2dyYW50X2ZyYW1lcyIsICAgIGludGVnZXIsIHsnaW5pdF92YWwnOgo+ICdM
SUJYTF9NQVhfR1JBTlRfRlJBTUVTX0RFRkFVTFQnfSksCj4gPiArICAgICgibWF4X21hcHRyYWNr
X2ZyYW1lcyIsIGludGVnZXIsIHsnaW5pdF92YWwnOgo+ICdMSUJYTF9NQVhfTUFQVFJBQ0tfRlJB
TUVTX0RFRkFVTFQnfSksCj4gCj4gVGhhdCdzIGEgY2hhbmdlIGluIHRoZSBsaWJ4bCBBUEksIGNv
dWxkIHlvdSBhZGQgYSBMSUJYX0hBVkVfKiBtYWNybz8KPiAKCklzIGl0IHJlYWxseSwgaW4gcHJh
Y3RpY2U/Cgo+ID4KPiA+ICAgICAgKCJkZXZpY2VfbW9kZWxfdmVyc2lvbiIsIGxpYnhsX2Rldmlj
ZV9tb2RlbF92ZXJzaW9uKSwKPiA+ICAgICAgKCJkZXZpY2VfbW9kZWxfc3R1YmRvbWFpbiIsIGxp
YnhsX2RlZmJvb2wpLAo+ID4gZGlmZiAtLWdpdCBhL3Rvb2xzL2xpYnhsL2xpYnhsdV9jZmcuYyBi
L3Rvb2xzL2xpYnhsL2xpYnhsdV9jZmcuYwo+ID4gaW5kZXggNzI4MTVkMjVkZC4uY2FmYzYzMmZj
MSAxMDA2NDQKPiA+IC0tLSBhL3Rvb2xzL2xpYnhsL2xpYnhsdV9jZmcuYwo+ID4gKysrIGIvdG9v
bHMvbGlieGwvbGlieGx1X2NmZy5jCj4gPiBAQCAtMjY4LDggKzI2OCw5IEBAIGludCB4bHVfY2Zn
X3JlcGxhY2Vfc3RyaW5nKGNvbnN0IFhMVV9Db25maWcgKmNmZywKPiBjb25zdCBjaGFyICpuLAo+
ID4gICAgICByZXR1cm4gMDsKPiA+ICB9Cj4gPgo+ID4gLWludCB4bHVfY2ZnX2dldF9sb25nKGNv
bnN0IFhMVV9Db25maWcgKmNmZywgY29uc3QgY2hhciAqbiwKPiA+IC0gICAgICAgICAgICAgICAg
ICAgICBsb25nICp2YWx1ZV9yLCBpbnQgZG9udF93YXJuKSB7Cj4gPiAraW50IHhsdV9jZmdfZ2V0
X2JvdW5kZWRfbG9uZyhjb25zdCBYTFVfQ29uZmlnICpjZmcsIGNvbnN0IGNoYXIgKm4sCj4gPiAr
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBsb25nIG1pbiwgbG9uZyBtYXgsIGxvbmcgKnZh
bHVlX3IsCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICBpbnQgZG9udF93YXJuKSB7
Cj4gPiAgICAgIGxvbmcgbDsKPiA+ICAgICAgWExVX0NvbmZpZ1NldHRpbmcgKnNldDsKPiA+ICAg
ICAgaW50IGU7Cj4gPiBAQCAtMzAzLDEwICszMDQsMzEgQEAgaW50IHhsdV9jZmdfZ2V0X2xvbmco
Y29uc3QgWExVX0NvbmZpZyAqY2ZnLCBjb25zdAo+IGNoYXIgKm4sCj4gPiAgICAgICAgICAgICAg
ICAgICAgICBjZmctPmNvbmZpZ19zb3VyY2UsIHNldC0+bGluZW5vLCBuKTsKPiA+ICAgICAgICAg
IHJldHVybiBFSU5WQUw7Cj4gPiAgICAgIH0KPiA+ICsgICAgaWYgKGwgPCBtaW4pIHsKPiA+ICsg
ICAgICAgIGlmICghZG9udF93YXJuKQo+ID4gKyAgICAgICAgICAgIGZwcmludGYoY2ZnLT5yZXBv
cnQsCj4gPiArICAgICAgICAgICAgICAgICAgICAiJXM6JWQ6IHdhcm5pbmc6IHZhbHVlIGAlbGQn
IGlzIHNtYWxsZXIgdGhhbgo+IG1pbmltdW0gYm91bmQgJyVsZCdcbiIsCj4gPiArICAgICAgICAg
ICAgICAgICAgICBjZmctPmNvbmZpZ19zb3VyY2UsIHNldC0+bGluZW5vLCBsLCBtaW4pOwo+ID4g
KyAgICAgICAgcmV0dXJuIEVJTlZBTDsKPiA+ICsgICAgfQo+ID4gKyAgICBpZiAobCA+IG1heCkg
ewo+ID4gKyAgICAgICAgaWYgKCFkb250X3dhcm4pCj4gPiArICAgICAgICAgICAgZnByaW50Zihj
ZmctPnJlcG9ydCwKPiA+ICsgICAgICAgICAgICAgICAgICAgICIlczolZDogd2FybmluZzogdmFs
dWUgYCVsZCcgaXMgZ3JlYXRlciB0aGFuCj4gbWF4aW11bSBib3VuZCAnJWxkJ1xuIiwKPiA+ICsg
ICAgICAgICAgICAgICAgICAgIGNmZy0+Y29uZmlnX3NvdXJjZSwgc2V0LT5saW5lbm8sIGwsIG1h
eCk7Cj4gPiArICAgICAgICByZXR1cm4gRUlOVkFMOwo+ID4gKyAgICB9Cj4gCj4gSSdtIG5vdCBz
dXJlIHdoYXQgd2FzIHRoZSBpbnRlbnRpb24gd2l0aCB0aGUgbmV3IGZ1bmN0aW9uCj4geGx1X2Nm
Z19nZXRfYm91bmRlZF9sb25nKCksIGJ1dCBJIGRvbid0IHRoaW5rIGxpYnhsdSBpcyB0aGUgcmln
aHQgcGxhY2UKPiBmb3IgaXQuIFRoYXQgZnVuY3Rpb24gaXMgb25seSBnb2luZyB0byBtYWtlIGl0
IGhhcmRlciBmb3IgdXNlcnMgdG8gZmluZAo+IG1pc3Rha2VzIGluIHRoZSBjb25maWcgZmlsZS4g
SWYgYG4nIHZhbHVlIGlzIG91dCBvZiBib3VuZCwgaXQgd2lsbCBvbmx5Cj4gZ2V0IGlnbm9yZWQs
IGFuZCB4bCB3aWxsIGtlZXAgZ29pbmcuIEkgdGhpbmsgeGx1X2NmZyBzaG91bGQgb25seSBiZSBh
Cj4gcGFyc2VyIChhbmQgY2FuIGNoZWNrIGZvciBzeW50YXggZXJyb3IpLgo+IAo+IENhbiB5b3Ug
bW92ZSB0aGF0IGZ1bmN0aW9uIHRvIHhsPwo+IAoKSSBjYW4sIGJ1dCB3aHkgaXMgdGhpcyBub3Qg
Y29uc2lkZXJlZCB1c2VmdWwgaW4gbGlieGw/IFRoZSBjYWxsIHJldHVybnMgZmFpbHVyZSBmb3Ig
YW4gb3V0LW9mLWJvdW5kcyBjaGVjay4gSWYgeGwgY3VycmVudGx5IGNob29zZXMgdG8gdHJlYXQg
RUlOVkFMIGFzIEVOT0VOVCB0aGVuIHRoYXQncyB4bCdzIGJ1ZyB0byBkZWFsIHdpdGguCgogIFBh
dWwKCj4gVGhhbmtzLAo+IAo+IC0tCj4gQW50aG9ueSBQRVJBUkQKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
