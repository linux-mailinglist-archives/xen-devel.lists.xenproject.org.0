Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 58526164200
	for <lists+xen-devel@lfdr.de>; Wed, 19 Feb 2020 11:25:18 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j4MU7-0004es-7T; Wed, 19 Feb 2020 10:21:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=QD8l=4H=ffwll.ch=daniel.vetter@srs-us1.protection.inumbo.net>)
 id 1j4MU5-0004e8-Sh
 for xen-devel@lists.xenproject.org; Wed, 19 Feb 2020 10:21:38 +0000
X-Inumbo-ID: 9bfd199e-5301-11ea-ade5-bc764e2007e4
Received: from mail-wr1-x42e.google.com (unknown [2a00:1450:4864:20::42e])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9bfd199e-5301-11ea-ade5-bc764e2007e4;
 Wed, 19 Feb 2020 10:21:37 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id g3so27480059wrs.12
 for <xen-devel@lists.xenproject.org>; Wed, 19 Feb 2020 02:21:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=k6zIgeMcsuUzQ60x1RzHf+FyAXyxdU+K1JmA2p/vHpM=;
 b=QOof3Vy3lDNa77QfdX9xFGvpVUnliadmxLnliLKB1FcpNUwa7J1F7JSbzMamc1EwYF
 pXD/VfXhrk+7ia9sJ9ZzmfdMM8h/qd5oJ1DmPlPVTOQ8qQT1tpJPud56f0kP89IOOKW9
 5dk49FUMQg9RbQt67tYWzlIaWriPs0CS96uNY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=k6zIgeMcsuUzQ60x1RzHf+FyAXyxdU+K1JmA2p/vHpM=;
 b=Fzp7MrGz4lR91odnsAzQsCFwdKbAT70vHIrsGzHsAQj9uISOp0+gRKSMeBRHzPdbWB
 zoBR448qSeQQ1FK5AyMX+gIbTtfRnfqrAau1lHV2PVxV/85g25q28cYiBE4oUmaMI85j
 ysIqzjD9VSFp9MQJd4ht22gR3uJDz0MYpBSzB4P8mIFgMhBolH3/Z8R35rqyOnV/JKcD
 hkxR1yaihdgGNLn7njezkL8sPJp9dfiUPJPGindliJOsdT5CRSsM8B3mnwlxQtx5SQI9
 W8KrnxIYDmezYxistiTTmf5AJHzr1Xndr72On+w7pmwyDMmp21YSWDmmduDL6ViAB1mX
 lEqg==
X-Gm-Message-State: APjAAAU7/oLKiNhFxxXGJ6L1H4F3WYEfjcWFtWdr8kxDB4cSBllSHsby
 muXWnJ26a9lBocPAVvYOrnTcxw==
X-Google-Smtp-Source: APXvYqxoGad2E0cR331h17OfopLNCwl+JCHX21vpORxGTmdF7o9ixk77hhlCdFMX8d/iuD3VbmXySQ==
X-Received: by 2002:adf:c54e:: with SMTP id s14mr33819647wrf.385.1582107696170; 
 Wed, 19 Feb 2020 02:21:36 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id s23sm2370339wra.15.2020.02.19.02.21.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Feb 2020 02:21:35 -0800 (PST)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Date: Wed, 19 Feb 2020 11:20:34 +0100
Message-Id: <20200219102122.1607365-5-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200219102122.1607365-1-daniel.vetter@ffwll.ch>
References: <20200219102122.1607365-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 04/52] drm: Set final_kfree in drm_dev_alloc
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
Cc: Daniel Vetter <daniel@ffwll.ch>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Gerd Hoffmann <kraxel@redhat.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, xen-devel@lists.xenproject.org,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SSBhbHNvIGRpZCBhIGZ1bGwgcmV2aWV3IG9mIGFsbCBjYWxsZXJzLCBhbmQgb25seSB0aGUgeGVu
IGRyaXZlcgpmb3Jnb3QgdG8gY2FsbCBkcm1fZGV2X3B1dCBpbiB0aGUgZmFpbHVyZSBwYXRoLiBG
aXggdGhhdCB1cCB0b28uCgp2MjogSSBub3RpY2VkIHRoYXQgeGVuIGhhcyBhIGRybV9kcml2ZXIu
cmVsZWFzZSBob29rLCBhbmQgdXNlcwpkcm1fZGV2X2FsbG9jKCkuIFdlIG5lZWQgdG8gcmVtb3Zl
IHRoZSBrZnJlZSBmcm9tCnhlbl9kcm1fZHJ2X3JlbGVhc2UoKS4KCmJvY2hzIGFsc28gaGFzIGEg
cmVsZWFzZSBob29rLCBidXQgbGVha2VkIHRoZSBkcm1fZGV2aWNlIGV2ZXIgc2luY2UKCmNvbW1p
dCAwYTY2NTliZGM1ZTgyMjFkYTk5ZWViYjE3NmZkOTU5MTQzNWUzOGRlCkF1dGhvcjogR2VyZCBI
b2ZmbWFubiA8a3JheGVsQHJlZGhhdC5jb20+CkRhdGU6ICAgVHVlIERlYyAxNyAxODowNDo0NiAy
MDEzICswMTAwCgogICAgZHJtL2JvY2hzOiBuZXcgZHJpdmVyCgpUaGlzIHBhdGNoIGhlcmUgZml4
ZXMgdGhhdCBsZWFrLgoKU2FtZSBmb3IgdmlydGlvLCBzdGFydGVkIGxlYWtpbmcgd2l0aAoKY29t
bWl0IGIxZGYzYTJiMjRhOTE3Zjg4NTNkNDNmZTk2ODNjMGUzNjBkMmMzM2EKQXV0aG9yOiBHZXJk
IEhvZmZtYW5uIDxrcmF4ZWxAcmVkaGF0LmNvbT4KRGF0ZTogICBUdWUgRmViIDExIDE0OjU4OjA0
IDIwMjAgKzAxMDAKCiAgICBkcm0vdmlydGlvOiBhZGQgZHJtX2RyaXZlci5yZWxlYXNlIGNhbGxi
YWNrLgoKQ2M6IEdlcmQgSG9mZm1hbm4gPGtyYXhlbEByZWRoYXQuY29tPgpDYzogT2xla3NhbmRy
IEFuZHJ1c2hjaGVua28gPG9sZWtzYW5kcl9hbmRydXNoY2hlbmtvQGVwYW0uY29tPgpDYzogeGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCgpTaWduZWQtb2ZmLWJ5OiBEYW5pZWwgVmV0dGVy
IDxkYW5pZWwudmV0dGVyQGludGVsLmNvbT4KQ2M6IE1hYXJ0ZW4gTGFua2hvcnN0IDxtYWFydGVu
Lmxhbmtob3JzdEBsaW51eC5pbnRlbC5jb20+CkNjOiBNYXhpbWUgUmlwYXJkIDxtcmlwYXJkQGtl
cm5lbC5vcmc+CkNjOiBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT4KQ2M6
IERhdmlkIEFpcmxpZSA8YWlybGllZEBsaW51eC5pZT4KQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmll
bEBmZndsbC5jaD4KQ2M6IE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIDxvbGVrc2FuZHJfYW5kcnVz
aGNoZW5rb0BlcGFtLmNvbT4KQ2M6IHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwotLS0K
IGRyaXZlcnMvZ3B1L2RybS9kcm1fZHJ2LmMgICAgICAgICAgIHwgMyArKysKIGRyaXZlcnMvZ3B1
L2RybS94ZW4veGVuX2RybV9mcm9udC5jIHwgMiArLQogMiBmaWxlcyBjaGFuZ2VkLCA0IGluc2Vy
dGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJt
X2Rydi5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9kcnYuYwppbmRleCAzZTU2MjdkNmViYTYuLjll
NjJlMjhiYmM2MiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9kcnYuYworKysgYi9k
cml2ZXJzL2dwdS9kcm0vZHJtX2Rydi5jCkBAIC0zOSw2ICszOSw3IEBACiAjaW5jbHVkZSA8ZHJt
L2RybV9jb2xvcl9tZ210Lmg+CiAjaW5jbHVkZSA8ZHJtL2RybV9kcnYuaD4KICNpbmNsdWRlIDxk
cm0vZHJtX2ZpbGUuaD4KKyNpbmNsdWRlIDxkcm0vZHJtX21hbmFnZWQuaD4KICNpbmNsdWRlIDxk
cm0vZHJtX21vZGVfb2JqZWN0Lmg+CiAjaW5jbHVkZSA8ZHJtL2RybV9wcmludC5oPgogCkBAIC04
MTksNiArODIwLDggQEAgc3RydWN0IGRybV9kZXZpY2UgKmRybV9kZXZfYWxsb2Moc3RydWN0IGRy
bV9kcml2ZXIgKmRyaXZlciwKIAkJcmV0dXJuIEVSUl9QVFIocmV0KTsKIAl9CiAKKwlkcm1tX2Fk
ZF9maW5hbF9rZnJlZShkZXYsIGRldik7CisKIAlyZXR1cm4gZGV2OwogfQogRVhQT1JUX1NZTUJP
TChkcm1fZGV2X2FsbG9jKTsKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZW4veGVuX2Ry
bV9mcm9udC5jIGIvZHJpdmVycy9ncHUvZHJtL3hlbi94ZW5fZHJtX2Zyb250LmMKaW5kZXggNGJl
NDljMWFlZjUxLi5kMjJiNWRhMzg5MzUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZW4v
eGVuX2RybV9mcm9udC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZW4veGVuX2RybV9mcm9udC5j
CkBAIC00NjEsNyArNDYxLDYgQEAgc3RhdGljIHZvaWQgeGVuX2RybV9kcnZfcmVsZWFzZShzdHJ1
Y3QgZHJtX2RldmljZSAqZGV2KQogCWRybV9tb2RlX2NvbmZpZ19jbGVhbnVwKGRldik7CiAKIAlk
cm1fZGV2X2ZpbmkoZGV2KTsKLQlrZnJlZShkZXYpOwogCiAJaWYgKGZyb250X2luZm8tPmNmZy5i
ZV9hbGxvYykKIAkJeGVuYnVzX3N3aXRjaF9zdGF0ZShmcm9udF9pbmZvLT54Yl9kZXYsCkBAIC01
NjEsNiArNTYwLDcgQEAgc3RhdGljIGludCB4ZW5fZHJtX2Rydl9pbml0KHN0cnVjdCB4ZW5fZHJt
X2Zyb250X2luZm8gKmZyb250X2luZm8pCiBmYWlsX21vZGVzZXQ6CiAJZHJtX2ttc19oZWxwZXJf
cG9sbF9maW5pKGRybV9kZXYpOwogCWRybV9tb2RlX2NvbmZpZ19jbGVhbnVwKGRybV9kZXYpOwor
CWRybV9kZXZfcHV0KGRybV9kZXYpOwogZmFpbDoKIAlrZnJlZShkcm1faW5mbyk7CiAJcmV0dXJu
IHJldDsKLS0gCjIuMjQuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
