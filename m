Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AD64CE71A
	for <lists+xen-devel@lfdr.de>; Mon,  7 Oct 2019 17:16:51 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iHUhY-0006ja-Lm; Mon, 07 Oct 2019 15:13:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=0SFq=YA=gmail.com=rosbrookn@srs-us1.protection.inumbo.net>)
 id 1iHUhX-0006jP-MN
 for xen-devel@lists.xenproject.org; Mon, 07 Oct 2019 15:13:31 +0000
X-Inumbo-ID: fefe6f2c-e914-11e9-8c93-bc764e2007e4
Received: from mail-qk1-x744.google.com (unknown [2607:f8b0:4864:20::744])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fefe6f2c-e914-11e9-8c93-bc764e2007e4;
 Mon, 07 Oct 2019 15:13:19 +0000 (UTC)
Received: by mail-qk1-x744.google.com with SMTP id w2so12924280qkf.2
 for <xen-devel@lists.xenproject.org>; Mon, 07 Oct 2019 08:13:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xQqpt0YafGJMaNYxl21IIT6y/TTnX+GZJV/giFMiXnI=;
 b=jNrfBccZSNbkttkZbiOwgNfoD0F67D0LOFLjxnSHLooSxGd31JsNUi5RG2fKBrwoCc
 aSRhQO1wK+X7sm0QM8sCEkrrp7lnPAleqP5TJGwlDkkXZ9YCXAlmf/7jCgOhrfa+17zY
 fGWZvZFkzcwS7YPxO9hMRRXITjDTiCWOSAkYjyVu1GIrinDWMb9cBL3663Tf7OhatBDh
 /zwXIRytMciZwHJbaVKpjledyPIzyL9t4fq9PQPDTRfxx5HU1XW6OrFk1oM8SdohHVby
 cQkZChnDHwRZzAyYw1YfMFHiWWFcTmO8Cmc6kjbB181kuX5gm14sxAoY4Ypm1xrrJbAC
 1+eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xQqpt0YafGJMaNYxl21IIT6y/TTnX+GZJV/giFMiXnI=;
 b=hFUIITV8IJ3XZ3t8vZFr0COjKZW0TFJmnN7zA0EfXaU7dc5sVlQ3DIGMUr7nmUuNc3
 XEq8OrhsXBN0xhIhfp6gKHbV4c9HyZhtgB8rFsLKsSYZMj0soaSOEiC0re4+B+IfP+HB
 ANg6N9Bi9TmbbY17HoAzKQUbEr4kc7DUWHpZ4OZS9mqEtvdcUTZ/XgiHQr9haPjCUiTx
 5S9TXBPEzzuyaHSGHw0vMMJctoNoLppdEpiiscX7ITOLX2Y0pgfNVqNEZHxW7mNVQuUI
 zoQ3jXgEAj0CNT4tpCIgFqwhoBjvnHBKeFoFA4OxdWV6TVsIBiRwOsLfSqy2e//AsQ8y
 tb4g==
X-Gm-Message-State: APjAAAU/dfbK1ifKFOIgU8fuCOPRXG4LVtgfgUW66iMpdy761FKpSnvN
 JxA14LS4JviciUdq/BLxyoXZ4/F3
X-Google-Smtp-Source: APXvYqxP2rTblQcbxxoIJ5QVf27v0p3Jk4MbsLngumglIZ/QMG0qtLAewbKHoEqjs/Fp6sBTCMOjZA==
X-Received: by 2002:a37:4e48:: with SMTP id c69mr23555685qkb.182.1570461199191; 
 Mon, 07 Oct 2019 08:13:19 -0700 (PDT)
Received: from five.crux.rad.ainfosec.com (209-217-208-226.northland.net.
 [209.217.208.226])
 by smtp.googlemail.com with ESMTPSA id c185sm8354313qkg.74.2019.10.07.08.13.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Oct 2019 08:13:18 -0700 (PDT)
From: Nick Rosbrook <rosbrookn@gmail.com>
To: xen-devel@lists.xenproject.org
Date: Mon,  7 Oct 2019 11:12:50 -0400
Message-Id: <00b468deae50cb125be01ff90ceb739fd25f8e5c.1570456846.git.rosbrookn@ainfosec.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1570456846.git.rosbrookn@ainfosec.com>
References: <cover.1570456846.git.rosbrookn@ainfosec.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 03/24] golang/xenlight: define Defbool builtin
 type
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

RnJvbTogTmljayBSb3Nicm9vayA8cm9zYnJvb2tuQGFpbmZvc2VjLmNvbT4KCkRlZmluZSBEZWZi
b29sIGFzIHN0cnVjdCBhbmFsYWdvdXMgdG8gdGhlIEMgdHlwZSwgYW5kIGRlZmluZSB0aGUgdHlw
ZQonZGVmYm9vbFZhbCcgdGhhdCByZXByZXNlbnQgdHJ1ZSwgZmFsc2UsIGFuZCBkZWZhdWx0IGRl
ZmJvb2wgdmFsdWVzLgoKSW1wbGVtZW50IFNldCwgVW5zZXQsIFNldElmRGVmYXVsdCwgSXNEZWZh
dWx0LCBWYWwsIGFuZCBTdHJpbmcgZnVuY3Rpb25zCm9uIERlZmJvb2wgc28gdGhhdCB0aGUgdHlw
ZSBjYW4gYmUgdXNlZCBpbiBHbyBhbmFsYWdvdXNseSB0byBob3cgaXRzCnVzZWQgaW4gQy4KCkZp
bmFsbHksIGltcGxlbWVudCBmcm9tQyBhbmQgdG9DIGZ1bmN0aW9ucy4KClNpZ25lZC1vZmYtYnk6
IE5pY2sgUm9zYnJvb2sgPHJvc2Jyb29rbkBhaW5mb3NlYy5jb20+Ci0tLQpDYzogR2VvcmdlIER1
bmxhcCA8Z2VvcmdlLmR1bmxhcEBjaXRyaXguY29tPgpDYzogSWFuIEphY2tzb24gPGlhbi5qYWNr
c29uQGV1LmNpdHJpeC5jb20+CkNjOiBXZWkgTGl1IDx3bEB4ZW4ub3JnPgoKIHRvb2xzL2dvbGFu
Zy94ZW5saWdodC94ZW5saWdodC5nbyB8IDkzICsrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysKIDEgZmlsZSBjaGFuZ2VkLCA5MyBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvdG9vbHMv
Z29sYW5nL3hlbmxpZ2h0L3hlbmxpZ2h0LmdvIGIvdG9vbHMvZ29sYW5nL3hlbmxpZ2h0L3hlbmxp
Z2h0LmdvCmluZGV4IGU2MTdmMjJmY2YuLjdiZjE2ZGMwM2IgMTAwNjQ0Ci0tLSBhL3Rvb2xzL2dv
bGFuZy94ZW5saWdodC94ZW5saWdodC5nbworKysgYi90b29scy9nb2xhbmcveGVubGlnaHQveGVu
bGlnaHQuZ28KQEAgLTg1LDYgKzg1LDk5IEBAIHR5cGUgTWVtS0IgdWludDY0CiAKIHR5cGUgVXVp
ZCBDLmxpYnhsX3V1aWQKIAorLy8gZGVmYm9vbFZhbCByZXByZXNlbnRzIGEgZGVmYm9vbCB2YWx1
ZS4KK3R5cGUgZGVmYm9vbFZhbCBpbnQKKworY29uc3QgKAorCWRlZmJvb2xEZWZhdWx0IGRlZmJv
b2xWYWwgPSAwCisJZGVmYm9vbEZhbHNlICAgZGVmYm9vbFZhbCA9IC0xCisJZGVmYm9vbFRydWUg
ICAgZGVmYm9vbFZhbCA9IDEKKykKKworLy8gRGVmYm9vbCByZXByZXNlbnRzIGEgbGlieGxfZGVm
Ym9vbC4KK3R5cGUgRGVmYm9vbCBzdHJ1Y3QgeworCXZhbCBkZWZib29sVmFsCit9CisKK2Z1bmMg
KGQgRGVmYm9vbCkgU3RyaW5nKCkgc3RyaW5nIHsKKwlzd2l0Y2ggZC52YWwgeworCWNhc2UgZGVm
Ym9vbERlZmF1bHQ6CisJCXJldHVybiAiPGRlZmF1bHQ+IgorCWNhc2UgZGVmYm9vbEZhbHNlOgor
CQlyZXR1cm4gIkZhbHNlIgorCWNhc2UgZGVmYm9vbFRydWU6CisJCXJldHVybiAiVHJ1ZSIKKwl9
CisKKwlyZXR1cm4gIiIKK30KKworLy8gU2V0IHNldHMgdGhlIHZhbHVlIG9mIHRoZSBEZWZib29s
LgorZnVuYyAoZCAqRGVmYm9vbCkgU2V0KGIgYm9vbCkgeworCWlmIGIgeworCQlkLnZhbCA9IGRl
ZmJvb2xUcnVlCisJCXJldHVybgorCX0KKwlkLnZhbCA9IGRlZmJvb2xGYWxzZQorfQorCisvLyBV
bnNldCByZXNldHMgdGhlIERlZmJvb2wgdG8gZGVmYXVsdCB2YWx1ZS4KK2Z1bmMgKGQgKkRlZmJv
b2wpIFVuc2V0KCkgeworCWQudmFsID0gZGVmYm9vbERlZmF1bHQKK30KKworLy8gU2V0SWZEZWZh
dWx0IHNldHMgdGhlIHZhbHVlIG9mIERlZmJvb2wgb25seSBpZgorLy8gaXRzIGN1cnJlbnQgdmFs
dWUgaXMgZGVmYXVsdC4KK2Z1bmMgKGQgKkRlZmJvb2wpIFNldElmRGVmYXVsdChiIGJvb2wpIHsK
KwlpZiBkLklzRGVmYXVsdCgpIHsKKwkJZC5TZXQoYikKKwl9Cit9CisKKy8vIElzRGVmYXVsdCBy
ZXR1cm5zIHRydWUgaWYgdGhlIHZhbHVlIG9mIERlZmJvb2wKKy8vIGlzIGRlZmF1bHQsIHJldHVy
bnMgZmFsc2Ugb3RoZXJ3aXNlLgorZnVuYyAoZCAqRGVmYm9vbCkgSXNEZWZhdWx0KCkgYm9vbCB7
CisJcmV0dXJuIGQudmFsID09IGRlZmJvb2xEZWZhdWx0Cit9CisKKy8vIFZhbCByZXR1cm5zIHRo
ZSBib29sZWFuIHZhbHVlIGFzc29jaWF0ZWQgd2l0aCB0aGUKKy8vIERlZmJvb2wgdmFsdWUuIEFu
IGVycm9yIGlzIHJldHVybmVkIGlmIHRoZSB2YWx1ZQorLy8gaXMgZGVmYXVsdC4KK2Z1bmMgKGQg
KkRlZmJvb2wpIFZhbCgpIChib29sLCBlcnJvcikgeworCWlmIGQuSXNEZWZhdWx0KCkgeworCQly
ZXR1cm4gZmFsc2UsIGZtdC5FcnJvcmYoIiV2OiBjYW5ub3QgdGFrZSB2YWx1ZSBvZiBkZWZhdWx0
IGRlZmJvb2wiLCBFcnJvckludmFsKQorCX0KKworCXJldHVybiAoZC52YWwgPiAwKSwgbmlsCit9
CisKK2Z1bmMgKGQgKkRlZmJvb2wpIGZyb21DKGMgKkMubGlieGxfZGVmYm9vbCkgZXJyb3Igewor
CWlmIEMubGlieGxfZGVmYm9vbF9pc19kZWZhdWx0KCpjKSB7CisJCWQudmFsID0gZGVmYm9vbERl
ZmF1bHQKKwkJcmV0dXJuIG5pbAorCX0KKworCWlmIEMubGlieGxfZGVmYm9vbF92YWwoKmMpIHsK
KwkJZC52YWwgPSBkZWZib29sVHJ1ZQorCQlyZXR1cm4gbmlsCisJfQorCisJZC52YWwgPSBkZWZi
b29sRmFsc2UKKworCXJldHVybiBuaWwKK30KKworZnVuYyAoZCAqRGVmYm9vbCkgdG9DKCkgKEMu
bGlieGxfZGVmYm9vbCwgZXJyb3IpIHsKKwl2YXIgYyBDLmxpYnhsX2RlZmJvb2wKKworCWlmICFk
LklzRGVmYXVsdCgpIHsKKwkJdmFsLCBfIDo9IGQuVmFsKCkKKwkJQy5saWJ4bF9kZWZib29sX3Nl
dCgmYywgQy5ib29sKHZhbCkpCisJfQorCisJcmV0dXJuIGMsIG5pbAorfQorCiB0eXBlIENvbnRl
eHQgc3RydWN0IHsKIAljdHggICAgKkMubGlieGxfY3R4CiAJbG9nZ2VyICpDLnhlbnRvb2xsb2df
bG9nZ2VyX3N0ZGlvc3RyZWFtCi0tIAoyLjE5LjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
