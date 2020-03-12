Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DFB4182E68
	for <lists+xen-devel@lfdr.de>; Thu, 12 Mar 2020 11:59:18 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jCLWH-00031x-Ga; Thu, 12 Mar 2020 10:56:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=abR8=45=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jCLWF-00031k-Nw
 for xen-devel@lists.xenproject.org; Thu, 12 Mar 2020 10:56:51 +0000
X-Inumbo-ID: 2c49db23-6450-11ea-b149-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2c49db23-6450-11ea-b149-12813bfff9fa;
 Thu, 12 Mar 2020 10:56:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1584010609;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=0iQk1H+SwCZAOkQsyXmqS3JeYSTD13j8U7e4E+YejV8=;
 b=OITe5PAd3byMkUyaUZfsfnRdSSeuQMYThRcXTlPOT8/SdsnKdgBne6+Y
 SFBMZ5UuPdX9h+RZON+hkaSPNfPaL6YV3/Vhr23VDEabI/ri49DKdlEip
 Ywys6kzIJl+AN3Tl2dm6mnuLcyxPyRQKs4WwBSQWvv0bLWs64zHxKEPFJ o=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: OS2ExR0BheQlU6T0f2d5ItlOmNRO4Oi2yKQ/fZqgxJbKTAT5i6rphylQgR+FAwOUyCshn6JaRi
 UZULWjcs06RAfsYIEWgUm7nM90/FVBBwooK52UbQRsm3mE1pHz2FJ7vY0m/Ino4kDzUtEAqcyb
 kbHbZN7PV5RUNmrLWi219v7+xcgugKYfF4AbQMX+hRaMT4u55ROT4CWRzaZf+iwT9PWx1ZMG7d
 2R05rBW7RJltk1XlMMxXnfvQW3ne5k86Xug7ak3ZfyQQSVaC7xmkEMBkrYPVDOcvzVXYzevovg
 8WA=
X-SBRS: 2.7
X-MesageID: 14460655
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,544,1574139600"; d="scan'208";a="14460655"
Date: Thu, 12 Mar 2020 11:56:39 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20200312105639.GG24458@Air-de-Roger.citrite.net>
References: <8a151dd0-d083-d242-566c-f1faee084ae2@citrix.com>
 <658ef23d-f6e1-dbf8-8805-b84e32ffb6fa@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <658ef23d-f6e1-dbf8-8805-b84e32ffb6fa@suse.com>
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] nvmx deadlock with MSR bitmaps
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Kevin Tian <kevin.tian@intel.com>, Paul Durrant <paul@xen.org>,
 Wei Liu <wl@xen.org>, xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBNYXIgMTIsIDIwMjAgYXQgMDk6NTk6NDhBTSArMDEwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gT24gMTEuMDMuMjAyMCAxOTowNCwgQW5kcmV3IENvb3BlciB3cm90ZToKPiA+IFNwZWNp
ZmljYWxseSwgdGhpcyBpcyBhIHN3aXRjaCBmcm9tIGFuIEhWTSB2Y3B1LCB0byBhIFBWIHZjcHUs
IHdoZXJlIHRoZQo+ID4gbWFwY2FjaGUgY29kZSB0cmllcyB0byBhY2Nlc3MgdGhlIHBlci1kb21h
aW4gbWFwcGluZ3Mgb24gdGhlIEhWTSBtb25pdG9yCj4gPiB0YWJsZS7CoCBJdCBlbmRzIHVwIHRy
eWluZyB0byByZWN1cnNpdmVseSBhY3F1aXJlIHRoZSBtYXBjYWNoZSBsb2NrIHdoaWxlCj4gPiB0
cnlpbmcgdG8gd2FsayAlY3IyIHRvIGlkZW50aWZ5IHRoZSBzb3VyY2Ugb2YgdGhlIGZhdWx0Lgo+
ID4gCj4gPiBGb3IgbnZteC0+bXNyX21lcmdlZCwgdGhpcyBuZWVkcyB0byBlaXRoZXIgYmUgYSB4
ZW5oZWFwIHBhZ2UsIG9yIGEKPiA+IGdsb2JhbGx5IG1hcHBlZCBkb21oZWFwIHBhZ2UuwqAgSSds
bCBkcmFmdCBhIHBhdGNoIGluIGEgbW9tZW50Lgo+ID4gCj4gPiBGb3IgbWFwX2RvbWFpbl9wYWdl
KCksIGlzIHRoZXJlIGFueXRoaW5nIHdlIGNhbiByYXRpb25hbGx5IGRvIHRvIGFzc2VydAo+ID4g
dGhhdCBpdCBpc24ndCBjYWxsZWQgaW4gdGhlIG1pZGRsZSBvZiBhIGNvbnRleHQgc3dpdGNoP8Kg
IFRoaXMgaXMgdGhlCj4gPiBraW5kIG9mIHRoaW5nIHdoaWNoIG5lZWRzIHRvIGJsb3cgdXAgcmVs
aWFibHkgaW4gYSBkZWJ1ZyBidWlsZC4KPiAKPiBXZWxsLCBpdCdzIG5vdCBpbmhlcmVudGx5IHVu
c2FmZSB0byBkbywgaXQncyBqdXN0IHRoYXQKPiBtYXBjYWNoZV9jdXJyZW50X3ZjcHUoKSB3b3Vs
ZCBuZWVkIHRvIGF2b2lkIHVzaW5nIGN1cnJlbnQgZnJvbQo+IGNvbnRleHRfc3dpdGNoKCkncyBj
YWxsIHRvIHNldF9jdXJyZW50KCkgdGhyb3VnaCB0bwo+IF9fY29udGV4dF9zd2l0Y2goKSdzIGNh
bGwgdG8gd3JpdGVfcHRiYXNlKCkuIEEgcG9zc2libGUKPiBkZXRlY3Rpb24gKGlmIHdlIGRvbid0
IHdhbnQgdG8gbWFrZSB0aGUgY2FzZSB3b3JrKSB3b3VsZAo+IHNlZW0gdG8gYmUgQVNTRVJUKGN1
cnJlbnQgPT0gdGhpc19jcHUoY3Vycl92Y3B1KSkuIEJ1dCBvZiBjb3Vyc2UKPiB0aGVyZSdzIGFs
c28gdGhpcyBleHRyYSBsb2dpYyBpbiBtYXBjYWNoZV9jdXJyZW50X3ZjcHUoKSB0byBkZWFsCj4g
d2l0aCBhIFBWIHZDUFUgaGF2aW5nIGEgbnVsbCB2LT5hcmNoLmd1ZXN0X3RhYmxlLCB3aGljaCBJ
J20gb25jZQo+IGFnYWluIHN0cnVnZ2xpbmcgdG8gc2VlIHVuZGVyIHdoYXQgY29uZGl0aW9ucyBp
dCBtaWdodCBoYXBwZW4uCj4gVGhlIERvbTAgYnVpbGRpbmcgY2FzZSBjYW4ndCBiZSBtZWFudCB3
aXRoIHRoZXJlIGJlaW5nCj4gbWFwY2FjaGVfb3ZlcnJpZGVfY3VycmVudCgpIG9uIHRoYXQgcGF0
aC4gSSdtIHdvbmRlcmluZyBpZiB0aGUKPiBjb21tZW50IHRoZXJlIGlzIG1pc2xlYWRpbmcgYW5k
IGl0J3MgcmVhbGx5IHRvIGNvdmVyIHRoZSBjYXNlCj4gd2hlcmUsIGNvbWluZyBmcm9tIGEgUFYg
dkNQVSwgY3VycmVudCB3YXMgYWxyZWFkeSBzZXQgdG8gdGhlCj4gaWRsZSB2Q1BVIGJ5IGNvbnRl
eHRfc3dpdGNoKCkgKHdoaWNoIHdvdWxkIGhhdmUgYSBudWxsCj4gdi0+YXJjaC5ndWVzdF90YWJs
ZSkgLSBJIHdvdWxkbid0IGNhbGwgdGhpcyAid2UgYXJlIHJ1bm5pbmcgYQo+IHBhcmF2aXJ0dWFs
aXNlZCBndWVzdCIuIEJ1dCBpbiBzdWNoIGEgY2FzZSB0aGUgbG9naWMgaGVyZSB3b3VsZAo+IHNp
bXBseSBiZSBhICh0b28pIHNwZWNpYWwgY2FzZSBvZiB3aGF0IHlvdSdyZSBkZXNjcmliaW5nIGFz
IHRoZQo+IGlzc3VlIHdpdGggblZNWC4KCkxvb2tpbmcgYXQgdGhlIGNvZGUgaW4gY29udGV4dF9z
d2l0Y2ggYW5kIF9fY29udGV4dF9zd2l0Y2ggd291bGQgaXQgYmUKcG9zc2libGUgdG8gc2V0IGN1
cnJlbnQgdG8gdGhlIG5leHQgdkNQVSBhZnRlciBhbGwgdGhlIGZyb20gaG9va3MgaGF2ZQpiZWVu
IGNhbGxlZD8KCkllOiBzZXRfY3VycmVudCBjb3VsZCBiZSBtb3ZlZCBpbnRvIF9fY29udGV4dF9z
d2l0Y2ggYWZ0ZXIgdGhlIGNhbGwgdG8KcGQtPmFyY2guY3R4dF9zd2l0Y2gtPmZyb20ocCkuCgpJ
J20gYWxzbyBub3Qgc3VyZSBJIHVuZGVyc3RhbmQgdGhlIGRpZmZlcmVuY2UgYmV0d2VlbiBjb250
ZXh0X3N3aXRjaAphbmQgX19jb250ZXh0X3N3aXRjaCwgYW5kIGhvdyBhcmUgY2FsbGVycyBzdXBw
b3NlZCB0byB1c2UgdGhlbS4KClRoYW5rcywgUm9nZXIuCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
