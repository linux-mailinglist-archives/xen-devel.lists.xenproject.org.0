Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 73C9E157DA7
	for <lists+xen-devel@lfdr.de>; Mon, 10 Feb 2020 15:44:09 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j1AGC-0006rh-8J; Mon, 10 Feb 2020 14:42:04 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=qaH/=36=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1j1AGA-0006rc-SM
 for xen-devel@lists.xenproject.org; Mon, 10 Feb 2020 14:42:02 +0000
X-Inumbo-ID: 7ed8dad4-4c13-11ea-b4d5-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7ed8dad4-4c13-11ea-b4d5-12813bfff9fa;
 Mon, 10 Feb 2020 14:42:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1581345721;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=Tbmn2EWnXck/CZgSvYcJzdlkCJArdMYpsr9GffXYKV0=;
 b=SW+c0tX2UR/BPKVjgwj03qab3nDGo/TQqam+08qoKURL9F96dfx0g6vv
 EvSx6EX+KUYVvUc5RJVlsC/bkayJdigayhPTQxMfBHYP51joKk1aKlczo
 Y8pPbuxqK/Cp19wyJQiDGEiu0uawrweQjULILW2TXAo2+hyz9ySNPGnjn g=;
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: taqISR6/clqaYWhWPMrnXrGVAOU3mFEr0hJsDqZgLt7jPrAa9MsPjqQc5TWtGhdrN1tpCfmvuP
 fBIWYXhrUzpdT81e4itbq9FrRQJBqQpWCqhrVZ7RxiqDwkHnqouTpOaQeX3vk8NJtanAvax41G
 0N+dZXj3ZBfnt9rekf7YzuUQBZm0vt0/lUzlrxONC4OMzm1yIvGNPDcgNJGE6yg5YSZ5q9I6sC
 ZajmCPJ4EDusW4hDhWeMAt/6P+dS07W1nDknr6qG/ljHION7j8hF4XNanogCW29vehYJWdG3PH
 Kgc=
X-SBRS: 2.7
X-MesageID: 12577185
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,425,1574139600"; d="scan'208";a="12577185"
To: Jan Beulich <jbeulich@suse.com>
References: <20200203144340.4614-1-andrew.cooper3@citrix.com>
 <20200203144340.4614-3-andrew.cooper3@citrix.com>
 <89901b01-ba20-e099-cf06-a047abc88761@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <37637e68-1f88-8839-7686-3aeb294c99a9@citrix.com>
Date: Mon, 10 Feb 2020 14:39:34 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <89901b01-ba20-e099-cf06-a047abc88761@suse.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH 2/4] AMD/IOMMU: Delete iommu_{get, set,
 clear}_bit() helpers
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDUvMDIvMjAyMCAwOTo1NywgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMDMuMDIuMjAyMCAx
NTo0MywgQW5kcmV3IENvb3BlciB3cm90ZToKPj4gQEAgLTg1LDE2ICs4NSwxNCBAQCBzdGF0aWMg
dm9pZCBmbHVzaF9jb21tYW5kX2J1ZmZlcihzdHJ1Y3QgYW1kX2lvbW11ICppb21tdSkKPj4gICAg
ICBsb29wX2NvdW50ID0gMTAwMDsKPj4gICAgICBkbyB7Cj4+ICAgICAgICAgIHN0YXR1cyA9IHJl
YWRsKGlvbW11LT5tbWlvX2Jhc2UgKyBJT01NVV9TVEFUVVNfTU1JT19PRkZTRVQpOwo+PiAtICAg
ICAgICBjb21wX3dhaXQgPSBnZXRfZmllbGRfZnJvbV9yZWdfdTMyKHN0YXR1cywKPj4gLSAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBJT01NVV9TVEFUVVNfQ09NUF9X
QUlUX0lOVF9NQVNLLAo+PiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIElPTU1VX1NUQVRVU19DT01QX1dBSVRfSU5UX1NISUZUKTsKPj4gKyAgICAgICAgY29tcF93
YWl0ID0gc3RhdHVzICYgSU9NTVVfU1RBVFVTX0NPTVBfV0FJVF9JTlQ7Cj4gVW5sZXNzIHlvdSBh
bHNvIGNoYW5nZSBjb21wX3dhaXQgdG8gYm9vbCwgdGhpcyBqdXN0IGhhcHBlbnMgdG8KPiBiZSBj
b3JyZWN0IHRoaXMgd2F5IGJlY2F1c2Ugb2YgdGhlIGJpdCBjaGVja2VkIGJlaW5nIGF0IGEgbG93
Cj4gZW5vdWdoIHBvc2l0aW9uLgo+Cj4+IC0tLSBhL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2Ft
ZC9pb21tdV9pbml0LmMKPj4gKysrIGIveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvYW1kL2lvbW11
X2luaXQuYwo+PiBAQCAtMzUxLDEzICszNTEsMTIgQEAgc3RhdGljIHZvaWQgaW9tbXVfcmVzZXRf
bG9nKHN0cnVjdCBhbWRfaW9tbXUgKmlvbW11LAo+PiAgICAgIEJVR19PTighaW9tbXUgfHwgKChs
b2cgIT0gJmlvbW11LT5ldmVudF9sb2cpICYmIChsb2cgIT0gJmlvbW11LT5wcHJfbG9nKSkpOwo+
PiAgCj4+ICAgICAgcnVuX2JpdCA9ICggbG9nID09ICZpb21tdS0+ZXZlbnRfbG9nICkgPwo+PiAt
ICAgICAgICBJT01NVV9TVEFUVVNfRVZFTlRfTE9HX1JVTl9TSElGVCA6Cj4+IC0gICAgICAgIElP
TU1VX1NUQVRVU19QUFJfTE9HX1JVTl9TSElGVDsKPj4gKyAgICAgICAgSU9NTVVfU1RBVFVTX0VW
RU5UX0xPR19SVU4gOiBJT01NVV9TVEFUVVNfUFBSX0xPR19SVU47Cj4+ICAKPj4gICAgICAvKiB3
YWl0IHVudGlsIEV2ZW50TG9nUnVuIGJpdCA9IDAgKi8KPj4gICAgICBkbyB7Cj4+ICAgICAgICAg
IGVudHJ5ID0gcmVhZGwoaW9tbXUtPm1taW9fYmFzZSArIElPTU1VX1NUQVRVU19NTUlPX09GRlNF
VCk7Cj4+IC0gICAgICAgIGxvZ19ydW4gPSBpb21tdV9nZXRfYml0KGVudHJ5LCBydW5fYml0KTsK
Pj4gKyAgICAgICAgbG9nX3J1biA9IGVudHJ5ICYgcnVuX2JpdDsKPiBTYW1lIGhlcmUgZm9yIGxv
Z19ydW4gdGhlbi4gSSBhbHNvIHRoaW5rIHJ1bl9iaXQgd291bGQgYmV0dGVyCj4gYmVjb21lIHVu
c2lnbmVkIGludCB0aGVuLgo+Cj4gV2l0aCB0aGVzZSB0YWtlbiBjYXJlIG9mCj4gUmV2aWV3ZWQt
Ynk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KCkkgaGF2ZSBzZXBhcmF0ZSBjbGVh
bnVwIGRvaW5nIHRoYXQgKGFuZCBtb3JlKS7CoCBJIGRvbid0IHdhbnQgdG8gY29uZmxhdGUKdW5y
ZWxhdGVkIGNoYW5nZXMgLSB0aGlzIHBhdGNoIGlzIGNvbXBsaWNhdGVkIGVub3VnaCB0byBmb2xs
b3cuCgp+QW5kcmV3CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
