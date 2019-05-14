Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 986461C87A
	for <lists+xen-devel@lfdr.de>; Tue, 14 May 2019 14:24:15 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hQWRG-00086Q-Ns; Tue, 14 May 2019 12:21:46 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=zxYt=TO=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hQWRF-00086G-1M
 for xen-devel@lists.xenproject.org; Tue, 14 May 2019 12:21:45 +0000
X-Inumbo-ID: d5bfb571-7642-11e9-8980-bc764e045a96
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id d5bfb571-7642-11e9-8980-bc764e045a96;
 Tue, 14 May 2019 12:21:43 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8C7DA341;
 Tue, 14 May 2019 05:21:43 -0700 (PDT)
Received: from e108454-lin.cambridge.arm.com (e108454-lin.cambridge.arm.com
 [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 772ED3F71E;
 Tue, 14 May 2019 05:21:41 -0700 (PDT)
From: Julien Grall <julien.grall@arm.com>
To: xen-devel@lists.xenproject.org
Date: Tue, 14 May 2019 13:21:09 +0100
Message-Id: <20190514122136.28215-1-julien.grall@arm.com>
X-Mailer: git-send-email 2.11.0
Subject: [Xen-devel] [PATCH MM-PART2 v2 00/19] xen/arm: Clean-up & fixes in
 boot/mm code
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
 Oleksandr_Tyshchenko@epam.com, Julien Grall <julien.grall@arm.com>,
 Jan Beulich <jbeulich@suse.com>, Wei Liu <wei.liu2@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgYWxsLAoKVGhpcyBpcyB0aGUgc2Vjb25kIHBhcnQgb2YgdGhlIGJvb3QvbWVtb3J5IHJld29y
ayBmb3IgWGVuIG9uIEFybS4gVGhpcwpwYXJ0IGNvbnRhaW5zIG1vc3RseSBjbGVhbi11cCAmIGZp
eGVzIGZvdW5kIGR1cmluZyB0aGUgcmV3b3JrLgoKVGhlIGZpcnN0IHBhcnQgb2YgdGhlIHJld29y
ayBpcyAieGVuL2FybTogVExCIGZsdXNoIGhlbHBlcnMgcmV3b3JrIiBbMV0uCgpGb3IgY29udmVu
aWVuY2UsIEkgcHJvdmlkZWQgYSBicmFuY2ggd2l0aCBhbGwgdGhlIHBhdGNoZXMgYXBwbGllZCBi
YXNlZApvbiBzdGFnaW5nOgoKICAgIGdpdDovL3hlbmJpdHMueGVuLm9yZy9wZW9wbGUvanVsaWVu
Zy94ZW4tdW5zdGFibGUuZ2l0IGJyYW5jaCBtbS9wYXJ0Mi92MgoKQ2hlZXJzLAoKWzFdIGh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvYXJjaGl2ZXMvaHRtbC94ZW4tZGV2ZWwvMjAxOS0wNS9t
c2cwMTEwOS5odG1sCgpKdWxpZW4gR3JhbGwgKDE5KToKICB4ZW4vY29uc3Q6IEV4dGVuZCB0aGUg
ZXhpc3RpbmcgbWFjcm8gQklUIHRvIHRha2UgYSBzdWZmaXggaW4gcGFyYW1ldGVyCiAgeGVuL2Fy
bTogUmVuYW1lIFNDVExSXyogZGVmaW5lcyBhbmQgcmVtb3ZlIHVudXNlZCBvbmUKICB4ZW4vYXJt
OiBwcm9jZXNzb3I6IFVzZSBCSVQoLi4sIFVMKSBpbnN0ZWFkIG9mIF9BQygxLCBVKSBpbiBTQ1RM
Ul8KICAgIGRlZmluZXMKICB4ZW4vYXJtOiBSZXdvcmsgSFNDVExSX0JBU0UKICB4ZW4vYXJtOiBS
ZW1vdmUgcGFyYW1ldGVyIGNwdWlkIGZyb20gc3RhcnRfeGVuCiAgeGVuL2FybTogUmV3b3JrIHNl
Y29uZGFyeV9zdGFydCBwcm90b3R5cGUKICB4ZW4vYXJtNjQ6IGhlYWQ6IFJlbW92ZSB1bm5lY2Vz
c2FyeSBjb21tZW50CiAgeGVuL2FybTY0OiBoZWFkOiBNb3ZlIGVhcmx5cHJpbnRrIG1lc3NhZ2Vz
IGluIC5yb2RhdGEuc3RyCiAgeGVuL2FybTY0OiBoZWFkOiBDb3JyZWN0bHkgcmVwb3J0IHRoZSBI
VyBDUFUgSUQKICB4ZW4vYXJtMzI6IGhlYWQ6IENvcnJlY3RseSByZXBvcnQgdGhlIEhXIENQVSBJ
RAogIHhlbi9hcm0zMjogaGVhZDogRG9uJ3Qgc2V0IE1BSVIwIGFuZCBNQUlSMQogIHhlbi9hcm0z
MjogaGVhZDogQWx3YXlzIHplcm8gcjMgYmVmb3JlIHVwZGF0ZSBhIHBhZ2UtdGFibGUgZW50cnkK
ICB4ZW4vYXJtMzI6IG1tOiBBdm9pZCB0byB6ZXJvIGFuZCBjbGVhbiBjYWNoZSBmb3IgQ1BVMCBk
b21oZWFwCiAgeGVuL2FybTMyOiBtbTogQXZvaWQgY2xlYW5pbmcgdGhlIGNhY2hlIGZvciBzZWNv
bmRhcnkgQ1BVcyBwYWdlLXRhYmxlcwogIHhlbi9hcm06IG1tOiBJbnRyb2R1Y2UgREVGSU5FX1BB
R0VfVEFCTEV7LFN9IGFuZCB1c2UgaXQKICB4ZW4vYXJtOiBtbTogUHJvdGVjdCBYZW4gcGFnZS10
YWJsZSB1cGRhdGUgd2l0aCBhIHNwaW5sb2NrCiAgeGVuL2FybTogbW06IEluaXRpYWxpemUgcGFn
ZS10YWJsZXMgZWFybGllcgogIHhlbi9hcm06IG1tOiBDaGVjayBzdGFydCBpcyBhbHdheXMgYmVm
b3JlIGVuZCBpbiB7ZGVzdHJveSwKICAgIG1vZGlmeX1feGVuX21hcHBpbmdzCiAgeGVuL2FybTog
UGFpciBjYWxsIHRvIHNldF9maXhtYXAgd2l0aCBjYWxsIHRvIGNsZWFyX2ZpeG1hcCBpbgogICAg
Y29weV9mcm9tX3BhZGRyCgogeGVuL2FyY2gvYXJtL2FybTMyL2hlYWQuUyAgICAgICAgIHwgMzQg
KysrKy0tLS0tLS0tLS0KIHhlbi9hcmNoL2FybS9hcm0zMi9pbnNuLmMgICAgICAgICB8ICAyICst
CiB4ZW4vYXJjaC9hcm0vYXJtNjQvaGVhZC5TICAgICAgICAgfCA0MCArKysrKy0tLS0tLS0tLS0t
LQogeGVuL2FyY2gvYXJtL2FybTY0L2luc24uYyAgICAgICAgIHwgMTggKysrKy0tLS0KIHhlbi9h
cmNoL2FybS9naWMtdjMtaXRzLmMgICAgICAgICB8IDEzICsrKy0tLQogeGVuL2FyY2gvYXJtL2dp
Yy12My1scGkuYyAgICAgICAgIHwgIDQgKy0KIHhlbi9hcmNoL2FybS9ndWVzdF93YWxrLmMgICAg
ICAgICB8IDEwICsrLS0tCiB4ZW4vYXJjaC9hcm0va2VybmVsLmMgICAgICAgICAgICAgfCAgMyAr
LQogeGVuL2FyY2gvYXJtL21tLmMgICAgICAgICAgICAgICAgIHwgNjIgKysrKysrKysrKysrKy0t
LS0tLS0tLS0tLS0KIHhlbi9hcmNoL2FybS9zZXR1cC5jICAgICAgICAgICAgICB8ICA3ICsrLQog
eGVuL2FyY2gvYXJtL3NtcGJvb3QuYyAgICAgICAgICAgIHwgIDQgKy0KIHhlbi9hcmNoL2FybS90
cmFwcy5jICAgICAgICAgICAgICB8ICA2ICstLQogeGVuL2FyY2gvYXJtL3ZnaWMtdjMtaXRzLmMg
ICAgICAgIHwgMTIgKystLS0KIHhlbi9hcmNoL2FybS92Z2ljLXYzLmMgICAgICAgICAgICB8ICAy
ICstCiB4ZW4vYXJjaC9hcm0vdmdpYy5jICAgICAgICAgICAgICAgfCAgMiArLQogeGVuL2RyaXZl
cnMvY2hhci9tZXNvbi11YXJ0LmMgICAgIHwgMTYgKysrLS0tLQogeGVuL2RyaXZlcnMvY2hhci9t
dmVidS11YXJ0LmMgICAgIHwgMzQgKysrKysrKy0tLS0tLS0KIHhlbi9pbmNsdWRlL2FzbS1hcm0v
YXNtX2RlZm5zLmggICB8ICA1ICsrKwogeGVuL2luY2x1ZGUvYXNtLWFybS9iaXRvcHMuaCAgICAg
IHwgIDIgLQogeGVuL2luY2x1ZGUvYXNtLWFybS9naWNfdjNfZGVmcy5oIHwgIDQgKy0KIHhlbi9p
bmNsdWRlL2FzbS1hcm0vZ2ljX3YzX2l0cy5oICB8IDEwICsrLS0tCiB4ZW4vaW5jbHVkZS9hc20t
YXJtL3AybS5oICAgICAgICAgfCAgNCArLQogeGVuL2luY2x1ZGUvYXNtLWFybS9wcm9jZXNzb3Iu
aCAgIHwgOTMgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tCiB4ZW4vaW5j
bHVkZS94ZW4vY29uc3QuaCAgICAgICAgICAgfCAgMiArCiAyNCBmaWxlcyBjaGFuZ2VkLCAyMDEg
aW5zZXJ0aW9ucygrKSwgMTg4IGRlbGV0aW9ucygtKQoKLS0gCjIuMTEuMAoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
