Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DB75145797
	for <lists+xen-devel@lfdr.de>; Wed, 22 Jan 2020 15:18:00 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iuGnM-0005vz-PY; Wed, 22 Jan 2020 14:15:48 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=q9GK=3L=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iuGnL-0005vr-2o
 for xen-devel@lists.xenproject.org; Wed, 22 Jan 2020 14:15:47 +0000
X-Inumbo-ID: ad657f51-3d21-11ea-bc52-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ad657f51-3d21-11ea-bc52-12813bfff9fa;
 Wed, 22 Jan 2020 14:15:46 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id A2CDDB4B4;
 Wed, 22 Jan 2020 14:15:44 +0000 (UTC)
To: Jason Andryuk <jandryuk@gmail.com>
References: <20200117110811.43321-1-roger.pau@citrix.com>
 <538864f7-f537-be0d-e37b-8f29baf82ee0@suse.com>
 <20200120171840.GF11756@Air-de-Roger>
 <96edb88c-5ae3-22a1-913d-83f76c925270@suse.com>
 <20200121102941.GH11756@Air-de-Roger>
 <624c69b6-9a9d-7719-fdec-1c6e939a9f65@suse.com>
 <20200121155708.GI11756@Air-de-Roger>
 <ddac90c5-2fe5-ba92-d7ab-f258f483521d@suse.com>
 <20200121165758.GK11756@Air-de-Roger>
 <73a7af47-bcf6-50f9-8901-e8c2da2ac908@suse.com>
 <20200122105155.GA57924@desktop-tdan49n.eng.citrite.net>
 <CAKf6xpvpU1oRx6aHxaBY=qL=yd6QU3jWY_54k-mtrojscxKaOQ@mail.gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <e92b78ff-2bea-963b-0689-7efe789c9761@suse.com>
Date: Wed, 22 Jan 2020 15:15:25 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <CAKf6xpvpU1oRx6aHxaBY=qL=yd6QU3jWY_54k-mtrojscxKaOQ@mail.gmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2] x86/hvmloader: round up memory BAR size
 to 4K
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
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjIuMDEuMjAyMCAxNTowNCwgSmFzb24gQW5kcnl1ayB3cm90ZToKPiBPbiBXZWQsIEphbiAy
MiwgMjAyMCBhdCA1OjUyIEFNIFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29t
PiB3cm90ZToKPj4gT24gV2VkLCBKYW4gMjIsIDIwMjAgYXQgMTE6Mjc6MjRBTSArMDEwMCwgSmFu
IEJldWxpY2ggd3JvdGU6Cj4+PiBPbiAyMS4wMS4yMDIwIDE3OjU3LCBSb2dlciBQYXUgTW9ubsOp
IHdyb3RlOgo+Pj4+IEllOiBYZW4gc2hvdWxkIHJlZnVzZSB0byBwYXNzIHRocm91Z2ggYW55IG1l
bW9yeSBCQVIgdGhhdCdzIG5vdCBwYWdlCj4+Pj4gYWxpZ25lZC4gSG93IHRoZSBhbGlnbm1lbnQg
aXMgYWNjb21wbGlzaGVkIGlzIG91dCBvZiB0aGUgc2NvcGUgdG8gWGVuLAo+Pj4+IGFzIGxvbmcg
YXMgbWVtb3J5IEJBUnMgYXJlIGFsaWduZWQuCj4+Pgo+Pj4gVGhhdCdzIGFuIGFjY2VwdGFibGUg
bW9kZWwsIGFzIGxvbmcgYXMgaXQgd291bGRuJ3QgdHlwaWNhbGx5IGJyZWFrCj4+PiBleGlzdGlu
ZyBjb25maWd1cmF0aW9ucywgYW5kIGFzIGxvbmcgYXMgZm9yIHRob3NlIHdobyB3ZSB3b3VsZAo+
Pj4gYnJlYWsgdGhlcmUgYXJlIGVhc3kgdG8gZm9sbG93IHN0ZXBzIHRvIHVuYnJlYWsgdGhlaXIg
c2V0dXBzLgo+Pgo+PiBKYXNvbiwgZG8geW91IHRoaW5rIHlvdSBjb3VsZCB0YWtlIGEgc3RhYiBh
dCBhZGRpbmcgYSBjaGVjayBpbiBvcmRlcgo+PiB0byBtYWtlIHN1cmUgbWVtb3J5IEJBUiBhZGRy
ZXNzZXMgYXJlIDRLIGFsaWduZWQgd2hlbiBhc3NpZ25pbmcgYQo+PiBkZXZpY2UgdG8gYSBndWVz
dD8KPiAKPiBJIGNhbiB0YWtlIGEgbG9vay4gIFlvdSB3YW50IHRoZSBoeXBlcnZpc29yIHRvIG1h
a2UgdGhlIGVuZm9yY2VtZW50Cj4gYW5kIG5vdCB0aGUgdG9vbHN0YWNrPwoKV2VsbCwgaWYgLi4u
Cgo+IFdhdmluZyBteSBoYW5kcyBhIGxpdHRsZSBiaXQsIGJ1dCBpdCBtaWdodCBiZSBwb3NzaWJs
ZSB0byBoYXZlIGB4bAo+IHBjaS1hc3NpZ25hYmxlLWFkZGAgdHJpZ2dlciB0aGUgbGludXggcGNp
IHJlc291cmNlX2FsaWdubWVudCBhdAo+IHJ1bnRpbWUuCgouLi4gdGhpcyB3YXMgcG9zc2libGUs
IHRoZW4gaXQgd291bGQgYmUgYSBjaGFuZ2UgdG8gYm90aC4gQW55d2F5IEkKdGhpbmsgZm9yIHRo
ZSBwdXJwb3NlIG9mIGJldHRlciBkaWFnbm9zdGljcyB0aGUgdG9vbCBzdGFjayBzaG91bGQKZG8g
dGhlIGNoZWNrLCBidXQgdGhlIGh5cGVydmlzb3Igc2hvdWxkIGRvIHNvIHRvbyAoYXMgdGhlIHVs
dGltYXRlCmVudGl0eSB3YW50aW5nIHRoaXMgZW5mb3JjZWQpLgoKSmFuCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
