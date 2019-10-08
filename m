Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A1AC5D03F3
	for <lists+xen-devel@lfdr.de>; Wed,  9 Oct 2019 01:16:15 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iHyed-0000Wv-GL; Tue, 08 Oct 2019 23:12:31 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=M61b=YB=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1iHyec-0000Wq-Ez
 for xen-devel@lists.xenproject.org; Tue, 08 Oct 2019 23:12:30 +0000
X-Inumbo-ID: 19abcf38-ea21-11e9-97da-12813bfff9fa
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 19abcf38-ea21-11e9-97da-12813bfff9fa;
 Tue, 08 Oct 2019 23:12:30 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s.xilinx.com
 (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1F45620873;
 Tue,  8 Oct 2019 23:12:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1570576349;
 bh=25iMfaqC1F6oK1rkD/uiw057ATgoxbtKJ0lJwKT6Tsw=;
 h=From:To:Cc:Subject:Date:From;
 b=e4kkOPzexdixkdtVK06jaUcDt/vQ1bDLHt+upTq95fT1boF1ZH+uNYfzPnHnZOKsz
 jfBfdMzvymwgV/LUs7FZXxJTPZeoXM/zQTR1TbIoaCpanSXgXbYqd+LxntB9N2+5yT
 pXjzShQgONOninXC2BjtjYXM8I/8MwN9mpMRNXhc=
From: Stefano Stabellini <sstabellini@kernel.org>
To: xen-devel@lists.xenproject.org
Date: Tue,  8 Oct 2019 16:12:11 -0700
Message-Id: <20191008231211.31110-1-sstabellini@kernel.org>
X-Mailer: git-send-email 2.17.1
Subject: [Xen-devel] [PATCH for-4.13 v3] xen/arm: fix buf size in
 make_cpus_node
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
Cc: jgross@suse.com, Julien.Grall@arm.com, sstabellini@kernel.org,
 Volodymyr_Babchuk@epam.com, Stefano Stabellini <stefano.stabellini@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlIHNpemUgb2YgYnVmIGlzIGNhbGN1bGF0ZWQgd3JvbmdseTogdGhlIG51bWJlciBpcyBwcmlu
dGVkIGFzIGEKaGV4YWRlY2ltYWwgbnVtYmVyLCBzbyB3ZSBuZWVkIDggYnl0ZXMgZm9yIDMyYml0
LCBub3QgMTAgYnl0ZXMuCgpBcyBhIHJlc3VsdCwgaXQgc2hvdWxkIGJlIHNpemVvZigiY3B1QCIp
ICsgOCBieXRlcyBmb3IgYSAzMi1iaXQgbnVtYmVyICsKMSBieXRlIGZvciBcMC4gVG90YWwgPSAx
My4KCm1waWRyX2FmZiBpcyA2NC1iaXQsIGhvd2V2ZXIsIG9ubHkgYml0cyBbMC0yM10gYXJlIHVz
ZWQuIEFkZCBhIGNoZWNrIGZvcgp0aGF0LgoKRml4ZXM6IGM4MWE3OTFkMzQgKHhlbi9hcm06IFNl
dCAncmVnJyBvZiBjcHUgbm9kZSBmb3IgZG9tMCB0byBtYXRjaCBNUElEUidzIGFmZmluaXR5KQpT
aWduZWQtb2ZmLWJ5OiBTdGVmYW5vIFN0YWJlbGxpbmkgPHN0ZWZhbm8uc3RhYmVsbGluaUB4aWxp
bnguY29tPgpSZWxlYXNlLWFja2VkLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+
Ci0tLQpDaGFuZ2VzIGluIHYzOgotIG1ha2Ugc3VyZSBvbmx5IFsyMzowXSBiaXRzIGFyZSB1c2Vk
IGluIG1waWRyX2FmZgotIGNsYXJpZnkgdGhhdCB3ZSBvbmx5IG5lZWQgMzJiaXQgZm9yIGJ1ZiB3
cml0ZXMKCkNoYW5nZXMgaW4gdjI6Ci0gcGF0Y2ggYWRkZWQKLS0tCiB4ZW4vYXJjaC9hcm0vZG9t
YWluX2J1aWxkLmMgfCAxMiArKysrKysrKysrKy0KIDEgZmlsZSBjaGFuZ2VkLCAxMSBpbnNlcnRp
b25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL2RvbWFpbl9i
dWlsZC5jIGIveGVuL2FyY2gvYXJtL2RvbWFpbl9idWlsZC5jCmluZGV4IDkyMWIwNTQ1MjAuLmQ1
ZWU2Mzk1NDggMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL2FybS9kb21haW5fYnVpbGQuYworKysgYi94
ZW4vYXJjaC9hcm0vZG9tYWluX2J1aWxkLmMKQEAgLTc4OSw3ICs3ODksNyBAQCBzdGF0aWMgaW50
IF9faW5pdCBtYWtlX2NwdXNfbm9kZShjb25zdCBzdHJ1Y3QgZG9tYWluICpkLCB2b2lkICpmZHQp
CiAgICAgY29uc3Qgdm9pZCAqY29tcGF0aWJsZSA9IE5VTEw7CiAgICAgdTMyIGxlbjsKICAgICAv
KiBQbGFjZWhvbGRlciBmb3IgY3B1QCArIGEgMzItYml0IG51bWJlciArIFwwICovCi0gICAgY2hh
ciBidWZbMTVdOworICAgIGNoYXIgYnVmWzEzXTsKICAgICB1MzIgY2xvY2tfZnJlcXVlbmN5Owog
ICAgIGJvb2wgY2xvY2tfdmFsaWQ7CiAgICAgdWludDY0X3QgbXBpZHJfYWZmOwpAQCAtODQ3LDgg
Kzg0NywxOCBAQCBzdGF0aWMgaW50IF9faW5pdCBtYWtlX2NwdXNfbm9kZShjb25zdCBzdHJ1Y3Qg
ZG9tYWluICpkLCB2b2lkICpmZHQpCiAgICAgICAgICAqIHRoZSBNUElEUidzIGFmZmluaXR5IGJp
dHMuIFdlIHdpbGwgdXNlIEFGRjAgYW5kIEFGRjEgd2hlbgogICAgICAgICAgKiBjb25zdHJ1Y3Rp
bmcgdGhlIHJlZyB2YWx1ZSBvZiB0aGUgZ3Vlc3QgYXQgdGhlIG1vbWVudCwgZm9yIGl0CiAgICAg
ICAgICAqIGlzIGVub3VnaCBmb3IgdGhlIGN1cnJlbnQgbWF4IHZjcHUgbnVtYmVyLgorICAgICAg
ICAgKgorICAgICAgICAgKiBXZSBvbmx5IGRlYWwgd2l0aCBBRkZ7MCwgMSwgMn0gc3RvcmVkIGlu
IGJpdHMgWzIzOjBdIGF0IHRoZQorICAgICAgICAgKiBtb21lbnQuCiAgICAgICAgICAqLwogICAg
ICAgICBtcGlkcl9hZmYgPSB2Y3B1aWRfdG9fdmFmZmluaXR5KGNwdSk7CisgICAgICAgIGlmICgg
KG1waWRyX2FmZiAmIH5HRU5NQVNLX1VMTCgyMywgMCkpICE9IDAgKQorICAgICAgICB7CisgICAg
ICAgICAgICBwcmludGsoWEVOTE9HX0VSUiAiVW5hYmxlIHRvIGhhbmRsZSBNUElEUiBBRkZJTklU
WSAweCUiUFJJeDY0IlxuIiwgCisgICAgICAgICAgICAgICAgICAgbXBpZHJfYWZmKTsKKyAgICAg
ICAgICAgIHJldHVybiAtRUlOVkFMOworICAgICAgICB9CisKICAgICAgICAgZHRfZHByaW50aygi
Q3JlYXRlIGNwdUAlIlBSSXg2NCIgKGxvZ2ljYWwgQ1BVSUQ6ICVkKSBub2RlXG4iLAogICAgICAg
ICAgICAgICAgICAgIG1waWRyX2FmZiwgY3B1KTsKIAotLSAKMi4xNy4xCgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
