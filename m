Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CF80FE5E7
	for <lists+xen-devel@lfdr.de>; Fri, 15 Nov 2019 20:46:57 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iVhWp-0001I0-Db; Fri, 15 Nov 2019 19:45:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=1SQg=ZH=gmail.com=rosbrookn@srs-us1.protection.inumbo.net>)
 id 1iVhWn-0001Hb-FQ
 for xen-devel@lists.xenproject.org; Fri, 15 Nov 2019 19:45:09 +0000
X-Inumbo-ID: 69ee5754-07e0-11ea-984a-bc764e2007e4
Received: from mail-qv1-xf43.google.com (unknown [2607:f8b0:4864:20::f43])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 69ee5754-07e0-11ea-984a-bc764e2007e4;
 Fri, 15 Nov 2019 19:45:02 +0000 (UTC)
Received: by mail-qv1-xf43.google.com with SMTP id n4so1108033qvq.9
 for <xen-devel@lists.xenproject.org>; Fri, 15 Nov 2019 11:45:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Z2NYMlNEa239ID0p7i58khGBjYrcb8RrDrNqVGHrC6k=;
 b=cHdSGO5Pa9hdZtK9gT4kafagfrh6aiA0qIAmH9YQTSpUp9ficR2/GL30rydigxnGc1
 NIdBOM41LqTqmaayhgaGb4skovSBXW7PqX4WLpCK38yOlkRlMkoHPbQBf881A5hVPPpc
 nDFcCLnMFIdlLja4RD1ZBYP1fOS4fVKh0JHSXn1DV7xHP+yuT0AAVez913x6io/nj7z5
 DY+LSRU0KnAaDM9qaDKoJ4PrlBYrBO6/zgPW+eggGPYKkVNdlFRSj9DGqNm4rUed9eHF
 EZIxeq+6I5uVJEb8K/bPetyruwzuaTjRPpWXjH+lWZBd2gJodr0HzKZdJl4nY962zrpo
 BXEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Z2NYMlNEa239ID0p7i58khGBjYrcb8RrDrNqVGHrC6k=;
 b=WyjCso08xUn4dDs2JFlwvclIreVJIk4BPLJ9kRL03LffbJn8ih6pEbFUbluwp8FXnS
 xxMpu5N2QgKljB37UqrMtrJhgulfRtDRmVBA+0PCrL+ZqcfTsxLVLjgFJ6kSCENLfqbX
 jIJahMDJlsy02m1Oo/lHHALc2UfrW+HX3Aya5sF7qoyc1gpVbX1At/NRIQvKxIfDN/C0
 6iLATFbsTjPI+dTjRHa1hVncYGpQGJY14OXNrnCtsT61+1F9xja7fcgRK0BpJ6X5ANvO
 3xKbs4o3CPSJu7I4/2SX1Cn0xaRb54KXb+DopeuIqicPpf5wOJwnEUoBMEMPrEFHxxXl
 VthQ==
X-Gm-Message-State: APjAAAWDIKmi1FEstoiL6+YoETJnh1qzlZ9LlpYZhSEG4QrMmDjRlvP3
 CqmRsTYfyZMbGuWkmHNR6r3rWi9X
X-Google-Smtp-Source: APXvYqw7FNPqkFy7t/u/nhyR6YxN0OXdubmFgFsW0T5uwZMUYuJVA3G/BPPUiJw4eIraEM3kfhdR2A==
X-Received: by 2002:a0c:e603:: with SMTP id z3mr14478483qvm.50.1573847100797; 
 Fri, 15 Nov 2019 11:45:00 -0800 (PST)
Received: from five.crux.rad.ainfosec.com (209-217-208-226.northland.net.
 [209.217.208.226])
 by smtp.googlemail.com with ESMTPSA id y10sm4649679qkb.55.2019.11.15.11.44.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Nov 2019 11:44:59 -0800 (PST)
From: Nick Rosbrook <rosbrookn@gmail.com>
To: xen-devel@lists.xenproject.org
Date: Fri, 15 Nov 2019 14:44:09 -0500
Message-Id: <1997f553223508247777fb47fce9af3f658c5d74.1573840474.git.rosbrookn@ainfosec.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1573840473.git.rosbrookn@ainfosec.com>
References: <cover.1573840473.git.rosbrookn@ainfosec.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v2 02/22] golang/xenlight: define Defbool
 builtin type
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
IE5pY2sgUm9zYnJvb2sgPHJvc2Jyb29rbkBhaW5mb3NlYy5jb20+ClJldmlld2VkLWJ5OiBHZW9y
Z2UgRHVubGFwIDxnZW9yZ2UuZHVubGFwQGNpdHJpeC5jb20+Ci0tLQogdG9vbHMvZ29sYW5nL3hl
bmxpZ2h0L3hlbmxpZ2h0LmdvIHwgOTMgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwog
MSBmaWxlIGNoYW5nZWQsIDkzIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS90b29scy9nb2xh
bmcveGVubGlnaHQveGVubGlnaHQuZ28gYi90b29scy9nb2xhbmcveGVubGlnaHQveGVubGlnaHQu
Z28KaW5kZXggODllZDQzOWZkMC4uNjQwZDgyZjM1ZiAxMDA2NDQKLS0tIGEvdG9vbHMvZ29sYW5n
L3hlbmxpZ2h0L3hlbmxpZ2h0LmdvCisrKyBiL3Rvb2xzL2dvbGFuZy94ZW5saWdodC94ZW5saWdo
dC5nbwpAQCAtODUsNiArODUsOTkgQEAgdHlwZSBNZW1LQiB1aW50NjQKIAogdHlwZSBVdWlkIEMu
bGlieGxfdXVpZAogCisvLyBkZWZib29sVmFsIHJlcHJlc2VudHMgYSBkZWZib29sIHZhbHVlLgor
dHlwZSBkZWZib29sVmFsIGludAorCitjb25zdCAoCisJZGVmYm9vbERlZmF1bHQgZGVmYm9vbFZh
bCA9IDAKKwlkZWZib29sRmFsc2UgICBkZWZib29sVmFsID0gLTEKKwlkZWZib29sVHJ1ZSAgICBk
ZWZib29sVmFsID0gMQorKQorCisvLyBEZWZib29sIHJlcHJlc2VudHMgYSBsaWJ4bF9kZWZib29s
LgordHlwZSBEZWZib29sIHN0cnVjdCB7CisJdmFsIGRlZmJvb2xWYWwKK30KKworZnVuYyAoZCBE
ZWZib29sKSBTdHJpbmcoKSBzdHJpbmcgeworCXN3aXRjaCBkLnZhbCB7CisJY2FzZSBkZWZib29s
RGVmYXVsdDoKKwkJcmV0dXJuICI8ZGVmYXVsdD4iCisJY2FzZSBkZWZib29sRmFsc2U6CisJCXJl
dHVybiAiRmFsc2UiCisJY2FzZSBkZWZib29sVHJ1ZToKKwkJcmV0dXJuICJUcnVlIgorCX0KKwor
CXJldHVybiAiIgorfQorCisvLyBTZXQgc2V0cyB0aGUgdmFsdWUgb2YgdGhlIERlZmJvb2wuCitm
dW5jIChkICpEZWZib29sKSBTZXQoYiBib29sKSB7CisJaWYgYiB7CisJCWQudmFsID0gZGVmYm9v
bFRydWUKKwkJcmV0dXJuCisJfQorCWQudmFsID0gZGVmYm9vbEZhbHNlCit9CisKKy8vIFVuc2V0
IHJlc2V0cyB0aGUgRGVmYm9vbCB0byBkZWZhdWx0IHZhbHVlLgorZnVuYyAoZCAqRGVmYm9vbCkg
VW5zZXQoKSB7CisJZC52YWwgPSBkZWZib29sRGVmYXVsdAorfQorCisvLyBTZXRJZkRlZmF1bHQg
c2V0cyB0aGUgdmFsdWUgb2YgRGVmYm9vbCBvbmx5IGlmCisvLyBpdHMgY3VycmVudCB2YWx1ZSBp
cyBkZWZhdWx0LgorZnVuYyAoZCAqRGVmYm9vbCkgU2V0SWZEZWZhdWx0KGIgYm9vbCkgeworCWlm
IGQuSXNEZWZhdWx0KCkgeworCQlkLlNldChiKQorCX0KK30KKworLy8gSXNEZWZhdWx0IHJldHVy
bnMgdHJ1ZSBpZiB0aGUgdmFsdWUgb2YgRGVmYm9vbAorLy8gaXMgZGVmYXVsdCwgcmV0dXJucyBm
YWxzZSBvdGhlcndpc2UuCitmdW5jIChkICpEZWZib29sKSBJc0RlZmF1bHQoKSBib29sIHsKKwly
ZXR1cm4gZC52YWwgPT0gZGVmYm9vbERlZmF1bHQKK30KKworLy8gVmFsIHJldHVybnMgdGhlIGJv
b2xlYW4gdmFsdWUgYXNzb2NpYXRlZCB3aXRoIHRoZQorLy8gRGVmYm9vbCB2YWx1ZS4gQW4gZXJy
b3IgaXMgcmV0dXJuZWQgaWYgdGhlIHZhbHVlCisvLyBpcyBkZWZhdWx0LgorZnVuYyAoZCAqRGVm
Ym9vbCkgVmFsKCkgKGJvb2wsIGVycm9yKSB7CisJaWYgZC5Jc0RlZmF1bHQoKSB7CisJCXJldHVy
biBmYWxzZSwgZm10LkVycm9yZigiJXY6IGNhbm5vdCB0YWtlIHZhbHVlIG9mIGRlZmF1bHQgZGVm
Ym9vbCIsIEVycm9ySW52YWwpCisJfQorCisJcmV0dXJuIChkLnZhbCA+IDApLCBuaWwKK30KKwor
ZnVuYyAoZCAqRGVmYm9vbCkgZnJvbUMoYyAqQy5saWJ4bF9kZWZib29sKSBlcnJvciB7CisJaWYg
Qy5saWJ4bF9kZWZib29sX2lzX2RlZmF1bHQoKmMpIHsKKwkJZC52YWwgPSBkZWZib29sRGVmYXVs
dAorCQlyZXR1cm4gbmlsCisJfQorCisJaWYgQy5saWJ4bF9kZWZib29sX3ZhbCgqYykgeworCQlk
LnZhbCA9IGRlZmJvb2xUcnVlCisJCXJldHVybiBuaWwKKwl9CisKKwlkLnZhbCA9IGRlZmJvb2xG
YWxzZQorCisJcmV0dXJuIG5pbAorfQorCitmdW5jIChkICpEZWZib29sKSB0b0MoKSAoQy5saWJ4
bF9kZWZib29sLCBlcnJvcikgeworCXZhciBjIEMubGlieGxfZGVmYm9vbAorCisJaWYgIWQuSXNE
ZWZhdWx0KCkgeworCQl2YWwsIF8gOj0gZC5WYWwoKQorCQlDLmxpYnhsX2RlZmJvb2xfc2V0KCZj
LCBDLmJvb2wodmFsKSkKKwl9CisKKwlyZXR1cm4gYywgbmlsCit9CisKIHR5cGUgQ29udGV4dCBz
dHJ1Y3QgewogCWN0eCAgICAqQy5saWJ4bF9jdHgKIAlsb2dnZXIgKkMueGVudG9vbGxvZ19sb2dn
ZXJfc3RkaW9zdHJlYW0KLS0gCjIuMTkuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
