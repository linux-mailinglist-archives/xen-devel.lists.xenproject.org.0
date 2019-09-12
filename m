Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C53F9B0DB0
	for <lists+xen-devel@lfdr.de>; Thu, 12 Sep 2019 13:21:40 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i8N75-0000mv-GW; Thu, 12 Sep 2019 11:18:11 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Pap2=XH=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1i8N73-0000mR-Hm
 for xen-devel@lists.xenproject.org; Thu, 12 Sep 2019 11:18:09 +0000
X-Inumbo-ID: f62026e0-d54e-11e9-83e7-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f62026e0-d54e-11e9-83e7-12813bfff9fa;
 Thu, 12 Sep 2019 11:17:53 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 82D7FACFE;
 Thu, 12 Sep 2019 11:17:50 +0000 (UTC)
To: Jan Beulich <jbeulich@suse.com>
References: <20190809145833.1020-1-jgross@suse.com>
 <20190809145833.1020-22-jgross@suse.com>
 <18ec96a1-b3c3-adbf-4b0e-1fcb7185e046@suse.com>
 <13f2cf63-2b61-07fa-f43d-044c61601bca@suse.com>
 <5aeddfeb-e01f-2cef-59ff-d66bcc067d37@suse.com>
From: Juergen Gross <jgross@suse.com>
Message-ID: <3fcb3db8-cda6-a90a-50c3-58f503057bcb@suse.com>
Date: Thu, 12 Sep 2019 13:17:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <5aeddfeb-e01f-2cef-59ff-d66bcc067d37@suse.com>
Content-Language: de-DE
Subject: Re: [Xen-devel] [PATCH v2 21/48] xen/sched: use sched_resource cpu
 instead smp_processor_id in schedulers
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
 Ian Jackson <ian.jackson@eu.citrix.com>,
 Robert VanVossen <robert.vanvossen@dornerworks.com>,
 Dario Faggioli <dfaggioli@suse.com>, Julien Grall <julien.grall@arm.com>,
 Josh Whitehead <josh.whitehead@dornerworks.com>,
 Meng Xu <mengxu@cis.upenn.edu>, xen-devel@lists.xenproject.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTIuMDkuMTkgMTI6MDQsIEphbiBCZXVsaWNoIHdyb3RlOgo+IE9uIDEyLjA5LjIwMTkgMTE6
MzQsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4+IE9uIDA5LjA5LjE5IDE2OjE3LCBKYW4gQmV1bGlj
aCB3cm90ZToKPj4+IE9uIDA5LjA4LjIwMTkgMTY6NTgsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4+
Pj4gQEAgLTE4MjUsOCArMTgyNSw5IEBAIHN0YXRpYyBzdHJ1Y3QgdGFza19zbGljZQo+Pj4+ICAg
IGNzY2hlZF9zY2hlZHVsZSgKPj4+PiAgICAgICAgY29uc3Qgc3RydWN0IHNjaGVkdWxlciAqb3Bz
LCBzX3RpbWVfdCBub3csIGJvb2xfdCB0YXNrbGV0X3dvcmtfc2NoZWR1bGVkKQo+Pj4+ICAgIHsK
Pj4+PiAtICAgIGNvbnN0IGludCBjcHUgPSBzbXBfcHJvY2Vzc29yX2lkKCk7Cj4+Pj4gLSAgICBz
dHJ1Y3QgbGlzdF9oZWFkICogY29uc3QgcnVucSA9IFJVTlEoY3B1KTsKPj4+PiArICAgIGNvbnN0
IHVuc2lnbmVkIGludCBjcHUgPSBzbXBfcHJvY2Vzc29yX2lkKCk7Cj4+Pj4gKyAgICBjb25zdCB1
bnNpZ25lZCBpbnQgc2NoZWRfY3B1ID0gc2NoZWRfZ2V0X3Jlc291cmNlX2NwdShjcHUpOwo+Pj4+
ICsgICAgc3RydWN0IGxpc3RfaGVhZCAqIGNvbnN0IHJ1bnEgPSBSVU5RKHNjaGVkX2NwdSk7Cj4+
Pgo+Pj4gQnkgcmV0YWluaW5nIGEgbG9jYWwgdmFyaWFibGUgbmFtZWQgImNwdSIgeW91IG1ha2Ug
aXQgY2xvc2UgdG8KPj4+IGltcG9zc2libGUgdG8gbm90aWNlLCBkdXJpbmcgYSByZS1iYXNlLCBh
biBhZGRpdGlvbiB0byB0aGUKPj4+IGZ1bmN0aW9uIHN0aWxsIHJlZmVyZW5jaW5nIGEgdmFyaWFi
bGUgb2YgdGhpcyBuYW1lLiBTaW1pbGFybHkKPj4+IHJldmlldyBpcyBiZWluZyBtYWRlIGhhcmRl
ciBiZWNhdXNlIG9uZSBuZWVkcyB0byBnbyBodW50IGFsbAo+Pj4gdGhlIHJlbWFpbmluZyB1c2Vz
IG9mICJjcHUiLiBGb3IgZXhhbXBsZSB0aGVyZSBhIHRyYWNlIGVudHJ5Cj4+PiBiZWluZyBnZW5l
cmF0ZWQsIGFuZCBpdCdzIG5vdCBvYnZpb3VzIHRvIG1lIHdoZXRoZXIgdGhpcyB3b3VsZG4ndAo+
Pj4gYmV0dGVyIGFsc28gdXNlZCBzY2hlZF9jcHUuCj4+Cj4+IE9rYXl5LCBJJ2xsIHJlbmFtZSAi
Y3B1IiB0byAibXlfY3B1Ii4KPiAKPiBXZSd2ZSBnb3QgYSBudW1iZXIgb2YgaW5zdGFuY2VzIG9m
ICJ0aGlzX2NwdSIgaW4gc3VjaCBjYXNlcyBhbHJlYWR5LAo+IGJ1dCBubyBzaW5nbGUgIm15X2Nw
dSIuIE1heSBJIHN1Z2dlc3QgdG8gc3RpY2sgdG8gdGhpcyBuYW1pbmcgaGVyZQo+IGFzIHdlbGw/
CgpIbW0sIGRvbid0IHlvdSB0aGluayBhZGRpbmcgZnVydGhlciBvdmVybG9hZGluZyBvZiAidGhp
c19jcHUiIGlzIGEgYmFkCmlkZWE/Cgo+IAo+PiBJIHVzZWQgY3B1IGluIHRoZSB0cmFjZSBlbnRy
eSBvbiBwdXJwb3NlLCBhcyBpdCBtaWdodCBiZSBpbnRlcmVzdGluZyBvbgo+PiB3aGljaCBjcHUg
dGhlIGVudHJ5IGhhcyBiZWVuIHByb2R1Y2VkLgo+IAo+IFJpZ2h0LCB0aGF0J3MgaG93IEkgdW5k
ZXJzdG9vZCBpdDsgaXQgc2ltcGx5IHNlZW1lZCBsaWtlIHRoZXJlCj4gbWlnaHQgYmUgYSBzaW1p
bGFybHkgdmFsaWQgdmlldyB0byB0aGUgY29udHJhcnkuCj4gCj4+Pj4gQEAgLTE5NjcsNyArMTk2
OCw3IEBAIGNzY2hlZF9zY2hlZHVsZSgKPj4+PiAgICAgICAgaWYgKCBzbmV4dC0+cHJpID4gQ1ND
SEVEX1BSSV9UU19PVkVSICkKPj4+PiAgICAgICAgICAgIF9fcnVucV9yZW1vdmUoc25leHQpOwo+
Pj4+ICAgICAgICBlbHNlCj4+Pj4gLSAgICAgICAgc25leHQgPSBjc2NoZWRfbG9hZF9iYWxhbmNl
KHBydiwgY3B1LCBzbmV4dCwgJnJldC5taWdyYXRlZCk7Cj4+Pj4gKyAgICAgICAgc25leHQgPSBj
c2NoZWRfbG9hZF9iYWxhbmNlKHBydiwgc2NoZWRfY3B1LCBzbmV4dCwgJnJldC5taWdyYXRlZCk7
Cj4+Pgo+Pj4gQW5kIGluIGEgY2FzZSBsaWtlIHRoaXMgb25lIEkgd29uZGVyIHdoZXRoZXIgcGFz
c2luZyBhICJzb3J0IG9mCj4+PiBDUFUiIGlzbid0IHN1ZmZpY2llbnRseSBjb25mdXNpbmcsIGNv
bXBhcmVkIHRvIGUuZy4gc2ltcGx5Cj4+PiBwYXNzaW5nIHRoZSBjb3JyZXNwb25kaW5nIHVuaXQu
Cj4+Cj4+IEkgZ3Vlc3MgeW91IG1lYW4gc2NoZWRfcmVzb3VyY2UuCj4gCj4gTm90IHN1cmUgLSB3
aXRoIHNjaGVkdWxpbmcgYWN0aW5nIG9uIHVuaXRzLCBpdCB3b3VsZCBzZWVtIHRvIG1lIHRoYXQK
PiBwYXNzaW5nIGFyb3VuZCB0aGUgdW5pdCBwb2ludGVycyB3b3VsZCBiZSB0aGUgbW9zdCBhcHBy
b3ByaWF0ZSB0aGluZy4KCkkgZ3Vlc3MgdGhlcmUgaXMgYSByZWFzb24gd2h5IGNzY2hlZF9sb2Fk
X2JhbGFuY2UoKSB0YWtlcyBjcHUgYW5kIG5vdAphIHZjcHUgcG9pbnRlciBhcyBwYXJhbWV0ZXIg
dG9kYXkuIENoYW5naW5nIHRoYXQgbWlnaHQgYmUgcG9zc2libGUsIGJ1dApJIGRvbid0IHRoaW5r
IGl0IHNob3VsZCBiZSBwYXJ0IG9mIHRoaXMgcGF0Y2ggc2VyaWVzLgoKCkp1ZXJnZW4KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
