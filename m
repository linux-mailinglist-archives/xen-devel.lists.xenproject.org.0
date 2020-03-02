Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 225F317675B
	for <lists+xen-devel@lfdr.de>; Mon,  2 Mar 2020 23:29:29 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j8tWU-0003oV-0r; Mon, 02 Mar 2020 22:26:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=YuY+=4T=ffwll.ch=daniel.vetter@srs-us1.protection.inumbo.net>)
 id 1j8tWS-0003oQ-AQ
 for xen-devel@lists.xenproject.org; Mon, 02 Mar 2020 22:26:48 +0000
X-Inumbo-ID: e701a428-5cd4-11ea-902a-bc764e2007e4
Received: from mail-wr1-x435.google.com (unknown [2a00:1450:4864:20::435])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e701a428-5cd4-11ea-902a-bc764e2007e4;
 Mon, 02 Mar 2020 22:26:47 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id r17so1855246wrj.7
 for <xen-devel@lists.xenproject.org>; Mon, 02 Mar 2020 14:26:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pkhX6oUV54jak2I+fxKSDh5HLmzzdLCuXZmwWLfZmfI=;
 b=fDTQWcpO27n1txwbnh0F5V7ooNqS7Mthcd0f2gQcrezZmtJjlyF0DEZVBYjrGcI5kB
 jzbI1/PbR13yKf2Xv1319sdw8nXqAooukFPmL4pAIiU4GZy4WbgFkYu355M9j7Ymc5Ol
 251Ceai1ynFMdeUCgnwXyvdFofuz7I+vE091A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pkhX6oUV54jak2I+fxKSDh5HLmzzdLCuXZmwWLfZmfI=;
 b=VMTlfTS8rvgpWjyDrkoH+1qC8UOJb+n/iC4rPcu7YV0p1ReqknvHHyKNp1VfXhb8lS
 G4O3UWKEwhp2XsMpHAkyXLegbWWMhnFQDkOqEzmq2AErfPtpTHOKDyCa8zheU0UPXBfe
 oNruYTIhwuswpJius4OmPknaIko6nmWK2Y2v+SsDr8pY+VWEa5rVP8nZutWDh2u51RUM
 d0r7cT3A2Sac4aA1a4HWOT+mT5uPBzST+z1K5LWlGhNxc9Id9gSode8dLh2MRPOJfwy3
 Fo02zDGgzy9NIH9RbUszPIchJAAxg/JP7fz5oiLM4xpVlCpY6PvwmUSdR01/R9391tcy
 bC7Q==
X-Gm-Message-State: ANhLgQ04PKR05megZ4hdwwPr4ey6js4kV3tqcN7Rmwz2yx9QfyVsq55R
 ekswcoNPpTbXh5UAilTxUa8GAg==
X-Google-Smtp-Source: ADFU+vtrZk/HHbRtnp3SmgT+OD4tT1XHyorYZDXPvumXYrgTybM88i7mt8+5OfQpaBjIDKv9Xj027Q==
X-Received: by 2002:adf:f751:: with SMTP id z17mr1668784wrp.207.1583188006282; 
 Mon, 02 Mar 2020 14:26:46 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id o18sm26114589wrv.60.2020.03.02.14.26.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Mar 2020 14:26:45 -0800 (PST)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Date: Mon,  2 Mar 2020 23:25:44 +0100
Message-Id: <20200302222631.3861340-5-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200302222631.3861340-1-daniel.vetter@ffwll.ch>
References: <20200302222631.3861340-1-daniel.vetter@ffwll.ch>
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
ZXJzL2dwdS9kcm0vZHJtX2Rydi5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9kcnYuYwppbmRleCAx
NTMwNTBmYzkyNmMuLjdiODRlZThhNWViNSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2Ry
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
