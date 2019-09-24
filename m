Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 17B8BBC724
	for <lists+xen-devel@lfdr.de>; Tue, 24 Sep 2019 13:49:12 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iCjGr-0000Xh-JO; Tue, 24 Sep 2019 11:46:17 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=MVCM=XT=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iCjGp-0000Xb-PH
 for xen-devel@lists.xenproject.org; Tue, 24 Sep 2019 11:46:15 +0000
X-Inumbo-ID: e97e95c2-dec0-11e9-9616-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id e97e95c2-dec0-11e9-9616-12813bfff9fa;
 Tue, 24 Sep 2019 11:46:14 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 1B3D2AFAE;
 Tue, 24 Sep 2019 11:46:14 +0000 (UTC)
To: Jan Beulich <jbeulich@suse.com>
References: <20190914085251.18816-1-jgross@suse.com>
 <20190914085251.18816-11-jgross@suse.com>
 <f61b9f25-d9b7-53aa-dead-cccda1fff9ef@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <232efdf7-e8ba-68aa-1a15-3e4bda6638af@suse.com>
Date: Tue, 24 Sep 2019 13:46:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <f61b9f25-d9b7-53aa-dead-cccda1fff9ef@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3 10/47] xen/sched: add scheduler helpers
 hiding vcpu
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
 George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Dario Faggioli <dfaggioli@suse.com>,
 Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTkuMDkuMTkgMTc6NDUsIEphbiBCZXVsaWNoIHdyb3RlOgo+IE9uIDE0LjA5LjIwMTkgMTA6
NTIsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4+IEFkZCB0aGUgZm9sbG93aW5nIGhlbHBlcnMgdXNp
bmcgYSBzY2hlZF91bml0IGFzIGlucHV0IGluc3RlYWQgb2YgYQo+PiB2Y3B1Ogo+Pgo+PiAtIGlz
X2lkbGVfdW5pdCgpIHNpbWlsYXIgdG8gaXNfaWRsZV92Y3B1KCkKPj4gLSBpc191bml0X29ubGlu
ZSgpIHNpbWlsYXIgdG8gaXNfdmNwdV9vbmxpbmUoKSAocmV0dXJucyB0cnVlIHdoZW4gYW55Cj4+
ICAgIG9mIGl0cyB2Y3B1cyBpcyBvbmxpbmUpCj4+IC0gdW5pdF9ydW5uYWJsZSgpIGxpa2UgdmNw
dV9ydW5uYWJsZSgpIChyZXR1cm5zIHRydWUgaWYgYW55IG9mIGl0cwo+PiAgICB2Y3B1cyBpcyBy
dW5uYWJsZSkKPj4gLSBzY2hlZF9zZXRfcmVzKCkgdG8gc2V0IHRoZSBjdXJyZW50IHNjaGVkdWxp
bmcgcmVzb3VyY2Ugb2YgYSB1bml0Cj4+IC0gc2NoZWRfdW5pdF9jcHUoKSB0byBnZXQgdGhlIGN1
cnJlbnQgcHJvY2Vzc29yIG9mIGEgdW5pdCAocmV0dXJucwo+PiAgICB0aGUgbWFzdGVyX2NwdSBv
ZiB0aGUgc2NoZWR1bGluZyByZXNvdXJjZSBvZiBhIHVuaXQpCj4gCj4gQW5kIGhlbmNlIHBlcmhh
cHMgYmV0dGVyIHNjaGVkX3VuaXRfbWFzdGVyKCkgb3Igc2NoZWRfdW5pdF9tYXN0ZXJfY3B1KCk/
CgpZZXMsIHNjaGVkX3VuaXRfbWFzdGVyKCkgaXMgZmluZS4KCj4gCj4+IC0gc2NoZWRfe3NldHxj
bGVhcn1fcGF1c2VfZmxhZ3NbX2F0b21pY10oKSB0byBtb2RpZnkgcGF1c2VfZmxhZ3Mgb2YgdGhl
Cj4+ICAgIGFzc29jaWF0ZWQgdmNwdShzKSAobW9kaWZpZXMgdGhlIHBhdXNlX2ZsYWdzIG9mIGFs
bCB2Y3B1cyBvZiB0aGUKPj4gICAgdW5pdCkKPiAKPiBJIGNvbnRpbnVlIHRvIHRoaW5rIHRoYXQg
aXQgd291bGQgaGF2ZSBiZWVuIGJldHRlciB0byBoYXZlIGFsbCBvZgo+IHRoZXNlIGhhdmUgdGhl
aXIgbG9vcHMgcmlnaHQgZnJvbSB0aGUgYmVnaW5uaW5nLiBCdXQgaXQnbGwgYmUgdGhlCj4gc2No
ZWR1bGVyIG1haW50YWluZXJzIGFueXdheSB0byBhY2sgKG9yIG5vdCkgdGhlIHBhdGNoIGluIGl0
cwo+IGN1cnJlbnQgc2hhcGUuCgpEYXJpbyBoYXMgYWxyZWFkeSBtZW50aW9uZWQgaGUnZCBsaWtl
IHRoYXQsIHRvby4gU28gSSdsbCBkbyBpdC4KCgpKdWVyZ2VuCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
