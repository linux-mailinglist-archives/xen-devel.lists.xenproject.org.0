Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A673C6E061
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jul 2019 06:59:31 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hoKwb-0003ER-DY; Fri, 19 Jul 2019 04:56:33 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=M1ZL=VQ=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hoKwa-0003EM-1c
 for xen-devel@lists.xenproject.org; Fri, 19 Jul 2019 04:56:32 +0000
X-Inumbo-ID: 91fd55d5-a9e1-11e9-8980-bc764e045a96
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 91fd55d5-a9e1-11e9-8980-bc764e045a96;
 Fri, 19 Jul 2019 04:56:30 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id D11B4AEC8;
 Fri, 19 Jul 2019 04:56:28 +0000 (UTC)
To: Dario Faggioli <dfaggioli@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20190528103313.1343-1-jgross@suse.com>
 <20190528103313.1343-6-jgross@suse.com>
 <ac36f4026604dcdaf5fb6274e287bd4c2b54720e.camel@suse.com>
From: Juergen Gross <jgross@suse.com>
Message-ID: <a269b0ae-e8c7-b772-f43a-afe6ffa08142@suse.com>
Date: Fri, 19 Jul 2019 06:56:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <ac36f4026604dcdaf5fb6274e287bd4c2b54720e.camel@suse.com>
Content-Language: de-DE
Subject: Re: [Xen-devel] [PATCH 05/60] xen/sched: alloc struct sched_unit
 for each vcpu
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
Cc: "sstabellini@kernel.org" <sstabellini@kernel.org>,
 "wl@xen.org" <wl@xen.org>, "konrad.wilk@oracle.com" <konrad.wilk@oracle.com>,
 "george.dunlap@eu.citrix.com" <george.dunlap@eu.citrix.com>,
 "ian.jackson@eu.citrix.com" <ian.jackson@eu.citrix.com>,
 "tim@xen.org" <tim@xen.org>, "julien.grall@arm.com" <julien.grall@arm.com>,
 Jan Beulich <JBeulich@suse.com>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTguMDcuMTkgMTk6NTcsIERhcmlvIEZhZ2dpb2xpIHdyb3RlOgo+IE9uIFR1ZSwgMjAxOS0w
NS0yOCBhdCAxMjozMiArMDIwMCwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPj4gQWxsb2NhdGUgYSBz
dHJ1Y3Qgc2NoZWRfdW5pdCBmb3IgZWFjaCB2Y3B1LiBUaGlzIHJlbW92ZXMgdGhlIG5lZWQgdG8K
Pj4gaGF2ZSBpdCBsb2NhbGx5IG9uIHRoZSBzdGFjayBpbiBzY2hlZHVsZS5jLgo+Pgo+PiBTaWdu
ZWQtb2ZmLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+Cj4+Cj4gQW5kIHRoaXMg
cGF0Y2ggbG9va3Mgb2sgYXMgd2VsbC4KPiAKPiBIb3dldmVyLCBJIGRvbid0IHNlZSBtdWNoIHZh
bHVlIGluIG5vdCBkb2luZyB3aGF0J3MgZG9uZSBoZXJlIGluIHBhdGNoCj4gNCBhbHJlYWR5IChp
dCdzIHByZXR0eSBtdWNoIG9ubHkgbGluZSBjaGFuZ2VkIGJ5IHBhdGNoIDQgdGhhdCBhcmUgYmVp
bmcKPiBjaGFuZ2VkIGFnYWluIGhlcmUpLgo+IAo+IElzIHRoZXJlIGEgcGFydGljdWxhciByZWFz
b24geW91IHRoaW5rIGl0J3MgaW1wb3J0YW50IHRvIGtlZXAgdGhlc2UgdHdvCj4gcGF0Y2hlcyBz
ZXBhcmF0ZWQ/CgpOb3QgaW1wb3J0YW50LCBidXQgSSB0aG91Z2h0IGl0IHdvdWxkIG1ha2UgaXQg
bW9yZSBjbGVhci4KCklmIHlvdSBsaWtlIGl0IGJldHRlciBJIGNhbiBtZXJnZSB0aGUgdHdvIHBh
dGNoZXMuCgo+IAo+IEFoLCBteSBjb21tZW50IGFib3V0ICd1bml0JyAtLT4gJ3N1JyAtLWluIGNh
c2UgeW91IHRoaW5rIGl0J3MgZmVhc2libGUtCj4gLSBhcHBsaWVzIHRvIHN0cnVjdCBtZW1iZXJz
IGFzIHdlbGwsIG9mIGNvdXJzZSwgZS5nLiwgaGVyZToKPiAKPj4gQEAgLTE2MCw2ICsxNjEsNyBA
QCBzdHJ1Y3QgdmNwdQo+PiAgIAo+PiAgICAgICBzdHJ1Y3QgdGltZXIgICAgIHBvbGxfdGltZXI7
ICAgIC8qIHRpbWVvdXQgZm9yIFNDSEVET1BfcG9sbCAqLwo+PiAgIAo+PiArICAgIHN0cnVjdCBz
Y2hlZF91bml0ICpzY2hlZF91bml0Owo+PiAgICAgICB2b2lkICAgICAgICAgICAgKnNjaGVkX3By
aXY7ICAgIC8qIHNjaGVkdWxlci1zcGVjaWZpYyBkYXRhICovCj4+ICAgCj4+ICAgICAgIHN0cnVj
dCB2Y3B1X3J1bnN0YXRlX2luZm8gcnVuc3RhdGU7CgpJIGhhdmUgdG8gZGlzYWdyZWUgaGVyZTog
dGhpcyBpcyBubyBzY2hlZHVsZXIgcHJpdmF0ZSBzdHJ1Y3R1cmUsIHNvIEkKYmVsaWV2ZSB0aGUg
c3RydWN0IG1lbWJlciBuYW1lcyBzaG91bGQgYmUgZGVzY3JpcHRpdmUuIEkgZ3Vlc3MgdGhpcyBp
cwp0aGUgcmVhc29uIHdoeSB0aGVyZSBhcmUgbWFueSBtb3JlIHN0cnVjdCBtZW1iZXJzIG5hbWVk
ICJ2Y3B1IiB0aGFuICJ2Ii4KCgpKdWVyZ2VuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
