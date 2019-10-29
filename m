Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DFF8E8BE0
	for <lists+xen-devel@lfdr.de>; Tue, 29 Oct 2019 16:36:02 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iPTU1-0005vR-16; Tue, 29 Oct 2019 15:32:33 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=1x1s=YW=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iPTTz-0005vM-0T
 for xen-devel@lists.xenproject.org; Tue, 29 Oct 2019 15:32:31 +0000
X-Inumbo-ID: 5162cfbc-fa61-11e9-9515-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5162cfbc-fa61-11e9-9515-12813bfff9fa;
 Tue, 29 Oct 2019 15:32:30 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 24E56B227;
 Tue, 29 Oct 2019 15:32:29 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20191028150152.21179-1-andrew.cooper3@citrix.com>
 <20191028150152.21179-3-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <1cb54f27-a02c-815b-dc82-086223567635@suse.com>
Date: Tue, 29 Oct 2019 16:32:29 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191028150152.21179-3-andrew.cooper3@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 2/2] x86/vtx: Fixes to Haswell/Broadwell LBR
 TSX errata
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
Cc: Juergen Gross <jgross@suse.com>, Kevin Tian <kevin.tian@intel.com>,
 Wei Liu <wl@xen.org>, Jun Nakajima <jun.nakajima@intel.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjguMTAuMjAxOSAxNjowMSwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBDcm9zcyByZWZlcmVu
Y2UgYW5kIGxpc3QgZWFjaCBlcnJhdGEsIG5vdyB0aGF0IHRoZXkgYXJlIHB1Ymxpc2hlZC4KClNo
b3VsZG4ndCB0aGlzIGJlICJhbGwgZXJyYXRhIiBvciAiZWFjaCBlcnJhdHVtIj8KCj4gQEAgLTI3
MjcsNDAgKzI3MTksNTAgQEAgZW51bQo+ICAKPiAgc3RhdGljIGJvb2wgX19yZWFkX21vc3RseSBs
YnJfdHN4X2ZpeHVwX25lZWRlZDsKPiAgc3RhdGljIGJvb2wgX19yZWFkX21vc3RseSBiZGY5M19m
aXh1cF9uZWVkZWQ7Cj4gLXN0YXRpYyB1aW50MzJfdCBfX3JlYWRfbW9zdGx5IGxicl9mcm9tX3N0
YXJ0Owo+IC1zdGF0aWMgdWludDMyX3QgX19yZWFkX21vc3RseSBsYnJfZnJvbV9lbmQ7Cj4gLXN0
YXRpYyB1aW50MzJfdCBfX3JlYWRfbW9zdGx5IGxicl9sYXN0aW50X2Zyb207Cj4gIAo+ICBzdGF0
aWMgdm9pZCBfX2luaXQgbGJyX3RzeF9maXh1cF9jaGVjayh2b2lkKQo+ICB7Cj4gLSAgICBib29s
IHRzeF9zdXBwb3J0ID0gY3B1X2hhc19obGUgfHwgY3B1X2hhc19ydG07Cj4gICAgICB1aW50NjRf
dCBjYXBzOwo+ICAgICAgdWludDMyX3QgbGJyX2Zvcm1hdDsKPiAgCj4gLSAgICAvKiBGaXh1cCBp
cyBuZWVkZWQgb25seSB3aGVuIFRTWCBzdXBwb3J0IGlzIGRpc2FibGVkIC4uLiAqLwo+IC0gICAg
aWYgKCB0c3hfc3VwcG9ydCApCj4gKyAgICAvKgo+ICsgICAgICogSFNNMTgyLCBIU0QxNzIsIEhT
RTExNywgQkRNMTI3LCBCREQxMTcsIEJERjg1LCBCREUxMDU6Cj4gKyAgICAgKgo+ICsgICAgICog
T24gcHJvY2Vzc29ycyB0aGF0IGRvIG5vdCBzdXBwb3J0IEludGVsIFRyYW5zYWN0aW9uYWwgU3lu
Y2hyb25pemF0aW9uCj4gKyAgICAgKiBFeHRlbnNpb25zIChJbnRlbCBUU1gpIChDUFVJRC4wN0gu
RUJYIGJpdHMgNCBhbmQgMTEgYXJlIGJvdGggemVybyksCj4gKyAgICAgKiB3cml0ZXMgdG8gTVNS
X0xBU1RCUkFOQ0hfeF9GUk9NX0lQIChNU1IgNjgwSCB0byA2OEZIKSBtYXkgI0dQIHVubGVzcwo+
ICsgICAgICogYml0c1s2Mjo2MV0gYXJlIGVxdWFsIHRvIGJpdFs0N10uCj4gKyAgICAgKgo+ICsg
ICAgICogU29mdHdhcmUgc2hvdWxkIHNpZ24gdGhlIE1TUnMuCgpNaXNzaW5nICJleHRlbmQiPwoK
PiArICAgICAqIEV4cGVyaW1lbnRhbGx5LCBNU1JfTEVSX0ZST01fTElQICgxRERIKSBpcyBzaW1p
bGFybHkgaW1wYWN0ZWQsIHNvIGlzCj4gKyAgICAgKiBmaXhlZCB1cCBhcyB3ZWxsLgo+ICsgICAg
ICovCj4gKyAgICBpZiAoIGNwdV9oYXNfaGxlIHx8IGNwdV9oYXNfcnRtIHx8Cj4gKyAgICAgICAg
IGJvb3RfY3B1X2RhdGEueDg2X3ZlbmRvciAhPSBYODZfVkVORE9SX0lOVEVMIHx8Cj4gKyAgICAg
ICAgIGJvb3RfY3B1X2RhdGEueDg2ICE9IDYgfHwKPiArICAgICAgICAgKGJvb3RfY3B1X2RhdGEu
eDg2X21vZGVsICE9IDB4M2MgJiYgLyogSFNNMTgyLCBIU0QxNzIgLSA0dGggZ2VuIENvcmUgKi8K
PiArICAgICAgICAgIGJvb3RfY3B1X2RhdGEueDg2X21vZGVsICE9IDB4M2YgJiYgLyogSFNFMTE3
IC0gWGVvbiBFNSB2MyAqLwo+ICsgICAgICAgICAgYm9vdF9jcHVfZGF0YS54ODZfbW9kZWwgIT0g
MHg0NSAmJiAvKiBIU00xODIgLSA0dGggZ2VuIENvcmUgKi8KPiArICAgICAgICAgIGJvb3RfY3B1
X2RhdGEueDg2X21vZGVsICE9IDB4NDYgJiYgLyogSFNNMTgyLCBIU0QxNzIgLSA0dGggZ2VuIENv
cmUgKEdUMykgKi8KPiArICAgICAgICAgIGJvb3RfY3B1X2RhdGEueDg2X21vZGVsICE9IDB4M2Qg
JiYgLyogQkRNMTI3IC0gNXRoIGdlbiBDb3JlICovCj4gKyAgICAgICAgICBib290X2NwdV9kYXRh
Lng4Nl9tb2RlbCAhPSAweDQ3ICYmIC8qIEJERDExNyAtIDV0aCBnZW4gQ29yZSAoR1QzKSAqLwo+
ICsgICAgICAgICAgYm9vdF9jcHVfZGF0YS54ODZfbW9kZWwgIT0gMHg0ZiAmJiAvKiBCREY4NSAg
LSBYZW9uIEU1LTI2MDAgdjQgKi8KPiArICAgICAgICAgIGJvb3RfY3B1X2RhdGEueDg2X21vZGVs
ICE9IDB4NTYpICkgLyogQkRFMTA1IC0gWGVvbiBELTE1MDAgKi8KClBlcmhhcHMgZWFzaWVyIGFz
IHN3aXRjaCgpLCBhcyB3ZSBkbyBlbHNld2hlcmU/Cgo+IEBAIC00MTMzLDggKzQxMzUsMTIgQEAg
c3RhdGljIHZvaWQgbGJyX3RzeF9maXh1cCh2b2lkKQo+ICAgICAgc3RydWN0IHZteF9tc3JfZW50
cnkgKm1zcl9hcmVhID0gY3Vyci0+YXJjaC5odm0udm14Lm1zcl9hcmVhOwo+ICAgICAgc3RydWN0
IHZteF9tc3JfZW50cnkgKm1zcjsKPiAgCj4gLSAgICBpZiAoIChtc3IgPSB2bXhfZmluZF9tc3Io
Y3VyciwgbGJyX2Zyb21fc3RhcnQsIFZNWF9NU1JfR1VFU1QpKSAhPSBOVUxMICkKPiArICAgIGlm
ICggKG1zciA9IHZteF9maW5kX21zcihjdXJyLCBNU1JfUDRfTEFTVEJSQU5DSF8wX0ZST01fTElQ
LAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFZNWF9NU1JfR1VFU1QpKSAhPSBOVUxM
ICkKPiAgICAgIHsKPiArICAgICAgICB1bnNpZ25lZCBpbnQgbGJyX2Zyb21fZW5kID0KPiArICAg
ICAgICAgICAgTVNSX1A0X0xBU1RCUkFOQ0hfMF9GUk9NX0xJUCArIE5VTV9NU1JfUDRfTEFTVEJS
QU5DSF9GUk9NX1RPOwoKY29uc3Q/CgpXaXRoIHRoZXNlIGxhcmdlbHkgY29zbWV0aWMgcmVtYXJr
cyB0YWtlbiBjYXJlIG9mIGFzIHlvdSBzZWUgZml0LApSZXZpZXdlZC1ieTogSmFuIEJldWxpY2gg
PGpiZXVsaWNoQHN1c2UuY29tPgoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
