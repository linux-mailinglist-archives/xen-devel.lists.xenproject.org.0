Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB431C0069
	for <lists+xen-devel@lfdr.de>; Fri, 27 Sep 2019 09:50:39 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDkzG-000406-M9; Fri, 27 Sep 2019 07:48:22 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Rbpq=XW=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iDkzF-000401-Gq
 for xen-devel@lists.xenproject.org; Fri, 27 Sep 2019 07:48:21 +0000
X-Inumbo-ID: 2ba7635c-e0fb-11e9-966f-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id 2ba7635c-e0fb-11e9-966f-12813bfff9fa;
 Fri, 27 Sep 2019 07:48:19 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id EDA50AD63;
 Fri, 27 Sep 2019 07:48:17 +0000 (UTC)
To: Dario Faggioli <dfaggioli@suse.com>, Jan Beulich <jbeulich@suse.com>
References: <20190914085251.18816-1-jgross@suse.com>
 <20190914085251.18816-36-jgross@suse.com>
 <af34c647-ffec-48d5-64f3-7aa00a57fa35@suse.com>
 <95f6907a-9a82-38a9-7937-61286d552138@suse.com>
 <739bf431-90d3-018b-8282-191e0bf06fed@suse.com>
 <c996b2b5e210a9733b44c5a29b2e1f77f2471be9.camel@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <4ecc83b6-5801-72d9-d9fc-c4521cd394c6@suse.com>
Date: Fri, 27 Sep 2019 09:48:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <c996b2b5e210a9733b44c5a29b2e1f77f2471be9.camel@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3 35/47] xen/sched: make vcpu_wake() and
 vcpu_sleep() core scheduling aware
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
 George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org,
 Ian Jackson <ian.jackson@eu.citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjcuMDkuMTkgMDk6MzIsIERhcmlvIEZhZ2dpb2xpIHdyb3RlOgo+IE9uIEZyaSwgMjAxOS0w
OS0yNyBhdCAwNjo0MiArMDIwMCwgSsO8cmdlbiBHcm/DnyB3cm90ZToKPj4gT24gMjUuMDkuMTkg
MTU6MDcsIErDvHJnZW4gR3Jvw58gd3JvdGU6Cj4+PiBPbiAyNC4wOS4xOSAxMzo1NSwgSmFuIEJl
dWxpY2ggd3JvdGU6Cj4+Pj4gT24gMTQuMDkuMjAxOSAxMDo1MiwgSnVlcmdlbiBHcm9zcyB3cm90
ZToKPj4+Pj4gQEAgLTc2NSwxNiArNzc0LDIyIEBAIHZvaWQgdmNwdV93YWtlKHN0cnVjdCB2Y3B1
ICp2KQo+Pj4+PiAgICB7Cj4+Pj4+ICAgICAgICB1bnNpZ25lZCBsb25nIGZsYWdzOwo+Pj4+PiAg
ICAgICAgc3BpbmxvY2tfdCAqbG9jazsKPj4+Pj4gKyAgICBzdHJ1Y3Qgc2NoZWRfdW5pdCAqdW5p
dCA9IHYtPnNjaGVkX3VuaXQ7Cj4+Pj4+ICAgICAgICBUUkFDRV8yRChUUkNfU0NIRURfV0FLRSwg
di0+ZG9tYWluLT5kb21haW5faWQsIHYtCj4+Pj4+PiB2Y3B1X2lkKTsKPj4+Pj4gLSAgICBsb2Nr
ID0gdW5pdF9zY2hlZHVsZV9sb2NrX2lycXNhdmUodi0+c2NoZWRfdW5pdCwgJmZsYWdzKTsKPj4+
Pj4gKyAgICBsb2NrID0gdW5pdF9zY2hlZHVsZV9sb2NrX2lycXNhdmUodW5pdCwgJmZsYWdzKTsK
Pj4+Pj4gICAgICAgIGlmICggbGlrZWx5KHZjcHVfcnVubmFibGUodikpICkKPj4+Pj4gICAgICAg
IHsKPj4+Pj4gICAgICAgICAgICBpZiAoIHYtPnJ1bnN0YXRlLnN0YXRlID49IFJVTlNUQVRFX2Js
b2NrZWQgKQo+Pj4+PiAgICAgICAgICAgICAgICB2Y3B1X3J1bnN0YXRlX2NoYW5nZSh2LCBSVU5T
VEFURV9ydW5uYWJsZSwKPj4+Pj4gTk9XKCkpOwo+Pj4+PiAtICAgICAgICBzY2hlZF93YWtlKHZj
cHVfc2NoZWR1bGVyKHYpLCB2LT5zY2hlZF91bml0KTsKPj4+Pj4gKyAgICAgICAgc2NoZWRfd2Fr
ZSh2Y3B1X3NjaGVkdWxlcih2KSwgdW5pdCk7Cj4+Pj4KPj4+PiBJcyB0aGlzIGNvcnJlY3QgLyBu
ZWNlc3Nhcnkgd2hlbiB0aGUgdW5pdCBpcyBub3QgYXNsZWVwIGFzIGEKPj4+PiB3aG9sZT8KPj4+
PiBBZnRlciBhbGwgdGhlIGNvcnJlc3BvbmRpbmcgc2NoZWRfc2xlZXAoKSBmdXJ0aGVyIHVwIGlz
IGNhbGxlZAo+Pj4+IGNvbmRpdGlvbmFsbHkgb25seS4KPj4+Cj4+PiBPaCwgaW5kZWVkLiBXaWxs
IGNoYW5nZSB0aGF0Lgo+Pgo+PiBJdCB0dXJuZWQgb3V0IHRoaXMgaXMgbm90IHNvIGVhc3kgYXQg
aXQgc2VlbWVkLgo+Pgo+PiBJIGVuY291bnRlcmVkIGRvbTAgYm9vdCBoYW5ncyB3aXRoIG1ha2lu
ZyB0aGUgY2FsbCBjb25kaXRpb25hbCwgZXZlbgo+PiB3aGVuIHJ1bm5pbmcgaW4gY3B1IHNjaGVk
dWxpbmcgbW9kZS4gSSBndWVzcyB0aGUgcmVhc29uIGlzIHRoYXQgYQo+PiB2Y3B1Cj4+IGNhbiBj
YWxsIGRvX3BvbGwoKSB3aGljaCB3aWxsIHRyeSB0byBwdXQgaXRzZWxmIHRvIHNsZWVwIGFuZCBp
biBzb21lCj4+IGNhc2VzIGNhbGwgdmNwdV93YWtlKCkgaW4gY2FzZSB0aGUgY29uZGl0aW9uIGFs
cmVhZHkgY2hhbmdlZC4gSW4gdGhhdAo+PiBjYXNlIHdlIG5lZWQgdGhlIHNjaGVkX3dha2UoKSBj
YWxsIGV2ZW4gaWYgdGhlIHVuaXQgaXMgc3RpbGwgcnVubmluZy4KPj4KPiBUQkgsIEkgdGhpbmsg
aXQgaXMgb2sgZm9yIHRoaXMgY2FsbCB0byBiZSB1bmNvbmRpdGlvbmFsLiBJbmRlZWQgaXQKPiBs
b29rcyBhIGJpdCB3ZWlyZCB3aGVuIHlvdSBjb21wYXJlIHRoaXMgdG8gdGhlIHNjaGVkX3NsZWVw
KCkgY2FsbHMgaW4KPiB2Y3B1X3NsZWVwX25vc3luY19sb2NrZWQoKSwgYXMgdGhleSBhcmUgY29u
ZGl0aW9uYWwsIGJ1dCBJIHRoaW5rIGEKPiBjb21tZW50IGV4cGxhaW5pbmcgd2h5IHRoaXMgaGFz
IHRvIGJlIHRoZSBjYXNlIHdvdWxkIGJlIGVub3VnaC4KPiAKPiBFLmcuLCBzb21ldGhpbmcgbGlr
ZSB3aGF0IHRoZSBjaGFuZ2Vsb2cgYWxyZWFkeSBzYXksIGluCj4gdmNwdV9zbGVlcF9ub3N5bmNf
bG9ja2VkKCksIGFuZCBtYXliZSBzb21ldGhpbmcgbGlrZSB3aGF0IHlvdSBzYWlkCj4gaGVyZSwg
aW4gdmNwdV93YWtlKCkuCgpPa2F5LCB3aWxsIGFkZCBjb21tZW50cy4KCgpKdWVyZ2VuCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
