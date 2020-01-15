Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3150013BC6B
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jan 2020 10:27:28 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iretr-0005T9-BK; Wed, 15 Jan 2020 09:23:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=wJf7=3E=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iretp-0005T4-W0
 for xen-devel@lists.xenproject.org; Wed, 15 Jan 2020 09:23:42 +0000
X-Inumbo-ID: b2cfc45e-3778-11ea-a985-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b2cfc45e-3778-11ea-a985-bc764e2007e4;
 Wed, 15 Jan 2020 09:23:32 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id B30FBB029;
 Wed, 15 Jan 2020 09:23:31 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20200113175020.32730-1-andrew.cooper3@citrix.com>
 <20200113175020.32730-5-andrew.cooper3@citrix.com>
 <91da9495-d274-ccaa-a09f-aa0650aff623@suse.com>
 <ecf2a65e-68ea-63c0-0fb3-576104d7e202@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <ce1d41a1-6865-2a0d-9aa0-30fc82cad557@suse.com>
Date: Wed, 15 Jan 2020 10:23:32 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <ecf2a65e-68ea-63c0-0fb3-576104d7e202@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 3/4] x86/boot: Create the l2_xenmap[]
 mappings dynamically
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

T24gMTQuMDEuMjAyMCAyMDozMSwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAxNC8wMS8yMDIw
IDE2OjQ1LCBKYW4gQmV1bGljaCB3cm90ZToKPj4gT24gMTMuMDEuMjAyMCAxODo1MCwgQW5kcmV3
IENvb3BlciB3cm90ZToKPj4+IC0tLSBhL3hlbi9hcmNoL3g4Ni9ib290L2hlYWQuUwo+Pj4gKysr
IGIveGVuL2FyY2gveDg2L2Jvb3QvaGVhZC5TCj4+PiBAQCAtNjY4LDYgKzY2OCwyMCBAQCB0cmFt
cG9saW5lX3NldHVwOgo+Pj4gICAgICAgICAgYWRkICAgICAlZXNpLHN5bV9mcyhfX3BhZ2VfdGFi
bGVzX3N0YXJ0KS04KCwlZWN4LDgpCj4+PiAgMjogICAgICBsb29wICAgIDFiCj4+PiAgCj4+PiAr
ICAgICAgICAvKiBNYXAgWGVuIGludG8gdGhlIGhpZ2hlciBtYXBwaW5ncyB1c2luZyAyTSBzdXBl
cnBhZ2VzLiAqLwo+Pj4gKyAgICAgICAgbGVhICAgICBfUEFHRV9QU0UgKyBQQUdFX0hZUEVSVklT
T1JfUldYICsgc3ltX2VzaShfc3RhcnQpLCAlZWF4Cj4+PiArICAgICAgICBtb3YgICAgICRzeW1f
b2Zmcyhfc3RhcnQpLCAgICVlY3ggICAvKiAlZWF4ID0gUFRFIHRvIHdyaXRlICAgICAgICAqLwo+
PiBUaGUgY29tbWVudCBpcyBvbiB0aGUgd3JvbmcgbGluZSwgaXNuJ3QgaXQ/IFBlcmhhcHMKPj4K
Pj4gICAgICAgICBsZWEgICAgIF9QQUdFX1BTRSArIFBBR0VfSFlQRVJWSVNPUl9SV1ggKyBzeW1f
ZXNpKF9zdGFydCksIFwKPj4gICAgICAgICAgICAgICAgICVlYXggICAgICAgICAgICAgICAgLyog
JWVheCA9IFBURSB0byB3cml0ZSAgICAgICAgKi8KPj4KPj4gPwo+IAo+IFRoYXQgaXMgd2h5IHRo
ZSBjb21tZW50IGhhZCB0aGUgcmVnaXN0ZXIgbmFtZSwgcmF0aGVyIHRoYW4gdHJ5aW5nIHRvCj4g
Y2xhaW0gdGhhdCAkc3ltX29mZnMoX3N0YXJ0KSB3YXMgdGhlIFBURSB0byB3cml0ZS4KPiAKPiBJ
IGRpZG4ndCByZWFsbHkgdGhpbmsgc3BsaXR0aW5nIHRoZSBsZWEgbGlrZSB0aGF0IGFjcm9zcyAy
IGxpbmVzIHdhcwo+IGJldHRlciB0aGFuIHRoaXMuCj4gCj4gSG93IGFib3V0IC8qICVlYXggPSBQ
VEUgdG8gd3JpdGUgXiDCoMKgwqDCoCAqLyB3aGljaCB3aWxsIHBvaW50IHByb3Blcmx5IGF0Cj4g
JWVheD8KCkZpbmUgd2l0aCBtZTsgSSBhc3N1bWUgeW91IG1lYW4gdGhpcyB0byBnbyBvbiBhIHNl
cGFyYXRlIGxpbmU/Cgo+Pj4gLS0tIGEveGVuL2FyY2gveDg2L2VmaS9lZmktYm9vdC5oCj4+PiAr
KysgYi94ZW4vYXJjaC94ODYvZWZpL2VmaS1ib290LmgKPj4+IEBAIC01ODUsNiArNTg1LDIwIEBA
IHN0YXRpYyB2b2lkIF9faW5pdCBlZmlfYXJjaF9tZW1vcnlfc2V0dXAodm9pZCkKPj4+ICAgICAg
aWYgKCAhZWZpX2VuYWJsZWQoRUZJX0xPQURFUikgKQo+Pj4gICAgICAgICAgcmV0dXJuOwo+Pj4g
IAo+Pj4gKyAgICAvKgo+Pj4gKyAgICAgKiBNYXAgWGVuIGludG8gdGhlIGhpZ2hlciBtYXBwaW5n
cywgdXNpbmcgMk0gc3VwZXJwYWdlcy4KPj4+ICsgICAgICoKPj4+ICsgICAgICogTkI6IFdlIGFy
ZSBjdXJyZW50bHkgaW4gcGh5c2ljYWwgbW9kZSwgc28gYSBSSVAtcmVsYXRpdmUgcmVsb2NhdGlv
bgo+Pj4gKyAgICAgKiBhZ2FpbnN0IF9zdGFydC9fZW5kIGdldHMgdGhlaXIgcG9zaXRpb24gYXMg
cGxhY2VkIGJ5IHRoZSBib290bG9hZGVyLAo+Pj4gKyAgICAgKiBub3QgYXMgZXhwZWN0ZWQgaW4g
dGhlIGZpbmFsIGJ1aWxkLiAgVGhpcyBoYXMgYXJiaXRyYXJ5IDJNIGFsaWdubWVudCwKPj4+ICsg
ICAgICogc28gc3VidHJhY3QgeGVuX3BoeXNfc3RhcnQgdG8gZ2V0IHRoZSBhcHByb3ByaWF0ZSBz
bG90cyBpbiBsMl94ZW5tYXBbXS4KPj4+ICsgICAgICovCj4+IEl0IG1heSBqdXN0IGJlIGEgbGFu
Z3VhZ2UgaXNzdWUsIGJ1dCBJJ20gc3RydWdnbGluZyB3aXRoIHRoZQo+PiAiYXJiaXRyYXJ5IiBo
ZXJlLiBJcyB0aGlzIGluIGFueSB3YXkgcmVsYXRlZCB0byB0aGUKPj4gLS1zZWN0aW9uLWFsaWdu
bWVudD0weDIwMDAwMCBvcHRpb24gd2UgcGFzcyB0byB0aGUgbGlua2VyICh3aGVyZQo+PiB0aGUg
dmFsdWUgaXNuJ3QgYXJiaXRyYXJ5IGF0IGFsbCk/Cj4gCj4gU28gdGhpcyBpcyB0aGUgYnVnIEkg
c3BlbnQgYWdlcyB0cnlpbmcgdG8gZmlndXJlIG91dCBjb25zb2xlIGxvZ2dpbmcgZm9yLgo+IAo+
IFRoZSBuYWl2ZSB2ZXJzaW9uIG9mIHRoaXMgbG9vcCAocHJlIHN1YnRyYWN0aW9uKSBlbmRlZCB1
cCBpbml0aWFsaXNpbmcKPiBzbG90cyAxNzMuLi4xNzcgd2hpY2gsIHdoZW4gaGlnaGxpZ2h0ZWQg
bGlrZSB0aGF0LCBpcyBvYnZpb3VzbHkgd2h5IFhlbgo+IHRyaXBsZSBmYXVsdGVkIHdoZW4gc3dp
dGNoaW5nIHRvIHRoZSBoaWdoIG1hcHBpbmdzLgo+IAo+IFRoZSBwb2ludCBJJ20gdHJ5aW5nIHRv
IG1ha2UgaXMgdGhhdCBsMl90YWJsZV9vZmZzZXQoX3N0YXJ0KSBlbmRzIHVwCj4gYmVpbmcganVu
ayBiZWNhdXNlIGl0IGlzIGEgcmlwLXJlbGF0aXZlIGFkZHJlc3MgYW5kIHdlJ3JlIG5vdCBydW5u
aW5nIGF0Cj4gb3VyIGxpbmtlZCBhZGRyZXNzLsKgIChJdCBpcyBpbiBmYWN0IG91ciBwaHlzaWNh
bCBwb3NpdGlvbiBpbiBtZW1vcnkncyAyTQo+IHNsb3QsIG1vZHVsbyA1MTIpLgo+IAo+IFN1YnRy
YWN0aW5nIHhlbl9waHlzX3N0YXJ0IGdldHMgdGhlIG51bWJlciBiYWNrIGludG8gdGhlIHNhbWUg
YWxpYXMKPiB3aGljaCBhbGwgdGhlIDMyYml0IGhlYWQuUyBjb2RlIHJlbGllcyBvbiwgYW5kIGdp
dmVzIHVzIGEgc2Vuc2libGUKPiBzZXF1ZW5jZSBvZiBzbG90cyBzdGFydGluZyBmcm9tIDEuCgpU
aGFua3MgZm9yIHRoZSBleHBsYW5hdGlvbi4gV2hhdCBJJ20gc3RpbGwgdW5jbGVhciBhYm91dCBp
cyB0aGlzIHVzZQpvZiAiYXJiaXRyYXJ5IiwgdGhvdWdoLiBMb29raW5nIGF0IGl0IGFnYWluIEkg
Z3Vlc3MgSSdtIGFsc28Kc3RydWdnbGluZyB0byB1bmRlcnN0YW5kIHdoYXQgIlRoaXMiIGF0IHRo
ZSBiZWdpbm5pbmcgb2YgdGhlIHNlbnRlbmNlCnJlZmVycyB0by4KCkphbgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
