Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BAD771688FB
	for <lists+xen-devel@lfdr.de>; Fri, 21 Feb 2020 22:06:19 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j5FSU-0004Gz-Vo; Fri, 21 Feb 2020 21:03:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=I9NL=4J=ffwll.ch=daniel.vetter@srs-us1.protection.inumbo.net>)
 id 1j5FST-0004Gs-I5
 for xen-devel@lists.xenproject.org; Fri, 21 Feb 2020 21:03:37 +0000
X-Inumbo-ID: 9f04e606-54ed-11ea-b0fd-bc764e2007e4
Received: from mail-wm1-x333.google.com (unknown [2a00:1450:4864:20::333])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9f04e606-54ed-11ea-b0fd-bc764e2007e4;
 Fri, 21 Feb 2020 21:03:34 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id p17so3309442wma.1
 for <xen-devel@lists.xenproject.org>; Fri, 21 Feb 2020 13:03:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jyV7bNjLu1SQ7vKcBd294xD9HrCo7tzU5S6Usg9xWsM=;
 b=VGriMEOXnXT5lr+yO/cONhMnb1rpSUcADP/62939VqYkWIjPB+4VG/oeQaaUgctMrr
 ihmXo0F8pViQbwRqtHUZc+Y7MjPuVkAyyTf51dr8DqWb6tJod8n40MG7N30S5khyHWDH
 S3FqU75v6wEzFHzjWdTxonP1Vqw7LbrDG/nFY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jyV7bNjLu1SQ7vKcBd294xD9HrCo7tzU5S6Usg9xWsM=;
 b=nwtSpSCvE8BWGknYLxP0Cg3RebERh3AtBUJOMn9HC7vf8RHUIWBSbJfopnAuJuebYs
 jw3lFLeIvH2NxdaKJWajAKoewWadKmmAAzZUAi1TY1z/qzRsSo9Kk8klv/tVv0EwXcCM
 ldA5SzNhoF6tB5JAHieFPtInIbMsAMz0Ubt2kZ+2em7KIQ5J9fM6MdTsf3tXCfTqw+VC
 WqEoK1sTJnGzxYt1GJgJEkKA7bm+kPTPO2xwfEBXqVqX1wN+lAJcWw37nKTIrTn02oh4
 DF2pWhZO/NBtChpY0vCM0R4nINMfGXE96RyAin9O/NhM4n5MjayIJPpYf5BSfEo8W4w0
 5zUg==
X-Gm-Message-State: APjAAAXtKp5zudLjWjrwpmWs3q5bpsLAk+ZiP6jsV7wS9+IRgAiioRou
 dRL5nLIbMrgWM9DmzhvPxBnUZw==
X-Google-Smtp-Source: APXvYqzTFBuN+jfJlHpcemXB7wlMOCFT5hIgPqCxxjBGq+9bWJqi2iniGqiMQCur+heNM6D8nzZ+mA==
X-Received: by 2002:a1c:f717:: with SMTP id v23mr5755678wmh.172.1582319013656; 
 Fri, 21 Feb 2020 13:03:33 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id z6sm5483930wrw.36.2020.02.21.13.03.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Feb 2020 13:03:32 -0800 (PST)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Date: Fri, 21 Feb 2020 22:02:32 +0100
Message-Id: <20200221210319.2245170-5-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200221210319.2245170-1-daniel.vetter@ffwll.ch>
References: <20200221210319.2245170-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 04/51] drm: Set final_kfree in drm_dev_alloc
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
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCgpSZXZpZXdlZC1ieTogT2xla3NhbmRyIEFuZHJ1
c2hjaGVua28gPG9sZWtzYW5kcl9hbmRydXNoY2hlbmtvQGVwYW0uY29tPgpTaWduZWQtb2ZmLWJ5
OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGludGVsLmNvbT4KQ2M6IE1hYXJ0ZW4gTGFu
a2hvcnN0IDxtYWFydGVuLmxhbmtob3JzdEBsaW51eC5pbnRlbC5jb20+CkNjOiBNYXhpbWUgUmlw
YXJkIDxtcmlwYXJkQGtlcm5lbC5vcmc+CkNjOiBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1h
bm5Ac3VzZS5kZT4KQ2M6IERhdmlkIEFpcmxpZSA8YWlybGllZEBsaW51eC5pZT4KQ2M6IERhbmll
bCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4KQ2M6IE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIDxv
bGVrc2FuZHJfYW5kcnVzaGNoZW5rb0BlcGFtLmNvbT4KQ2M6IHhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwotLS0KIGRyaXZlcnMvZ3B1L2RybS9kcm1fZHJ2LmMgICAgICAgICAgIHwgMyAr
KysKIGRyaXZlcnMvZ3B1L2RybS94ZW4veGVuX2RybV9mcm9udC5jIHwgMiArLQogMiBmaWxlcyBj
aGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vZHJtX2Rydi5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9kcnYuYwppbmRleCAz
ZTU2MjdkNmViYTYuLjllNjJlMjhiYmM2MiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2Ry
bV9kcnYuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2Rydi5jCkBAIC0zOSw2ICszOSw3IEBA
CiAjaW5jbHVkZSA8ZHJtL2RybV9jb2xvcl9tZ210Lmg+CiAjaW5jbHVkZSA8ZHJtL2RybV9kcnYu
aD4KICNpbmNsdWRlIDxkcm0vZHJtX2ZpbGUuaD4KKyNpbmNsdWRlIDxkcm0vZHJtX21hbmFnZWQu
aD4KICNpbmNsdWRlIDxkcm0vZHJtX21vZGVfb2JqZWN0Lmg+CiAjaW5jbHVkZSA8ZHJtL2RybV9w
cmludC5oPgogCkBAIC04MTksNiArODIwLDggQEAgc3RydWN0IGRybV9kZXZpY2UgKmRybV9kZXZf
YWxsb2Moc3RydWN0IGRybV9kcml2ZXIgKmRyaXZlciwKIAkJcmV0dXJuIEVSUl9QVFIocmV0KTsK
IAl9CiAKKwlkcm1tX2FkZF9maW5hbF9rZnJlZShkZXYsIGRldik7CisKIAlyZXR1cm4gZGV2Owog
fQogRVhQT1JUX1NZTUJPTChkcm1fZGV2X2FsbG9jKTsKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS94ZW4veGVuX2RybV9mcm9udC5jIGIvZHJpdmVycy9ncHUvZHJtL3hlbi94ZW5fZHJtX2Zy
b250LmMKaW5kZXggNGJlNDljMWFlZjUxLi5kMjJiNWRhMzg5MzUgMTAwNjQ0Ci0tLSBhL2RyaXZl
cnMvZ3B1L2RybS94ZW4veGVuX2RybV9mcm9udC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZW4v
eGVuX2RybV9mcm9udC5jCkBAIC00NjEsNyArNDYxLDYgQEAgc3RhdGljIHZvaWQgeGVuX2RybV9k
cnZfcmVsZWFzZShzdHJ1Y3QgZHJtX2RldmljZSAqZGV2KQogCWRybV9tb2RlX2NvbmZpZ19jbGVh
bnVwKGRldik7CiAKIAlkcm1fZGV2X2ZpbmkoZGV2KTsKLQlrZnJlZShkZXYpOwogCiAJaWYgKGZy
b250X2luZm8tPmNmZy5iZV9hbGxvYykKIAkJeGVuYnVzX3N3aXRjaF9zdGF0ZShmcm9udF9pbmZv
LT54Yl9kZXYsCkBAIC01NjEsNiArNTYwLDcgQEAgc3RhdGljIGludCB4ZW5fZHJtX2Rydl9pbml0
KHN0cnVjdCB4ZW5fZHJtX2Zyb250X2luZm8gKmZyb250X2luZm8pCiBmYWlsX21vZGVzZXQ6CiAJ
ZHJtX2ttc19oZWxwZXJfcG9sbF9maW5pKGRybV9kZXYpOwogCWRybV9tb2RlX2NvbmZpZ19jbGVh
bnVwKGRybV9kZXYpOworCWRybV9kZXZfcHV0KGRybV9kZXYpOwogZmFpbDoKIAlrZnJlZShkcm1f
aW5mbyk7CiAJcmV0dXJuIHJldDsKLS0gCjIuMjQuMQoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
