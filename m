Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D1F5C49D2
	for <lists+xen-devel@lfdr.de>; Wed,  2 Oct 2019 10:43:44 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iFaBd-0002em-PJ; Wed, 02 Oct 2019 08:40:41 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=bv4y=X3=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iFaBc-0002eh-NI
 for xen-devel@lists.xenproject.org; Wed, 02 Oct 2019 08:40:40 +0000
X-Inumbo-ID: 4f13b2fc-e4f0-11e9-9711-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id 4f13b2fc-e4f0-11e9-9711-12813bfff9fa;
 Wed, 02 Oct 2019 08:40:38 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 51FBFAE39;
 Wed,  2 Oct 2019 08:40:37 +0000 (UTC)
To: Paul Durrant <paul.durrant@citrix.com>
References: <20191001151159.861-1-paul.durrant@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <2857a023-87ed-8220-7b22-51f1048f9de6@suse.com>
Date: Wed, 2 Oct 2019 10:40:44 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191001151159.861-1-paul.durrant@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH-for-4.13 v2] x86/mm: don't needlessly veto
 migration
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
Cc: Juergen Gross <jgross@suse.com>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDEuMTAuMjAxOSAxNzoxMSwgUGF1bCBEdXJyYW50IHdyb3RlOgo+IE5vdyB0aGF0IHhsLmNm
ZyBoYXMgYW4gb3B0aW9uIHRvIGV4cGxpY2l0bHkgZW5hYmxlIElPTU1VIG1hcHBpbmdzIGZvciBh
Cj4gZG9tYWluLCBtaWdyYXRpb24gbWF5IGJlIG5lZWRsZXNzbHkgdmV0b2VkIGR1ZSB0byB0aGUg
Y2hlY2sgb2YKPiBpc19pb21tdV9lbmFibGVkKCkgaW4gcGFnaW5nX2xvZ19kaXJ0eV9lbmFibGUo
KS4KPiBUaGVyZSBpcyBhY3R1YWxseSBubyBuZWVkIHRvIHByZXZlbnQgbG9nZGlydHkgZnJvbSBi
ZWluZyBlbmFibGVkIHVubGVzcwo+IGRldmljZXMgYXJlIGFzc2lnbmVkIHRvIGEgZG9tYWluIGFu
ZCB0aGF0IGRvbWFpbiBpcyBzaGFyaW5nIEhBUCBtYXBwaW5ncwo+IHdpdGggdGhlIElPTU1VIChp
biB3aGljaCBjYXNlIGRpc2FibGluZyB3cml0ZSBwZXJtaXNzaW9ucyBpbiB0aGUgUDJNIG1heQo+
IGNhdXNlIERNQSBmYXVsdHMpLiBJdCBpcyBxdWl0ZSBwb3NzaWJsZSB0aGF0IHNvbWUgYXNzaWdu
ZWQgZGV2aWNlcyBtYXkKPiBwcm92aWRlIGluZm9ybWF0aW9uIGFib3V0IHdoaWNoIHBhZ2VzIG1h
eSBoYXZlIGJlZW4gZGlydGllZCBieSBETUEgdmlhCj4gYW4gQVBJIGV4cG9ydGVkIGJ5IHRoZWly
IG1hbmFnaW5nIGVtdWxhdG9yLiBUaHVzIFhlbidzIGxvZ2RpcnR5IG1hcCBpcyBvbmx5Cj4gb25l
IHNvdXJjZSBvZiBpbmZvcm1hdGlvbiB0aGF0IG1heSBiZSBhdmFpbGFibGUgdG8gdGhlIHRvb2xz
dGFjayB3aGVuCj4gcGVyZm9ybWluZyBhIG1pZ3JhdGlvbiBhbmQgaGVuY2UgaXQgaXMgdGhlIHRv
b2xzdGFjayB0aGF0IGlzIGJlc3QgcGxhY2VkCj4gdG8gZGVjaWRlIHVuZGVyIHdoYXQgY2lyY3Vt
c3RhbmNlcyBpdCBjYW4gYmUgcGVyZm9ybWVkLCBub3QgdGhlIGh5cGVydmlzb3IuCgpXaGlsZSBJ
J20gaGFwcHkgYWJvdXQgdGhlIGV4dGVuZGVkIGRlc2NyaXB0aW9uLCBpdCdzIHN0aWxsIHdyaXR0
ZW4gaW4KYSB3YXkgc3VnZ2VzdGluZyB0aGF0IHRoaXMgaXMgdGhlIG9ubHkgcG9zc2libGUgd2F5
IG9mIHZpZXdpbmcgdGhpbmdzLgpBcyBleHByZXNzZWQgYnkgR2VvcmdlIGFuZCBtZSwgcHV0dGlu
ZyB0aGUgaHlwZXJ2aXNvciBpbiBhIHBvc2l0aW9uIHRvCmJlIGFibGUgdG8ganVkZ2UgaXMgYXQg
bGVhc3QgYW4gYWx0ZXJuYXRpdmUgd29ydGggY29uc2lkZXJpbmcuCgpXaGF0J3Mgd29yc2UgdGhv
dWdoIC0geW91IGRvbid0IGdvIGFsbCB0aGUgd2F5IHRvIHRoZSBlbmQgb2Ygd2hhdCB5b3VyCmFy
Z3VtZW50YXRpb24gd291bGQgbGVhZCB0bzogVGhlcmUncyBubyByZWFzb24gZm9yIFhlbiB0byB2
ZXRvIHRoZQpyZXF1ZXN0IHRoZW4gZXZlbiBpbiB0aGUgc2hhcmVkIHBhZ2UgdGFibGUgY2FzZS4g
VGhlIG9ubHkgZGV2aWNlCmFzc2lnbmVkIHRvIGEgZ3Vlc3QgaW4gcXVlc3Rpb24gbWF5IGJlIGRv
aW5nIERNQSByZWFkcyBvbmx5LiBGb2xsb3dpbmcKeW91ciByZWFzb25pbmcsIFhlbiBzaG91bGRu
J3QgYmUgZ2V0dGluZyBpbiB0aGUgd2F5IHRoZW4gZWl0aGVyLiBPbmNlCmFnYWluIHRoZSBzaXR1
YXRpb24gY291bGQgYmUgdGFrZW4gY2FyZSBvZiBieSBpbmZvcm1pbmcgWGVuIGFib3V0IHRoaXMK
cHJvcGVydHkgb2YgYSBkZXZpY2UgKGFzc3VtaW5nIGl0IGNhbid0IHRlbGwgYWxsIGJ5IGl0c2Vs
ZikuCgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
