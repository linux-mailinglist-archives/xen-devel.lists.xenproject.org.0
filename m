Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 03F3A8492C
	for <lists+xen-devel@lfdr.de>; Wed,  7 Aug 2019 12:12:59 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hvIu2-00034i-2u; Wed, 07 Aug 2019 10:10:42 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=EA5+=WD=gmail.com=viktor.mitin.19@srs-us1.protection.inumbo.net>)
 id 1hvIu0-00034X-4i
 for xen-devel@lists.xenproject.org; Wed, 07 Aug 2019 10:10:40 +0000
X-Inumbo-ID: 9a86d2e8-b8fb-11e9-8980-bc764e045a96
Received: from mail-lf1-x144.google.com (unknown [2a00:1450:4864:20::144])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 9a86d2e8-b8fb-11e9-8980-bc764e045a96;
 Wed, 07 Aug 2019 10:10:38 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id c9so63545038lfh.4
 for <xen-devel@lists.xenproject.org>; Wed, 07 Aug 2019 03:10:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=lGDiRJRji0vbjMC2OsRWlZM/pXyQ4/dod5m8XUfYBw0=;
 b=AgqPkTcHFqqSVS7qnZ+T45cXpIciANXih3qmZ49UuASQuMZQJMYmm1n05XtEZE0KFW
 KMkS7IBq4D0ClxznGIUKEbZE1mdIrQnU7BCfpYC1mkSeQF/76A4x1kW+/rP4cHT4mhFP
 EwvKg1fQvyl87wwZNr16Ipsyd1b2/AniTuAkKDg4EH8h/DE+Zk/Dmxb5IyLZFsL0eiTI
 SCb7kY//Lve3rXO1YMgcD9ImKbuhK1iV8EKio9Jz8oM1cwQ9KK73jbHLau7b8wNpH4i9
 c+Ra+byeFdNAjjGG+uADmrDra84lL0fSGb8/MveToPHfGWcvy794Y0kSQIqv+HNObl8d
 jD7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=lGDiRJRji0vbjMC2OsRWlZM/pXyQ4/dod5m8XUfYBw0=;
 b=qHQXb4iI5RWmqMmmDbJaqFt1unoi9YuyYwjylfcFiS2MZNhSDx89c3ufQejQ6wtwvh
 zNbZuhGoOh9OXnHc68ITxGRHzTcRUKEdvVLMlp0bWkwjrhKmDU2DRk/OWiUiEOZxTmjP
 zFEY65/v3TYVSzlCHSvW9RIR2cG9KFoL3TNk+HohpPh6Cx6EL9+9EB8GwV3JIY2258rK
 1rPFph77vkojV0aSbhN4QXgFMiGVBHOSMHdHqk0n9pS3iX57/U29QrG7NeVxvf4Tx8Ia
 3c3T1MEtg7qABKlBgShH4tmw/9tbksI/oWFo+dPnZRoL/gToUv+yMnmQ5hHIg6HEfD3t
 TL+g==
X-Gm-Message-State: APjAAAUGEa1cM4p9wejA9bA3BSZlKZAFBCTE8MkyHSMriOXpmmpMVwXt
 QsORFKdMeyCQ6K/thE6NHvKt/znV
X-Google-Smtp-Source: APXvYqwrsomBwEUJKV/puVPWMk/qCTKW1/dU9/XqkKUiNwdG02HZ1PzIZRvZVRuHTVfzIzF1B9oBhg==
X-Received: by 2002:a19:5f46:: with SMTP id a6mr5611891lfj.142.1565172637358; 
 Wed, 07 Aug 2019 03:10:37 -0700 (PDT)
Received: from 3489.kyiv.epam.com (ll-22.209.223.85.sovam.net.ua.
 [85.223.209.22])
 by smtp.gmail.com with ESMTPSA id n24sm18384408ljc.25.2019.08.07.03.10.36
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 07 Aug 2019 03:10:36 -0700 (PDT)
From: Viktor Mitin <viktor.mitin.19@gmail.com>
To: xen-devel@lists.xenproject.org
Date: Wed,  7 Aug 2019 13:10:27 +0300
Message-Id: <20190807101028.28778-2-viktor.mitin.19@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190807101028.28778-1-viktor.mitin.19@gmail.com>
References: <20190807101028.28778-1-viktor.mitin.19@gmail.com>
Subject: [Xen-devel] [PATCH v7 1/2] xen/arm: extend fdt_property_interrupts
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
b2ZmLWJ5OiBWaWt0b3IgTWl0aW4gPHZpa3Rvcl9taXRpbkBlcGFtLmNvbT4KUmV2aWV3ZWQtYnk6
IFZvbG9keW15ciBCYWJjaHVrIDx2b2xvZHlteXJfYmFiY2h1a0BlcGFtLmNvbT4KLS0tCnY3OiBy
ZW1vdmVkIGV4dHJhIHNwYWNlIGFmdGVyIHNpemVvZiBpbiBmZHRfcHJvcGVydHlfaW50ZXJydXB0
cygpCi0tLQogeGVuL2FyY2gvYXJtL2RvbWFpbl9idWlsZC5jIHwgMjAgKysrKysrKysrKysrLS0t
LS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAxMiBpbnNlcnRpb25zKCspLCA4IGRlbGV0aW9ucygtKQoK
ZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9kb21haW5fYnVpbGQuYyBiL3hlbi9hcmNoL2FybS9k
b21haW5fYnVpbGQuYwppbmRleCA0Yzg0MDQxNTVhLi4yNmNkMGFlMTJjIDEwMDY0NAotLS0gYS94
ZW4vYXJjaC9hcm0vZG9tYWluX2J1aWxkLmMKKysrIGIveGVuL2FyY2gvYXJtL2RvbWFpbl9idWls
ZC5jCkBAIC02MjEsMTcgKzYyMSwyMCBAQCBzdGF0aWMgdm9pZCBfX2luaXQgc2V0X2ludGVycnVw
dChnaWNfaW50ZXJydXB0X3QgaW50ZXJydXB0LAogICogICJpbnRlcnJ1cHRzIjogY29udGFpbnMg
dGhlIGxpc3Qgb2YgaW50ZXJydXB0cwogICogICJpbnRlcnJ1cHQtcGFyZW50IjogbGluayB0byB0
aGUgR0lDCiAgKi8KLXN0YXRpYyBpbnQgX19pbml0IGZkdF9wcm9wZXJ0eV9pbnRlcnJ1cHRzKHZv
aWQgKmZkdCwgZ2ljX2ludGVycnVwdF90ICppbnRyLAorc3RhdGljIGludCBfX2luaXQgZmR0X3By
b3BlcnR5X2ludGVycnVwdHMoY29uc3Qgc3RydWN0IGtlcm5lbF9pbmZvICpraW5mbywKKyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGdpY19pbnRlcnJ1cHRfdCAqaW50
ciwKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIG51
bV9pcnEpCiB7CiAgICAgaW50IHJlczsKKyAgICB1aW50MzJfdCBwaGFuZGxlID0gaXNfaGFyZHdh
cmVfZG9tYWluKGtpbmZvLT5kKSA/CisgICAgICAgICAgICAgICAgICAgICAgIGR0X2ludGVycnVw
dF9jb250cm9sbGVyLT5waGFuZGxlIDogR1VFU1RfUEhBTkRMRV9HSUM7CiAKLSAgICByZXMgPSBm
ZHRfcHJvcGVydHkoZmR0LCAiaW50ZXJydXB0cyIsIGludHIsIHNpemVvZiAoaW50clswXSkgKiBu
dW1faXJxKTsKKyAgICByZXMgPSBmZHRfcHJvcGVydHkoa2luZm8tPmZkdCwgImludGVycnVwdHMi
LAorICAgICAgICAgICAgICAgICAgICAgICBpbnRyLCBzaXplb2YoaW50clswXSkgKiBudW1faXJx
KTsKICAgICBpZiAoIHJlcyApCiAgICAgICAgIHJldHVybiByZXM7CiAKLSAgICByZXMgPSBmZHRf
cHJvcGVydHlfY2VsbChmZHQsICJpbnRlcnJ1cHQtcGFyZW50IiwKLSAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBkdF9pbnRlcnJ1cHRfY29udHJvbGxlci0+cGhhbmRsZSk7CisgICAgcmVzID0g
ZmR0X3Byb3BlcnR5X2NlbGwoa2luZm8tPmZkdCwgImludGVycnVwdC1wYXJlbnQiLCBwaGFuZGxl
KTsKIAogICAgIHJldHVybiByZXM7CiB9CkBAIC03MzMsNyArNzM2LDcgQEAgc3RhdGljIGludCBf
X2luaXQgbWFrZV9oeXBlcnZpc29yX25vZGUoc3RydWN0IGRvbWFpbiAqZCwKICAgICAgKiAgVE9E
TzogSGFuZGxlIHByb3Blcmx5IHRoZSBjcHVtYXNrOwogICAgICAqLwogICAgIHNldF9pbnRlcnJ1
cHQoaW50ciwgZC0+YXJjaC5ldnRjaG5faXJxLCAweGYsIERUX0lSUV9UWVBFX0xFVkVMX0xPVyk7
Ci0gICAgcmVzID0gZmR0X3Byb3BlcnR5X2ludGVycnVwdHMoZmR0LCAmaW50ciwgMSk7CisgICAg
cmVzID0gZmR0X3Byb3BlcnR5X2ludGVycnVwdHMoa2luZm8sICZpbnRyLCAxKTsKICAgICBpZiAo
IHJlcyApCiAgICAgICAgIHJldHVybiByZXM7CiAKQEAgLTk2MCw4ICs5NjMsOSBAQCBzdGF0aWMg
aW50IF9faW5pdCBtYWtlX2dpY19ub2RlKGNvbnN0IHN0cnVjdCBkb21haW4gKmQsIHZvaWQgKmZk
dCwKICAgICByZXR1cm4gcmVzOwogfQogCi1zdGF0aWMgaW50IF9faW5pdCBtYWtlX3RpbWVyX25v
ZGUoY29uc3Qgc3RydWN0IGRvbWFpbiAqZCwgdm9pZCAqZmR0KQorc3RhdGljIGludCBfX2luaXQg
bWFrZV90aW1lcl9ub2RlKGNvbnN0IHN0cnVjdCBrZXJuZWxfaW5mbyAqa2luZm8pCiB7CisgICAg
dm9pZCAqZmR0ID0ga2luZm8tPmZkdDsKICAgICBzdGF0aWMgY29uc3Qgc3RydWN0IGR0X2Rldmlj
ZV9tYXRjaCB0aW1lcl9pZHNbXSBfX2luaXRjb25zdCA9CiAgICAgewogICAgICAgICBEVF9NQVRD
SF9DT01QQVRJQkxFKCJhcm0sYXJtdjctdGltZXIiKSwKQEAgLTEwMTYsNyArMTAyMCw3IEBAIHN0
YXRpYyBpbnQgX19pbml0IG1ha2VfdGltZXJfbm9kZShjb25zdCBzdHJ1Y3QgZG9tYWluICpkLCB2
b2lkICpmZHQpCiAgICAgZHRfZHByaW50aygiICBWaXJ0IGludGVycnVwdCAldVxuIiwgaXJxKTsK
ICAgICBzZXRfaW50ZXJydXB0KGludHJzWzJdLCBpcnEsIDB4ZiwgRFRfSVJRX1RZUEVfTEVWRUxf
TE9XKTsKIAotICAgIHJlcyA9IGZkdF9wcm9wZXJ0eV9pbnRlcnJ1cHRzKGZkdCwgaW50cnMsIDMp
OworICAgIHJlcyA9IGZkdF9wcm9wZXJ0eV9pbnRlcnJ1cHRzKGtpbmZvLCBpbnRycywgMyk7CiAg
ICAgaWYgKCByZXMgKQogICAgICAgICByZXR1cm4gcmVzOwogCkBAIC0xMzc3LDcgKzEzODEsNyBA
QCBzdGF0aWMgaW50IF9faW5pdCBoYW5kbGVfbm9kZShzdHJ1Y3QgZG9tYWluICpkLCBzdHJ1Y3Qg
a2VybmVsX2luZm8gKmtpbmZvLAogICAgIGlmICggZGV2aWNlX2dldF9jbGFzcyhub2RlKSA9PSBE
RVZJQ0VfR0lDICkKICAgICAgICAgcmV0dXJuIG1ha2VfZ2ljX25vZGUoZCwga2luZm8tPmZkdCwg
bm9kZSk7CiAgICAgaWYgKCBkdF9tYXRjaF9ub2RlKHRpbWVyX21hdGNoZXMsIG5vZGUpICkKLSAg
ICAgICAgcmV0dXJuIG1ha2VfdGltZXJfbm9kZShkLCBraW5mby0+ZmR0KTsKKyAgICAgICAgcmV0
dXJuIG1ha2VfdGltZXJfbm9kZShraW5mbyk7CiAKICAgICAvKiBTa2lwIG5vZGVzIHVzZWQgYnkg
WGVuICovCiAgICAgaWYgKCBkdF9kZXZpY2VfdXNlZF9ieShub2RlKSA9PSBET01JRF9YRU4gKQot
LSAKMi4xNy4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
