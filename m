Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DD65C8A5F
	for <lists+xen-devel@lfdr.de>; Wed,  2 Oct 2019 15:59:39 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iFf73-00061T-50; Wed, 02 Oct 2019 13:56:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=lglc=X3=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iFf71-00061O-P2
 for xen-devel@lists.xenproject.org; Wed, 02 Oct 2019 13:56:15 +0000
X-Inumbo-ID: 655e3196-e51c-11e9-bf31-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id 655e3196-e51c-11e9-bf31-bc764e2007e4;
 Wed, 02 Oct 2019 13:56:13 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id E32F2AB87;
 Wed,  2 Oct 2019 13:56:12 +0000 (UTC)
To: xen-devel@lists.xenproject.org
References: <20191002072745.24919-1-jgross@suse.com>
 <20191002072745.24919-2-jgross@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <68ab9788-a61e-bffc-3fdb-ddc82450dfdd@suse.com>
Date: Wed, 2 Oct 2019 15:56:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191002072745.24919-2-jgross@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v6 01/20] xen/sched: add code to sync
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Jan Beulich <jbeulich@suse.com>, Dario Faggioli <dfaggioli@suse.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDIuMTAuMTkgMDk6MjcsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4gV2hlbiBzd2l0Y2hpbmcg
c2NoZWQgdW5pdHMgc3luY2hyb25pemUgYWxsIHZjcHVzIG9mIHRoZSBuZXcgdW5pdCB0byBiZQo+
IHNjaGVkdWxlZCBhdCB0aGUgc2FtZSB0aW1lLgo+IAo+IEEgdmFyaWFibGUgc2NoZWRfZ3JhbnVs
YXJpdHkgaXMgYWRkZWQgd2hpY2ggaG9sZHMgdGhlIG51bWJlciBvZiB2Y3B1cwo+IHBlciBzY2hl
ZHVsZSB1bml0Lgo+IAo+IEFzIHRhc2tsZXRzIHJlcXVpcmUgdG8gc2NoZWR1bGUgdGhlIGlkbGUg
dW5pdCBpdCBpcyByZXF1aXJlZCB0byBzZXQgdGhlCj4gdGFza2xldF93b3JrX3NjaGVkdWxlZCBw
YXJhbWV0ZXIgb2YgZG9fc2NoZWR1bGUoKSB0byB0cnVlIGlmIGFueSBjcHUKPiBjb3ZlcmVkIGJ5
IHRoZSBjdXJyZW50IHNjaGVkdWxlKCkgY2FsbCBoYXMgYW55IHBlbmRpbmcgdGFza2xldCB3b3Jr
Lgo+IAo+IEZvciBqb2luaW5nIG90aGVyIHZjcHVzIG9mIHRoZSBzY2hlZHVsZSB1bml0IHdlIG5l
ZWQgdG8gYWRkIGEgbmV3Cj4gc29mdGlycSBTQ0hFRF9TTEFWRV9TT0ZUSVJRIGluIG9yZGVyIHRv
IGhhdmUgYSB3YXkgdG8gaW5pdGlhdGUgYQo+IGNvbnRleHQgc3dpdGNoIHdpdGhvdXQgY2FsbGlu
ZyB0aGUgZ2VuZXJpYyBzY2hlZHVsZSgpIGZ1bmN0aW9uCj4gc2VsZWN0aW5nIHRoZSB2Y3B1IHRv
IHN3aXRjaCB0bywgYXMgd2UgYWxyZWFkeSBrbm93IHdoaWNoIHZjcHUgd2UKPiB3YW50IHRvIHJ1
bi4gVGhpcyBoYXMgdGhlIG90aGVyIGFkdmFudGFnZSBub3QgdG8gbG9vc2UgYW55IG90aGVyCj4g
Y29uY3VycmVudCBTQ0hFRFVMRV9TT0ZUSVJRIGV2ZW50cy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBK
dWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+Cj4gUmV2aWV3ZWQtYnk6IERhcmlvIEZhZ2dp
b2xpIDxkZmFnZ2lvbGlAc3VzZS5jb20+Cj4gQWNrZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGlj
aEBzdXNlLmNvbT4KCkp1bGllbiBnYXZlIGlzIEFja2VkLWJ5IHZpYSBJUkMuCgoKSnVlcmdlbgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
