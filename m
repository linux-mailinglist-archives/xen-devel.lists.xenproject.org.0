Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A81B07617F
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jul 2019 11:05:45 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hqw70-0007PK-Tj; Fri, 26 Jul 2019 09:02:02 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=yHJP=VX=gmail.com=viktor.mitin.19@srs-us1.protection.inumbo.net>)
 id 1hqw6y-0007PF-J7
 for xen-devel@lists.xenproject.org; Fri, 26 Jul 2019 09:02:00 +0000
X-Inumbo-ID: 05d01ce4-af84-11e9-8980-bc764e045a96
Received: from mail-lj1-x241.google.com (unknown [2a00:1450:4864:20::241])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 05d01ce4-af84-11e9-8980-bc764e045a96;
 Fri, 26 Jul 2019 09:01:58 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id t28so50736132lje.9
 for <xen-devel@lists.xenproject.org>; Fri, 26 Jul 2019 02:01:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=hM8CMM0qhovHLQUGpQOWL439U8qSRDprqV2X5oX5KZE=;
 b=lFjYev9/TrtNecyK91tM+wbSA9RMWZuDl2g/Ildn+oxmFs/UtEZSWViUoNo2UiKGyZ
 H7ZJx+867nDi8zY8v6G/TcUB0aoDEw4nrmyVYCYtc5WRUoIW1qvQnzt6nDA5QXqrl1nv
 l/ECfwQQJM9/W9V7jrubEJ4rIOrUUnCbBiMkEggfEywjqxk2t/si4tGXW2O3VUr3Q6GZ
 1YPORw7uX60Qt8HtIXfMFBL9kKGlnPRLgooiWWsBEx6G5L1FnHj/d5Jsvy70d4XMH7qG
 QPww/GWHMcImBncF79FfzJtptX7SRh0K1V4HAzmlwJzZzmuezvowp+6b++eOCWwqn+3Q
 a/8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=hM8CMM0qhovHLQUGpQOWL439U8qSRDprqV2X5oX5KZE=;
 b=EMXnbpna+wFxwEIP6A1lo4fWWAS8tEt4RmbcfAi2srTxW+4UlQbI+Q1Yf+bOQGG83v
 TrlxURF/OYyAZqjUPipBuZZjWJhI0PM/HiSEeujHBawi5GMEaTCPGtiOfend3rJJM+36
 CsMZxoHfjz1mF5opG/2eoaqT6VnjkSwmVv7UoEZqyKo6GN4udrBAE7VCZqd2xG5rIcx1
 4L2tt4wG9hqKA1dGbm9NMj2aDGQRlfmdJvWuABfdJWNFvMIZSZU5FmpuFP1OFigmkr+p
 6giImdioLMdVGFBPWcKSj3DFuH5c4qrb5HeFyrjXGOIHUS0oYvjT8VCxpeeaL5kEZMCN
 1dWA==
X-Gm-Message-State: APjAAAXo4Fc0v3qp56zd0ZbNSbui8ekTHgspqD2Wy6RA3krlN+lR04e8
 z1Ox9kT7xd4FXkqBJUpw9yQPs1Lc
X-Google-Smtp-Source: APXvYqykWEnH0jHnUYq6/c9lxc1z2by2jkTs9H6A/Nb1hmhJuAgJ/Pa47FqAbmd1lRZ99AZaXtuy2w==
X-Received: by 2002:a2e:2b9d:: with SMTP id r29mr48785251ljr.181.1564131717126; 
 Fri, 26 Jul 2019 02:01:57 -0700 (PDT)
Received: from 3489.kyiv.epam.com (ll-22.209.223.85.sovam.net.ua.
 [85.223.209.22])
 by smtp.gmail.com with ESMTPSA id v4sm9860626lji.103.2019.07.26.02.01.55
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 26 Jul 2019 02:01:56 -0700 (PDT)
From: Viktor Mitin <viktor.mitin.19@gmail.com>
To: xen-devel@lists.xenproject.org
Date: Fri, 26 Jul 2019 12:01:24 +0300
Message-Id: <20190726090124.26444-1-viktor.mitin.19@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [Xen-devel] [PATCH] xen/arm: extend fdt_property_interrupts
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

eGVuL2FybTogZXh0ZW5kIGZkdF9wcm9wZXJ0eV9pbnRlcnJ1cHRzIHRvIGRlYWwgd2l0aCBvdGhl
cgpkb21haW4gdGhhbiB0aGUgaHdkb20KClRlc3RlZCB3aXRoIGFhcmNoNjQgcWVtdSBkb20wIGFu
ZCBkb20wbGVzcyBib290LgoKU3VnZ2VzdGVkLWJ5OiBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFs
bEBhcm0uY29tPgpTaWduZWQtb2ZmLWJ5OiBWaWt0b3IgTWl0aW4gPHZpa3Rvcl9taXRpbkBlcGFt
LmNvbT4KCi0tLQpTZWUgZGlzY3Vzc2lvbiBpbiBtYWlsOgpbUEFUQ0hdIHhlbi9hcm06IG1lcmdl
IG1ha2VfdGltZXJfbm9kZSBhbmQgbWFrZV90aW1lcl9kb21VX25vZGUKCgogeGVuL2FyY2gvYXJt
L2RvbWFpbl9idWlsZC5jIHwgMjIgKysrKysrKysrKysrKy0tLS0tLS0tLQogMSBmaWxlIGNoYW5n
ZWQsIDEzIGluc2VydGlvbnMoKyksIDkgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2Fy
Y2gvYXJtL2RvbWFpbl9idWlsZC5jIGIveGVuL2FyY2gvYXJtL2RvbWFpbl9idWlsZC5jCmluZGV4
IDRjODQwNDE1NWEuLjVmNjg2MDMzOTIgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL2FybS9kb21haW5f
YnVpbGQuYworKysgYi94ZW4vYXJjaC9hcm0vZG9tYWluX2J1aWxkLmMKQEAgLTYyMSwxNyArNjIx
LDE5IEBAIHN0YXRpYyB2b2lkIF9faW5pdCBzZXRfaW50ZXJydXB0KGdpY19pbnRlcnJ1cHRfdCBp
bnRlcnJ1cHQsCiAgKiAgImludGVycnVwdHMiOiBjb250YWlucyB0aGUgbGlzdCBvZiBpbnRlcnJ1
cHRzCiAgKiAgImludGVycnVwdC1wYXJlbnQiOiBsaW5rIHRvIHRoZSBHSUMKICAqLwotc3RhdGlj
IGludCBfX2luaXQgZmR0X3Byb3BlcnR5X2ludGVycnVwdHModm9pZCAqZmR0LCBnaWNfaW50ZXJy
dXB0X3QgKmludHIsCi0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1
bnNpZ25lZCBudW1faXJxKQorc3RhdGljIGludCBfX2luaXQgZmR0X3Byb3BlcnR5X2ludGVycnVw
dHMoY29uc3Qgc3RydWN0IGtlcm5lbF9pbmZvICpraW5mbywKKyAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBnaWNfaW50ZXJydXB0X3QgKmludHIsIHVuc2lnbmVkIG51bV9pcnEpCiB7CiAgICAg
aW50IHJlczsKKyAgICB1aW50MzJfdCBwaGFuZGxlID0gaXNfaGFyZHdhcmVfZG9tYWluKGtpbmZv
LT5kKSA/IAorICAgICAgICAgICAgICAgICAgICAgICBkdF9pbnRlcnJ1cHRfY29udHJvbGxlci0+
cGhhbmRsZSA6IEdVRVNUX1BIQU5ETEVfR0lDOwogCi0gICAgcmVzID0gZmR0X3Byb3BlcnR5KGZk
dCwgImludGVycnVwdHMiLCBpbnRyLCBzaXplb2YgKGludHJbMF0pICogbnVtX2lycSk7CisgICAg
cmVzID0gZmR0X3Byb3BlcnR5KGtpbmZvLT5mZHQsICJpbnRlcnJ1cHRzIiwgCisgICAgICAgICAg
ICAgICAgICAgICAgIGludHIsIHNpemVvZiAoaW50clswXSkgKiBudW1faXJxKTsKICAgICBpZiAo
IHJlcyApCiAgICAgICAgIHJldHVybiByZXM7CiAKLSAgICByZXMgPSBmZHRfcHJvcGVydHlfY2Vs
bChmZHQsICJpbnRlcnJ1cHQtcGFyZW50IiwKLSAgICAgICAgICAgICAgICAgICAgICAgICAgICBk
dF9pbnRlcnJ1cHRfY29udHJvbGxlci0+cGhhbmRsZSk7CisgICAgcmVzID0gZmR0X3Byb3BlcnR5
X2NlbGwoa2luZm8tPmZkdCwgImludGVycnVwdC1wYXJlbnQiLCBwaGFuZGxlKTsKIAogICAgIHJl
dHVybiByZXM7CiB9CkBAIC03MzMsNyArNzM1LDcgQEAgc3RhdGljIGludCBfX2luaXQgbWFrZV9o
eXBlcnZpc29yX25vZGUoc3RydWN0IGRvbWFpbiAqZCwKICAgICAgKiAgVE9ETzogSGFuZGxlIHBy
b3Blcmx5IHRoZSBjcHVtYXNrOwogICAgICAqLwogICAgIHNldF9pbnRlcnJ1cHQoaW50ciwgZC0+
YXJjaC5ldnRjaG5faXJxLCAweGYsIERUX0lSUV9UWVBFX0xFVkVMX0xPVyk7Ci0gICAgcmVzID0g
ZmR0X3Byb3BlcnR5X2ludGVycnVwdHMoZmR0LCAmaW50ciwgMSk7CisgICAgcmVzID0gZmR0X3By
b3BlcnR5X2ludGVycnVwdHMoa2luZm8sICZpbnRyLCAxKTsKICAgICBpZiAoIHJlcyApCiAgICAg
ICAgIHJldHVybiByZXM7CiAKQEAgLTk2MCw4ICs5NjIsMTAgQEAgc3RhdGljIGludCBfX2luaXQg
bWFrZV9naWNfbm9kZShjb25zdCBzdHJ1Y3QgZG9tYWluICpkLCB2b2lkICpmZHQsCiAgICAgcmV0
dXJuIHJlczsKIH0KIAotc3RhdGljIGludCBfX2luaXQgbWFrZV90aW1lcl9ub2RlKGNvbnN0IHN0
cnVjdCBkb21haW4gKmQsIHZvaWQgKmZkdCkKK3N0YXRpYyBpbnQgX19pbml0IG1ha2VfdGltZXJf
bm9kZShjb25zdCBzdHJ1Y3Qga2VybmVsX2luZm8gKmtpbmZvKQogeworICAgIHZvaWQgKmZkdCA9
IGtpbmZvLT5mZHQ7CisKICAgICBzdGF0aWMgY29uc3Qgc3RydWN0IGR0X2RldmljZV9tYXRjaCB0
aW1lcl9pZHNbXSBfX2luaXRjb25zdCA9CiAgICAgewogICAgICAgICBEVF9NQVRDSF9DT01QQVRJ
QkxFKCJhcm0sYXJtdjctdGltZXIiKSwKQEAgLTEwMTYsNyArMTAyMCw3IEBAIHN0YXRpYyBpbnQg
X19pbml0IG1ha2VfdGltZXJfbm9kZShjb25zdCBzdHJ1Y3QgZG9tYWluICpkLCB2b2lkICpmZHQp
CiAgICAgZHRfZHByaW50aygiICBWaXJ0IGludGVycnVwdCAldVxuIiwgaXJxKTsKICAgICBzZXRf
aW50ZXJydXB0KGludHJzWzJdLCBpcnEsIDB4ZiwgRFRfSVJRX1RZUEVfTEVWRUxfTE9XKTsKIAot
ICAgIHJlcyA9IGZkdF9wcm9wZXJ0eV9pbnRlcnJ1cHRzKGZkdCwgaW50cnMsIDMpOworICAgIHJl
cyA9IGZkdF9wcm9wZXJ0eV9pbnRlcnJ1cHRzKGtpbmZvLCBpbnRycywgMyk7CiAgICAgaWYgKCBy
ZXMgKQogICAgICAgICByZXR1cm4gcmVzOwogCkBAIC0xMzc3LDcgKzEzODEsNyBAQCBzdGF0aWMg
aW50IF9faW5pdCBoYW5kbGVfbm9kZShzdHJ1Y3QgZG9tYWluICpkLCBzdHJ1Y3Qga2VybmVsX2lu
Zm8gKmtpbmZvLAogICAgIGlmICggZGV2aWNlX2dldF9jbGFzcyhub2RlKSA9PSBERVZJQ0VfR0lD
ICkKICAgICAgICAgcmV0dXJuIG1ha2VfZ2ljX25vZGUoZCwga2luZm8tPmZkdCwgbm9kZSk7CiAg
ICAgaWYgKCBkdF9tYXRjaF9ub2RlKHRpbWVyX21hdGNoZXMsIG5vZGUpICkKLSAgICAgICAgcmV0
dXJuIG1ha2VfdGltZXJfbm9kZShkLCBraW5mby0+ZmR0KTsKKyAgICAgICAgcmV0dXJuIG1ha2Vf
dGltZXJfbm9kZShraW5mbyk7CiAKICAgICAvKiBTa2lwIG5vZGVzIHVzZWQgYnkgWGVuICovCiAg
ICAgaWYgKCBkdF9kZXZpY2VfdXNlZF9ieShub2RlKSA9PSBET01JRF9YRU4gKQotLSAKMi4xNy4x
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
