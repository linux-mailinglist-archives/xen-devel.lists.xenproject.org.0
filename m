Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B2931C1F53
	for <lists+xen-devel@lfdr.de>; Mon, 30 Sep 2019 12:42:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iEt5W-0004IE-E2; Mon, 30 Sep 2019 10:39:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=H1QO=XZ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iEt5U-0004Hs-LG
 for xen-devel@lists.xenproject.org; Mon, 30 Sep 2019 10:39:28 +0000
X-Inumbo-ID: 9380831c-e36e-11e9-bf31-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id 9380831c-e36e-11e9-bf31-bc764e2007e4;
 Mon, 30 Sep 2019 10:39:27 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id E5758AD3B;
 Mon, 30 Sep 2019 10:39:26 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20190930052135.11257-1-jgross@suse.com>
 <20190930052135.11257-2-jgross@suse.com>
 <e8b69bec-d9e2-8803-bc0a-4c3c315f97f2@suse.com>
 <9fca36ed-4090-8e35-1aec-2273dc74ab8d@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <60f98176-cfd7-460e-f5f8-05f263403bfa@suse.com>
Date: Mon, 30 Sep 2019 12:39:32 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <9fca36ed-4090-8e35-1aec-2273dc74ab8d@citrix.com>
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
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Dario Faggioli <dfaggioli@suse.com>,
 Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org,
 VolodymyrBabchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMzAuMDkuMjAxOSAxMjozOCwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAzMC8wOS8yMDE5
IDExOjM2LCBKYW4gQmV1bGljaCB3cm90ZToKPj4gT24gMzAuMDkuMjAxOSAwNzoyMSwgSnVlcmdl
biBHcm9zcyB3cm90ZToKPj4+IFdoZW4gc3dpdGNoaW5nIHNjaGVkIHVuaXRzIHN5bmNocm9uaXpl
IGFsbCB2Y3B1cyBvZiB0aGUgbmV3IHVuaXQgdG8gYmUKPj4+IHNjaGVkdWxlZCBhdCB0aGUgc2Ft
ZSB0aW1lLgo+Pj4KPj4+IEEgdmFyaWFibGUgc2NoZWRfZ3JhbnVsYXJpdHkgaXMgYWRkZWQgd2hp
Y2ggaG9sZHMgdGhlIG51bWJlciBvZiB2Y3B1cwo+Pj4gcGVyIHNjaGVkdWxlIHVuaXQuCj4+Pgo+
Pj4gQXMgdGFza2xldHMgcmVxdWlyZSB0byBzY2hlZHVsZSB0aGUgaWRsZSB1bml0IGl0IGlzIHJl
cXVpcmVkIHRvIHNldCB0aGUKPj4+IHRhc2tsZXRfd29ya19zY2hlZHVsZWQgcGFyYW1ldGVyIG9m
IGRvX3NjaGVkdWxlKCkgdG8gdHJ1ZSBpZiBhbnkgY3B1Cj4+PiBjb3ZlcmVkIGJ5IHRoZSBjdXJy
ZW50IHNjaGVkdWxlKCkgY2FsbCBoYXMgYW55IHBlbmRpbmcgdGFza2xldCB3b3JrLgo+Pj4KPj4+
IEZvciBqb2luaW5nIG90aGVyIHZjcHVzIG9mIHRoZSBzY2hlZHVsZSB1bml0IHdlIG5lZWQgdG8g
YWRkIGEgbmV3Cj4+PiBzb2Z0aXJxIFNDSEVEX1NMQVZFX1NPRlRJUlEgaW4gb3JkZXIgdG8gaGF2
ZSBhIHdheSB0byBpbml0aWF0ZSBhCj4+PiBjb250ZXh0IHN3aXRjaCB3aXRob3V0IGNhbGxpbmcg
dGhlIGdlbmVyaWMgc2NoZWR1bGUoKSBmdW5jdGlvbgo+Pj4gc2VsZWN0aW5nIHRoZSB2Y3B1IHRv
IHN3aXRjaCB0bywgYXMgd2UgYWxyZWFkeSBrbm93IHdoaWNoIHZjcHUgd2UKPj4+IHdhbnQgdG8g
cnVuLiBUaGlzIGhhcyB0aGUgb3RoZXIgYWR2YW50YWdlIG5vdCB0byBsb29zZSBhbnkgb3RoZXIK
Pj4+IGNvbmN1cnJlbnQgU0NIRURVTEVfU09GVElSUSBldmVudHMuCj4+Pgo+Pj4gU2lnbmVkLW9m
Zi1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgo+Pj4gUmV2aWV3ZWQtYnk6IERh
cmlvIEZhZ2dpb2xpIDxkZmFnZ2lvbGlAc3VzZS5jb20+Cj4+IHg4NiBhbmQgYXBwbGljYWJsZSBj
b21tb24gY29kZSBwYXJ0cwo+PiBBY2tlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2Uu
Y29tPgo+Pgo+PiBIb3dldmVyLCAuLi4KPj4KPj4+ICtzdGF0aWMgdm9pZCBzY2hlZF9jb250ZXh0
X3N3aXRjaChzdHJ1Y3QgdmNwdSAqdnByZXYsIHN0cnVjdCB2Y3B1ICp2bmV4dCwKPj4+ICsgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzX3RpbWVfdCBub3cpCj4+PiArewo+Pj4gKyAg
ICBpZiAoIHVubGlrZWx5KHZwcmV2ID09IHZuZXh0KSApCj4+PiAgICAgIHsKPj4+IC0gICAgICAg
IHBjcHVfc2NoZWR1bGVfdW5sb2NrX2lycShsb2NrLCBjcHUpOwo+Pj4gICAgICAgICAgVFJBQ0Vf
NEQoVFJDX1NDSEVEX1NXSVRDSF9JTkZDT05ULAo+Pj4gLSAgICAgICAgICAgICAgICAgbmV4dC0+
ZG9tYWluLT5kb21haW5faWQsIG5leHQtPnVuaXRfaWQsCj4+PiAtICAgICAgICAgICAgICAgICBu
b3cgLSBwcmV2LT5zdGF0ZV9lbnRyeV90aW1lLAo+Pj4gLSAgICAgICAgICAgICAgICAgcHJldi0+
bmV4dF90aW1lKTsKPj4+IC0gICAgICAgIHRyYWNlX2NvbnRpbnVlX3J1bm5pbmcobmV4dC0+dmNw
dV9saXN0KTsKPj4+IC0gICAgICAgIHJldHVybiBjb250aW51ZV9ydW5uaW5nKHByZXYtPnZjcHVf
bGlzdCk7Cj4+PiArICAgICAgICAgICAgICAgICB2bmV4dC0+ZG9tYWluLT5kb21haW5faWQsIHZu
ZXh0LT5zY2hlZF91bml0LT51bml0X2lkLAo+Pj4gKyAgICAgICAgICAgICAgICAgbm93IC0gdnBy
ZXYtPnJ1bnN0YXRlLnN0YXRlX2VudHJ5X3RpbWUsCj4+PiArICAgICAgICAgICAgICAgICB2cHJl
di0+c2NoZWRfdW5pdC0+bmV4dF90aW1lKTsKPj4+ICsgICAgICAgIHNjaGVkX2NvbnRleHRfc3dp
dGNoZWQodnByZXYsIHZuZXh0KTsKPj4+ICsgICAgICAgIHRyYWNlX2NvbnRpbnVlX3J1bm5pbmco
dm5leHQpOwo+Pj4gKyAgICAgICAgcmV0dXJuIGNvbnRpbnVlX3J1bm5pbmcodnByZXYpOwo+Pj4g
ICAgICB9Cj4+IC4uLiBJIGRvbid0IHJlY2FsbCBpZiB0aGVyZSB3ZXJlbid0IGNvbXBpbGVyIChj
bGFuZz8pIHZlcnNpb25zIG5vdAo+PiBhbGxvd2luZyAob3IgYXQgbGVhc3Qgd2FybmluZyBhYm91
dCkgdXNlIG9mIHRoaXMgZXh0ZW5zaW9uLgo+IAo+IFdoaWNoIGV4dGVuc2lvbj8KCiJyZXR1cm4i
IHdpdGggYW4gZXhwcmVzc2lvbiBvZiAidm9pZCIgdHlwZS4KCkphbgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
