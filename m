Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E8DDF18A0
	for <lists+xen-devel@lfdr.de>; Wed,  6 Nov 2019 15:29:12 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iSMFN-0007l2-Mb; Wed, 06 Nov 2019 14:25:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=xBt7=Y6=oracle.com=konrad.wilk@srs-us1.protection.inumbo.net>)
 id 1iSMFM-0007k4-M6
 for xen-devel@lists.xenproject.org; Wed, 06 Nov 2019 14:25:20 +0000
X-Inumbo-ID: 42814ca8-00a1-11ea-b678-bc764e2007e4
Received: from userp2130.oracle.com (unknown [156.151.31.86])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 42814ca8-00a1-11ea-b678-bc764e2007e4;
 Wed, 06 Nov 2019 14:25:19 +0000 (UTC)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id xA6EOSJ0001262;
 Wed, 6 Nov 2019 14:25:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2019-08-05;
 bh=cRb8LBs0/27VdKfhaTAJmpK7kJCcL97SFYZSvzisoCs=;
 b=DdPwKHv+iyop9BJv2Zhvj0/mBzUFf4DUqSWYzTY9rOZnwE3On2P+rWWlyTN6n0xenu0v
 9gmfBqbYW6idfFPtVXKEIOpHoAIu4ve6FMk9My/78iMGGkQRc8jUEWJGmi2NnBdBFa8c
 LgoPaq+FPWSDimaOU2PgqCPZbAf3++f6lan/Qtbj16C6XX8QBvV57101RQ0MDVywS+5S
 Dz252xjqzJvhNDvNRQ3+5C4K6yeWGBLBaXWwieKzuiw8ftkW09Ebr2F8OUOA6Ika9Vae
 uKf8oEZqMpZzvMHJfnffn51sFxw+HCdJ7H89BMxmkVF8wTp1E8tcpw18jKw1j/rztKpD rg== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by userp2130.oracle.com with ESMTP id 2w117u6qc9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 06 Nov 2019 14:25:17 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id xA6ENRc2071261;
 Wed, 6 Nov 2019 14:25:16 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by aserp3020.oracle.com with ESMTP id 2w3vr2p1ah-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 06 Nov 2019 14:25:16 +0000
Received: from abhmp0019.oracle.com (abhmp0019.oracle.com [141.146.116.25])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id xA6EPFuX028542;
 Wed, 6 Nov 2019 14:25:15 GMT
Received: from localhost.localdomain (/209.6.36.129)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Wed, 06 Nov 2019 06:25:15 -0800
Date: Wed, 6 Nov 2019 09:25:13 -0500
From: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <20191106142513.GB5520@localhost.localdomain>
References: <20191105194317.16232-1-andrew.cooper3@citrix.com>
 <20191105194317.16232-3-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191105194317.16232-3-andrew.cooper3@citrix.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9432
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1908290000 definitions=main-1911060142
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9432
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1908290000
 definitions=main-1911060142
Subject: Re: [Xen-devel] [PATCH 2/2] x86/livepatch: Prevent patching with
 active waitqueues
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
Cc: Juergen Gross <jgross@suse.com>, Xen-devel <xen-devel@lists.xenproject.org>,
 Ross Lagerwall <ross.lagerwall@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBOb3YgMDUsIDIwMTkgYXQgMDc6NDM6MTdQTSArMDAwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiBUaGUgc2FmZXR5IG9mIGxpdmVwYXRjaGluZyBkZXBlbmRzIG9uIGV2ZXJ5IHN0YWNr
IGhhdmluZyBiZWVuIHVud291bmQsIGJ1dAo+IHRoZXJlIGlzIG9uZSBjb3JuZXIgY2FzZSB3aGVy
ZSB0aGlzIGlzIG5vdCB0cnVlLiAgVGhlIFNoYXJpbmcvUGFnaW5nL01vbml0b3IKPiBpbmZyYXN0
cnVjdHVyZSBtYXkgdXNlIHdhaXRxdWV1ZXMsIHdoaWNoIGNvcHkgdGhlIHN0YWNrIGZyYW1lIHNp
ZGV3YXlzIGFuZAo+IGxvbmdqbXAoKSB0byBhIGRpZmZlcmVudCB2Y3B1Lgo+IAo+IFRoaXMgY2Fz
ZSBpcyByYXJlLCBhbmQgY2FuIGJlIHdvcmtlZCBhcm91bmQgYnkgcGF1c2luZyB0aGUgb2ZmZW5k
aW5nCj4gZG9tYWluKHMpLCB3YWl0aW5nIGZvciB0aGVpciByaW5ncyB0byBkcmFpbiwgdGhlbiBw
ZXJmb3JtaW5nIGEgbGl2ZXBhdGNoLgo+IAo+IEluIHRoZSBjYXNlIHRoYXQgdGhlcmUgaXMgYW4g
YWN0aXZlIHdhaXRxdWV1ZSwgZmFpbCB0aGUgbGl2ZXBhdGNoIGF0dGVtcHQgd2l0aAo+IC1FQlVT
WSwgd2hpY2ggaXMgcHJlZm9yYWJsZSB0byB0aGUgZmlyZXdvcmtzIHdoaWNoIG9jY3VyIGZyb20g
dHJ5aW5nIHRvIHVud2luZAo+IHRoZSBvbGQgc3RhY2sgZnJhbWUgYXQgYSBsYXRlciBwb2ludC4K
PiAKPiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXgu
Y29tPgo+IC0tLQo+IENDOiBLb25yYWQgUnplc3p1dGVrIFdpbGsgPGtvbnJhZC53aWxrQG9yYWNs
ZS5jb20+CgpSZXZpZXdlZC1ieTogS29ucmFkIFJ6ZXN6dXRlayBXaWxrIDxrb25yYWQud2lsa0Bv
cmFjbGUuY29tPgoKPiBDQzogUm9zcyBMYWdlcndhbGwgPHJvc3MubGFnZXJ3YWxsQGNpdHJpeC5j
b20+Cj4gQ0M6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KPiAKPiBUaGlzIGZpeCB3
YW50cyBiYWNrcG9ydGluZywgYW5kIGlzIGxvbmcgb3ZlcmR1ZSBmb3IgcG9zdGluZyB1cHN0cmVh
bS4KPiAtLS0KPiAgeGVuL2FyY2gvYXJtL2xpdmVwYXRjaC5jICAgIHwgIDUgKysrKysKPiAgeGVu
L2FyY2gveDg2L2xpdmVwYXRjaC5jICAgIHwgMzkgKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrCj4gIHhlbi9jb21tb24vbGl2ZXBhdGNoLmMgICAgICB8ICA3ICsrKysrKysK
PiAgeGVuL2luY2x1ZGUveGVuL2xpdmVwYXRjaC5oIHwgIDEgKwo+ICA0IGZpbGVzIGNoYW5nZWQs
IDUyIGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL2xpdmVwYXRj
aC5jIGIveGVuL2FyY2gvYXJtL2xpdmVwYXRjaC5jCj4gaW5kZXggMDBjNWUyYmM0NS4uOTE1ZTlk
OTI2YSAxMDA2NDQKPiAtLS0gYS94ZW4vYXJjaC9hcm0vbGl2ZXBhdGNoLmMKPiArKysgYi94ZW4v
YXJjaC9hcm0vbGl2ZXBhdGNoLmMKPiBAQCAtMTgsNiArMTgsMTEgQEAKPiAgCj4gIHZvaWQgKnZt
YXBfb2ZfeGVuX3RleHQ7Cj4gIAo+ICtpbnQgYXJjaF9saXZlcGF0Y2hfc2FmZXR5X2NoZWNrKHZv
aWQpCj4gK3sKPiArICAgIHJldHVybiAwOwo+ICt9Cj4gKwo+ICBpbnQgYXJjaF9saXZlcGF0Y2hf
cXVpZXNjZSh2b2lkKQo+ICB7Cj4gICAgICBtZm5fdCB0ZXh0X21mbjsKPiBkaWZmIC0tZ2l0IGEv
eGVuL2FyY2gveDg2L2xpdmVwYXRjaC5jIGIveGVuL2FyY2gveDg2L2xpdmVwYXRjaC5jCj4gaW5k
ZXggYzgyY2Y1M2I5ZS4uMGYxMjlmYTZiMiAxMDA2NDQKPiAtLS0gYS94ZW4vYXJjaC94ODYvbGl2
ZXBhdGNoLmMKPiArKysgYi94ZW4vYXJjaC94ODYvbGl2ZXBhdGNoLmMKPiBAQCAtMTQsNiArMTQs
NDUgQEAKPiAgI2luY2x1ZGUgPGFzbS9ubWkuaD4KPiAgI2luY2x1ZGUgPGFzbS9saXZlcGF0Y2gu
aD4KPiAgCj4gK3N0YXRpYyBib29sIGhhc19hY3RpdmVfd2FpdHF1ZXVlKGNvbnN0IHN0cnVjdCB2
bV9ldmVudF9kb21haW4gKnZlZCkKPiArewo+ICsgICAgLyogdmVkIG1heSBiZSB4emFsbG9jKCkn
ZCB3aXRob3V0IElOSVRfTElTVF9IRUFEKCkgeWV0LiAqLwo+ICsgICAgcmV0dXJuICh2ZWQgJiYg
IWxpc3RfaGVhZF9pc19udWxsKCZ2ZWQtPndxLmxpc3QpICYmCj4gKyAgICAgICAgICAgICFsaXN0
X2VtcHR5KCZ2ZWQtPndxLmxpc3QpKTsKPiArfQo+ICsKPiArLyoKPiArICogeDg2J3MgaW1wbGVt
ZW50YXRpb24gb2Ygd2FpdHF1ZXVlIHZpb2xhdGVzIHRoZSBsaXZlcGF0Y2hpbmcgc2FmZXkgcHJp
bmNpcGxlCj4gKyAqIG9mIGhhdmluZyB1bndvdW5kIGV2ZXJ5IENQVXMgc3RhY2sgYmVmb3JlIG1v
ZGlmeWluZyBsaXZlIGNvbnRlbnQuCj4gKyAqCj4gKyAqIFNlYXJjaCB0aHJvdWdoIGV2ZXJ5IGRv
bWFpbiBhbmQgY2hlY2sgdGhhdCBubyB2Q1BVcyBoYXZlIGFuIGFjdGl2ZQo+ICsgKiB3YWl0cXVl
dWUuCj4gKyAqLwo+ICtpbnQgYXJjaF9saXZlcGF0Y2hfc2FmZXR5X2NoZWNrKHZvaWQpOwo+ICt7
Cj4gKyAgICBzdHJ1Y3QgZG9tYWluICpkOwo+ICsKPiArICAgIGZvcl9lYWNoX2RvbWFpbiAoIGQg
KQo+ICsgICAgewo+ICsjaWZkZWYgQ09ORklHX01FTV9TSEFSSU5HCj4gKyAgICAgICAgaWYgKCBo
YXNfYWN0aXZlX3dhaXRxdWV1ZShkLT52bV9ldmVudF9zaGFyZSkgKQo+ICsgICAgICAgICAgICBn
b3RvIGZhaWw7Cj4gKyNlbmRpZgo+ICsjaWZkZWYgQ09ORklHX01FTV9QQUdJTkcKPiArICAgICAg
ICBpZiAoIGhhc19hY3RpdmVfd2FpdHF1ZXVlKGQtPnZtX2V2ZW50X3BhZ2luZykgKQo+ICsgICAg
ICAgICAgICBnb3RvIGZhaWw7Cj4gKyNlbmRpZgo+ICsgICAgICAgIGlmICggaGFzX2FjdGl2ZV93
YWl0cXVldWUoZC0+dm1fZXZlbnRfbW9uaXRvcikgKQo+ICsgICAgICAgICAgICBnb3RvIGZhaWw7
Cj4gKyAgICB9Cj4gKwo+ICsgICAgcmV0dXJuIDA7Cj4gKwo+ICsgZmFpbDoKPiArICAgIHByaW50
ayhYRU5MT0dfRVJSIExJVkVQQVRDSCAiJXBkIGZvdW5kIHdpdGggYWN0aXZlIHdhaXRxdWV1ZVxu
IiwgZCk7Cj4gKyAgICByZXR1cm4gLUVCVVNZOwo+ICt9Cj4gKwo+ICBpbnQgYXJjaF9saXZlcGF0
Y2hfcXVpZXNjZSh2b2lkKQo+ICB7Cj4gICAgICAvKiBEaXNhYmxlIFdQIHRvIGFsbG93IGNoYW5n
ZXMgdG8gcmVhZC1vbmx5IHBhZ2VzLiAqLwo+IGRpZmYgLS1naXQgYS94ZW4vY29tbW9uL2xpdmVw
YXRjaC5jIGIveGVuL2NvbW1vbi9saXZlcGF0Y2guYwo+IGluZGV4IDk2MjY0NzYxNmEuLjI3ZWU1
YmRlYjcgMTAwNjQ0Cj4gLS0tIGEveGVuL2NvbW1vbi9saXZlcGF0Y2guYwo+ICsrKyBiL3hlbi9j
b21tb24vbGl2ZXBhdGNoLmMKPiBAQCAtMTA2MCw2ICsxMDYwLDEzIEBAIHN0YXRpYyBpbnQgYXBw
bHlfcGF5bG9hZChzdHJ1Y3QgcGF5bG9hZCAqZGF0YSkKPiAgICAgIHVuc2lnbmVkIGludCBpOwo+
ICAgICAgaW50IHJjOwo+ICAKPiArICAgIHJjID0gYXBwbHlfc2FmZXR5X2NoZWNrcygpOwo+ICsg
ICAgaWYgKCByYyApCj4gKyAgICB7Cj4gKyAgICAgICAgcHJpbnRrKFhFTkxPR19FUlIgTElWRVBB
VENIICIlczogU2FmZXR5IGNoZWNrcyBmYWlsZWRcbiIsIGRhdGEtPm5hbWUpOwo+ICsgICAgICAg
IHJldHVybiByYzsKPiArICAgIH0KPiArCj4gICAgICBwcmludGsoWEVOTE9HX0lORk8gTElWRVBB
VENIICIlczogQXBwbHlpbmcgJXUgZnVuY3Rpb25zXG4iLAo+ICAgICAgICAgICAgICBkYXRhLT5u
YW1lLCBkYXRhLT5uZnVuY3MpOwo+ICAKPiBkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUveGVuL2xp
dmVwYXRjaC5oIGIveGVuL2luY2x1ZGUveGVuL2xpdmVwYXRjaC5oCj4gaW5kZXggMWIxODE3Y2Ew
ZC4uNjllZGU3NWQyMCAxMDA2NDQKPiAtLS0gYS94ZW4vaW5jbHVkZS94ZW4vbGl2ZXBhdGNoLmgK
PiArKysgYi94ZW4vaW5jbHVkZS94ZW4vbGl2ZXBhdGNoLmgKPiBAQCAtMTA0LDYgKzEwNCw3IEBA
IHN0YXRpYyBpbmxpbmUgaW50IGxpdmVwYXRjaF92ZXJpZnlfZGlzdGFuY2UoY29uc3Qgc3RydWN0
IGxpdmVwYXRjaF9mdW5jICpmdW5jKQo+ICAgKiBUaGVzZSBmdW5jdGlvbnMgYXJlIGNhbGxlZCBh
cm91bmQgdGhlIGNyaXRpY2FsIHJlZ2lvbiBwYXRjaGluZyBsaXZlIGNvZGUsCj4gICAqIGZvciBh
biBhcmNoaXRlY3R1cmUgdG8gdGFrZSBtYWtlIGFwcHJvcHJhdGllIGdsb2JhbCBzdGF0ZSBhZGp1
c3RtZW50cy4KPiAgICovCj4gK2ludCBhcmNoX2xpdmVwYXRjaF9zYWZldHlfY2hlY2sodm9pZCk7
Cj4gIGludCBhcmNoX2xpdmVwYXRjaF9xdWllc2NlKHZvaWQpOwo+ICB2b2lkIGFyY2hfbGl2ZXBh
dGNoX3Jldml2ZSh2b2lkKTsKPiAgCj4gLS0gCj4gMi4xMS4wCj4gCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
