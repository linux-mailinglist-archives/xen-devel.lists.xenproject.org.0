Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1915FB4B11
	for <lists+xen-devel@lfdr.de>; Tue, 17 Sep 2019 11:43:05 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iA9xu-0004EA-Nh; Tue, 17 Sep 2019 09:40:06 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=DkBD=XM=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1iA9xt-00044p-5m
 for xen-devel@lists.xenproject.org; Tue, 17 Sep 2019 09:40:05 +0000
X-Inumbo-ID: 1fa2fd42-d92f-11e9-9605-12813bfff9fa
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 1fa2fd42-d92f-11e9-9605-12813bfff9fa;
 Tue, 17 Sep 2019 09:40:02 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A720328;
 Tue, 17 Sep 2019 02:40:02 -0700 (PDT)
Received: from [10.37.13.58] (unknown [10.37.13.58])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2E9603F59C;
 Tue, 17 Sep 2019 02:39:59 -0700 (PDT)
To: Paul Durrant <paul.durrant@citrix.com>, xen-devel@lists.xenproject.org
References: <20190913105826.2704-1-paul.durrant@citrix.com>
 <20190913105826.2704-5-paul.durrant@citrix.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <47f5df8e-6eea-8ee2-9c1c-f27a6c1bce03@arm.com>
Date: Tue, 17 Sep 2019 10:39:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190913105826.2704-5-paul.durrant@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v11 4/6] remove late (on-demand)
 construction of IOMMU page tables
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
Cc: Petre Pircalabu <ppircalabu@bitdefender.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Razvan Cojocaru <rcojocaru@bitdefender.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Tamas K Lengyel <tamas@tklengyel.com>, Jan Beulich <jbeulich@suse.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgUGF1bCwKCk9uIDkvMTMvMTkgMTE6NTggQU0sIFBhdWwgRHVycmFudCB3cm90ZToKPiBOb3cg
dGhhdCB0aGVyZSBpcyBhIHBlci1kb21haW4gSU9NTVUtZW5hYmxlIGZsYWcsIHdoaWNoIHNob3Vs
ZCBiZSBzZXQgaWYKPiBhbnkgZGV2aWNlIGlzIGdvaW5nIHRvIGJlIHBhc3NlZCB0aHJvdWdoLCBz
dG9wIGRlZmVycmluZyBwYWdlIHRhYmxlCj4gY29uc3RydWN0aW9uIHVudGlsIHRoZSBhc3NpZ25t
ZW50IGlzIGRvbmUuIEFsc28gZG9uJ3QgdGVhciBkb3duIHRoZSB0YWJsZXMKPiBhZ2FpbiB3aGVu
IHRoZSBsYXN0IGRldmljZSBpcyBkZS1hc3NpZ25lZDsgZGVmZXIgdGhhdCB0YXNrIHVudGlsIGRv
bWFpbgo+IGRlc3RydWN0aW9uLgo+IAo+IFRoaXMgYWxsb3dzIHRoZSBoYXNfaW9tbXVfcHQoKSBo
ZWxwZXIgYW5kIGlvbW11X3N0YXR1cyBlbnVtZXJhdGlvbiB0byBiZQo+IHJlbW92ZWQuIENhbGxz
IHRvIGhhc19pb21tdV9wdCgpIGFyZSBzaW1wbHkgcmVwbGFjZWQgYnkgY2FsbHMgdG8KPiBpc19p
b21tdV9lbmFibGVkKCkuIFJlbWFpbmluZyBvcGVuLWNvZGVkIHRlc3RzIG9mIGlvbW11X2hhcF9w
dF9zaGFyZSBjYW4KPiBhbHNvIGJlIHJlcGxhY2VkIGJ5IGNhbGxzIHRvIGlvbW11X3VzZV9oYXBf
cHQoKS4KPiBUaGUgYXJjaF9pb21tdV9wb3B1bGF0ZV9wYWdlX3RhYmxlKCkgYW5kIGlvbW11X2Nv
bnN0cnVjdCgpIGZ1bmN0aW9ucyBiZWNvbWUKPiByZWR1bmRhbnQsIGFzIGRvZXMgdGhlICdzdHJp
Y3QgbW9kZScgZG9tMCBwYWdlX2xpc3QgbWFwcGluZyBjb2RlIGluCj4gaW9tbXVfaHdkb21faW5p
dCgpLCBhbmQgaW9tbXVfdGVhcmRvd24oKSBjYW4gYmUgbWFkZSBzdGF0aWMgaXMgaXRzIG9ubHkK
PiByZW1haW5pbmcgY2FsbGVyLCBpb21tdV9kb21haW5fZGVzdHJveSgpLCBpcyB3aXRoaW4gdGhl
IHNhbWUgc291cmNlCj4gbW9kdWxlLgo+IAo+IEFsbCBpbiBhbGwsIGFib3V0IDIyMCBsaW5lcyBv
ZiBjb2RlIGFyZSByZW1vdmVkIGZyb20gdGhlIGh5cGVydmlzb3IgKGF0Cj4gdGhlIGV4cGVuc2Ug
b2Ygc29tZSBhZGRpdGlvbnMgaW4gdGhlIHRvb2xzdGFjaykuCj4gCj4gTk9URTogVGhpcyBwYXRj
aCB3aWxsIGNhdXNlIGEgc21hbGwgYW1vdW50IG9mIGV4dHJhIHJlc291cmNlIHRvIGJlIHVzZWQK
PiAgICAgICAgdG8gYWNjb21tb2RhdGUgSU9NTVUgcGFnZSB0YWJsZXMgdGhhdCBtYXkgbmV2ZXIg
YmUgdXNlZCwgc2luY2UgdGhlCj4gICAgICAgIHBlci1kb21haW4gSU9NTVUtZW5hYmxlIGZsYWcg
aXMgY3VycmVudGx5IHNldCB0byB0aGUgdmFsdWUgb2YgdGhlCj4gICAgICAgIGdsb2JhbCBpb21t
dV9lbmFibGUgZmxhZy4gQSBzdWJzZXF1ZW50IHBhdGNoIHdpbGwgYWRkIGFuIG9wdGlvbiB0bwo+
ICAgICAgICB0aGUgdG9vbHN0YWNrIHRvIGFsbG93IGl0IHRvIGJlIHR1cm5lZCBvZmYgaWYgdGhl
cmUgaXMgbm8gaW50ZW50aW9uCj4gICAgICAgIHRvIGFzc2lnbiBwYXNzdGhyb3VnaCBoYXJkd2Fy
ZSB0byB0aGUgZG9tYWluLgo+ICAgICAgICBUbyBhY2NvdW50IGZvciB0aGUgZXh0cmEgcmVzb3Vy
Y2UsICdpb21tdV9tZW1rYicgaGFzIGJlZW4gYWRkZWQgdG8KPiAgICAgICAgZG9tYWluX2J1aWxk
X2luZm8uIFRoaXMgcGF0Y2ggc2V0cyBpdCB0byBhIHZhbHVlIGNhbGN1bGF0ZWQgYmFzZWQKPiAg
ICAgICAgb24gdGhlIGRvbWFpbidzIG1heGltdW0gbWVtb3J5IHdoZW4gdGhlIFAyTSBzaGFyaW5n
IGlzIGVpdGhlciBub3QKPiAgICAgICAgc3VwcG9ydGVkIG9yIGdsb2JhbGx5IGRpc2FibGVkLCBv
ciB6ZXJvIG90aGVyd2lzZS4gSG93ZXZlciwgd2hlbgo+ICAgICAgICB0aGUgdG9vbHN0YWNrIG9w
dGlvbiBtZW50aW9uZWQgYWJvdmUgaXMgYWRkZWQsIGl0IHdpbGwgYWxzbyBiZSB6ZXJvCj4gICAg
ICAgIGlmIHRoZSBwZXItZG9tYWluIElPTU1VLWVuYWJsZSBmbGFnIGlzIHR1cm5lZCBvZmYuCj4g
Cj4gU2lnbmVkLW9mZi1ieTogUGF1bCBEdXJyYW50IDxwYXVsLmR1cnJhbnRAY2l0cml4LmNvbT4K
PiBSZXZpZXdlZC1ieTogQWxleGFuZHJ1IElzYWlsYSA8YWlzYWlsYUBiaXRkZWZlbmRlci5jb20+
Cj4gQWNrZWQtYnk6IFJhenZhbiBDb2pvY2FydSA8cmNvam9jYXJ1QGJpdGRlZmVuZGVyLmNvbT4K
PiBSZXZpZXdlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKRm9yIHRoZSBz
bWFsbCBjaGFuZ2UgaW4gQXJtIGNvZGU6CgpBY2tlZC1ieTogSnVsaWVuIEdyYWxsIDxqdWxpZW4u
Z3JhbGxAYXJtLmNvbT4KCkNoZWVycywKCi0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
