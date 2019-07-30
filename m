Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 33A2E7A9EE
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jul 2019 15:44:13 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hsSOM-0004uI-TQ; Tue, 30 Jul 2019 13:42:14 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=x3jf=V3=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hsSOL-0004uB-GK
 for xen-devel@lists.xenproject.org; Tue, 30 Jul 2019 13:42:13 +0000
X-Inumbo-ID: d30f95ba-b2cf-11e9-8503-13d95dd5898c
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d30f95ba-b2cf-11e9-8503-13d95dd5898c;
 Tue, 30 Jul 2019 13:42:08 +0000 (UTC)
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: NgEYTSbNS0YXhFGtw89yDbMvog16/XEiPHodbN0cLr5ArIfNKisrGC1BPa+wtQ+BF+OIjT4tzF
 RtKoc5fItYuvmR0Wm7zK36JwJekH1IICFisWI76TBT7ck0UCXX0UUFuVC4ggSKVMOQ5l5cZK/z
 3UcRPpc33hS0MP0KIqx3UEK7b3+npM0tE75Z6Gmy3ozyJzc8/lGV51kydhNVcoes2St5aLwDWs
 zleu9SU2v6Jgh0rIjmypeCwPRupl4NHzUESJsSQI1KTE0XB1J2HxG66iI1rI+O/CdVM+BwrPoU
 L+k=
X-SBRS: 2.7
X-MesageID: 3722480
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,326,1559534400"; 
   d="scan'208";a="3722480"
To: Jan Beulich <JBeulich@suse.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
References: <b8ae110a-f94a-4ed2-5cf9-c00ff1c0cb81@suse.com>
 <019328c9-2727-6961-b33b-cb6d1387827c@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <974f714e-7866-d2e5-7517-5e28d01ba999@citrix.com>
Date: Tue, 30 Jul 2019 14:42:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <019328c9-2727-6961-b33b-cb6d1387827c@suse.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH v4 12/12] AMD/IOMMU: miscellaneous DTE
 handling adjustments
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
Cc: Brian Woods <brian.woods@amd.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjUvMDcvMjAxOSAxNDozMywgSmFuIEJldWxpY2ggd3JvdGU6Cj4gLS0tIGEveGVuL2luY2x1
ZGUvYXNtLXg4Ni9odm0vc3ZtL2FtZC1pb21tdS1kZWZzLmgKPiArKysgYi94ZW4vaW5jbHVkZS9h
c20teDg2L2h2bS9zdm0vYW1kLWlvbW11LWRlZnMuaAo+IEBAIC0xMDcsNTcgKzEwNyw2MCBAQAo+
ICAgI2RlZmluZSBJT01NVV9ERVZfVEFCTEVfSU5UX0NPTlRST0xfRk9SV0FSREVECTB4MQo+ICAg
I2RlZmluZSBJT01NVV9ERVZfVEFCTEVfSU5UX0NPTlRST0xfVFJBTlNMQVRFRAkweDIKPiAgIAo+
ICsvKiBGb3Igbm93IHdlIGFsd2F5cyBhbGxvY2F0ZSBtYXhpbXVtIHBvc3NpYmxlIGludGVycnVw
dCByZW1hcHBpbmcgdGFibGVzLiAqLwoKLyogRm9yIG5vdywgd2UgYWx3YXlzIGFsbG9jYXRlIHRo
ZSBtYXhpbXVtLsKgIDIwNDggcmVtYXAgZW50cmllcy4gKi8KCj8KCj4gKyNkZWZpbmUgSU9NTVVf
SU5UUkVNQVBfTEVOR1RICQkJMHhCCgpBbHNvLCBMRU5HVEggaXNuJ3QgYW4gYXBwcm9wcmlhdGUg
bmFtZS7CoCBUaGlzIGlzIGFjdHVhbGx5IHRoZSBvcmRlciBvZgp0aGUgbnVtYmVyIG9mIGVudHJp
ZXMuwqAgQXMgeW91J3JlIGFscmVhZHkgY2hhbmdpbmcgdGhlIG5hbWUsIGhvdyBhYm91dApzL0xF
TkdUSC9PUkRFUi8gaGVyZT/CoCBJZiBzbywgQWNrZWQtYnk6IEFuZHJldyBDb29wZXIKPGFuZHJl
dy5jb29wZXIzQGNpdHJpeC5jb20+CgpbTm90IHJlbGF0ZWQgdG8gdGhpcyBwYXRjaC4uLl0KCkl0
IGhhcyBhbHdheXMgb2NjdXJyZWQgdG8gbWUgdGhhdCB3ZSBhbGxvY2F0ZSBzaWxseSBxdWFudGl0
aWVzIG9mIG1lbW9yeQpmb3IgaW50ZXJydXB0IHJlbWFwcGluZyB0YWJsZXMuwqAgSWYgSSd2ZSBk
b25lIG15IHN1bXMgcmlnaHQsIGZvciBJbnRlbAp3ZSBhbGxvY2F0ZSA2NGsgZW50cmllcyBwZXIg
SU9NTVUgKDI1NmsgUkFNKSwgd2hlcmVhcyBmb3IgQU1EIHdlCmFsbG9jYXRlIDIwNDggZW50cmll
cyBwZXIgUENJIGZ1bmN0aW9uICgzMmsgUkFNLCBub3cgd2l0aCB0aGUgbGFyZ2VyCmZvcm1hdCku
CgpUaGUgbGFyZ2VzdCBJbnRlbCBzeXN0ZW0gSSd2ZSBlbmNvdW50ZXJlZCAoaW50ZXJydXB0IHdp
c2UpIGlzIGEgZmV3CnRob3VzYW5kIGludGVycnVwdHMsIHNwbGl0IGZhaXJseSBldmVubHkgYWNy
b3NzIHRoZSByb290LWNvbXBsZXggSU9NTVVzCih0aGUgUENIIElPTU1VIG5vdCwgYmVjYXVzZSBp
dHMgbW9zdGx5IGxlZ2FjeSBJTyBiZWhpbmQgdGhlcmUpLgoKRm9yIGluZGl2aWR1YWwgZnVuY3Rp
b25zLCBJIGhhdmUgbmV2ZXIgZW5jb3VudGVyZWQgYSBQQ0kgZnVuY3Rpb24gd2l0aAptb3JlIHRo
YW4gYSBkb3plbiBpbnRlcnJ1cHRzIG9yIHNvLCBzbyBJIHRoaW5rIGluIHByYWN0aWNlIHdlIGNh
biBnZXQKYXdheSB3aXRoIGFsbG9jYXRpbmcgYSA0ayAoMzIgZW50cnkpIGludGVycnVwdCByZW1h
cCB0YWJsZSBpbiBhbGwgY2FzZXMuCgpJdCB3b3VsZCBwcm9iYWJseSBtYWtlIHNlbnNlIHRvIGRl
ZmF1bHQgdG8gYWxsb2NhdGluZyBsZXNzIHNwYWNlLCBhbmQKcHJvdmlkaW5nIGEgY29tbWFuZCBs
aW5lIG9wdGlvbiB0byBhbGxvY2F0ZSBtYXguwqAgQWx0ZXJuYXRpdmVseSwgd2UKY291bGQgd29y
ayB0aGlzIG91dCBhcyB3ZSB3YWxrIHRoZSBQQ0kgdG9wb2xvZ3ksIGFzIGl0IGlzIGVuY29kZWQg
aW4Kc3RhbmRhcmRzIGNvbXBsaWFudCB3YXlzIGluIGNvbmZpZyBzcGFjZS4KCn5BbmRyZXcKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
