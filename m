Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ABA8AD34E
	for <lists+xen-devel@lfdr.de>; Mon,  9 Sep 2019 08:58:26 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i7DZm-0001dE-MJ; Mon, 09 Sep 2019 06:55:02 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=NFaf=XE=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i7DZl-0001d9-CR
 for xen-devel@lists.xenproject.org; Mon, 09 Sep 2019 06:55:01 +0000
X-Inumbo-ID: bce4cad4-d2ce-11e9-ac08-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id bce4cad4-d2ce-11e9-ac08-12813bfff9fa;
 Mon, 09 Sep 2019 06:54:59 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id CE2B2AF3E;
 Mon,  9 Sep 2019 06:54:57 +0000 (UTC)
To: Juergen Gross <jgross@suse.com>
References: <20190809145833.1020-1-jgross@suse.com>
 <20190809145833.1020-10-jgross@suse.com>
 <3c6b8789-fa9a-8590-dc74-100c275e08eb@suse.com>
 <e8216a93-ec8d-6e91-a21a-96d3b1d33151@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <de415ad3-d6a4-2bc9-240b-8e1765cbcb4c@suse.com>
Date: Mon, 9 Sep 2019 08:55:07 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <e8216a93-ec8d-6e91-a21a-96d3b1d33151@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2 09/48] xen/sched: move some per-vcpu
 items to struct sched_unit
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
 Ian Jackson <ian.jackson@eu.citrix.com>, Dario Faggioli <dfaggioli@suse.com>,
 Julien Grall <julien.grall@arm.com>, Meng Xu <mengxu@cis.upenn.edu>,
 xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDkuMDkuMjAxOSAwODozOSwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPiBPbiAwNC4wOS4xOSAx
NjoxNiwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IE9uIDA5LjA4LjIwMTkgMTY6NTcsIEp1ZXJnZW4g
R3Jvc3Mgd3JvdGU6Cj4+PiBWMjoKPj4+IC0gbW92ZSBhZmZpbml0eV9icm9rZW4gYmFjayB0byBz
dHJ1Y3QgdmNwdSAoSmFuIEJldWxpY2gpCj4+Cj4+IEJ1dCB0aGlzIGFsb25lIHdvbid0IHdvcms6
IE5vdyBhIDJuZCB2Q1BVIGluIGEgdW5pdCB3aWxsIGNsb2JiZXIKPj4gd2hhdCBhIDFzdCBvbmUg
bWF5IGhhdmUgc2V0IGFzIGFuIGFmZmluaXR5IG92ZXJyaWRlLiBJIGRvbid0Cj4+IHRoaW5rIHlv
dSBjYW4gZ2V0IGF3YXkgd2l0aG91dCBhIHBlci12Q1BVIENQVSBtYXNrLCBvciBhCj4+IGNvbWJp
bmF0aW9uIG9mIHBlci12Q1BVIGFuZCBwZXItdW5pdCBzdGF0ZSBmbGFncy4KPiAKPiBTZWUgcGF0
Y2ggMjQ6IHRoaXMgb25lIGFkZHMgYSBoZWxwZXIgc2NoZWRfY2hlY2tfYWZmaW5pdHlfYnJva2Vu
KCkgZm9yCj4gdGhhdCBwdXJwb3NlIGl0ZXJhdGluZyBvdmVyIHRoZSB2Y3B1cyBjaGVja2luZyB0
aGUgYWZmaW5pdHlfYnJva2VuIGZsYWdzCj4gYW5kIHJldHVybmluZyB0cnVlIGlmIGFueSBvZiB0
aGUgdmNwdXMgaGFzIGl0cyBmbGFnIHNldC4KCk9rYXksIHBhdGNoIDI0IGlzIHN0aWxsIGJlZm9y
ZSBtdWx0aXBsZSB2Q1BVLXMgcGVyIHVuaXQgYmVjb21lCnBvc3NpYmxlLCBzbyBubyBpbnRlcm1l
ZGlhdGUgYnJlYWthZ2UuIEJ1dCBjb3VsZCB5b3UgcGxlYXNlCm1ha2UgdGhpcyBleHBsaWNpdCBi
eSBzbGlnaHRseSBleHRlbmRpbmcgdGhlIGRlc2NyaXB0aW9uIG9mIHRoZQpjaGFuZ2UgaGVyZT8K
CkphbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
