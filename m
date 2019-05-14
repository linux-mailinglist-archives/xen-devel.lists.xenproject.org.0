Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B61021C895
	for <lists+xen-devel@lfdr.de>; Tue, 14 May 2019 14:25:32 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hQWTE-00020M-5f; Tue, 14 May 2019 12:23:48 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=zxYt=TO=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hQWTC-0001zO-O1
 for xen-devel@lists.xenproject.org; Tue, 14 May 2019 12:23:46 +0000
X-Inumbo-ID: 1e56fdf2-7643-11e9-b5b5-7f2d9c7c92d2
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 1e56fdf2-7643-11e9-b5b5-7f2d9c7c92d2;
 Tue, 14 May 2019 12:23:45 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 568B0341;
 Tue, 14 May 2019 05:23:45 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1EB823F71E;
 Tue, 14 May 2019 05:23:42 -0700 (PDT)
To: xen-devel@lists.xenproject.org
References: <20190514122136.28215-1-julien.grall@arm.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <8cce64ec-b56d-0d2b-8e58-d59aab9e0a96@arm.com>
Date: Tue, 14 May 2019 13:23:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190514122136.28215-1-julien.grall@arm.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH MM-PART2 v2 00/19] xen/arm: Clean-up & fixes
 in boot/mm code
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Andrii_Anisov@epam.com,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Oleksandr_Tyshchenko@epam.com, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wei.liu2@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgYWxsLAoKSSBmb3Jnb3QgdG8gcmVtb3ZlIHRoZSBwYXRjaGVzIGZvciBwYXJ0MSBiZWZvcmUg
c2VuZGluZyB0aGUgcGFydDIuIEkgd2lsbCByZXNlbmQgCnRoZSBzZXJpZXMgcHJvcGVybHkuCgpT
b3JyeSBmb3IgdGhlIG5vaXNlLgoKQ2hlZXJzLAoKT24gMTQvMDUvMjAxOSAxMzoyMSwgSnVsaWVu
IEdyYWxsIHdyb3RlOgo+IEhpIGFsbCwKPiAKPiBUaGlzIGlzIHRoZSBzZWNvbmQgcGFydCBvZiB0
aGUgYm9vdC9tZW1vcnkgcmV3b3JrIGZvciBYZW4gb24gQXJtLiBUaGlzCj4gcGFydCBjb250YWlu
cyBtb3N0bHkgY2xlYW4tdXAgJiBmaXhlcyBmb3VuZCBkdXJpbmcgdGhlIHJld29yay4KPiAKPiBU
aGUgZmlyc3QgcGFydCBvZiB0aGUgcmV3b3JrIGlzICJ4ZW4vYXJtOiBUTEIgZmx1c2ggaGVscGVy
cyByZXdvcmsiIFsxXS4KPiAKPiBGb3IgY29udmVuaWVuY2UsIEkgcHJvdmlkZWQgYSBicmFuY2gg
d2l0aCBhbGwgdGhlIHBhdGNoZXMgYXBwbGllZCBiYXNlZAo+IG9uIHN0YWdpbmc6Cj4gCj4gICAg
ICBnaXQ6Ly94ZW5iaXRzLnhlbi5vcmcvcGVvcGxlL2p1bGllbmcveGVuLXVuc3RhYmxlLmdpdCBi
cmFuY2ggbW0vcGFydDIvdjIKPiAKPiBDaGVlcnMsCj4gCj4gWzFdIGh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvYXJjaGl2ZXMvaHRtbC94ZW4tZGV2ZWwvMjAxOS0wNS9tc2cwMTEwOS5odG1s
Cj4gCj4gSnVsaWVuIEdyYWxsICgxOSk6Cj4gICAgeGVuL2NvbnN0OiBFeHRlbmQgdGhlIGV4aXN0
aW5nIG1hY3JvIEJJVCB0byB0YWtlIGEgc3VmZml4IGluIHBhcmFtZXRlcgo+ICAgIHhlbi9hcm06
IFJlbmFtZSBTQ1RMUl8qIGRlZmluZXMgYW5kIHJlbW92ZSB1bnVzZWQgb25lCj4gICAgeGVuL2Fy
bTogcHJvY2Vzc29yOiBVc2UgQklUKC4uLCBVTCkgaW5zdGVhZCBvZiBfQUMoMSwgVSkgaW4gU0NU
TFJfCj4gICAgICBkZWZpbmVzCj4gICAgeGVuL2FybTogUmV3b3JrIEhTQ1RMUl9CQVNFCj4gICAg
eGVuL2FybTogUmVtb3ZlIHBhcmFtZXRlciBjcHVpZCBmcm9tIHN0YXJ0X3hlbgo+ICAgIHhlbi9h
cm06IFJld29yayBzZWNvbmRhcnlfc3RhcnQgcHJvdG90eXBlCj4gICAgeGVuL2FybTY0OiBoZWFk
OiBSZW1vdmUgdW5uZWNlc3NhcnkgY29tbWVudAo+ICAgIHhlbi9hcm02NDogaGVhZDogTW92ZSBl
YXJseXByaW50ayBtZXNzYWdlcyBpbiAucm9kYXRhLnN0cgo+ICAgIHhlbi9hcm02NDogaGVhZDog
Q29ycmVjdGx5IHJlcG9ydCB0aGUgSFcgQ1BVIElECj4gICAgeGVuL2FybTMyOiBoZWFkOiBDb3Jy
ZWN0bHkgcmVwb3J0IHRoZSBIVyBDUFUgSUQKPiAgICB4ZW4vYXJtMzI6IGhlYWQ6IERvbid0IHNl
dCBNQUlSMCBhbmQgTUFJUjEKPiAgICB4ZW4vYXJtMzI6IGhlYWQ6IEFsd2F5cyB6ZXJvIHIzIGJl
Zm9yZSB1cGRhdGUgYSBwYWdlLXRhYmxlIGVudHJ5Cj4gICAgeGVuL2FybTMyOiBtbTogQXZvaWQg
dG8gemVybyBhbmQgY2xlYW4gY2FjaGUgZm9yIENQVTAgZG9taGVhcAo+ICAgIHhlbi9hcm0zMjog
bW06IEF2b2lkIGNsZWFuaW5nIHRoZSBjYWNoZSBmb3Igc2Vjb25kYXJ5IENQVXMgcGFnZS10YWJs
ZXMKPiAgICB4ZW4vYXJtOiBtbTogSW50cm9kdWNlIERFRklORV9QQUdFX1RBQkxFeyxTfSBhbmQg
dXNlIGl0Cj4gICAgeGVuL2FybTogbW06IFByb3RlY3QgWGVuIHBhZ2UtdGFibGUgdXBkYXRlIHdp
dGggYSBzcGlubG9jawo+ICAgIHhlbi9hcm06IG1tOiBJbml0aWFsaXplIHBhZ2UtdGFibGVzIGVh
cmxpZXIKPiAgICB4ZW4vYXJtOiBtbTogQ2hlY2sgc3RhcnQgaXMgYWx3YXlzIGJlZm9yZSBlbmQg
aW4ge2Rlc3Ryb3ksCj4gICAgICBtb2RpZnl9X3hlbl9tYXBwaW5ncwo+ICAgIHhlbi9hcm06IFBh
aXIgY2FsbCB0byBzZXRfZml4bWFwIHdpdGggY2FsbCB0byBjbGVhcl9maXhtYXAgaW4KPiAgICAg
IGNvcHlfZnJvbV9wYWRkcgo+IAo+ICAgeGVuL2FyY2gvYXJtL2FybTMyL2hlYWQuUyAgICAgICAg
IHwgMzQgKysrKy0tLS0tLS0tLS0KPiAgIHhlbi9hcmNoL2FybS9hcm0zMi9pbnNuLmMgICAgICAg
ICB8ICAyICstCj4gICB4ZW4vYXJjaC9hcm0vYXJtNjQvaGVhZC5TICAgICAgICAgfCA0MCArKysr
Ky0tLS0tLS0tLS0tLQo+ICAgeGVuL2FyY2gvYXJtL2FybTY0L2luc24uYyAgICAgICAgIHwgMTgg
KysrKy0tLS0KPiAgIHhlbi9hcmNoL2FybS9naWMtdjMtaXRzLmMgICAgICAgICB8IDEzICsrKy0t
LQo+ICAgeGVuL2FyY2gvYXJtL2dpYy12My1scGkuYyAgICAgICAgIHwgIDQgKy0KPiAgIHhlbi9h
cmNoL2FybS9ndWVzdF93YWxrLmMgICAgICAgICB8IDEwICsrLS0tCj4gICB4ZW4vYXJjaC9hcm0v
a2VybmVsLmMgICAgICAgICAgICAgfCAgMyArLQo+ICAgeGVuL2FyY2gvYXJtL21tLmMgICAgICAg
ICAgICAgICAgIHwgNjIgKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0KPiAgIHhlbi9hcmNoL2Fy
bS9zZXR1cC5jICAgICAgICAgICAgICB8ICA3ICsrLQo+ICAgeGVuL2FyY2gvYXJtL3NtcGJvb3Qu
YyAgICAgICAgICAgIHwgIDQgKy0KPiAgIHhlbi9hcmNoL2FybS90cmFwcy5jICAgICAgICAgICAg
ICB8ICA2ICstLQo+ICAgeGVuL2FyY2gvYXJtL3ZnaWMtdjMtaXRzLmMgICAgICAgIHwgMTIgKyst
LS0KPiAgIHhlbi9hcmNoL2FybS92Z2ljLXYzLmMgICAgICAgICAgICB8ICAyICstCj4gICB4ZW4v
YXJjaC9hcm0vdmdpYy5jICAgICAgICAgICAgICAgfCAgMiArLQo+ICAgeGVuL2RyaXZlcnMvY2hh
ci9tZXNvbi11YXJ0LmMgICAgIHwgMTYgKysrLS0tLQo+ICAgeGVuL2RyaXZlcnMvY2hhci9tdmVi
dS11YXJ0LmMgICAgIHwgMzQgKysrKysrKy0tLS0tLS0KPiAgIHhlbi9pbmNsdWRlL2FzbS1hcm0v
YXNtX2RlZm5zLmggICB8ICA1ICsrKwo+ICAgeGVuL2luY2x1ZGUvYXNtLWFybS9iaXRvcHMuaCAg
ICAgIHwgIDIgLQo+ICAgeGVuL2luY2x1ZGUvYXNtLWFybS9naWNfdjNfZGVmcy5oIHwgIDQgKy0K
PiAgIHhlbi9pbmNsdWRlL2FzbS1hcm0vZ2ljX3YzX2l0cy5oICB8IDEwICsrLS0tCj4gICB4ZW4v
aW5jbHVkZS9hc20tYXJtL3AybS5oICAgICAgICAgfCAgNCArLQo+ICAgeGVuL2luY2x1ZGUvYXNt
LWFybS9wcm9jZXNzb3IuaCAgIHwgOTMgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrLS0t
LS0tLS0tCj4gICB4ZW4vaW5jbHVkZS94ZW4vY29uc3QuaCAgICAgICAgICAgfCAgMiArCj4gICAy
NCBmaWxlcyBjaGFuZ2VkLCAyMDEgaW5zZXJ0aW9ucygrKSwgMTg4IGRlbGV0aW9ucygtKQo+IAoK
LS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
