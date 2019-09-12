Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F8FBB0E81
	for <lists+xen-devel@lfdr.de>; Thu, 12 Sep 2019 14:03:51 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i8NmZ-00069q-6w; Thu, 12 Sep 2019 12:01:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=ncEf=XH=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i8NmX-00068v-GL
 for xen-devel@lists.xenproject.org; Thu, 12 Sep 2019 12:01:01 +0000
X-Inumbo-ID: fca2cc6a-d554-11e9-978d-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fca2cc6a-d554-11e9-978d-bc764e2007e4;
 Thu, 12 Sep 2019 12:01:00 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id F3604AF59;
 Thu, 12 Sep 2019 12:00:59 +0000 (UTC)
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <f6accb8b-38d9-ad9a-ec68-992d75f36a88@suse.com>
 <30619001-ca6c-0450-a0bb-4d71687b281a@suse.com>
 <20190912114502.ietnlugtxmazfgzi@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <35893b6b-7b2d-882e-462e-6b93fb6c9399@suse.com>
Date: Thu, 12 Sep 2019 14:01:00 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20190912114502.ietnlugtxmazfgzi@Air-de-Roger>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 5/9] x86/HVM: refuse CR3 loads with reserved
 (upper) bits set
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
Cc: George Dunlap <George.Dunlap@eu.citrix.com>,
 AndrewCooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTIuMDkuMjAxOSAxMzo0NSwgUm9nZXIgUGF1IE1vbm7DqSAgd3JvdGU6Cj4gT24gV2VkLCBT
ZXAgMTEsIDIwMTkgYXQgMDU6MjQ6NDFQTSArMDIwMCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IFdo
aWxlIGJpdHMgMTEgYW5kIGJlbG93IGFyZSwgaWYgbm90IHVzZWQgZm9yIG90aGVyIHB1cnBvc2Vz
LCByZXNlcnZlZAo+PiBidXQgaWdub3JlZCwgYml0cyBiZXlvbmQgcGh5c2ljYWwgYWRkcmVzcyB3
aWR0aCBhcmUgc3VwcG9zZWQgdG8gcmFpc2UKPj4gZXhjZXB0aW9ucyAoYXQgbGVhc3QgaW4gdGhl
IG5vbi1uZXN0ZWQgY2FzZTsgSSdtIG5vdCBjb252aW5jZWQgdGhlCj4+IGN1cnJlbnQgbmVzdGVk
IFNWTS9WTVggYmVoYXZpb3Igb2YgcmFpc2luZyAjR1AoMCkgaGVyZSBpcyBjb3JyZWN0LCBidXQK
Pj4gdGhhdCdzIG5vdCB0aGUgc3ViamVjdCBvZiB0aGlzIGNoYW5nZSkuCj4+Cj4+IEludHJvZHVj
ZSBjdXJyZCBhcyBhIGxvY2FsIHZhcmlhYmxlLCBhbmQgcmVwbGFjZSBvdGhlciB2LT5kb21haW4K
Pj4gaW5zdGFuY2VzIGF0IHRoZSBzYW1lIHRpbWUuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IEphbiBC
ZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KPiAKPiBMR1RNLCBqdXN0IHR3byBjb21tZW50cyB3
aGljaCBhcmUgbm90IHJlbGF0ZWQgdG8gZnVuY3Rpb25hbGl0eSwgc286Cj4gCj4gUmV2aWV3ZWQt
Ynk6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgoKVGhhbmtzLgoKPj4g
LS0tIGEveGVuL2FyY2gveDg2L2h2bS9odm0uYwo+PiArKysgYi94ZW4vYXJjaC94ODYvaHZtL2h2
bS5jCj4+IEBAIC0xMDA0LDYgKzEwMDQsMTMgQEAgc3RhdGljIGludCBodm1fbG9hZF9jcHVfY3R4
dChzdHJ1Y3QgZG9tYQo+PiAgICAgICAgICByZXR1cm4gLUVJTlZBTDsKPj4gICAgICB9Cj4+ICAK
Pj4gKyAgICBpZiAoIGN0eHQuY3IzICYgfigoMVVMIDw8IGQtPmFyY2guY3B1aWQtPmV4dGQubWF4
cGh5c2FkZHIpIC0gMSkgKQo+PiArICAgIHsKPj4gKyAgICAgICAgcHJpbnRrKFhFTkxPR19HX0VS
UiAiSFZNJWQgcmVzdG9yZTogYmFkIENSMyAlIyIgUFJJeDY0ICJcbiIsCj4gCj4gZ3ByaW50ayB3
b3VsZCBiZSBtb3JlIG5hdHVyYWwgaGVyZSBJTU8uCgpJIGRvbid0IHRoaW5rIHNvLCBubyAtIHRo
ZSAlcHYgdmFsdWUgYWRkaXRpb25hbGx5IGdldHRpbmcgbG9nZ2VkCmJ5IGdwcmludGsoKSBoYXMg
bm8gcmVhbCB1c2UgaW4gdGhpcyBjYXNlLgoKPj4gQEAgLTIyOTAsMTAgKzIyOTcsMTkgQEAgaW50
IGh2bV9zZXRfY3IwKHVuc2lnbmVkIGxvbmcgdmFsdWUsIGJvbwo+PiAgaW50IGh2bV9zZXRfY3Iz
KHVuc2lnbmVkIGxvbmcgdmFsdWUsIGJvb2wgbm9mbHVzaCwgYm9vbCBtYXlfZGVmZXIpCj4+ICB7
Cj4+ICAgICAgc3RydWN0IHZjcHUgKnYgPSBjdXJyZW50Owo+PiArICAgIHN0cnVjdCBkb21haW4g
KmN1cnJkID0gdi0+ZG9tYWluOwo+PiAgICAgIHN0cnVjdCBwYWdlX2luZm8gKnBhZ2U7Cj4+ICAg
ICAgdW5zaWduZWQgbG9uZyBvbGQgPSB2LT5hcmNoLmh2bS5ndWVzdF9jclszXTsKPj4gIAo+PiAt
ICAgIGlmICggbWF5X2RlZmVyICYmIHVubGlrZWx5KHYtPmRvbWFpbi0+YXJjaC5tb25pdG9yLndy
aXRlX2N0cmxyZWdfZW5hYmxlZCAmCj4+ICsgICAgaWYgKCB2YWx1ZSAmIH4oKDFVTCA8PCBjdXJy
ZC0+YXJjaC5jcHVpZC0+ZXh0ZC5tYXhwaHlzYWRkcikgLSAxKSApCj4gCj4gSSB3b3VsZCBjb25z
aWRlciBpbnRyb2R1Y2luZyBhIG1hY3JvL2lubGluZSBoZWxwZXIgZm9yIHRoaXMsIHNpbmNlCj4g
aXQncyBhbHJlYWR5IHVzZWQgdHdpY2UgaW4gdGhpcyBwYXRjaC4KCldlbGwsIHllcywgSSBjb3Vs
ZCBkbyB0aGlzIGluIGEgcHJlcmVxIHBhdGNoLCB0YWtpbmcgY2FyZSBvZiB0aGUKc2FtZSBleHBy
ZXNzaW9uIGluIGd1ZXN0X3B0LmguIEdyZXAtaW5nIHRoZSB0cmVlIEkgc2VlIGEgYmV0dGVyCndh
eSBvZiBkb2luZyB0aGlzIHRob3VnaCAoaW4gcGFnaW5nLmgpLCBhbmQgaGVuY2UgSSBndWVzcyBJ
J2xsCnN3aXRjaCBib3RoIHRvCgogICAgaWYgKCA8VkFMPiA+PiBjdXJyZC0+YXJjaC5jcHVpZC0+
ZXh0ZC5tYXhwaHlzYWRkciApCgpJJ2xsIHRha2UgaXQgdGhhdCB0aGlzIHdvdWxkbid0IGludmFs
aWRhdGUgeW91IFItYi4KCkphbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
