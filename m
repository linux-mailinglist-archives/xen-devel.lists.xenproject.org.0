Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F35E7148C
	for <lists+xen-devel@lfdr.de>; Tue, 23 Jul 2019 11:05:17 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hpqgi-0002HK-AH; Tue, 23 Jul 2019 09:02:24 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=079Z=VU=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1hpqgh-0002HE-0b
 for xen-devel@lists.xenproject.org; Tue, 23 Jul 2019 09:02:23 +0000
X-Inumbo-ID: 94cabc61-ad28-11e9-8980-bc764e045a96
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 94cabc61-ad28-11e9-8980-bc764e045a96;
 Tue, 23 Jul 2019 09:02:22 +0000 (UTC)
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: CwRODw5WB/rYh1tSJ3cuTVCUJ4z7FtTI05PDmGvnPuBX3EfwLTRH6tkBnDWP32a/8+9CEKW3Vm
 glcXnurySwbgtdCsZBlt8vwTWXsYGB/Y4dZJolsY8FUlsEdowy94WNH0vBdvmi8jDNZee7EJXk
 C328GoJr3B3w/T0G25Kapr1vZOiA3pKIKJdTZyM6puBzKh89dQx30e/gj7FXsHlHC0CTslb/jD
 6EsFNyLoT53qhoYIkJalxCO5JfTl3k+GrO9fLYM4lXQ91lg4vAZkieQCeVn4BUPalUUeQ26M/Y
 OjE=
X-SBRS: 2.7
X-MesageID: 3402570
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,298,1559534400"; 
   d="scan'208";a="3402570"
Date: Tue, 23 Jul 2019 11:02:05 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Laszlo Ersek <lersek@redhat.com>
Message-ID: <20190723090205.6ksiqffrqgichbd2@Air-de-Roger>
References: <20190704144233.27968-1-anthony.perard@citrix.com>
 <20190704144233.27968-10-anthony.perard@citrix.com>
 <20190715142219.m2t67v2dcyabqp2p@MacBook-Air-de-Roger.local>
 <20190722134912.GF1208@perard.uk.xensource.com>
 <7bb00665-784b-e8d5-42cd-b34e22ada1eb@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7bb00665-784b-e8d5-42cd-b34e22ada1eb@redhat.com>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH v3 09/35] OvmfPkg/OvmfXen: use a TimerLib
 instance that depends only on the CPU
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
Cc: Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Jordan Justen <jordan.l.justen@intel.com>, devel@edk2.groups.io,
 Julien Grall <julien.grall@arm.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBKdWwgMjIsIDIwMTkgYXQgMDk6Mjg6MjBQTSArMDIwMCwgTGFzemxvIEVyc2VrIHdy
b3RlOgo+IE9uIDA3LzIyLzE5IDE1OjQ5LCBBbnRob255IFBFUkFSRCB3cm90ZToKPiA+IE9uIE1v
biwgSnVsIDE1LCAyMDE5IGF0IDA0OjIyOjE5UE0gKzAyMDAsIFJvZ2VyIFBhdSBNb25uw6kgd3Jv
dGU6Cj4gPj4gT24gVGh1LCBKdWwgMDQsIDIwMTkgYXQgMDM6NDI6MDdQTSArMDEwMCwgQW50aG9u
eSBQRVJBUkQgd3JvdGU6Cj4gPj4+IEFDUEkgVGltZXIgZG9lcyBub3Qgd29yayBpbiBhIFBWSCBn
dWVzdCwgYnV0IGxvY2FsIEFQSUMgd29ya3Mgb24gYm90aAo+ID4+Cj4gPj4gVGhpcyBpcyBub3Qg
YWNjdXJhdGUuIEl0J3Mgbm90IHRoYXQgdGhlIEFDUEkgdGltZXIgZG9lc24ndCB3b3JrLCBpdCdz
Cj4gPj4ganVzdCB0aGF0IGl0J3Mgbm90IHByZXNlbnQuIFRoZSBQTV9UTVJfQkxLIHNob3VsZCBi
ZSBzZXQgdG8gMCB0bwo+ID4+IGluZGljYXRlIHRoZSBsYWNrIG9mIFBNIHRpbWVyIHN1cHBvcnQs
IG9yIGVsc2UgdGhlcmUncyBzb21ldGhpbmcKPiA+PiBicm9rZW4uCj4gPiAKPiA+IEknbGwgcmV3
b3JkIHRoYXQgZmlyc3Qgc2VudGVuY2UuCj4gPiAKPiA+IE9WTUYgZG9lc24ndCBsb29rIGF0IHRo
ZSBQTV9UTVJfQkxLIHZhbHVlIHdoZW4gaW5pdGlhbGl6aW5nIHRoYXQgdGltZXIsCj4gPiBpdCBv
bmx5IGxvb2tzIGF0IHRoZSBQQ0kgaG9zdCBicmlkZ2UgZGV2aWNlIElEIGJlY2F1c2UgT1ZNRiBp
cyBidWlsdAo+ID4gd2l0aCBRRU1VIGluIG1pbmQgYW5kIHRoZXJlIGFyZSBvbmx5IHR3byBwb3Nz
aWJsZXMgY2hvaWNlcywgUUVNVSBpcwo+ID4gcnVubmluZyB3aXRoIGEgcGlpeCBvciBxMzUgbWFj
aGluZSB0eXBlLCBJIHRoaW5rLgo+IAo+IFdlIHNob3VsZCBzcGxpdCB0aGlzIHN0YXRlbWVudCBp
biB0d28uIDopCj4gCj4gT1ZNRiBkb2Vzbid0IGxvb2sgYXQgQUNQSSBwYXlsb2FkIGJlY2F1c2Ug
aXQgaXMgYSBkZXNpZ24gZ29hbCB0byBrZWVwCj4gdGhlIGd1ZXN0IGZpcm13YXJlIHVuLWVubGln
aHRlbmVkIGFib3V0IHN1Y2ggQUNQSSBjb250ZW50cyB0aGF0IGFycml2ZQo+IGZyb20gdGhlIGh5
cGVydmlzb3IuIFBhcnNpbmcgQUNQSSBpbiBmaXJtd2FyZSBhbHdheXMgbG9va3MgYXR0cmFjdGl2
ZQo+IHVudGlsIHNvbWVvbmUgYWN0dWFsbHkgd3JpdGVzIHRoZSBjb2RlLCBhbmQgdGhlbiBpdCBh
bHdheXMgZW5kcyBpbgo+IG1pc2VyeSAtLSBhdCB0aGUgbGF0ZXN0IHdoZW4gcGVvcGxlIHJlYWxp
emUgdGhleSBoYXZlIHRvIHBhcnNlIEFNTC4KPiBQYXJzaW5nIEFDUEkgaXMgb25seSBmZWFzaWJs
ZSB3aGVuIHlvdSBoYXZlIGEgZnVsbC1ibG93biBBQ1BJQ0EgKG9yCj4gc2ltaWxhcikgc3Vic3lz
dGVtLCBhbmQgZWRrMiBkb2Vzbid0LiBUaGVyZWZvcmUsIE9WTUYgbG9va3MgYXQgZWl0aGVyCj4g
aGFyZHdhcmUsIG9yIHNwZWNpYWxpemVkIHBhcmF2aXJ0IGluZm9ybWF0aW9uIGNoYW5uZWxzIHN1
Y2ggYXMgZndfY2ZnCj4gZmlsZXMsIHRoYXQgYXJlIGVhc3kgdG8gcGFyc2UgYnkgZGVzaWduLgoK
SU1PIHBhc3NpbmcgaW5mb3JtYXRpb24gdXNpbmcgc3VjaCBzaWRlLWNoYW5uZWxzIGFsd2F5cyBs
b29rcwphdHRyYWN0aXZlIGF0IGZpcnN0IHNpZ2h0LCB1bnRpbCB5b3UgcmVhbGl6ZSBhdCBzb21l
IHBvaW50IGxhdGVyIHRoYXQKeW91IGp1c3QgaGF2ZSBlbmRlZCB1cCB3aXRoIGEgY29tcGxldGVs
eSBjdXN0b20gaW50ZXJmYWNlIHRoYXQKZHVwbGljYXRlcyBBQ1BJLiBIYXZpbmcgdGhhdCBzYWlk
LCBYZW4gbWFuYWdlcyB0byBnZXQgbW9zdCBvZiB3aGF0IGl0Cm5lZWRzIGZyb20gc3RhdGljIEFD
UEkgdGFibGVzLCBidXQgSSdtIG5vdCBzdXJlIGlmIE9WTUYgY291bGQgbWFuYWdlCnRvIGRvIHNv
IGFsc28uCgpYZW4gaGFzIHF1aXRlIGEgbG90IG9mIGJhZ2dhZ2UgaGVyZSwgbGlrZSB1c2luZyB4
ZW5zdG9yZS94ZW5idXMKaW5zdGVhZCBvZiBQQ0ksIG9yIGN1c3RvbSAnc3RhcnQgaW5mbyBwYWdl
cycgaW5zdGVhZCBvZiBBQ1BJLCB3aGljaCB3ZQphcmUgY3VycmVudGx5IHRyeWluZyB0byBwYXJ0
aWFsbHkgbW92ZSBhd2F5IGZyb20gd2hlbiBwb3NzaWJsZS4KClRoYW5rcywgUm9nZXIuCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
