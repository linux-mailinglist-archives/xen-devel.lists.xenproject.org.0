Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 65871C1F80
	for <lists+xen-devel@lfdr.de>; Mon, 30 Sep 2019 12:47:53 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iEtBW-0005br-MU; Mon, 30 Sep 2019 10:45:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=H1QO=XZ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iEtBV-0005bk-BM
 for xen-devel@lists.xenproject.org; Mon, 30 Sep 2019 10:45:41 +0000
X-Inumbo-ID: 71d97344-e36f-11e9-bf31-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id 71d97344-e36f-11e9-bf31-bc764e2007e4;
 Mon, 30 Sep 2019 10:45:40 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id EB9A8AEA7;
 Mon, 30 Sep 2019 10:45:39 +0000 (UTC)
To: Juergen Gross <jgross@suse.com>
References: <20190930052135.11257-1-jgross@suse.com>
 <20190930052135.11257-8-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <c5bada63-1e32-abce-1f44-db7e552e8eff@suse.com>
Date: Mon, 30 Sep 2019 12:45:45 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20190930052135.11257-8-jgross@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v5 07/19] xen/sched: add fall back to idle
 vcpu when scheduling unit
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

T24gMzAuMDkuMjAxOSAwNzoyMSwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPiBXaGVuIHNjaGVkdWxp
bmcgYW4gdW5pdCB3aXRoIG11bHRpcGxlIHZjcHVzIHRoZXJlIGlzIG5vIGd1YXJhbnRlZSBhbGwK
PiB2Y3B1cyBhcmUgYXZhaWxhYmxlIChlLmcuIGFib3ZlIG1heHZjcHVzIG9yIHZjcHUgb2ZmbGlu
ZSkuIEZhbGwgYmFjayB0bwo+IGlkbGUgdmNwdSBvZiB0aGUgY3VycmVudCBjcHUgaW4gdGhhdCBj
YXNlLiBUaGlzIHJlcXVpcmVzIHRvIHN0b3JlIHRoZQo+IGNvcnJlY3Qgc2NoZWR1bGVfdW5pdCBw
b2ludGVyIGluIHRoZSBpZGxlIHZjcHUgYXMgbG9uZyBhcyBpdCB1c2VkIGFzCj4gZmFsbGJhY2sg
dmNwdS4KPiAKPiBJbiBvcmRlciB0byBtb2RpZnkgdGhlIHJ1bnN0YXRlcyBvZiB0aGUgY29ycmVj
dCB2Y3B1cyB3aGVuIHN3aXRjaGluZwo+IHNjaGVkdWxlIHVuaXRzIG1lcmdlIHNjaGVkX3VuaXRf
cnVuc3RhdGVfY2hhbmdlKCkgaW50bwo+IHNjaGVkX3N3aXRjaF91bml0cygpIGFuZCBsb29wIG92
ZXIgdGhlIGFmZmVjdGVkIHBoeXNpY2FsIGNwdXMgaW5zdGVhZAo+IG9mIHRoZSB1bml0J3MgdmNw
dXMuIFRoaXMgaW4gdHVybiByZXF1aXJlcyBhbiBhY2Nlc3MgZnVuY3Rpb24gdG8gdGhlCj4gY3Vy
cmVudCB2YXJpYWJsZSBvZiBvdGhlciBjcHVzLgo+IAo+IFRvZGF5IGNvbnRleHRfc2F2ZWQoKSBp
cyBjYWxsZWQgaW4gY2FzZSBwcmV2aW91cyBhbmQgbmV4dCB2Y3B1cyBkaWZmZXIKPiB3aGVuIGRv
aW5nIGEgY29udGV4dCBzd2l0Y2guIFdpdGggYW4gaWRsZSB2Y3B1IGJlaW5nIGNhcGFibGUgdG8g
YmUgYQo+IHN1YnN0aXR1dGUgZm9yIGFuIG9mZmxpbmUgdmNwdSB0aGlzIGlzIHByb2JsZW1hdGlj
IHdoZW4gc3dpdGNoaW5nIHRvCj4gYW4gaWRsZSBzY2hlZHVsaW5nIHVuaXQuIEFuIGlkbGUgcHJl
dmlvdXMgdmNwdSBsZWF2ZXMgdXMgaW4gZG91YnQgd2hpY2gKPiBzY2hlZHVsZSB1bml0IHdhcyBh
Y3RpdmUgcHJldmlvdXNseSwgc28gc2F2ZSB0aGUgcHJldmlvdXMgdW5pdCBwb2ludGVyCj4gaW4g
dGhlIHBlci1zY2hlZHVsZSByZXNvdXJjZSBhcmVhLiBJZiBpdCBpcyBOVUxMIHRoZSB1bml0IGhh
cyBub3QKPiBjaGFuZ2VkIGFuZCB3ZSBkb24ndCBoYXZlIHRvIHNldCB0aGUgcHJldmlvdXMgdW5p
dCB0byBiZSBub3QgcnVubmluZy4KPiAKPiBXaGVuIHJ1bm5pbmcgYW4gaWRsZSB2Y3B1IGluIGEg
bm9uLWlkbGUgc2NoZWR1bGluZyB1bml0IHVzZSBhIHNwZWNpZmljCj4gZ3Vlc3QgaWRsZSBsb29w
IG5vdCBwZXJmb3JtaW5nIGFueSBub24tc29mdGlycSB0YXNrbGV0cyBhbmQKPiBsaXZlcGF0Y2hp
bmcgaW4gb3JkZXIgdG8gYXZvaWQgcG9wdWxhdGluZyB0aGUgY3B1IGNhY2hlcyB3aXRoIG1lbW9y
eQo+IHVzZWQgYnkgb3RoZXIgZG9tYWlucyAoYXMgZmFyIGFzIHBvc3NpYmxlKS4gU29mdGlycXMg
YXJlIGNvbnNpZGVyZWQgdG8KPiBiZSBzYXZlLgo+IAo+IEluIG9yZGVyIHRvIGF2b2lkIGxpdmVw
YXRjaGluZyB3aGVuIGdvaW5nIHRvIGd1ZXN0IGlkbGUgYW5vdGhlcgo+IHZhcmlhbnQgb2YgcmVz
ZXRfc3RhY2tfYW5kX2p1bXAoKSBub3QgY2FsbGluZyBjaGVja19mb3JfbGl2ZXBhdGNoX3dvcmsK
PiBpcyBuZWVkZWQuCj4gCj4gU2lnbmVkLW9mZi1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1
c2UuY29tPgo+IEFja2VkLWJ5OiBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPgo+
IFJldmlld2VkLWJ5OiBEYXJpbyBGYWdnaW9saSA8ZGZhZ2dpb2xpQHN1c2UuY29tPgoKeDg2OgpB
Y2tlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKSmFuCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
