Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BC08162759
	for <lists+xen-devel@lfdr.de>; Tue, 18 Feb 2020 14:47:59 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j43BV-0005vr-9M; Tue, 18 Feb 2020 13:45:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=u3z7=4G=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1j43BU-0005vm-CJ
 for xen-devel@lists.xenproject.org; Tue, 18 Feb 2020 13:45:08 +0000
X-Inumbo-ID: df8931b4-5254-11ea-ade5-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id df8931b4-5254-11ea-ade5-bc764e2007e4;
 Tue, 18 Feb 2020 13:45:07 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 409DDBC08;
 Tue, 18 Feb 2020 13:45:06 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20200128125216.709-1-andrew.cooper3@citrix.com>
 <036b773e-08c0-a85d-3761-e833492278e3@suse.com>
 <a9771142-4fe4-d2da-eb8f-85f061bcab79@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <1f6a1191-0011-bfda-e7b3-2063d69eaf44@suse.com>
Date: Tue, 18 Feb 2020 14:45:05 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <a9771142-4fe4-d2da-eb8f-85f061bcab79@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] x86/apic: Improve current_local_apic_mode()
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

T24gMTQuMDIuMjAyMCAxODo1OSwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAyOC8wMS8yMDIw
IDE0OjEwLCBKYW4gQmV1bGljaCB3cm90ZToKPj4gT24gMjguMDEuMjAyMCAxMzo1MiwgQW5kcmV3
IENvb3BlciB3cm90ZToKPj4+IGJvb3RfY3B1X2hhcyhYODZfRkVBVFVSRV9YMkFQSUMpIGRvZXNu
J3QgbmVlZCBjaGVja2luZyB0byBpbnRlcnByZXQKPj4+IEFQSUNfQkFTRV9FWFRELgo+PiBIbW0s
IHRoZSBjb21tZW50IHlvdSByZW1vdmUgLi4uCj4+Cj4+PiAtLS0gYS94ZW4vYXJjaC94ODYvYXBp
Yy5jCj4+PiArKysgYi94ZW4vYXJjaC94ODYvYXBpYy5jCj4+PiBAQCAtMTUzNCwxOCArMTUzNCwx
NCBAQCB2b2lkIF9faW5pdCByZWNvcmRfYm9vdF9BUElDX21vZGUodm9pZCkKPj4+ICAvKiBMb29r
IGF0IHRoZSBiaXRzIGluIE1TUl9BUElDX0JBU0UgYW5kIHdvcmsgb3V0IHdoaWNoIEFQSUMgbW9k
ZSB3ZSBhcmUgaW4gKi8KPj4+ICBlbnVtIGFwaWNfbW9kZSBjdXJyZW50X2xvY2FsX2FwaWNfbW9k
ZSh2b2lkKQo+Pj4gIHsKPj4+IC0gICAgdTY0IG1zcl9jb250ZW50czsKPj4+ICsgICAgdWludDMy
X3QgaGlnaCwgbG93Owo+Pj4gIAo+Pj4gLSAgICByZG1zcmwoTVNSX0FQSUNfQkFTRSwgbXNyX2Nv
bnRlbnRzKTsKPj4+ICsgICAgcmRtc3IoTVNSX0FQSUNfQkFTRSwgbG93LCBoaWdoKTsKPj4+ICAK
Pj4+IC0gICAgLyogUmVhZGluZyBFWFREIGJpdCBmcm9tIHRoZSBNU1IgaXMgb25seSB2YWxpZCBp
ZiBDUFVJRAo+Pj4gLSAgICAgKiBzYXlzIHNvLCBlbHNlIHJlc2VydmVkICovCj4+IC4uLiBzdGF0
ZXMgdGhlIHNpdHVhdGlvbiBjb3JyZWN0bHksIEkgdGhpbmsuIEkgZ3Vlc3MgdGhlcmUncyBubyBo
YXJkd2FyZQo+PiBhbGxvd2luZyB0aGUgYml0IHRvIGJlIHNldCB3aXRob3V0IHRoZSBmZWF0dXJl
IGJlaW5nIHRoZXJlLCBidXQgYSB2aXJ0dWFsCj4+IG9yIGVtdWxhdGVkIGVudmlyb25tZW50IGNv
dWxkIGdvIGFuZCBzZXQgdGhlIGJpdCB3aXRob3V0IHZpb2xhdGluZyBhbnkKPj4gc3BlY2lmaWNh
dGlvbiwgYXMgbG9uZyBhcyB0aGUgQ1BVSUQgYml0IGlzIGNsZWFyLgo+IAo+IEl0IGlzIHVucmVh
bGlzdGljIHRvIGV4cGVjdCB0aGF0IHNvbWUgZW11bGF0ZWQgZW52aXJvbm1lbnQgc3VwcG9ydHMK
PiBwcmVzZXJ2aW5nIG9mIGEgcmVzZXJ2ZWQgYml0IHdoZW4gcmVhbCBoYXJkd2FyZSB1c2VzICNH
UC4KCkhvd2V2ZXIgdW5yZWFsaXN0aWMgaXQgbWF5IGJlLCBkb24ndCB5b3UgYWdyZWUgaXQgdG8g
YmUgYmVzdCBpbgpxdWVzdGlvbmFibGUgY2FzZXMgaWYgd2Ugc3RheSBhcyBjbG9zZWx5IHRvIHRo
ZSBzcGVjIGFzIHBvc3NpYmxlPwpBbHNvIEkgaW50ZW50aW9uYWxseSBkaWRuJ3QgdGFsayBhYm91
dCB0aGUgYml0IGJlaW5nIHByZXNlcnZlZCwKYnV0IHRoZSBiaXQgcGVyaGFwcyBiZSB1bmlmb3Jt
bHkgc2V0LiBTaW1wbGlzdGljIHgyQVBJQwp2aXJ0dWFsaXphdGlvbiBjb3VsZCBhbHdheXMgc2V0
IHRoaXMgYml0ICh3aXRob3V0IHZpb2xhdGluZyB0aGUKc3BlYyksIHJlbHlpbmcgb24gY29uc3Vt
ZXJzIHRvIGFjdHVhbGx5IGluc3BlY3QgdGhlIENQVUlEIGJpdApmaXJzdC4gT25lIGxlc3MgY29u
ZGl0aW9uYWwgd2hlcmV2ZXIgdGhlIHZhbHVlIG9mIHRoZSBNU1IgZ2V0cwpjYWxjdWxhdGVkLgoK
SmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
