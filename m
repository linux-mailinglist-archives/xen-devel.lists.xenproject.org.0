Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FFCF118CFE
	for <lists+xen-devel@lfdr.de>; Tue, 10 Dec 2019 16:50:38 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iehk2-0002t6-OJ; Tue, 10 Dec 2019 15:48:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=A1/D=2A=gmail.com=rosbrookn@srs-us1.protection.inumbo.net>)
 id 1iehk0-0002sh-QL
 for xen-devel@lists.xenproject.org; Tue, 10 Dec 2019 15:48:00 +0000
X-Inumbo-ID: 6ce50dd0-1b64-11ea-a1e1-bc764e2007e4
Received: from mail-qt1-x842.google.com (unknown [2607:f8b0:4864:20::842])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6ce50dd0-1b64-11ea-a1e1-bc764e2007e4;
 Tue, 10 Dec 2019 15:47:52 +0000 (UTC)
Received: by mail-qt1-x842.google.com with SMTP id 38so3130244qtb.13
 for <xen-devel@lists.xenproject.org>; Tue, 10 Dec 2019 07:47:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Z2NYMlNEa239ID0p7i58khGBjYrcb8RrDrNqVGHrC6k=;
 b=sTkcmyd/QE8Ga9ksK7HINz32oVWTxWm1Oz6EGNaTzojblW3hjqInZ6PmX4cd1ng+Y5
 9oRhcuErUmHvFXvP1gyo+oq3AC2E1njw5ZDDUxzBnRJv4u9xsZq2QOvzMLaIjJo83kpG
 hjvUGpC3+TcULSaVXyUCgVI6cKxcyVb56B1jwjHb328B+4XDSVnDGagFP094+FAQzffn
 I90MQMqjpTdBcmMWfctsVlJEJKHO4M98iT5fHB+BCP8CMFfrKGn4KLDqgtAEBUeqXu2V
 CdC4FYdXLlN60oZ2Qs/N5GvDA1l/5b/CyXuWjucl0n+a6VfODFooCEPbiAmvAwQDTz74
 QN7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Z2NYMlNEa239ID0p7i58khGBjYrcb8RrDrNqVGHrC6k=;
 b=Xm2qklwdGOkVvoq0cAbZs6e0bvMMamMfXQXXE1uYUfLmjlXZ5uqudUx823zahKE6nq
 Ffv8u7NV7P2oPp6l6qB+2FHImm0XyDcw7wirl461q2E2mhofhpCSw45qmKTeqL80MOOT
 Py0h+RBwgHMjqw12NhVBQo0z1t3CfT5Lh2uIX+UhbFTif+pgWnUJDOg0vEfmgKne5IOp
 ubqmCPt2oxeQfTBfE9zAOXg8pHRI1XyziBU03MD3U2mBuPMWtsufifZWor4AyB6e1fjT
 M7qDw4I1JgvS3Bip2KkZ/ng1Gw94K+uHsJ/W8zCh1gnnXXrkGXnGVqAv78FYQ9Hrv08f
 DPww==
X-Gm-Message-State: APjAAAUFd+UTpJpUbP7efQvYMsGL01HzF/DVc2iDd96bPeF/Mzs74nBK
 OMKsTvUF1wz9b3DJv7cKO/+jlOHQ
X-Google-Smtp-Source: APXvYqyQ4WyzJYCN4Qe97lJpPL1oO/AQYKsGsBR++9pRgagf/KT88xX6WmiZPrKygBsCH9qI/7sgzw==
X-Received: by 2002:ac8:5513:: with SMTP id j19mr30537125qtq.143.1575992871961; 
 Tue, 10 Dec 2019 07:47:51 -0800 (PST)
Received: from five.crux.rad.ainfosec.com (209-217-208-226.northland.net.
 [209.217.208.226])
 by smtp.googlemail.com with ESMTPSA id m29sm1247848qtf.1.2019.12.10.07.47.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Dec 2019 07:47:50 -0800 (PST)
From: Nick Rosbrook <rosbrookn@gmail.com>
To: xen-devel@lists.xenproject.org
Date: Tue, 10 Dec 2019 10:47:17 -0500
Message-Id: <bae2403de4398d38083c5ad26a5a4e155a21ef29.1575990937.git.rosbrookn@ainfosec.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1575990937.git.rosbrookn@ainfosec.com>
References: <cover.1575990937.git.rosbrookn@ainfosec.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v3 02/22] golang/xenlight: define Defbool
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
