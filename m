Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BDA110595B
	for <lists+xen-devel@lfdr.de>; Thu, 21 Nov 2019 19:17:35 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iXqxB-0003gu-CU; Thu, 21 Nov 2019 18:13:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=JPri=ZN=gmail.com=al1img@srs-us1.protection.inumbo.net>)
 id 1iXqx9-0003gp-Ih
 for xen-devel@lists.xenproject.org; Thu, 21 Nov 2019 18:13:15 +0000
X-Inumbo-ID: 9548843e-0c8a-11ea-9631-bc764e2007e4
Received: from mail-lj1-x22d.google.com (unknown [2a00:1450:4864:20::22d])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9548843e-0c8a-11ea-9631-bc764e2007e4;
 Thu, 21 Nov 2019 18:13:14 +0000 (UTC)
Received: by mail-lj1-x22d.google.com with SMTP id n5so4284719ljc.9
 for <xen-devel@lists.xenproject.org>; Thu, 21 Nov 2019 10:13:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=Bil1p4+pxKOyzk29lh3pbBiw7P2Fa3PIR6Gj0eK2Bik=;
 b=LvVI1QhWML/M7PQLIb9DwrmdGqoSaRxOz/OfYMlEEPN5QHe9ustOHKAFDvCKgQuKGe
 xe/NVFX4/5C/0/jyfPtjCRNfFw5DK1ipNxwydHb1TRZRq7sA37lbxybdfMnezxjpb6ST
 yn6GwJocmqy/VimbmHxG9bJC6/MdcV0GnlIHaZsPsq1EKmjhuYPFSytzTf28s2iVR30I
 8T7sY0CERaaM11bkH5nWAul2YzlJozDFxT37kNAsa5BK72ZKxlWcvXySKAbl7ljUCA2i
 EzbaewrgwbMzWs5YmdDX34UtrPDdQD2aEsYL+smGm4TW9hxESk89MZZVcQJQcrIN/EyN
 Uolw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=Bil1p4+pxKOyzk29lh3pbBiw7P2Fa3PIR6Gj0eK2Bik=;
 b=IqrQhfnFszvtD91oEibOOjZ61MKVb+xOQVMv8U0aO2I4b0ypRk6yEjoTQKLjAYTcM0
 PvDUorHSlPeY+F0GNHSOfBUo3jKrlNTHrAlHJvaTlvoyn4yE6cFlo8s/iM5qClORWrDn
 JoN0OKeHFnuMbFpPxZR6SvJPDdxtCcgF80JonRhu9v7UJMAJExgmlE2bbIco9wK6FuXF
 W8oJa+QCXm18xN84u0/jg9mezdVv50G+iHhoPPN9SPL8NR8YfZRzXSxDmPxoskbpRAFK
 Qlv9mR/AiDkoherl9Stu7IaElK91ZLu+mo+RkoI5wCHvI8wok8FUadDPYto7+hM/Xljo
 vguw==
X-Gm-Message-State: APjAAAXb3AzqGHFBaZf7TR+8TlFp0YF4oCCuGW9AnFxwl8Sm77DigR+b
 MyukD9nAUO0BKpsqlwhIuTuUYP6EQOiRsw==
X-Google-Smtp-Source: APXvYqwNQXm6O2aft7ua/cu8P0lhRfSKeffwmSXNTpr/h0E+eeRvxI8ORweeyi6QhbQvzrXVTCn1pw==
X-Received: by 2002:a2e:7319:: with SMTP id o25mr8124845ljc.207.1574359993003; 
 Thu, 21 Nov 2019 10:13:13 -0800 (PST)
Received: from al1-pc.kyiv.epam.com (ll-74.141.223.85.sovam.net.ua.
 [85.223.141.74])
 by smtp.gmail.com with ESMTPSA id v12sm1855473lfb.47.2019.11.21.10.13.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Nov 2019 10:13:11 -0800 (PST)
From: Oleksandr Grytsov <al1img@gmail.com>
To: xen-devel@lists.xenproject.org
Date: Thu, 21 Nov 2019 20:12:57 +0200
Message-Id: <20191121181300.6497-1-al1img@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [Xen-devel] [PATCH v2 0/3] Remove backend xen store entry on domain
 destroy
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
Cc: anthony.perard@citrix.com, Oleksandr Grytsov <oleksandr_grytsov@epam.com>,
 ian.jackson@eu.citrix.com, wl@xen.org
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogT2xla3NhbmRyIEdyeXRzb3YgPG9sZWtzYW5kcl9ncnl0c292QGVwYW0uY29tPgoKQ2hh
bmdlcyBzaW5jZSB2MToKCiogYWRkIGNvbW1pdCB0byByZW5hbWUgVktCIGJhY2tlbmQgdHlwZSAi
bGludXgiIHRvICJwdiI7CiogYWRkIGRlZmF1bHQgY2FzZSB0byBoYW5kbGUgYWRkaW5nL3JlbW92
aW5nIFBWIGRldmljZXMgaW4gYWRkX2RldmljZSwKICByZW1vdmVfZGV2aWNlIGZ1bmN0aW9ucyAo
bGlieGxfZGV2aWNlLmMpOwoqIGFkZCBjb21tZW50IGFib3V0IHJlbW92aW5nIG51bV92aWZzLCBu
dW1fdmJkcyBpbnRvIGNvbW1pdCBtZXNzYWdlLgoKT2xla3NhbmRyIEdyeXRzb3YgKDMpOgogIGxp
YnhsOiBpbnRyb2R1Y2UgbmV3IGJhY2tlbmQgdHlwZSBWSU5QVVQKICBsaWJ4bDogcmVuYW1lIFZL
QiBiYWNrZW5kIHR5cGUgImxpbnV4IiB0byAicHYiCiAgbGlieGw6IG1ha2UgZGVmYXVsdCBwYXRo
IHRvIGFkZC9yZW1vdmUgYWxsIFBWIGRldmljZXMKCiBkb2NzL21hbi94bC5jZmcuNS5wb2QuaW4g
ICAgICAgICAgICAgfCAgNCArLQogdG9vbHMvbGlieGwvbGlieGxfZGV2aWNlLmMgICAgICAgICAg
IHwgNjMgKysrKysrKysrKystLS0tLS0tLS0tLS0tLS0tLQogdG9vbHMvbGlieGwvbGlieGxfdHlw
ZXMuaWRsICAgICAgICAgIHwgIDIgKy0KIHRvb2xzL2xpYnhsL2xpYnhsX3R5cGVzX2ludGVybmFs
LmlkbCB8ICAxICsKIHRvb2xzL2xpYnhsL2xpYnhsX3ZrYi5jICAgICAgICAgICAgICB8IDI5ICsr
KysrKysrLS0tLS0KIDUgZmlsZXMgY2hhbmdlZCwgNDcgaW5zZXJ0aW9ucygrKSwgNTIgZGVsZXRp
b25zKC0pCgotLSAKMi4xNy4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
