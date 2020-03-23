Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 32F7C18F7B0
	for <lists+xen-devel@lfdr.de>; Mon, 23 Mar 2020 15:52:16 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jGOOz-0007va-C9; Mon, 23 Mar 2020 14:50:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=F+f9=5I=ffwll.ch=daniel.vetter@srs-us1.protection.inumbo.net>)
 id 1jGOOx-0007ki-Qs
 for xen-devel@lists.xenproject.org; Mon, 23 Mar 2020 14:50:03 +0000
X-Inumbo-ID: 93980844-6d15-11ea-bec1-bc764e2007e4
Received: from mail-wm1-x342.google.com (unknown [2a00:1450:4864:20::342])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 93980844-6d15-11ea-bec1-bc764e2007e4;
 Mon, 23 Mar 2020 14:50:03 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id 6so14956265wmi.5
 for <xen-devel@lists.xenproject.org>; Mon, 23 Mar 2020 07:50:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Dv+T7hx3shnxcC2cGhwCfqmDdpFuiZgbqKQsTy1SFQw=;
 b=J/mP5ABXoR/QChjydf1fFw7SlvAmlpghjfuOxFmprDV0BmAPEVe33QWLhG5h0vt65R
 JCG1joLLUG9QtHhO8+l4911MEiNq/D70AoMAxtpt901OP9kWUTL8qxkreP4ImaT/tSHT
 KpELqFVo9o/NtkIG4+D1z8FGFLg7ZZXS9Ipdo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Dv+T7hx3shnxcC2cGhwCfqmDdpFuiZgbqKQsTy1SFQw=;
 b=edPM6rVMZT0OeIaHBqLdRH+ttijSREj9WvtOklhdGn30uRtrVwnJ4k/zyVZzYiaaAr
 +Ll8pz0snyleFMXtE0YsuL9k4AOrByPwjFRPhsM9UcAUKniuWjsCKv2DtSZ2EtpqV9SI
 uRaafUweio7NLDLJ456sCABkvuYGO3Tfc64Kjod/BhqruRMYjO/CrLK/WbhjFiZEpTZR
 0p0lm+PKwisP53BMQ1SxlBVyNpmIgYEPxMmE36IKkl3FVP6QigzqBrBiXr3sobjOxcAn
 /y3hBIT9NSet11fMOgovzZSli8OE8Pn6DvAFmMkH4HTWBa2A2wBVEbF2VO8iS811aKlR
 Zw1A==
X-Gm-Message-State: ANhLgQ0dYoNOxcTbbyY9vOMkiILJWJF+OAJmlJf4wz1SByKO8i37CZjj
 FOaW88vLTqk3mu4tAVgChnOuNA==
X-Google-Smtp-Source: ADFU+vsm1kCaomWxE/lOuq1Ntg4UGf1m8M8LhErx1auiFhuoXr4+ZwhV6pgLnBjuXKTrfI2+TYCPNg==
X-Received: by 2002:a1c:cc0a:: with SMTP id h10mr6348797wmb.127.1584975002190; 
 Mon, 23 Mar 2020 07:50:02 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id s22sm20376522wmc.16.2020.03.23.07.50.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Mar 2020 07:50:01 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Date: Mon, 23 Mar 2020 15:49:03 +0100
Message-Id: <20200323144950.3018436-5-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200323144950.3018436-1-daniel.vetter@ffwll.ch>
References: <20200323144950.3018436-1-daniel.vetter@ffwll.ch>
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
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>, xen-devel@lists.xenproject.org,
 Sam Ravnborg <sam@ravnborg.org>
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
YWNrLgoKQWNrZWQtYnk6IEdlcmQgSG9mZm1hbm4gPGtyYXhlbEByZWRoYXQuY29tPgpBY2tlZC1i
eTogVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+CkFja2VkLWJ5OiBTYW0g
UmF2bmJvcmcgPHNhbUByYXZuYm9yZy5vcmc+ClJldmlld2VkLWJ5OiBPbGVrc2FuZHIgQW5kcnVz
aGNoZW5rbyA8b2xla3NhbmRyX2FuZHJ1c2hjaGVua29AZXBhbS5jb20+CkNjOiBHZXJkIEhvZmZt
YW5uIDxrcmF4ZWxAcmVkaGF0LmNvbT4KQ2M6IE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIDxvbGVr
c2FuZHJfYW5kcnVzaGNoZW5rb0BlcGFtLmNvbT4KQ2M6IHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpTaWduZWQtb2ZmLWJ5OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGludGVs
LmNvbT4KQ2M6IE1hYXJ0ZW4gTGFua2hvcnN0IDxtYWFydGVuLmxhbmtob3JzdEBsaW51eC5pbnRl
bC5jb20+CkNjOiBNYXhpbWUgUmlwYXJkIDxtcmlwYXJkQGtlcm5lbC5vcmc+CkNjOiBUaG9tYXMg
WmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT4KQ2M6IERhdmlkIEFpcmxpZSA8YWlybGll
ZEBsaW51eC5pZT4KQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4KQ2M6IE9sZWtz
YW5kciBBbmRydXNoY2hlbmtvIDxvbGVrc2FuZHJfYW5kcnVzaGNoZW5rb0BlcGFtLmNvbT4KQ2M6
IHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwotLS0KIGRyaXZlcnMvZ3B1L2RybS9kcm1f
ZHJ2LmMgICAgICAgICAgIHwgMyArKysKIGRyaXZlcnMvZ3B1L2RybS94ZW4veGVuX2RybV9mcm9u
dC5jIHwgMiArLQogMiBmaWxlcyBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24o
LSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2Rydi5jIGIvZHJpdmVycy9ncHUv
ZHJtL2RybV9kcnYuYwppbmRleCAxYjliZTIzYjkzYjAuLjg3N2RlZDM0OGI2ZSAxMDA2NDQKLS0t
IGEvZHJpdmVycy9ncHUvZHJtL2RybV9kcnYuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2Ry
di5jCkBAIC0zOSw2ICszOSw3IEBACiAjaW5jbHVkZSA8ZHJtL2RybV9jb2xvcl9tZ210Lmg+CiAj
aW5jbHVkZSA8ZHJtL2RybV9kcnYuaD4KICNpbmNsdWRlIDxkcm0vZHJtX2ZpbGUuaD4KKyNpbmNs
dWRlIDxkcm0vZHJtX21hbmFnZWQuaD4KICNpbmNsdWRlIDxkcm0vZHJtX21vZGVfb2JqZWN0Lmg+
CiAjaW5jbHVkZSA8ZHJtL2RybV9wcmludC5oPgogCkBAIC04MTksNiArODIwLDggQEAgc3RydWN0
IGRybV9kZXZpY2UgKmRybV9kZXZfYWxsb2Moc3RydWN0IGRybV9kcml2ZXIgKmRyaXZlciwKIAkJ
cmV0dXJuIEVSUl9QVFIocmV0KTsKIAl9CiAKKwlkcm1tX2FkZF9maW5hbF9rZnJlZShkZXYsIGRl
dik7CisKIAlyZXR1cm4gZGV2OwogfQogRVhQT1JUX1NZTUJPTChkcm1fZGV2X2FsbG9jKTsKZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZW4veGVuX2RybV9mcm9udC5jIGIvZHJpdmVycy9n
cHUvZHJtL3hlbi94ZW5fZHJtX2Zyb250LmMKaW5kZXggNGJlNDljMWFlZjUxLi5kMjJiNWRhMzg5
MzUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZW4veGVuX2RybV9mcm9udC5jCisrKyBi
L2RyaXZlcnMvZ3B1L2RybS94ZW4veGVuX2RybV9mcm9udC5jCkBAIC00NjEsNyArNDYxLDYgQEAg
c3RhdGljIHZvaWQgeGVuX2RybV9kcnZfcmVsZWFzZShzdHJ1Y3QgZHJtX2RldmljZSAqZGV2KQog
CWRybV9tb2RlX2NvbmZpZ19jbGVhbnVwKGRldik7CiAKIAlkcm1fZGV2X2ZpbmkoZGV2KTsKLQlr
ZnJlZShkZXYpOwogCiAJaWYgKGZyb250X2luZm8tPmNmZy5iZV9hbGxvYykKIAkJeGVuYnVzX3N3
aXRjaF9zdGF0ZShmcm9udF9pbmZvLT54Yl9kZXYsCkBAIC01NjEsNiArNTYwLDcgQEAgc3RhdGlj
IGludCB4ZW5fZHJtX2Rydl9pbml0KHN0cnVjdCB4ZW5fZHJtX2Zyb250X2luZm8gKmZyb250X2lu
Zm8pCiBmYWlsX21vZGVzZXQ6CiAJZHJtX2ttc19oZWxwZXJfcG9sbF9maW5pKGRybV9kZXYpOwog
CWRybV9tb2RlX2NvbmZpZ19jbGVhbnVwKGRybV9kZXYpOworCWRybV9kZXZfcHV0KGRybV9kZXYp
OwogZmFpbDoKIAlrZnJlZShkcm1faW5mbyk7CiAJcmV0dXJuIHJldDsKLS0gCjIuMjUuMQoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
