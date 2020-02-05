Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CDEB153734
	for <lists+xen-devel@lfdr.de>; Wed,  5 Feb 2020 19:05:09 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1izP0R-0006sS-WB; Wed, 05 Feb 2020 18:02:31 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=z73q=3Z=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1izP0Q-0006sG-M7
 for xen-devel@lists.xenproject.org; Wed, 05 Feb 2020 18:02:30 +0000
X-Inumbo-ID: aca46ac4-4841-11ea-9178-12813bfff9fa
Received: from mail-wr1-f66.google.com (unknown [209.85.221.66])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id aca46ac4-4841-11ea-9178-12813bfff9fa;
 Wed, 05 Feb 2020 18:02:29 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id y11so3883658wrt.6
 for <xen-devel@lists.xenproject.org>; Wed, 05 Feb 2020 10:02:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qwfpjxdFnRoECf8ot+2ry0zQDK/D4NNdHk1B2vQf5ss=;
 b=ium3nclbgIBMI6xmyIlO0GFpg2XJlyQPaBICZGTeQqp4H2tDzwnivtNolh59dsqC0U
 zipsSM0tqhh0hXWpGE8wtoX00uPw4lBPtyxYO+Fwvw5uiloYJ1Dm6AEkHUFLy7l4SiLm
 6/VHUKjdKhD60ysJ1ryDxrB3YIIimcWYfRaaHJYCYaaDf+x0OAn01L5HviuJPGExVSmE
 WoehawSPgOE4AWhi2lsxTfmjQhvpIQtAfYtKtg2HloyYDTj7qVQ4/Ud5YQNljrqwudGa
 fpPMnd1GUP4jn7sRv52Ue/9AJudreInyAJ8V20r0TobU95mUUhYBjTjfGiZBJY2mYq1e
 KZMw==
X-Gm-Message-State: APjAAAU2GX6U5sxncDWZrOUU8D0mEkBlaTQsaMKi57CPhISRBAbt1UGP
 oK86gBaJH64bo7EU+cC9aDgbysu+8BY=
X-Google-Smtp-Source: APXvYqxXb/0KRU9PG8SwNaVqzwsUkcB642bzmrBpilBcqTecptLZdEZrlH20Lt80OxdHxRJeWJluVQ==
X-Received: by 2002:adf:93c1:: with SMTP id 59mr30209599wrp.399.1580925748990; 
 Wed, 05 Feb 2020 10:02:28 -0800 (PST)
Received: from localhost.localdomain (41.142.6.51.dyn.plus.net. [51.6.142.41])
 by smtp.gmail.com with ESMTPSA id
 t9sm735716wrv.63.2020.02.05.10.02.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Feb 2020 10:02:28 -0800 (PST)
From: Wei Liu <wl@xen.org>
To: Xen Development List <xen-devel@lists.xenproject.org>
Date: Wed,  5 Feb 2020 18:02:24 +0000
Message-Id: <20200205180224.6525-1-wl@xen.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH] x86/guest/xen: only set HVM parameter on BSP
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlcmUgaXMgbm8gbmVlZCBmb3IgZXZlcnkgQ1BVIHRvIHNldCBhIGd1ZXN0IHByb3BlcnR5LgoK
U2lnbmVkLW9mZi1ieTogV2VpIExpdSA8d2xAeGVuLm9yZz4KLS0tCiB4ZW4vYXJjaC94ODYvZ3Vl
c3QveGVuL3hlbi5jIHwgMjIgKysrKysrKysrKysrKy0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQs
IDEzIGluc2VydGlvbnMoKyksIDkgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gv
eDg2L2d1ZXN0L3hlbi94ZW4uYyBiL3hlbi9hcmNoL3g4Ni9ndWVzdC94ZW4veGVuLmMKaW5kZXgg
MWY4NjhmMmY4ZC4uM2NmOGY2NjdhMSAxMDA2NDQKLS0tIGEveGVuL2FyY2gveDg2L2d1ZXN0L3hl
bi94ZW4uYworKysgYi94ZW4vYXJjaC94ODYvZ3Vlc3QveGVuL3hlbi5jCkBAIC0yMDYsMTEgKzIw
Niw2IEBAIHN0YXRpYyBpbnQgaW5pdF9ldnRjaG4odm9pZCkKIHsKICAgICBzdGF0aWMgdWludDhf
dCBldnRjaG5fdXBjYWxsX3ZlY3RvcjsKICAgICBpbnQgcmM7Ci0gICAgc3RydWN0IHhlbl9odm1f
cGFyYW0gYSA9IHsKLSAgICAgICAgLmRvbWlkID0gRE9NSURfU0VMRiwKLSAgICAgICAgLmluZGV4
ID0gSFZNX1BBUkFNX0NBTExCQUNLX0lSUSwKLSAgICAgICAgLnZhbHVlID0gMSwKLSAgICB9Owog
CiAgICAgaWYgKCAhZXZ0Y2huX3VwY2FsbF92ZWN0b3IgKQogICAgICAgICBhbGxvY19kaXJlY3Rf
YXBpY192ZWN0b3IoJmV2dGNobl91cGNhbGxfdmVjdG9yLCB4ZW5fZXZ0Y2huX3VwY2FsbCk7CkBA
IC0yMjUsMTAgKzIyMCwxOSBAQCBzdGF0aWMgaW50IGluaXRfZXZ0Y2huKHZvaWQpCiAgICAgICAg
IHJldHVybiByYzsKICAgICB9CiAKLSAgICAvKiBUcmljayB0b29sc3RhY2sgdG8gdGhpbmsgd2Ug
YXJlIGVubGlnaHRlbmVkICovCi0gICAgcmMgPSB4ZW5faHlwZXJjYWxsX2h2bV9vcChIVk1PUF9z
ZXRfcGFyYW0sICZhKTsKLSAgICBpZiAoIHJjICkKLSAgICAgICAgcHJpbnRrKCJVbmFibGUgdG8g
c2V0IEhWTV9QQVJBTV9DQUxMQkFDS19JUlFcbiIpOworICAgIGlmICggc21wX3Byb2Nlc3Nvcl9p
ZCgpID09IDAgKQorICAgIHsKKyAgICAgICAgc3RydWN0IHhlbl9odm1fcGFyYW0gYSA9IHsKKyAg
ICAgICAgICAgIC5kb21pZCA9IERPTUlEX1NFTEYsCisgICAgICAgICAgICAuaW5kZXggPSBIVk1f
UEFSQU1fQ0FMTEJBQ0tfSVJRLAorICAgICAgICAgICAgLnZhbHVlID0gMSwKKyAgICAgICAgfTsK
KworICAgICAgICAvKiBUcmljayB0b29sc3RhY2sgdG8gdGhpbmsgd2UgYXJlIGVubGlnaHRlbmVk
ICovCisgICAgICAgIHJjID0geGVuX2h5cGVyY2FsbF9odm1fb3AoSFZNT1Bfc2V0X3BhcmFtLCAm
YSk7CisgICAgICAgIGlmICggcmMgKQorICAgICAgICAgICAgcHJpbnRrKCJVbmFibGUgdG8gc2V0
IEhWTV9QQVJBTV9DQUxMQkFDS19JUlFcbiIpOworICAgIH0KIAogICAgIHJldHVybiByYzsKIH0K
LS0gCjIuMjAuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
