Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FC5A84C33
	for <lists+xen-devel@lfdr.de>; Wed,  7 Aug 2019 15:00:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hvLVx-0001A0-Rg; Wed, 07 Aug 2019 12:58:01 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=EA5+=WD=gmail.com=viktor.mitin.19@srs-us1.protection.inumbo.net>)
 id 1hvLVw-00019m-OW
 for xen-devel@lists.xenproject.org; Wed, 07 Aug 2019 12:58:00 +0000
X-Inumbo-ID: fb3c7188-b912-11e9-8980-bc764e045a96
Received: from mail-lf1-x141.google.com (unknown [2a00:1450:4864:20::141])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id fb3c7188-b912-11e9-8980-bc764e045a96;
 Wed, 07 Aug 2019 12:57:59 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id c19so63967688lfm.10
 for <xen-devel@lists.xenproject.org>; Wed, 07 Aug 2019 05:57:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=5y3iK51qj3Kq5F8uJHax4WgYRigra800VfBRcNZdmyw=;
 b=HjWGm1we3B0FTfax1mOzEm3D4XS7j1fDbND0S2G20zqXm1q9oQSYyA494OCo4MIEkS
 8JYnpCdrx6wIW9I+X3TGPTLf7dvo0WzhZR9tDVSe97JfiX4HIM6J5Q6m4HA/aOmr4lRF
 lDAFOPceBFahq8h/7ll5IzUnEiybFh38hssLRmjm8e3AeowU00XOelgJqfgGJ2QRu2K9
 FrRR4/P0Bm5KdyTK9QewAN1Pr3ccP/UhlTPkhTynighBhcK9hR1FtMTG+41uBxhoimDK
 IvCDvHHdk1D2QEjORgCBPOdrKXH0NYLLeq1+PlPq5znulpjdwDMx2/MWJn23+cixeZEs
 ciwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=5y3iK51qj3Kq5F8uJHax4WgYRigra800VfBRcNZdmyw=;
 b=ax25m15mlkuZeZf9jxpFsL1Zbm0okqdZMdtdt/gorSG0BnVI1ajFM0Q+O/h6h4ZhsP
 6eI4rc+S/VRjx1QLsieUS7ylCFS3F+yXE2ikq84ZOOSPixZRKA5MijElpP9F23S+5VQB
 WQR+0oj1mca3lwlSAX9XLHlbRRFIcTkU6i9GYf1LPNZSCYRdDp8gOrJ+bzZ+BvGnfbAp
 ZSiQ7iHWV5QWj9Vj6T24ThPL073Um7oHsUDcPje9vKz7i677yVVSvt6m9vEidXiL8rqJ
 LfUyqJ0EYXXbdEU8EqbAzpcogmMAo9jHEeJnXDIW/bK9ZqWjJtbjwmSn/s9w3qWz9by7
 Ihkg==
X-Gm-Message-State: APjAAAU/9f5T/sgDDmQ0eEaJfVjZVpJg/ztoU/b7/RxIlti9si8QKQyk
 0wu0L8YL7dLliW6aKtJkmu6hh3X1
X-Google-Smtp-Source: APXvYqynZRwgXTTYcAy9gbDtvjstzHx+0/m2dGOjgudAoVXD11sZP6uFV7z6/XJ3XXM5M1y1AwBa/w==
X-Received: by 2002:a19:c150:: with SMTP id r77mr6187569lff.76.1565182677979; 
 Wed, 07 Aug 2019 05:57:57 -0700 (PDT)
Received: from 3489.kyiv.epam.com ([178.133.153.36])
 by smtp.gmail.com with ESMTPSA id a15sm2033220lfo.2.2019.08.07.05.57.56
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 07 Aug 2019 05:57:57 -0700 (PDT)
From: Viktor Mitin <viktor.mitin.19@gmail.com>
To: xen-devel@lists.xenproject.org
Date: Wed,  7 Aug 2019 15:57:24 +0300
Message-Id: <20190807125725.31683-2-viktor.mitin.19@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190807125725.31683-1-viktor.mitin.19@gmail.com>
References: <20190807125725.31683-1-viktor.mitin.19@gmail.com>
Subject: [Xen-devel] [PATCH v8 1/2] xen/arm: extend fdt_property_interrupts
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
Cc: Viktor Mitin <viktor_mitin@epam.com>, Julien Grall <julien.grall@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Viktor Mitin <viktor.mitin.19@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlIGRvbWFpbiBhbmQgZmR0IGNhbiBiZSBmb3VuZCBpbiB0aGUgc3RydWN0dXJlIGtpbmZvLgpS
YXRoZXIgdGhhbiBhZGRpbmcgYSBhbiBleHRyYSBhcmd1bWVudCBmb3IgdGhlIGRvbWFpbiwgcGFz
cyBkaXJlY3RseSBraW5mby4KVGhpcyBhbHNvIHJlcXVpcmVzIHRvIGFkYXB0IGZkdF9wcm9wZXJ0
eV9pbnRlcnJ1cHRzKCkgcHJvdG90eXBlLgpBIGZvbGxvdy11cCBwYXRjaCB3aWxsIG5lZWQgdG8g
Y3JlYXRlIHRoZSBpbnRlcnJ1cHRzIGZvciBlaXRoZXIgRG9tMCBvciBEb21VLgoKU3VnZ2VzdGVk
LWJ5OiBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPgpTaWduZWQtb2ZmLWJ5OiBW
aWt0b3IgTWl0aW4gPHZpa3Rvcl9taXRpbkBlcGFtLmNvbT4KUmV2aWV3ZWQtYnk6IFZvbG9keW15
ciBCYWJjaHVrIDx2b2xvZHlteXJfYmFiY2h1a0BlcGFtLmNvbT4KLS0tCnY3OiByZW1vdmVkIGV4
dHJhIHNwYWNlIGFmdGVyIHNpemVvZiBpbiBmZHRfcHJvcGVydHlfaW50ZXJydXB0cygpCnY4OiB1
cGRhdGVkIGNvbW1pdCBtZXNzYWdlCi0tLQogeGVuL2FyY2gvYXJtL2RvbWFpbl9idWlsZC5jIHwg
MjAgKysrKysrKysrKysrLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAxMiBpbnNlcnRpb25zKCsp
LCA4IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9kb21haW5fYnVpbGQu
YyBiL3hlbi9hcmNoL2FybS9kb21haW5fYnVpbGQuYwppbmRleCA0Yzg0MDQxNTVhLi4yNmNkMGFl
MTJjIDEwMDY0NAotLS0gYS94ZW4vYXJjaC9hcm0vZG9tYWluX2J1aWxkLmMKKysrIGIveGVuL2Fy
Y2gvYXJtL2RvbWFpbl9idWlsZC5jCkBAIC02MjEsMTcgKzYyMSwyMCBAQCBzdGF0aWMgdm9pZCBf
X2luaXQgc2V0X2ludGVycnVwdChnaWNfaW50ZXJydXB0X3QgaW50ZXJydXB0LAogICogICJpbnRl
cnJ1cHRzIjogY29udGFpbnMgdGhlIGxpc3Qgb2YgaW50ZXJydXB0cwogICogICJpbnRlcnJ1cHQt
cGFyZW50IjogbGluayB0byB0aGUgR0lDCiAgKi8KLXN0YXRpYyBpbnQgX19pbml0IGZkdF9wcm9w
ZXJ0eV9pbnRlcnJ1cHRzKHZvaWQgKmZkdCwgZ2ljX2ludGVycnVwdF90ICppbnRyLAorc3RhdGlj
IGludCBfX2luaXQgZmR0X3Byb3BlcnR5X2ludGVycnVwdHMoY29uc3Qgc3RydWN0IGtlcm5lbF9p
bmZvICpraW5mbywKKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGdp
Y19pbnRlcnJ1cHRfdCAqaW50ciwKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIHVuc2lnbmVkIG51bV9pcnEpCiB7CiAgICAgaW50IHJlczsKKyAgICB1aW50MzJfdCBw
aGFuZGxlID0gaXNfaGFyZHdhcmVfZG9tYWluKGtpbmZvLT5kKSA/CisgICAgICAgICAgICAgICAg
ICAgICAgIGR0X2ludGVycnVwdF9jb250cm9sbGVyLT5waGFuZGxlIDogR1VFU1RfUEhBTkRMRV9H
SUM7CiAKLSAgICByZXMgPSBmZHRfcHJvcGVydHkoZmR0LCAiaW50ZXJydXB0cyIsIGludHIsIHNp
emVvZiAoaW50clswXSkgKiBudW1faXJxKTsKKyAgICByZXMgPSBmZHRfcHJvcGVydHkoa2luZm8t
PmZkdCwgImludGVycnVwdHMiLAorICAgICAgICAgICAgICAgICAgICAgICBpbnRyLCBzaXplb2Yo
aW50clswXSkgKiBudW1faXJxKTsKICAgICBpZiAoIHJlcyApCiAgICAgICAgIHJldHVybiByZXM7
CiAKLSAgICByZXMgPSBmZHRfcHJvcGVydHlfY2VsbChmZHQsICJpbnRlcnJ1cHQtcGFyZW50IiwK
LSAgICAgICAgICAgICAgICAgICAgICAgICAgICBkdF9pbnRlcnJ1cHRfY29udHJvbGxlci0+cGhh
bmRsZSk7CisgICAgcmVzID0gZmR0X3Byb3BlcnR5X2NlbGwoa2luZm8tPmZkdCwgImludGVycnVw
dC1wYXJlbnQiLCBwaGFuZGxlKTsKIAogICAgIHJldHVybiByZXM7CiB9CkBAIC03MzMsNyArNzM2
LDcgQEAgc3RhdGljIGludCBfX2luaXQgbWFrZV9oeXBlcnZpc29yX25vZGUoc3RydWN0IGRvbWFp
biAqZCwKICAgICAgKiAgVE9ETzogSGFuZGxlIHByb3Blcmx5IHRoZSBjcHVtYXNrOwogICAgICAq
LwogICAgIHNldF9pbnRlcnJ1cHQoaW50ciwgZC0+YXJjaC5ldnRjaG5faXJxLCAweGYsIERUX0lS
UV9UWVBFX0xFVkVMX0xPVyk7Ci0gICAgcmVzID0gZmR0X3Byb3BlcnR5X2ludGVycnVwdHMoZmR0
LCAmaW50ciwgMSk7CisgICAgcmVzID0gZmR0X3Byb3BlcnR5X2ludGVycnVwdHMoa2luZm8sICZp
bnRyLCAxKTsKICAgICBpZiAoIHJlcyApCiAgICAgICAgIHJldHVybiByZXM7CiAKQEAgLTk2MCw4
ICs5NjMsOSBAQCBzdGF0aWMgaW50IF9faW5pdCBtYWtlX2dpY19ub2RlKGNvbnN0IHN0cnVjdCBk
b21haW4gKmQsIHZvaWQgKmZkdCwKICAgICByZXR1cm4gcmVzOwogfQogCi1zdGF0aWMgaW50IF9f
aW5pdCBtYWtlX3RpbWVyX25vZGUoY29uc3Qgc3RydWN0IGRvbWFpbiAqZCwgdm9pZCAqZmR0KQor
c3RhdGljIGludCBfX2luaXQgbWFrZV90aW1lcl9ub2RlKGNvbnN0IHN0cnVjdCBrZXJuZWxfaW5m
byAqa2luZm8pCiB7CisgICAgdm9pZCAqZmR0ID0ga2luZm8tPmZkdDsKICAgICBzdGF0aWMgY29u
c3Qgc3RydWN0IGR0X2RldmljZV9tYXRjaCB0aW1lcl9pZHNbXSBfX2luaXRjb25zdCA9CiAgICAg
ewogICAgICAgICBEVF9NQVRDSF9DT01QQVRJQkxFKCJhcm0sYXJtdjctdGltZXIiKSwKQEAgLTEw
MTYsNyArMTAyMCw3IEBAIHN0YXRpYyBpbnQgX19pbml0IG1ha2VfdGltZXJfbm9kZShjb25zdCBz
dHJ1Y3QgZG9tYWluICpkLCB2b2lkICpmZHQpCiAgICAgZHRfZHByaW50aygiICBWaXJ0IGludGVy
cnVwdCAldVxuIiwgaXJxKTsKICAgICBzZXRfaW50ZXJydXB0KGludHJzWzJdLCBpcnEsIDB4Ziwg
RFRfSVJRX1RZUEVfTEVWRUxfTE9XKTsKIAotICAgIHJlcyA9IGZkdF9wcm9wZXJ0eV9pbnRlcnJ1
cHRzKGZkdCwgaW50cnMsIDMpOworICAgIHJlcyA9IGZkdF9wcm9wZXJ0eV9pbnRlcnJ1cHRzKGtp
bmZvLCBpbnRycywgMyk7CiAgICAgaWYgKCByZXMgKQogICAgICAgICByZXR1cm4gcmVzOwogCkBA
IC0xMzc3LDcgKzEzODEsNyBAQCBzdGF0aWMgaW50IF9faW5pdCBoYW5kbGVfbm9kZShzdHJ1Y3Qg
ZG9tYWluICpkLCBzdHJ1Y3Qga2VybmVsX2luZm8gKmtpbmZvLAogICAgIGlmICggZGV2aWNlX2dl
dF9jbGFzcyhub2RlKSA9PSBERVZJQ0VfR0lDICkKICAgICAgICAgcmV0dXJuIG1ha2VfZ2ljX25v
ZGUoZCwga2luZm8tPmZkdCwgbm9kZSk7CiAgICAgaWYgKCBkdF9tYXRjaF9ub2RlKHRpbWVyX21h
dGNoZXMsIG5vZGUpICkKLSAgICAgICAgcmV0dXJuIG1ha2VfdGltZXJfbm9kZShkLCBraW5mby0+
ZmR0KTsKKyAgICAgICAgcmV0dXJuIG1ha2VfdGltZXJfbm9kZShraW5mbyk7CiAKICAgICAvKiBT
a2lwIG5vZGVzIHVzZWQgYnkgWGVuICovCiAgICAgaWYgKCBkdF9kZXZpY2VfdXNlZF9ieShub2Rl
KSA9PSBET01JRF9YRU4gKQotLSAKMi4xNy4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
