Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D22CB7338F
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jul 2019 18:20:22 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hqJxw-00013B-9b; Wed, 24 Jul 2019 16:18:08 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=4Fu/=VV=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1hqJxu-000136-Hq
 for xen-devel@lists.xenproject.org; Wed, 24 Jul 2019 16:18:06 +0000
X-Inumbo-ID: 9c02fa94-ae2e-11e9-8c80-fbd54a3f1a54
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9c02fa94-ae2e-11e9-8c80-fbd54a3f1a54;
 Wed, 24 Jul 2019 16:18:02 +0000 (UTC)
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: aBUuMBHOJALsZHlyDAUE7yyp9y+08G1hV1EQUVZvhseDSaS0jolXcvYJ7YxLzDxqQ8Z56EpDdq
 hlOv4DjpcSRF4Z15WDW0Itwaki5mDNGgj+CAiS8pHnogyw3pp3ZNaTJ7pTHfOZwO5SI4yiV79W
 rl8LUW8ofYMa485cIOYm/2jTcuJOSLkkyt/3m+IfqcYjZkmMoIU7pDyjnhqofA3GvF4bjVxcY6
 nvPpArWSe/rC5KRFaqfdTsqb1QmKcrbAlQ1qzYnO9JBMJi+mZdejATzYpR/7j6qEUhfSEYR6ZX
 kIc=
X-SBRS: 2.7
X-MesageID: 3377769
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,303,1559534400"; 
   d="scan'208";a="3377769"
Date: Wed, 24 Jul 2019 17:17:59 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Message-ID: <20190724161759.GB1242@perard.uk.xensource.com>
References: <20190704144233.27968-1-anthony.perard@citrix.com>
 <20190704144233.27968-25-anthony.perard@citrix.com>
 <20190715141521.aqmpchgzyleoergc@MacBook-Air-de-Roger.local>
 <20190722145319.GG1208@perard.uk.xensource.com>
 <20190723094207.ccnzyzuma4ydpugi@Air-de-Roger>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190723094207.ccnzyzuma4ydpugi@Air-de-Roger>
User-Agent: Mutt/1.12.1 (2019-06-15)
Subject: Re: [Xen-devel] [PATCH v3 24/35] OvmfPkg/XenPlatformPei: Rework
 memory detection
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
 xen-devel@lists.xenproject.org, Laszlo Ersek <lersek@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBKdWwgMjMsIDIwMTkgYXQgMTE6NDI6MDdBTSArMDIwMCwgUm9nZXIgUGF1IE1vbm7D
qSB3cm90ZToKPiBPbiBNb24sIEp1bCAyMiwgMjAxOSBhdCAwMzo1MzoxOVBNICswMTAwLCBBbnRo
b255IFBFUkFSRCB3cm90ZToKPiA+IE9uIE1vbiwgSnVsIDE1LCAyMDE5IGF0IDA0OjE1OjIxUE0g
KzAyMDAsIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6Cj4gPiA+IE9uIFRodSwgSnVsIDA0LCAyMDE5
IGF0IDAzOjQyOjIyUE0gKzAxMDAsIEFudGhvbnkgUEVSQVJEIHdyb3RlOgo+ID4gPiA+ICsgICAg
ICAvLyBlcnJvciBtZXNzYWdlOiBDcHVEeGU6IEludGVyc2VjdE1lbW9yeURlc2NyaXB0b3I6Cj4g
PiA+ID4gKyAgICAgIC8vICAgICAgICBkZXNjIFtGQzAwMDAwMCwgMTAwMDAwMDAwKSB0eXBlIDEg
Y2FwIDg3MDAwMDAwMDAwMjYwMDEKPiA+ID4gPiArICAgICAgLy8gICAgICAgIGNvbmZsaWN0cyB3
aXRoIGFwZXJ0dXJlIFtGRUUwMDAwMCwgRkVFMDEwMDApIGNhcCAxCj4gPiA+ID4gICAgICAgIC8v
Cj4gPiA+ID4gLSAgICAgIGlmIChFbnRyeS0+VHlwZSAhPSBFZmlBY3BpQWRkcmVzc1JhbmdlTWVt
b3J5KSB7Cj4gPiA+ID4gLSAgICAgICAgY29udGludWU7Cj4gPiA+ID4gKyAgICAgIGlmICghWGVu
SHZtbG9hZGVyRGV0ZWN0ZWQgKCkpIHsKPiA+ID4gPiArICAgICAgICBBZGRSZXNlcnZlZE1lbW9y
eUJhc2VTaXplSG9iIChCYXNlLCBFbmQgLSBCYXNlLCBGQUxTRSk7Cj4gPiA+IAo+ID4gPiBUaGlz
IHNwZWNpYWwgY2FzaW5nIGZvciBQVkggbG9va3Mgd2VpcmQsIGlkZWFsbHkgd2Ugd291bGQgbGlr
ZSB0byB1c2UKPiA+ID4gdGhlIHNhbWUgY29kZSBwYXRoLCBvciBlbHNlIGl0IHNob3VsZCBiZSBl
eHBsaWNpdGx5IG1lbnRpb25lZCB3aHkgUFZICj4gPiA+IGhhcyBkaXZlcmdpbmcgYmVoYXZpb3Vy
Lgo+ID4gCj4gPiBJIHRoaW5rIGh2bWxvYWRlciBpcyB0aGUgaXNzdWUgcmF0aGVyIHRoYW4gUFZI
LiBIZXJlIGlzIHBhcnQgb2YgdGhlCj4gPiAibWVtb3J5IG1hcCIgYXMgZm91bmQgaW4gaHZtbG9h
ZGVyL2NvbmZpZy5oOgo+ID4gCj4gPiAgIC8qIFNwZWNpYWwgQklPUyBtYXBwaW5ncywgZXRjLiBh
cmUgYWxsb2NhdGVkIGZyb20gaGVyZSB1cHdhcmRzLi4uICovCj4gPiAgICNkZWZpbmUgUkVTRVJW
RURfTUVNQkFTRSAgICAgICAgICAgICAgMHhGQzAwMDAwMAo+ID4gICAvKiBOQi4gQUNQSV9JTkZP
X1BIWVNJQ0FMX0FERFJFU1MgKk1VU1QqIG1hdGNoIGRlZmluaXRpb24gaW4gYWNwaS9kc2R0LmFz
bCEgKi8KPiA+ICAgI2RlZmluZSBBQ1BJX0lORk9fUEhZU0lDQUxfQUREUkVTUyAgICAweEZDMDAw
MDAwCj4gPiAgICNkZWZpbmUgUkVTRVJWRURfTUVNT1JZX0RZTkFNSUNfU1RBUlQgMHhGQzAwMTAw
MAo+ID4gICAjZGVmaW5lIFJFU0VSVkVEX01FTU9SWV9EWU5BTUlDX0VORCAgIDB4RkUwMDAwMDAK
PiA+IAo+ID4gYW5kIGh2bWxvYWRlciBzaW1wbHkgY3JlYXRlcyBhIHNpbmdsZSBlODIwIHJlc2Vy
dmVkIGVudHJ5LCBmcm9tCj4gPiBSRVNFUlZFRF9NRU1CQVNFIHRvIHRoZSB0b3Agb2YgNEdCLiBJ
dCdzIHByb2JhYmx5IHRvbyBtdWNoLgo+IAo+IEJ1dCBpc24ndCB0aGlzIGtpbmQgb2YgZGFuZ2Vy
b3VzPyBIb3cgY2FuIHlvdSBhc3N1cmUgZnV0dXJlIHZlcnNpb25zCj4gb2YgaHZtbG9hZGVyIHdv
bid0IHVzZSB0aGlzIHNwYWNlPwo+IAo+ID4gSWYgaHZtbG9hZGVyIG9ubHkgcmVzZXJ2ZWQKPiA+
IEFDUElfSU5GT19QSFlTSUNBTF9BRERSRVNTLVJFU0VSVkVEX01FTU9SWV9EWU5BTUlDX0VORCwg
SSBtaWdodCBub3QgaGF2ZQo+ID4gdG8gc3BlY2lhbCBjYXNlIGh2bWxvYWRlci4KPiAKPiBDb3Vs
ZCB3ZSBsb29rIGludG8gZ2V0dGluZyB0aGlzIGZpeGVkIGluIGh2bWxvYWRlciB0aGVuPwo+IAo+
IEkgdGhpbmsgaXQncyBkYW5nZXJvdXMgZm9yIE9WTUYgdG8gcGxheSBzdWNoIHRyaWNrcyB3aXRo
IHRoZSBtZW1vcnkKPiBtYXAuCj4gCj4gPiBBcyBmYXIgYXMgSSBrbm93IDB4ZmVlMDAwMDAgaXNu
J3QgYSBzcGVjaWFsCj4gPiBiaW9zIG1hcHBpbmcsIGJ1dCBzb21ldGhpbmcgdGhlIGhhcmR3YXJl
IHByb3ZpZGVzLgo+IAo+IFllcywgdGhhdCdzIHVzZWQgYnkgdGhlIGxhcGljLCBzbyBpdCdzIG5v
dCBzcGVjaWZpYyB0byBodm1sb2FkZXIuCgpSaWdodCwgSSd2ZSBnb3QgYSBjbG9zZXIgbG9vayBh
dCB0aGF0IENwdUR4ZSBtb2R1bGUsIGl0IHdhbnRzIHRoZSBsb2NhbApBUElDIG1lbW9yeSBtYXBw
ZWQgc3BhY2UgdG8gYmUgIm1hcHBlZCBJTyIsIGFuZCB0aGF0IGRpZmZlcmVudCB0aGFuCiJyZXNl
cnZlZCIuCgpTbyB3aGlsZSBwYXJzaW5nIHRoZSBlODIwIGZyb20gaHZtbG9hZGVyLCBpbnN0ZWFk
IG9mIGlnbm9yaW5nIGFsbApyZXNlcnZlZCByZWdpb24sIEknbSBnb2luZyB0byBhdm9pZCBhZGRp
bmcgdGhlIGxvY2FsIGFwaWMgbWVtb3J5IG1hcHBlZApzcGFjZS4KCnNvbWV0aGluZyBsaWtlOgog
IGlmIChodm1sb2FkZXJEZXRlY3RlZCgpKQogICAgQmFzZSA9ICQoc3RhcnQgb2YgdGhlIGU4MjAg
ZW50cnkpOwogICAgRW5kID0gJChzdGFydCBvZiB0aGUgZTgyMCBlbnRyeSArIHNpemUpOwogICAg
TG9jYWxBcGljID0gMHhmZWUwMDAwMDsKICAgIGlmIChCYXNlIDwgTG9jYWxBcGljICYmIExvY2Fs
QXBpYyA8IEVuZCkgewogICAgICBBZGRSZXNlcnZlZE1lbW9yeVJhbmdlSG9iIChCYXNlLCBMb2Nh
bEFwaWMsIEZBTFNFKTsKICAgICAgaWYgKEVuZCA+IChMb2NhbEFwaWMgKyBTSVpFXzRLQikpIHsK
ICAgICAgICBBZGRSZXNlcnZlZE1lbW9yeVJhbmdlSG9iIChMb2NhbEFwaWMgKyBTSVpFXzRLQiwg
RW5kLCBGQUxTRSk7CiAgICAgIH0KICAgIH0KICB9CgpBbHNvLCBJIHdpbGwgYWx3YXlzIGFkZCB0
aGUgMHhmZWUwMDAwMCBhcyBtYXBwZWQgSU8sIENwdUR4ZSB3aWxsIG5vdApjb21wbGFpbiBhcyB0
aGUgcmVnaW9uIHdpbGwgYmUgb2YgdGhlIGV4cGVjdGVkIHR5cGUuCgpJIHRoaW5rIHdpdGggdGhh
dCBjaGFuZ2UgKGFuZCB0aGUgb3RoZXIgYWJvdXQgdGhlIEFDUEkgZW50cmllcyksCmV2ZXJ5dGhp
bmcgZnJvbSB0aGUgZTgyMCB0YWJsZSB3aWxsIGJlIHB1dCBpbnRvIE9WTUYncyBtZW1vcnkgbWFw
LgoKLS0gCkFudGhvbnkgUEVSQVJECgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
