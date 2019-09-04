Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 05420A83F0
	for <lists+xen-devel@lfdr.de>; Wed,  4 Sep 2019 15:48:35 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i5Vbz-0003mN-5Y; Wed, 04 Sep 2019 13:46:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=YVaO=W7=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1i5Vbx-0003m8-LA
 for xen-devel@lists.xenproject.org; Wed, 04 Sep 2019 13:46:13 +0000
X-Inumbo-ID: 5b2cb944-cf1a-11e9-978d-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5b2cb944-cf1a-11e9-978d-bc764e2007e4;
 Wed, 04 Sep 2019 13:46:12 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 323DEAE4D;
 Wed,  4 Sep 2019 13:46:11 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Date: Wed,  4 Sep 2019 15:46:04 +0200
Message-Id: <20190904134608.18425-1-jgross@suse.com>
X-Mailer: git-send-email 2.16.4
Subject: [Xen-devel] [PATCH v4 0/4] xen: debugtrace cleanup and per-cpu
 buffer support
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
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QW5vdGhlciBkZWJ1Z3RyYWNlIGVuaGFuY2VtZW50IEkgbmVlZGVkIGZvciBjb3JlIHNjaGVkdWxp
bmcgZGVidWdnaW5nLApwbHVzIHNvbWUgY2xlYW51cC4KCkNoYW5nZXMgaW4gVjQ6Ci0gcmVwbGFj
ZWQgcGF0Y2ggMSAob3JpZ2luYWwgb25lIHdhcyBjb21taXR0ZWQsIG5ldyBvbmUgcmVxdWVzdGVk
IGJ5CiAgSmFuIEJldWxpY2gpCi0gc2V2ZXJhbCBjb21tZW50cyBieSBKYW4gYWRkcmVzc2VkCgpD
aGFuZ2VzIGluIFYzOgotIHJlYmFzZSB0byBjdXJyZW50IHN0YWdpbmcKCkNoYW5nZXMgaW4gVjI6
Ci0gYWRkZWQgbmV3IHBhdGNoIDEgKHByZXBhcmluZyB0aGUgbW92ZSBvZiBkZWJ1Z3RyYWNlIGNv
ZGluZykKLSBwYXRjaCA0ICh2MSBwYXRjaCAzKTogYXZvaWQgbGVha2luZyBidWZmZXIKCkp1ZXJn
ZW4gR3Jvc3MgKDQpOgogIHhlbjogZml4IGRlYnVndHJhY2UgY2xlYXJpbmcKICB4ZW46IG1vdmUg
ZGVidWd0cmFjZSBjb2RpbmcgdG8gY29tbW9uL2RlYnVndHJhY2UuYwogIHhlbjogcmVmYWN0b3Ig
ZGVidWd0cmFjZSBkYXRhCiAgeGVuOiBhZGQgcGVyLWNwdSBidWZmZXIgb3B0aW9uIHRvIGRlYnVn
dHJhY2UKCiBkb2NzL21pc2MveGVuLWNvbW1hbmQtbGluZS5wYW5kb2MgfCAgIDcgKy0KIHhlbi9j
b21tb24vTWFrZWZpbGUgICAgICAgICAgICAgICB8ICAgMSArCiB4ZW4vY29tbW9uL2RlYnVndHJh
Y2UuYyAgICAgICAgICAgfCAyNjQgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysKIHhlbi9kcml2ZXJzL2NoYXIvY29uc29sZS5jICAgICAgICB8IDE3OCArLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tCiA0IGZpbGVzIGNoYW5nZWQsIDI3MCBpbnNlcnRpb25zKCspLCAxODAgZGVs
ZXRpb25zKC0pCiBjcmVhdGUgbW9kZSAxMDA2NDQgeGVuL2NvbW1vbi9kZWJ1Z3RyYWNlLmMKCi0t
IAoyLjE2LjQKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
