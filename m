Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 244E284B5C
	for <lists+xen-devel@lfdr.de>; Wed,  7 Aug 2019 14:27:35 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hvKzT-0006cm-IV; Wed, 07 Aug 2019 12:24:27 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=besu=WD=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hvKzR-0006cf-7S
 for xen-devel@lists.xenproject.org; Wed, 07 Aug 2019 12:24:25 +0000
X-Inumbo-ID: 4a024fff-b90e-11e9-8980-bc764e045a96
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 4a024fff-b90e-11e9-8980-bc764e045a96;
 Wed, 07 Aug 2019 12:24:23 +0000 (UTC)
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: FydnKu9Gc9QOZXrr+/jQ85oWuO5UMGDNL4MpL6AHwMM/rio42Q5LaxtvWfJuoQ9ZiXh0NrVhCi
 TtEn52xkYaqwWd7oXkUZSHF3i7VpDHPTolyeaG0cb4Ayhsxg6KzhyEznwqZq/qKLr6OrE6Kv12
 E2cpCZuXagOHzCYuSOxhUrejFCHfivrmZXEX3rvdE+xzMp+5fX89OvLJ8RE+CCLvR54zcVlLYS
 iQC4N7lskTLpt3SP/CjIRGyJKw7MLPM+HCTsr5blLhiO3TUPKsgPzKTukc8QEPL8WsphBr5Wah
 xAs=
X-SBRS: 2.7
X-MesageID: 3982351
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,357,1559534400"; 
   d="scan'208";a="3982351"
To: "Woodhouse, David" <dwmw@amazon.co.uk>, "Elnikety, Eslam"
 <elnikety@amazon.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
References: <20190807112024.19480-1-elnikety@amazon.com>
 <0aaa7b3b-fc94-d3fb-7afc-2f670511fea0@citrix.com>
 <48bf4b7991aa1bafb96dd30093e07593ce2b8d1f.camel@amazon.co.uk>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <2cde671d-c7ed-3062-bf69-01258bcc31c1@citrix.com>
Date: Wed, 7 Aug 2019 13:24:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <48bf4b7991aa1bafb96dd30093e07593ce2b8d1f.camel@amazon.co.uk>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH] evtchn: make support for different ABIs
 tunable
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
Cc: "sstabellini@kernel.org" <sstabellini@kernel.org>,
 "wl@xen.org" <wl@xen.org>, "konrad.wilk@oracle.com" <konrad.wilk@oracle.com>,
 "George.Dunlap@eu.citrix.com" <George.Dunlap@eu.citrix.com>,
 "tim@xen.org" <tim@xen.org>,
 "ian.jackson@eu.citrix.com" <ian.jackson@eu.citrix.com>,
 "julien.grall@arm.com" <julien.grall@arm.com>,
 "jbeulich@suse.com" <jbeulich@suse.com>,
 "anthony.perard@citrix.com" <anthony.perard@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDcvMDgvMjAxOSAxMzowNCwgV29vZGhvdXNlLCBEYXZpZCB3cm90ZToKPiBPbiBXZWQsIDIw
MTktMDgtMDcgYXQgMTI6NDAgKzAxMDAsIEFuZHJldyBDb29wZXIgd3JvdGU6Cj4+IE9uIDA3LzA4
LzIwMTkgMTI6MjAsIEVzbGFtIEVsbmlrZXR5IHdyb3RlOgo+Pj4gQWRkaW5nIHN1cHBvcnQgZm9y
IEZJRk8gZXZlbnQgY2hhbm5lbCBBQkkgd2FzIGZpcnN0IGludHJvZHVjZWQgaW4gWGVuIDQuNAo+
Pj4gKHNlZSA4ODkxMDA2MWVjNikuIE1ha2UgdGhpcyBzdXBwb3J0IHR1bmFibGUsIHNpbmNlIHRo
ZSBjaG9pY2Ugb2Ygd2hpY2gKPj4+IGV2ZW50IGNoYW5uZWwgQUJJIGhhcyBpbXBsaWNhdGlvbnMg
Zm9yIGhpYmVybmF0aW9uLiBDb25zaWRlciByZXN1bWluZyBhCj4+PiBwcmUgWGVuIDQuNCBoaWJl
cm5hdGVkIExpbnV4IGd1ZXN0LiBUaGUgZ3Vlc3QgYm9vdCBrZXJuZWwgZGVmYXVsdHMgdG8gRklG
Two+Pj4gQUJJLCB3aGVyZWFzIHRoZSByZXN1bWUga2VybmVsIGFzc3VtZXMgMkwuIFRoaXMsIGlu
IHR1cm4sIHJlc3VsdHMgaW4gWGVuCj4+PiBhbmQgdGhlIHJlc3VtZWQga2VybmVsIHRhbGtpbmcg
cGFzdCBlYWNoIG90aGVyIChkdWUgdG8gZGlmZmVyZW50IHByb3RvY29scwo+Pj4gRklGTyB2cyAy
TCkuCj4+IEknbSBhZnJhaWQgSSBkb24ndCBmb2xsb3cuCj4+Cj4+IFdlIGhhdmUgYSBMaW51eCBr
ZXJuZWwgd2hpY2gga25vd3MgYWJvdXQgRklGTywgd2hpY2ggd2FzIGZpcnN0IGJvb3RlZCBvbgo+
PiBYZW4gPCA0LjQsIHNvIGNvbmZpZ3VyZWQgMkwgbW9kZS4KPj4KPj4gSXQgaXMgdGhlbiBzdXNw
ZW5kZWQsIGFuZCByZXN1bWVkIG9uIGEgbmV3ZXIgWGVuID49IDQuNC4gIFRoZSBndWVzdCBub3cK
Pj4gaGFzIGEgY2hvaWNlIGJldHdlZW4gMkwgbW9kZSwgYW5kIEZJRk8gbW9kZS4KPj4KPj4gV2hh
dCBpcyB0aGUgcHJvYmxlbT8KPj4KPj4gV2hlbiByZXN1bWluZywgdGhlIGd1ZXN0IGluIHF1ZXN0
aW9uIHNob3VsZCBjb250aW51ZSB0byB1c2UgMkwgbW9kZSwKPj4gYmVjYXVzZSB0aGF0IGlzIHdo
YXQgaXQgd2FzIHVzaW5nIHByZXZpb3VzbHkuCj4gT24gcmVzdW1lLCB0aGUgZ3Vlc3QgZmlyc3Qg
Ym9vdHMgYSBMaW51eCBrZXJuZWwgKHRoZSAnYm9vdCcga2VybmVsKS4KPiBUaGF0IGtlcm5lbCB0
aGVuIGxvYWRzIHRoZSBwcmV2aW91cyBzdGF0ZSAodGhlICdyZXN1bWVkJyBrZXJuZWwpIGZyb20K
PiBkaXNrIGFuZCB0aGVuIHRyYW5zZmVycyBjb250cm9sIHRvIGl0LgoKUmlnaHQsIHNvIHRoZSAn
Ym9vdCcga2VybmVsIGlzIHNldHRpbmcgdXAgYSBtb2RlLCB3aGljaCB0aGUgb24tZGlzawprZXJu
ZWwvc3RhdGUgY2FuJ3QgY29wZSB3aXRoLgoKPiBJIGJlbGlldmUgdGhlIHByb2JsZW0gb2NjdXJz
IHdoZW4gdGhlIGJvb3Qga2VybmVsIHNlZXMgYW5kIGVuYWJsZXMgRklGTwo+IG1vZGUsIHRoZW4g
dHJhbnNmZXJzIGNvbnRyb2wgdG8gdGhlIHJlc3VtZWQga2VybmVsIHdoaWNoIGlzIGV4cGVjdGlu
Zwo+IDJMLgoKQW5kIEkgcHJlc3VtZSB0aGUgdW5kZXJseWluZyBtZXNzIGhlcmUgaXMgYmVjYXVz
ZSB2aXJ0dWFsIHN1YnN5c3RlbXMKYXJlbid0IHNhdmVkL3Jlc3RvcmVkIGxpa2UgbW9zdCBvdGhl
ciBkZXZpY2VzPwoKVWx0aW1hdGVseSwgdGhpcyBsb29rcyBsaWtlIGEgTGludXggYnVnLCBidXQg
aW4gdGhlIHByaW5jaXBsZSBvZiAidGhlCnZpcnR1YWwgZW52aXJvbm1lbnQgYSBndWVzdCBzZWVz
IHNob3VsZCBiZSBjb25zdGFudCBmb3IgaXRzIGxvZ2ljYWwKbGlmZXRpbWUiLCByZXN0cmljdGlu
ZyB0aGUgdmlzaWJsZSBBQkkgcHJvYmFibHkgaXMgcmlnaHQgdGhpbmcgdG8gZG8uCgp+QW5kcmV3
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
