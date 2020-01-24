Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C781148675
	for <lists+xen-devel@lfdr.de>; Fri, 24 Jan 2020 15:02:05 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iuzRt-0006OQ-9U; Fri, 24 Jan 2020 13:56:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=E7E7=3N=gmail.com=tamas.k.lengyel@srs-us1.protection.inumbo.net>)
 id 1iuzRr-0006OL-9c
 for xen-devel@lists.xenproject.org; Fri, 24 Jan 2020 13:56:35 +0000
X-Inumbo-ID: 50316452-3eb1-11ea-aecd-bc764e2007e4
Received: from mail-il1-f195.google.com (unknown [209.85.166.195])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 50316452-3eb1-11ea-aecd-bc764e2007e4;
 Fri, 24 Jan 2020 13:56:26 +0000 (UTC)
Received: by mail-il1-f195.google.com with SMTP id l4so1677009ilj.1
 for <xen-devel@lists.xenproject.org>; Fri, 24 Jan 2020 05:56:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hxGWCYOQPu/c+TP5D2Cr3/H8MhMAqAxzxRilmXDyP+Q=;
 b=c32gW2URT8olsxZwgofzlGd11ndkl1LdIwmm7ynTdnCtAavLL/4SnvmD7ALm2Po5RQ
 qPH1FXSBY7zIVJ2K1zrdIbd1rRY3BdVe9R9F/Cq+sGgt/WRXMp0IDEULc7m8umBVhpWz
 FdktxoF/sRY6bild86h04z8LJDzJH7lr2uv/3pA581DdYUIRQQDg9gDQYnDpgMnU8/iu
 gnQu+FEM///008bDXdNGzY3eaJ3RfOmqtY8EojNj79QDN6b30RZ5z1DonCbbqRjTGVZs
 R/k/q33Mzx7qEItlCw2/0EvoiFE/QHhf+8F4SjXIjenzSlEJam5c91Yu37WlLS+NmdyN
 jtDQ==
X-Gm-Message-State: APjAAAU/SOwY5IUVF0VUhItMadNmzNfFwZedT5WGw+00gDi0JtsxZLX9
 574Eby1OpUfxG2qUE3TzetoUGf4Q
X-Google-Smtp-Source: APXvYqw3xUBix3DzJmnYVrCFuHcWynrvIA29DYyEeyB2wWoFuZ7CgecUQsfw6Ju5SfeoWEGcMCJE5A==
X-Received: by 2002:a92:86ce:: with SMTP id l75mr3318836ilh.4.1579874185640;
 Fri, 24 Jan 2020 05:56:25 -0800 (PST)
Received: from l1.lan ([2601:280:4c00:797::24f])
 by smtp.gmail.com with ESMTPSA id z21sm1190820ioj.21.2020.01.24.05.56.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jan 2020 05:56:24 -0800 (PST)
From: Tamas K Lengyel <tamas@tklengyel.com>
To: xen-devel@lists.xenproject.org
Date: Fri, 24 Jan 2020 06:56:21 -0700
Message-Id: <20200124135621.105766-1-tamas@tklengyel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH] x86/mem_access: move _ve functions to x86 header
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
Cc: Petre Pircalabu <ppircalabu@bitdefender.com>,
 Tamas K Lengyel <tamas@tklengyel.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlc2UgZnVuY3Rpb25zIGRvbid0IGJlbG9uZyBpbiB0aGUgY29tbW9uIG1lbV9hY2Nlc3MgaGVh
ZGVyIGFzIHRoZXJlIGlzIG5vICNWRQplcXVpdmFsZW50IG9uIEFSTS4KClNpZ25lZC1vZmYtYnk6
IFRhbWFzIEsgTGVuZ3llbCA8dGFtYXNAdGtsZW5neWVsLmNvbT4KLS0tCiB4ZW4vaW5jbHVkZS9h
c20teDg2L21lbV9hY2Nlc3MuaCB8IDEwICsrKysrKysrKysKIHhlbi9pbmNsdWRlL3hlbi9tZW1f
YWNjZXNzLmggICAgIHwgMTAgLS0tLS0tLS0tLQogMiBmaWxlcyBjaGFuZ2VkLCAxMCBpbnNlcnRp
b25zKCspLCAxMCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS9hc20teDg2
L21lbV9hY2Nlc3MuaCBiL3hlbi9pbmNsdWRlL2FzbS14ODYvbWVtX2FjY2Vzcy5oCmluZGV4IDk5
ODE3YTMzZGIuLmEyNWUzYzYyZGYgMTAwNjQ0Ci0tLSBhL3hlbi9pbmNsdWRlL2FzbS14ODYvbWVt
X2FjY2Vzcy5oCisrKyBiL3hlbi9pbmNsdWRlL2FzbS14ODYvbWVtX2FjY2Vzcy5oCkBAIC00Niw2
ICs0NiwxNiBAQCBib29sIHAybV9tZW1fYWNjZXNzX2VtdWxhdGVfY2hlY2soc3RydWN0IHZjcHUg
KnYsCiAvKiBTYW5pdHkgY2hlY2sgZm9yIG1lbV9hY2Nlc3MgaGFyZHdhcmUgc3VwcG9ydCAqLwog
Ym9vbCBwMm1fbWVtX2FjY2Vzc19zYW5pdHlfY2hlY2soY29uc3Qgc3RydWN0IGRvbWFpbiAqZCk7
CiAKK2ludCBwMm1fc2V0X3N1cHByZXNzX3ZlKHN0cnVjdCBkb21haW4gKmQsIGdmbl90IGdmbiwg
Ym9vbCBzdXBwcmVzc192ZSwKKyAgICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGludCBh
bHRwMm1faWR4KTsKKworc3RydWN0IHhlbl9odm1fYWx0cDJtX3N1cHByZXNzX3ZlX211bHRpOwor
aW50IHAybV9zZXRfc3VwcHJlc3NfdmVfbXVsdGkoc3RydWN0IGRvbWFpbiAqZCwKKyAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCB4ZW5faHZtX2FsdHAybV9zdXBwcmVzc192ZV9t
dWx0aSAqc3VwcHJlc3NfdmUpOworCitpbnQgcDJtX2dldF9zdXBwcmVzc192ZShzdHJ1Y3QgZG9t
YWluICpkLCBnZm5fdCBnZm4sIGJvb2wgKnN1cHByZXNzX3ZlLAorICAgICAgICAgICAgICAgICAg
ICAgICAgdW5zaWduZWQgaW50IGFsdHAybV9pZHgpOworCiAjZW5kaWYgLypfX0FTTV9YODZfTUVN
X0FDQ0VTU19IX18gKi8KIAogLyoKZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRlL3hlbi9tZW1fYWNj
ZXNzLmggYi94ZW4vaW5jbHVkZS94ZW4vbWVtX2FjY2Vzcy5oCmluZGV4IDlkZmViZTZhMjkuLjBl
ZmZhMGNhYWQgMTAwNjQ0Ci0tLSBhL3hlbi9pbmNsdWRlL3hlbi9tZW1fYWNjZXNzLmgKKysrIGIv
eGVuL2luY2x1ZGUveGVuL21lbV9hY2Nlc3MuaApAQCAtNzcsMTYgKzc3LDYgQEAgbG9uZyBwMm1f
c2V0X21lbV9hY2Nlc3NfbXVsdGkoc3RydWN0IGRvbWFpbiAqZCwKICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIHVpbnQzMl90IG5yLCB1aW50MzJfdCBzdGFydCwgdWludDMyX3QgbWFzaywK
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGludCBhbHRwMm1faWR4KTsK
IAotaW50IHAybV9zZXRfc3VwcHJlc3NfdmUoc3RydWN0IGRvbWFpbiAqZCwgZ2ZuX3QgZ2ZuLCBi
b29sIHN1cHByZXNzX3ZlLAotICAgICAgICAgICAgICAgICAgICAgICAgdW5zaWduZWQgaW50IGFs
dHAybV9pZHgpOwotCi1zdHJ1Y3QgeGVuX2h2bV9hbHRwMm1fc3VwcHJlc3NfdmVfbXVsdGk7Ci1p
bnQgcDJtX3NldF9zdXBwcmVzc192ZV9tdWx0aShzdHJ1Y3QgZG9tYWluICpkLAotICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgc3RydWN0IHhlbl9odm1fYWx0cDJtX3N1cHByZXNzX3ZlX211
bHRpICpzdXBwcmVzc192ZSk7Ci0KLWludCBwMm1fZ2V0X3N1cHByZXNzX3ZlKHN0cnVjdCBkb21h
aW4gKmQsIGdmbl90IGdmbiwgYm9vbCAqc3VwcHJlc3NfdmUsCi0gICAgICAgICAgICAgICAgICAg
ICAgICB1bnNpZ25lZCBpbnQgYWx0cDJtX2lkeCk7Ci0KIC8qCiAgKiBHZXQgYWNjZXNzIHR5cGUg
Zm9yIGEgZ2ZuLgogICogSWYgZ2ZuID09IElOVkFMSURfR0ZOLCBnZXRzIHRoZSBkZWZhdWx0IGFj
Y2VzcyB0eXBlLgotLSAKMi4yMC4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
