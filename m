Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D8A4CE72B
	for <lists+xen-devel@lfdr.de>; Mon,  7 Oct 2019 17:18:05 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iHUjG-00084E-Bn; Mon, 07 Oct 2019 15:15:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=0SFq=YA=gmail.com=rosbrookn@srs-us1.protection.inumbo.net>)
 id 1iHUjE-00082t-QD
 for xen-devel@lists.xenproject.org; Mon, 07 Oct 2019 15:15:16 +0000
X-Inumbo-ID: 0def32fa-e915-11e9-96dc-bc764e2007e4
Received: from mail-qt1-x843.google.com (unknown [2607:f8b0:4864:20::843])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0def32fa-e915-11e9-96dc-bc764e2007e4;
 Mon, 07 Oct 2019 15:13:45 +0000 (UTC)
Received: by mail-qt1-x843.google.com with SMTP id i26so2649164qtm.8
 for <xen-devel@lists.xenproject.org>; Mon, 07 Oct 2019 08:13:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kvMRRDeFGz3La7BwkyLtN0z6mdrA0mBRQOwdoAFLP9o=;
 b=CrEnvkIZHANb9rBG7umd0oOB3174KlgzlcYsfku8FS0Q+5YvL1Yx+uW+ZU2rQHvpGR
 5aQKNNwkas9dEyhnTvPFe7E3X4rp5Lc7pZ3CUOGWUW0FOPzZZcOvZV8AiBqlUTQ4yeau
 W7GqLOyd0XX0TTCiIiH7Bs/Dcoc1Rbwr6crOSM1gM2uPzUy/qM9YF9Qm0z+PoPC/H9HP
 1MmLQ/XZ2Fx4Zcsaya5uZ8yRr/XXE8sLQXN5O3blKq7YJ0v6s50sBuVO0GlvjCHOkj/6
 3z8vNR19g2A1alVmwhzPOAgcxhXSCrUqfdFnndLfltlcQePWQEuCF0HxvjeuCDgS5eC6
 E/oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kvMRRDeFGz3La7BwkyLtN0z6mdrA0mBRQOwdoAFLP9o=;
 b=jsRWuOt8T8VihrY1eOBE3VT+4QGzuPVjzl4Ge2rwsBaZqXI8rZctv/V5lLi6BJJ19Q
 u4qM/T+iL+1otOXMFV6JCqtN+RBfNZN8oYoE6p9m6ZbDDkDmXk7LRETLAADJqTKB/LAw
 OAhGdubh5SQXH7D49Kudwa5F9f8jr9GHHkUisrtdqCJdIVpqp93LBXrawte7JIElUGno
 92e6oFDZ6KgV9Cj/xS4fY8vr/OZQ6oKHjow9nI0WQEfeo6Rb09tj5OCSJZ/GiyNJ06QA
 KgMn/2lLinrWe2x1JooeQ0Hcd56bWCu4UR+N9Lr3Ai0YUZVYFWBifac/a6vKyQle9ySO
 tijQ==
X-Gm-Message-State: APjAAAXw2VX+0Q/Y0hR6VAeQPbJfBU1svYHEGtQU3g3Q/OEc72FHXDVl
 OD3n2EZk2QuMzFkQSVq39wFbDUZc
X-Google-Smtp-Source: APXvYqxbecImauCKsuI4JW9uTAJ3BcsocECJYXxYX3WOjmUObZZ0o5FZWp0kB6iz4hXkXuTxVJ20hQ==
X-Received: by 2002:aed:3c27:: with SMTP id t36mr30945047qte.388.1570461224182; 
 Mon, 07 Oct 2019 08:13:44 -0700 (PDT)
Received: from five.crux.rad.ainfosec.com (209-217-208-226.northland.net.
 [209.217.208.226])
 by smtp.googlemail.com with ESMTPSA id c185sm8354313qkg.74.2019.10.07.08.13.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Oct 2019 08:13:43 -0700 (PDT)
From: Nick Rosbrook <rosbrookn@gmail.com>
To: xen-devel@lists.xenproject.org
Date: Mon,  7 Oct 2019 11:13:11 -0400
Message-Id: <26d6deae1803591361f7568645bc59b1535d6b88.1570456846.git.rosbrookn@ainfosec.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1570456846.git.rosbrookn@ainfosec.com>
References: <cover.1570456846.git.rosbrookn@ainfosec.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 24/24] golang/xenlight: add make target for
 generated files
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

RnJvbTogTmljayBSb3Nicm9vayA8cm9zYnJvb2tuQGFpbmZvc2VjLmNvbT4KClJlbW92ZSB0aGUg
UEtHU09VUkNFUyB2YXJpYWJsZSBzaW5jZSBhZGRpbmcgeGVubGlnaHRfdHlwZXMuZ28KYW5kIHhl
bmxpZ2h0X2hlbHBlcnMuZ28gdG8gdGhpcyBsaXN0IGJyZWFrcyB0aGUgcmVzdCBvZiB0aGUKTWFr
ZWZpbGUuCgpBZGQgeGVubGlnaHRfJS5nbyB0YXJnZXQgZm9yIGdlbmVyYXRlZCBmaWxlcywgYW5k
IHVzZSBmdWxsCmZpbGUgbmFtZXMgd2l0aGluIGluc3RhbGwsIHVuaW5zdGFsbCBhbmQgJChYRU5f
R09QQVRIKSQoR09YTF9QS0dfRElSKQpydWxlLgoKU2lnbmVkLW9mZi1ieTogTmljayBSb3Nicm9v
ayA8cm9zYnJvb2tuQGFpbmZvc2VjLmNvbT4KLS0tCkNjOiBHZW9yZ2UgRHVubGFwIDxnZW9yZ2Uu
ZHVubGFwQGNpdHJpeC5jb20+CkNjOiBJYW4gSmFja3NvbiA8aWFuLmphY2tzb25AZXUuY2l0cml4
LmNvbT4KQ2M6IFdlaSBMaXUgPHdsQHhlbi5vcmc+CgogdG9vbHMvZ29sYW5nL3hlbmxpZ2h0L01h
a2VmaWxlIHwgMjIgKysrKysrKysrKysrKystLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDE0IGlu
c2VydGlvbnMoKyksIDggZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvdG9vbHMvZ29sYW5nL3hl
bmxpZ2h0L01ha2VmaWxlIGIvdG9vbHMvZ29sYW5nL3hlbmxpZ2h0L01ha2VmaWxlCmluZGV4IDA5
ODczMDUyMjQuLjgyMWE1ZDQ4ZmEgMTAwNjQ0Ci0tLSBhL3Rvb2xzL2dvbGFuZy94ZW5saWdodC9N
YWtlZmlsZQorKysgYi90b29scy9nb2xhbmcveGVubGlnaHQvTWFrZWZpbGUKQEAgLTcsMjAgKzcs
MjIgQEAgR09DT0RFX0RJUiA/PSAkKHByZWZpeCkvc2hhcmUvZ29jb2RlLwogR09YTF9QS0dfRElS
ID0gL3NyYy8kKFhFTl9HT0NPREVfVVJMKS94ZW5saWdodC8KIEdPWExfSU5TVEFMTF9ESVIgPSAk
KEdPQ09ERV9ESVIpJChHT1hMX1BLR19ESVIpCiAKLSMgUEtHU09VUkNFUzogRmlsZXMgd2hpY2gg
Y29tcHJpc2UgdGhlIGRpc3RyaWJ1dGVkIHNvdXJjZSBwYWNrYWdlCi1QS0dTT1VSQ0VTID0geGVu
bGlnaHQuZ28KLQogR08gPz0gZ28KIAogLlBIT05ZOiBhbGwKIGFsbDogYnVpbGQKIAogLlBIT05Z
OiBwYWNrYWdlCi1wYWNrYWdlOiAkKFhFTl9HT1BBVEgpJChHT1hMX1BLR19ESVIpJChQS0dTT1VS
Q0VTKQorcGFja2FnZTogJChYRU5fR09QQVRIKSQoR09YTF9QS0dfRElSKQogCi0kKFhFTl9HT1BB
VEgpL3NyYy8kKFhFTl9HT0NPREVfVVJMKS94ZW5saWdodC8kKFBLR1NPVVJDRVMpOiAkKFBLR1NP
VVJDRVMpCiskKFhFTl9HT1BBVEgpL3NyYy8kKFhFTl9HT0NPREVfVVJMKS94ZW5saWdodC86IHhl
bmxpZ2h0XyUuZ28KIAkkKElOU1RBTExfRElSKSAkKFhFTl9HT1BBVEgpJChHT1hMX1BLR19ESVIp
Ci0JJChJTlNUQUxMX0RBVEEpICQoUEtHU09VUkNFUykgJChYRU5fR09QQVRIKSQoR09YTF9QS0df
RElSKQorCSQoSU5TVEFMTF9EQVRBKSB4ZW5saWdodC5nbyAkKFhFTl9HT1BBVEgpJChHT1hMX1BL
R19ESVIpCisJJChJTlNUQUxMX0RBVEEpIHhlbmxpZ2h0X3R5cGVzLmdvICQoWEVOX0dPUEFUSCkk
KEdPWExfUEtHX0RJUikKKwkkKElOU1RBTExfREFUQSkgeGVubGlnaHRfaGVscGVycy5nbyAkKFhF
Tl9HT1BBVEgpJChHT1hMX1BLR19ESVIpCisKK3hlbmxpZ2h0XyUuZ286IGdlbmdvdHlwZXMucHkg
JChYRU5fUk9PVCkvdG9vbHMvbGlieGwvbGlieGxfdHlwZXMuaWRsICQoWEVOX1JPT1QpL3Rvb2xz
L2xpYnhsL2lkbC5weQorCVhFTl9ST09UPSQoWEVOX1JPT1QpICQoUFlUSE9OKSBnZW5nb3R5cGVz
LnB5IC4uLy4uL2xpYnhsL2xpYnhsX3R5cGVzLmlkbAogCiAjIEdvIHdpbGwgZG8gaXRzIG93biBk
ZXBlbmRlbmN5IGNoZWNraW5nLCBhbmQgbm90IGFjdHVhbGwgZ28gdGhyb3VnaAogIyB3aXRoIHRo
ZSBidWlsZCBpZiBub25lIG9mIHRoZSBpbnB1dCBmaWxlcyBoYXZlIGNoYW5nZWQuCkBAIC0zNiwx
MCArMzgsMTQgQEAgYnVpbGQ6IHBhY2thZ2UKIC5QSE9OWTogaW5zdGFsbAogaW5zdGFsbDogYnVp
bGQKIAkkKElOU1RBTExfRElSKSAkKERFU1RESVIpJChHT1hMX0lOU1RBTExfRElSKQotCSQoSU5T
VEFMTF9EQVRBKSAkKFhFTl9HT1BBVEgpJChHT1hMX1BLR19ESVIpJChQS0dTT1VSQ0VTKSAkKERF
U1RESVIpJChHT1hMX0lOU1RBTExfRElSKQorCSQoaW5zdGFsbF9kYXRhKSAkKHhlbl9nb3BhdGgp
JChnb3hsX3BrZ19kaXIpeGVubGlnaHQuZ28gJChkZXN0ZGlyKSQoZ294bF9pbnN0YWxsX2RpcikK
KwkkKGluc3RhbGxfZGF0YSkgJCh4ZW5fZ29wYXRoKSQoZ294bF9wa2dfZGlyKXhlbmxpZ2h0X3R5
cGVzLmdvICQoZGVzdGRpcikkKGdveGxfaW5zdGFsbF9kaXIpCisJJChpbnN0YWxsX2RhdGEpICQo
eGVuX2dvcGF0aCkkKGdveGxfcGtnX2Rpcil4ZW5saWdodF9oZWxwZXJzLmdvICQoZGVzdGRpcikk
KGdveGxfaW5zdGFsbF9kaXIpCiAKIC5QSE9OWTogdW5pbnN0YWxsCi0Jcm0gLWYgJChhZGRwcmVm
aXggJChERVNURElSKSQoR09YTF9JTlNUQUxMX0RJUikvLCAkKFBLR1NPVVJDRVMpKQorCXJtIC1m
ICQoYWRkcHJlZml4ICQoREVTVERJUikkKEdPWExfSU5TVEFMTF9ESVIpLywgeGVubGlnaHQuZ28p
CisJcm0gLWYgJChhZGRwcmVmaXggJChERVNURElSKSQoR09YTF9JTlNUQUxMX0RJUikvLCB4ZW5s
aWdodF90eXBlcy5nbykKKwlybSAtZiAkKGFkZHByZWZpeCAkKERFU1RESVIpJChHT1hMX0lOU1RB
TExfRElSKS8sIHhlbmxpZ2h0X2hlbHBlcnMuZ28pCiAKIC5QSE9OWTogY2xlYW4KIGNsZWFuOgot
LSAKMi4xOS4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
