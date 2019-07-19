Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AA9616E0B0
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jul 2019 07:45:19 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hoLeM-0006xT-35; Fri, 19 Jul 2019 05:41:46 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=M1ZL=VQ=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hoLeK-0006xO-4a
 for xen-devel@lists.xenproject.org; Fri, 19 Jul 2019 05:41:44 +0000
X-Inumbo-ID: e198d402-a9e7-11e9-b990-eb00c7bd1cc7
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e198d402-a9e7-11e9-b990-eb00c7bd1cc7;
 Fri, 19 Jul 2019 05:41:40 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 485FDAF94;
 Fri, 19 Jul 2019 05:41:39 +0000 (UTC)
To: Sergey Dyasli <sergey.dyasli@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20190528103313.1343-1-jgross@suse.com>
 <f2f3f5f2-8b9c-ac9c-00e8-1e601ec71070@citrix.com>
 <3cb1c2b777e623a55bf87dc12a155734667ab23e.camel@suse.com>
 <c8f4c719-ce7c-9ca0-7d5b-c34db3f21e38@citrix.com>
 <a57d18f4-e947-5c3e-3d8d-6e1371f0c9af@suse.com>
 <864742f0-9b84-e8fe-75be-fa94e217383f@citrix.com>
From: Juergen Gross <jgross@suse.com>
Message-ID: <0e35dc11-5dac-4b24-942c-a8d365a8b193@suse.com>
Date: Fri, 19 Jul 2019 07:41:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <864742f0-9b84-e8fe-75be-fa94e217383f@citrix.com>
Content-Language: de-DE
Subject: Re: [Xen-devel] [PATCH 00/60] xen: add core scheduling support
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
 RobertVanVossen <robert.vanvossen@dornerworks.com>,
 Dario Faggioli <dfaggioli@suse.com>, Julien Grall <julien.grall@arm.com>,
 Josh Whitehead <josh.whitehead@dornerworks.com>,
 Meng Xu <mengxu@cis.upenn.edu>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTguMDcuMTkgMTc6MTQsIFNlcmdleSBEeWFzbGkgd3JvdGU6Cj4gT24gMTgvMDcvMjAxOSAx
NTo0OCwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPj4gT24gMTUuMDcuMTkgMTY6MDgsIFNlcmdleSBE
eWFzbGkgd3JvdGU6Cj4+PiBPbiAwNS8wNy8yMDE5IDE0OjU2LCBEYXJpbyBGYWdnaW9saSB3cm90
ZToKPj4+PiBPbiBGcmksIDIwMTktMDctMDUgYXQgMTQ6MTcgKzAxMDAsIFNlcmdleSBEeWFzbGkg
d3JvdGU6Cj4+Pj4+IDEpIFRoaXMgY3Jhc2ggaXMgcXVpdGUgbGlrZWx5IHRvIGhhcHBlbjoKPj4+
Pj4KPj4+Pj4gWzIwMTktMDctMDQgMTg6MjI6NDYgVVRDXSAoWEVOKSBbIDM0MjUuMjIwNjYwXSBX
YXRjaGRvZyB0aW1lciBkZXRlY3RzCj4+Pj4+IHRoYXQgQ1BVMiBpcyBzdHVjayEKPj4+Pj4gWzIw
MTktMDctMDQgMTg6MjI6NDYgVVRDXSAoWEVOKSBbIDM0MjUuMjI2MjkzXSAtLS0tWyBYZW4tNC4x
My4wLQo+Pj4+PiA4LjAuNi1kwqAgeDg2XzY0wqAgZGVidWc9ecKgwqAgTm90IHRhaW50ZWQgXS0t
LS0KPj4+Pj4gWy4uLl0KPj4+Pj4gWzIwMTktMDctMDQgMTg6MjI6NDcgVVRDXSAoWEVOKSBbIDM0
MjUuNTAxOTg5XSBYZW4gY2FsbCB0cmFjZToKPj4+Pj4gWzIwMTktMDctMDQgMTg6MjI6NDcgVVRD
XSAoWEVOKSBbCj4+Pj4+IDM0MjUuNTA1Mjc4XcKgwqDCoCBbPGZmZmY4MmQwODAyM2Q1Nzg+XSB2
Y3B1X3NsZWVwX3N5bmMrMHg1MC8weDcxCj4+Pj4+IFsyMDE5LTA3LTA0IDE4OjIyOjQ3IFVUQ10g
KFhFTikgWwo+Pj4+PiAzNDI1LjUxMTUxOF3CoMKgwqAgWzxmZmZmODJkMDgwMjA4MzcwPl0gdmNw
dV9wYXVzZSsweDIxLzB4MjMKPj4+Pj4gWzIwMTktMDctMDQgMTg6MjI6NDcgVVRDXSAoWEVOKSBb
Cj4+Pj4+IDM0MjUuNTE3MzI2XcKgwqDCoCBbPGZmZmY4MmQwODAyM2UyNWQ+XQo+Pj4+PiB2Y3B1
X3NldF9wZXJpb2RpY190aW1lcisweDI3LzB4NzMKPj4+Pj4gWzIwMTktMDctMDQgMTg6MjI6NDcg
VVRDXSAoWEVOKSBbCj4+Pj4+IDM0MjUuNTI0MjU4XcKgwqDCoCBbPGZmZmY4MmQwODAyMDk2ODI+
XSBkb192Y3B1X29wKzB4MmM5LzB4NjY4Cj4+Pj4+IFsyMDE5LTA3LTA0IDE4OjIyOjQ3IFVUQ10g
KFhFTikgWwo+Pj4+PiAzNDI1LjUzMDIzOF3CoMKgwqAgWzxmZmZmODJkMDgwMjRmOTcwPl0gY29t
cGF0X3ZjcHVfb3ArMHgyNTAvMHgzOTAKPj4+Pj4gWzIwMTktMDctMDQgMTg6MjI6NDcgVVRDXSAo
WEVOKSBbCj4+Pj4+IDM0MjUuNTM2NTY2XcKgwqDCoCBbPGZmZmY4MmQwODAzODM5NjQ+XSBwdl9o
eXBlcmNhbGwrMHgzNjQvMHg1NjQKPj4+Pj4gWzIwMTktMDctMDQgMTg6MjI6NDcgVVRDXSAoWEVO
KSBbCj4+Pj4+IDM0MjUuNTQyNzE5XcKgwqDCoCBbPGZmZmY4MmQwODAzODU2NDQ+XSBkb19lbnRy
eV9pbnQ4MisweDI2LzB4MmQKPj4+Pj4gWzIwMTktMDctMDQgMTg6MjI6NDcgVVRDXSAoWEVOKSBb
Cj4+Pj4+IDM0MjUuNTQ4ODc2XcKgwqDCoCBbPGZmZmY4MmQwODAzODgzOWI+XSBlbnRyeV9pbnQ4
MisweGJiLzB4YzAKPj4+Pj4KPj4+PiBNbW0uLi4gdmNwdV9zZXRfcGVyaW9kaWNfdGltZXI/Cj4+
Pj4KPj4+PiBXaGF0IGtlcm5lbCBpcyB0aGlzIGFuZCB3aGVuIGRvZXMgdGhpcyBjcmFzaCBoYXBw
ZW4/Cj4+Pgo+Pj4gSGkgRGFyaW8sCj4+Pgo+Pj4gSSBjYW4gZWFzaWx5IHJlcHJvZHVjZSB0aGlz
IGNyYXNoIHVzaW5nIGEgRGViaWFuIDcgUFYgVk0gKDIgdkNQVXMsIDJHQiBSQU0pCj4+PiB3aGlj
aCBoYXMgdGhlIGZvbGxvd2luZyBrZXJuZWw6Cj4+Pgo+Pj4gIyB1bmFtZSAtYQo+Pj4KPj4+IExp
bnV4IGxvY2FsaG9zdCAzLjIuMC00LWFtZDY0ICMxIFNNUCBEZWJpYW4gMy4yLjc4LTEgeDg2XzY0
IEdOVS9MaW51eAo+Pj4KPj4+IEFsbCBJIG5lZWQgdG8gZG8gaXMgc3VzcGVuZCBhbmQgcmVzdW1l
IHRoZSBWTS4KPj4KPj4gSGFwcGVucyB3aXRoIGEgbW9yZSByZWNlbnQga2VybmVsLCB0b28uCj4+
Cj4+IEkgY2FuIGVhc2lseSByZXByb2R1Y2UgdGhlIGlzc3VlIHdpdGggYW55IFBWIGd1ZXN0IHdp
dGggbW9yZSB0aGFuIDEgdmNwdQo+PiBieSBkb2luZyAieGwgc2F2ZSIgYW5kIHRoZW4gInhsIHJl
c3RvcmUiIGFnYWluLgo+Pgo+PiBXaXRoIHRoZSByZXByb2R1Y2VyIGJlaW5nIGF2YWlsYWJsZSBJ
J20gbm93IGRpdmluZyBpbnRvIHRoZSBpc3N1ZS4uLgo+IAo+IE9uZSBmdXJ0aGVyIHRoaW5nIHRv
IGFkZCBpcyB0aGF0IEkgd2FzIGFibGUgdG8gYXZvaWQgdGhlIGNyYXNoIGJ5IHJldmVydGluZwo+
IAo+IAl4ZW4vc2NoZWQ6IHJld29yayBhbmQgcmVuYW1lIHZjcHVfZm9yY2VfcmVzY2hlZHVsZSgp
Cj4gCj4gd2hpY2ggaXMgYSBwYXJ0IG9mIHRoZSBzZXJpZXMuIFRoaXMgbWFkZSBhbGwgdGVzdHMg
d2l0aCBQViBndWVzdHMgcGFzcy4KClllYWgsIGJ1dCByZW1vdmluZyB0aGlzIHBhdGNoIGlzIGp1
c3QgcGFwZXJpbmcgb3ZlciBhIGdlbmVyYWwgaXNzdWUuClRoZSBtYWluIHByb2JsZW0gc2VlbXMg
dG8gYmUgYSB2Y3B1IHRyeWluZyB0byBwYXVzZSBhbm90aGVyIHZjcHUgb2YgdGhlCnNhbWUgc2No
ZWRfdW5pdC4gSSBhbHJlYWR5IGhhdmUgYW4gaWRlYSB3aGF0IGlzIHJlYWxseSBoYXBwZW5pbmcs
IEkganVzdApuZWVkIHRvIHZlcmlmeSBpdC4KCj4gQW5vdGhlciBxdWVzdGlvbiBJIGhhdmUgaXMg
ZG8geW91IGhhdmUgYSBnaXQgYnJhbmNoIHdpdGggY29yZS1zY2hlZHVsaW5nCj4gcGF0Y2hlcyBy
ZWJhc2VkIG9uIHRvcCBvZiBjdXJyZW50IHN0YWdpbmcgYXZhaWxhYmxlIHNvbWV3aGVyZT8KCk9u
bHkgdGhlIG9uZSBEYXJpbyBhbHJlYWR5IG1lbnRpb25lZC4KCgpKdWVyZ2VuCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
