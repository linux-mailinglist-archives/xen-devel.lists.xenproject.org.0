Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C5071A38AD
	for <lists+xen-devel@lfdr.de>; Fri, 30 Aug 2019 16:01:33 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i3hQ5-0007it-GZ; Fri, 30 Aug 2019 13:58:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=xdvb=W2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i3hQ4-0007ij-7u
 for xen-devel@lists.xenproject.org; Fri, 30 Aug 2019 13:58:28 +0000
X-Inumbo-ID: 3c3b8d7a-cb2e-11e9-ae8a-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3c3b8d7a-cb2e-11e9-ae8a-12813bfff9fa;
 Fri, 30 Aug 2019 13:58:25 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 93829AF68;
 Fri, 30 Aug 2019 13:58:24 +0000 (UTC)
To: Paul Durrant <paul.durrant@citrix.com>
References: <20190830082953.2192-1-paul.durrant@citrix.com>
 <20190830082953.2192-4-paul.durrant@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <116198cb-069c-34bf-e836-d23adfe8f83e@suse.com>
Date: Fri, 30 Aug 2019 15:58:26 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190830082953.2192-4-paul.durrant@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v7 3/6] use is_iommu_enabled() where
 appropriate...
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
 Stefano Stabellini <sstabellini@kernel.org>,
 Jun Nakajima <jun.nakajima@intel.com>, WeiLiu <wl@xen.org>,
 George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, JulienGrall <julien.grall@arm.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
 xen-devel@lists.xenproject.org, Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMzAuMDguMjAxOSAxMDoyOSwgUGF1bCBEdXJyYW50IHdyb3RlOgo+IC0tLSBhL3hlbi9pbmNs
dWRlL2FzbS14ODYvaW9tbXUuaAo+ICsrKyBiL3hlbi9pbmNsdWRlL2FzbS14ODYvaW9tbXUuaAo+
IEBAIC02MSw4ICs2MSwxNyBAQCBleHRlcm4gc3RydWN0IGlvbW11X29wcyBpb21tdV9vcHM7Cj4g
IAo+ICAjaWZkZWYgTkRFQlVHCj4gICMgaW5jbHVkZSA8YXNtL2FsdGVybmF0aXZlLmg+Cj4gLSMg
ZGVmaW5lIGlvbW11X2NhbGwob3BzLCBmbiwgYXJncy4uLikgIGFsdGVybmF0aXZlX2NhbGwoaW9t
bXVfb3BzLmZuLCAjIyBhcmdzKQo+IC0jIGRlZmluZSBpb21tdV92Y2FsbChvcHMsIGZuLCBhcmdz
Li4uKSBhbHRlcm5hdGl2ZV92Y2FsbChpb21tdV9vcHMuZm4sICMjIGFyZ3MpCj4gKyMgZGVmaW5l
IGlvbW11X2NhbGwob3BzLCBmbiwgYXJncy4uLikgICAgICAgICBcCj4gKyh7ICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCj4gKyAgICAodm9pZClvcHM7ICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBcCj4gKyAgICBhbHRlcm5hdGl2ZV9jYWxsKGlvbW11
X29wcy5mbiwgIyMgYXJncyk7ICBcCj4gK30pCj4gKwo+ICsjIGRlZmluZSBpb21tdV92Y2FsbChv
cHMsIGZuLCBhcmdzLi4uKSAgICAgICAgXAo+ICsoeyAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgXAo+ICsgICAgKHZvaWQpb3BzOyAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgXAo+ICsgICAgYWx0ZXJuYXRpdmVfdmNhbGwoaW9tbXVfb3BzLmZuLCAjIyBh
cmdzKTsgXAo+ICt9KQo+ICAjZW5kaWYKCldoaWxlIHVubGlrZWx5IHRvIGJlY29tZSBhbiBpc3N1
ZSwgIm9wcyIgc2hvdWxkIGJlIHBhcmVudGhlc2l6ZWQKaGVyZS4gQWxzbyB3ZSBjb21tb25seSAo
YnV0LCBncmFudGVkLCBub3QgY29uc2lzdGVudGx5KSBwdXQgKHsgb24KdGhlICNkZWZpbmUgbGlu
ZS4gQ2FuIGJvdGggYmUgZG9uZSB3aGlsZSBjb21taXR0aW5nLgoKSmFuCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
