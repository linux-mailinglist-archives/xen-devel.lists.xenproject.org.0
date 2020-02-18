Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BBD71629D4
	for <lists+xen-devel@lfdr.de>; Tue, 18 Feb 2020 16:50:43 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j456G-0000ne-Mb; Tue, 18 Feb 2020 15:47:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=u3z7=4G=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1j456E-0000nG-RR
 for xen-devel@lists.xenproject.org; Tue, 18 Feb 2020 15:47:50 +0000
X-Inumbo-ID: 0439b9a0-5266-11ea-ade5-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0439b9a0-5266-11ea-ade5-bc764e2007e4;
 Tue, 18 Feb 2020 15:47:50 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 76A89B152;
 Tue, 18 Feb 2020 15:47:49 +0000 (UTC)
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <b5d94bd8-9a39-c88b-4c3c-f89e655f3abf@suse.com>
Message-ID: <2a9a998e-f2d0-3c07-e85e-7fdda18b506e@suse.com>
Date: Tue, 18 Feb 2020 16:47:49 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <b5d94bd8-9a39-c88b-4c3c-f89e655f3abf@suse.com>
Content-Language: en-US
Subject: [Xen-devel] [PATCH 5/5] libxl/PCI: align reserved device memory
 boundary for HAP guests
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
Cc: Anthony Perard <anthony.perard@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QXMgdGhlIGNvZGUgY29tbWVudCBzYXlzLCB0aGlzIHdpbGwgYWxsb3cgdXNlIG9mIGEgMk1iIHN1
cGVyIHBhZ2UKbWFwcGluZyBhdCB0aGUgZW5kIG9mICJsb3ciIG1lbW9yeS4KClNpZ25lZC1vZmYt
Ynk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KCi0tLSBhL3Rvb2xzL2xpYnhsL2xp
YnhsX2RtLmMKKysrIGIvdG9vbHMvbGlieGwvbGlieGxfZG0uYwpAQCAtNTYzLDYgKzU2MywxMyBA
QCBpbnQgbGlieGxfX2RvbWFpbl9kZXZpY2VfY29uc3RydWN0X3JkbShsCiAgICAgICAgIC8qIEp1
c3QgY2hlY2sgaWYgUkRNID4gb3VyIG1lbW9yeSBib3VuZGFyeS4gKi8KICAgICAgICAgaWYgKHJk
bV9zdGFydCA+IHJkbV9tZW1fYm91bmRhcnkpIHsKICAgICAgICAgICAgIC8qCisgICAgICAgICAg
ICAgKiBGb3IgSEFQIGd1ZXN0cyByb3VuZCBkb3duIHRvIGEgMk1iIGJvdW5kYXJ5IHRvIGFsbG93
IHVzZQorICAgICAgICAgICAgICogb2YgbGFyZ2UgcGFnZSBtYXBwaW5ncy4KKyAgICAgICAgICAg
ICAqLworICAgICAgICAgICAgaWYgKGxpYnhsX2RlZmJvb2xfdmFsKGRfY29uZmlnLT5jX2luZm8u
aGFwKQorICAgICAgICAgICAgICAgICYmIHJkbV9zdGFydCA+IDB4MjAwMDAwKQorICAgICAgICAg
ICAgICAgIHJkbV9zdGFydCAmPSB+MHgxZmZmZmY7CisgICAgICAgICAgICAvKgogICAgICAgICAg
ICAgICogV2Ugd2lsbCBtb3ZlIGRvd253YXJkcyBsb3dtZW1fZW5kIHNvIHdlIGhhdmUgdG8gZXhw
YW5kCiAgICAgICAgICAgICAgKiBoaWdobWVtX2VuZC4KICAgICAgICAgICAgICAqLwoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
