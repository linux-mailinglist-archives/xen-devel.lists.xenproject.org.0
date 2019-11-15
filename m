Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ED56FE5EF
	for <lists+xen-devel@lfdr.de>; Fri, 15 Nov 2019 20:47:36 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iVhXd-0001oy-2Q; Fri, 15 Nov 2019 19:46:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=1SQg=ZH=gmail.com=rosbrookn@srs-us1.protection.inumbo.net>)
 id 1iVhXb-0001nZ-Hc
 for xen-devel@lists.xenproject.org; Fri, 15 Nov 2019 19:45:59 +0000
X-Inumbo-ID: 70d7d4a0-07e0-11ea-b678-bc764e2007e4
Received: from mail-qk1-x743.google.com (unknown [2607:f8b0:4864:20::743])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 70d7d4a0-07e0-11ea-b678-bc764e2007e4;
 Fri, 15 Nov 2019 19:45:13 +0000 (UTC)
Received: by mail-qk1-x743.google.com with SMTP id d13so9051132qko.3
 for <xen-devel@lists.xenproject.org>; Fri, 15 Nov 2019 11:45:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=H+WE+lipIRlB+Fufpf96h4a0peDgVnMvRPfh/PoDswM=;
 b=rzSzXp3UJ/tuXb0n9DlnOT73g4cWmaDw4lpVYUaDTm6SGpvOU/kJPudRyvWf/0RhNE
 owu4UgBvxXPVy2HHQP1Yr2kKM/mcT2oY1YDtWLxxBKRvcvWFI4XGDGvB7RRg1rJ3cDVQ
 rIJop2eCiHMhHubSy9Wzj9xuUUpxMR39dmoUMC56U06hOdFn4LUbyBNXtS8yc1P8Kh1f
 uGb9NWNkGFjY0bAwbopeBtWOhDBPXoYlj/2Csu/76NnspcepX9BaUCJ7u4TkVnkddLJu
 380TaFeMxISwE9lmVqutCR068d6tabKaUnYZCJFrU4fxHifFPJ43zSfDhZQVTYwN7F95
 UIcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=H+WE+lipIRlB+Fufpf96h4a0peDgVnMvRPfh/PoDswM=;
 b=Uk5Vp/bqnzraumBAvtMWhhbybrwIp3rF8Sfs6ixXngKbR2pafkBqiIoYQ2FkNSLlSU
 qqqPlyXcDkRUSXOT4WtVlRFDUQq9xCybHkIwzAZoFcCHpMdPqADE+7JyPxYW31UDIU7P
 obuXPUpYtbJzk5IWDxE6szlCh55jBH0zmLtMuS6EU/lcP7NBSw0BjwsHAuxZi2E7t3T1
 BzRSx9R648Nhdtv9jNgIXoC0r11bFhdd/T8E0WkgtEW9jcM+YajvThMr+DC1RqdQuhds
 vmzzX6ZY3k63xUrAW6AJo2a67/O9+7rG4NdqQ8rqgVdqwq3N6QA9kAxCrzIs2LOEj/KY
 dX6w==
X-Gm-Message-State: APjAAAV3/KWWx2zbN4fF1F3XMXNR2tWkyjO/sLY7wMa6iMS4963sjf5W
 JrMqD3koubdPtQfTIjr1HoLIG1VV
X-Google-Smtp-Source: APXvYqzLS0MWglIeOpaqAjwbcybOsjEdU/E43FGKVhft+NhdZu5cEg8rblonadNsl5l3bFEDyLx9kQ==
X-Received: by 2002:a37:9c85:: with SMTP id
 f127mr14392162qke.186.1573847112857; 
 Fri, 15 Nov 2019 11:45:12 -0800 (PST)
Received: from five.crux.rad.ainfosec.com (209-217-208-226.northland.net.
 [209.217.208.226])
 by smtp.googlemail.com with ESMTPSA id y10sm4649679qkb.55.2019.11.15.11.45.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Nov 2019 11:45:12 -0800 (PST)
From: Nick Rosbrook <rosbrookn@gmail.com>
To: xen-devel@lists.xenproject.org
Date: Fri, 15 Nov 2019 14:44:19 -0500
Message-Id: <3bf4e3167d703d680a6bd6f3226ba394b0ed443f.1573840474.git.rosbrookn@ainfosec.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1573840473.git.rosbrookn@ainfosec.com>
References: <cover.1573840473.git.rosbrookn@ainfosec.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v2 12/22] golang/xenlight: re-factor Hwcap type
 implementation
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

RnJvbTogTmljayBSb3Nicm9vayA8cm9zYnJvb2tuQGFpbmZvc2VjLmNvbT4KClJlLWRlZmluZSBI
d2NhcCBhcyBbOF11aW50MzIsIGFuZCBpbXBsZW1lbnQgdG9DIGZ1bmN0aW9uLiBBbHNvLCByZS1u
YW1lIGFuZAptb2RpZnkgc2lnbmF0dXJlIG9mIHRvR28gZnVuY3Rpb24gdG8gZnJvbUMuCgpTaWdu
ZWQtb2ZmLWJ5OiBOaWNrIFJvc2Jyb29rIDxyb3Nicm9va25AYWluZm9zZWMuY29tPgpSZXZpZXdl
ZC1ieTogR2VvcmdlIER1bmxhcCA8Z2VvcmdlLmR1bmxhcEBjaXRyaXguY29tPgotLS0KQ2hhbmdl
cyBpbiB2MjoKLSBGaXggY29tbWVudCBpbiBmcm9tQyBzaW5jZSBhbiBhcnJheSBpcyBiZWluZyB1
c2VkIG5vdywgbm90IGEgc2xpY2UuCi0gVXNlIGEgY29uY2lzZSB2YXJpYWJsZSBuYW1lIGluc3Rl
YWQgb2YgbWFwc2xpY2UgZm9yIHRoZSBDIGFycmF5LiAKCiB0b29scy9nb2xhbmcveGVubGlnaHQv
eGVubGlnaHQuZ28gfCAzMSArKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tCiAxIGZpbGUg
Y2hhbmdlZCwgMjAgaW5zZXJ0aW9ucygrKSwgMTEgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEv
dG9vbHMvZ29sYW5nL3hlbmxpZ2h0L3hlbmxpZ2h0LmdvIGIvdG9vbHMvZ29sYW5nL3hlbmxpZ2h0
L3hlbmxpZ2h0LmdvCmluZGV4IDY3YzFiYjEyMjUuLmQ2ZDkxMmEwMzcgMTAwNjQ0Ci0tLSBhL3Rv
b2xzL2dvbGFuZy94ZW5saWdodC94ZW5saWdodC5nbworKysgYi90b29scy9nb2xhbmcveGVubGln
aHQveGVubGlnaHQuZ28KQEAgLTMxMiwyMCArMzEyLDI5IEBAIHR5cGUgQ29udGV4dCBzdHJ1Y3Qg
ewogCWxvZ2dlciAqQy54ZW50b29sbG9nX2xvZ2dlcl9zdGRpb3N0cmVhbQogfQogCi10eXBlIEh3
Y2FwIFtdQy51aW50MzJfdAorLy8gSHdjYXAgcmVwcmVzZW50cyBhIGxpYnhsX2h3Y2FwLgordHlw
ZSBId2NhcCBbOF11aW50MzIKIAotZnVuYyAoY2h3Y2FwIEMubGlieGxfaHdjYXApIHRvR28oKSAo
Z2h3Y2FwIEh3Y2FwKSB7Ci0JLy8gQWxsb2MgYSBHbyBzbGljZSBmb3IgdGhlIGJ5dGVzCi0Jc2l6
ZSA6PSA4Ci0JZ2h3Y2FwID0gbWFrZShbXUMudWludDMyX3QsIHNpemUpCi0KLQkvLyBNYWtlIGEg
c2xpY2UgcG9pbnRpbmcgdG8gdGhlIEMgYXJyYXkKLQltYXBzbGljZSA6PSAoKlsxIDw8IDMwXUMu
dWludDMyX3QpKHVuc2FmZS5Qb2ludGVyKCZjaHdjYXBbMF0pKVs6c2l6ZTpzaXplXQorZnVuYyAo
aHdjYXAgKkh3Y2FwKSBmcm9tQyhjaHdjYXAgKkMubGlieGxfaHdjYXApIGVycm9yIHsKKwkvLyBN
YWtlIGFuIGFycmF5IHBvaW50aW5nIHRvIHRoZSBDIGFycmF5CisJYSA6PSAoKls4XUMudWludDMy
X3QpKHVuc2FmZS5Qb2ludGVyKGNod2NhcCkpCiAKIAkvLyBBbmQgY29weSB0aGUgQyBhcnJheSBp
bnRvIHRoZSBHbyBhcnJheQotCWNvcHkoZ2h3Y2FwLCBtYXBzbGljZSkKKwlmb3IgaSwgdiA6PSBy
YW5nZSBhIHsKKwkJaHdjYXBbaV0gPSB1aW50MzIodikKKwl9CiAKLQlyZXR1cm4KKwlyZXR1cm4g
bmlsCit9CisKK2Z1bmMgKGh3Y2FwICpId2NhcCkgdG9DKCkgKEMubGlieGxfaHdjYXAsIGVycm9y
KSB7CisJdmFyIGNod2NhcCBDLmxpYnhsX2h3Y2FwCisKKwlmb3IgaSwgdiA6PSByYW5nZSBod2Nh
cCB7CisJCWNod2NhcFtpXSA9IEMudWludDMyX3QodikKKwl9CisKKwlyZXR1cm4gY2h3Y2FwLCBu
aWwKIH0KIAogLy8gS2V5VmFsdWVMaXN0IHJlcHJlc2VudHMgYSBsaWJ4bF9rZXlfdmFsdWVfbGlz
dC4KQEAgLTQ0OCw3ICs0NTcsNyBAQCBmdW5jIChjcGh5cyAqQy5saWJ4bF9waHlzaW5mbykgdG9H
bygpIChwaHlzaW5mbyAqUGh5c2luZm8pIHsKIAlwaHlzaW5mby5TaGFyaW5nRnJlZWRQYWdlcyA9
IHVpbnQ2NChjcGh5cy5zaGFyaW5nX2ZyZWVkX3BhZ2VzKQogCXBoeXNpbmZvLlNoYXJpbmdVc2Vk
RnJhbWVzID0gdWludDY0KGNwaHlzLnNoYXJpbmdfdXNlZF9mcmFtZXMpCiAJcGh5c2luZm8uTnJO
b2RlcyA9IHVpbnQzMihjcGh5cy5ucl9ub2RlcykKLQlwaHlzaW5mby5Id0NhcCA9IGNwaHlzLmh3
X2NhcC50b0dvKCkKKwlwaHlzaW5mby5Id0NhcC5mcm9tQygmY3BoeXMuaHdfY2FwKQogCXBoeXNp
bmZvLkNhcEh2bSA9IGJvb2woY3BoeXMuY2FwX2h2bSkKIAlwaHlzaW5mby5DYXBIdm1EaXJlY3Rp
byA9IGJvb2woY3BoeXMuY2FwX2h2bV9kaXJlY3RpbykKIAotLSAKMi4xOS4xCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
