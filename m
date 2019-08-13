Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0578C8C06F
	for <lists+xen-devel@lfdr.de>; Tue, 13 Aug 2019 20:20:37 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hxbMR-0000v2-O8; Tue, 13 Aug 2019 18:17:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=WWvF=WJ=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hxbMQ-0000uv-7A
 for xen-devel@lists.xenproject.org; Tue, 13 Aug 2019 18:17:30 +0000
X-Inumbo-ID: 9ae3ce7c-bdf6-11e9-b288-1bd3d61f9bc7
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 9ae3ce7c-bdf6-11e9-b288-1bd3d61f9bc7;
 Tue, 13 Aug 2019 18:17:27 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C5FD91570;
 Tue, 13 Aug 2019 11:17:26 -0700 (PDT)
Received: from e108454-lin.cambridge.arm.com (e108454-lin.cambridge.arm.com
 [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1F94D3F706;
 Tue, 13 Aug 2019 11:17:26 -0700 (PDT)
From: Julien Grall <julien.grall@arm.com>
To: xen-devel@lists.xenproject.org
Date: Tue, 13 Aug 2019 19:17:21 +0100
Message-Id: <20190813181721.27242-1-julien.grall@arm.com>
X-Mailer: git-send-email 2.11.0
Subject: [Xen-devel] [PATCH] xen/arm: domain_build: Print the correct domain
 in dtb_load()
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
Cc: Julien Grall <julien.grall@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

ZHRiX2xvYWQoKSBjYW4gYmUgY2FsbGVkIGJ5IG90aGVyIGRvbWFpbiB0aGFuIGRvbTAuIFRvIGF2
b2lkIGNvbmZ1c2lvbgppbiB0aGUgbG9nLCBwcmludCB0aGUgY29ycmVjdCBkb21haW4uCgpTaWdu
ZWQtb2ZmLWJ5OiBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPgotLS0KIHhlbi9h
cmNoL2FybS9kb21haW5fYnVpbGQuYyB8IDUgKysrLS0KIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2Vy
dGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL2RvbWFp
bl9idWlsZC5jIGIveGVuL2FyY2gvYXJtL2RvbWFpbl9idWlsZC5jCmluZGV4IDRjODQwNDE1NWEu
LjliMDQwZjVlOTkgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL2FybS9kb21haW5fYnVpbGQuYworKysg
Yi94ZW4vYXJjaC9hcm0vZG9tYWluX2J1aWxkLmMKQEAgLTE4MTcsOCArMTgxNyw5IEBAIHN0YXRp
YyB2b2lkIF9faW5pdCBkdGJfbG9hZChzdHJ1Y3Qga2VybmVsX2luZm8gKmtpbmZvKQogewogICAg
IHVuc2lnbmVkIGxvbmcgbGVmdDsKIAotICAgIHByaW50aygiTG9hZGluZyBkb20wIERUQiB0byAw
eCUiUFJJcGFkZHIiLTB4JSJQUklwYWRkciJcbiIsCi0gICAgICAgICAgIGtpbmZvLT5kdGJfcGFk
ZHIsIGtpbmZvLT5kdGJfcGFkZHIgKyBmZHRfdG90YWxzaXplKGtpbmZvLT5mZHQpKTsKKyAgICBw
cmludGsoIkxvYWRpbmcgJXBkIERUQiB0byAweCUiUFJJcGFkZHIiLTB4JSJQUklwYWRkciJcbiIs
CisgICAgICAgICAgIGtpbmZvLT5kLCBraW5mby0+ZHRiX3BhZGRyLAorICAgICAgICAgICBraW5m
by0+ZHRiX3BhZGRyICsgZmR0X3RvdGFsc2l6ZShraW5mby0+ZmR0KSk7CiAKICAgICBsZWZ0ID0g
Y29weV90b19ndWVzdF9waHlzX2ZsdXNoX2RjYWNoZShraW5mby0+ZCwga2luZm8tPmR0Yl9wYWRk
ciwKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBraW5mby0+ZmR0
LAotLSAKMi4xMS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
