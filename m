Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DDC77566D4
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jun 2019 12:33:23 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hg5CK-0007dJ-Tn; Wed, 26 Jun 2019 10:30:40 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=GqiY=UZ=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1hg5CI-0007d3-SS
 for xen-devel@lists.xenproject.org; Wed, 26 Jun 2019 10:30:38 +0000
X-Inumbo-ID: 6fde3054-97fd-11e9-8980-bc764e045a96
Received: from mail-lj1-x244.google.com (unknown [2a00:1450:4864:20::244])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 6fde3054-97fd-11e9-8980-bc764e045a96;
 Wed, 26 Jun 2019 10:30:37 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id x25so1651662ljh.2
 for <xen-devel@lists.xenproject.org>; Wed, 26 Jun 2019 03:30:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=o594tsTTlDMKulY38b0IZ6O5X8+yc+r60LXpP5ekek8=;
 b=bFiR4XxqO6EqnFr+UoMPZK1wtKDv0RN+sqezLRlKzVyA9sKPerAGd+iNN/auZguidf
 FqpRMTbB6VGsI/4NGJPYQeD5NsdsOsIjUaSO4/y1ojKUprWYKVfEkyyaLDVkRCwpjjNi
 evoN+vwxqx0zOfVXVJylfz2kG2yf951VViArgTUDsg9mRXVuZMPmm3UErp7XEKdue816
 CUjWH0CfJ/WWbVJbG68WAzDs19msEG13DSKOQfKGtL47SQCyrpbXmfdpYhIKA1BDp7Rl
 oZaXHXGPytLUky8JMZ/S2NPUAuAlJ5UjGm5ZEc2F/hziBpvMaW/ZD/gzFEBHpCQTVJYo
 7u2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=o594tsTTlDMKulY38b0IZ6O5X8+yc+r60LXpP5ekek8=;
 b=mXQfj7TmsG7NNiTDbHh2fgh4XbTHtpuKxhk4L3EZx+hZvKhM4oflckKIa8yTeAnseJ
 b457hzmd5T4tzJBtOVg40hWwPZ/lQ2JzThra3nkPUcKYo94m0oDX+GYgh2IF0u7Jf5WU
 +GhrvLr/9/73Kc/ld7Mk3h31KlNBygkQH+SPsxUoHu6mleZ4uMDtyIRsP87mLCDqvy5H
 RRdLuQdumn3G++JlKuh2acoB+hj5jajsdIEY0CFiqU7XcjYe5vJEoQOj4e+QRqiE37TF
 FKbaPtPIa0ZxtizeEefgVp6a3R+pHYZXZ6p4jkT+RgDzfHtRK8jrfhXElyyvnt25Si/e
 jypA==
X-Gm-Message-State: APjAAAXLmbx359ZjCiDbLKKuMIx2MqIxnsY8MUJzCpzObjLjaG3Rbtvj
 dVLUPPTCuSThMrq/5GkTFP/0jV3Z
X-Google-Smtp-Source: APXvYqyBPE13ec3r3BPZA9wPXSYjLbtLogxIVtGhP1aZ/9yv6aPzmvQha3/aXqF5tiWHcEeZw/1vBg==
X-Received: by 2002:a2e:730d:: with SMTP id o13mr2295176ljc.81.1561545036344; 
 Wed, 26 Jun 2019 03:30:36 -0700 (PDT)
Received: from otyshchenko.kyiv.epam.com (ll-22.209.223.85.sovam.net.ua.
 [85.223.209.22])
 by smtp.gmail.com with ESMTPSA id k8sm2754853lja.24.2019.06.26.03.30.35
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Wed, 26 Jun 2019 03:30:35 -0700 (PDT)
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
To: xen-devel@lists.xenproject.org
Date: Wed, 26 Jun 2019 13:30:08 +0300
Message-Id: <1561545009-17493-1-git-send-email-olekstysh@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [Xen-devel] [PATCH V1] iommu/arm: Add Renesas IPMMU-VMSA support
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
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, julien.grall@arm.com,
 sstabellini@kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogT2xla3NhbmRyIFR5c2hjaGVua28gPG9sZWtzYW5kcl90eXNoY2hlbmtvQGVwYW0uY29t
PgoKVGhlIHB1cnBvc2Ugb2YgdGhpcyBwYXRjaCBpcyB0byBhZGQgSVBNTVUtVk1TQSBzdXBwb3J0
IHRvIFhlbiBvbiBBUk0uCgpUaGUgSVBNTVUtVk1TQSBpcyBWTVNBLWNvbXBhdGlibGUgSS9PIE1l
bW9yeSBNYW5hZ2VtZW50IFVuaXQgKElPTU1VKQp3aGljaCBwcm92aWRlcyBhZGRyZXNzIHRyYW5z
bGF0aW9uIGFuZCBhY2Nlc3MgcHJvdGVjdGlvbiBmdW5jdGlvbmFsaXRpZXMKdG8gcHJvY2Vzc2lu
ZyB1bml0cyBhbmQgaW50ZXJjb25uZWN0IG5ldHdvcmtzLgoKUGxlYXNlIG5vdGUsIHRoaXMgZHJp
dmVyIGlzIHN1cHBvc2VkIHRvIHdvcmsgb25seSB3aXRoIG5ld2VzdApHZW4zIFNvQ3MgcmV2aXNp
b25zIHdoaWNoIElQTU1VIGhhcmR3YXJlIHN1cHBvcnRzIHN0YWdlIDIgdHJhbnNsYXRpb24KdGFi
bGUgZm9ybWF0IGFuZCBpcyBhYmxlIHRvIHVzZSBDUFUncyBQMk0gdGFibGUgYXMgaXMgaWYgb25l
IGlzCjMtbGV2ZWwgcGFnZSB0YWJsZSAodXAgdG8gNDAgYml0IElQQSkuCgpUaGlzIGRyaXZlciBp
cyBiYXNlZCBvbiBMaW51eCdzIElQTU1VLVZNU0EgZHJpdmVyIGZyb20gUmVuZXNhcyBCU1A6Cmh0
dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L2hvcm1zL3JlbmVz
YXMtYnNwLmdpdC90cmVlL2RyaXZlcnMvaW9tbXUvaXBtbXUtdm1zYS5jP2g9djQuMTQuNzUtbHRz
aS9yY2FyLTMuOS4yCmFuZCBYZW4ncyBTTU1VIGRyaXZlcjoKeGVuL2RyaXZlcnMvcGFzc3Rocm91
Z2gvYXJtL3NtbXUuYwoKQWx0aG91Z2ggWGVuIGRyaXZlciBoYXMgYSBsb3QgaW4gY29tbW9uIHdp
dGggTGludXggZHJpdmVyLCBpdCBpcyBub3QKYSAiZGlyZWN0IHBvcnRlZCIgY29weSBhbmQgc2hv
dWxkIGJlIHRyZWF0ZWQgYXMgc3VjaC4KCkRyaXZlciB3YXMgdGVzdGVkIG9uIEdlbjMgSDMgRVMz
LjAgYmFzZWQgYm9hcmRzIHVzaW5nIGN1cnJlbnQgc3RhZ2luZwooN2QxNDYwYyB4ZW4vYXJtOiBv
cHRlZTogZml4IGNvbXBpbGF0aW9uIHdpdGggR0NDIDQuOCkKaW4gYSBzeXN0ZW0gd2l0aCBzZXZl
cmFsIERNQSBtYXN0ZXJzIGJlaW5nIGFzc2lnbmVkIHRvIGRpZmZlcmVudCBndWVzdCBkb21haW5z
LgoKWW91IGNhbiBmaW5kIGl0IGhlcmU6CnJlcG86IGh0dHBzOi8vZ2l0aHViLmNvbS9vdHlzaGNo
ZW5rbzEveGVuLmdpdCBicmFuY2g6IGlwbW11X3Vwc3RyZWFtMQoKT2xla3NhbmRyIFR5c2hjaGVu
a28gKDEpOgogIGlvbW11L2FybTogQWRkIFJlbmVzYXMgSVBNTVUtVk1TQSBzdXBwb3J0CgogeGVu
L2FyY2gvYXJtL3BsYXRmb3Jtcy9LY29uZmlnICAgICAgICAgICB8ICAgIDEgKwogeGVuL2RyaXZl
cnMvcGFzc3Rocm91Z2gvS2NvbmZpZyAgICAgICAgICB8ICAgMTMgKwogeGVuL2RyaXZlcnMvcGFz
c3Rocm91Z2gvYXJtL01ha2VmaWxlICAgICB8ICAgIDEgKwogeGVuL2RyaXZlcnMvcGFzc3Rocm91
Z2gvYXJtL2lwbW11LXZtc2EuYyB8IDE0ODcgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
CiA0IGZpbGVzIGNoYW5nZWQsIDE1MDIgaW5zZXJ0aW9ucygrKQogY3JlYXRlIG1vZGUgMTAwNjQ0
IHhlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2FybS9pcG1tdS12bXNhLmMKCi0tIAoyLjcuNAoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
