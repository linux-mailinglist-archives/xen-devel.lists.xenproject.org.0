Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CE0FD1726D9
	for <lists+xen-devel@lfdr.de>; Thu, 27 Feb 2020 19:18:10 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j7NhC-0003cb-9e; Thu, 27 Feb 2020 18:15:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=sDOy=4P=ffwll.ch=daniel.vetter@srs-us1.protection.inumbo.net>)
 id 1j7NhA-0003cW-Ks
 for xen-devel@lists.xenproject.org; Thu, 27 Feb 2020 18:15:36 +0000
X-Inumbo-ID: 26078246-598d-11ea-b7e8-bc764e2007e4
Received: from mail-wm1-x341.google.com (unknown [2a00:1450:4864:20::341])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 26078246-598d-11ea-b7e8-bc764e2007e4;
 Thu, 27 Feb 2020 18:15:35 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id a141so433471wme.2
 for <xen-devel@lists.xenproject.org>; Thu, 27 Feb 2020 10:15:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jyV7bNjLu1SQ7vKcBd294xD9HrCo7tzU5S6Usg9xWsM=;
 b=iuZKAXQhruuVsFLUktBVg7py+mMqJxsH6IWepRR2Qdsx+kSrzXeemepz+H1XbKBw71
 m7tZxW+SYKH+XWKDS6BzHZuIfcD3nYPcadw6X+2eqfcGwk0WFWIMA5DuBuxHBtYEq88J
 pIg952ThHq0ILPYGTY9qbGh/U9uPXXw7tRTaE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jyV7bNjLu1SQ7vKcBd294xD9HrCo7tzU5S6Usg9xWsM=;
 b=IsNuMiOuyaT7BcuKYIn4JmvrmQgnY3mOcReLkUyQx1hpoAVJot9gOTj9ZtWr7DpyoD
 FW1yggfF5Q5PJfFxCDTTosqLgtLWkYVdRe9bqKNn9Cz2KZS3RNqgmydatnK7/azoMOSC
 ArXY4UxEXcaJZNPINqGZVTZbdGSo0+g/ZjZ3bgcs2q5i9rUQWLtwdLn9MtrmYlOdXB5P
 WqvIAxBHQqBhhB3Esv+ue3wBGU5JtdfFZt2SnqR/UxOkuii7uRHUZke9PUgeT8K9m1xR
 b4iXeqk+duRtllI6lyfjrwhXrEOI6EcwyDFsUK7RuIUq+fibmyhoKIjR654o+ndbpggw
 zn8w==
X-Gm-Message-State: APjAAAUdUM4OGGPCQ69rIGQIjE/hWAJzUByEMqJia8D95JqdHdDguQFQ
 4nNRY8E+nKTtos6IfswI3xtMSw==
X-Google-Smtp-Source: APXvYqy1KGIqvDWaP9y/317NhLPsMTyJxxslCUMo+xlRnY58XN0X93cIaXfyPqnzF+0nskv3/XteqA==
X-Received: by 2002:a1c:25c6:: with SMTP id l189mr49006wml.104.1582827333846; 
 Thu, 27 Feb 2020 10:15:33 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id q1sm8551152wrw.5.2020.02.27.10.15.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Feb 2020 10:15:33 -0800 (PST)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Date: Thu, 27 Feb 2020 19:14:35 +0100
Message-Id: <20200227181522.2711142-5-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200227181522.2711142-1-daniel.vetter@ffwll.ch>
References: <20200227181522.2711142-1-daniel.vetter@ffwll.ch>
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
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, m.felsch@pengutronix.de,
 Maxime Ripard <mripard@kernel.org>, Gerd Hoffmann <kraxel@redhat.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>, xen-devel@lists.xenproject.org,
 l.stach@pengutronix.de
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
