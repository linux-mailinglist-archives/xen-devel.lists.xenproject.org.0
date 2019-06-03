Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9440E33ABF
	for <lists+xen-devel@lfdr.de>; Tue,  4 Jun 2019 00:05:51 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hXv2X-0003T1-Io; Mon, 03 Jun 2019 22:02:49 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=RTL5=UC=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hXv2W-0003Se-Ka
 for xen-devel@lists.xenproject.org; Mon, 03 Jun 2019 22:02:48 +0000
X-Inumbo-ID: 528f03cc-864b-11e9-b291-5f2b851eba2e
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 528f03cc-864b-11e9-b291-5f2b851eba2e;
 Mon, 03 Jun 2019 22:02:48 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s.xilinx.com
 (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0D81923E77;
 Mon,  3 Jun 2019 22:02:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1559599367;
 bh=3CCUvl0LQ/WFZ3gY9nIlwyemZpPkp3hn2VdsDAJkuhI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=hQZnlPB7u3xrrwHYCHjIg2oMgd6VeycOyuaItpE7H4MYIq8D92f/JYOYq9N5f33pO
 so4usxlrvoYXG6fN56jCknCGhF/ZxXRjKx1nsIGdvNeWU3G5ScBfMZJkiDi+vBPt4X
 wisH6HcKn6MvOKO/fAMIk3/6dzKAjoHrsL4/MzbI=
From: Stefano Stabellini <sstabellini@kernel.org>
To: xen-devel@lists.xenproject.org
Date: Mon,  3 Jun 2019 15:02:44 -0700
Message-Id: <20190603220245.22750-2-sstabellini@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <alpine.DEB.2.21.1906031456390.14041@sstabellini-ThinkPad-T480s>
References: <alpine.DEB.2.21.1906031456390.14041@sstabellini-ThinkPad-T480s>
Subject: [Xen-devel] [PATCH v3 2/3] xen: actually skip the first MAX_ORDER
 bits in pfn_pdx_hole_setup
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
Cc: Stefano Stabellini <stefanos@xilinx.com>, sstabellini@kernel.org,
 wei.liu2@citrix.com, konrad.wilk@oracle.com, George.Dunlap@eu.citrix.com,
 andrew.cooper3@citrix.com, ian.jackson@eu.citrix.com, tim@xen.org,
 julien.grall@arm.com, JBeulich@suse.com
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

cGZuX3BkeF9ob2xlX3NldHVwIGlzIG1lYW50IHRvIHNraXAgdGhlIGZpcnN0IE1BWF9PUkRFUiBi
aXRzLCBidXQKYWN0dWFsbHkgaXQgb25seSBza2lwcyB0aGUgZmlyc3QgTUFYX09SREVSLTEgYml0
cy4gVGhlIGlzc3VlIHdhcwpwcm9iYWJseSBpbnRyb2R1Y2VkIGJ5IGJkYjU0MzljM2YgKCJ4ODZf
NjQ6IEVuc3VyZSBmcmFtZS10YWJsZQpjb21wcmVzc2lvbiBsZWF2ZXMgTUFYX09SREVSIGFsaWdu
ZWQiKSwgd2hlbiBjaGFuZ2luZyB0byBsb29wIHRvIHN0YXJ0CmZyb20gTUFYX09SREVSLTEgYW4g
YWRqdXN0bWVudCBieSAxIHdhcyBuZWVkZWQgaW4gdGhlIGNhbGwgdG8KZmluZF9uZXh0X2JpdCgp
IGJ1dCBub3QgZG9uZS4KCkZpeCB0aGUgaXNzdWUgYnkgcGFzc2luZyBqKzEgYW5kIGkrMSB0byBm
aW5kX25leHRfemVyb19iaXQgYW5kCmZpbmRfbmV4dF9iaXQuIEFsc28gYWRkIGEgY2hlY2sgZm9y
IGkgPj0gQklUU19QRVJfTE9ORyBiZWNhdXNlCmZpbmRfeyxuZXh0X316ZXJvX2JpdCgpIGFyZSBm
cmVlIHRvIGFzc3VtZSB0aGF0IHRoZWlyIGxhc3QgYXJndW1lbnQgaXMKbGVzcyB0aGFuIHRoZWly
IG1pZGRsZSBvbmUuCgpTaWduZWQtb2ZmLWJ5OiBTdGVmYW5vIFN0YWJlbGxpbmkgPHN0ZWZhbm9z
QHhpbGlueC5jb20+ClNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxKQmV1bGljaEBzdXNlLmNv
bT4KQ0M6IGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20KQ0M6IEpCZXVsaWNoQHN1c2UuY29tCkND
OiBHZW9yZ2UuRHVubGFwQGV1LmNpdHJpeC5jb20KQ0M6IGlhbi5qYWNrc29uQGV1LmNpdHJpeC5j
b20KQ0M6IGtvbnJhZC53aWxrQG9yYWNsZS5jb20KQ0M6IHRpbUB4ZW4ub3JnCkNDOiB3ZWkubGl1
MkBjaXRyaXguY29tCi0tLQpDaGFuZ2VzIGluIHYyOgotIGFkZCBjb21taXQgdGl0bGUgb2YgYmRi
NTQzOWMzZgotIG1vcmUgQ0MKLSB1cGRhdGUgY29tbWl0IG1lc3NhZ2UKLS0tCiB4ZW4vY29tbW9u
L3BkeC5jIHwgNiArKysrLS0KIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDIgZGVs
ZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2NvbW1vbi9wZHguYyBiL3hlbi9jb21tb24vcGR4
LmMKaW5kZXggNTBjMjFiNmJmOC4uYmI3ZTQzNzA0OSAxMDA2NDQKLS0tIGEveGVuL2NvbW1vbi9w
ZHguYworKysgYi94ZW4vY29tbW9uL3BkeC5jCkBAIC04Myw4ICs4MywxMCBAQCB2b2lkIF9faW5p
dCBwZm5fcGR4X2hvbGVfc2V0dXAodW5zaWduZWQgbG9uZyBtYXNrKQogICAgICAqLwogICAgIGZv
ciAoIGogPSBNQVhfT1JERVItMTsgOyApCiAgICAgewotICAgICAgICBpID0gZmluZF9uZXh0X3pl
cm9fYml0KCZtYXNrLCBCSVRTX1BFUl9MT05HLCBqKTsKLSAgICAgICAgaiA9IGZpbmRfbmV4dF9i
aXQoJm1hc2ssIEJJVFNfUEVSX0xPTkcsIGkpOworICAgICAgICBpID0gZmluZF9uZXh0X3plcm9f
Yml0KCZtYXNrLCBCSVRTX1BFUl9MT05HLCBqICsgMSk7CisgICAgICAgIGlmICggaSA+PSBCSVRT
X1BFUl9MT05HICkKKyAgICAgICAgICAgIGJyZWFrOworICAgICAgICBqID0gZmluZF9uZXh0X2Jp
dCgmbWFzaywgQklUU19QRVJfTE9ORywgaSArIDEpOwogICAgICAgICBpZiAoIGogPj0gQklUU19Q
RVJfTE9ORyApCiAgICAgICAgICAgICBicmVhazsKICAgICAgICAgaWYgKCBqIC0gaSA+IGhvbGVf
c2hpZnQgKQotLSAKMi4xNy4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
