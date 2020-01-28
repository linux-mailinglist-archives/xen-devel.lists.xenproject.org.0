Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B033F14B0C3
	for <lists+xen-devel@lfdr.de>; Tue, 28 Jan 2020 09:18:07 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iwM1T-0002YI-4h; Tue, 28 Jan 2020 08:14:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=iQoc=3R=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iwM1R-0002Y9-UD
 for xen-devel@lists.xenproject.org; Tue, 28 Jan 2020 08:14:57 +0000
X-Inumbo-ID: 44a0e52a-41a6-11ea-b45d-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 44a0e52a-41a6-11ea-b45d-bc764e2007e4;
 Tue, 28 Jan 2020 08:14:56 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 6383DAE24;
 Tue, 28 Jan 2020 08:14:55 +0000 (UTC)
To: Paul Durrant <pdurrant@amazon.com>
References: <20200124153103.18321-1-pdurrant@amazon.com>
 <20200124153103.18321-5-pdurrant@amazon.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <20130b6d-4428-6045-7e84-cd3b55d04ca8@suse.com>
Date: Tue, 28 Jan 2020 09:14:50 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <20200124153103.18321-5-pdurrant@amazon.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v4 4/7] x86 / vmx: move teardown from
 domain_destroy()...
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
Cc: Kevin Tian <kevin.tian@intel.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Jun Nakajima <jun.nakajima@intel.com>, xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjQuMDEuMjAyMCAxNjozMSwgUGF1bCBEdXJyYW50IHdyb3RlOgo+IC4uLiB0byBkb21haW5f
cmVsaW5xdWlzaF9yZXNvdXJjZXMoKS4KPiAKPiBUaGUgdGVhcmRvd24gY29kZSBmcmVlcyB0aGUg
QVBJQ3YgcGFnZS4gVGhpcyBkb2VzIG5vdCBuZWVkIHRvIGJlIGRvbmUgbGF0ZQo+IHNvIGRvIGl0
IGluIGRvbWFpbl9yZWxpbnF1aXNoX3Jlc291cmNlcygpIHJhdGhlciB0aGFuIGRvbWFpbl9kZXN0
cm95KCkuCgpGb3IgdGhlIG5vcm1hbCBkb21haW4gZGVzdHJ1Y3Rpb24gcGF0aCB0aGlzIGlzIGZp
bmUuIEZvciB0aGUgZXJyb3IgcGF0aApvZiBkb21haW5fY3JlYXRlKCksIGhvd2V2ZXIsIHRoaXMg
d2lsbCBsZWFrIHRoZSBwYWdlLCBhcyBpbiB0aGlzIGNhc2UKaHZtX2RvbWFpbl9yZWxpbnF1aXNo
X3Jlc291cmNlcygpIHdvbid0IGJlIGNhbGxlZC4gSSdtIGFmcmFpZCB0aGVyZQphbHJlYWR5IGlz
IGEgc2ltaWxhciBpc3N1ZSB3aXRoIGUuZy4gdmlyaWRpYW5fZG9tYWluX2RlaW5pdCgpLiBJIGd1
ZXNzCkknbGwgbWFrZSBhIHBhdGNoLgoKSmFuCgo+IFNpZ25lZC1vZmYtYnk6IFBhdWwgRHVycmFu
dCA8cGR1cnJhbnRAYW1hem9uLmNvbT4KPiAtLS0KPiBDYzogSnVuIE5ha2FqaW1hIDxqdW4ubmFr
YWppbWFAaW50ZWwuY29tPgo+IENjOiBLZXZpbiBUaWFuIDxrZXZpbi50aWFuQGludGVsLmNvbT4K
PiBDYzogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgo+IENjOiBBbmRyZXcgQ29vcGVy
IDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgo+IENjOiBXZWkgTGl1IDx3bEB4ZW4ub3JnPgo+
IENjOiAiUm9nZXIgUGF1IE1vbm7DqSIgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgo+IENjOiBHZW9y
Z2UgRHVubGFwIDxnZW9yZ2UuZHVubGFwQGNpdHJpeC5jb20+Cj4gCj4gdjQ6Cj4gICAtIE5ldyBp
biB2NCAoZGlzYWdncmVnYXRlZCBmcm9tIHYzIHBhdGNoICMzKQo+IC0tLQo+ICB4ZW4vYXJjaC94
ODYvaHZtL3ZteC92bXguYyB8IDQgKystLQo+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25z
KCspLCAyIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvaHZtL3Zt
eC92bXguYyBiL3hlbi9hcmNoL3g4Ni9odm0vdm14L3ZteC5jCj4gaW5kZXggYjI2MmQzOGE3Yy4u
NjA2ZjNkYzJlYiAxMDA2NDQKPiAtLS0gYS94ZW4vYXJjaC94ODYvaHZtL3ZteC92bXguYwo+ICsr
KyBiL3hlbi9hcmNoL3g4Ni9odm0vdm14L3ZteC5jCj4gQEAgLTQxOSw3ICs0MTksNyBAQCBzdGF0
aWMgaW50IHZteF9kb21haW5faW5pdGlhbGlzZShzdHJ1Y3QgZG9tYWluICpkKQo+ICAgICAgcmV0
dXJuIDA7Cj4gIH0KPiAgCj4gLXN0YXRpYyB2b2lkIHZteF9kb21haW5fZGVzdHJveShzdHJ1Y3Qg
ZG9tYWluICpkKQo+ICtzdGF0aWMgdm9pZCB2bXhfZG9tYWluX3JlbGlucXVpc2hfcmVzb3VyY2Vz
KHN0cnVjdCBkb21haW4gKmQpCj4gIHsKPiAgICAgIGlmICggIWhhc192bGFwaWMoZCkgKQo+ICAg
ICAgICAgIHJldHVybjsKPiBAQCAtMjI0MCw3ICsyMjQwLDcgQEAgc3RhdGljIHN0cnVjdCBodm1f
ZnVuY3Rpb25fdGFibGUgX19pbml0ZGF0YSB2bXhfZnVuY3Rpb25fdGFibGUgPSB7Cj4gICAgICAu
Y3B1X3VwX3ByZXBhcmUgICAgICAgPSB2bXhfY3B1X3VwX3ByZXBhcmUsCj4gICAgICAuY3B1X2Rl
YWQgICAgICAgICAgICAgPSB2bXhfY3B1X2RlYWQsCj4gICAgICAuZG9tYWluX2luaXRpYWxpc2Ug
ICAgPSB2bXhfZG9tYWluX2luaXRpYWxpc2UsCj4gLSAgICAuZG9tYWluX2Rlc3Ryb3kgICAgICAg
PSB2bXhfZG9tYWluX2Rlc3Ryb3ksCj4gKyAgICAuZG9tYWluX3JlbGlucXVpc2hfcmVzb3VyY2Vz
ID0gdm14X2RvbWFpbl9yZWxpbnF1aXNoX3Jlc291cmNlcywKPiAgICAgIC52Y3B1X2luaXRpYWxp
c2UgICAgICA9IHZteF92Y3B1X2luaXRpYWxpc2UsCj4gICAgICAudmNwdV9kZXN0cm95ICAgICAg
ICAgPSB2bXhfdmNwdV9kZXN0cm95LAo+ICAgICAgLnNhdmVfY3B1X2N0eHQgICAgICAgID0gdm14
X3NhdmVfdm1jc19jdHh0LAo+IAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
