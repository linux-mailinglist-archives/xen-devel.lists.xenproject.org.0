Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 09525130952
	for <lists+xen-devel@lfdr.de>; Sun,  5 Jan 2020 18:41:26 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1io9qa-0008UL-S0; Sun, 05 Jan 2020 17:37:52 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=BhB7=22=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1io9qZ-0008UG-Rb
 for xen-devel@lists.xenproject.org; Sun, 05 Jan 2020 17:37:51 +0000
X-Inumbo-ID: 17e3c334-2fe2-11ea-aa46-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 17e3c334-2fe2-11ea-aa46-12813bfff9fa;
 Sun, 05 Jan 2020 17:37:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1578245870;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=PTalYGCtxzpGLVFHdSETWApOj0eZ+7wY41xSl5j/9e8=;
 b=UxyHjxDCtJesrzSKc/TGXPIZh3kwZFKht4znMhTaRn+QYWBF/KKh3Lz4
 HLXm9Gg8ixbVaYTqvYrxRIRWfc+0QcIiHcBMQdE96Rn6dWNo+AmYWZg9f
 74GmNb+hExdBjf/B/ACXtDgRglGnvs2ZSGaS8+xZVoUYeiaJPdXD10q2R k=;
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
IronPort-SDR: WNAi1KzkWDfbnCjwIsj/iQUx1JcMRYjFR/iUMzvzcq4UxfUhXlAaqqEbvh+XB8GikmM6Adqm0u
 Jg7b4gvJuFjP1MKqP2+3FlGoEMb82LiP+apK29S5s1iYeualGRcDoEwd5jNp0Qc/VMM2T/K/pr
 VSouksFm97Z0kHZ/H9UqE4I9kI+7UdCOoA06EDHN/z69vuFcgLxbzQFYKDcN8QFxO5G70hj+Ma
 UKIhqlKM8SmzjlMFrPRw9VFMhC+OoKagTv3HXdWFpiTBLqSgX/jpF2KQCQBl7l6DE7cwiHfey0
 tKE=
X-SBRS: 2.7
X-MesageID: 10832815
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,399,1571716800"; d="scan'208";a="10832815"
To: Wei Liu <wl@xen.org>, Xen Development List <xen-devel@lists.xenproject.org>
References: <20200105164801.26278-1-liuwe@microsoft.com>
 <20200105164801.26278-2-liuwe@microsoft.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <eae9980b-90dd-e747-9400-7bc044b06360@citrix.com>
Date: Sun, 5 Jan 2020 17:37:44 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200105164801.26278-2-liuwe@microsoft.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH v3 1/5] x86/hyperv: setup hypercall page
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
Cc: Wei Liu <liuwe@microsoft.com>, Paul Durrant <paul@xen.org>,
 George Dunlap <george.dunlap@eu.citrix.com>,
 Michael Kelley <mikelley@microsoft.com>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDUvMDEvMjAyMCAxNjo0NywgV2VpIExpdSB3cm90ZToKPiBkaWZmIC0tZ2l0IGEveGVuL2Fy
Y2gveDg2L2d1ZXN0L2h5cGVydi9NYWtlZmlsZSBiL3hlbi9hcmNoL3g4Ni9ndWVzdC9oeXBlcnYv
TWFrZWZpbGUKPiBpbmRleCA2ODE3MDEwOWE5Li4xYTg4ODdkMmY0IDEwMDY0NAo+IC0tLSBhL3hl
bi9hcmNoL3g4Ni9ndWVzdC9oeXBlcnYvTWFrZWZpbGUKPiArKysgYi94ZW4vYXJjaC94ODYvZ3Vl
c3QvaHlwZXJ2L01ha2VmaWxlCj4gQEAgLTEgKzEsMiBAQAo+ICtvYmoteSArPSBoeXBlcmNhbGxf
cGFnZS5vCj4gIG9iai15ICs9IGh5cGVydi5vCj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9n
dWVzdC9oeXBlcnYvaHlwZXJjYWxsX3BhZ2UuUyBiL3hlbi9hcmNoL3g4Ni9ndWVzdC9oeXBlcnYv
aHlwZXJjYWxsX3BhZ2UuUwo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gaW5kZXggMDAwMDAwMDAw
MC4uNmQ2YWI5MTNiZQo+IC0tLSAvZGV2L251bGwKPiArKysgYi94ZW4vYXJjaC94ODYvZ3Vlc3Qv
aHlwZXJ2L2h5cGVyY2FsbF9wYWdlLlMKPiBAQCAtMCwwICsxLDIxIEBACj4gKyNpbmNsdWRlIDxh
c20vYXNtX2RlZm5zLmg+Cj4gKyNpbmNsdWRlIDxhc20vcGFnZS5oPgo+ICsKPiArICAgICAgICAu
c2VjdGlvbiAiLnRleHQucGFnZV9hbGlnbmVkIiwgImF4IiwgQHByb2diaXRzCj4gKyAgICAgICAg
LnAyYWxpZ24gUEFHRV9TSElGVAo+ICtHTE9CQUwoaHZfaHlwZXJjYWxsX3BhZ2UpCj4gKyAgICAg
ICAgLyogUmV0dXJuIC0xIGZvciAibm90IHlldCByZWFkeSIgc3RhdGUgKi8KPiArICAgICAgICBt
b3YgLTEsICVyYXgKPiArICAgICAgICByZXQKPiArMToKPiArICAgICAgICAvKiBGaWxsIHRoZSBy
ZXN0IHdpdGggYHJldGAgKi8KPiArICAgICAgICAuZmlsbCBQQUdFX1NJWkUgLSAoMWIgLSBodl9o
eXBlcmNhbGxfcGFnZSksIDEsIDB4YzMKCklmIHlvdSB3YW50IHRvIGZpbGwgd2l0aCByZXRzLCB5
b3UgY2FuIGRvIHRoaXMgbW9yZSBzaW1wbHkgd2l0aDoKCsKgwqDCoCAucDJsaWduIFBBR0VfU0hJ
RlQsIDB4YzMKCndoaWNoIHdpbGwgZG8gdGhlIHNpemUgY2FsY3VsYXRpb24gZm9yIHlvdS4KClRo
YXQgc2FpZCwgSSByZXRyYWN0IG15IHN0YXRlbWVudCBhYm91dCB3YW50aW5nIHRoaXMgaW4gdGhl
IG1pZGRsZSBvZgoudGV4dC7CoCAoU29ycnkuwqAgU2VlIGJlbG93LikKCj4gZGlmZiAtLWdpdCBh
L3hlbi9hcmNoL3g4Ni9ndWVzdC9oeXBlcnYvaHlwZXJ2LmMgYi94ZW4vYXJjaC94ODYvZ3Vlc3Qv
aHlwZXJ2L2h5cGVydi5jCj4gaW5kZXggOGQzODMxM2Q3YS4uMzgxYmUyYTY4YyAxMDA2NDQKPiAt
LS0gYS94ZW4vYXJjaC94ODYvZ3Vlc3QvaHlwZXJ2L2h5cGVydi5jCj4gKysrIGIveGVuL2FyY2gv
eDg2L2d1ZXN0L2h5cGVydi9oeXBlcnYuYwo+IEBAIC03Miw2ICs3MiwyNyBAQCBjb25zdCBzdHJ1
Y3QgaHlwZXJ2aXNvcl9vcHMgKl9faW5pdCBoeXBlcnZfcHJvYmUodm9pZCkKPiAgICAgIHJldHVy
biAmb3BzOwo+ICB9Cj4gIAo+ICtzdGF0aWMgdm9pZCBfX2luaXQgc2V0dXBfaHlwZXJjYWxsX3Bh
Z2Uodm9pZCkKPiArewo+ICsgICAgdW5pb24gaHZfeDY0X21zcl9oeXBlcmNhbGxfY29udGVudHMg
aHlwZXJjYWxsX21zcjsKPiArCj4gKyAgICByZG1zcmwoSFZfWDY0X01TUl9IWVBFUkNBTEwsIGh5
cGVyY2FsbF9tc3IuYXNfdWludDY0KTsKPiArICAgIGh5cGVyY2FsbF9tc3IuZW5hYmxlID0gMTsK
PiArICAgIGh5cGVyY2FsbF9tc3IuZ3Vlc3RfcGh5c2ljYWxfYWRkcmVzcyA9Cj4gKyAgICAgICAg
X19wYShodl9oeXBlcmNhbGxfcGFnZSkgPj4gSFZfSFlQX1BBR0VfU0hJRlQ7Cj4gKyAgICB3cm1z
cmwoSFZfWDY0X01TUl9IWVBFUkNBTEwsIGh5cGVyY2FsbF9tc3IuYXNfdWludDY0KTsKPiArfQo+
ICsKPiArc3RhdGljIHZvaWQgX19pbml0IHNldHVwKHZvaWQpCj4gK3sKPiArICAgIHNldHVwX2h5
cGVyY2FsbF9wYWdlKCk7Cj4gK30KClRoZSBUTEZTIHNheXMgdGhhdCB3cml0aW5nIGVuYWJsZSB3
aWxsIGZhaWwgdW50aWwgdGhlIE9TIGlkZW50aXR5IGlzCnNldCwgd2hpY2ggQUZBQ0lULCBpc24n
dCBkb25lIGFueXdoZXJlIGluIHRoZSBzZXJpZXMuwqAgVGhlIHdob2xlCnNlcXVlbmNlIGlzIGRl
c2NyaWJlZCBpbiAiMy4xMyBFc3RhYmxpc2hpbmcgdGhlIEh5cGVyY2FsbCBJbnRlcmZhY2UiCgpU
aGUgbG9ja2VkIGJpdCBpcyBwcm9iYWJseSBhIGdvb2QgaWRlYSwgYnV0IG9uZSBhc3BlY3QgbWlz
c2luZyBoZXJlIGlzCnRoZSBjaGVjayB0byBzZWUgd2hldGhlciB0aGUgaHlwZXJjYWxsIHBhZ2Ug
aXMgYWxyZWFkeSBlbmFibGVkLCB3aGljaCBJCmV4cGVjdCBpcyBmb3IgYSBrZXhlYyBjcmFzaCBz
Y2VuYXJpby4KCkhvd2V2ZXIsIHRoZSBtb3N0IGltcG9ydGFudCBwb2ludCBpcyB0aGUgb25lIHdo
aWNoIGRlc2NyaWJlcyB0aGUgI0dQCnByb3BlcnRpZXMgb2YgdGhlIGd1ZXN0IHRyeWluZyB0byBt
b2RpZnkgdGhlIHBhZ2UuwqAgVGhpcyBjYW4gb25seSBiZQphY2hpZXZlZCB3aXRoIGFuIEVQVC9O
UFQgbWFwcGluZyBsYWNraW5nIHRoZSBXIHBlcm1pc3Npb24sIHdoaWNoIHdpbGwKc2hhdHRlciBo
b3N0IHN1cGVycGFnZXMuwqDCoCBUaGVyZWZvcmUsIHB1dHRpbmcgaXQgaW4gLnRleHQgaXMgZ29p
bmcgdG8gYmUKcmF0aGVyIHBvb3IsIHBlcmYgd2lzZS4KCkkgYWxzbyBub3RlIHRoYXQgWGVuJ3Mg
aW1wbGVtZW50YXRpb24gb2YgdGhlIFZpcmlkaWFuIGh5cGVyY2FsbCBwYWdlCmRvZXNuJ3QgY29u
Zm9ybSB0byB0aGVzZSBwcm9wZXJ0aWVzLCBhbmQgd2FudHMgZml4aW5nLsKgIEl0IGlzIGdvaW5n
IHRvCm5lZWQgYSBuZXcga2luZCBpZGVudGlmaWNhdGlvbiBvZiB0aGUgcGFnZSAocHJvYmFibHkg
YSBuZXcgcDJtIHR5cGUpCndoaWNoIGluamVjdHMgI0dQIGlmIHdlIGV2ZXIgc2VlIGFuIEVQVF9W
SU9MQVRJT04vTlBUX0ZBVUxUIGFnYWluc3QgaXQuCgpBcyBmb3Igc3VnZ2VzdGlvbnMgaGVyZSwg
SSdtIHN0cnVnZ2xpbmcgdG8gZmluZCBhbnkgbWVtb3J5IG1hcCBkZXRhaWxzCmV4cG9zZWQgaW4g
dGhlIFZpcmlkaWFuIGludGVyZmFjZSwgYW5kIHRoZXJlZm9yZSB3aGljaCBnZm4gaXMgYmVzdCB0
bwpjaG9vc2UuwqAgSSBoYXZlIGEgc2lua2luZyBmZWVsaW5nIHRoYXQgdGhlIGFuc3dlciBpcyBB
Q1BJLi4uCgp+QW5kcmV3CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
