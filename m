Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EA37EB395
	for <lists+xen-devel@lfdr.de>; Thu, 31 Oct 2019 16:12:37 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iQC4t-0006Rn-Sx; Thu, 31 Oct 2019 15:09:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=msrb=YY=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1iQC4s-0006Rd-DS
 for xen-devel@lists.xenproject.org; Thu, 31 Oct 2019 15:09:34 +0000
X-Inumbo-ID: 71c867ae-fbf0-11e9-8aca-bc764e2007e4
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 71c867ae-fbf0-11e9-8aca-bc764e2007e4;
 Thu, 31 Oct 2019 15:09:33 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 887511F1;
 Thu, 31 Oct 2019 08:09:32 -0700 (PDT)
Received: from e108454-lin.cambridge.arm.com (unknown [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C83133F71E;
 Thu, 31 Oct 2019 08:09:30 -0700 (PDT)
From: Julien Grall <julien.grall@arm.com>
To: xen-devel@lists.xenproject.org
Date: Thu, 31 Oct 2019 15:09:03 +0000
Message-Id: <20191031150922.22938-1-julien.grall@arm.com>
X-Mailer: git-send-email 2.11.0
Subject: [Xen-devel] [PATCH for-4.13 v4 00/19] xen/arm: XSA-201 and XSA-263
 fixes
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
Cc: jgross@suse.com, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>,
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgYWxsLAoKVGhpcyBpcyB2NCBvZiB0aGUgc2VyaWVzLiBGb3IgdGhvc2Ugd29uZGVyaW5nIHdo
eSBpdCBpcyB2NCBhbmQgbm90IHYyLCB0aGlzCnNlcmllcyBpcyBjbG9zZWx5IHJlbGF0ZWQgdG8g
WFNBLTMwMyBbMV0gYW5kIHJlZnJhaW5lZCB0byBwb3N0IGEgbmV3IHZlcnNpb24KcHVibGljbHku
IFRvIGF2b2lkIGRlbGF5aW5nIHRoZSBzZXJpZXMgd2FzIHJldmlld2VkIHByaXZhdGVseSBvbiBz
ZWN1cml0eUAuCgpUaGUgc2VyaWVzIGlzIG5vdyBuZWFybHkgZnVsbHkgcmV2aWV3ZWQuIFRoZXJl
IGFyZSBqdXN0IGEgZmV3IG1pc3NpbmcgdGFncwpmb3IgcGF0Y2ggIzExLCAjMTIgYW5kICMxOS4K
ClRoZSBzZXJpZXMgaXMgYmFzZWQgb24gWFNBLTMwMyB3aGljaCBoYXMgbm90IHlldCBiZWVuIGNv
bW1pdHRlZC4gRm9yCmNvbnZlbmllbmNlLCBJIGhhdmUgcHVzaGVkIGEgYnJhbmNoIG9uIG15IHB1
YmxpYyBnaXQ6CgpodHRwczovL3hlbmJpdHMueGVuLm9yZy9naXQtaHR0cC9wZW9wbGUvanVsaWVu
Zy94ZW4tdW5zdGFibGUuZ2l0CmJyYW5jaCBlbnRyeS1yZXdvcmsvdjQKCkBKdWVyZ2VuOiBPbiB2
MSwgeW91IGFncmVlZCB0aGlzIHNob3VsZCBiZSBjb25zaWRlcmVkIGFzIGEgYmxvY2tlciBmb3Ig
WGVuIDQuMTMuCkFyZSB5b3Ugc3RpbGwgaGFwcHkgdG8gY29uc2lkZXIgdGhpcyBzZXJpZXMgdG8g
Z28gaW4gWGVuIDQuMTM/VGhpcyBpcyBtb3N0bHkKZml4aW5nIHVwIHRoZSBub24tWFNBIHBhcnQg
b2YgWFNBLTMwMy4gVGhpcyBzaG91bGQgYWxsb3cgdG8gaGFuZGxlIHByb3Blcmx5ClNTQkQgd29y
a2Fyb3VuZCBhbmQgcmVjZWl2ZSBzYWZlbHkgU0Vycm9ycy4KCkNoZWVycywKClsxXSBodHRwczov
L3hlbmJpdHMueGVuLm9yZy94c2EvYWR2aXNvcnktMzAzLmh0bWwKCkNjOiBqZ3Jvc3NAc3VzZS5j
b20KCkp1bGllbiBHcmFsbCAoMTgpOgogIGRvY3MvbWlzYzogeGVuLWNvbW1hbmQtbGluZTogUmVt
b3ZlIHdyb25nIHN0YXRlbWVudCBmcm9tCiAgICBzZXJyb3JzPWRpdmVyc2UKICB4ZW4vYXJtOiBS
ZW1vdmUgc2Vycm9ycz1mb3J3YXJkCiAgeGVuL2FybTogdHJhcHM6IFJld29yayBfX2RvX3NlcnJv
cigpIGRvY3VtZW50YXRpb24KICBkb2NzL21pc2M6IHhlbi1jb21tYW5kLWxpbmU6IFJld29yayBk
b2N1bWVudGF0aW9uIG9mIHRoZSBvcHRpb24KICAgICdzZXJyb3JzJwogIHhlbi9hcm06IHRyYXBz
OiBVcGRhdGUgdGhlIGNvcnJlY3QgUEMgd2hlbiBpbmplY3QgYSB2aXJ0dWFsIFNFcnJvciB0bwog
ICAgdGhlIGd1ZXN0CiAgeGVuL2FybTY0OiBlbnRyeTogQXZvaWQgb3Blbi1jb2RpbmcgaW50ZXJy
dXB0IGZsYWdzCiAgeGVuL2FybTY0OiBlbnRyeTogSW50cm9kdWNlIGEgbWFjcm8gdG8gZ2VuZXJh
dGUgZ3Vlc3QgdmVjdG9yIGFuZCB1c2UKICAgIGl0CiAgeGVuL2FybTY0OiBlbnRyeTogQ2hlY2sg
aWYgYW4gU0Vycm9yIGlzIHBlbmRpbmcgd2hlbiByZWNlaXZpbmcgYQogICAgdlNFcnJvcgogIHhl
bi9hcm06IHRyYXBzOiBSZXdvcmsgZW50cnkvZXhpdCBmcm9tIHRoZSBndWVzdCBwYXRoCiAgeGVu
L2FybTMyOiBlbnRyeTogUmVuYW1lIHNhdmVfZ3Vlc3RfcmVncygpCiAgeGVuL2FybTogRW5zdXJl
IHRoZSBTU0JEIHdvcmthcm91bmQgaXMgcmUtZW5hYmxlZCByaWdodCBhZnRlciBleGl0aW5nCiAg
ICBhIGd1ZXN0CiAgeGVuL2FybTogdHJhcHM6IERvbid0IGlnbm9yZSBpbnZhbGlkIHZhbHVlIGZv
ciBzZXJyb3JzPQogIHhlbi9hcm06IGFsdGVybmF0aXZlOiBSZW1vdmUgdW51c2VkIHBhcmFtZXRl
ciBmb3IKICAgIGFsdGVybmF0aXZlX2lmX25vdF9jYXAKICB4ZW4vYXJtOiBNb3ZlIEFSQ0hfUEFU
Q0hfSU5TTl9TSVpFIG91dCBvZiB0aGUgaGVhZGVyIGxpdmVwYXRjaC5oCiAgeGVuL2FybTogQWxs
b3cgaW5zbi5oIHRvIGJlIGNhbGxlZCBmcm9tIGFzc2VtYmx5CiAgeGVuL2FybTogYXNtOiBSZXBs
YWNlIHVzZSBvZiBBTFRFUk5BVElWRSB3aXRoIGFsdGVybmF0aXZlX2lmCiAgeGVuL2FybTogVXBk
YXRlIHRoZSBBU1NFUlQoKSBpbiBTWU5DSFJPTklaRV9TRVJST1IoKQogIHhlbi9hcm06IGVudHJ5
OiBFbnN1cmUgdGhlIGd1ZXN0IHN0YXRlIGlzIHN5bmNlZCB3aGVuIHJlY2VpdmluZyBhCiAgICB2
U0Vycm9yCgpNYXJrIFJ1dGxhbmQgKDEpOgogIHhlbi9hcm06IGFsdGVybmF0aXZlOiBhZGQgYXV0
by1ub3AgaW5mcmFzdHJ1Y3R1cmUKCiBkb2NzL21pc2MveGVuLWNvbW1hbmQtbGluZS5wYW5kb2Mg
fCAgNDUgKysrLS0tLS0tLQogeGVuL2FyY2gvYXJtL2FsdGVybmF0aXZlLmMgICAgICAgIHwgICAy
IC0KIHhlbi9hcmNoL2FybS9hcm0zMi9lbnRyeS5TICAgICAgICB8ICA4MCArKysrKysrKysrKysr
Ky0tLS0KIHhlbi9hcmNoL2FybS9hcm0zMi90cmFwcy5jICAgICAgICB8ICAxMiArLS0KIHhlbi9h
cmNoL2FybS9hcm02NC9lbnRyeS5TICAgICAgICB8IDE3MCArKysrKysrKysrKysrKysrKysrKyst
LS0tLS0tLS0tLS0tLS0tLQogeGVuL2FyY2gvYXJtL2RvbWFpbi5jICAgICAgICAgICAgIHwgIDEx
IC0tLQogeGVuL2FyY2gvYXJtL3RyYXBzLmMgICAgICAgICAgICAgIHwgMTY2ICsrKysrKysrKysr
KysrKysrLS0tLS0tLS0tLS0tLS0tLS0tLS0KIHhlbi9pbmNsdWRlL2FzbS1hcm0vYWx0ZXJuYXRp
dmUuaCB8ICA3NSArKysrKysrKysrKystLS0tLQogeGVuL2luY2x1ZGUvYXNtLWFybS9jcHVmZWF0
dXJlLmggIHwgIDExICsrLQogeGVuL2luY2x1ZGUvYXNtLWFybS9pbnNuLmggICAgICAgIHwgICA3
ICsrCiB4ZW4vaW5jbHVkZS9hc20tYXJtL2xpdmVwYXRjaC5oICAgfCAgIDQgKy0KIHhlbi9pbmNs
dWRlL2FzbS1hcm0vbWFjcm9zLmggICAgICB8ICAgNyArKwogeGVuL2luY2x1ZGUvYXNtLWFybS9w
cm9jZXNzb3IuaCAgIHwgICAyICstCiAxMyBmaWxlcyBjaGFuZ2VkLCAzMjMgaW5zZXJ0aW9ucygr
KSwgMjY5IGRlbGV0aW9ucygtKQoKLS0gCjIuMTEuMAoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
