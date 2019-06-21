Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E3E504E8E6
	for <lists+xen-devel@lfdr.de>; Fri, 21 Jun 2019 15:23:02 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1heJSH-0001Py-9N; Fri, 21 Jun 2019 13:19:49 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Mzu6=UU=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1heJSF-0001Pt-IH
 for xen-devel@lists.xenproject.org; Fri, 21 Jun 2019 13:19:47 +0000
X-Inumbo-ID: 3c3beace-9427-11e9-8427-6f33c6bb3796
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3c3beace-9427-11e9-8427-6f33c6bb3796;
 Fri, 21 Jun 2019 13:19:45 +0000 (UTC)
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: w2dzhTSk+7IxoczdNa6WhN+ZBu+4FiWzRVit3pw5UkADOylFqtcJ/PgibY5wmVANyDifimtjgc
 EtVZmg3bCq84zW59zY3t+/ogYzPxnLOVKm0kDbmarczUjasuttH9zbLy/OVUm2QWkMGW+0wTTc
 HE382hKpqXhMdqbAWWDQfA702oIHB41GNYT5iq9hfQDo6z7W2AO7TbRdbEx8M0Hhe8WBBZhhJQ
 Whzh4jlSWZTMXZXpjq9c46pslV7oviSWhIXtFo4n/7/HVtmcji3wYpEEkCV9xCFRUE7DY+2Wss
 VBE=
X-SBRS: 2.7
X-MesageID: 2069182
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,400,1557201600"; 
   d="scan'208";a="2069182"
To: Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
References: <5B6BF83602000078001DC548@prv1-mh.provo.novell.com>
 <5C8B7EC0020000780021F10B@prv1-mh.provo.novell.com>
 <5C8B8733020000780021F323@prv1-mh.provo.novell.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <27e0b6ee-5987-cc13-72e9-03a4f860ea6c@citrix.com>
Date: Fri, 21 Jun 2019 14:19:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <5C8B8733020000780021F323@prv1-mh.provo.novell.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH v8 46/50] x86emul: support GFNI insns
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
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, Wei Liu <wei.liu2@citrix.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTUvMDMvMjAxOSAxMTowNiwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gTm90ZSB0aGF0IHRoZSBJ
U0EgZXh0ZW5zaW9ucyBkb2N1bWVudCByZXZpc2lvbiAwMzUgaXMgYW1iaWd1b3VzCj4gcmVnYXJk
aW5nIGZhdWx0IHN1cHByZXNzaW9uIGZvciBWR0YyUDhNVUxCOiBUZXh0IHNheXMgaXQncyBzdXBw
b3J0ZWQsCj4gd2hpbGUgdGhlIGV4Y2VwdGlvbiBzcGVjaWZpY2F0aW9uIGxpc3RlZCBpcyBFNE5G
LiBHaXZlbiB0aGUgd29yZGluZyBoZXJlCj4gYW5kIGZvciB0aGUgb3RoZXIgdHdvIGluc25zIEkn
bSBpbmNsaW5lZCB0byB0cnVzdCB0aGUgdGV4dCBtb3JlIHRoYW4gdGhlCj4gZXhjZXB0aW9uIHJl
ZmVyZW5jZSwgd2hpY2ggd2FzIGFsc28gY29uZmlybWVkIGluZm9ybWFsbHkuCgpWZXJzaW9uIDAz
NyBoYXMgdGhlIGV4Y2VwdGlvbiByZWZlcmVuY2UgYXMgRTQgcmF0aGVyIHRoYW4gRTRORiwgc28g
SQp0aGluayB0aGlzIGVudGlyZSBwYXJhZ3JhcGggaXMgc3RhbGUgbm93IGFuZCBjYW4gYmUgZHJv
cHBlZC4KCihPbiBhIHRhbmdlbnQsIEFWWDUxMl9WUDJJTlRFUlNFQ1Qgbm93IGV4aXN0cyBpbiB0
aGUgZXh0ZW5zaW9ucyBkb2MuKQoKPiBBcyB0byB0aGUgZmVhdHVyZSBkZXBlbmRlbmN5IGFkanVz
dG1lbnQsIHdoaWxlIHN0cmljdGx5IHNwZWFraW5nIFNTRSBpcwo+IGEgc3VmZmljaWVudCBwcmVy
ZXEgKHRvIGhhdmUgWE1NIHJlZ2lzdGVycyksIHZlY3RvcnMgb2YgYnl0ZXMgYW5kIHF3b3Jkcwo+
IGhhdmUgZ290IGludHJvZHVjZWQgb25seSB3aXRoIFNTRTIuIGdjYywgZm9yIGV4YW1wbGUsIHVz
ZXMgYSBzaW1pbGFyCj4gY29ubmVjdGlvbiBpbiBpdHMgcmVzcGVjdGl2ZSBpbnRyaW5zaWNzIGhl
YWRlci4KClRoaXMgaXMgc3RhbGUgbm93IHRoYXQgeW91J3ZlIG1vdmVkIHRoZSBvdGhlciBpbnRl
Z2VyIGRlcGVuZGVuY2VzIHRvIFNTRTIuCgpGZWF0dXJlIHdpc2UsIEdGTkkgaXMgcmF0aGVyIGF3
a3dhcmQuwqAgVGhlIHNpbmdsZSBmZWF0dXJlIGJpdCBjb3ZlcnMKbGVnYWN5IFNTRSwgYW5kIFZF
WCBhbmQgRVZFWCBlbmNvZGluZ3MuwqAgVGhpcyBpcyBjbGVhcmx5IGEgYnJhbmQgbmV3CmZ1bmN0
aW9uYWwgYmxvY2sgaW4gdmVjdG9yIHBpcGVsaW5lIHdoaWNoIGhhcyBiZWVuIHdpcmVkIGludG8g
YWxsCmluc3RydWN0aW9uIHBhdGhzIChwcm9iYWJseSBiZWNhdXNlIHRoYXQgaXMgZWFzaWVyIHRo
YW4gdHJ5aW5nIHRvCmV4Y2x1ZGUgdGhlIGxlZ2FjeSBTU0UgcGFydCkuCgo+IEBAIC0xMzgsNiAr
MTQxLDI2IEBAIHN0YXRpYyBib29sIHNpbWRfY2hlY2tfYXZ4NTEydmJtaV92bCh2b2kKPiAgICAg
IHJldHVybiBjcHVfaGFzX2F2eDUxMl92Ym1pICYmIGNwdV9oYXNfYXZ4NTEydmw7Cj4gIH0KPiAg
Cj4gK3N0YXRpYyBib29sIHNpbWRfY2hlY2tfc3NlMl9nZih2b2lkKQo+ICt7Cj4gKyAgICByZXR1
cm4gY3B1X2hhc19nZm5pICYmIGNwdV9oYXNfc3NlMjsKClRoaXMgZGVwZW5kZW5jeSBkb2Vzbid0
IG1hdGNoIHRoZSBtYW51YWwuwqAgVGhlIGxlZ2FjeSBlbmNvZGluZyBuZWVkcwpHRk5JIGFsb25l
LgoKZ2VuLWNwdWlkLnB5IGlzIHRyeWluZyB0byByZWR1Y2UgdGhlIGFiaWxpdHkgdG8gY3JlYXRl
IHRvdGFsbHkKaW1wbGF1c2libGUgY29uZmlndXJhdGlvbnMgdmlhIGxldmVsbGluZywgYnV0IGZv
ciBzb2Z0d2FyZSBjaGVja3MsIHdlCnNob3VsZCBmb2xsb3cgdGhlIG1hbnVhbCB0byB0aGUgbGV0
dGVyLgoKPiArfQo+ICsKPiArc3RhdGljIGJvb2wgc2ltZF9jaGVja19hdngyX2dmKHZvaWQpCj4g
K3sKPiArICAgIHJldHVybiBjcHVfaGFzX2dmbmkgJiYgY3B1X2hhc19hdngyOwoKSGVyZSwgdGhl
IGRlcGVuZGVuY3kgaXMgb25seSBvbiBBVlgsIHdoaWNoIEkgdGhpbmsgaXMgcHJvYmFibHkgdHJ5
aW5nIHRvCmV4cHJlc3MgYSBkZXBlbmRlbmN5IG9uIHhjcjAueW1tCgo+ICt9Cj4gKwo+ICtzdGF0
aWMgYm9vbCBzaW1kX2NoZWNrX2F2eDUxMmJ3X2dmKHZvaWQpCj4gK3sKPiArICAgIHJldHVybiBj
cHVfaGFzX2dmbmkgJiYgY3B1X2hhc19hdng1MTJidzsKCkkgZG9uJ3Qgc2VlIGFueSBCVyBpbnRl
cmFjdGlvbiBhbnl3aGVyZSAoaW4gdGhlIG1hbnVhbCksIGRlc3BpdGUgdGhlCmZhY3QgaXQgb3Bl
cmF0ZXMgb24gYSBkYXRhdHlwZSBvZiBpbnQ4LgoKfkFuZHJldwoKPiArfQo+ICsKPiArc3RhdGlj
IGJvb2wgc2ltZF9jaGVja19hdng1MTJid19nZl92bCh2b2lkKQo+ICt7Cj4gKyAgICByZXR1cm4g
Y3B1X2hhc19nZm5pICYmIGNwdV9oYXNfYXZ4NTEydmw7Cj4gK30KPiArCj4gIHN0YXRpYyB2b2lk
IHNpbWRfc2V0X3JlZ3Moc3RydWN0IGNwdV91c2VyX3JlZ3MgKnJlZ3MpCj4gIHsKPiAgICAgIGlm
ICggY3B1X2hhc19tbXggKQo+CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
