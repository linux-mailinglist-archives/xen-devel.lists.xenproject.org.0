Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F38410CA66
	for <lists+xen-devel@lfdr.de>; Thu, 28 Nov 2019 15:32:13 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iaKoK-0007Bp-KZ; Thu, 28 Nov 2019 14:30:24 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=zRhs=ZU=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1iaKoI-0007Bj-PM
 for xen-devel@lists.xenproject.org; Thu, 28 Nov 2019 14:30:22 +0000
X-Inumbo-ID: 9b978f2c-11eb-11ea-a3d2-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9b978f2c-11eb-11ea-a3d2-12813bfff9fa;
 Thu, 28 Nov 2019 14:30:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1574951421;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=it2AJc5/UoM1Y0p3slnAjGErnC8ccSS5zbvhwHcZ5Zw=;
 b=YPFFT8ruIgkQNfbt9KvDYwZ1XcghEb3obzeL827bkDW8p9ZneumYqgot
 FLVGmWBAGz5dJSdFyNkLd0K11oySubjZL95Yei2/wpmdeV23SDe9hUw6m
 UyKE/eCeP7z+y5Z/gIBnb7XLLnJzkxfExuPHFJCcwKLUXU5IKWs5wG3ZD I=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: IV8572cSZpT321uVLTcbex4seF31uwsevcF6RhFsvbCxGon4iomERAvFHhtgseazvGqsH0wFge
 rwrZNRS80V1o2aY2KGVggCGASuLDpwOPBa5BBejGjUXv/v67UquDUtfCd/hBq2nEZ+W0N9XdYg
 u9qvZxC2uARSIhhvft5egbyGP/qDookQnhMLlPkyX7QcnK0XBB5mkViOGrsD6zRPi12jXDIoSz
 fVkLXWFefATkLe7uxhYhQpwafto8DUPBEPLRJttoW+I07OMJ+VHxwvfJipC6auk6YpRHS70uZZ
 z7g=
X-SBRS: 2.7
X-MesageID: 9312684
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,253,1571716800"; 
   d="scan'208";a="9312684"
Date: Thu, 28 Nov 2019 15:30:12 +0100
From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20191128143012.GW980@Air-de-Roger>
References: <7f82e319-1891-ec36-dcf0-e94253ba04a5@suse.com>
 <20191128113904.GU980@Air-de-Roger>
 <ca1d09ba-9cf3-346a-2b26-ae08d20f9133@suse.com>
 <20191128141328.GV980@Air-de-Roger>
 <c949cacc-5ba7-d93f-7e08-f49c528431b0@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c949cacc-5ba7-d93f-7e08-f49c528431b0@suse.com>
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
Cc: Juergen Gross <jgross@suse.com>, AndrewCooper <andrew.cooper3@citrix.com>,
 Kevin Tian <kevin.tian@intel.com>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBOb3YgMjgsIDIwMTkgYXQgMDM6MTk6NTBQTSArMDEwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gT24gMjguMTEuMjAxOSAxNToxMywgUm9nZXIgUGF1IE1vbm7DqSAgd3JvdGU6Cj4gPiBP
biBUaHUsIE5vdiAyOCwgMjAxOSBhdCAwMjozMzowOFBNICswMTAwLCBKYW4gQmV1bGljaCB3cm90
ZToKPiA+PiBPbiAyOC4xMS4yMDE5IDEyOjM5LCBSb2dlciBQYXUgTW9ubsOpIHdyb3RlOgo+ID4+
PiBPbiBUaHUsIE5vdiAyOCwgMjAxOSBhdCAxMjowMzo0N1BNICswMTAwLCBKYW4gQmV1bGljaCB3
cm90ZToKPiA+Pj4+IEF0IHRoZSB0aW1lIHRoZSBwZW5kaW5nIEVPSSBzdGFjayB3YXMgaW50cm9k
dWNlZCB0aGVyZSB3ZXJlIG5vCj4gPj4+PiBpbnRlcm5hbGx5IHVzZWQgSVJRcyB3aGljaCB3b3Vs
ZCBoYXZlIHRoZSBMQVBJQyBFT0kgaXNzdWVkIGZyb20gdGhlCj4gPj4+PiAtPmVuZCgpIGhvb2su
IFRoaXMgaGFkIHRoZW4gY2hhbmdlZCB3aXRoIHRoZSBpbnRyb2R1Y3Rpb24gb2YgSU9NTVVzLAo+
ID4+Pj4gYnV0IHRoZSBpbnRlcmFjdGlvbiBpc3N1ZSB3YXMgcHJlc3VtYWJseSBtYXNrZWQgYnkK
PiA+Pj4+IGlycV9ndWVzdF9lb2lfdGltZXJfZm4oKSBmcmVxdWVudGx5IEVPSS1pbmcgaW50ZXJy
dXB0cyB3YXkgdG9vIGVhcmx5Cj4gPj4+PiAod2hpY2ggZ290IGZpeGVkIGJ5IDM1OWNmNmY4YTBl
YyBbIng4Ni9JUlE6IGRvbid0IGtlZXAgRU9JIHRpbWVyCj4gPj4+PiBydW5uaW5nIHdpdGhvdXQg
bmVlZCJdKS4KPiA+Pj4+Cj4gPj4+PiBUaGUgcHJvYmxlbSBpcyB0aGF0IHdpdGggdXMgcmUtZW5h
YmxpbmcgaW50ZXJydXB0cyBhY3Jvc3MgaGFuZGxlcgo+ID4+Pj4gaW52b2NhdGlvbiwgYSBoaWdo
ZXIgcHJpb3JpdHkgKGd1ZXN0KSBpbnRlcnJ1cHQgbWF5IHRyaWdnZXIgd2hpbGUKPiA+Pj4+IGhh
bmRsaW5nIGEgbG93ZXIgcHJpb3JpdHkgKGludGVybmFsKSBvbmUuIFRoZSBFT0kgaXNzdWVkIGZy
b20KPiA+Pj4+IC0+ZW5kKCkgKGZvciBBQ0tUWVBFX0VPSSBraW5kIGludGVycnVwdHMpIHdvdWxk
IHRoZW4gbWlzdGFrZW5seQo+ID4+Pj4gRU9JIHRoZSBoaWdoZXIgcHJpb3JpdHkgKGd1ZXN0KSBp
bnRlcnJ1cHQsIGJyZWFraW5nIChhbW9uZyBvdGhlcgo+ID4+Pj4gdGhpbmdzKSBwZW5kaW5nIEVP
SSBzdGFjayBsb2dpYydzIGFzc3VtcHRpb25zLgo+ID4+Pgo+ID4+PiBNYXliZSB0aGVyZSdzIHNv
bWV0aGluZyB0aGF0IEknbSBtaXNzaW5nLCBidXQgc2hvdWxkbid0IGh5cGVydmlzb3IKPiA+Pj4g
dmVjdG9ycyBhbHdheXMgYmUgaGlnaGVyIHByaW9yaXR5IHRoYW4gZ3Vlc3Qgb25lcz8KPiA+Pgo+
ID4+IERlcGVuZHMgLSBJT01NVSBvbmVzIGltbyBhcmVuJ3Qgc29tZXRoaW5nIHRoYXQgbmVlZHMg
dXJnZW50bHkKPiA+PiBkZWFsaW5nIHdpdGgsIHNvIGEgbGl0dGxlIGJpdCBvZiBkZWxheSB3b24n
dCBodXJ0LiBUaGVyZSB3b3VsZAo+ID4+IG9ubHkgYmUgYSBwcm9ibGVtIGlmIHN1Y2ggaW50ZXJy
dXB0cyBjb3VsZCBiZSBkZWZlcnJlZAo+ID4+IGluZGVmaW5pdGVseS4KPiA+Pgo+ID4+PiBJIHNl
ZSB0aGVyZSdzIGFscmVhZHkgYSByYW5nZSByZXNlcnZlZCBmb3IgaGlnaCBwcmlvcml0eSB2ZWN0
b3JzCj4gPj4+ICh7RklSU1QvTEFTVH1fSElQUklPUklUWV9WRUNUT1IpLCB3aGF0J3MgdGhlIHJl
YXNvbiBmb3IgaHlwZXJ2aXNvcgo+ID4+PiBpbnRlcnJ1cHRzIG5vdCB1c2luZyB0aGlzIHJhbmdl
Pwo+ID4+Cj4gPj4gV2UnZCBxdWlja2x5IHJ1biBvdXQgb2YgaGlnaCBwcmlvcml0eSB2ZWN0b3Jz
IG9uIHN5c3RlbXMgd2l0aAo+ID4+IG11bHRpcGxlIChhbmQgcGVyaGFwcyBpbmRlZWQgbWFueSkg
SU9NTVVzLgo+ID4gCj4gPiBXZWxsLCB0aGVyZSdzIG5vIGxpbWl0IG9uIHRoZSBudW1iZXIgb2Yg
aGlnaCBwcmlvcml0eSB2ZWN0b3JzLCBzaW5jZQo+ID4gdGhpcyBpcyBhbGwgYSBzb2Z0d2FyZSBh
YnN0cmFjdGlvbi4gSXQgb25seSBtYXR0ZXJzIHRoYXQgc3VjaCB2ZWN0b3JzCj4gPiBhcmUgaGln
aGVyIHRoYW4gZ3Vlc3Qgb3duZWQgb25lcy4KPiA+IAo+ID4gSSBoYXZlIHRvIHRha2UgYSBsb29r
LCBidXQgSSB3b3VsZCB0aGluayB0aGF0IFhlbiB1c2VkIHZlY3RvcnMgYXJlIHRoZQo+ID4gZmly
c3Qgb25lcyB0byBiZSBhbGxvY2F0ZWQsIGFuZCBoZW5jZSBjb3VsZCBzdGFydCBmcm9tCj4gPiBG
SVJTVF9ISVBSSU9SSVRZX1ZFQ1RPUiAtIDEgYW5kIGdvIGRvd24gZnJvbSB0aGVyZS4KPiAKPiBJ
ZiB0aGlzIHdhcyB0aGUgY2FzZSwgdGhlbiB3ZSB3b3VsZG4ndCBoYXZlIG9ic2VydmVkIHRoZSBp
c3N1ZSAoZGVzcGl0ZQo+IGl0IGJlaW5nIHRoZXJlKSB0aGlzIHBhdGNoIHRyaWVzIHRvIGFkZHJl
c3MuIFRoZSBJT01NVXMgZm9yIGJvdGggQW5kcmV3Cj4gYW5kIG1lIGVuZGVkIHVwIHVzaW5nIHZl
Y3RvciAweDI4LCBiZWxvdyBldmVyeXRoaW5nIHRoYXQgZS5nLiB0aGUKPiBJTy1BUElDIFJURSBn
b3QgYXNzaWduZWQuCgpJIGtub3cgaXQncyBub3QgbGlrZSB0aGF0IEFUTSwgYW5kIGhlbmNlIEkg
d29uZGVyIHdoZXRoZXIgaXQgd291bGQgYmUKcG9zc2libGUgdG8gbWFrZSBpdCBzbzogWGVuIHZl
Y3RvcnMgZ2V0IGFsbG9jYXRlZCBkb3duIGZyb20KRklSU1RfSElQUklPUklUWV9WRUNUT1IgLSAx
IGFuZCB0aGVuIHdlIHdvbid0IGhhdmUgdGhpcyBpc3N1ZS4KCj4gQWxzbyBkb24ndCBmb3JnZXQg
dGhhdCB3ZSBkb24ndCBhbGxvY2F0ZQo+IHZlY3RvcnMgY29udGludW91c2x5LCBidXQgc3VjaCB0
aGF0IHRoZXknZCBnZXQgc3ByZWFkIGFjcm9zcyB0aGUKPiBkaWZmZXJlbnQgcHJpb3JpdHkgbGV2
ZWxzLiAoV2hldGhlciB0aGF0J3MgYW4gYXdmdWxseSBnb29kIGlkZWEgaXMgYQo+IHNlcGFyYXRl
IHF1ZXN0aW9uLikKCldlbGwsIHZlY3RvcnMgdXNlZCBieSBYZW4gd291bGQgYmUgYWxsb2NhdGVk
IGRvd253YXJkcyBjb250aW51b3VzbHkKZnJvbSBGSVJTVF9ISVBSSU9SSVRZX1ZFQ1RPUiAtIDEs
IGFuZCBoZW5jZSB3b24ndCBiZSBzcHJlYWQuCgpHdWVzdCB1c2VkIHZlY3RvcnMgY291bGQgY29u
dGludWUgdG8gdXNlIHRoZSBzYW1lIGFsbG9jYXRpb24KbWVjaGFuaXNtLCBzaW5jZSB0aGF0J3Mg
YSBkaWZmZXJlbnQgaXNzdWUuCgpUaGFua3MsIFJvZ2VyLgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
