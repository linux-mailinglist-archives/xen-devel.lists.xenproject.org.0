Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F401614259C
	for <lists+xen-devel@lfdr.de>; Mon, 20 Jan 2020 09:35:15 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1itSUS-0005RV-Bf; Mon, 20 Jan 2020 08:32:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=xaUo=3J=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1itSUQ-0005RQ-SX
 for xen-devel@lists.xenproject.org; Mon, 20 Jan 2020 08:32:54 +0000
X-Inumbo-ID: 6e8d8ee4-3b5f-11ea-b833-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6e8d8ee4-3b5f-11ea-b833-bc764e2007e4;
 Mon, 20 Jan 2020 08:32:45 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 45AB0B1EB;
 Mon, 20 Jan 2020 08:32:44 +0000 (UTC)
To: "Tian, Kevin" <kevin.tian@intel.com>
References: <6f167053-38dc-19b5-a873-321d978e9a59@suse.com>
 <0d2c44ca-d3ce-bb83-e3fc-0e5037c90143@suse.com>
 <AADFC41AFE54684AB9EE6CBC0274A5D19D739AB2@SHSMSX104.ccr.corp.intel.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <ec3798d3-c63b-8b2b-9c6e-c57741c81b27@suse.com>
Date: Mon, 20 Jan 2020 09:32:48 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <AADFC41AFE54684AB9EE6CBC0274A5D19D739AB2@SHSMSX104.ccr.corp.intel.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3 7/8] x86/HVM: don't needlessly intercept
 APERF/MPERF/TSC MSR reads
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Roger Pau Monne <roger.pau@citrix.com>, "Nakajima,
 Jun" <jun.nakajima@intel.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTkuMDEuMjAyMCAwMzo0NCwgVGlhbiwgS2V2aW4gd3JvdGU6Cj4+IEZyb206IEphbiBCZXVs
aWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KPj4gU2VudDogVHVlc2RheSwgSmFudWFyeSA3LCAyMDIw
IDEyOjM5IEFNCj4+Cj4+IElmIHRoZSBoYXJkd2FyZSBjYW4gaGFuZGxlIGFjY2Vzc2VzLCB3ZSBz
aG91bGQgYWxsb3cgaXQgdG8gZG8gc28uIFRoaXMKPj4gd2F5IHdlIGNhbiBleHBvc2UgRUZSTyB0
byBIVk0gZ3Vlc3RzLCBhbmQgImFsbCIgdGhhdCdzIGxlZnQgZm9yIGV4cG9zaW5nCj4+IEFQRVJG
L01QRVJGIGlzIHRvIGZpZ3VyZSBvdXQgaG93IHRvIGhhbmRsZSB3cml0ZXMgdG8gdGhlc2UgTVNS
cy4gKE5vdGUKPj4gdGhhdCB0aGUgbGVhZiA2IGd1ZXN0IENQVUlEIGNoZWNrcyB3aWxsIGV2YWx1
YXRlIHRvIGZhbHNlIGZvciBub3csIGFzCj4+IHJlY2FsY3VsYXRlX21pc2MoKSB6YXBzIHRoZSBl
bnRpcmUgbGVhZiBmb3Igbm93LikKPj4KPj4gRm9yIFRTQyB0aGUgaW50ZXJjZXB0cyBhcmUgbWFk
ZSBtaXJyb3IgdGhlIFJEVFNDIG9uZXMuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNo
IDxqYmV1bGljaEBzdXNlLmNvbT4KPiAKPiBSZXZpZXdlZC1ieTogS2V2aW4gVGlhbiA8a2V2aW4u
dGlhbkBpbnRlbC5jb20+CgpUaGFua3MuIEkgYXNzdW1lIHlvdSd2ZSBzZWVuIEFuZHJldydzIGNv
bW1lbnQsIGFuZCBoZW5jZSBJIHRha2UgaXQKdGhhdCB0aGUgUi1iIGFsc28gYXBwbGllcyB0byB0
aGUgYWRqdXN0ZWQgdmVyc2lvbiAobm90IHBvc3RlZCB5ZXQpOgoKLS0tIGEveGVuL2FyY2gveDg2
L2h2bS92bXgvdm1jcy5jCisrKyBiL3hlbi9hcmNoL3g4Ni9odm0vdm14L3ZtY3MuYwpAQCAtMTE0
MCw4ICsxMTQwLDEzIEBAIHN0YXRpYyBpbnQgY29uc3RydWN0X3ZtY3Moc3RydWN0IHZjcHUgKnYK
ICAgICAgICAgdm14X2NsZWFyX21zcl9pbnRlcmNlcHQodiwgTVNSX0lBMzJfU1lTRU5URVJfQ1Ms
IFZNWF9NU1JfUlcpOwogICAgICAgICB2bXhfY2xlYXJfbXNyX2ludGVyY2VwdCh2LCBNU1JfSUEz
Ml9TWVNFTlRFUl9FU1AsIFZNWF9NU1JfUlcpOwogICAgICAgICB2bXhfY2xlYXJfbXNyX2ludGVy
Y2VwdCh2LCBNU1JfSUEzMl9TWVNFTlRFUl9FSVAsIFZNWF9NU1JfUlcpOworCisgICAgICAgIGlm
ICggISh2LT5hcmNoLmh2bS52bXguZXhlY19jb250cm9sICYgQ1BVX0JBU0VEX1JEVFNDX0VYSVRJ
TkcpICkKKyAgICAgICAgICAgIHZteF9jbGVhcl9tc3JfaW50ZXJjZXB0KHYsIE1TUl9JQTMyX1RT
QywgVk1YX01TUl9SKTsKKwogICAgICAgICBpZiAoIHBhZ2luZ19tb2RlX2hhcChkKSAmJiAoIWlz
X2lvbW11X2VuYWJsZWQoZCkgfHwgaW9tbXVfc25vb3ApICkKICAgICAgICAgICAgIHZteF9jbGVh
cl9tc3JfaW50ZXJjZXB0KHYsIE1TUl9JQTMyX0NSX1BBVCwgVk1YX01TUl9SVyk7CisKICAgICAg
ICAgaWYgKCAodm1leGl0X2N0bCAmIFZNX0VYSVRfQ0xFQVJfQk5EQ0ZHUykgJiYKICAgICAgICAg
ICAgICAodm1lbnRyeV9jdGwgJiBWTV9FTlRSWV9MT0FEX0JORENGR1MpICkKICAgICAgICAgICAg
IHZteF9jbGVhcl9tc3JfaW50ZXJjZXB0KHYsIE1TUl9JQTMyX0JORENGR1MsIFZNWF9NU1JfUlcp
OwoKcGx1cyB0aGlzIGV4dHJhIHZteC5jIGh1bms6CgpAQCAtMTI0OSw3ICsxMjYxLDEyIEBAIHN0
YXRpYyB2b2lkIHZteF9zZXRfcmR0c2NfZXhpdGluZyhzdHJ1Y3QKICAgICB2bXhfdm1jc19lbnRl
cih2KTsKICAgICB2LT5hcmNoLmh2bS52bXguZXhlY19jb250cm9sICY9IH5DUFVfQkFTRURfUkRU
U0NfRVhJVElORzsKICAgICBpZiAoIGVuYWJsZSApCisgICAgewogICAgICAgICB2LT5hcmNoLmh2
bS52bXguZXhlY19jb250cm9sIHw9IENQVV9CQVNFRF9SRFRTQ19FWElUSU5HOworICAgICAgICB2
bXhfc2V0X21zcl9pbnRlcmNlcHQodiwgTVNSX0lBMzJfVFNDLCBWTVhfTVNSX1IpOworICAgIH0K
KyAgICBlbHNlCisgICAgICAgIHZteF9jbGVhcl9tc3JfaW50ZXJjZXB0KHYsIE1TUl9JQTMyX1RT
QywgVk1YX01TUl9SKTsKICAgICB2bXhfdXBkYXRlX2NwdV9leGVjX2NvbnRyb2wodik7CiAgICAg
dm14X3ZtY3NfZXhpdCh2KTsKIH0KCkphbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
