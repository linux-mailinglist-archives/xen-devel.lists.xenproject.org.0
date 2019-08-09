Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 59C7D879A6
	for <lists+xen-devel@lfdr.de>; Fri,  9 Aug 2019 14:18:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hw3nL-0001iq-10; Fri, 09 Aug 2019 12:14:55 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=5OiB=WF=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hw3nJ-0001ii-Nt
 for xen-devel@lists.xenproject.org; Fri, 09 Aug 2019 12:14:53 +0000
X-Inumbo-ID: 494a55cc-ba9f-11e9-ad35-7fd1043a7b75
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 494a55cc-ba9f-11e9-ad35-7fd1043a7b75;
 Fri, 09 Aug 2019 12:14:50 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 006491596;
 Fri,  9 Aug 2019 05:14:50 -0700 (PDT)
Received: from e108454-lin.cambridge.arm.com (e108454-lin.cambridge.arm.com
 [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4DA043F706;
 Fri,  9 Aug 2019 05:14:48 -0700 (PDT)
From: Julien Grall <julien.grall@arm.com>
To: xen-devel@lists.xenproject.org
Date: Fri,  9 Aug 2019 13:14:40 +0100
Message-Id: <20190809121440.5668-1-julien.grall@arm.com>
X-Mailer: git-send-email 2.11.0
Subject: [Xen-devel] [PATCH] xen/page_alloc: Keep away MFN 0 from the buddy
 allocator
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 Jeff Kubascik <jeff.kubascik@dornerworks.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>,
 Stewart.Hildebrand@dornerworks.com, Jarvis.Roach@dornerworks.com
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Q29tYmluaW5nIG9mIGJ1ZGRpZXMgaGFwcGVucyBvbmx5IHN1Y2ggdGhhdCB0aGUgcmVzdWx0aW5n
IGxhcmdlciBidWRkeQppcyBzdGlsbCBvcmRlci1hbGlnbmVkLiBUbyBjcm9zcyBhIHpvbmUgYm91
bmRhcnkgd2hpbGUgbWVyZ2luZywgdGhlCmltcGxpY2F0aW9uIGlzIHRoYXQgYm90aCB0aGUgYnVk
ZHkgWzAsIDJebi0xXSBhbmQgdGhlIGJ1ZGR5ClsyXm4sIDJeKG4rMSldIGFyZSBmcmVlLgoKSWRl
YWxseSB3ZSB3YW50IHRvIGZpeCB0aGUgYWxsb2NhdG9yLCBidXQgZm9yIG5vdyB3ZSBjYW4ganVz
dCBwcmV2ZW50CmFkZGluZyB0aGUgTUZOIDAgaW4gdGhlIGFsbG9jYXRvci4KCk9uIHg4NiwgdGhl
IE1GTiAwIGlzIGFscmVhZHkga2VwdCBhd2F5IGZyb20gdGhlIGJ1ZGR5IGFsbG9jYXRvci4gU28g
dGhlCmJ1ZyBjYW4gb25seSBoYXBwZW4gb24gQXJtIHBsYXRmb3JtIHdoZXJlIHRoZSBmaXJzdCBt
ZW1vcnkgYmFuayBpcwpzdGFydGluZyBhdCAwLgoKQXMgdGhpcyBpcyBhIHNwZWNpZmljIHRvIHRo
ZSBhbGxvY2F0b3IsIHRoZSBNRk4gMCBpcyByZW1vdmVkIGluIHRoZSBjb21tb24gY29kZQp0byBj
YXRlciBhbGwgdGhlIGFyY2hpdGVjdHVyZXMgKGN1cnJlbnQgYW5kIGZ1dHVyZSkuCgpSZXBvcnRl
ZC1ieTogSmVmZiBLdWJhc2NpayA8amVmZi5rdWJhc2Npa0Bkb3JuZXJ3b3Jrcy5jb20+ClNpZ25l
ZC1vZmYtYnk6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+CgotLS0KQ2M6IEph
cnZpcy5Sb2FjaEBkb3JuZXJ3b3Jrcy5jb20KQ2M6IFN0ZXdhcnQuSGlsZGVicmFuZEBkb3JuZXJ3
b3Jrcy5jb20KCiAgICBJIGFtIG5vdCBzdXJlIEkgZnVsbHkgdW5kZXJzdG9vZCB0aGUgZXhhY3Qg
cHJvYmxlbSB3aGVuIE1GTiAwIGlzCiAgICBnaXZlbiB0byB0aGUgYWxsb2NhdG9yLiBGZWVsIGZy
ZWUgdG8gc3VnZ2VzdCBhIGJldHRlciBleHBsYW5hdGlvbi4KCiAgICBDYW4gYW55b25lIGFibGUg
dG8gcmVwcm9kdWNlIHRoZSBidWcgdGVzdCB3aGVyZSB0aGUgcGF0Y2gKICAgIGVmZmVjdGl2ZWx5
IHNvbHZlIHRoZSBjcmFzaD8KLS0tCiB4ZW4vY29tbW9uL3BhZ2VfYWxsb2MuYyB8IDEyICsrKysr
KysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDEyIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS94
ZW4vY29tbW9uL3BhZ2VfYWxsb2MuYyBiL3hlbi9jb21tb24vcGFnZV9hbGxvYy5jCmluZGV4IDQ1
M2IzMDNiNWIuLjQyYjhhOGNlMjMgMTAwNjQ0Ci0tLSBhL3hlbi9jb21tb24vcGFnZV9hbGxvYy5j
CisrKyBiL3hlbi9jb21tb24vcGFnZV9hbGxvYy5jCkBAIC0xNzU5LDYgKzE3NTksMTggQEAgc3Rh
dGljIHZvaWQgaW5pdF9oZWFwX3BhZ2VzKAogICAgIGJvb2wgaWRsZV9zY3J1YiA9IGZhbHNlOwog
CiAgICAgLyoKKyAgICAgKiBLZWVwIE1GTiAwIGF3YXkgZnJvbSB0aGUgYnVkZHkgYWxsb2NhdG9y
IHRvIGF2b2lkIGNyb3NzaW5nIHpvbmUKKyAgICAgKiBib3VuZGFyeSB3aGVuIG1lcmdpbmcgdHdv
IGJ1ZGRpZXMuCisgICAgICovCisgICAgaWYgKCAhbWZuX3gocGFnZV90b19tZm4ocGcpKSApCisg
ICAgeworICAgICAgICBpZiAoIG5yX3BhZ2VzLS0gPD0gMSApCisgICAgICAgICAgICByZXR1cm47
CisgICAgICAgIHBnKys7CisgICAgfQorCisKKyAgICAvKgogICAgICAqIFNvbWUgcGFnZXMgbWF5
IG5vdCBnbyB0aHJvdWdoIHRoZSBib290IGFsbG9jYXRvciAoZS5nIHJlc2VydmVkCiAgICAgICog
bWVtb3J5IGF0IGJvb3QgYnV0IHJlbGVhc2VkIGp1c3QgYWZ0ZXIgLS0tIGtlcm5lbCwgaW5pdHJh
bWZzLAogICAgICAqIGV0Yy4pLgotLSAKMi4xMS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
