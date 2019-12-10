Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CDA4118D05
	for <lists+xen-devel@lfdr.de>; Tue, 10 Dec 2019 16:51:17 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iehlZ-00044k-Hp; Tue, 10 Dec 2019 15:49:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=A1/D=2A=gmail.com=rosbrookn@srs-us1.protection.inumbo.net>)
 id 1iehlX-00043f-Tf
 for xen-devel@lists.xenproject.org; Tue, 10 Dec 2019 15:49:35 +0000
X-Inumbo-ID: 7c2addc4-1b64-11ea-88e7-bc764e2007e4
Received: from mail-qk1-x742.google.com (unknown [2607:f8b0:4864:20::742])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7c2addc4-1b64-11ea-88e7-bc764e2007e4;
 Tue, 10 Dec 2019 15:48:18 +0000 (UTC)
Received: by mail-qk1-x742.google.com with SMTP id z76so103901qka.2
 for <xen-devel@lists.xenproject.org>; Tue, 10 Dec 2019 07:48:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XNEElzRpeVV8r6SPzsaAXc9nyqLVWFu8pvvM7YDquJg=;
 b=m1hrrmKsiKv4O+TgfBj+0k7gVh9QIChmmugiqe5D+WaIV4HfLGHFH3nMBgBu0ZGelJ
 J1+Y3NO/M3XBQmfzwtFndSoTlOhY9putvzKi+SGyQ0kYSXbabuv8zPlFkGXzHZqLWKUH
 8fEjWnYLfYgbPh2oHv0tpn/VCf107c85wnga2t9S+Uo39xWGZHv1VY0n+RKf6+q24l8B
 fpdolIoxTaWP8s/lLYjROT5adGXd09x+opBFd4qHUgIbWk4l1ywAkiMAi/KB/bkNVIu3
 Qn3FDrI2/MRxNw4WSTILxpD5yHL1anx/kpLHi1z9LmxkPBIoS+jXuO4y0oa9tB542Pax
 XX0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XNEElzRpeVV8r6SPzsaAXc9nyqLVWFu8pvvM7YDquJg=;
 b=nTDZv5C92jea+P01WIw3J77UTpz6/CoACnjFlW3OrOzTnxokUWXlzPMeiY39HF+VKn
 JFRPXmLgTBwyz6jt9VkRFw80u0D32ld0k+5wsbo0SLZ87KqFaDh1SRqhA/oOxjO5istw
 huSIi8pkBxZuzp4SMa+4ehXZ6o95z44BKtOtk0k3BAm5WLVicrWcct2JbctWR8eQ0P8R
 O9SWdTcBlLgPseN7N6wC0qxrpBbt8EpF5sh2wuMx/jTwHvKTIMr9tDGI3Z+UDy5lHtu+
 tHLf6s9ViCF+P+AhAH2IPR11JDFxli3pJcpEkfcfhz7+rEkzUwciUxsr0/lylUN/utq7
 KLRg==
X-Gm-Message-State: APjAAAWXXG0OYyHjpsN2kqDvmuoqUcu4fsHgjnShzo3qiFZ5SHT3ifq9
 eBkxz3/aJppYenXIPj/8PCfkwNVb
X-Google-Smtp-Source: APXvYqxiS7dCAB6NEhn5uTnTXit2i8vxnXt/KvWgoPOgYYam790706whPWKci6c6gcO1gF+ItY2p3w==
X-Received: by 2002:a37:8b85:: with SMTP id
 n127mr33692858qkd.353.1575992897563; 
 Tue, 10 Dec 2019 07:48:17 -0800 (PST)
Received: from five.crux.rad.ainfosec.com (209-217-208-226.northland.net.
 [209.217.208.226])
 by smtp.googlemail.com with ESMTPSA id m29sm1247848qtf.1.2019.12.10.07.48.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Dec 2019 07:48:16 -0800 (PST)
From: Nick Rosbrook <rosbrookn@gmail.com>
To: xen-devel@lists.xenproject.org
Date: Tue, 10 Dec 2019 10:47:37 -0500
Message-Id: <76e35746cd42c7aba992cc767f7afe3b1041c6f8.1575990937.git.rosbrookn@ainfosec.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1575990937.git.rosbrookn@ainfosec.com>
References: <cover.1575990937.git.rosbrookn@ainfosec.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v3 22/22] golang/xenlight: add error return type
 to Context.Cpupoolinfo
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
Cc: Nick Rosbrook <rosbrookn@ainfosec.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, kerriganb@ainfosec.com,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogTmljayBSb3Nicm9vayA8cm9zYnJvb2tuQGFpbmZvc2VjLmNvbT4KCkEgcHJldmlvdXMg
Y29tbWl0IHRoYXQgcmVtb3ZlZCBDb250ZXh0LkNoZWNrT3BlbiByZXZlYWxlZAphbiBpbmVmZmVj
dHVhbCBhc3NpZ25lbnQgdG8gZXJyIGluIENvbnRleHQuQ3B1cG9vbGluZm8sIGFzCnRoZXJlIGlz
IG5vIGVycm9yIHJldHVybiB0eXBlLgoKU2luY2UgaXQgYXBwZWFycyB0aGF0IHRoZSBpbnRlbnQg
aXMgdG8gcmV0dXJuIGFuIGVycm9yIGhlcmUsCmFkZCBhbiBlcnJvciByZXR1cm4gdmFsdWUgdG8g
dGhlIGZ1bmN0aW9uIHNpZ25hdHVyZS4KClNpZ25lZC1vZmYtYnk6IE5pY2sgUm9zYnJvb2sgPHJv
c2Jyb29rbkBhaW5mb3NlYy5jb20+Ci0tLQogdG9vbHMvZ29sYW5nL3hlbmxpZ2h0L3hlbmxpZ2h0
LmdvIHwgNiArKystLS0KIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDMgZGVsZXRp
b25zKC0pCgpkaWZmIC0tZ2l0IGEvdG9vbHMvZ29sYW5nL3hlbmxpZ2h0L3hlbmxpZ2h0LmdvIGIv
dG9vbHMvZ29sYW5nL3hlbmxpZ2h0L3hlbmxpZ2h0LmdvCmluZGV4IDFjNDMxZmE0ZTUuLjM4ZDJi
YThhYTggMTAwNjQ0Ci0tLSBhL3Rvb2xzL2dvbGFuZy94ZW5saWdodC94ZW5saWdodC5nbworKysg
Yi90b29scy9nb2xhbmcveGVubGlnaHQveGVubGlnaHQuZ28KQEAgLTUwMywxNyArNTAzLDE3IEBA
IGZ1bmMgKEN0eCAqQ29udGV4dCkgTGlzdENwdXBvb2woKSAobGlzdCBbXUNwdXBvb2xpbmZvKSB7
CiB9CiAKIC8vIGludCBsaWJ4bF9jcHVwb29sX2luZm8obGlieGxfY3R4ICpjdHgsIGxpYnhsX2Nw
dXBvb2xpbmZvICppbmZvLCB1aW50MzJfdCBwb29saWQpOwotZnVuYyAoQ3R4ICpDb250ZXh0KSBD
cHVwb29sSW5mbyhQb29saWQgdWludDMyKSAocG9vbCBDcHVwb29saW5mbykgeworZnVuYyAoQ3R4
ICpDb250ZXh0KSBDcHVwb29sSW5mbyhQb29saWQgdWludDMyKSAocG9vbCBDcHVwb29saW5mbywg
ZXJyIGVycm9yKSB7CiAJdmFyIGNfY3B1cG9vbCBDLmxpYnhsX2NwdXBvb2xpbmZvCiAKIAlyZXQg
Oj0gQy5saWJ4bF9jcHVwb29sX2luZm8oQ3R4LmN0eCwgJmNfY3B1cG9vbCwgQy51aW50MzJfdChQ
b29saWQpKQogCWlmIHJldCAhPSAwIHsKLQkJLy9lcnIgPSBFcnJvcigtcmV0KQorCQllcnIgPSBF
cnJvcigtcmV0KQogCQlyZXR1cm4KIAl9CiAJZGVmZXIgQy5saWJ4bF9jcHVwb29saW5mb19kaXNw
b3NlKCZjX2NwdXBvb2wpCiAKLQlfID0gcG9vbC5mcm9tQygmY19jcHVwb29sKQorCWVyciA9IHBv
b2wuZnJvbUMoJmNfY3B1cG9vbCkKIAogCXJldHVybgogfQotLSAKMi4xOS4xCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
