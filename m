Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D3066CFB65
	for <lists+xen-devel@lfdr.de>; Tue,  8 Oct 2019 15:34:51 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iHpbJ-0003QS-L5; Tue, 08 Oct 2019 13:32:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=aTbt=YB=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iHpbI-0003QN-12
 for xen-devel@lists.xenproject.org; Tue, 08 Oct 2019 13:32:28 +0000
X-Inumbo-ID: 11329266-e9d0-11e9-97ce-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 11329266-e9d0-11e9-97ce-12813bfff9fa;
 Tue, 08 Oct 2019 13:32:26 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 91A52AD09;
 Tue,  8 Oct 2019 13:32:25 +0000 (UTC)
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20191002104935.60245-1-roger.pau@citrix.com>
 <c5dc7c62-ea14-7930-8f2d-62e20984da60@suse.com>
 <20191008092344.GB66437@Air-de-Roger>
 <1a8d42d4-a456-ad55-d063-6099a7b735e8@suse.com>
 <20191008110901.GC66437@Air-de-Roger>
 <9ea4ba56-ffd6-0b4a-47d0-cfac5291d49b@suse.com>
 <20191008131425.GE66437@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <7db8ed62-44a7-fac5-dd54-3d1bed2e4dab@suse.com>
Date: Tue, 8 Oct 2019 15:32:25 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191008131425.GE66437@Air-de-Roger>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] pci: clear host_maskall field on assign
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
Cc: xen-devel@lists.xenproject.org, Stanislav Spassov <stanspas@amazon.de>,
 Chao Gao <chao.gao@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDguMTAuMjAxOSAxNToxNCwgUm9nZXIgUGF1IE1vbm7DqSAgd3JvdGU6Cj4gT24gVHVlLCBP
Y3QgMDgsIDIwMTkgYXQgMDE6Mjg6NDlQTSArMDIwMCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IE9u
IDA4LjEwLjIwMTkgMTM6MDksIFJvZ2VyIFBhdSBNb25uw6kgIHdyb3RlOgo+Pj4gR2l2ZW4gdGhh
dCBhcyB5b3UgY29ycmVjdGx5IHBvaW50IG91dCBtYXNrYWxsIGlzIHVuc2V0IGFmdGVyIGRldmlj
ZQo+Pj4gcmVzZXQsIEkgZmVlbCB0aGF0IG9wdGlvbiA0IGlzIHRoZSBiZXN0IG9uZSBzaW5jZSBp
dCBtYXRjaGVzIHRoZSBzdGF0ZQo+Pj4gb2YgdGhlIGhhcmR3YXJlIGFmdGVyIHJlc2V0Lgo+Pgo+
PiBSaWdodCwgdGhhdCdzIHRoZSB2YXJpYW50IGNvbWluZyBjbG9zZXN0IHRvIHdoYXQgaGFyZHdh
cmUgc3RhdGUKPj4gb3VnaHQgdG8gYmUgYXQgdGhhdCBwb2ludC4gV2UnZCBuZWVkIHRvIGRvdWJs
ZSBjaGVjayB0aGF0IHRoZQo+PiBwZXItZW50cnkgbWFzayBiaXRzIGFyZSBhbGwgc2V0IGF0IHRo
YXQgcG9pbnQuCj4gCj4gSSdtIG5vdCBzYXlpbmcgc3VjaCBjaGVjayBpcyBub3Qgd29ydGggZG9p
bmcsIGJ1dCB3aHkgZG8gaXQgaW4gdGhpcwo+IGNhc2UgYnV0IG5vdCB3aGVuIGFsc28gY2xlYXJp
bmcgdGhlIG1hc2thbGwgKGluIG1zaXhfY2FwYWJpbGl0eV9pbml0KQo+IHdoZW4gY2FsbGVkIGZy
b20gcHJlcGFyZV9tc2l4PwoKQnkgImRvdWJsZSBjaGVjayIgSSBtZWFudCBpbnNwZWN0IHRoZSBz
b3VyY2UsIG5vdCB0byBhZGQgY2hlY2tpbmcgbG9naWMuCgpKYW4KCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
