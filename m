Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F5082E1DD
	for <lists+xen-devel@lfdr.de>; Wed, 29 May 2019 18:05:02 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hW12J-0000TF-Lm; Wed, 29 May 2019 16:02:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=tSLV=T5=citrix.com=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1hW12I-0000T9-2B
 for xen-devel@lists.xenproject.org; Wed, 29 May 2019 16:02:42 +0000
X-Inumbo-ID: 2e8d00e2-822b-11e9-aac7-cfe6829ba9cb
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2e8d00e2-822b-11e9-aac7-cfe6829ba9cb;
 Wed, 29 May 2019 16:02:39 +0000 (UTC)
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=Paul.Durrant@citrix.com;
 spf=Pass smtp.mailfrom=Paul.Durrant@citrix.com;
 spf=None smtp.helo=postmaster@MIAPEX02MSOL02.citrite.net
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 Paul.Durrant@citrix.com) identity=pra;
 client-ip=23.29.105.83; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 Paul.Durrant@citrix.com designates 23.29.105.83 as permitted
 sender) identity=mailfrom; client-ip=23.29.105.83;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:23.29.105.83 ip4:162.221.156.50 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@MIAPEX02MSOL02.citrite.net) identity=helo;
 client-ip=23.29.105.83; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="postmaster@MIAPEX02MSOL02.citrite.net";
 x-conformance=sidf_compatible
IronPort-SDR: tb8v3RyBSr+o/0lcwJQyTKQpK/3hv1Bw2E3G0otSE8saJuYiXNG1cvf/42lk/XYYnrtXw3JKc+
 k0XtPMWVQL/95j8xbTSlphQ6uM+tx1eDiUdQCL6YIIiYhJ7wwzw+qpFnPpFz9yPpHQJqy8CJHx
 8GxhQzOzItAlpAVOJTQFyc3mq7kvfi85RGNEn6tRWCOx76cIdkn9x40WCDdoDxareNzqz901lc
 0E5Ea7WH2KEzmr1bas3hJSH9XjJ2QMixO313+pJ+UVKFxSa7Kp6vsCJP7mR695tfMCYlyzUKhW
 kUM=
X-SBRS: 2.7
X-MesageID: 1060664
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 23.29.105.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.60,527,1549947600"; 
   d="scan'208";a="1060664"
From: Paul Durrant <Paul.Durrant@citrix.com>
To: 'Jan Beulich' <JBeulich@suse.com>
Thread-Topic: [PATCH v3] x86/hvm/hpet: avoid 'small' time diff test on resume
Thread-Index: AQHVFifnLLnXBFkwn06i0hwRb+2sX6aCIU4AgAAh3gA=
Date: Wed, 29 May 2019 16:02:35 +0000
Message-ID: <083bc5d53da64f1d9710e9faa2c2a31b@AMSPEX02CL03.citrite.net>
References: <20190529140744.5565-1-paul.durrant@citrix.com>
 <5CEEAC8202000078002337F7@prv1-mh.provo.novell.com>
In-Reply-To: <5CEEAC8202000078002337F7@prv1-mh.provo.novell.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v3] x86/hvm/hpet: avoid 'small' time diff
 test on resume
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
Cc: Andrew Cooper <Andrew.Cooper3@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>, WeiLiu <wl@xen.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+IEZyb206IEphbiBCZXVsaWNoIFttYWlsdG86
SkJldWxpY2hAc3VzZS5jb21dCj4gU2VudDogMjkgTWF5IDIwMTkgMTc6MDAKPiBUbzogUGF1bCBE
dXJyYW50IDxQYXVsLkR1cnJhbnRAY2l0cml4LmNvbT4KPiBDYzogQW5kcmV3IENvb3BlciA8QW5k
cmV3LkNvb3BlcjNAY2l0cml4LmNvbT47IFJvZ2VyIFBhdSBNb25uZSA8cm9nZXIucGF1QGNpdHJp
eC5jb20+OyB4ZW4tZGV2ZWwgPHhlbi0KPiBkZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZz47IFdl
aUxpdSA8d2xAeGVuLm9yZz4KPiBTdWJqZWN0OiBSZTogW1BBVENIIHYzXSB4ODYvaHZtL2hwZXQ6
IGF2b2lkICdzbWFsbCcgdGltZSBkaWZmIHRlc3Qgb24gcmVzdW1lCj4gCj4gPj4+IE9uIDI5LjA1
LjE5IGF0IDE2OjA3LCA8cGF1bC5kdXJyYW50QGNpdHJpeC5jb20+IHdyb3RlOgo+ID4gSXQgYXBw
ZWFycyB0aGF0IGV2ZW4gNjQtYml0IHZlcnNpb25zIG9mIFdpbmRvd3MgMTAsIHdoZW4gbm90IHVz
aW5nIHN5dGgtCj4gPiBldGljIHRpbWVycywgd2lsbCB1c2UgMzItYml0IEhQRVQgbm9uLXBlcmlv
ZGljIHRpbWVycy4gVGhlcmUgaXMgYSB0ZXN0Cj4gPiBpbiBocGV0X3NldF90aW1lcigpLCBzcGVj
aWZpYyB0byAzMi1iaXQgdGltZXJzLCB0aGF0IHRyaWVzIHRvIGRpc2FtYmlndWF0ZQo+ID4gYmV0
d2VlbiBhIGNvbXBhcmF0b3IgdmFsdWUgdGhhdCBpcyBpbiB0aGUgcGFzdCBhbmQgb25lIHRoYXQg
aXMgc3VmZmljaWVudGx5Cj4gPiBmYXIgaW4gdGhlIGZ1dHVyZSB0aGF0IGl0IHdyYXBzLiBUaGlz
IGlzIGRvbmUgYnkgYXNzdW1pbmcgdGhhdCB0aGUgZGVsdGEKPiA+IGJldHdlZW4gdGhlIG1haW4g
Y291bnRlciBhbmQgY29tcGFyYXRvciB3aWxsIGJlICdzbWFsbCcgWzFdLCBpZiB0aGUKPiA+IGNv
bXBhcmF0b3IgdmFsdWUgaXMgaW4gdGhlIHBhc3QuIFVuZm9ydHVuYXRlbHksIG1vcmUgb2Z0ZW4g
dGhhbiBub3QsIHRoaXMKPiA+IGlzIG5vdCB0aGUgY2FzZSBpZiB0aGUgdGltZXIgaXMgYmVpbmcg
cmUtc3RhcnRlZCBhZnRlciBhIG1pZ3JhdGUgYW5kIHNvCj4gPiB0aGUgdGltZXIgaXMgc2V0IHRv
IGZpcmUgZmFyIGluIHRoZSBmdXR1cmUgKGluIGV4Y2VzcyBvZiBhIG1pbnV0ZSBpbgo+ID4gc2V2
ZXJhbCBvYnNlcnZlZCBjYXNlcykgcmF0aGVyIHRoZW4gc2V0IHRvIGZpcmUgaW1tZWRpYXRlbHku
IFRoaXMgaGFzIGEKPiA+IHJhdGhlciBvZGQgc3ltcHRvbSB3aGVyZSB0aGUgZ3Vlc3QgY29uc29s
ZSBpcyBhbGl2ZSBlbm91Z2ggdG8gYmUgYWJsZSB0bwo+ID4gZGVhbCB3aXRoIG1vdXNlIHBvaW50
ZXIgcmUtcmVuZGVyaW5nLCBidXQgYW55IGtleWJvYXJkIGFjdGl2aXR5IG9yIG1vdXNlCj4gPiBj
bGlja3MgeWllbGQgbm8gcmVzcG9uc2UuCj4gPgo+ID4gVGhpcyBwYXRjaCBzaW1wbHkgYWRkcyBh
biBleHRyYSBjaGVjayBvZiAnY3JlYXRpb25fZmluaXNoZWQnIGludG8KPiA+IGhwZXRfc2V0X3Rp
bWVyKCkgc28gdGhhdCB0aGUgJ3NtYWxsJyB0aW1lIHRlc3QgaXMgb21pdHRlZCB3aGVuIHRoZSBm
dW5jdGlvbgo+ID4gaXMgY2FsbGVkIHRvIHJlc3RhcnQgdGltZXJzIGFmdGVyIG1pZ3JhdGlvbiwg
YW5kIHRodXMgYW55IG5lZ2F0aXZlIGRlbHRhCj4gPiBjYXVzZXMgYSB0aW1lciB0byBmaXJlIGlt
bWVkaWF0ZWx5Lgo+ID4KPiA+IFsxXSBUaGUgbnVtYmVyIG9mIHRpY2tzIHRoYXQgZXF1YXRlIHRv
IDAuOTc2NTYyNSBtaWxsaXNlY29uZHMKPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBQYXVsIER1cnJh
bnQgPHBhdWwuZHVycmFudEBjaXRyaXguY29tPgo+IAo+IFJldmlld2VkLWJ5OiBKYW4gQmV1bGlj
aCA8amJldWxpY2hAc3VzZS5jb20+Cj4gCgpUaGFua3MuCgo+ID4gSSBub3RpY2UgdGhhdCB3ZSBz
ZWVtaW5nbHkgZG9uJ3QgaGFuZGxlIG1haW4gY291bnRlciB3cmFwIGluIHRoZSBIUEVUIGNvZGUu
Cj4gPiBUaGUgc3BlYy4gc2F5cyB0aGF0IHRpbWVycyBzaG91bGQgZmlyZSBhdCB0aGUgcG9pbnQg
dGhlIGNvdW50ZXIgd3JhcHMgYXQgdGhlCj4gPiB0aW1lcidzIHdpZHRoLiBJIHRoaW5rIHRoZSBu
ZWVkIGZvciB0aGUgJ3NtYWxsJyB0aW1lIHRlc3Qgd291bGQgZ28gYXdheSBpZgo+ID4gdGhpcyB3
YXMgaW1wbGVtZW50ZWQsIGJ1dCB0aGF0J3MgZm9yIGFub3RoZXIgZGF5Lgo+IAo+IEZvciBwb3N0
ZXJpdHkgSSB3b3VsZCBoYXZlIGhvcGVkIHlvdSB3b3VsZCB1cGRhdGUgdGhpcyByZW1hcmsgYXMK
PiB3ZWxsLgoKT29wcywgc29ycnksIHllcyBJIGZvcmdvdCB0byB1cGRhdGUgdGhpcyBwYXJ0IG9m
IHRoZSBjb21taXQgY29tbWVudC4gRlRSIHRoZSBzcGVjIGRvZXMgb25seSBzdGF0ZSB0aGF0IHRo
ZSB0aW1lciBzaG91bGQgZmlyZSB3aGVuIGEgMzItYml0IHRpbWVyIGNvdW50ZXIgd3JhcHMuCgog
IFBhdWwKCj4gCj4gSmFuCj4gCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
