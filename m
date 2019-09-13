Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BCFEB2279
	for <lists+xen-devel@lfdr.de>; Fri, 13 Sep 2019 16:47:27 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i8moD-0004dj-UA; Fri, 13 Sep 2019 14:44:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=f4Vg=XI=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i8moC-0004dc-4R
 for xen-devel@lists.xenproject.org; Fri, 13 Sep 2019 14:44:24 +0000
X-Inumbo-ID: f96f894e-d634-11e9-b299-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f96f894e-d634-11e9-b299-bc764e2007e4;
 Fri, 13 Sep 2019 14:44:22 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id E1B85AF5B;
 Fri, 13 Sep 2019 14:44:21 +0000 (UTC)
To: Juergen Gross <jgross@suse.com>
References: <20190809145833.1020-1-jgross@suse.com>
 <20190809145833.1020-31-jgross@suse.com>
 <a637c5a4-d1f6-bf43-6eb2-c9702a79ca48@suse.com>
 <36e873f4-b6d1-bb8e-ec98-50e123636358@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <b70e27f7-7832-4e8f-f543-9d685eadcf88@suse.com>
Date: Fri, 13 Sep 2019 16:44:23 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <36e873f4-b6d1-bb8e-ec98-50e123636358@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2 30/48] xen/sched: introduce
 unit_runnable_state()
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
Cc: Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 Robert VanVossen <robert.vanvossen@dornerworks.com>,
 Dario Faggioli <dfaggioli@suse.com>, Julien Grall <julien.grall@arm.com>,
 Josh Whitehead <josh.whitehead@dornerworks.com>,
 Meng Xu <mengxu@cis.upenn.edu>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTMuMDkuMjAxOSAxNjowNywgSnVlcmdlbiBHcm9zcyB3cm90ZToKPiBPbiAxMS4wOS4xOSAx
MjozMCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IE9uIDA5LjA4LjIwMTkgMTY6NTgsIEp1ZXJnZW4g
R3Jvc3Mgd3JvdGU6Cj4+PiAtLS0gYS94ZW4vaW5jbHVkZS94ZW4vc2NoZWQuaAo+Pj4gKysrIGIv
eGVuL2luY2x1ZGUveGVuL3NjaGVkLmgKPj4+IEBAIC0xNzQsNiArMTc0LDcgQEAgc3RydWN0IHZj
cHUKPj4+ICAgICAgICAgICBYRU5fR1VFU1RfSEFORExFKHZjcHVfcnVuc3RhdGVfaW5mb19jb21w
YXRfdCkgY29tcGF0Owo+Pj4gICAgICAgfSBydW5zdGF0ZV9ndWVzdDsgLyogZ3Vlc3QgYWRkcmVz
cyAqLwo+Pj4gICAjZW5kaWYKPj4+ICsgICAgaW50ICAgICAgICAgICAgICBuZXdfc3RhdGU7Cj4+
Cj4+IEkgcmVhbGl6ZSBpdHMgY291bnRlcnBhcnQgKHdyb25nbHkpIGlzIHBsYWluIGludCBpbiB0
aGUgcHVibGljCj4+IGludGVyZmFjZSAtIEkgdGhpbmsgaXQgc2hvdWxkIGJlIHVuc2lnbmVkIGlu
dCBoZXJlIGFuZCB1aW50MzJfdAo+PiB0aGVyZS4gSSdtIHBvbmRlcmluZyB3aGV0aGVyIHRvIGRv
IGEgc3dpcGUgYWNyb3NzIGFsbCBwdWJsaWMKPj4gaGVhZGVycyB0byByZXBsYWNlIGFsbCB1c2Vz
IG9mIHBsYWluIGludCAoYW5kIGFsaWtlKSB3aXRoCj4+IGZpeGVkIHdpZHRoIHR5cGVzLgo+IAo+
IFRoZSBsaXN0IGZvciBjbGVhbnVwcyBpcyBiZWNvbWluZyBsb25nZXIuLi4KPiAKPiBTbyBhcmUg
eW91IGZpbmUgd2l0aCBtZSBub3QgY2hhbmdpbmcgYW55dGhpbmcgaW4gdGhpcyByZWdhcmQgcmln
aHQgbm93PwoKV2VsbCwgaXQgd291bGRuJ3QgYmUgYmFkIGlmIHRoZSBuZXcgZmllbGQgd2FzIG9m
IGFwcHJvcHJpYXRlIHR5cGUuCkJ1dCBnaXZlbiB0aGUgc3RhdGUgb2YgdGhpbmdzIGVsc2V3aGVy
ZSBJIHdvdWxkbid0IGluc2lzdC4KCkphbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
