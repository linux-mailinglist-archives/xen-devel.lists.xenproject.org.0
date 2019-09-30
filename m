Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF2EAC1F75
	for <lists+xen-devel@lfdr.de>; Mon, 30 Sep 2019 12:44:12 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iEt8I-00058m-6h; Mon, 30 Sep 2019 10:42:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=hbFO=XZ=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iEt8H-00058d-7W
 for xen-devel@lists.xenproject.org; Mon, 30 Sep 2019 10:42:21 +0000
X-Inumbo-ID: fa60fdf0-e36e-11e9-bf31-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id fa60fdf0-e36e-11e9-bf31-bc764e2007e4;
 Mon, 30 Sep 2019 10:42:20 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 1A8A6B19B;
 Mon, 30 Sep 2019 10:42:19 +0000 (UTC)
To: Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
References: <20190930052135.11257-1-jgross@suse.com>
 <20190930052135.11257-2-jgross@suse.com>
 <e8b69bec-d9e2-8803-bc0a-4c3c315f97f2@suse.com>
 <9fca36ed-4090-8e35-1aec-2273dc74ab8d@citrix.com>
 <60f98176-cfd7-460e-f5f8-05f263403bfa@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <f9af41cc-ef7c-e4ba-5af6-da4f27dc536c@suse.com>
Date: Mon, 30 Sep 2019 12:42:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <60f98176-cfd7-460e-f5f8-05f263403bfa@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v5 01/19] xen/sched: add code to sync
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
 George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Dario Faggioli <dfaggioli@suse.com>,
 Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org,
 VolodymyrBabchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMzAuMDkuMTkgMTI6MzksIEphbiBCZXVsaWNoIHdyb3RlOgo+IE9uIDMwLjA5LjIwMTkgMTI6
MzgsIEFuZHJldyBDb29wZXIgd3JvdGU6Cj4+IE9uIDMwLzA5LzIwMTkgMTE6MzYsIEphbiBCZXVs
aWNoIHdyb3RlOgo+Pj4gT24gMzAuMDkuMjAxOSAwNzoyMSwgSnVlcmdlbiBHcm9zcyB3cm90ZToK
Pj4+PiBXaGVuIHN3aXRjaGluZyBzY2hlZCB1bml0cyBzeW5jaHJvbml6ZSBhbGwgdmNwdXMgb2Yg
dGhlIG5ldyB1bml0IHRvIGJlCj4+Pj4gc2NoZWR1bGVkIGF0IHRoZSBzYW1lIHRpbWUuCj4+Pj4K
Pj4+PiBBIHZhcmlhYmxlIHNjaGVkX2dyYW51bGFyaXR5IGlzIGFkZGVkIHdoaWNoIGhvbGRzIHRo
ZSBudW1iZXIgb2YgdmNwdXMKPj4+PiBwZXIgc2NoZWR1bGUgdW5pdC4KPj4+Pgo+Pj4+IEFzIHRh
c2tsZXRzIHJlcXVpcmUgdG8gc2NoZWR1bGUgdGhlIGlkbGUgdW5pdCBpdCBpcyByZXF1aXJlZCB0
byBzZXQgdGhlCj4+Pj4gdGFza2xldF93b3JrX3NjaGVkdWxlZCBwYXJhbWV0ZXIgb2YgZG9fc2No
ZWR1bGUoKSB0byB0cnVlIGlmIGFueSBjcHUKPj4+PiBjb3ZlcmVkIGJ5IHRoZSBjdXJyZW50IHNj
aGVkdWxlKCkgY2FsbCBoYXMgYW55IHBlbmRpbmcgdGFza2xldCB3b3JrLgo+Pj4+Cj4+Pj4gRm9y
IGpvaW5pbmcgb3RoZXIgdmNwdXMgb2YgdGhlIHNjaGVkdWxlIHVuaXQgd2UgbmVlZCB0byBhZGQg
YSBuZXcKPj4+PiBzb2Z0aXJxIFNDSEVEX1NMQVZFX1NPRlRJUlEgaW4gb3JkZXIgdG8gaGF2ZSBh
IHdheSB0byBpbml0aWF0ZSBhCj4+Pj4gY29udGV4dCBzd2l0Y2ggd2l0aG91dCBjYWxsaW5nIHRo
ZSBnZW5lcmljIHNjaGVkdWxlKCkgZnVuY3Rpb24KPj4+PiBzZWxlY3RpbmcgdGhlIHZjcHUgdG8g
c3dpdGNoIHRvLCBhcyB3ZSBhbHJlYWR5IGtub3cgd2hpY2ggdmNwdSB3ZQo+Pj4+IHdhbnQgdG8g
cnVuLiBUaGlzIGhhcyB0aGUgb3RoZXIgYWR2YW50YWdlIG5vdCB0byBsb29zZSBhbnkgb3RoZXIK
Pj4+PiBjb25jdXJyZW50IFNDSEVEVUxFX1NPRlRJUlEgZXZlbnRzLgo+Pj4+Cj4+Pj4gU2lnbmVk
LW9mZi1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgo+Pj4+IFJldmlld2VkLWJ5
OiBEYXJpbyBGYWdnaW9saSA8ZGZhZ2dpb2xpQHN1c2UuY29tPgo+Pj4geDg2IGFuZCBhcHBsaWNh
YmxlIGNvbW1vbiBjb2RlIHBhcnRzCj4+PiBBY2tlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNo
QHN1c2UuY29tPgo+Pj4KPj4+IEhvd2V2ZXIsIC4uLgo+Pj4KPj4+PiArc3RhdGljIHZvaWQgc2No
ZWRfY29udGV4dF9zd2l0Y2goc3RydWN0IHZjcHUgKnZwcmV2LCBzdHJ1Y3QgdmNwdSAqdm5leHQs
Cj4+Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHNfdGltZV90IG5vdykKPj4+
PiArewo+Pj4+ICsgICAgaWYgKCB1bmxpa2VseSh2cHJldiA9PSB2bmV4dCkgKQo+Pj4+ICAgICAg
IHsKPj4+PiAtICAgICAgICBwY3B1X3NjaGVkdWxlX3VubG9ja19pcnEobG9jaywgY3B1KTsKPj4+
PiAgICAgICAgICAgVFJBQ0VfNEQoVFJDX1NDSEVEX1NXSVRDSF9JTkZDT05ULAo+Pj4+IC0gICAg
ICAgICAgICAgICAgIG5leHQtPmRvbWFpbi0+ZG9tYWluX2lkLCBuZXh0LT51bml0X2lkLAo+Pj4+
IC0gICAgICAgICAgICAgICAgIG5vdyAtIHByZXYtPnN0YXRlX2VudHJ5X3RpbWUsCj4+Pj4gLSAg
ICAgICAgICAgICAgICAgcHJldi0+bmV4dF90aW1lKTsKPj4+PiAtICAgICAgICB0cmFjZV9jb250
aW51ZV9ydW5uaW5nKG5leHQtPnZjcHVfbGlzdCk7Cj4+Pj4gLSAgICAgICAgcmV0dXJuIGNvbnRp
bnVlX3J1bm5pbmcocHJldi0+dmNwdV9saXN0KTsKPj4+PiArICAgICAgICAgICAgICAgICB2bmV4
dC0+ZG9tYWluLT5kb21haW5faWQsIHZuZXh0LT5zY2hlZF91bml0LT51bml0X2lkLAo+Pj4+ICsg
ICAgICAgICAgICAgICAgIG5vdyAtIHZwcmV2LT5ydW5zdGF0ZS5zdGF0ZV9lbnRyeV90aW1lLAo+
Pj4+ICsgICAgICAgICAgICAgICAgIHZwcmV2LT5zY2hlZF91bml0LT5uZXh0X3RpbWUpOwo+Pj4+
ICsgICAgICAgIHNjaGVkX2NvbnRleHRfc3dpdGNoZWQodnByZXYsIHZuZXh0KTsKPj4+PiArICAg
ICAgICB0cmFjZV9jb250aW51ZV9ydW5uaW5nKHZuZXh0KTsKPj4+PiArICAgICAgICByZXR1cm4g
Y29udGludWVfcnVubmluZyh2cHJldik7Cj4+Pj4gICAgICAgfQo+Pj4gLi4uIEkgZG9uJ3QgcmVj
YWxsIGlmIHRoZXJlIHdlcmVuJ3QgY29tcGlsZXIgKGNsYW5nPykgdmVyc2lvbnMgbm90Cj4+PiBh
bGxvd2luZyAob3IgYXQgbGVhc3Qgd2FybmluZyBhYm91dCkgdXNlIG9mIHRoaXMgZXh0ZW5zaW9u
Lgo+Pgo+PiBXaGljaCBleHRlbnNpb24/Cj4gCj4gInJldHVybiIgd2l0aCBhbiBleHByZXNzaW9u
IG9mICJ2b2lkIiB0eXBlLgoKSXQgd2FzIHRoZXJlIGluIHRoZSBvcmlnaW5hbCBjb2RlLCB0b286
CgpodHRwOi8veGVuYml0cy54ZW4ub3JnL2dpdHdlYi8/cD14ZW4uZ2l0O2E9YmxvYjtmPXhlbi9j
b21tb24vc2NoZWR1bGUuYztoPWZkNTg3NjIyZjRjM2VlMTNkNTczMzRmOTBiMWVhYjRiMTcwMzFj
MGI7aGI9cmVmcy9oZWFkcy9zdGFnaW5nLTQuMTIjbDE1MzYKCgpKdWVyZ2VuCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
