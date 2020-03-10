Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C40F317F440
	for <lists+xen-devel@lfdr.de>; Tue, 10 Mar 2020 11:01:43 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jBbeP-0008Em-Rj; Tue, 10 Mar 2020 09:58:13 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=EhAh=43=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jBbeO-0008Eh-JB
 for xen-devel@lists.xenproject.org; Tue, 10 Mar 2020 09:58:12 +0000
X-Inumbo-ID: a6af9678-62b5-11ea-ad45-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a6af9678-62b5-11ea-ad45-12813bfff9fa;
 Tue, 10 Mar 2020 09:58:11 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id E3DB1AC37;
 Tue, 10 Mar 2020 09:58:10 +0000 (UTC)
To: Wei Liu <wl@xen.org>
References: <20200219114411.26922-1-liuwe@microsoft.com>
 <20200219114411.26922-2-liuwe@microsoft.com>
 <26c31c83-c2d5-1379-9055-dd802c51d02b@suse.com>
 <20200309172552.i273f2re4y6uuklr@debian>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <3864acf5-aa3e-7849-56e4-11d7cace70db@suse.com>
Date: Tue, 10 Mar 2020 10:58:09 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200309172552.i273f2re4y6uuklr@debian>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v4 1/3] x86/hypervisor: pass flags to
 hypervisor_flush_tlb
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
Cc: Wei Liu <liuwe@microsoft.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Paul Durrant <pdurrant@amazon.com>, Michael Kelley <mikelley@microsoft.com>,
 Xen Development List <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDkuMDMuMjAyMCAxODoyNSwgV2VpIExpdSB3cm90ZToKPiBPbiBNb24sIE1hciAwOSwgMjAy
MCBhdCAwNTozODoxMlBNICswMTAwLCBKYW4gQmV1bGljaCB3cm90ZToKPj4gT24gMTkuMDIuMjAy
MCAxMjo0NCwgV2VpIExpdSB3cm90ZToKPj4+IC0tLSBhL3hlbi9pbmNsdWRlL2FzbS14ODYvZmx1
c2h0bGIuaAo+Pj4gKysrIGIveGVuL2luY2x1ZGUvYXNtLXg4Ni9mbHVzaHRsYi5oCj4+PiBAQCAt
MTIzLDYgKzEyMyw5IEBAIHZvaWQgc3dpdGNoX2NyM19jcjQodW5zaWduZWQgbG9uZyBjcjMsIHVu
c2lnbmVkIGxvbmcgY3I0KTsKPj4+ICAgLyogRmx1c2ggYWxsIEhWTSBndWVzdHMgbGluZWFyIFRM
QiAodXNpbmcgQVNJRC9WUElEKSAqLwo+Pj4gICNkZWZpbmUgRkxVU0hfR1VFU1RTX1RMQiAweDQw
MDAKPj4+ICAKPj4+ICsjZGVmaW5lIEZMVVNIX1RMQl9GTEFHU19NQVNLIChGTFVTSF9UTEIgfCBG
TFVTSF9UTEJfR0xPQkFMIHwgRkxVU0hfVkFfVkFMSUQgfCBcCj4+PiArICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgRkxVU0hfT1JERVJfTUFTSykKPj4KPj4gSSBkb24ndCB0aGluayBGTFVT
SF9PUkRFUl9NQVNLIHNob3VsZCBiZSBwYXJ0IG9mIHRoaXMsIGFzIGl0J3Mgbm90Cj4+IGV4Y2x1
c2l2ZWx5IFRMQi1mbHVzaCByZWxhdGVkLgo+IAo+IE15IGludGVudGlvbiB3YXMgdG8gY2FwdHVy
ZSBhbGwgZmxhZ3MgcGVydGluZW50IHRvIFRMQiBmbHVzaGVzLiBJIGRpZG4ndAo+IG1lYW4gdGhl
eSB3ZXJlIGV4Y2x1c2l2ZWx5IFRMQiBmbHVzaCByZWxhdGVkLgoKVGhhdCdzIHdoYXQgSSB1bmRl
cnN0b29kLCBidXQgdGhlIHJlc3VsdCBpcyBsZWFkaW5nIHRvIHBvc3NpYmxlIGFtYmlndWl0eS4K
VGhpbmtpbmcgYWJvdXQgaXQgYWdhaW4sIC4uLgoKPiBJIGNhbiByZW1vdmUgdGhlIG9yZGVyIG1h
c2sgZnJvbSB0aGUgbGlzdCBvZiBmbGFncy4gTm90IGEgYmlnIGRlYWwuCgouLi4gSSdtIGFmcmFp
ZCBJIGFsc28gaGF2ZSB0byBhc2sgZm9yIEZMVVNIX1ZBX1ZBTElEIHRvIGJlIGRyb3BwZWQsCmFz
IHRoYXQgb25lJ3Mgbm90IFRMQiBmbHVzaCByZWxhdGVkIGF0IGFsbC4gSW5zdGVhZCBpdCBpZGVu
dGlmaWVzCndoZXRoZXIgdGhlIGxpbmVhciBhZGRyZXNzIHByb3ZpZGVkIF9zdGlsbCBoYXNfIGEg
dmFsaWQgbWFwcGluZwoocmF0aGVyIHRoYW4gdGhlcmUgYmVpbmcgYW4gYWRkcmVzcyBwcm92aWRl
ZCBhdCBhbGwpLCBzdWNoIHRoYXQKQ0xGTFVTSCBiYXNlcyBjYWNoZSBmbHVzaGluZyB3b3VsZCBi
ZSB1c2FibGUuIEF0IHRoYXQgcG9pbnQgSQp3b25kZXIgd2hldGhlciB0aGUgc2VwYXJhdGUgY29u
c3RhbnQgaXMgc3RpbGwgb2YgbXVjaCB1c2UgYXQgYWxsLgoKSmFuCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
