Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB972231CF
	for <lists+xen-devel@lfdr.de>; Mon, 20 May 2019 12:54:49 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hSfuL-0003Yk-Kl; Mon, 20 May 2019 10:52:41 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=EBqs=TU=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hSfuJ-0003YX-NG
 for xen-devel@lists.xenproject.org; Mon, 20 May 2019 10:52:39 +0000
X-Inumbo-ID: 6128c8be-7aed-11e9-b7ae-737848356648
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6128c8be-7aed-11e9-b7ae-737848356648;
 Mon, 20 May 2019 10:52:37 +0000 (UTC)
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=SoftFail smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@MIAPEX02MSOL01.citrite.net
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=23.29.105.83; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: SoftFail (esa1.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com is inclined to not designate
 23.29.105.83 as permitted sender) identity=mailfrom;
 client-ip=23.29.105.83; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 include:spf.citrix.com
 include:spf2.citrix.com include:ironport.citrix.com
 exists:%{i}._spf.mta.salesforce.com ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@MIAPEX02MSOL01.citrite.net) identity=helo;
 client-ip=23.29.105.83; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@MIAPEX02MSOL01.citrite.net";
 x-conformance=sidf_compatible
IronPort-SDR: QtfwoDpu03UvA/PyLK2GTckMU2sk4/mNTWqbAPPtlQSRsBkp6WNiGOV+r9+p3gk/9cSC6esJ7Z
 b3mmz7lwog3RgXnrWLlFYe3ZziU/RFBwxpUUZu6kooYtdo6CvAxQUkqjMFkZjV+42yTMH38j5I
 LXMXkYyN2YvNy4e3lz3KCo3C75luNQjtWixDAIwWt2kp0qz71HbC9XY5uSsZ6+FUG2ER0h5gUb
 c2P0qjs0G7jw80ZkbjArXQNu5G9XRkBnTL6sJqQRFflf6Wl0RhCrIHiFQaXcyDL/+c32u+7d2T
 5hk=
X-SBRS: 2.7
X-MesageID: 642245
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 23.29.105.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.60,491,1549947600"; 
   d="scan'208";a="642245"
To: <xen-devel@lists.xenproject.org>
References: <CAMctL7UVJm-5fhkX8oHvkUXUK5LsF0BPY44Y3HmuMx6MJXqVMA@mail.gmail.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <00520ca1-3a22-5956-e6f9-5fac4e8c3d9a@citrix.com>
Date: Mon, 20 May 2019 11:52:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAMctL7UVJm-5fhkX8oHvkUXUK5LsF0BPY44Y3HmuMx6MJXqVMA@mail.gmail.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] Registering interrupt handler for performance
 counter overflow
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTkvMDUvMjAxOSAxOTo0NiwgRWl0YW4gS2FwbGFuIHdyb3RlOgo+IEhpIGFsbCwKPgo+IEkg
YW0gYSBjb21wdXRlciBlbmdpbmVlcmluZyBzdHVkZW50IGF0IENvbHVtYmlhIFVuaXZlcnNpdHku
IFRoaXMgaXMgbXkKPiBmaXJzdCB0aW1lIHdyaXRpbmcgdG8gdGhpcyBsaXN0IChwbGVhc2UgbGV0
IG1lIGtub3cgaWYgdGhpcyBpc24ndCB0aGUKPiBwbGFjZSBmb3IgdGhpcyB0eXBlIG9mIHF1ZXN0
aW9uISkuCgpUaGlzIGlzIGluZGVlZCB0aGUgY29ycmVjdCBwbGFjZSBmb3IgdGhpcyBraW5kIG9m
IHF1ZXN0aW9uLgoKPgo+IEkgYW0gd29ya2luZyB3aXRoIGEgcHJvZmVzc29yIG9uIGEgcHJvamVj
dCB0byBtaXRpZ2F0ZSBTcGVjdHJlIGFuZAo+IE1lbHRkb3duIChhbmQgb3RoZXIgc2ltaWxhciBj
YWNoZSB0aW1pbmcgc2lkZS1jaGFubmVsIGF0dGFja3MpLsKgIFdlCj4gYXJlIHVzaW5nIFhlbiBh
bmQgbW9kaWZ5aW5nIGl0cyBzb3VyY2UgYXMgYSB3YXkgb2YgbW9kZWxpbmcgdGhlIGFmZmVjdAo+
IGNlcnRhaW4gcG90ZW50aWFsIGhhcmR3YXJlIGNoYW5nZXMuIEFzIHBhcnQgb2YgdGhhdCBwcm9q
ZWN0LCB3ZSBuZWVkCj4gdG8gdXNlIHRoZSBwZXJmb3JtYW5jZSBjb3VudGVycyB0byBnZW5lcmF0
ZSBpbnRlcnJ1cHRzIGF0IGNlcnRhaW4KPiBtaWNyb2FyY2hpdGVjdHVyYWwgZXZlbnRzLsKgIEkg
aGF2ZSBzdWNjZXNzZnVsbHkgYWRkZWQgaW50bwo+IHhlbi9hcmNoL3g4Ni9zZXR1cC5jIGEgZmV3
IGxpbmVzIHRvIHNldHVwIHRoZSAoSW50ZWwgU2FuZHkgQnJpZGdlKQo+IHBlcmZvcm1hbmNlIGNv
dW50ZXIgY29udHJvbCBNU1JzIGFuZCBzZXQgdGhlIGNvdW50ZXIgaXRzZWxmIHRvIGEgZmV3Cj4g
YmVsb3cgb3ZlcmZsb3cuwqAgQWxsIHRoYXQncyBtaXNzaW5nIGlzIGEgc2ltcGxlIGludGVycnVw
dCBoYW5kbGVyIHRoYXQKPiB3aWxsIHJlc2V0IHRoZSBjb3VudGVyIHRvIGEgZmV3IGJlbG93IG92
ZXJmbG93IChhbmQgcGVyaGFwcyBkbyBzb21lCj4gbG9nZ2luZykuCj4KPiBJIGFtIGhhdmluZyB0
cm91YmxlIGZpZ3VyaW5nIG91dCBob3cgdG8gcmVnaXN0ZXIgbXkgaGFuZGxlciBpbiBYZW4uwqAg
SQo+IGFzc3VtZSB0aGF0IEkgaGF2ZSB0byBjYWxsIHJlcXVlc3RfaXJxKCksIGJ1dCBJIGFtIG5v
dCBzdXJlIGhvdyB0byBzZXQKPiBhbGwgdGhlIGFyZ3VtZW50cyBmb3IgdGhhdCBjYWxsLsKgIFdv
dWxkIGFueW9uZSBiZSBhYmxlIHRvIGdpdmUgbWUgYW55Cj4gcG9pbnRlcnM/wqAgU3VnZ2VzdGlv
bnMgb3IgcG9pbnRlcnMgdG8gcmVzb3VyY2VzL2V4YW1wbGVzIGZvcgo+IHJlZ2lzdGVyaW5nIGlu
dGVycnVwdCBoYW5kbGVycyBpbiBYZW4gd291bGQgYmUgcmVhbGx5IGhlbHBmdWwhCj4KPiBBbHRl
cm5hdGl2ZWx5LCBpcyB0aGVyZSBhbiBleGlzdGluZyBpbnRlcnJ1cHQgaGFuZGxlciB0aGF0IGlz
IGFscmVhZHkKPiBzZXR1cCBmb3IgUE1DIG92ZXJmbG93IGludGVycnVwdHMgdGhhdCBJIG1pZ2h0
IGJlIGFibGUgdG8gdHdlYWs/CgpJbiB0aGUgWGVuIGNvZGUsIHRoZXJlIGFyZSB0d28gdXNlcyBw
ZXJmb3JtYW5jZSBjb3VudGVycy4KCk9uZSBpcyB0aGUgd2F0Y2hkb2cgKGNtZGxpbmUgIndhdGNo
ZG9nIiwgeGVuL2FyY2gveDg2L25taS5jKSB3aGljaCB1c2VzCnRoZSB1bmhhbHRlZCBjeWNsZXMg
Y291bnRlciB0byBnZW5lcmF0ZWQgYW4gTk1JIG9uIGEgcGVyaW9kaWMgYmFzaXMuwqAKU2VlIHNl
dHVwX2FwaWNfbm1pX3dhdGNoZG9nKCkgZm9yIHRoZSBzZXR1cCBkZXRhaWxzLgoKVGhlIHNlY29u
ZCBpcyB0aGUgdnBtdSBpbmZyYXN0cnVjdHVyZSAoY21kbGluZSAidnBtdSIKeGVuL2FyY2gveDg2
L2NwdS92cG11Kikgd2hpY2ggaXMgZm9yIHZpcnR1YWxpc2luZyB0aGUgcGVyZm9ybWFuY2UKY291
bnRlcnMgZm9yIGd1ZXN0IHVzZSwgYW5kIGlzIHByb2JhYmx5IGNsb3NlciB0byB3aGF0IHlvdSdy
ZSB3YW50aW5nLsKgCkluIHBhcnRpY3VsYXIsIHNlZSBob3cgUE1VX0FQSUNfVkVDVE9SIGlzIGNv
bmZpZ3VyZWQsIHdoaWNoIGluY2x1ZGVzIHRoZQppbnRlcnJ1cHQgcmVnaXN0cmF0aW9uIGFuZCBM
QVBJQyBwcm9ncmFtbWluZy4KCn5BbmRyZXcKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
