Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6357E8185C
	for <lists+xen-devel@lfdr.de>; Mon,  5 Aug 2019 13:46:49 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hubP4-0003qV-ML; Mon, 05 Aug 2019 11:43:50 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=1x4A=WB=gmail.com=viktor.mitin.19@srs-us1.protection.inumbo.net>)
 id 1hubP3-0003qF-5x
 for xen-devel@lists.xenproject.org; Mon, 05 Aug 2019 11:43:49 +0000
X-Inumbo-ID: 48be938d-b776-11e9-8980-bc764e045a96
Received: from mail-lj1-x244.google.com (unknown [2a00:1450:4864:20::244])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 48be938d-b776-11e9-8980-bc764e045a96;
 Mon, 05 Aug 2019 11:43:47 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id v24so79167696ljg.13
 for <xen-devel@lists.xenproject.org>; Mon, 05 Aug 2019 04:43:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=8JuvpGQ3wx8Yo7D6k7rA2XzkzCzB1WWESXIUApcCbpc=;
 b=OXytcxTGZ85Q9fXekMiP9JXk07frLjSow4YCeQ6ORX1pHYexTvDlvjs+JY8Rjs9wWQ
 xUAuf/qpEXfdZzBVuKBVZuRZsiPVcdMxWoxOpj9/uKgb72zFSVaqFEj3OY9FGBE5rmFI
 WrD+wkLBz4yS11/tIS7byVVl5wSeQNirxQ7P2eqQpd7rKc4idPr9hvzqDe2VrTkRr2Na
 9Marf5qF0rdLnS4IiQ85DYle++VzmFTSubjYEaH5TWyLyA3r8Yrn3mJ+XsVdpGPeNuLn
 BDViWjoBcQ+rs1bKySGfw/PkuksRL/IEh1T7rSPwWEPRvY7c6yLTuoSZ9w88Z6VuGFps
 bmxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=8JuvpGQ3wx8Yo7D6k7rA2XzkzCzB1WWESXIUApcCbpc=;
 b=R6o/p89PpcImWYZmZhf18vOnk17pqoPmgLfcC9e9J3H4FJLTiwP8h7KWKpgfY5rz6+
 BSbgX8YYa540Z0amUhC5lpjhBFVSRHYG4HTY0U/DTzLcpg9aMnUgcZmK0ghoJbv98/63
 yM3osFyy8oXYx8wTk8dMhBsYhpQ0ke00WDH4HE+jLdwxAShzj52F/xtoWMSHvbTAXhJY
 eHRFIBKU/l944Or8dd+ed1po3r0K8j9BEma6bjd9uEmPsoFl+iimlsUMmC7NX8dxgI3h
 Ft1PM8qAdo1UofBZwfg7jovAnehuCSfcN+CCWX1mhCB4WmdkXeqjn235JNo8IFg6uX1a
 BU7w==
X-Gm-Message-State: APjAAAWOzwbnxEjyQ9at1VqbTyhNi8KUdMgW04DnZW5LzOgHUJzvZR01
 POaWLXA9qJ/gHpSYXTmMaCawyNVq
X-Google-Smtp-Source: APXvYqxMQQvjlH8eQB3el0yNgkPHeja/iNbwW0eF+5OcRJe31Eo28zN0qOEq74uEusoF/ine1ZC33w==
X-Received: by 2002:a05:651c:92:: with SMTP id
 18mr70406302ljq.35.1565005425942; 
 Mon, 05 Aug 2019 04:43:45 -0700 (PDT)
Received: from 3489.kyiv.epam.com (ll-22.209.223.85.sovam.net.ua.
 [85.223.209.22])
 by smtp.gmail.com with ESMTPSA id b1sm17285057ljj.26.2019.08.05.04.43.44
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 05 Aug 2019 04:43:45 -0700 (PDT)
From: Viktor Mitin <viktor.mitin.19@gmail.com>
To: xen-devel@lists.xenproject.org
Date: Mon,  5 Aug 2019 14:43:30 +0300
Message-Id: <20190805114332.15329-2-viktor.mitin.19@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190805114332.15329-1-viktor.mitin.19@gmail.com>
References: <20190805114332.15329-1-viktor.mitin.19@gmail.com>
Subject: [Xen-devel] [PATCH v6 1/2] xen/arm: extend fdt_property_interrupts
 to support DomU
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
Cc: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Julien Grall <julien.grall@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Viktor Mitin <viktor_mitin@epam.com>, Viktor Mitin <viktor.mitin.19@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RXh0ZW5kIGZkdF9wcm9wZXJ0eV9pbnRlcnJ1cHRzIHRvIGRlYWwgd2l0aCBvdGhlciBkb21haW4g
dGhhbiB0aGUgaHdkb20uCgpUaGUgcHJvdG90eXBlIG9mIGZkdF9wcm9wZXJ0eV9pbnRlcnJ1cHRz
KCkgaGFzIGJlZW4gbW9kaWZpZWQKdG8gc3VwcG9ydCBib3RoIGh3ZG9tIGFuZCBkb21VIGluIG9u
ZSBmdW5jdGlvbi4KClRoaXMgaXMgYSBwcmVwYXJhdG9yeSBmb3IgdGhlIG5leHQgcGF0Y2ggd2hp
Y2ggY29uc29saWRhdGVzCm1ha2VfdGltZXJfbm9kZSBhbmQgbWFrZV90aW1lcl9kb21VX25vZGUi
LgpPcmlnaW5hbCBnb2FsIGlzIHRvIGNvbnNvbGlkYXRlIG1ha2VfdGltZXIgZnVuY3Rpb25zLgoK
U3VnZ2VzdGVkLWJ5OiBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPgpTaWduZWQt
b2ZmLWJ5OiBWaWt0b3IgTWl0aW4gPHZpa3Rvcl9taXRpbkBlcGFtLmNvbT4KLS0tCiB4ZW4vYXJj
aC9hcm0vZG9tYWluX2J1aWxkLmMgfCAyMCArKysrKysrKysrKystLS0tLS0tLQogMSBmaWxlIGNo
YW5nZWQsIDEyIGluc2VydGlvbnMoKyksIDggZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEveGVu
L2FyY2gvYXJtL2RvbWFpbl9idWlsZC5jIGIveGVuL2FyY2gvYXJtL2RvbWFpbl9idWlsZC5jCmlu
ZGV4IDRjODQwNDE1NWEuLmJjN2QxN2RkMmMgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL2FybS9kb21h
aW5fYnVpbGQuYworKysgYi94ZW4vYXJjaC9hcm0vZG9tYWluX2J1aWxkLmMKQEAgLTYyMSwxNyAr
NjIxLDIwIEBAIHN0YXRpYyB2b2lkIF9faW5pdCBzZXRfaW50ZXJydXB0KGdpY19pbnRlcnJ1cHRf
dCBpbnRlcnJ1cHQsCiAgKiAgImludGVycnVwdHMiOiBjb250YWlucyB0aGUgbGlzdCBvZiBpbnRl
cnJ1cHRzCiAgKiAgImludGVycnVwdC1wYXJlbnQiOiBsaW5rIHRvIHRoZSBHSUMKICAqLwotc3Rh
dGljIGludCBfX2luaXQgZmR0X3Byb3BlcnR5X2ludGVycnVwdHModm9pZCAqZmR0LCBnaWNfaW50
ZXJydXB0X3QgKmludHIsCitzdGF0aWMgaW50IF9faW5pdCBmZHRfcHJvcGVydHlfaW50ZXJydXB0
cyhjb25zdCBzdHJ1Y3Qga2VybmVsX2luZm8gKmtpbmZvLAorICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgZ2ljX2ludGVycnVwdF90ICppbnRyLAogICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdW5zaWduZWQgbnVtX2lycSkKIHsKICAgICBp
bnQgcmVzOworICAgIHVpbnQzMl90IHBoYW5kbGUgPSBpc19oYXJkd2FyZV9kb21haW4oa2luZm8t
PmQpID8KKyAgICAgICAgICAgICAgICAgICAgICAgZHRfaW50ZXJydXB0X2NvbnRyb2xsZXItPnBo
YW5kbGUgOiBHVUVTVF9QSEFORExFX0dJQzsKIAotICAgIHJlcyA9IGZkdF9wcm9wZXJ0eShmZHQs
ICJpbnRlcnJ1cHRzIiwgaW50ciwgc2l6ZW9mIChpbnRyWzBdKSAqIG51bV9pcnEpOworICAgIHJl
cyA9IGZkdF9wcm9wZXJ0eShraW5mby0+ZmR0LCAiaW50ZXJydXB0cyIsCisgICAgICAgICAgICAg
ICAgICAgICAgIGludHIsIHNpemVvZiAoaW50clswXSkgKiBudW1faXJxKTsKICAgICBpZiAoIHJl
cyApCiAgICAgICAgIHJldHVybiByZXM7CiAKLSAgICByZXMgPSBmZHRfcHJvcGVydHlfY2VsbChm
ZHQsICJpbnRlcnJ1cHQtcGFyZW50IiwKLSAgICAgICAgICAgICAgICAgICAgICAgICAgICBkdF9p
bnRlcnJ1cHRfY29udHJvbGxlci0+cGhhbmRsZSk7CisgICAgcmVzID0gZmR0X3Byb3BlcnR5X2Nl
bGwoa2luZm8tPmZkdCwgImludGVycnVwdC1wYXJlbnQiLCBwaGFuZGxlKTsKIAogICAgIHJldHVy
biByZXM7CiB9CkBAIC03MzMsNyArNzM2LDcgQEAgc3RhdGljIGludCBfX2luaXQgbWFrZV9oeXBl
cnZpc29yX25vZGUoc3RydWN0IGRvbWFpbiAqZCwKICAgICAgKiAgVE9ETzogSGFuZGxlIHByb3Bl
cmx5IHRoZSBjcHVtYXNrOwogICAgICAqLwogICAgIHNldF9pbnRlcnJ1cHQoaW50ciwgZC0+YXJj
aC5ldnRjaG5faXJxLCAweGYsIERUX0lSUV9UWVBFX0xFVkVMX0xPVyk7Ci0gICAgcmVzID0gZmR0
X3Byb3BlcnR5X2ludGVycnVwdHMoZmR0LCAmaW50ciwgMSk7CisgICAgcmVzID0gZmR0X3Byb3Bl
cnR5X2ludGVycnVwdHMoa2luZm8sICZpbnRyLCAxKTsKICAgICBpZiAoIHJlcyApCiAgICAgICAg
IHJldHVybiByZXM7CiAKQEAgLTk2MCw4ICs5NjMsOSBAQCBzdGF0aWMgaW50IF9faW5pdCBtYWtl
X2dpY19ub2RlKGNvbnN0IHN0cnVjdCBkb21haW4gKmQsIHZvaWQgKmZkdCwKICAgICByZXR1cm4g
cmVzOwogfQogCi1zdGF0aWMgaW50IF9faW5pdCBtYWtlX3RpbWVyX25vZGUoY29uc3Qgc3RydWN0
IGRvbWFpbiAqZCwgdm9pZCAqZmR0KQorc3RhdGljIGludCBfX2luaXQgbWFrZV90aW1lcl9ub2Rl
KGNvbnN0IHN0cnVjdCBrZXJuZWxfaW5mbyAqa2luZm8pCiB7CisgICAgdm9pZCAqZmR0ID0ga2lu
Zm8tPmZkdDsKICAgICBzdGF0aWMgY29uc3Qgc3RydWN0IGR0X2RldmljZV9tYXRjaCB0aW1lcl9p
ZHNbXSBfX2luaXRjb25zdCA9CiAgICAgewogICAgICAgICBEVF9NQVRDSF9DT01QQVRJQkxFKCJh
cm0sYXJtdjctdGltZXIiKSwKQEAgLTEwMTYsNyArMTAyMCw3IEBAIHN0YXRpYyBpbnQgX19pbml0
IG1ha2VfdGltZXJfbm9kZShjb25zdCBzdHJ1Y3QgZG9tYWluICpkLCB2b2lkICpmZHQpCiAgICAg
ZHRfZHByaW50aygiICBWaXJ0IGludGVycnVwdCAldVxuIiwgaXJxKTsKICAgICBzZXRfaW50ZXJy
dXB0KGludHJzWzJdLCBpcnEsIDB4ZiwgRFRfSVJRX1RZUEVfTEVWRUxfTE9XKTsKIAotICAgIHJl
cyA9IGZkdF9wcm9wZXJ0eV9pbnRlcnJ1cHRzKGZkdCwgaW50cnMsIDMpOworICAgIHJlcyA9IGZk
dF9wcm9wZXJ0eV9pbnRlcnJ1cHRzKGtpbmZvLCBpbnRycywgMyk7CiAgICAgaWYgKCByZXMgKQog
ICAgICAgICByZXR1cm4gcmVzOwogCkBAIC0xMzc3LDcgKzEzODEsNyBAQCBzdGF0aWMgaW50IF9f
aW5pdCBoYW5kbGVfbm9kZShzdHJ1Y3QgZG9tYWluICpkLCBzdHJ1Y3Qga2VybmVsX2luZm8gKmtp
bmZvLAogICAgIGlmICggZGV2aWNlX2dldF9jbGFzcyhub2RlKSA9PSBERVZJQ0VfR0lDICkKICAg
ICAgICAgcmV0dXJuIG1ha2VfZ2ljX25vZGUoZCwga2luZm8tPmZkdCwgbm9kZSk7CiAgICAgaWYg
KCBkdF9tYXRjaF9ub2RlKHRpbWVyX21hdGNoZXMsIG5vZGUpICkKLSAgICAgICAgcmV0dXJuIG1h
a2VfdGltZXJfbm9kZShkLCBraW5mby0+ZmR0KTsKKyAgICAgICAgcmV0dXJuIG1ha2VfdGltZXJf
bm9kZShraW5mbyk7CiAKICAgICAvKiBTa2lwIG5vZGVzIHVzZWQgYnkgWGVuICovCiAgICAgaWYg
KCBkdF9kZXZpY2VfdXNlZF9ieShub2RlKSA9PSBET01JRF9YRU4gKQotLSAKMi4xNy4xCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
