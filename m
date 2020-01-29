Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5050614D1E3
	for <lists+xen-devel@lfdr.de>; Wed, 29 Jan 2020 21:23:59 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iwtqA-0006wV-Q9; Wed, 29 Jan 2020 20:21:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=bu37=3S=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1iwtqA-0006w6-0Z
 for xen-devel@lists.xenproject.org; Wed, 29 Jan 2020 20:21:34 +0000
X-Inumbo-ID: d6ac66fe-42d4-11ea-8396-bc764e2007e4
Received: from mail-wr1-x444.google.com (unknown [2a00:1450:4864:20::444])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d6ac66fe-42d4-11ea-8396-bc764e2007e4;
 Wed, 29 Jan 2020 20:20:49 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id k11so1024681wrd.9
 for <xen-devel@lists.xenproject.org>; Wed, 29 Jan 2020 12:20:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9g3iTQhv4DyHzwGgjHdIef6GauOsAtk67e0Cyiz0EQw=;
 b=f0PScuK5w4yGOs6U+IObwEnYCSaWM9BSUS5EJ/TVYFueKkgOcLlZTnUhZqozYejssr
 i3EQ/NX0qI2zc27HvqhQXJ4XgzU6uEFGF+gLBbveCMSMmoJoA5rZ80ksZsMujPM2MCtR
 A9WQkmSfpS+FfljjBMPfY3krGc+yd8jtPAVVGEefmCtGjaNO07kZoAl5JABb1BbIj80d
 /C8Ee9iZ1eyDEZKS2WyfxMMJa9XPbUmTFVqKjapQ4/tih4VPorHZdffcJtVe8KF5GNhY
 oLiJoALiBJI7xWN3fYtkObxBzRDIT88dbVBoTCpRa9nxiLg0aLb5Vq+PoTAerJUVC7RK
 FkRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=9g3iTQhv4DyHzwGgjHdIef6GauOsAtk67e0Cyiz0EQw=;
 b=cPwAMgYFJac0AGnKrs50aGyw1royZSezbS6b+MCewi2lTAqU1cdCVkXK2EPFq7nmrl
 Bkbyqzmb5GmCE1laI8Qx/qlzdr91PJJb9uh2ejlUVI1/rPi8hO0SxRgLFRfrUKfyJYLK
 KIcNwnc+/IKQ6qwX9d0R1zDU3sJjzdcyA/48Kx5RFQ/7ZTt4QnwTB2nOwQGnQZelK2HE
 ytKS5xObcrZ/PsUV8hCo4HC3g2P2Cef2kXstWxvKMhAu2zYgN+paSyJ7Up9OS6vBWqhN
 JAgDcgUkzOEEAFjR2yRsyFe2F4QY0DmHqJ/H2Nb7e7uMY3vgJQPVqSt5YfL7cARJDqf2
 0CBQ==
X-Gm-Message-State: APjAAAWZ/36xy48U3hVSJIpo3EBEPouf5bLM5J4y0bfF2XrtzJ1cYE4a
 1zRhTijEaMPJGM2NMsgYN9E5Kxi68wc=
X-Google-Smtp-Source: APXvYqwp6kymbHNPC8nm/01CpwpfI7w1ecgBosM7fI+t2uwImDdGy8S/3Qs1fx9uYKW9TY2NiY/FGw==
X-Received: by 2002:a5d:6406:: with SMTP id z6mr618262wru.294.1580329248522;
 Wed, 29 Jan 2020 12:20:48 -0800 (PST)
Received: from localhost.localdomain (41.142.6.51.dyn.plus.net. [51.6.142.41])
 by smtp.gmail.com with ESMTPSA id
 a22sm3564115wmd.20.2020.01.29.12.20.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Jan 2020 12:20:48 -0800 (PST)
From: Wei Liu <wl@xen.org>
X-Google-Original-From: Wei Liu <liuwe@microsoft.com>
To: Xen Development List <xen-devel@lists.xenproject.org>
Date: Wed, 29 Jan 2020 20:20:33 +0000
Message-Id: <20200129202034.15052-12-liuwe@microsoft.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200129202034.15052-1-liuwe@microsoft.com>
References: <20200129202034.15052-1-liuwe@microsoft.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v5 11/12] x86/hyperv: retrieve vp_index from
 Hyper-V
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
 Paul Durrant <pdurrant@amazon.com>, Michael Kelley <mikelley@microsoft.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhpcyB3aWxsIGJlIHVzZWZ1bCB3aGVuIGludm9raW5nIGh5cGVyY2FsbCB0aGF0IHRhcmdldHMg
c3BlY2lmaWMKdmNwdShzKS4KClNpZ25lZC1vZmYtYnk6IFdlaSBMaXUgPGxpdXdlQG1pY3Jvc29m
dC5jb20+ClJldmlld2VkLWJ5OiBQYXVsIER1cnJhbnQgPHBhdWxAeGVuLm9yZz4KQWNrZWQtYnk6
IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KLS0tCnY1OgoxLiBBZGQgSmFuJ3MgQWNr
LgoKdjQ6CjEuIFVzZSBwcml2YXRlLmgKMi4gQWRkIFBhdWwncyByZXZpZXcgdGFnCgp2MjoKMS4g
Rm9sZCBpbnRvIHNldHVwX3BjcHVfYXJnIGZ1bmN0aW9uCi0tLQogeGVuL2FyY2gveDg2L2d1ZXN0
L2h5cGVydi9oeXBlcnYuYyAgfCA1ICsrKysrCiB4ZW4vYXJjaC94ODYvZ3Vlc3QvaHlwZXJ2L3By
aXZhdGUuaCB8IDEgKwogMiBmaWxlcyBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKykKCmRpZmYgLS1n
aXQgYS94ZW4vYXJjaC94ODYvZ3Vlc3QvaHlwZXJ2L2h5cGVydi5jIGIveGVuL2FyY2gveDg2L2d1
ZXN0L2h5cGVydi9oeXBlcnYuYwppbmRleCBmMGZhY2NjYmFkLi5hZjBkNmVkNjkyIDEwMDY0NAot
LS0gYS94ZW4vYXJjaC94ODYvZ3Vlc3QvaHlwZXJ2L2h5cGVydi5jCisrKyBiL3hlbi9hcmNoL3g4
Ni9ndWVzdC9oeXBlcnYvaHlwZXJ2LmMKQEAgLTMxLDYgKzMxLDcgQEAKIAogc3RydWN0IG1zX2h5
cGVydl9pbmZvIF9fcmVhZF9tb3N0bHkgbXNfaHlwZXJ2OwogREVGSU5FX1BFUl9DUFVfUkVBRF9N
T1NUTFkodm9pZCAqLCBodl9wY3B1X2lucHV0X3BhZ2UpOworREVGSU5FX1BFUl9DUFVfUkVBRF9N
T1NUTFkodW5zaWduZWQgaW50LCBodl92cF9pbmRleCk7CiAKIHN0YXRpYyB1aW50NjRfdCBnZW5l
cmF0ZV9ndWVzdF9pZCh2b2lkKQogewpAQCAtMTMzLDYgKzEzNCw3IEBAIHN0YXRpYyB2b2lkIF9f
aW5pdCBzZXR1cF9oeXBlcmNhbGxfcGFnZSh2b2lkKQogc3RhdGljIGludCBzZXR1cF9oeXBlcmNh
bGxfcGNwdV9hcmcodm9pZCkKIHsKICAgICB2b2lkICptYXBwaW5nOworICAgIHVpbnQ2NF90IHZw
X2luZGV4X21zcjsKIAogICAgIGlmICggdGhpc19jcHUoaHZfcGNwdV9pbnB1dF9wYWdlKSApCiAg
ICAgICAgIHJldHVybiAwOwpAQCAtMTQ3LDYgKzE0OSw5IEBAIHN0YXRpYyBpbnQgc2V0dXBfaHlw
ZXJjYWxsX3BjcHVfYXJnKHZvaWQpCiAKICAgICB0aGlzX2NwdShodl9wY3B1X2lucHV0X3BhZ2Up
ID0gbWFwcGluZzsKIAorICAgIHJkbXNybChIVl9YNjRfTVNSX1ZQX0lOREVYLCB2cF9pbmRleF9t
c3IpOworICAgIHRoaXNfY3B1KGh2X3ZwX2luZGV4KSA9IHZwX2luZGV4X21zcjsKKwogICAgIHJl
dHVybiAwOwogfQogCmRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvZ3Vlc3QvaHlwZXJ2L3ByaXZh
dGUuaCBiL3hlbi9hcmNoL3g4Ni9ndWVzdC9oeXBlcnYvcHJpdmF0ZS5oCmluZGV4IGEzMzkyNzQ5
ODUuLmMxYzI0MzFlZmYgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL3g4Ni9ndWVzdC9oeXBlcnYvcHJp
dmF0ZS5oCisrKyBiL3hlbi9hcmNoL3g4Ni9ndWVzdC9oeXBlcnYvcHJpdmF0ZS5oCkBAIC0yNSw1
ICsyNSw2IEBACiAjaW5jbHVkZSA8eGVuL3BlcmNwdS5oPgogCiBERUNMQVJFX1BFUl9DUFUodm9p
ZCAqLCBodl9wY3B1X2lucHV0X3BhZ2UpOworREVDTEFSRV9QRVJfQ1BVKHVuc2lnbmVkIGludCwg
aHZfdnBfaW5kZXgpOwogCiAjZW5kaWYgLyogX19YRU5fSFlQRVJWX1BSSVZJQVRFX0hfXyAgKi8K
LS0gCjIuMjAuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
