Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 84B75E8C1A
	for <lists+xen-devel@lfdr.de>; Tue, 29 Oct 2019 16:48:23 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iPTgQ-0006uL-IP; Tue, 29 Oct 2019 15:45:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=lo1b=YW=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1iPTgP-0006uG-1O
 for xen-devel@lists.xenproject.org; Tue, 29 Oct 2019 15:45:21 +0000
X-Inumbo-ID: 1c4dbea2-fa63-11e9-bbab-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1c4dbea2-fa63-11e9-bbab-bc764e2007e4;
 Tue, 29 Oct 2019 15:45:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1572363921;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=rkl9CJuUnGw3fxyE6DSbNC5szfRgHPo5FaPkBY0249M=;
 b=CCN2MgMfAdD2kJjgGZvRX63jdoHuqHEuyqwyelLgwvNCb/TiKJkCNzx/
 Yo+f9R1Fk4ejgwNUCdntcMtDVGbhSq2ZhAhThKd1R4OgAHv4d8/O5RLWO
 bwa5ppdue89+cIg8oWST5EBoBA9zSwTEKfC89AexC6lyMh/gXbazPZJPo I=;
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: /P3BHWMh6jU7+fTJrgfsGTtykLn7cWLbfkkzrsyPJYwAQOolaWfhYjFdDQjgQCTXhJ1VerMCiM
 cqpDp6NAGtfrVKvZ1/MYHKFhPR0xwWGNaf4Xb2oqP0ZCep6Sfi0VK/Gzl/5nAErKS0MBAw2UEg
 fM9+jXld9hQEeCYFntW9iAqrPtMj6nDkX4HZRg0bHutIkws9KxmJyEg7Bdxn6SrDpR0ORhwIoR
 /k7wYVHDP50eCRTvNqk0RxqbJaNpUrxVNR/xuLjACHxgNZ8fGyVM33qXrcRbsLIQcclVH66GBT
 n2c=
X-SBRS: 2.7
X-MesageID: 7568565
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.68,244,1569297600"; 
   d="scan'208";a="7568565"
To: Jan Beulich <jbeulich@suse.com>
References: <20191028150152.21179-1-andrew.cooper3@citrix.com>
 <20191028150152.21179-3-andrew.cooper3@citrix.com>
 <1cb54f27-a02c-815b-dc82-086223567635@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <6e722b0c-52ed-a822-1c61-48659a31e4b7@citrix.com>
Date: Tue, 29 Oct 2019 15:45:15 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <1cb54f27-a02c-815b-dc82-086223567635@suse.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
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

T24gMjkvMTAvMjAxOSAxNTozMiwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMjguMTAuMjAxOSAx
NjowMSwgQW5kcmV3IENvb3BlciB3cm90ZToKPj4gQ3Jvc3MgcmVmZXJlbmNlIGFuZCBsaXN0IGVh
Y2ggZXJyYXRhLCBub3cgdGhhdCB0aGV5IGFyZSBwdWJsaXNoZWQuCj4gU2hvdWxkbid0IHRoaXMg
YmUgImFsbCBlcnJhdGEiIG9yICJlYWNoIGVycmF0dW0iPwoKUHJvYmFibHkuCgo+Cj4+IEBAIC0y
NzI3LDQwICsyNzE5LDUwIEBAIGVudW0KPj4gIAo+PiAgc3RhdGljIGJvb2wgX19yZWFkX21vc3Rs
eSBsYnJfdHN4X2ZpeHVwX25lZWRlZDsKPj4gIHN0YXRpYyBib29sIF9fcmVhZF9tb3N0bHkgYmRm
OTNfZml4dXBfbmVlZGVkOwo+PiAtc3RhdGljIHVpbnQzMl90IF9fcmVhZF9tb3N0bHkgbGJyX2Zy
b21fc3RhcnQ7Cj4+IC1zdGF0aWMgdWludDMyX3QgX19yZWFkX21vc3RseSBsYnJfZnJvbV9lbmQ7
Cj4+IC1zdGF0aWMgdWludDMyX3QgX19yZWFkX21vc3RseSBsYnJfbGFzdGludF9mcm9tOwo+PiAg
Cj4+ICBzdGF0aWMgdm9pZCBfX2luaXQgbGJyX3RzeF9maXh1cF9jaGVjayh2b2lkKQo+PiAgewo+
PiAtICAgIGJvb2wgdHN4X3N1cHBvcnQgPSBjcHVfaGFzX2hsZSB8fCBjcHVfaGFzX3J0bTsKPj4g
ICAgICB1aW50NjRfdCBjYXBzOwo+PiAgICAgIHVpbnQzMl90IGxicl9mb3JtYXQ7Cj4+ICAKPj4g
LSAgICAvKiBGaXh1cCBpcyBuZWVkZWQgb25seSB3aGVuIFRTWCBzdXBwb3J0IGlzIGRpc2FibGVk
IC4uLiAqLwo+PiAtICAgIGlmICggdHN4X3N1cHBvcnQgKQo+PiArICAgIC8qCj4+ICsgICAgICog
SFNNMTgyLCBIU0QxNzIsIEhTRTExNywgQkRNMTI3LCBCREQxMTcsIEJERjg1LCBCREUxMDU6Cj4+
ICsgICAgICoKPj4gKyAgICAgKiBPbiBwcm9jZXNzb3JzIHRoYXQgZG8gbm90IHN1cHBvcnQgSW50
ZWwgVHJhbnNhY3Rpb25hbCBTeW5jaHJvbml6YXRpb24KPj4gKyAgICAgKiBFeHRlbnNpb25zIChJ
bnRlbCBUU1gpIChDUFVJRC4wN0guRUJYIGJpdHMgNCBhbmQgMTEgYXJlIGJvdGggemVybyksCj4+
ICsgICAgICogd3JpdGVzIHRvIE1TUl9MQVNUQlJBTkNIX3hfRlJPTV9JUCAoTVNSIDY4MEggdG8g
NjhGSCkgbWF5ICNHUCB1bmxlc3MKPj4gKyAgICAgKiBiaXRzWzYyOjYxXSBhcmUgZXF1YWwgdG8g
Yml0WzQ3XS4KPj4gKyAgICAgKgo+PiArICAgICAqIFNvZnR3YXJlIHNob3VsZCBzaWduIHRoZSBN
U1JzLgo+IE1pc3NpbmcgImV4dGVuZCI/CgpZZXMuCgo+Cj4+ICsgICAgICogRXhwZXJpbWVudGFs
bHksIE1TUl9MRVJfRlJPTV9MSVAgKDFEREgpIGlzIHNpbWlsYXJseSBpbXBhY3RlZCwgc28gaXMK
Pj4gKyAgICAgKiBmaXhlZCB1cCBhcyB3ZWxsLgo+PiArICAgICAqLwo+PiArICAgIGlmICggY3B1
X2hhc19obGUgfHwgY3B1X2hhc19ydG0gfHwKPj4gKyAgICAgICAgIGJvb3RfY3B1X2RhdGEueDg2
X3ZlbmRvciAhPSBYODZfVkVORE9SX0lOVEVMIHx8Cj4+ICsgICAgICAgICBib290X2NwdV9kYXRh
Lng4NiAhPSA2IHx8Cj4+ICsgICAgICAgICAoYm9vdF9jcHVfZGF0YS54ODZfbW9kZWwgIT0gMHgz
YyAmJiAvKiBIU00xODIsIEhTRDE3MiAtIDR0aCBnZW4gQ29yZSAqLwo+PiArICAgICAgICAgIGJv
b3RfY3B1X2RhdGEueDg2X21vZGVsICE9IDB4M2YgJiYgLyogSFNFMTE3IC0gWGVvbiBFNSB2MyAq
Lwo+PiArICAgICAgICAgIGJvb3RfY3B1X2RhdGEueDg2X21vZGVsICE9IDB4NDUgJiYgLyogSFNN
MTgyIC0gNHRoIGdlbiBDb3JlICovCj4+ICsgICAgICAgICAgYm9vdF9jcHVfZGF0YS54ODZfbW9k
ZWwgIT0gMHg0NiAmJiAvKiBIU00xODIsIEhTRDE3MiAtIDR0aCBnZW4gQ29yZSAoR1QzKSAqLwo+
PiArICAgICAgICAgIGJvb3RfY3B1X2RhdGEueDg2X21vZGVsICE9IDB4M2QgJiYgLyogQkRNMTI3
IC0gNXRoIGdlbiBDb3JlICovCj4+ICsgICAgICAgICAgYm9vdF9jcHVfZGF0YS54ODZfbW9kZWwg
IT0gMHg0NyAmJiAvKiBCREQxMTcgLSA1dGggZ2VuIENvcmUgKEdUMykgKi8KPj4gKyAgICAgICAg
ICBib290X2NwdV9kYXRhLng4Nl9tb2RlbCAhPSAweDRmICYmIC8qIEJERjg1ICAtIFhlb24gRTUt
MjYwMCB2NCAqLwo+PiArICAgICAgICAgIGJvb3RfY3B1X2RhdGEueDg2X21vZGVsICE9IDB4NTYp
ICkgLyogQkRFMTA1IC0gWGVvbiBELTE1MDAgKi8KPiBQZXJoYXBzIGVhc2llciBhcyBzd2l0Y2go
KSwgYXMgd2UgZG8gZWxzZXdoZXJlPwoKU28sIEkgY2FuLCBidXQgaXQgbWFrZXMgdGhlIGxvZ2lj
IGEgbGl0dGxlIGF3a3dhcmQuwqAgKEFsdGhvdWdoIGxlc3Mgc28KaW4gdGhpcyB2ZXJzaW9uIHdo
ZXJlIEkgbW92ZWQgdGhlIEhMRS9SVE0gY2hlY2sgdG8gdGhlIGJlZ2lubmluZykuCgpJIHdhcyBw
bGVhc2VkIGhvd2V2ZXIgdG8gZmluZCB0aGF0IEdDQyBkaWQgY29tcGlsZSB0aGlzIHRvICJzdWJ0
cmFjdCAzYywKdXBwZXIgYm91bmRzIGNoZWNrIGFnYWluc3QgMWEsIGJpdCB0ZXN0IGFnYWluc3Qg
YW4gaW1tZWRpYXRlIi4KCkknbGwgc2VlIHdoYXQgSSBjYW4gZG8gYWJvdXQgcmVhcnJhbmdpbmcg
dGhpcyBpbnRvIGEgc3dpdGNoIHN0YXRlbWVudCwKYmVjYXVzZSB3ZSB3aWxsIG5lZWQgdGhlIGhv
cml6b250YWwgc3BhY2Ugd2hlbiBzd2l0Y2hpbmcgdG8gdXNlCmludGVsLWZhbWlseS5oCgo+Cj4+
IEBAIC00MTMzLDggKzQxMzUsMTIgQEAgc3RhdGljIHZvaWQgbGJyX3RzeF9maXh1cCh2b2lkKQo+
PiAgICAgIHN0cnVjdCB2bXhfbXNyX2VudHJ5ICptc3JfYXJlYSA9IGN1cnItPmFyY2guaHZtLnZt
eC5tc3JfYXJlYTsKPj4gICAgICBzdHJ1Y3Qgdm14X21zcl9lbnRyeSAqbXNyOwo+PiAgCj4+IC0g
ICAgaWYgKCAobXNyID0gdm14X2ZpbmRfbXNyKGN1cnIsIGxicl9mcm9tX3N0YXJ0LCBWTVhfTVNS
X0dVRVNUKSkgIT0gTlVMTCApCj4+ICsgICAgaWYgKCAobXNyID0gdm14X2ZpbmRfbXNyKGN1cnIs
IE1TUl9QNF9MQVNUQlJBTkNIXzBfRlJPTV9MSVAsCj4+ICsgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIFZNWF9NU1JfR1VFU1QpKSAhPSBOVUxMICkKPj4gICAgICB7Cj4+ICsgICAgICAgIHVu
c2lnbmVkIGludCBsYnJfZnJvbV9lbmQgPQo+PiArICAgICAgICAgICAgTVNSX1A0X0xBU1RCUkFO
Q0hfMF9GUk9NX0xJUCArIE5VTV9NU1JfUDRfTEFTVEJSQU5DSF9GUk9NX1RPOwo+IGNvbnN0Pwo+
Cj4gV2l0aCB0aGVzZSBsYXJnZWx5IGNvc21ldGljIHJlbWFya3MgdGFrZW4gY2FyZSBvZiBhcyB5
b3Ugc2VlIGZpdCwKPiBSZXZpZXdlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29t
PgoKVGhhbmtzLAoKfkFuZHJldwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
