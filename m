Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5524F299C2
	for <lists+xen-devel@lfdr.de>; Fri, 24 May 2019 16:08:17 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hUAp3-0002Nr-Mc; Fri, 24 May 2019 14:05:25 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=aM+Y=TY=bitdefender.com=rcojocaru@srs-us1.protection.inumbo.net>)
 id 1hUAp2-0002Nm-K3
 for xen-devel@lists.xenproject.org; Fri, 24 May 2019 14:05:24 +0000
X-Inumbo-ID: f89d1d02-7e2c-11e9-af31-0f2bcb9cac4b
Received: from mx01.bbu.dsd.mx.bitdefender.com (unknown [91.199.104.161])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f89d1d02-7e2c-11e9-af31-0f2bcb9cac4b;
 Fri, 24 May 2019 14:05:23 +0000 (UTC)
Received: from smtp.bitdefender.com (smtp02.buh.bitdefender.net [10.17.80.76])
 by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id
 4A003305D3D0; Fri, 24 May 2019 17:05:22 +0300 (EEST)
Received: from [10.10.196.90] (unknown [195.210.5.22])
 by smtp.bitdefender.com (Postfix) with ESMTPSA id 3556A306E4AC;
 Fri, 24 May 2019 17:05:22 +0300 (EEST)
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
References: <20190524131522.29170-1-jgross@suse.com>
From: Razvan Cojocaru <rcojocaru@bitdefender.com>
Message-ID: <197d22cd-8242-5361-019e-59b3e65df7c4@bitdefender.com>
Date: Fri, 24 May 2019 17:05:17 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190524131522.29170-1-jgross@suse.com>
Content-Language: en-US-large
Subject: Re: [Xen-devel] [PATCH] xen/vm_event: fix rc check for
 uninitialized ring
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
Cc: Tamas K Lengyel <tamas@tklengyel.com>, Wei Liu <wei.liu2@citrix.com>,
 George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gNS8yNC8xOSA0OjE1IFBNLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOgo+IHZtX2V2ZW50X2NsYWlt
X3Nsb3QoKSByZXR1cm5zIC1FT1BOT1RTVVBQIGZvciBhbiB1bmluaXRpYWxpemVkIHJpbmcKPiBz
aW5jZSBjb21taXQgMTVlNGRkNWU4NjZiNDNiYmMgKCJjb21tb24vdm1fZXZlbnQ6IEluaXRpYWxp
emUgdm1fZXZlbnQKPiBsaXN0cyBvbiBkb21haW4gY3JlYXRpb24iKSwgYnV0IHRoZSBjYWxsZXJz
IHRlc3QgZm9yIC1FTk9TWVMuCj4gCj4gQ29ycmVjdCB0aGUgY2FsbGVycy4KPiAKPiBTaWduZWQt
b2ZmLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+Cj4gLS0tCj4gICB4ZW4vYXJj
aC94ODYvbW0vcDJtLmMgfCAyICstCj4gICB4ZW4vY29tbW9uL21vbml0b3IuYyAgfCAyICstCj4g
ICB4ZW4vY29tbW9uL3ZtX2V2ZW50LmMgfCAyICstCj4gICAzIGZpbGVzIGNoYW5nZWQsIDMgaW5z
ZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2
L21tL3AybS5jIGIveGVuL2FyY2gveDg2L21tL3AybS5jCj4gaW5kZXggNTdjNWVlZGE5MS4uOGE5
YTExNTNhOCAxMDA2NDQKPiAtLS0gYS94ZW4vYXJjaC94ODYvbW0vcDJtLmMKPiArKysgYi94ZW4v
YXJjaC94ODYvbW0vcDJtLmMKPiBAQCAtMTcwNSw3ICsxNzA1LDcgQEAgdm9pZCBwMm1fbWVtX3Bh
Z2luZ19wb3B1bGF0ZShzdHJ1Y3QgZG9tYWluICpkLCB1bnNpZ25lZCBsb25nIGdmbl9sKQo+ICAg
Cj4gICAgICAgLyogV2UncmUgcGFnaW5nLiBUaGVyZSBzaG91bGQgYmUgYSByaW5nICovCj4gICAg
ICAgaW50IHJjID0gdm1fZXZlbnRfY2xhaW1fc2xvdChkLCBkLT52bV9ldmVudF9wYWdpbmcpOwo+
IC0gICAgaWYgKCByYyA9PSAtRU5PU1lTICkKPiArICAgIGlmICggcmMgPT0gLUVPUE5PVFNVUFAg
KQo+ICAgICAgIHsKPiAgICAgICAgICAgZ2RwcmludGsoWEVOTE9HX0VSUiwgIkRvbWFpbiAlaHUg
cGFnaW5nIGdmbiAlbHggeWV0IG5vIHJpbmcgIgo+ICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAiaW4gcGxhY2VcbiIsIGQtPmRvbWFpbl9pZCwgZ2ZuX2wpOwo+IGRpZmYgLS1naXQgYS94
ZW4vY29tbW9uL21vbml0b3IuYyBiL3hlbi9jb21tb24vbW9uaXRvci5jCj4gaW5kZXggY2I1ZjM3
ZmRiMi4uZDVjOWZmMWNiZiAxMDA2NDQKPiAtLS0gYS94ZW4vY29tbW9uL21vbml0b3IuYwo+ICsr
KyBiL3hlbi9jb21tb24vbW9uaXRvci5jCj4gQEAgLTk4LDcgKzk4LDcgQEAgaW50IG1vbml0b3Jf
dHJhcHMoc3RydWN0IHZjcHUgKnYsIGJvb2wgc3luYywgdm1fZXZlbnRfcmVxdWVzdF90ICpyZXEp
Cj4gICAgICAgewo+ICAgICAgIGNhc2UgMDoKPiAgICAgICAgICAgYnJlYWs7Cj4gLSAgICBjYXNl
IC1FTk9TWVM6Cj4gKyAgICBjYXNlIC1FT1BOT1RTVVBQOgo+ICAgICAgICAgICAvKgo+ICAgICAg
ICAgICAgKiBJZiB0aGVyZSB3YXMgbm8gcmluZyB0byBoYW5kbGUgdGhlIGV2ZW50LCB0aGVuCj4g
ICAgICAgICAgICAqIHNpbXBseSBjb250aW51ZSBleGVjdXRpbmcgbm9ybWFsbHkuCj4gZGlmZiAt
LWdpdCBhL3hlbi9jb21tb24vdm1fZXZlbnQuYyBiL3hlbi9jb21tb24vdm1fZXZlbnQuYwo+IGlu
ZGV4IDZlNjhiZTQ3YmMuLjdiNGViY2VkMTYgMTAwNjQ0Cj4gLS0tIGEveGVuL2NvbW1vbi92bV9l
dmVudC5jCj4gKysrIGIveGVuL2NvbW1vbi92bV9ldmVudC5jCj4gQEAgLTUxMyw3ICs1MTMsNyBA
QCBib29sIHZtX2V2ZW50X2NoZWNrX3Jpbmcoc3RydWN0IHZtX2V2ZW50X2RvbWFpbiAqdmVkKQo+
ICAgICogdGhpcyBmdW5jdGlvbiB3aWxsIGFsd2F5cyByZXR1cm4gMCBmb3IgYSBndWVzdC4gIEZv
ciBhIG5vbi1ndWVzdCwgd2UgY2hlY2sKPiAgICAqIGZvciBzcGFjZSBhbmQgcmV0dXJuIC1FQlVT
WSBpZiB0aGUgcmluZyBpcyBub3QgYXZhaWxhYmxlLgo+ICAgICoKPiAtICogUmV0dXJuIGNvZGVz
OiAtRU5PU1lTOiB0aGUgcmluZyBpcyBub3QgeWV0IGNvbmZpZ3VyZWQKPiArICogUmV0dXJuIGNv
ZGVzOiAtRU9QTk9UU1VQUDogdGhlIHJpbmcgaXMgbm90IHlldCBjb25maWd1cmVkCj4gICAgKiAg
ICAgICAgICAgICAgIC1FQlVTWTogdGhlIHJpbmcgaXMgYnVzeQo+ICAgICogICAgICAgICAgICAg
ICAwOiBhIHNwb3QgaGFzIGJlZW4gcmVzZXJ2ZWQKPiAgICAqCj4gCgpCdXQgdm1fZXZlbnRfZ3Jh
Yl9zbG90KCkgKHdoaWNoIGVuZHMgdXAgYmVpbmcgd2hhdCB2bV9ldmVudF93YWl0X3Nsb3QoKSAK
cmV0dXJucyksIHN0aWxsIHJldHVybnMgLUVOT1NZUzoKCjQ2MyBzdGF0aWMgaW50IHZtX2V2ZW50
X2dyYWJfc2xvdChzdHJ1Y3Qgdm1fZXZlbnRfZG9tYWluICp2ZWQsIGludCBmb3JlaWduKQo0NjQg
ewo0NjUgICAgIHVuc2lnbmVkIGludCBhdmFpbF9yZXE7CjQ2Ngo0NjcgICAgIGlmICggIXZlZC0+
cmluZ19wYWdlICkKNDY4ICAgICAgICAgcmV0dXJuIC1FTk9TWVM7CgpBbHRob3VnaCB3ZSBjYW4n
dCBnZXQgdG8gdGhhdCBwYXJ0IGlmIHZtX2V2ZW50X2NoZWNrX3JpbmcoKSByZXR1cm5zIApmYWxz
ZSwgd2Ugc2hvdWxkIHByb2JhYmx5IHJldHVybiAtRU9QTk9UU1VQUCBmcm9tIHRoZXJlIGFzIHdl
bGwuIEluIApmYWN0LCBJIHdvbmRlciBpZiBhbnkgb2YgdGhlIC1FTk9TWVMgcmV0dXJucyBpbiB2
bV9ldmVudC5jIHNob3VsZCBub3QgYmUgCnJlcGxhY2VkIHdpdGggcmV0dXJuIC1FT1BOT1RTVVBQ
cy4KCkFueXdheSwgdGhlIGNoYW5nZSBkb2VzIGNsZWFybHkgaW1wcm92ZSB0aGUgY29kZSBldmVu
IHdpdGhvdXQgc2V0dGxpbmcgCnRoZSBhYm92ZSBxdWVzdGlvbnMsIHNvOgoKQWNrZWQtYnk6IFJh
enZhbiBDb2pvY2FydSA8cmNvam9jYXJ1QGJpdGRlZmVuZGVyLmNvbT4KCgpUaGFua3MsClJhenZh
bgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
