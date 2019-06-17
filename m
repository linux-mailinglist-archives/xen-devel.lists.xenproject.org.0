Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E4D948CFC
	for <lists+xen-devel@lfdr.de>; Mon, 17 Jun 2019 20:52:40 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hcwhx-0001W5-UK; Mon, 17 Jun 2019 18:50:21 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=7cdP=UQ=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hcwhw-0001Vs-Mp
 for xen-devel@lists.xenproject.org; Mon, 17 Jun 2019 18:50:20 +0000
X-Inumbo-ID: c129c17e-9130-11e9-b3dd-17fa74152a31
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c129c17e-9130-11e9-b3dd-17fa74152a31;
 Mon, 17 Jun 2019 18:50:20 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s.xilinx.com
 (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1EE1A2084D;
 Mon, 17 Jun 2019 18:50:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1560797419;
 bh=WRiAdeA2JMJLA6xN8nZ6e+DN3JPP5PKLU9QW5JdRbRk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=NeueYqMxuB0v9nHzhYmAMdFNw0PiU8NvRSyQqqlYDcQU9GAyWMmrNDXRcIw63uxfz
 au4dToQmjDxm7Z/m0G3j3PrZcg8BBxyGm9PotGJN9KEGdK+LxiWqNLjunVO4IgGzjr
 /LurG/9tG6T1C9af1ThdhXLK947bCLryRfbRpD6I=
From: Stefano Stabellini <sstabellini@kernel.org>
To: xen-devel@lists.xenproject.org
Date: Mon, 17 Jun 2019 11:50:16 -0700
Message-Id: <20190617185017.32661-1-sstabellini@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <alpine.DEB.2.21.1906171146440.2072@sstabellini-ThinkPad-T480s>
References: <alpine.DEB.2.21.1906171146440.2072@sstabellini-ThinkPad-T480s>
Subject: [Xen-devel] [PATCH v4 1/2] xen: switch pdx_init_mask to return
 uint64_t
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
Cc: Stefano Stabellini <stefanos@xilinx.com>, julien.grall@arm.com,
 sstabellini@kernel.org, JBeulich@suse.com, andrew.cooper3@citrix.com
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QWxzbyBjaGFuZ2Ugc3JhdF9yZWdpb25fbWFzayB0byB1aW50NjRfdCBhcyBpdCBpcyB1c2VkIHRv
IHN0b3JlIHRoZQpyZXR1cm4gdmFsdWUgb2YgcGR4X2luaXRfbWFzay4gdWludDY0X3QgaXMgYWx3
YXlzIGdyZWF0ZXIgb3IgZXF1YWwgdG8KdTY0LgoKU2lnbmVkLW9mZi1ieTogU3RlZmFubyBTdGFi
ZWxsaW5pIDxzdGVmYW5vc0B4aWxpbnguY29tPgpDQzogSkJldWxpY2hAc3VzZS5jb20KQ0M6IGFu
ZHJldy5jb29wZXIzQGNpdHJpeC5jb20KQ0M6IGp1bGllbi5ncmFsbEBhcm0uY29tCi0tLQogeGVu
L2FyY2gvYXJtL3NldHVwLmMgIHwgMiArLQogeGVuL2FyY2gveDg2L3NyYXQuYyAgIHwgMiArLQog
eGVuL2NvbW1vbi9wZHguYyAgICAgIHwgMiArLQogeGVuL2luY2x1ZGUveGVuL3BkeC5oIHwgMiAr
LQogNCBmaWxlcyBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCgpkaWZm
IC0tZ2l0IGEveGVuL2FyY2gvYXJtL3NldHVwLmMgYi94ZW4vYXJjaC9hcm0vc2V0dXAuYwppbmRl
eCAyMTEyNzE1NTc5Li5iMDNlN2FjMzMwIDEwMDY0NAotLS0gYS94ZW4vYXJjaC9hcm0vc2V0dXAu
YworKysgYi94ZW4vYXJjaC9hcm0vc2V0dXAuYwpAQCAtNDgzLDcgKzQ4Myw3IEBAIHN0YXRpYyB2
b2lkIF9faW5pdCBpbml0X3BkeCh2b2lkKQogewogICAgIHBhZGRyX3QgYmFua19zdGFydCwgYmFu
a19zaXplLCBiYW5rX2VuZDsKIAotICAgIHU2NCBtYXNrID0gcGR4X2luaXRfbWFzayhib290aW5m
by5tZW0uYmFua1swXS5zdGFydCk7CisgICAgdWludDY0X3QgbWFzayA9IHBkeF9pbml0X21hc2so
Ym9vdGluZm8ubWVtLmJhbmtbMF0uc3RhcnQpOwogICAgIGludCBiYW5rOwogCiAgICAgZm9yICgg
YmFuayA9IDAgOyBiYW5rIDwgYm9vdGluZm8ubWVtLm5yX2JhbmtzOyBiYW5rKysgKQpkaWZmIC0t
Z2l0IGEveGVuL2FyY2gveDg2L3NyYXQuYyBiL3hlbi9hcmNoL3g4Ni9zcmF0LmMKaW5kZXggMmQ3
MGI0NTkwOS4uNDdhNDI2NzIyMCAxMDA2NDQKLS0tIGEveGVuL2FyY2gveDg2L3NyYXQuYworKysg
Yi94ZW4vYXJjaC94ODYvc3JhdC5jCkBAIC00MDEsNyArNDAxLDcgQEAgc3RhdGljIGludCBfX2lu
aXQgbm9kZXNfY292ZXJfbWVtb3J5KHZvaWQpCiAKIHZvaWQgX19pbml0IGFjcGlfbnVtYV9hcmNo
X2ZpeHVwKHZvaWQpIHt9CiAKLXN0YXRpYyB1NjQgX19pbml0ZGF0YSBzcmF0X3JlZ2lvbl9tYXNr
Oworc3RhdGljIHVpbnQ2NF90IF9faW5pdGRhdGEgc3JhdF9yZWdpb25fbWFzazsKIAogc3RhdGlj
IGludCBfX2luaXQgc3JhdF9wYXJzZV9yZWdpb24oc3RydWN0IGFjcGlfc3VidGFibGVfaGVhZGVy
ICpoZWFkZXIsCiAJCQkJICAgIGNvbnN0IHVuc2lnbmVkIGxvbmcgZW5kKQpkaWZmIC0tZ2l0IGEv
eGVuL2NvbW1vbi9wZHguYyBiL3hlbi9jb21tb24vcGR4LmMKaW5kZXggYmI3ZTQzNzA0OS4uODM1
NmYwM2NlOCAxMDA2NDQKLS0tIGEveGVuL2NvbW1vbi9wZHguYworKysgYi94ZW4vY29tbW9uL3Bk
eC5jCkBAIC01MCw3ICs1MCw3IEBAIHN0YXRpYyB1NjQgX19pbml0IGZpbGxfbWFzayh1NjQgbWFz
aykKICAgICByZXR1cm4gbWFzazsKIH0KIAotdTY0IF9faW5pdCBwZHhfaW5pdF9tYXNrKHU2NCBi
YXNlX2FkZHIpCit1aW50NjRfdCBfX2luaXQgcGR4X2luaXRfbWFzayh1aW50NjRfdCBiYXNlX2Fk
ZHIpCiB7CiAgICAgcmV0dXJuIGZpbGxfbWFzayhiYXNlX2FkZHIgLSAxKTsKIH0KZGlmZiAtLWdp
dCBhL3hlbi9pbmNsdWRlL3hlbi9wZHguaCBiL3hlbi9pbmNsdWRlL3hlbi9wZHguaAppbmRleCBh
MTUxYWFjMWEyLi43NzBmYWRjMDZjIDEwMDY0NAotLS0gYS94ZW4vaW5jbHVkZS94ZW4vcGR4LmgK
KysrIGIveGVuL2luY2x1ZGUveGVuL3BkeC5oCkBAIC0xMyw3ICsxMyw3IEBAIGV4dGVybiB1bnNp
Z25lZCBsb25nIHBmbl90b3BfbWFzaywgbWFfdG9wX21hc2s7CiAgICAgICAgICAgICAgICAgICAg
ICAgICAgKHNpemVvZigqZnJhbWVfdGFibGUpICYgLXNpemVvZigqZnJhbWVfdGFibGUpKSkKIGV4
dGVybiB1bnNpZ25lZCBsb25nIHBkeF9ncm91cF92YWxpZFtdOwogCi1leHRlcm4gdTY0IHBkeF9p
bml0X21hc2sodTY0IGJhc2VfYWRkcik7CitleHRlcm4gdWludDY0X3QgcGR4X2luaXRfbWFzayh1
NjQgYmFzZV9hZGRyKTsKIGV4dGVybiB1NjQgcGR4X3JlZ2lvbl9tYXNrKHU2NCBiYXNlLCB1NjQg
bGVuKTsKIAogZXh0ZXJuIHZvaWQgc2V0X3BkeF9yYW5nZSh1bnNpZ25lZCBsb25nIHNtZm4sIHVu
c2lnbmVkIGxvbmcgZW1mbik7Ci0tIAoyLjE3LjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
