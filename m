Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C3FBB129806
	for <lists+xen-devel@lfdr.de>; Mon, 23 Dec 2019 16:22:10 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ijPTO-0006Rs-2Z; Mon, 23 Dec 2019 15:18:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=o8ed=2N=gmail.com=rosbrookn@srs-us1.protection.inumbo.net>)
 id 1ijPTM-0006RE-He
 for xen-devel@lists.xenproject.org; Mon, 23 Dec 2019 15:18:16 +0000
X-Inumbo-ID: 6488a966-2597-11ea-88e7-bc764e2007e4
Received: from mail-qv1-xf44.google.com (unknown [2607:f8b0:4864:20::f44])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6488a966-2597-11ea-88e7-bc764e2007e4;
 Mon, 23 Dec 2019 15:17:54 +0000 (UTC)
Received: by mail-qv1-xf44.google.com with SMTP id f16so6465194qvi.4
 for <xen-devel@lists.xenproject.org>; Mon, 23 Dec 2019 07:17:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :in-reply-to:references;
 bh=F/xV9O13I7GQ/UCRCjsUvyaympRarisj/rLEyIKgRFk=;
 b=pHMlx/8LE4XvEKQdtXEU5JugHWGVSHtPu5CB0TuFY+vwS7ud3dp6GCiMKqPWuoIc0J
 KeMrfC+AfndLLXMxb1XFU/WAgqW23rF/kZbi4q/eNA1VSv0W0FBUhK5irNio9wnHZdYU
 K3v0/jm5/q0IWBg9cQHMYRrLYeSJwgj9bRzWfefPjD30Z3TLNe/xvDCdGICKMnlGu3N8
 q2O1oJD/RVEeOfQx55nRP9qKxuQeEyDWWCXT+sejzxosO1bMJ8bvxuhoSwa32D0vcCcK
 0pJPq2e3lI13cUd2GrcPciO97d8HvvxxqafyfIqdYluGT1qPX0TB9Qn71dty/eCZJCzX
 uZyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:in-reply-to:references;
 bh=F/xV9O13I7GQ/UCRCjsUvyaympRarisj/rLEyIKgRFk=;
 b=KMmxKm1iD+ddxhpK42nDdmfhnyUq1LgM+o3NSsZZpIxmCSYZDXnZldO6xAbggenAV1
 wAaOUXxtcvG1r1C7ZslVKyQDlwtcFhEt4BhmvJAWrzSIVJ2pfoEGky6EsVNBldJa2Otd
 OWfgOQI57aT2dVfQgSzA19dnadxIvOiQJ3xd9kMLFaAAMfNt6p30tzIGtAhof9yULQ/u
 uzlgubvFAX35aSkGaOXzQf/1LqIYt5zVOC9VmPw13GulyPfUakEqLgDDpNjLw18bKOpO
 Rp/giE7FKjjfOQ+9gonis23ziVGg7I+q35vLrQY3b9I1Lfwz6bBvZqZ3uanGAK6+ho13
 axpQ==
X-Gm-Message-State: APjAAAUampyArhidBPb109Nj90sOZnjW9hQgzp4qRWblybT32SYXHWRg
 CfNqNom667Hfw7keVGDkn34j5YAo
X-Google-Smtp-Source: APXvYqwZ8k+GIdIvG464d7bb9g5hI8ovmp+u+tGC7954ukk610VnYppuqyyat1ONvNOLglX4BesNEQ==
X-Received: by 2002:a0c:c389:: with SMTP id o9mr25177144qvi.232.1577114273901; 
 Mon, 23 Dec 2019 07:17:53 -0800 (PST)
Received: from four.lan (cpe-67-241-56-252.twcny.res.rr.com. [67.241.56.252])
 by smtp.gmail.com with ESMTPSA id
 u15sm5823907qku.67.2019.12.23.07.17.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Dec 2019 07:17:53 -0800 (PST)
From: Nick Rosbrook <rosbrookn@gmail.com>
X-Google-Original-From: Nick Rosbrook <rosbrookn@ainfosec.com>
To: xen-devel@lists.xenproject.org
Date: Mon, 23 Dec 2019 10:17:07 -0500
Message-Id: <ad29a05b00a16557443f37f387b4c900002d5e5e.1577111872.git.rosbrookn@ainfosec.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1577111872.git.rosbrookn@ainfosec.com>
References: <cover.1577111872.git.rosbrookn@ainfosec.com>
In-Reply-To: <cover.1577111872.git.rosbrookn@ainfosec.com>
References: <cover.1577111872.git.rosbrookn@ainfosec.com>
Subject: [Xen-devel] [PATCH v4 6/6] golang/xenlight: add error return type
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
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QSBwcmV2aW91cyBjb21taXQgdGhhdCByZW1vdmVkIENvbnRleHQuQ2hlY2tPcGVuIHJldmVhbGVk
CmFuIGluZWZmZWN0dWFsIGFzc2lnbmVudCB0byBlcnIgaW4gQ29udGV4dC5DcHVwb29saW5mbywg
YXMKdGhlcmUgaXMgbm8gZXJyb3IgcmV0dXJuIHR5cGUuCgpTaW5jZSBpdCBhcHBlYXJzIHRoYXQg
dGhlIGludGVudCBpcyB0byByZXR1cm4gYW4gZXJyb3IgaGVyZSwKYWRkIGFuIGVycm9yIHJldHVy
biB2YWx1ZSB0byB0aGUgZnVuY3Rpb24gc2lnbmF0dXJlLgoKU2lnbmVkLW9mZi1ieTogTmljayBS
b3Nicm9vayA8cm9zYnJvb2tuQGFpbmZvc2VjLmNvbT4KUmV2aWV3ZWQtYnk6IEdlb3JnZSBEdW5s
YXAgPGdlb3JnZS5kdW5sYXBAY2l0cml4LmNvbT4KLS0tCiB0b29scy9nb2xhbmcveGVubGlnaHQv
eGVubGlnaHQuZ28gfCA2ICsrKy0tLQogMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwg
MyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS90b29scy9nb2xhbmcveGVubGlnaHQveGVubGln
aHQuZ28gYi90b29scy9nb2xhbmcveGVubGlnaHQveGVubGlnaHQuZ28KaW5kZXggNWYxNGNhYjZj
ZS4uMjM3ZjI2YmNlOSAxMDA2NDQKLS0tIGEvdG9vbHMvZ29sYW5nL3hlbmxpZ2h0L3hlbmxpZ2h0
LmdvCisrKyBiL3Rvb2xzL2dvbGFuZy94ZW5saWdodC94ZW5saWdodC5nbwpAQCAtNTA0LDE3ICs1
MDQsMTcgQEAgZnVuYyAoQ3R4ICpDb250ZXh0KSBMaXN0Q3B1cG9vbCgpIChsaXN0IFtdQ3B1cG9v
bGluZm8pIHsKIH0KIAogLy8gaW50IGxpYnhsX2NwdXBvb2xfaW5mbyhsaWJ4bF9jdHggKmN0eCwg
bGlieGxfY3B1cG9vbGluZm8gKmluZm8sIHVpbnQzMl90IHBvb2xpZCk7Ci1mdW5jIChDdHggKkNv
bnRleHQpIENwdXBvb2xJbmZvKFBvb2xpZCB1aW50MzIpIChwb29sIENwdXBvb2xpbmZvKSB7Citm
dW5jIChDdHggKkNvbnRleHQpIENwdXBvb2xJbmZvKFBvb2xpZCB1aW50MzIpIChwb29sIENwdXBv
b2xpbmZvLCBlcnIgZXJyb3IpIHsKIAl2YXIgY19jcHVwb29sIEMubGlieGxfY3B1cG9vbGluZm8K
IAogCXJldCA6PSBDLmxpYnhsX2NwdXBvb2xfaW5mbyhDdHguY3R4LCAmY19jcHVwb29sLCBDLnVp
bnQzMl90KFBvb2xpZCkpCiAJaWYgcmV0ICE9IDAgewotCQkvL2VyciA9IEVycm9yKC1yZXQpCisJ
CWVyciA9IEVycm9yKC1yZXQpCiAJCXJldHVybgogCX0KIAlkZWZlciBDLmxpYnhsX2NwdXBvb2xp
bmZvX2Rpc3Bvc2UoJmNfY3B1cG9vbCkKIAotCV8gPSBwb29sLmZyb21DKCZjX2NwdXBvb2wpCisJ
ZXJyID0gcG9vbC5mcm9tQygmY19jcHVwb29sKQogCiAJcmV0dXJuCiB9Ci0tIAoyLjE3LjEKCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
