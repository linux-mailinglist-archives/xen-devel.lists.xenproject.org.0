Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 25CB6EE085
	for <lists+xen-devel@lfdr.de>; Mon,  4 Nov 2019 13:57:44 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iRbsL-0001Rc-2I; Mon, 04 Nov 2019 12:54:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=M3pU=Y4=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iRbsK-0001RX-1A
 for xen-devel@lists.xenproject.org; Mon, 04 Nov 2019 12:54:28 +0000
X-Inumbo-ID: 3ac6eaaf-ff02-11e9-a177-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3ac6eaaf-ff02-11e9-a177-12813bfff9fa;
 Mon, 04 Nov 2019 12:54:26 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 75790ABE9;
 Mon,  4 Nov 2019 12:54:25 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <1e714166-ffeb-06a1-9caf-412eb040ac5a@suse.com>
 <005a7254-aae8-ec7c-6e65-9dfe06803208@suse.com>
 <6e358e65-2efe-9e4c-01e9-d9e317c6dfbc@amazon.com>
 <6b27b379-f996-4b33-bf24-178bec5ff6b9@citrix.com>
 <d002b40f-1316-a968-4860-186db54bb07f@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <51356dc2-abac-da21-f656-01cc53b27bae@suse.com>
Date: Mon, 4 Nov 2019 13:54:30 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <d002b40f-1316-a968-4860-186db54bb07f@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 2/2] x86: explicitly disallow guest access
 to PPIN
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
Cc: xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDEuMTEuMjAxOSAxOTo0OSwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAwMS8xMS8yMDE5
IDE0OjI5LCBBbmRyZXcgQ29vcGVyIHdyb3RlOgo+PiBPbiAwMS8xMS8yMDE5IDE0OjAwLCBFc2xh
bSBFbG5pa2V0eSB3cm90ZToKPj4+IFRoYW5rcyBmb3IgdGhpcyBzZXJpZXMsIEphbi4KPj4+Cj4+
PiBPbiAzMC4xMC4xOSAxMTozOSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gVG8gZnVsZmlsbCB0
aGUgInByb3RlY3RlZCIgaW4gaXRzIG5hbWUsIGRvbid0IGxldCB0aGUgcmVhbCBoYXJkd2FyZQo+
Pj4+IHZhbHVlcyAic2hpbmUgdGhyb3VnaCIuIFJlcG9ydCBhIGNvbnRyb2wgcmVnaXN0ZXIgdmFs
dWUgZXhwcmVzc2luZyB0aGlzLgo+Pj4+Cj4+Pj4gU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2gg
PGpiZXVsaWNoQHN1c2UuY29tPgo+Pj4+IC0tLQo+Pj4+IFRCRDogRG8gd2Ugd2FudCB0byBwZXJt
aXQgRG9tMCBhY2Nlc3M/Cj4+PiBJdCB3b3VsZCBiZSBuaWNlIHRvIGdpdmUgYW4gYWRtaW5pc3Ry
YXRvciBhIHdheSB0byBnZXQgUFBJTiBvdXRzaWRlCj4+PiB0aGUgY29udGV4dCBvZiBhbiBNQ0Ug
d2hlbiBuZWVkZWQuCj4+IEkgc3VwcG9zZSB0aGlzIGlzIGEgcmVhc29uYWJsZSByZXF1ZXN0LsKg
IFdlIHNob3VsZCBleHBvc2UgaXQgdG8gdGhlCj4+IGhhcmR3YXJlIGRvbWFpbi4KPiAKPiBBY3R1
YWxseSBvbiBmdXJ0aGVyIHRob3VnaHRzLCBJJ20gZ29pbmcgdG8gYmFja3RyYWNrIHNsaWdodGx5
Lgo+IAo+IEl0IGlzIHJlYXNvbmFibGUgdG8gZ2l2ZSB0byBkb20wLCBidXQgaXQgaXMgbm90IHJl
YXNvbmFibGUgdG8gcHJvdmlkZSBpdAo+IGJ5IGVtdWxhdGluZyB0aGUgTVNSIGludGVyZmFjZS7C
oCBUaGUgcHJvYmxlbSBpcyB0aGF0IGRvbTAncyByZXN1bHQgaXMKPiBzZW5zaXRpdmUgdG8gd2hl
cmUgaXQgaGFwcGVucyB0byBiZSBzY2hlZHVsZWQuCj4gCj4gVGhlIG9ubHkgc2FuZSB3YXkgb2Yg
bGV0dGluZyBkb20wIGhhdmUgYWNjZXNzIGlzIHZpYSBhIGh5cGVyY2FsbCB3aGljaAo+IHJldHVy
bnMgIm5vIFBQSU4iIG9yIGFsbCBzb2NrZXRzIGluZm9ybWF0aW9uIGluIG9uZSBnbywgaXJyZXNw
ZWN0aXZlIG9mCj4gd2hpY2ggc29ja2V0IHRoZSBjdXJyZW50IHZjcHUgaGFwcGVucyB0byBiZSBl
eGVjdXRpbmcgb24uCj4gCj4gVGhpcyBsZWF2ZXMgdXMgYmFjayBpbiB0aGUgKHN1YnN0YW50aWFs
bHkgZWFzaWVyKSBwb3NpdGlvbiBvZiBub3QgaGF2aW5nCj4gdG8gdmlydHVhbGlzZSB0aGUgTVNS
IGludGVyZmFjZSB0byBiZWdpbiB3aXRoLgoKUmlnaHQsIGhlbmNlIG15IHF1ZXN0aW9uIHdoZXRo
ZXIgdG8gbWFrZSB0aGlzIGEgbmV3IHN5c2N0bCBzdWJvcCwKb3Igd2hldGhlciB0byBwZXJtaXQg
cmVhZGluZyBvZiB0aGlzIG9uZSBNU1IgdmlhIFhFTlBGX3Jlc291cmNlX29wCihvciB5ZXQgc29t
ZSBvdGhlciBtZWNoYW5pc20pLiBQZXJzb25hbGx5IEknZCBnbyB0aGUKWEVOUEZfcmVzb3VyY2Vf
b3Agcm91dGUuCgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
