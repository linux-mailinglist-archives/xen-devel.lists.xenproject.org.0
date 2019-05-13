Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 469AA1BACF
	for <lists+xen-devel@lfdr.de>; Mon, 13 May 2019 18:14:37 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hQDXz-0005EF-JR; Mon, 13 May 2019 16:11:27 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=cGAx=TN=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hQDXy-0005EA-Ua
 for xen-devel@lists.xenproject.org; Mon, 13 May 2019 16:11:26 +0000
X-Inumbo-ID: c1d4990c-7599-11e9-8980-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id c1d4990c-7599-11e9-8980-bc764e045a96;
 Mon, 13 May 2019 16:11:25 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Mon, 13 May 2019 10:11:24 -0600
Message-Id: <5CD99729020000780022E4B1@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Mon, 13 May 2019 10:11:21 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Paul Durrant" <paul.durrant@citrix.com>
References: <20190508132403.1454-1-paul.durrant@citrix.com>
 <20190508132403.1454-4-paul.durrant@citrix.com>
In-Reply-To: <20190508132403.1454-4-paul.durrant@citrix.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH 3/5] iommu: move iommu_get_ops() into common
 code
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
Cc: Kevin Tian <kevin.tian@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien.grall@arm.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
 xen-devel <xen-devel@lists.xenproject.org>, Brian Woods <brian.woods@amd.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDA4LjA1LjE5IGF0IDE1OjI0LCA8cGF1bC5kdXJyYW50QGNpdHJpeC5jb20+IHdyb3Rl
Ogo+IEN1cnJlbnRseSB4ODYgYW5kIEFSTSBkaWZmZXIgaW4gdGhlaXIgaW1wbGVtZW50YXRpb24g
Zm9yIG5vIGdvb2QgcmVhc29uLgo+IFRoaXMgcGF0Y2ggbW92ZXMgdGhlIEFSTSB2YXJpYW50IG9m
IGlvbW11X2dldC9zZXRfb3BzKCkgaGVscGVycyBpbnRvCj4gY29tbW9uIGNvZGUgYW5kIG1vZGlm
aWVzIHRoZW0gc28gdGhleSBkZWFsIHdpdGggdGhlIF9faW5pdGNvbnN0cmVsCj4gb3BzIHN0cnVj
dHVyZXMgdXNlZCBieSB0aGUgeDg2IElPTU1VIHZlbmRvciBpbXBsZW1lbnRhdGlvbnMgKGFkZGlu
Zwo+IF9faW5pdGNvbnN0cmVsIHRvIHRoZSBTTU1VIGNvZGUgdG8gYnJpbmcgaXQgaW4gbGluZSku
IENvbnNlcXVlbnRseSwgYSBsYWNrCj4gb2YgaW5pdCgpIG1ldGhvZCBpcyBub3cgdGFrZW4gdG8g
bWVhbiB1bmluaXRpYWxpemVkIGlvbW11X29wcy4gQWxzbywgdGhlCj4gcHJpbnRrIHdhcm5pbmcg
aW4gaW9tbXVfc2V0X29wcygpIG5vdyBiZWNvbWVzIGFuIEFTU0VSVC4KCldoZW4gaGF2aW5nIHN1
Ym1pdHRlZCB0aGUgaW5kaXJlY3QgY2FsbCBvdmVyaGVhZCByZWR1Y3Rpb24gc2VyaWVzCmluY2x1
ZGluZyBJT01NVSBjaGFuZ2VzIGZvciB0aGUgZmlyc3QgdGltZSwgSSB3YXMgdG9sZCB0aGF0IHRo
ZSBBcm0KZm9sa3Mgd291bGQgbGlrZSB0byByZXRhaW4gdGhlIGFiaWxpdHkgdG8gZXZlbnR1YWxs
eSBzdXBwb3J0CmhldGVyb2dlbmVvdXMgSU9NTVVzIChhbmQgaGVuY2UgSSBzaG91bGRuJ3QgcHJv
dmlkZSBwYXRjaGluZwppbmZyYXN0cnVjdHVyZSB0aGVyZSkuIEEgc2luZ2xlIGdsb2JhbCBpb21t
dV9bZ3NdZXRfb3BzKCkgaXMgc29ydCBvZgpnZXR0aW5nIGluIHRoZSB3YXkgb2YgdGhpcyBhcyB3
ZWxsLCBJIHRoaW5rLCBhbmQgaGVuY2UgSSdtIG5vdCBzdXJlIGl0CmlzIGEgZGVzaXJhYmxlIHN0
ZXAgdG8gbWFrZSB0aGlzIHNvIGZhciBBcm0tc3BlY2lmaWMgYXJyYW5nZW1lbnQKdGhlIGdlbmVy
YWwgbW9kZWwuIEF0IGxlYXN0IGl0IHdvdWxkIGZ1cnRoZXIgY29tcGxpY2F0ZSBBcm0gc2lkZQpj
aGFuZ2VzIHRvd2FyZHMgdGhhdCAobWlkIC8gbG9uZyB0ZXJtPykgZ29hbC4KCj4gLS0tIGEveGVu
L2RyaXZlcnMvcGFzc3Rocm91Z2gvaW9tbXUuYwo+ICsrKyBiL3hlbi9kcml2ZXJzL3Bhc3N0aHJv
dWdoL2lvbW11LmMKPiBAQCAtMjEsNiArMjEsMjEgQEAKPiAgI2luY2x1ZGUgPHhlbi9rZXloYW5k
bGVyLmg+Cj4gICNpbmNsdWRlIDx4c20veHNtLmg+Cj4gIAo+ICtzdGF0aWMgc3RydWN0IGlvbW11
X29wcyBfX3JlYWRfbW9zdGx5IGlvbW11X29wczsKPiArCj4gK2NvbnN0IHN0cnVjdCBpb21tdV9v
cHMgKmlvbW11X2dldF9vcHModm9pZCkKPiArewo+ICsgICAgcmV0dXJuICZpb21tdV9vcHM7Cj4g
K30KPiArCj4gK3ZvaWQgX19pbml0IGlvbW11X3NldF9vcHMoY29uc3Qgc3RydWN0IGlvbW11X29w
cyAqb3BzKQo+ICt7Cj4gKyAgICBCVUdfT04oIW9wcyk7Cj4gKwo+ICsgICAgQVNTRVJUKCFpb21t
dV9vcHMuaW5pdCB8fCBpb21tdV9vcHMuaW5pdCA9PSBvcHMtPmluaXQpOwo+ICsgICAgaW9tbXVf
b3BzID0gKm9wczsKPiArfQoKSSByZWFsaXplIHRoYXQgeW91IG1lcmVseSBtb3ZlIChhbmQgc2xp
Z2h0bHkgcmUtYXJyYW5nZSkgd2hhdCBoYXMKYmVlbiB0aGVyZSwgYnV0IG5vdyB0aGF0IEkgbG9v
ayBhdCBpdCBhZ2FpbiBJIHRoaW5rIG9wcy0+aW5pdCBzaG91bGQKYWxzbyBiZSB2ZXJpZmllZCB0
byBiZSBub24tTlVMTCwgb3IgZWxzZSBpbnN0YWxsaW5nIHN1Y2ggYSBzZXQgb2YKaG9va3Mgd291
bGQgZWZmZWN0aXZlbHkgcmV2ZXJ0IGJhY2sgdG8gdGhlICJubyBob29rcyB5ZXQiIHN0YXRlLgoK
PiBAQCAtMzMsMTEgKzMyLDcgQEAgaW50IF9faW5pdCBpb21tdV9oYXJkd2FyZV9zZXR1cCh2b2lk
KQo+ICAgICAgaWYgKCAhaW9tbXVfaW5pdF9vcHMgKQo+ICAgICAgICAgIHJldHVybiAtRU5PREVW
Owo+ICAKPiAtICAgIGlmICggIWlvbW11X29wcy5pbml0ICkKPiAtICAgICAgICBpb21tdV9vcHMg
PSAqaW9tbXVfaW5pdF9vcHMtPm9wczsKPiAtICAgIGVsc2UKPiAtICAgICAgICAvKiB4MmFwaWMg
c2V0dXAgbWF5IGhhdmUgcHJldmlvdXNseSBpbml0aWFsaXNlZCB0aGUgc3RydWN0LiAqLwo+IC0g
ICAgICAgIEFTU0VSVChpb21tdV9vcHMuaW5pdCA9PSBpb21tdV9pbml0X29wcy0+b3BzLT5pbml0
KTsKPiArICAgIGlvbW11X3NldF9vcHMoaW9tbXVfaW5pdF9vcHMtPm9wcyk7CgpJIHdhcyBzcGVj
aWZpY2FsbHkgYXNrZWQgdG8gYWRkIHRoZSBjb21tZW50IHRoYXQgeW91IGdldCByaWQgb2YuCldo
aWxlIG1lbnRpb25pbmcgeDJBUElDIGluIGNvbW1vbiBjb2RlIG1heSBubyBiZSBhcHByb3ByaWF0
ZSwKSSdtIHN1cmUgdGhpcyBjb3VsZCBiZSB3b3JkZWQgaW4gYSBtb3JlIGdlbmVyYWwgd2F5IGFu
ZCBhdHRhY2hlZAp0byB0aGUgbW92ZWQgY2hlY2suCgpKYW4KCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
