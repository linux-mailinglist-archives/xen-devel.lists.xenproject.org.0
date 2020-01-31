Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C56314F1AA
	for <lists+xen-devel@lfdr.de>; Fri, 31 Jan 2020 18:53:17 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ixaQw-0006pM-BJ; Fri, 31 Jan 2020 17:50:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=euI0=3U=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1ixaQu-0006oO-Je
 for xen-devel@lists.xenproject.org; Fri, 31 Jan 2020 17:50:20 +0000
X-Inumbo-ID: 114f5676-4452-11ea-b211-bc764e2007e4
Received: from mail-wr1-x443.google.com (unknown [2a00:1450:4864:20::443])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 114f5676-4452-11ea-b211-bc764e2007e4;
 Fri, 31 Jan 2020 17:49:46 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id a6so9614658wrx.12
 for <xen-devel@lists.xenproject.org>; Fri, 31 Jan 2020 09:49:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OuvS4yHEnv92OOnV7XktlEYfMKEuteYkS0t0AqPy5go=;
 b=hwvD5kmfTcaY4SDDf56iLEhTGp+0/f2bFu2wV6wAesdwO/JabEtA5MaYN/5ZtPVntv
 suaAwo8kO4VM3IPzL6maUg66nkFBijUP8K2viaEK7Aa9T7EFLxIA4Nr0buBNnRyO3G0d
 Yiubzdy4gjCSHGkiRwXl0DA8+XFl4sEUnLs+6KBk2J4QlO2/VN2D5i6Ee4bjJDNPIPOx
 zWcpu0JyclCOR//OS9Wq++NKr0qgJPNrku/DwUX87+sJE9yoLMm9ErblRUyd1M9kIy9h
 naHYR/D8QN2TciW8ttnVdawKwsS7cIq0aAjDbby6EcTF0+AFSlPGXMrGbSY5/FioNA/x
 zsJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=OuvS4yHEnv92OOnV7XktlEYfMKEuteYkS0t0AqPy5go=;
 b=TjnYImh8rT5uf6UJZnvZNU+NPVpJGgzOoQVaQH4d8IZ9OFf2r33pZinTxeaPx68kyO
 XrCzE4lVYTjMk473TX3ikKC2IqrXhe7udt7NEWuN2o3A51bvzSbBCtQXRnKFjyxnfzrb
 Qza9Ex3rkNBelkPnJy01OttIOOW2EcLi4UmIuW4Vjn1Vws5Qpfvh/imS5bI4+PXi/iZO
 jz+VE4s6b1stM0QVDjM2i926Raf0kPlWFYjaV7y4f8+/GMIaWHnycTBWFYNSQcVOfM6F
 5mspOsMCT63KphVM8h88Ic5Ubqlgyj0k5GDCTObNGufwNw2io2Yxh5WwapboqI8NdgEl
 CxMg==
X-Gm-Message-State: APjAAAVLNHIp/dkVmnkNmJDoPtD2FCd9bZDNafttVvYHI4/boiwVnW68
 y6i0yI2UanhAsqsmhW4kO+Zaq1954pw=
X-Google-Smtp-Source: APXvYqyHmpYL9shBrZJ2wnN9iAiM+ykSuxvP+dAaDUSr5n/QJiZkRjMKXJ06LxWT3bKCiy+PtJnsrw==
X-Received: by 2002:adf:81c2:: with SMTP id 60mr13002491wra.8.1580492985145;
 Fri, 31 Jan 2020 09:49:45 -0800 (PST)
Received: from localhost.localdomain (41.142.6.51.dyn.plus.net. [51.6.142.41])
 by smtp.gmail.com with ESMTPSA id
 133sm4364352wmd.5.2020.01.31.09.49.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Jan 2020 09:49:44 -0800 (PST)
From: Wei Liu <wl@xen.org>
X-Google-Original-From: Wei Liu <liuwe@microsoft.com>
To: Xen Development List <xen-devel@lists.xenproject.org>
Date: Fri, 31 Jan 2020 17:49:28 +0000
Message-Id: <20200131174930.31045-10-liuwe@microsoft.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200131174930.31045-1-liuwe@microsoft.com>
References: <20200131174930.31045-1-liuwe@microsoft.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v6 09/11] x86/hyperv: retrieve vp_index from
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
L2h5cGVydi9oeXBlcnYuYyAgfCA2ICsrKysrKwogeGVuL2FyY2gveDg2L2d1ZXN0L2h5cGVydi9w
cml2YXRlLmggfCAxICsKIDIgZmlsZXMgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspCgpkaWZmIC0t
Z2l0IGEveGVuL2FyY2gveDg2L2d1ZXN0L2h5cGVydi9oeXBlcnYuYyBiL3hlbi9hcmNoL3g4Ni9n
dWVzdC9oeXBlcnYvaHlwZXJ2LmMKaW5kZXggOGQ0NGIzNWFhNi4uNmRhYzNiZmNlYiAxMDA2NDQK
LS0tIGEveGVuL2FyY2gveDg2L2d1ZXN0L2h5cGVydi9oeXBlcnYuYworKysgYi94ZW4vYXJjaC94
ODYvZ3Vlc3QvaHlwZXJ2L2h5cGVydi5jCkBAIC0zMSw2ICszMSw3IEBACiAKIHN0cnVjdCBtc19o
eXBlcnZfaW5mbyBfX3JlYWRfbW9zdGx5IG1zX2h5cGVydjsKIERFRklORV9QRVJfQ1BVX1JFQURf
TU9TVExZKHZvaWQgKiwgaHZfaW5wdXRfcGFnZSk7CitERUZJTkVfUEVSX0NQVV9SRUFEX01PU1RM
WSh1bnNpZ25lZCBpbnQsIGh2X3ZwX2luZGV4KTsKIAogc3RhdGljIHVpbnQ2NF90IGdlbmVyYXRl
X2d1ZXN0X2lkKHZvaWQpCiB7CkBAIC0xMzUsNiArMTM2LDggQEAgc3RhdGljIHZvaWQgX19pbml0
IHNldHVwX2h5cGVyY2FsbF9wYWdlKHZvaWQpCiAKIHN0YXRpYyBpbnQgc2V0dXBfaHlwZXJjYWxs
X3BjcHVfYXJnKHZvaWQpCiB7CisgICAgdWludDY0X3QgdnBfaW5kZXhfbXNyOworCiAgICAgaWYg
KCB0aGlzX2NwdShodl9pbnB1dF9wYWdlKSApCiAgICAgICAgIHJldHVybiAwOwogCkBAIC0xNDYs
NiArMTQ5LDkgQEAgc3RhdGljIGludCBzZXR1cF9oeXBlcmNhbGxfcGNwdV9hcmcodm9pZCkKICAg
ICAgICAgcmV0dXJuIC1FTk9NRU07CiAgICAgfQogCisgICAgcmRtc3JsKEhWX1g2NF9NU1JfVlBf
SU5ERVgsIHZwX2luZGV4X21zcik7CisgICAgdGhpc19jcHUoaHZfdnBfaW5kZXgpID0gdnBfaW5k
ZXhfbXNyOworCiAgICAgcmV0dXJuIDA7CiB9CiAKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9n
dWVzdC9oeXBlcnYvcHJpdmF0ZS5oIGIveGVuL2FyY2gveDg2L2d1ZXN0L2h5cGVydi9wcml2YXRl
LmgKaW5kZXggMDkzOTg1YTk0Yi4uZDE3NjVkNGYyMyAxMDA2NDQKLS0tIGEveGVuL2FyY2gveDg2
L2d1ZXN0L2h5cGVydi9wcml2YXRlLmgKKysrIGIveGVuL2FyY2gveDg2L2d1ZXN0L2h5cGVydi9w
cml2YXRlLmgKQEAgLTI1LDUgKzI1LDYgQEAKICNpbmNsdWRlIDx4ZW4vcGVyY3B1Lmg+CiAKIERF
Q0xBUkVfUEVSX0NQVSh2b2lkICosIGh2X2lucHV0X3BhZ2UpOworREVDTEFSRV9QRVJfQ1BVKHVu
c2lnbmVkIGludCwgaHZfdnBfaW5kZXgpOwogCiAjZW5kaWYgLyogX19YRU5fSFlQRVJWX1BSSVZJ
QVRFX0hfXyAgKi8KLS0gCjIuMjAuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
