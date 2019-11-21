Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8953D104F3A
	for <lists+xen-devel@lfdr.de>; Thu, 21 Nov 2019 10:29:21 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iXijP-0007oo-Mp; Thu, 21 Nov 2019 09:26:31 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=0uFN=ZN=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1iXijO-0007oj-VP
 for xen-devel@lists.xenproject.org; Thu, 21 Nov 2019 09:26:30 +0000
X-Inumbo-ID: ff35f42b-0c40-11ea-a326-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ff35f42b-0c40-11ea-a326-12813bfff9fa;
 Thu, 21 Nov 2019 09:26:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1574328391;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=sJdJzRV0xhQgXnbJVwfuE0lYkxvEepcwul6/kJ1YuC4=;
 b=VEX8Zb1XlbQy/aIT+8/z2PU+48VoGeEXQ3ULbdefan8Lclb/YlSQ58yz
 LoNWBDhdla933hPhJEIzmS2kIkudQr7E7ZWj0rIzc9qLvJhlvRHnuuf5N
 dDHmhNT0kSnDcZjQhXj30ZBypjlhZChvWmZCgL/cIcllrCY6TGbMAIGrn 4=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: WPH/u7Yx0Ex58GT9xrH7/A0Yg6jSIAreJev5SlfE/U0GdhOeWdwn4f/S65VMyIOwZnDqo3G6o7
 3Er0cwXSSew/iSFxZxdkja4z3Crk9BTDIvri/hmYIH7xsXHCGGnWrkTaH7/4ZoxoPAPziWX6DF
 3XSVhTt+OtntBDGZqo0+eoPyXG+krLH9u3bnInssHZE7urs3413yZkKPMGZh4AQkH8RKOvyM9r
 coGi8y2q99uA/tbR+gNeA6wUP95UCY5SuWKglKWEOOw54zEtjD6QAQZ7gtNlHQmABkgx+Vtw6W
 D00=
X-SBRS: 2.7
X-MesageID: 8760755
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,224,1571716800"; 
   d="scan'208";a="8760755"
Date: Thu, 21 Nov 2019 10:26:22 +0100
From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
To: Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>
Message-ID: <20191121092622.GS72134@Air-de-Roger>
References: <20191118101600.94645-1-roger.pau@citrix.com>
 <7a971294-7cfa-f801-15cf-afcf6e5a85cf@suse.com>
 <20191118134611.GK72134@Air-de-Roger>
 <0b9c8956-8179-c272-f7b5-f8d4f7ba21ca@suse.com>
 <20191118142048.GM72134@Air-de-Roger>
 <1b25228c-c0b4-57c7-de4a-5aac752b04c0@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1b25228c-c0b4-57c7-de4a-5aac752b04c0@suse.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH for-4.13] x86/vmx: always sync PIR to IRR
 before vmentry
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Joe Jin <joe.jin@oracle.com>,
 Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBOb3YgMTgsIDIwMTkgYXQgMDU6MDA6MjlQTSArMDEwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gT24gMTguMTEuMjAxOSAxNToyMCwgUm9nZXIgUGF1IE1vbm7DqSAgd3JvdGU6Cj4gPiBP
biBNb24sIE5vdiAxOCwgMjAxOSBhdCAwMzowMDowMFBNICswMTAwLCBKYW4gQmV1bGljaCB3cm90
ZToKPiA+PiBPbiAxOC4xMS4yMDE5IDE0OjQ2LCBSb2dlciBQYXUgTW9ubsOpICB3cm90ZToKPiA+
Pj4gT24gTW9uLCBOb3YgMTgsIDIwMTkgYXQgMDE6MDE6NThQTSArMDEwMCwgSmFuIEJldWxpY2gg
d3JvdGU6Cj4gPj4+PiBPbiAxOC4xMS4yMDE5IDExOjE2LCBSb2dlciBQYXUgTW9ubmUgd3JvdGU6
Cj4gPj4+Pj4gV2hlbiB1c2luZyBwb3N0ZWQgaW50ZXJydXB0cyBvbiBJbnRlbCBoYXJkd2FyZSBp
dCdzIHBvc3NpYmxlIHRoYXQgdGhlCj4gPj4+Pj4gdkNQVSByZXN1bWVzIGV4ZWN1dGlvbiB3aXRo
IGEgc3RhbGUgbG9jYWwgQVBJQyBJUlIgcmVnaXN0ZXIgYmVjYXVzZQo+ID4+Pj4+IGRlcGVuZGlu
ZyBvbiB0aGUgaW50ZXJydXB0cyB0byBiZSBpbmplY3RlZCB2bGFwaWNfaGFzX3BlbmRpbmdfaXJx
Cj4gPj4+Pj4gbWlnaHQgbm90IGJlIGNhbGxlZCwgYW5kIHRodXMgUElSIHdvbid0IGJlIHN5bmNl
ZCBpbnRvIElSUi4KPiA+Pj4+Pgo+ID4+Pj4+IEZpeCB0aGlzIGJ5IG1ha2luZyBzdXJlIFBJUiBp
cyBhbHdheXMgc3luY2VkIHRvIElSUiBpbiB2bXhfaW50cl9hc3Npc3QKPiA+Pj4+PiByZWdhcmRs
ZXNzIG9mIHdoYXQgaW50ZXJydXB0cyBhcmUgcGVuZGluZy4KPiA+Pj4+Cj4gPj4+PiBGb3IgdGhp
cyBwYXJ0LCBkaWQgeW91IGNvbnNpZGVyIHB1bGxpbmcgYWhlYWQgdG8gdGhlIGJlZ2lubmluZwo+
ID4+Pj4gb2YgaHZtX3ZjcHVfaGFzX3BlbmRpbmdfaXJxKCkgaXRzIGNhbGwgdG8gdmxhcGljX2hh
c19wZW5kaW5nX2lycSgpPwo+ID4+Pgo+ID4+PiBJIGFzc3VtZWQgdGhlIG9yZGVyIGluIGh2bV92
Y3B1X2hhc19wZW5kaW5nX2lycSBpcyB0aGVyZSBmb3IgYSByZWFzb24uCj4gPj4+IEkgY291bGQg
aW5kZWVkIG1vdmUgdmxhcGljX2hhc19wZW5kaW5nX2lycSB0byB0aGUgdG9wLCBidXQgdGhlbiBl
aXRoZXIKPiA+Pj4gdGhlIHJlc3VsdCBpcyBkaXNjYXJkZWQgaWYgZm9yIGV4YW1wbGUgYSBOTUkg
aXMgcGVuZGluZyBpbmplY3Rpb24KPiA+Pj4gKGluIHdoaWNoIGNhc2UgdGhlcmUncyBubyBuZWVk
IHRvIGdvIHRocm91Z2ggYWxsIHRoZSBsb2dpYyBpbgo+ID4+PiB2bGFwaWNfaGFzX3BlbmRpbmdf
aXJxKSwgb3Igd2UgaW52ZXJ0IHRoZSBwcmlvcml0eSBvZiBldmVudAo+ID4+PiBpbmplY3Rpb24u
Cj4gPj4KPiA+PiBDaGFuZ2luZyB0aGUgb3JkZXIgb2YgZXZlbnRzIGluamVjdGVkIGlzIG5vdCBh
biBvcHRpb24gYWZhaWN0LiBUaGUKPiA+PiBwb2ludGxlc3MgcHJvY2Vzc2luZyBkb25lIGlzIGEg
dmFsaWQgY29uY2VybiwgeWV0IHRoZSBzdWdnZXN0aW9uCj4gPj4gd2FzIHNwZWNpZmljYWxseSB0
byBoYXZlIChwYXJ0IG9mKSB0aGlzIHByb2Nlc3NpbmcgdG8gb2NjdXIgZWFybHkuCj4gPj4gVGhl
IGRpc2NhcmRpbmcgb2YgdGhlIHJlc3VsdCwgaW4gdHVybiwgaXMgbm90IGEgcHJvYmxlbSBhZmFp
Y3QsIGFzCj4gPj4gYSBzdWJzZXF1ZW50IGNhbGwgd2lsbCByZXR1cm4gdGhlIHNhbWUgcmVzdWx0
ICh1bmxlc3MgYSBoaWdoZXIKPiA+PiBwcmlvcml0eSBpbnRlcnJ1cHQgaGFzIHN1cmZhY2VkIGlu
IHRoZSBtZWFudGltZSkuCj4gPiAKPiA+IFllcywgdGhhdCdzIGZpbmUuIFNvIHlvdSB3b3VsZCBw
cmVmZXIgdG8gbW92ZSB0aGUgY2FsbCB0bwo+ID4gdmxhcGljX2hhc19wZW5kaW5nX2lycSBiZWZv
cmUgYW55IGV4aXQgcGF0aCBpbgo+ID4gaHZtX3ZjcHVfaGFzX3BlbmRpbmdfaXJxPwo+IAo+ICJQ
cmVmZXIiIGlzbid0IHJlYWxseSB0aGUgd2F5IEkgd291bGQgcHV0IGl0LiBJJ2QgbGlrZSB0aGlz
IHRvIGJlCj4gY29uc2lkZXJlZCBhcyBhbiBhbHRlcm5hdGl2ZSBiZWNhdXNlLCBhcyBzYWlkLCBJ
IHRoaW5rIHRoZSBjdXJyZW50Cj4gcGxhY2VtZW50IGxvb2sgbW9yZSBsaWtlIGEgcGxhc3RlciB0
aGFuIGEgY3VyZS4gSSdtIGFsc28gb3BlbiBmb3IKPiBvdGhlciBzdWdnZXN0aW9ucy4gQnV0IGZp
cnN0IG9mIGFsbCBJJ2QgbGlrZSB0byBzZWUgd2hhdCB0aGUgVk1YCj4gbWFpbnRhaW5lcnMgdGhp
bmsuCgpLZXZpbi9KdW4sIGNhbiB3ZSBwbGVhc2UgZ2V0IHlvdXIgb3BpbmlvbiBvbiB0aGUgYWJv
dmUgaXRlbT8KClRoYW5rcywgUm9nZXIuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
