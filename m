Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 779F810CA35
	for <lists+xen-devel@lfdr.de>; Thu, 28 Nov 2019 15:16:28 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iaKYA-00059K-Os; Thu, 28 Nov 2019 14:13:42 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=zRhs=ZU=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1iaKY9-00059F-KM
 for xen-devel@lists.xenproject.org; Thu, 28 Nov 2019 14:13:41 +0000
X-Inumbo-ID: 440572a8-11e9-11ea-a3d2-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 440572a8-11e9-11ea-a3d2-12813bfff9fa;
 Thu, 28 Nov 2019 14:13:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1574950415;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=IF32TDtgftahAmvny7L8md/BsxuoGwLEahEIIepIDGs=;
 b=WRv5TMgpyQnZevcPr/zorsh2O8LEj6u4cj6GzK1iPE6mmPkPcYOEAXxI
 DdczbtMQNXO7fM9mcyWqQKDeecNrgoPARhKG9VWY0GdYsIZ2rTaHy/IyJ
 JbDeuo+GcGnhKFpzD1LdUS0IrZ0IAhyAsFbo+Xh1sPfCsZoOD1mc+yQ0P U=;
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: ZUs9suK8GuHBbXFf4na97YbJnHz7E9dqBv9Bi9laFdAjb+7+u1VpCM+rHkK08gBtZpVVFTT/0o
 A2f9g6vgbrDm4vEkypH+Sqk4w4/L95N041kab1d29Gsgik23x/kEfVlGn20YifzY7/sVHywvQ7
 I1x5DVlDKTk+chwpgRuUUZcqUf8XmE5KjdvlweSYrGzvtd3wKAOTttEaJ36zSPFDpPNEMgVh1c
 kq3+tnqMus7fNKGWt0oLN+RgNoQbNIeHoZbDoOr0YDLGHyMPR7D6oYvxdFalhZZinXm8gu65DK
 yLc=
X-SBRS: 2.7
X-MesageID: 9367318
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,253,1571716800"; 
   d="scan'208";a="9367318"
Date: Thu, 28 Nov 2019 15:13:28 +0100
From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20191128141328.GV980@Air-de-Roger>
References: <7f82e319-1891-ec36-dcf0-e94253ba04a5@suse.com>
 <20191128113904.GU980@Air-de-Roger>
 <ca1d09ba-9cf3-346a-2b26-ae08d20f9133@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ca1d09ba-9cf3-346a-2b26-ae08d20f9133@suse.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH] x86/IRQ: make internally used IRQs also
 honor the pending EOI stack
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
Cc: Juergen Gross <jgross@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Kevin Tian <kevin.tian@intel.com>, Wei Liu <wl@xen.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBOb3YgMjgsIDIwMTkgYXQgMDI6MzM6MDhQTSArMDEwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gT24gMjguMTEuMjAxOSAxMjozOSwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPiA+IE9u
IFRodSwgTm92IDI4LCAyMDE5IGF0IDEyOjAzOjQ3UE0gKzAxMDAsIEphbiBCZXVsaWNoIHdyb3Rl
Ogo+ID4+IEF0IHRoZSB0aW1lIHRoZSBwZW5kaW5nIEVPSSBzdGFjayB3YXMgaW50cm9kdWNlZCB0
aGVyZSB3ZXJlIG5vCj4gPj4gaW50ZXJuYWxseSB1c2VkIElSUXMgd2hpY2ggd291bGQgaGF2ZSB0
aGUgTEFQSUMgRU9JIGlzc3VlZCBmcm9tIHRoZQo+ID4+IC0+ZW5kKCkgaG9vay4gVGhpcyBoYWQg
dGhlbiBjaGFuZ2VkIHdpdGggdGhlIGludHJvZHVjdGlvbiBvZiBJT01NVXMsCj4gPj4gYnV0IHRo
ZSBpbnRlcmFjdGlvbiBpc3N1ZSB3YXMgcHJlc3VtYWJseSBtYXNrZWQgYnkKPiA+PiBpcnFfZ3Vl
c3RfZW9pX3RpbWVyX2ZuKCkgZnJlcXVlbnRseSBFT0ktaW5nIGludGVycnVwdHMgd2F5IHRvbyBl
YXJseQo+ID4+ICh3aGljaCBnb3QgZml4ZWQgYnkgMzU5Y2Y2ZjhhMGVjIFsieDg2L0lSUTogZG9u
J3Qga2VlcCBFT0kgdGltZXIKPiA+PiBydW5uaW5nIHdpdGhvdXQgbmVlZCJdKS4KPiA+Pgo+ID4+
IFRoZSBwcm9ibGVtIGlzIHRoYXQgd2l0aCB1cyByZS1lbmFibGluZyBpbnRlcnJ1cHRzIGFjcm9z
cyBoYW5kbGVyCj4gPj4gaW52b2NhdGlvbiwgYSBoaWdoZXIgcHJpb3JpdHkgKGd1ZXN0KSBpbnRl
cnJ1cHQgbWF5IHRyaWdnZXIgd2hpbGUKPiA+PiBoYW5kbGluZyBhIGxvd2VyIHByaW9yaXR5IChp
bnRlcm5hbCkgb25lLiBUaGUgRU9JIGlzc3VlZCBmcm9tCj4gPj4gLT5lbmQoKSAoZm9yIEFDS1RZ
UEVfRU9JIGtpbmQgaW50ZXJydXB0cykgd291bGQgdGhlbiBtaXN0YWtlbmx5Cj4gPj4gRU9JIHRo
ZSBoaWdoZXIgcHJpb3JpdHkgKGd1ZXN0KSBpbnRlcnJ1cHQsIGJyZWFraW5nIChhbW9uZyBvdGhl
cgo+ID4+IHRoaW5ncykgcGVuZGluZyBFT0kgc3RhY2sgbG9naWMncyBhc3N1bXB0aW9ucy4KPiA+
IAo+ID4gTWF5YmUgdGhlcmUncyBzb21ldGhpbmcgdGhhdCBJJ20gbWlzc2luZywgYnV0IHNob3Vs
ZG4ndCBoeXBlcnZpc29yCj4gPiB2ZWN0b3JzIGFsd2F5cyBiZSBoaWdoZXIgcHJpb3JpdHkgdGhh
biBndWVzdCBvbmVzPwo+IAo+IERlcGVuZHMgLSBJT01NVSBvbmVzIGltbyBhcmVuJ3Qgc29tZXRo
aW5nIHRoYXQgbmVlZHMgdXJnZW50bHkKPiBkZWFsaW5nIHdpdGgsIHNvIGEgbGl0dGxlIGJpdCBv
ZiBkZWxheSB3b24ndCBodXJ0LiBUaGVyZSB3b3VsZAo+IG9ubHkgYmUgYSBwcm9ibGVtIGlmIHN1
Y2ggaW50ZXJydXB0cyBjb3VsZCBiZSBkZWZlcnJlZAo+IGluZGVmaW5pdGVseS4KPiAKPiA+IEkg
c2VlIHRoZXJlJ3MgYWxyZWFkeSBhIHJhbmdlIHJlc2VydmVkIGZvciBoaWdoIHByaW9yaXR5IHZl
Y3RvcnMKPiA+ICh7RklSU1QvTEFTVH1fSElQUklPUklUWV9WRUNUT1IpLCB3aGF0J3MgdGhlIHJl
YXNvbiBmb3IgaHlwZXJ2aXNvcgo+ID4gaW50ZXJydXB0cyBub3QgdXNpbmcgdGhpcyByYW5nZT8K
PiAKPiBXZSdkIHF1aWNrbHkgcnVuIG91dCBvZiBoaWdoIHByaW9yaXR5IHZlY3RvcnMgb24gc3lz
dGVtcyB3aXRoCj4gbXVsdGlwbGUgKGFuZCBwZXJoYXBzIGluZGVlZCBtYW55KSBJT01NVXMuCgpX
ZWxsLCB0aGVyZSdzIG5vIGxpbWl0IG9uIHRoZSBudW1iZXIgb2YgaGlnaCBwcmlvcml0eSB2ZWN0
b3JzLCBzaW5jZQp0aGlzIGlzIGFsbCBhIHNvZnR3YXJlIGFic3RyYWN0aW9uLiBJdCBvbmx5IG1h
dHRlcnMgdGhhdCBzdWNoIHZlY3RvcnMKYXJlIGhpZ2hlciB0aGFuIGd1ZXN0IG93bmVkIG9uZXMu
CgpJIGhhdmUgdG8gdGFrZSBhIGxvb2ssIGJ1dCBJIHdvdWxkIHRoaW5rIHRoYXQgWGVuIHVzZWQg
dmVjdG9ycyBhcmUgdGhlCmZpcnN0IG9uZXMgdG8gYmUgYWxsb2NhdGVkLCBhbmQgaGVuY2UgY291
bGQgc3RhcnQgZnJvbQpGSVJTVF9ISVBSSU9SSVRZX1ZFQ1RPUiAtIDEgYW5kIGdvIGRvd24gZnJv
bSB0aGVyZS4gVGhpcyB3YXkgd2Ugd2lsbAplbmQgdXAgd2l0aCBoaWdoIHByaW9yaXR5IHZlY3Rv
cnMgZmlyc3QsIFhlbiB1c2VkIHZlY3RvcnMsIGFuZApmaW5hbGx5IGd1ZXN0IHZlY3RvcnMuCgpU
aGFua3MsIFJvZ2VyLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
