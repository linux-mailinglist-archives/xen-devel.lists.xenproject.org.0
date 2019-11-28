Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 25B0B10C993
	for <lists+xen-devel@lfdr.de>; Thu, 28 Nov 2019 14:35:38 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iaJuq-0000Bo-Ta; Thu, 28 Nov 2019 13:33:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Hmpo=ZU=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iaJup-0000Bj-Rm
 for xen-devel@lists.xenproject.org; Thu, 28 Nov 2019 13:33:03 +0000
X-Inumbo-ID: 99ac250e-11e3-11ea-b155-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 99ac250e-11e3-11ea-b155-bc764e2007e4;
 Thu, 28 Nov 2019 13:33:02 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 7EC73B023;
 Thu, 28 Nov 2019 13:33:01 +0000 (UTC)
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <7f82e319-1891-ec36-dcf0-e94253ba04a5@suse.com>
 <20191128113904.GU980@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <ca1d09ba-9cf3-346a-2b26-ae08d20f9133@suse.com>
Date: Thu, 28 Nov 2019 14:33:08 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191128113904.GU980@Air-de-Roger>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] x86/IRQ: make internally used IRQs also
 honor the pending EOI stack
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
Cc: Juergen Gross <jgross@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Kevin Tian <kevin.tian@intel.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjguMTEuMjAxOSAxMjozOSwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPiBPbiBUaHUsIE5v
diAyOCwgMjAxOSBhdCAxMjowMzo0N1BNICswMTAwLCBKYW4gQmV1bGljaCB3cm90ZToKPj4gQXQg
dGhlIHRpbWUgdGhlIHBlbmRpbmcgRU9JIHN0YWNrIHdhcyBpbnRyb2R1Y2VkIHRoZXJlIHdlcmUg
bm8KPj4gaW50ZXJuYWxseSB1c2VkIElSUXMgd2hpY2ggd291bGQgaGF2ZSB0aGUgTEFQSUMgRU9J
IGlzc3VlZCBmcm9tIHRoZQo+PiAtPmVuZCgpIGhvb2suIFRoaXMgaGFkIHRoZW4gY2hhbmdlZCB3
aXRoIHRoZSBpbnRyb2R1Y3Rpb24gb2YgSU9NTVVzLAo+PiBidXQgdGhlIGludGVyYWN0aW9uIGlz
c3VlIHdhcyBwcmVzdW1hYmx5IG1hc2tlZCBieQo+PiBpcnFfZ3Vlc3RfZW9pX3RpbWVyX2ZuKCkg
ZnJlcXVlbnRseSBFT0ktaW5nIGludGVycnVwdHMgd2F5IHRvbyBlYXJseQo+PiAod2hpY2ggZ290
IGZpeGVkIGJ5IDM1OWNmNmY4YTBlYyBbIng4Ni9JUlE6IGRvbid0IGtlZXAgRU9JIHRpbWVyCj4+
IHJ1bm5pbmcgd2l0aG91dCBuZWVkIl0pLgo+Pgo+PiBUaGUgcHJvYmxlbSBpcyB0aGF0IHdpdGgg
dXMgcmUtZW5hYmxpbmcgaW50ZXJydXB0cyBhY3Jvc3MgaGFuZGxlcgo+PiBpbnZvY2F0aW9uLCBh
IGhpZ2hlciBwcmlvcml0eSAoZ3Vlc3QpIGludGVycnVwdCBtYXkgdHJpZ2dlciB3aGlsZQo+PiBo
YW5kbGluZyBhIGxvd2VyIHByaW9yaXR5IChpbnRlcm5hbCkgb25lLiBUaGUgRU9JIGlzc3VlZCBm
cm9tCj4+IC0+ZW5kKCkgKGZvciBBQ0tUWVBFX0VPSSBraW5kIGludGVycnVwdHMpIHdvdWxkIHRo
ZW4gbWlzdGFrZW5seQo+PiBFT0kgdGhlIGhpZ2hlciBwcmlvcml0eSAoZ3Vlc3QpIGludGVycnVw
dCwgYnJlYWtpbmcgKGFtb25nIG90aGVyCj4+IHRoaW5ncykgcGVuZGluZyBFT0kgc3RhY2sgbG9n
aWMncyBhc3N1bXB0aW9ucy4KPiAKPiBNYXliZSB0aGVyZSdzIHNvbWV0aGluZyB0aGF0IEknbSBt
aXNzaW5nLCBidXQgc2hvdWxkbid0IGh5cGVydmlzb3IKPiB2ZWN0b3JzIGFsd2F5cyBiZSBoaWdo
ZXIgcHJpb3JpdHkgdGhhbiBndWVzdCBvbmVzPwoKRGVwZW5kcyAtIElPTU1VIG9uZXMgaW1vIGFy
ZW4ndCBzb21ldGhpbmcgdGhhdCBuZWVkcyB1cmdlbnRseQpkZWFsaW5nIHdpdGgsIHNvIGEgbGl0
dGxlIGJpdCBvZiBkZWxheSB3b24ndCBodXJ0LiBUaGVyZSB3b3VsZApvbmx5IGJlIGEgcHJvYmxl
bSBpZiBzdWNoIGludGVycnVwdHMgY291bGQgYmUgZGVmZXJyZWQKaW5kZWZpbml0ZWx5LgoKPiBJ
IHNlZSB0aGVyZSdzIGFscmVhZHkgYSByYW5nZSByZXNlcnZlZCBmb3IgaGlnaCBwcmlvcml0eSB2
ZWN0b3JzCj4gKHtGSVJTVC9MQVNUfV9ISVBSSU9SSVRZX1ZFQ1RPUiksIHdoYXQncyB0aGUgcmVh
c29uIGZvciBoeXBlcnZpc29yCj4gaW50ZXJydXB0cyBub3QgdXNpbmcgdGhpcyByYW5nZT8KCldl
J2QgcXVpY2tseSBydW4gb3V0IG9mIGhpZ2ggcHJpb3JpdHkgdmVjdG9ycyBvbiBzeXN0ZW1zIHdp
dGgKbXVsdGlwbGUgKGFuZCBwZXJoYXBzIGluZGVlZCBtYW55KSBJT01NVXMuCgo+IElNTyBpdCBz
ZWVtcyB0cm91Ymxlc29tZSB0aGF0IHBlbmRpbmcgZ3Vlc3RzIHZlY3RvcnMgY2FuIGRlbGF5IHRo
ZQo+IGluamVjdGlvbiBvZiBoeXBlcnZpc29yIGludGVycnVwdCB2ZWN0b3JzLgoKQXMgcGVyIGFi
b3ZlIC0gZGVwZW5kcy4KCkphbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
