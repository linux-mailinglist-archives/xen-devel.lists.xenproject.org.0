Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D854BB202
	for <lists+xen-devel@lfdr.de>; Mon, 23 Sep 2019 12:13:35 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iCLII-0007Wb-Cz; Mon, 23 Sep 2019 10:10:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=iV5N=XS=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1iCLIG-0007Tw-8z
 for xen-devel@lists.xenproject.org; Mon, 23 Sep 2019 10:10:08 +0000
X-Inumbo-ID: 4264c094-ddea-11e9-b299-bc764e2007e4
Received: from mail-wm1-x344.google.com (unknown [2a00:1450:4864:20::344])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4264c094-ddea-11e9-b299-bc764e2007e4;
 Mon, 23 Sep 2019 10:09:42 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id m18so8619705wmc.1
 for <xen-devel@lists.xenproject.org>; Mon, 23 Sep 2019 03:09:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=J0gWUg2h7tpdgfhePN1rbGU9ftmJv074Q5+IRkBqTX8=;
 b=PGil4XhYR6v62HYFcwiaSCYPWEF6MEg6hCwXjZuKaP4Aj7i5WKq/QH3zUtclD5scVt
 sESn8KrxnsfFTdchYW5vLvkzkaxVL2FBxZUCLfStN1jAW8LSDfo9R5oY0tylhwGpILiL
 U7oIqNWN5XQkozkg8kEeqQwxPBgx3doqx0t5pPjkwR2DSkT+PbPjZ3BxnrH0JcietLgQ
 GANPJpCPusX5YsA4qIJ2sEZxMLar/UUmLClL8J9c01F5z7xTpwULjPKK9mNX6A5KuDYW
 j0uCizKYM7w8YoURYr3pTyJzBJZMbT75DM0DcLa3lQBzOWYO53ehnwVfccMUKOB1GxR4
 YaCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=J0gWUg2h7tpdgfhePN1rbGU9ftmJv074Q5+IRkBqTX8=;
 b=Z1zcjDSvz9rd7HYrEg7ceVLffOPXiVZAg/cJmiFB4xMljCMlYlDxMynrhylZAp6/BE
 uXMQh90FI2Sk2/6VLW/ZjaORxaFmDTEeGVqEGz+WJHH75QMLFhNsGZiW3gfmjqtEFp7m
 qs2FAqpabsrGc0dUObh1PPs5juHV1zVD9UIiWe3jOiS/rBgnCSGdZ+06QI6PsYFMwf3X
 tbBte0v+3/rDXGepBugQtbuTBsgOYVnyJKyA44nFyLEn+WTl3fgXqtCHenGLXKtIZRfd
 SCaP+aZ7PDZixT5M5/X+wun6aIb558y5OrlxZb9ZHI5rU1cwc4ErQOrQLu0qxjeGFf/F
 UKCA==
X-Gm-Message-State: APjAAAW8hTGuzeY6dshjwhOKtLzkyfFWxkwiT8uyXwE/pt2m5CB4iQkh
 p1jfs+01w+YfOhEOwAEl0nd0Tz9k
X-Google-Smtp-Source: APXvYqx7BqyC5ozDISUKqL4kgTWqLV6+d4HNGBkzXibQ1XS4BtpTE5Yi//FfuOXbkSgclyjdgBGuFA==
X-Received: by 2002:a7b:c757:: with SMTP id w23mr12824379wmk.31.1569233381352; 
 Mon, 23 Sep 2019 03:09:41 -0700 (PDT)
Received: from debian.mshome.net (207.148.159.143.dyn.plus.net.
 [143.159.148.207])
 by smtp.gmail.com with ESMTPSA id s10sm18241662wmf.48.2019.09.23.03.09.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Sep 2019 03:09:40 -0700 (PDT)
From: Wei Liu <wl@xen.org>
X-Google-Original-From: Wei Liu <liuwe@microsoft.com>
To: Xen Development List <xen-devel@lists.xenproject.org>
Date: Mon, 23 Sep 2019 11:09:29 +0100
Message-Id: <20190923100931.29670-7-liuwe@microsoft.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190923100931.29670-1-liuwe@microsoft.com>
References: <20190923100931.29670-1-liuwe@microsoft.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH for-next RFC 6/8] x86: make probe_xen return
 boolean value
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
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Michael Kelley <mikelley@microsoft.com>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

V2UgbmVlZCBpbmRpY2F0aW9uIHdoZXRoZXIgaXQgaGFzIHN1Y2NlZWRlZCBvciBub3QuCgpTaWdu
ZWQtb2ZmLWJ5OiBXZWkgTGl1IDxsaXV3ZUBtaWNyb3NvZnQuY29tPgotLS0KIHhlbi9hcmNoL3g4
Ni9ndWVzdC9oeXBlcnZpc29yLmMgfCA1ICsrKystCiB4ZW4vYXJjaC94ODYvZ3Vlc3QveGVuL3hl
bi5jICAgIHwgNyArKysrLS0tCiB4ZW4vaW5jbHVkZS9hc20teDg2L2d1ZXN0L3hlbi5oIHwgNCAr
Ky0tCiAzIGZpbGVzIGNoYW5nZWQsIDEwIGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0pCgpk
aWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L2d1ZXN0L2h5cGVydmlzb3IuYyBiL3hlbi9hcmNoL3g4
Ni9ndWVzdC9oeXBlcnZpc29yLmMKaW5kZXggYjBhNzI0YmYxMy4uZmI1NzJiMDQwMiAxMDA2NDQK
LS0tIGEveGVuL2FyY2gveDg2L2d1ZXN0L2h5cGVydmlzb3IuYworKysgYi94ZW4vYXJjaC94ODYv
Z3Vlc3QvaHlwZXJ2aXNvci5jCkBAIC0zNCw3ICszNCwxMCBAQCB2b2lkIF9faW5pdCBwcm9iZV9o
eXBlcnZpc29yKHZvaWQpCiAgICAgaWYgKCAhKGNwdWlkX2VjeCgxKSAmIGNwdWZlYXRfbWFzayhY
ODZfRkVBVFVSRV9IWVBFUlZJU09SKSkgKQogICAgICAgICByZXR1cm47CiAKLSAgICBwcm9iZV94
ZW4oKTsKKyAgICBpZiAoIHByb2JlX3hlbigpICkKKyAgICAgICAgcmV0dXJuOworCisgICAgLyog
SHlwZXItViBwcm9iaW5nIHRvIGZvbGxvdy4gKi8KIH0KIAogc3RhdGljIHZvaWQgX19pbml0IGlu
aXRfbWVtbWFwKHZvaWQpCmRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvZ3Vlc3QveGVuL3hlbi5j
IGIveGVuL2FyY2gveDg2L2d1ZXN0L3hlbi94ZW4uYwppbmRleCBhNzMwZTZhZDFiLi44MzkwYjA0
NWYwIDEwMDY0NAotLS0gYS94ZW4vYXJjaC94ODYvZ3Vlc3QveGVuL3hlbi5jCisrKyBiL3hlbi9h
cmNoL3g4Ni9ndWVzdC94ZW4veGVuLmMKQEAgLTY2LDIwICs2NiwyMSBAQCBzdGF0aWMgdm9pZCBf
X2luaXQgZmluZF94ZW5fbGVhdmVzKHZvaWQpCiAgICAgfQogfQogCi12b2lkIF9faW5pdCBwcm9i
ZV94ZW4odm9pZCkKK2Jvb2wgX19pbml0IHByb2JlX3hlbih2b2lkKQogewogICAgIGlmICggeGVu
X2d1ZXN0ICkKLSAgICAgICAgcmV0dXJuOworICAgICAgICByZXR1cm4gdHJ1ZTsKIAogICAgIGZp
bmRfeGVuX2xlYXZlcygpOwogCiAgICAgaWYgKCAheGVuX2NwdWlkX2Jhc2UgKQotICAgICAgICBy
ZXR1cm47CisgICAgICAgIHJldHVybiBmYWxzZTsKIAogICAgIC8qIEZpbGwgdGhlIGh5cGVyY2Fs
bCBwYWdlLiAqLwogICAgIHdybXNybChjcHVpZF9lYngoeGVuX2NwdWlkX2Jhc2UgKyAyKSwgX19w
YShoeXBlcmNhbGxfcGFnZSkpOwogCiAgICAgeGVuX2d1ZXN0ID0gdHJ1ZTsKKyAgICByZXR1cm4g
dHJ1ZTsKIH0KIAogc3RhdGljIHZvaWQgbWFwX3NoYXJlZF9pbmZvKHZvaWQpCmRpZmYgLS1naXQg
YS94ZW4vaW5jbHVkZS9hc20teDg2L2d1ZXN0L3hlbi5oIGIveGVuL2luY2x1ZGUvYXNtLXg4Ni9n
dWVzdC94ZW4uaAppbmRleCBkMDMxZjFmNzBkLi43ZWRhM2Q0OTU2IDEwMDY0NAotLS0gYS94ZW4v
aW5jbHVkZS9hc20teDg2L2d1ZXN0L3hlbi5oCisrKyBiL3hlbi9pbmNsdWRlL2FzbS14ODYvZ3Vl
c3QveGVuLmgKQEAgLTMyLDcgKzMyLDcgQEAgZXh0ZXJuIGJvb2wgeGVuX2d1ZXN0OwogZXh0ZXJu
IGJvb2wgcHZfY29uc29sZTsKIGV4dGVybiB1aW50MzJfdCB4ZW5fY3B1aWRfYmFzZTsKIAotdm9p
ZCBwcm9iZV94ZW4odm9pZCk7Citib29sIHByb2JlX3hlbih2b2lkKTsKIHZvaWQgeGVuX3NldHVw
KHZvaWQpOwogdm9pZCB4ZW5fYXBfc2V0dXAodm9pZCk7CiB2b2lkIHhlbl9yZXN1bWUodm9pZCk7
CkBAIC00NSw3ICs0NSw3IEBAIERFQ0xBUkVfUEVSX0NQVShzdHJ1Y3QgdmNwdV9pbmZvICosIHZj
cHVfaW5mbyk7CiAjZGVmaW5lIHhlbl9ndWVzdCAwCiAjZGVmaW5lIHB2X2NvbnNvbGUgMAogCi1z
dGF0aWMgaW5saW5lIHZvaWQgcHJvYmVfeGVuKHZvaWQpIHt9CitzdGF0aWMgaW5saW5lIGJvb2wg
cHJvYmVfeGVuKHZvaWQpIHsgcmV0dXJuIGZhbHNlOyB9CiAKICNlbmRpZiAvKiBDT05GSUdfWEVO
X0dVRVNUICovCiAjZW5kaWYgLyogX19YODZfR1VFU1RfWEVOX0hfXyAqLwotLSAKMi4yMC4xCgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
