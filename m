Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B3F8165F87
	for <lists+xen-devel@lfdr.de>; Thu, 20 Feb 2020 15:14:41 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j4mY4-0002B6-PF; Thu, 20 Feb 2020 14:11:28 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=rOW3=4I=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1j4mY3-0002B1-34
 for xen-devel@lists.xenproject.org; Thu, 20 Feb 2020 14:11:27 +0000
X-Inumbo-ID: e14a3c4a-53ea-11ea-853a-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e14a3c4a-53ea-11ea-853a-12813bfff9fa;
 Thu, 20 Feb 2020 14:11:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1582207887;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=RotRLLjxe1Da2Zxd1bn9y+WuFCtMzRQURtFfTCzsUIY=;
 b=J9h/hW3F3lDO28dI+OjX4aCH0ORqelmPaCQmRR/YRLKlkXD7tBsWpmMe
 87qV/uxbnx7E2EuG/YcPwTBm9TdvX0FOhmMVrMFBPMxABsgvsPmbAJc/w
 4sx3citPQGPwbyyNWPteWotQJVmmN85dZKROn2WRtkqBZvh+DjPjROc/1 s=;
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: PM3UykvGVSYmRdJedMuiu1lmlHn6thMZ30pBYmHOkf6tAaC9Kzc1pkbaqUdhEs6wLQ3ishzS2y
 A1aPsQaFADIW3C59yj+zErmg3RvCuma31OepzeOeoO0JtWtOYYti0ilnM0GblcF4ol6YDYH4bL
 eqtEwWzwCfcXk7ZgdKcFM/k0G4+Pc7a8SmgNuJzoQjPhFCKRGchObGyviZV4jPbPExx9ylUp7S
 CYWAUWxA2u6uoQDxQEAWV2ZGLvYmqDPc9PptvgTnW6lmRxxix7cQ9E4F8TiBUY4isr2QnMByXf
 YX0=
X-SBRS: 2.7
X-MesageID: 12737643
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,464,1574139600"; d="scan'208";a="12737643"
Date: Thu, 20 Feb 2020 15:11:17 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20200220141117.GK4679@Air-de-Roger>
References: <20200220120231.86907-1-roger.pau@citrix.com>
 <ecf1c47c-4cbb-c7c4-7ccf-d3620a1992b3@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ecf1c47c-4cbb-c7c4-7ccf-d3620a1992b3@suse.com>
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH] rwlock: allow recursive read locking when
 already locked in write mode
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
Cc: =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBGZWIgMjAsIDIwMjAgYXQgMDE6NDg6NTRQTSArMDEwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gT24gMjAuMDIuMjAyMCAxMzowMiwgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+ID4gSSd2
ZSBkb25lIHNvbWUgdGVzdGluZyBhbmQgYXQgbGVhc3QgdGhlIENQVSBkb3duIGNhc2UgaXMgZml4
ZWQgbm93Lgo+ID4gUG9zdGluZyBlYXJseSBpbiBvcmRlciB0byBnZXQgZmVlZGJhY2sgb24gdGhl
IGFwcHJvYWNoIHRha2VuLgo+IAo+IExvb2tzIGdvb2QsIHRoYW5rcywganVzdCBhIHF1ZXN0aW9u
IGFuZCB0d28gY29tbWVudHM6Cj4gCj4gPiAtLS0gYS94ZW4vaW5jbHVkZS94ZW4vcndsb2NrLmgK
PiA+ICsrKyBiL3hlbi9pbmNsdWRlL3hlbi9yd2xvY2suaAo+ID4gQEAgLTIwLDIxICsyMCwzMCBA
QCB0eXBlZGVmIHN0cnVjdCB7Cj4gPiAgI2RlZmluZSBERUZJTkVfUldMT0NLKGwpIHJ3bG9ja190
IGwgPSBSV19MT0NLX1VOTE9DS0VECj4gPiAgI2RlZmluZSByd2xvY2tfaW5pdChsKSAoKihsKSA9
IChyd2xvY2tfdClSV19MT0NLX1VOTE9DS0VEKQo+ID4gIAo+ID4gLS8qCj4gPiAtICogV3JpdGVy
IHN0YXRlcyAmIHJlYWRlciBzaGlmdCBhbmQgYmlhcy4KPiA+IC0gKgo+ID4gLSAqIFdyaXRlciBm
aWVsZCBpcyA4IGJpdCB0byBhbGxvdyBmb3IgcG90ZW50aWFsIG9wdGltaXNhdGlvbiwgc2VlCj4g
PiAtICogX3dyaXRlX3VubG9jaygpLgo+ID4gLSAqLwo+ID4gLSNkZWZpbmUgICAgX1FXX1dBSVRJ
TkcgIDEgICAgICAgICAgICAgICAvKiBBIHdyaXRlciBpcyB3YWl0aW5nICAgICAqLwo+ID4gLSNk
ZWZpbmUgICAgX1FXX0xPQ0tFRCAgIDB4ZmYgICAgICAgICAgICAvKiBBIHdyaXRlciBob2xkcyB0
aGUgbG9jayAqLwo+ID4gLSNkZWZpbmUgICAgX1FXX1dNQVNLICAgIDB4ZmYgICAgICAgICAgICAv
KiBXcml0ZXIgbWFzay4qLwo+ID4gLSNkZWZpbmUgICAgX1FSX1NISUZUICAgIDggICAgICAgICAg
ICAgICAvKiBSZWFkZXIgY291bnQgc2hpZnQgICAgICAqLwo+ID4gKy8qIFdyaXRlciBzdGF0ZXMg
JiByZWFkZXIgc2hpZnQgYW5kIGJpYXMuICovCj4gPiArI2RlZmluZSAgICBfUVdfV0FJVElORyAg
MSAgICAgICAgICAgICAgICAgICAgICAgLyogQSB3cml0ZXIgaXMgd2FpdGluZyAqLwo+ID4gKyNk
ZWZpbmUgICAgX1FXX0xPQ0tFRCAgIDMgICAgICAgICAgICAgICAgICAgICAgIC8qIEEgd3JpdGVy
IGhvbGRzIHRoZSBsb2NrICovCj4gCj4gQWl1aSB0aGluZ3Mgd291bGQgd29yayBlcXVhbGx5IHdl
bGwgaWYgMiB3YXMgdXNlZCBoZXJlPwoKSSB0aGluayBzbywgSSBsZWZ0IGl0IGFzIDMgYmVjYXVz
ZSBwcmV2aW91c2x5IExPQ0tFRCB3b3VsZCBhbHNvCmluY2x1ZGUgV0FJVElORywgYW5kIEkgZGlk
bid0IHdhbnQgdG8gY2hhbmdlIGl0IGluIGNhc2UgSSd2ZSBtaXNzZWQKc29tZSBjb2RlIHBhdGgg
dGhhdCB3YXMgcmVseWluZyBvbiB0aGF0LgoKPiAKPiA+ICsjZGVmaW5lICAgIF9RV19XTUFTSyAg
ICAzICAgICAgICAgICAgICAgICAgICAgICAvKiBXcml0ZXIgbWFzayAqLwo+ID4gKyNkZWZpbmUg
ICAgX1FXX0NQVVNISUZUIDIgICAgICAgICAgICAgICAgICAgICAgIC8qIFdyaXRlciBDUFUgc2hp
ZnQgKi8KPiA+ICsjZGVmaW5lICAgIF9RV19DUFVNQVNLICAweDNmZmMgICAgICAgICAgICAgICAg
ICAvKiBXcml0ZXIgQ1BVIG1hc2sgKi8KPiAKPiBBdCBsZWFzdCBvbiB4ODYsIHRoZSBzaGlmdCBp
bnZvbHZlZCBoZXJlIGlzIHF1aXRlIGNlcnRhaW5seQo+IG1vcmUgZXhwZW5zaXZlIHRoYW4gdXNp
bmcgd2lkZXIgaW1tZWRpYXRlcyBvbiBBTkQgYW5kIENNUAo+IHJlc3VsdGluZyBmcm9tIHRoZSBf
UVdfTUFTSy1iYXNlZCBjb21wYXJpc29ucy4gSSdkIHRoZXJlZm9yZQo+IGxpa2UgdG8gc3VnZ2Vz
dCB0byBwdXQgdGhlIENQVSBpbiB0aGUgbG93IDEyIGJpdHMuCgpIbSByaWdodC4gVGhlIExPQ0tF
RCBhbmQgV0FJVElORyBiaXRzIGRvbid0IG5lZWQgc2hpZnRpbmcgYW55d2F5LgoKPiAKPiBBbm90
aGVyIG9wdGlvbiBpcyB0byB1c2UgdGhlIHJlY3Vyc2VfY3B1IGZpZWxkIG9mIHRoZQo+IGFzc29j
aWF0ZWQgc3BpbiBsb2NrOiBUaGUgZmllbGQgaXMgdXNlZCBmb3IgcmVjdXJzaXZlIGxvY2tzCj4g
b25seSwgYW5kIGhlbmNlIHRoZSBvbmx5IGNvbmZsaWN0IHdvdWxkIGJlIHdpdGgKPiBfc3Bpbl9p
c19sb2NrZWQoKSwgd2hpY2ggd2UgZG9uJ3QgKGFuZCBpbiB0aGUgZnV0dXJlIHRoZW4KPiBhbHNv
IHNob3VsZG4ndCkgdXNlIG9uIHRoaXMgbG9jay4KCkkgbG9va2VkIGludG8gdGhhdCBhbHNvLCBi
dXQgdGhpbmdzIGdldCBtb3JlIGNvbXBsaWNhdGVkIEFGQUlDVCwgYXMgaXQncwpub3QgcG9zc2li
bGUgdG8gYXRvbWljYWxseSBmZXRjaCB0aGUgc3RhdGUgb2YgdGhlIGxvY2sgYW5kIHRoZSBvd25l
cgpDUFUgYXQgdGhlIHNhbWUgdGltZS4gTmVpdGhlciB5b3UgY291bGQgc2V0IHRoZSBMT0NLRUQg
Yml0IGFuZCB0aGUgQ1BVCmF0IHRoZSBzYW1lIHRpbWUuCgo+IAo+ID4gQEAgLTE2Niw3ICsxODAs
OCBAQCBzdGF0aWMgaW5saW5lIHZvaWQgX3dyaXRlX3VubG9jayhyd2xvY2tfdCAqbG9jaykKPiA+
ICAgICAgICogSWYgdGhlIHdyaXRlciBmaWVsZCBpcyBhdG9taWMsIGl0IGNhbiBiZSBjbGVhcmVk
IGRpcmVjdGx5Lgo+ID4gICAgICAgKiBPdGhlcndpc2UsIGFuIGF0b21pYyBzdWJ0cmFjdGlvbiB3
aWxsIGJlIHVzZWQgdG8gY2xlYXIgaXQuCj4gPiAgICAgICAqLwo+ID4gLSAgICBhdG9taWNfc3Vi
KF9RV19MT0NLRUQsICZsb2NrLT5jbnRzKTsKPiA+ICsgICAgQVNTRVJUKF9pc193cml0ZV9sb2Nr
ZWRfYnlfbWUoYXRvbWljX3JlYWQoJmxvY2stPmNudHMpKSk7Cj4gPiArICAgIGF0b21pY19zdWIo
X3dyaXRlX2xvY2tfdmFsKCksICZsb2NrLT5jbnRzKTsKPiAKPiBJIHRoaW5rIHRoaXMgd291bGQg
YmUgbW9yZSBlZmZpY2llbnQgd2l0aCBhdG9taWNfYW5kKCksIG5vdAo+IHRoZSBsZWFzdCBiZWNh
dXNlIG9mIHRoZSB0aGVuIGF2b2lkZWQgc21wX3Byb2Nlc3Nvcl9pZCgpLgo+IFdoZXRoZXIgdG8g
bWFzayBvZmYganVzdCBfUVdfV01BU0sgb3IgYWxzbyB0aGUgQ1BVIG51bWJlciBvZgo+IHRoZSBs
YXN0IHdyaXRlIG93bmVyIHdvdWxkIG5lZWQgdG8gYmUgZGV0ZXJtaW5lZC4gQnV0IHdpdGgKPiB1
c2luZyBzdWJ0cmFjdGlvbiwgaW4gY2FzZSBvZiBwcm9ibGVtcyBpdCdsbCBsaWtlbHkgYmUKPiBo
YXJkZXIgdG8gdW5kZXJzdGFuZCB3aGF0IGFjdHVhbGx5IHdlbnQgb24sIGZyb20gbG9va2luZyBh
dAo+IHRoZSByZXN1bHRpbmcgc3RhdGUgb2YgdGhlIGxvY2sgKHRoaXMgaXMgaW4gcGFydCBhIHBy
ZS0KPiBleGlzdGluZyBwcm9ibGVtLCBidXQgZ2V0cyB3b3JzZSB3aXRoIHN1YnRyYWN0aW9uIG9m
IENQVQo+IG51bWJlcnMpLgoKUmlnaHQsIGEgbWFzayB3b3VsZCBiZSBiZXR0ZXIuIFJpZ2h0IG5v
dyBib3RoIG5lZWQgdG8gYmUgY2xlYXJlZCAodGhlCkxPQ0tFRCBhbmQgdGhlIENQVSBmaWVsZHMp
IGFzIHRoZXJlJ3MgY29kZSB0aGF0IHJlbGllcyBvbiAhbG9jay0+Y250cwphcyBhIHdheSB0byBk
ZXRlcm1pbmUgdGhhdCB0aGUgbG9jayBpcyBub3QgcmVhZCBvciB3cml0ZSBsb2NrZWQuIElmIHdl
CmxlZnQgdGhlIENQVSBseWluZyBhcm91bmQgdGhvc2UgY2hlY2tzIHdvdWxkIG5lZWQgdG8gYmUg
YWRqdXN0ZWQuCgpUaGFua3MsIFJvZ2VyLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
