Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4049414D1DA
	for <lists+xen-devel@lfdr.de>; Wed, 29 Jan 2020 21:23:06 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iwtpc-0006Yk-Pm; Wed, 29 Jan 2020 20:21:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=bu37=3S=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1iwtpa-0006YD-VO
 for xen-devel@lists.xenproject.org; Wed, 29 Jan 2020 20:20:58 +0000
X-Inumbo-ID: d290ead6-42d4-11ea-8396-bc764e2007e4
Received: from mail-wr1-x441.google.com (unknown [2a00:1450:4864:20::441])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d290ead6-42d4-11ea-8396-bc764e2007e4;
 Wed, 29 Jan 2020 20:20:42 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id z7so979852wrl.13
 for <xen-devel@lists.xenproject.org>; Wed, 29 Jan 2020 12:20:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gCFi7p2cW832Oj/4SVP/DOq5zNQ19Ssf0CeEfHPDZW8=;
 b=UGdQvDH0kvj8CPfpAVPM2GPWDjpOeQV+LlipPwIQQajytXitYVU8e6auoEOexZ51Co
 aHmLhglQy5QVyCWl3gat1MnhrmwvsMCmRwcO7jBKjHSAheIsJBmJ9/5zVm0JlqhJc0z5
 vpSyvSxrZuVPWRgMK+Z2gj1KvOBQKr1LxVtV5G9bOrU4U0otxJ3hgayBaGwMjSoF2KWs
 SsyBWWoPbzMmHkGZ6o3VMEZD8Wq0JMjE5Sgf/z6+E4p6eL7frHtH3C0rBs5T2TJEoCLp
 zfjM2/o4D1rP3tSFDvHoilybJwCdv5SHxK07xbM2WNtkKkfE0VxBaJlK4kS66auL2K2s
 BrfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=gCFi7p2cW832Oj/4SVP/DOq5zNQ19Ssf0CeEfHPDZW8=;
 b=nDENmJdvw+LLqx/pHB40SCWfmLzs15p05uaTKmFMPkLsEDgGfL0H9KiScXDDGgr5/7
 zlI+OC3Ugdl1GwT18ZPIPqjlepfKfjlosbkJ/2mn0qkcG/givdCu5Y7KvlzY8jyqwIJO
 Bb51LNRGCVU5sOVnESz76Lxnw+QhEfx4xiFfwSLVxq3V6l8TMngFCDQf7xLqElphLHOW
 43WREbyZjwc3kPUnRhbm1sWMiCiC0P5OzwN1nTyEedPk9yM/ZehYOp4HNjPOIdSGH50H
 XF7forzZNwhDa1OzGt3xCyKC9s7IHyh+e5rkwAzTlFv+NtLbID0wvBl/Jn42DhfdiIdG
 jXug==
X-Gm-Message-State: APjAAAWNzSCFl/lDEKxM8TFIv8v+YEzspzVJ706nsfqYxNUdxroxoK1z
 sDUZYb4rtlEh+3GthfrEKg8hjPD0+BY=
X-Google-Smtp-Source: APXvYqzt8Mlxu7sk+n0p3Z+yz/gJsQAhDgj0fvBlFArkkEcdGPWBrI5u9ORxFQ9ccso3qsYIEDpQhQ==
X-Received: by 2002:adf:f64b:: with SMTP id x11mr560145wrp.355.1580329241596; 
 Wed, 29 Jan 2020 12:20:41 -0800 (PST)
Received: from localhost.localdomain (41.142.6.51.dyn.plus.net. [51.6.142.41])
 by smtp.gmail.com with ESMTPSA id
 a22sm3564115wmd.20.2020.01.29.12.20.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Jan 2020 12:20:41 -0800 (PST)
From: Wei Liu <wl@xen.org>
X-Google-Original-From: Wei Liu <liuwe@microsoft.com>
To: Xen Development List <xen-devel@lists.xenproject.org>
Date: Wed, 29 Jan 2020 20:20:26 +0000
Message-Id: <20200129202034.15052-5-liuwe@microsoft.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200129202034.15052-1-liuwe@microsoft.com>
References: <20200129202034.15052-1-liuwe@microsoft.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v5 04/12] x86: make paddr_bits available earlier
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
 Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <pdurrant@amazon.com>,
 Michael Kelley <mikelley@microsoft.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

TW92ZSBlYXJseV9jcHVfaW5pdCBiZWZvcmUgaW5pdF9lODIwLCBzdWNoIHRoYXQgcGFkZHJfYml0
cyBjYW4gYmUgdXNlZApieSBlODIwIGNvZGUuCgpUaGlzIHdpbGwgcmVkdWNlIGNvZGUgcmVwZXRp
dGlvbiBhbmQgcHJlcGFyZSBmb3IgZnVydGhlciBhZGp1c3RtZW50IHdoZW4KTDAgaHlwZXJ2aXNv
ciBjb21lcyBpbnRvIHBsYXkuCgpTaWduZWQtb2ZmLWJ5OiBXZWkgTGl1IDxsaXV3ZUBtaWNyb3Nv
ZnQuY29tPgotLS0KIHhlbi9hcmNoL3g4Ni9lODIwLmMgIHwgMTQgKysrKy0tLS0tLS0tLS0KIHhl
bi9hcmNoL3g4Ni9zZXR1cC5jIHwgIDUgKysrLS0KIDIgZmlsZXMgY2hhbmdlZCwgNyBpbnNlcnRp
b25zKCspLCAxMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvZTgyMC5j
IGIveGVuL2FyY2gveDg2L2U4MjAuYwppbmRleCAwODJmOTkyOGExLi4zODkyYzljZmI3IDEwMDY0
NAotLS0gYS94ZW4vYXJjaC94ODYvZTgyMC5jCisrKyBiL3hlbi9hcmNoL3g4Ni9lODIwLmMKQEAg
LTQyMCw3ICs0MjAsNyBAQCBzdGF0aWMgdWludDY0X3QgX19pbml0IG10cnJfdG9wX29mX3JhbSh2
b2lkKQogewogICAgIHVpbnQzMl90IGVheCwgZWJ4LCBlY3gsIGVkeDsKICAgICB1aW50NjRfdCBt
dHJyX2NhcCwgbXRycl9kZWYsIGFkZHJfbWFzaywgYmFzZSwgbWFzaywgdG9wOwotICAgIHVuc2ln
bmVkIGludCBpLCBwaHlzX2JpdHMgPSAzNjsKKyAgICB1bnNpZ25lZCBpbnQgaTsKIAogICAgIC8q
IEJ5IGRlZmF1bHQgd2UgY2hlY2sgb25seSBJbnRlbCBzeXN0ZW1zLiAqLwogICAgIGlmICggZTgy
MF9tdHJyX2NsaXAgPT0gLTEgKQpAQCAtNDQ1LDE1ICs0NDUsOSBAQCBzdGF0aWMgdWludDY0X3Qg
X19pbml0IG10cnJfdG9wX29mX3JhbSh2b2lkKQogICAgIGlmICggIXRlc3RfYml0KFg4Nl9GRUFU
VVJFX01UUlIgJiAzMSwgJmVkeCkgKQogICAgICAgICAgcmV0dXJuIDA7CiAKLSAgICAvKiBGaW5k
IHRoZSBwaHlzaWNhbCBhZGRyZXNzIHNpemUgZm9yIHRoaXMgQ1BVLiAqLwotICAgIGVheCA9IGNw
dWlkX2VheCgweDgwMDAwMDAwKTsKLSAgICBpZiAoIChlYXggPj4gMTYpID09IDB4ODAwMCAmJiBl
YXggPj0gMHg4MDAwMDAwOCApCi0gICAgewotICAgICAgICBwaHlzX2JpdHMgPSAodWludDhfdClj
cHVpZF9lYXgoMHg4MDAwMDAwOCk7Ci0gICAgICAgIGlmICggcGh5c19iaXRzID4gUEFERFJfQklU
UyApCi0gICAgICAgICAgICBwaHlzX2JpdHMgPSBQQUREUl9CSVRTOwotICAgIH0KLSAgICBhZGRy
X21hc2sgPSAoKDF1bGwgPDwgcGh5c19iaXRzKSAtIDEpICYgfigoMXVsbCA8PCAxMikgLSAxKTsK
KyAgICAvKiBwYWRkcl9iaXRzIG11c3QgaGF2ZSBiZWVuIHNldCBhdCB0aGlzIHBvaW50ICovCisg
ICAgQVNTRVJUKHBhZGRyX2JpdHMpOworICAgIGFkZHJfbWFzayA9ICgoMXVsbCA8PCBwYWRkcl9i
aXRzKSAtIDEpICYgUEFHRV9NQVNLOwogCiAgICAgcmRtc3JsKE1TUl9NVFJSY2FwLCBtdHJyX2Nh
cCk7CiAgICAgcmRtc3JsKE1TUl9NVFJSZGVmVHlwZSwgbXRycl9kZWYpOwpkaWZmIC0tZ2l0IGEv
eGVuL2FyY2gveDg2L3NldHVwLmMgYi94ZW4vYXJjaC94ODYvc2V0dXAuYwppbmRleCBkODU4ODgz
NDA0Li44OWZlNDkxNDlmIDEwMDY0NAotLS0gYS94ZW4vYXJjaC94ODYvc2V0dXAuYworKysgYi94
ZW4vYXJjaC94ODYvc2V0dXAuYwpAQCAtOTU0LDYgKzk1NCw5IEBAIHZvaWQgX19pbml0IG5vcmV0
dXJuIF9fc3RhcnRfeGVuKHVuc2lnbmVkIGxvbmcgbWJpX3ApCiAgICAgZWxzZQogICAgICAgICBw
YW5pYygiQm9vdGxvYWRlciBwcm92aWRlZCBubyBtZW1vcnkgaW5mb3JtYXRpb25cbiIpOwogCisg
ICAgLyogVGhpcyBtdXN0IGNvbWUgYmVmb3JlIGU4MjAgY29kZSBiZWN1YXVzZSBpdCBzZXRzIHBh
ZGRyX2JpdHMuICovCisgICAgZWFybHlfY3B1X2luaXQoKTsKKwogICAgIC8qIFNhbml0aXNlIHRo
ZSByYXcgRTgyMCBtYXAgdG8gcHJvZHVjZSBhIGZpbmFsIGNsZWFuIHZlcnNpb24uICovCiAgICAg
bWF4X3BhZ2UgPSByYXdfbWF4X3BhZ2UgPSBpbml0X2U4MjAobWVtbWFwX3R5cGUsICZlODIwX3Jh
dyk7CiAKQEAgLTE1MzIsOCArMTUzNSw2IEBAIHZvaWQgX19pbml0IG5vcmV0dXJuIF9fc3RhcnRf
eGVuKHVuc2lnbmVkIGxvbmcgbWJpX3ApCiAgICAgc29mdGlycV9pbml0KCk7CiAgICAgdGFza2xl
dF9zdWJzeXNfaW5pdCgpOwogCi0gICAgZWFybHlfY3B1X2luaXQoKTsKLQogICAgIHBhZ2luZ19p
bml0KCk7CiAKICAgICB0Ym9vdF9wcm9iZSgpOwotLSAKMi4yMC4xCgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
