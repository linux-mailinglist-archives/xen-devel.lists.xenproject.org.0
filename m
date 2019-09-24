Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A0F15BCA74
	for <lists+xen-devel@lfdr.de>; Tue, 24 Sep 2019 16:43:40 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iClyu-0000oU-QB; Tue, 24 Sep 2019 14:39:56 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=kqGS=XT=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iClyu-0000oP-0a
 for xen-devel@lists.xenproject.org; Tue, 24 Sep 2019 14:39:56 +0000
X-Inumbo-ID: 2c688024-ded9-11e9-961f-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id 2c688024-ded9-11e9-961f-12813bfff9fa;
 Tue, 24 Sep 2019 14:39:55 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 168ACAF10;
 Tue, 24 Sep 2019 14:39:54 +0000 (UTC)
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
References: <20190914085251.18816-1-jgross@suse.com>
 <20190914085251.18816-29-jgross@suse.com>
 <6e3467cf-4a96-032d-f568-b6dd2e3cfce1@suse.com>
 <71f007f3-b431-9530-6c6f-1d6da4951808@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <aea697ce-a26b-dc93-fc6c-d733e8bcf3fe@suse.com>
Date: Tue, 24 Sep 2019 16:39:52 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <71f007f3-b431-9530-6c6f-1d6da4951808@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3 28/47] xen/sched: add code to sync
 scheduling of all vcpus of a sched unit
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
 Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org,
 Dario Faggioli <dfaggioli@suse.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjQuMDkuMjAxOSAxNjoxNCwgSsO8cmdlbiBHcm/DnyB3cm90ZToKPiBPbiAyMC4wOS4xOSAx
ODowOCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IE9uIDE0LjA5LjIwMTkgMTA6NTIsIEp1ZXJnZW4g
R3Jvc3Mgd3JvdGU6Cj4+PiAtLS0gYS94ZW4vaW5jbHVkZS94ZW4vc29mdGlycS5oCj4+PiArKysg
Yi94ZW4vaW5jbHVkZS94ZW4vc29mdGlycS5oCj4+PiBAQCAtNCw2ICs0LDcgQEAKPj4+ICAgLyog
TG93LWxhdGVuY3kgc29mdGlycXMgY29tZSBmaXJzdCBpbiB0aGUgZm9sbG93aW5nIGxpc3QuICov
Cj4+PiAgIGVudW0gewo+Pj4gICAgICAgVElNRVJfU09GVElSUSA9IDAsCj4+PiArICAgIFNDSEVE
X1NMQVZFX1NPRlRJUlEsCj4+PiAgICAgICBTQ0hFRFVMRV9TT0ZUSVJRLAo+Pj4gICAgICAgTkVX
X1RMQkZMVVNIX0NMT0NLX1BFUklPRF9TT0ZUSVJRLAo+Pj4gICAgICAgUkNVX1NPRlRJUlEsCj4+
Cj4+IFNlZWluZyB0aGUgY29tbWVudCwgaXMgdGhlIGluc2VydGlvbiB5b3UgZG8gYXMgd2VsbCBh
cyB0aGUgcHJlLQo+PiBleGlzdGluZyBwbGFjZW1lbnQgb2YgU0NIRURVTEVfU09GVElSUSBzdGls
bCBhcHByb3ByaWF0ZSB3aXRoCj4+IHRoZSByZW5kZXp2b3VzLWluZyB5b3UgaW50cm9kdWNlPwo+
IAo+IFB1dHRpbmcgU0NIRURfU0xBVkVfU09GVElSUSBiZWZvcmUgU0NIRURVTEVfU09GVElSUSBp
cyBkb25lIG9uIHB1cnBvc2UsCj4gYXMgSSB3YW50IHNsYXZlIGV2ZW50cyB0byBoYXZlIGhpZ2hl
ciBwcmlvcml0eSB0aGFuIG5vcm1hbCBzY2hlZHVsZQo+IGV2ZW50cy4KPiAKPiBXaGV0aGVyIGJv
dGggd2FudCB0byBiZSBhdCB0aGF0IHBsYWNlIG9yIHNob3VsZCBiZSBtb3ZlZCBpcyBzb21ldGhp
bmcKPiB3aGljaCBzaG91bGQgYmUgY29uc2lkZXJlZCBjYXJlZnVsbHkuIElzIGl0IG9rYXkgdG8g
cG9zdHBvbmUgdGhhdAo+IHF1ZXN0aW9uPwoKU3VyZSwgaXQgd2FzIGp1c3Qgc29tZXRoaW5nIHRo
YXQgb2NjdXJyZWQgdG8gbWUgd2hlbiB0aGUgY29tbWVudApjYXVnaHQgbXkgYXR0ZW50aW9uLgoK
SmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
