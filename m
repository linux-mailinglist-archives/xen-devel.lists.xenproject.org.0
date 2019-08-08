Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ADD4785C28
	for <lists+xen-devel@lfdr.de>; Thu,  8 Aug 2019 09:54:52 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hvdD0-000536-MC; Thu, 08 Aug 2019 07:51:38 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=YRw2=WE=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hvdD0-000531-31
 for xen-devel@lists.xenproject.org; Thu, 08 Aug 2019 07:51:38 +0000
X-Inumbo-ID: 5740191c-b9b1-11e9-9687-2397c32f8857
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5740191c-b9b1-11e9-9687-2397c32f8857;
 Thu, 08 Aug 2019 07:51:34 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id E71B6B11C;
 Thu,  8 Aug 2019 07:51:32 +0000 (UTC)
To: Jan Beulich <JBeulich@suse.com>
References: <20190807143119.8360-1-jgross@suse.com>
 <20190807143119.8360-2-jgross@suse.com>
 <60000ee4-7d2d-097e-dad6-584155c08ade@suse.com>
From: Juergen Gross <jgross@suse.com>
Message-ID: <7220f9b0-92e8-033f-e22d-e369f797c80f@suse.com>
Date: Thu, 8 Aug 2019 09:51:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <60000ee4-7d2d-097e-dad6-584155c08ade@suse.com>
Content-Language: de-DE
Subject: Re: [Xen-devel] [PATCH 1/4] xen/spinlocks: in debug builds store
 cpu holding the lock
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDguMDguMTkgMDg6NTgsIEphbiBCZXVsaWNoIHdyb3RlOgo+IE9uIDA3LjA4LjIwMTkgMTY6
MzEsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4+IC0tLSBhL3hlbi9jb21tb24vc3BpbmxvY2suYwo+
PiArKysgYi94ZW4vY29tbW9uL3NwaW5sb2NrLmMKPj4gQEAgLTEzLDkgKzEzLDkgQEAKPj4gICAg
Cj4+ICAgIHN0YXRpYyBhdG9taWNfdCBzcGluX2RlYnVnIF9fcmVhZF9tb3N0bHkgPSBBVE9NSUNf
SU5JVCgwKTsKPj4gICAgCj4+IC1zdGF0aWMgdm9pZCBjaGVja19sb2NrKHN0cnVjdCBsb2NrX2Rl
YnVnICpkZWJ1ZykKPj4gK3N0YXRpYyB2b2lkIGNoZWNrX2xvY2sodW5pb24gbG9ja19kZWJ1ZyAq
ZGVidWcpCj4+ICAgIHsKPj4gLSAgICBpbnQgaXJxX3NhZmUgPSAhbG9jYWxfaXJxX2lzX2VuYWJs
ZWQoKTsKPj4gKyAgICB1bnNpZ25lZCBzaG9ydCBpcnFfc2FmZSA9ICFsb2NhbF9pcnFfaXNfZW5h
YmxlZCgpOwo+IAo+IGJvb2w/IFNlZWluZyB5b3VyIGhlYXZ5IHVzZSBvZiAidW5zaWduZWQgc2hv
cnQiIEkgcmVhbGl6ZSB0aGF0Cj4gbXkgQ29kaW5nU3R5bGUgY2hhbmdlIGNvbW1pdHRlZCB5ZXN0
ZXJkYXkgc3RpbGwgd2Fzbid0IHByZWNpc2UKPiBlbm91Z2guCgpJIHdhbnRlZCB0byBiZSBjb25z
aXN0ZW50IHdpdGggdGhlIHR5cGUgdXNlZCBpbiB0aGUgc3RydWN0dXJlLgpJIGNhbiBzd2l0Y2gg
dG8gYm9vbCBpZiB5b3UgbGlrZSB0aGF0IGJldHRlci4KCj4gCj4+IEBAIC00MywxOCArNDMsMjEg
QEAgc3RhdGljIHZvaWQgY2hlY2tfbG9jayhzdHJ1Y3QgbG9ja19kZWJ1ZyAqZGVidWcpCj4+ICAg
ICAgICovCj4+ICAgICAgIGlmICggdW5saWtlbHkoZGVidWctPmlycV9zYWZlICE9IGlycV9zYWZl
KSApCj4+ICAgICAgIHsKPj4gLSAgICAgICAgaW50IHNlZW4gPSBjbXB4Y2hnKCZkZWJ1Zy0+aXJx
X3NhZmUsIC0xLCBpcnFfc2FmZSk7Cj4+ICsgICAgICAgIHVuaW9uIGxvY2tfZGVidWcgc2Vlbiwg
bmV3ID0geyAwIH07Cj4+ICAgIAo+PiAtICAgICAgICBpZiAoIHNlZW4gPT0gIWlycV9zYWZlICkK
Pj4gKyAgICAgICAgbmV3LmlycV9zYWZlID0gaXJxX3NhZmU7Cj4+ICsgICAgICAgIHNlZW4udmFs
ID0gY21weGNoZygmZGVidWctPnZhbCwgMHhmZmZmLCBuZXcudmFsKTsKPiAKPiBUaGlzIDB4ZmZm
ZiBzaG91bGQgYmUgY29ubmVjdGVkIChieSB3YXkgb2YgYXQgbGVhc3QgYSAjZGVmaW5lKSB0bwo+
IHRoZSBvbmUgdXNlZCBpbiBfTE9DS19ERUJVRy4KCk9rYXkuCgo+IAo+PiArICAgICAgICBpZiAo
ICFzZWVuLnVudXNlZCAmJiBzZWVuLmlycV9zYWZlID09ICFpcnFfc2FmZSApCj4gCj4gV2hpbGUg
InVudXNlZCIgbWFrZXMgc3VmZmljaWVudCBzZW5zZSBoZXJlLCAuLi4KPiAKPj4gLS0tIGEveGVu
L2luY2x1ZGUveGVuL3NwaW5sb2NrLmgKPj4gKysrIGIveGVuL2luY2x1ZGUveGVuL3NwaW5sb2Nr
LmgKPj4gQEAgLTcsMTQgKzcsMjAgQEAKPj4gICAgI2luY2x1ZGUgPHhlbi9wZXJjcHUuaD4KPj4g
ICAgCj4+ICAgICNpZm5kZWYgTkRFQlVHCj4+IC1zdHJ1Y3QgbG9ja19kZWJ1ZyB7Cj4+IC0gICAg
czE2IGlycV9zYWZlOyAvKiArMTogSVJRLXNhZmU7IDA6IG5vdCBJUlEtc2FmZTsgLTE6IGRvbid0
IGtub3cgeWV0ICovCj4+ICt1bmlvbiBsb2NrX2RlYnVnIHsKPj4gKyAgICB1bnNpZ25lZCBzaG9y
dCB2YWw7Cj4+ICsgICAgc3RydWN0IHsKPj4gKyAgICAgICAgdW5zaWduZWQgc2hvcnQgdW51c2Vk
OjE7Cj4gCj4gLi4uIGl0IGdpdmVzIGEgcmF0aGVyIG1pc2xlYWRpbmcgaW1wcmVzc2lvbiBvZiB0
aGlzIGJlaW5nIGFuIHVudXNlZAo+IGZpZWxkIGhlcmUuIEhvdyBhYm91dCBlLmcuICJ1bnNlZW4i
IGluc3RlYWQ/CgpZZXMsIHRoYXQgc2VlbXMgdG8gYmUgdGhlIGJldHRlciBjaG9pY2UuCgo+IAo+
PiArICAgICAgICB1bnNpZ25lZCBzaG9ydCBpcnFfc2FmZToxOwo+PiArICAgICAgICB1bnNpZ25l
ZCBzaG9ydCBwYWQ6MjsKPj4gKyAgICAgICAgdW5zaWduZWQgc2hvcnQgY3B1OjEyOwo+PiArICAg
IH07Cj4+ICAgIH07Cj4gCj4gRG8gd2UgaGF2ZSBhbiBpbXBsaWVkIGFzc3VtcHRpb24gc29tZXdo
ZXJlIHRoYXQgdW5zaWduZWQgc2hvcnQgaXMKPiBleGFjdGx5IDE2IGJpdHMgd2lkZT8gSSB0aGlu
ayAidmFsIiB3YW50cyB0byBiZSB1aW50MTZfdCBoZXJlIChhcwo+IHlvdSByZWFsbHkgbWVhbiAi
ZXhhY3RseSAxNiBiaXRzIiksIHRoZSB0d28gYm9vbGVhbiBmaWVsZHMgd2FudAo+IHRvIGJlIGJv
b2wsIGFuZCB0aGUgcmVtYWluaW5nIHR3byBvbmVzIHVuc2lnbmVkIGludC4KCkJ1dCB0aGF0IHdv
dWxkIGluY3JlYXNlIHRoZSBzaXplIG9mIHRoZSB1bmlvbiB0byA0IGJ5dGVzIGluc3RlYWQgb2Yg
Mi4KU28gYXQgbGVhc3QgcGFkIGFuZCBjcHUgbXVzdCBiZSB1bnNpZ25lZCBzaG9ydCBvciAoYmV0
dGVyKSB1aW50MTZfdC4KCgpKdWVyZ2VuCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
