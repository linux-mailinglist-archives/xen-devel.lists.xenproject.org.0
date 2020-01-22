Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 023AB145D14
	for <lists+xen-devel@lfdr.de>; Wed, 22 Jan 2020 21:26:43 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iuMXW-0006EM-0S; Wed, 22 Jan 2020 20:23:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=vKfK=3L=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1iuMXU-0006EH-70
 for xen-devel@lists.xenproject.org; Wed, 22 Jan 2020 20:23:48 +0000
X-Inumbo-ID: 17cbf738-3d55-11ea-b833-bc764e2007e4
Received: from mail-wr1-x443.google.com (unknown [2a00:1450:4864:20::443])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 17cbf738-3d55-11ea-b833-bc764e2007e4;
 Wed, 22 Jan 2020 20:23:47 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id q10so469370wrm.11
 for <xen-devel@lists.xenproject.org>; Wed, 22 Jan 2020 12:23:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=m5ClOJlFvps3YoYuL1kqomtx8c2RKyrxd8//4mr2mmo=;
 b=TfTxk49eybN2vfFlwrge/mx8UFStG+LSZUYOOgNVCvYFFw0QqUAAe4UgjpyT+fo6F7
 16ES6zSImydmkzp5PahDp2OHvnzPdDu8RmvkdGBEciw/S4apCZVRmvcAT0KBUSbLKcpO
 dkzNyiATrhgYDig3fwXDez3/wtaLVnS5ucJSzJhtK0DgPXr18xbK7zv1f6hhIo0Q7vGW
 AYGPhdisRKQE/P7HoNhsPMFkVyV7QMXRwqrenyNo5EfuqsfAuhpU84v/XdsEj+MDnPm1
 1k0+6IC+Pnu09WlyeCMX3+H3K8r4SBQZGlGaYllqLCea6vugU4vJE9QiBNwgtAXJfC9Y
 R/PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=m5ClOJlFvps3YoYuL1kqomtx8c2RKyrxd8//4mr2mmo=;
 b=pe/2OLEXS7BdbaXu0q6O/li4llNlA67XGAQn60A7gYquyXth8NkqG7L+q85anSsXTX
 YCWI+AkqRnw8JvrUM9I84DysXQI0FMdngDlOAsOIrA6uMKlwQ3NFbumihExJDbFBhr5L
 21XFCVs8gfD9XqlulsfjlTweU/8nuQY8br8d+mQp0wI/53KwMZLFy2hMneKrMJpPIJRU
 phf+cu1Ye82SMZrGeIV9yeQYlhG7mAUAi5K9nx56iRbI4C9kafm/IIGePRvCJa3XOEee
 RktasrcxFXPxPdrTKShoBMR9g8uR/j7V38qXzYpB3Lh+kytNVS2lR73cmBOzHnug4edk
 bzNA==
X-Gm-Message-State: APjAAAUJdQcoID6pdlGoszlN3fc5arapqYmGl9IF/dyGBVgyPCDRz8g2
 +06nDtLlKBuWPrE0HMfg8a/fuYotHiG8PA==
X-Google-Smtp-Source: APXvYqy6KnTfl58CXIEivMhjU6s+br8Y7EK+Ey+bce0Orh2A62HWw1HDK+55VsAR0lRgsvbmDosKLw==
X-Received: by 2002:adf:e290:: with SMTP id v16mr13566409wri.16.1579724626396; 
 Wed, 22 Jan 2020 12:23:46 -0800 (PST)
Received: from localhost.localdomain (41.142.6.51.dyn.plus.net. [51.6.142.41])
 by smtp.gmail.com with ESMTPSA id
 r6sm60267992wrq.92.2020.01.22.12.23.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Jan 2020 12:23:45 -0800 (PST)
From: Wei Liu <wl@xen.org>
X-Google-Original-From: Wei Liu <liuwe@microsoft.com>
To: Xen Development List <xen-devel@lists.xenproject.org>
Date: Wed, 22 Jan 2020 20:23:36 +0000
Message-Id: <20200122202343.5703-1-liuwe@microsoft.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v4 0/7] More Hyper-V infrastructure
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
Cc: Wei Liu <liuwe@microsoft.com>, Wei Liu <wl@xen.org>,
 Paul Durrant <paul@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Michael Kelley <mikelley@microsoft.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhpcyBwYXRjaCBzZXJlaXMgaW1wbGVtZW50cyBzZXZlcmFsIGltcG9ydGFudCBmdW5jdGlvbmFs
aXRpZXMgdG8gcnVuClhlbiBvbiB0b3Agb2YgSHlwZXItVi4KClNlZSBpbmRpdmlkdWFsIHBhdGNo
ZXMgZm9yIG1vcmUgZGV0YWlscy4gVGhlIGZpcnN0IHBhdGNoIGFkZHMgYW4KZXhlY3V0YWJsZSBm
aXhtYXAgZmFjaWxpdHksIHdoaWNoIGlzIHg4NiBnZW5lcmljLiBUaGUgcmVzdCBvZiB0aGUgc2Vy
aWVzCmlzIEh5cGVyLVYgc3BlY2lmaWMuCgpJJ3ZlIGNoZWNrZWQgdGhlIGFzc2VtYmx5IGNvZGUg
YXMgd2VsbCBhcyBwdXR0aW5nIGluIGEgdGVzdCBwYXRjaCB0bwptYWtlIHN1cmUgdGhlIGh5cGVy
Y2FsbCBpbnRlcmZhY2UgaXMgaW1wbGVtZW50ZWQgY29ycmVjdGx5LgoKV2VpLgoKQ2M6IEphbiBC
ZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KQ2M6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29w
ZXIzQGNpdHJpeC5jb20+CkNjOiBXZWkgTGl1IDx3bEB4ZW4ub3JnPgpDYzogUm9nZXIgUGF1IE1v
bm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+CkNjOiBNaWNoYWVsIEtlbGxleSA8bWlrZWxsZXlA
bWljcm9zb2Z0LmNvbT4KQ2M6IFBhdWwgRHVycmFudCA8cGF1bEB4ZW4ub3JnPgoKV2VpIExpdSAo
Nyk6CiAgeDg2OiBwcm92aWRlIGV4ZWN1dGFibGUgZml4bWFwIGZhY2lsaXR5CiAgeDg2L2h5cGVy
djogc2V0dXAgaHlwZXJjYWxsIHBhZ2UKICB4ODYvaHlwZXJ2OiBwcm92aWRlIEh5cGVyLVYgaHlw
ZXJjYWxsIGZ1bmN0aW9ucwogIERPIE5PVCBBUFBMWTogeDg2L2h5cGVydjogaXNzdWUgYW4gaHlw
ZXJjYWxsCiAgeDg2L2h5cGVydjogcHJvdmlkZSBwZXJjcHUgaHlwZXJjYWxsIGlucHV0IHBhZ2UK
ICB4ODYvaHlwZXJ2OiByZXRyaWV2ZSB2cF9pbmRleCBmcm9tIEh5cGVyLVYKICB4ODYvaHlwZXJ2
OiBzZXR1cCBWUCBhc3Npc3QgcGFnZQoKIHhlbi9hcmNoL3g4Ni9ib290L3g4Nl82NC5TICAgICAg
ICAgICAgICAgfCAgMTAgKy0KIHhlbi9hcmNoL3g4Ni9lODIwLmMgICAgICAgICAgICAgICAgICAg
ICAgfCAgNDEgKysrKysrLS0KIHhlbi9hcmNoL3g4Ni9ndWVzdC9oeXBlcnYvaHlwZXJ2LmMgICAg
ICAgfCAxMTkgKysrKysrKysrKysrKysrKysrKysrKy0KIHhlbi9hcmNoL3g4Ni9ndWVzdC9oeXBl
cnYvcHJpdmF0ZS5oICAgICAgfCAgMzEgKysrKysrCiB4ZW4vYXJjaC94ODYvbGl2ZXBhdGNoLmMg
ICAgICAgICAgICAgICAgIHwgICAzICstCiB4ZW4vYXJjaC94ODYvbW0uYyAgICAgICAgICAgICAg
ICAgICAgICAgIHwgICA5ICsrCiB4ZW4vYXJjaC94ODYvc21wYm9vdC5jICAgICAgICAgICAgICAg
ICAgIHwgICAyICstCiB4ZW4vYXJjaC94ODYveGVuLmxkcy5TICAgICAgICAgICAgICAgICAgIHwg
ICAzICsKIHhlbi9pbmNsdWRlL2FzbS14ODYvY29uZmlnLmggICAgICAgICAgICAgfCAgIDIgKy0K
IHhlbi9pbmNsdWRlL2FzbS14ODYvZml4bWFwLmggICAgICAgICAgICAgfCAgMjggKysrKysrCiB4
ZW4vaW5jbHVkZS9hc20teDg2L2d1ZXN0L2h5cGVydi1oY2FsbC5oIHwgIDk4ICsrKysrKysrKysr
KysrKysrKysKIHhlbi9pbmNsdWRlL2FzbS14ODYvZ3Vlc3QvaHlwZXJ2LXRsZnMuaCAgfCAgIDUg
Ky0KIDEyIGZpbGVzIGNoYW5nZWQsIDMzNCBpbnNlcnRpb25zKCspLCAxNyBkZWxldGlvbnMoLSkK
IGNyZWF0ZSBtb2RlIDEwMDY0NCB4ZW4vYXJjaC94ODYvZ3Vlc3QvaHlwZXJ2L3ByaXZhdGUuaAog
Y3JlYXRlIG1vZGUgMTAwNjQ0IHhlbi9pbmNsdWRlL2FzbS14ODYvZ3Vlc3QvaHlwZXJ2LWhjYWxs
LmgKCi0tIAoyLjIwLjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
