Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E4D9112D78
	for <lists+xen-devel@lfdr.de>; Wed,  4 Dec 2019 15:32:19 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1icVdX-0003wu-04; Wed, 04 Dec 2019 14:28:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=+qu5=Z2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1icVdV-0003wp-HO
 for xen-devel@lists.xenproject.org; Wed, 04 Dec 2019 14:28:13 +0000
X-Inumbo-ID: 4d1c858a-16a2-11ea-aea8-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4d1c858a-16a2-11ea-aea8-bc764e2007e4;
 Wed, 04 Dec 2019 14:28:12 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id D1F14AF8C;
 Wed,  4 Dec 2019 14:28:11 +0000 (UTC)
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20191129112851.19273-1-roger.pau@citrix.com>
 <20191129112851.19273-5-roger.pau@citrix.com>
 <7ed6d33a-8f99-684b-f5ca-d3f4cb8d984b@suse.com>
 <20191204135142.GL980@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <4b027211-359d-a669-f93b-baf860819504@suse.com>
Date: Wed, 4 Dec 2019 15:28:25 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191204135142.GL980@Air-de-Roger>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2 4/4] x86/apic: allow enabling x2APIC mode
 regardless of interrupt remapping
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
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDQuMTIuMjAxOSAxNDo1MSwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPiBPbiBUdWUsIERl
YyAwMywgMjAxOSBhdCAwNDozMzowOVBNICswMTAwLCBKYW4gQmV1bGljaCB3cm90ZToKPj4gT24g
MjkuMTEuMjAxOSAxMjoyOCwgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+Pj4gLS0tIGEveGVuL2Fy
Y2gveDg2L2FwaWMuYwo+Pj4gKysrIGIveGVuL2FyY2gveDg2L2FwaWMuYwo+Pj4gQEAgLTQ5Miw3
ICs0OTIsOCBAQCBzdGF0aWMgdm9pZCBfX2VuYWJsZV94MmFwaWModm9pZCkKPj4+ICAKPj4+ICBz
dGF0aWMgdm9pZCByZXN1bWVfeDJhcGljKHZvaWQpCj4+PiAgewo+Pj4gLSAgICBpb21tdV9lbmFi
bGVfeDJhcGljKCk7Cj4+PiArICAgIGlmICggaW9tbXVfc3VwcG9ydHNfeDJhcGljKCkgKQo+Pj4g
KyAgICAgICAgaW9tbXVfZW5hYmxlX3gyYXBpYygpOwo+Pgo+PiBUaGUgaG9va3MgY2FsbGVkIGJ5
IHRoaXMgZnVuY3Rpb24gYXJlIF9faW5pdCwgYW5kIGF0IGxlYXN0IHRoZSBBTUQKPj4gb25lIGFs
c28gaXNuJ3QgKEkgdGhpbmspIHByZXBhcmVkIHRvIGJlIGNhbGxlZCBtb3JlIHRoYW4gb25jZS4K
PiAKPiBJdCdzIGFscmVhZHkgY2FsbGVkIHR3aWNlLCB0aGVyZSdzIG9uZSBjYWxsIHRvIGlvbW11
X3N1cHBvcnRzX3gyYXBpYwo+IGluIHgyYXBpY19ic3Bfc2V0dXAgYW5kIGFub3RoZXIgb25lIGlu
IGlvbW11X2VuYWJsZV94MmFwaWMsIHNvIEkgdGhpbmsKPiBjYWxsaW5nIGlvbW11X3N1cHBvcnRz
X3gyYXBpYyBtdWx0aXBsZSB0aW1lcyBpcyBmaW5lIChvciB3ZSB3b3VsZAo+IGFscmVhZHkgaGF2
ZSBpc3N1ZXMpLgoKQWgsIHJpZ2h0IC0gYW1kX2lvbW11X3ByZXBhcmUoKSBiYWlscyAocmVsYXRp
dmVseSkgZWFybHkgd2hlbgpub3RpY2luZyBpdCBoYWQgYmVlbiBjYWxsZWQgYmVmb3JlLgoKSmFu
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
