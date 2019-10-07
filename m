Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F3F27CE721
	for <lists+xen-devel@lfdr.de>; Mon,  7 Oct 2019 17:17:11 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iHUjA-0007yl-W2; Mon, 07 Oct 2019 15:15:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=0SFq=YA=gmail.com=rosbrookn@srs-us1.protection.inumbo.net>)
 id 1iHUj9-0007xk-QP
 for xen-devel@lists.xenproject.org; Mon, 07 Oct 2019 15:15:11 +0000
X-Inumbo-ID: 0d3821aa-e915-11e9-9bee-bc764e2007e4
Received: from mail-qt1-x841.google.com (unknown [2607:f8b0:4864:20::841])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0d3821aa-e915-11e9-9bee-bc764e2007e4;
 Mon, 07 Oct 2019 15:13:43 +0000 (UTC)
Received: by mail-qt1-x841.google.com with SMTP id u22so19592653qtq.13
 for <xen-devel@lists.xenproject.org>; Mon, 07 Oct 2019 08:13:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3jlbshyhsnKwUe+1UF5DET0VROjnqCsc7bkrYu/FoCc=;
 b=t2iuLvbxglpe4k2o8NK6Ts3SwCZ7HElL+Lu7fht5a/F7+WT3Zon3xU08IHA3KzxJSi
 X7S5rOoo9ilmDotU4h7eZskBmdwKYo8gL1TD7R+Vo+BgNIRnmPjmCibpFMBJkQ1lLTta
 3cEOziHjA0SIZfv7oqbweIKQLW6+Lnng3ldnNkZWjUV3iHiGt4/iXbWqygRotyoH4RJp
 sH32fg4U1MqD7xe6oGe+Jt9VlMvf7ErhEfe0ymLR/wpkvRKUT1xte64PThfpU2hHb7uC
 hvT1MQ9iRdNZh7VIjmrAlVSjS0JfClKp3nT+0H3AVbUgWK5wSQne/3cKKSQNsO1v9i9q
 u1PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3jlbshyhsnKwUe+1UF5DET0VROjnqCsc7bkrYu/FoCc=;
 b=gYobAsRts0EF4sHaGzo1D/euSR2IO58WxMvcjoTv3dDhex2Xs4dpubbKpmrEH6/qWO
 j5Tpd9GGZqN+Y/M0VUVrlrSRrL3DH5iVIa9Gow5l/+jJMDbmqbqyHnTpUQOguLYv16x6
 Ys7zQydk7ZEUD7ScaUxd+MWpVRLWv4H3bnAvvLyOMrUElpcgPf+rWVuLqAeyZHw0Hr+a
 oLMvJ8Tzs5+rF3z0yA/WvlRkBw/vibtwDsEwN/I5RED+uVh1oIT5E6n577goXvk0Mm/P
 sBVLcX4lSgx14ws2asbZS5L3hGJwiSHUyjwsRWa8iobvoIPwgOmhapRd7uLHg3dGafwb
 vnKw==
X-Gm-Message-State: APjAAAURiUXcYlXrdwrkWqtOv8j3Jx7Tiw99Y5zH3dwnjWiaKgmjsPEH
 UsSQVaODW8p0QzyIJf8LsYV3Ux8V
X-Google-Smtp-Source: APXvYqyWpxIb1FPExH6TAxXj0lVj8Z7Bp8zOrwWRbdiA7PEs+1b/Q2YSuidVKfR8Rs7FzbiWolJsCQ==
X-Received: by 2002:aed:2ae6:: with SMTP id t93mr30231192qtd.384.1570461223079; 
 Mon, 07 Oct 2019 08:13:43 -0700 (PDT)
Received: from five.crux.rad.ainfosec.com (209-217-208-226.northland.net.
 [209.217.208.226])
 by smtp.googlemail.com with ESMTPSA id c185sm8354313qkg.74.2019.10.07.08.13.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Oct 2019 08:13:42 -0700 (PDT)
From: Nick Rosbrook <rosbrookn@gmail.com>
To: xen-devel@lists.xenproject.org
Date: Mon,  7 Oct 2019 11:13:10 -0400
Message-Id: <96e1b2bbb921981be2d05232e5cc1f38a97d7809.1570456846.git.rosbrookn@ainfosec.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1570456846.git.rosbrookn@ainfosec.com>
References: <cover.1570456846.git.rosbrookn@ainfosec.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 23/24] golang/xenlight: add error return type to
 Context.Cpupoolinfo
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
c2Jyb29rbkBhaW5mb3NlYy5jb20+Ci0tLQpDYzogR2VvcmdlIER1bmxhcCA8Z2VvcmdlLmR1bmxh
cEBjaXRyaXguY29tPgpDYzogSWFuIEphY2tzb24gPGlhbi5qYWNrc29uQGV1LmNpdHJpeC5jb20+
CkNjOiBXZWkgTGl1IDx3bEB4ZW4ub3JnPgoKIHRvb2xzL2dvbGFuZy94ZW5saWdodC94ZW5saWdo
dC5nbyB8IDYgKysrLS0tCiAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAzIGRlbGV0
aW9ucygtKQoKZGlmZiAtLWdpdCBhL3Rvb2xzL2dvbGFuZy94ZW5saWdodC94ZW5saWdodC5nbyBi
L3Rvb2xzL2dvbGFuZy94ZW5saWdodC94ZW5saWdodC5nbwppbmRleCBlNTQwYjU0MTNkLi4wYTRm
NDc2NDUxIDEwMDY0NAotLS0gYS90b29scy9nb2xhbmcveGVubGlnaHQveGVubGlnaHQuZ28KKysr
IGIvdG9vbHMvZ29sYW5nL3hlbmxpZ2h0L3hlbmxpZ2h0LmdvCkBAIC01MzAsMTcgKzUzMCwxNyBA
QCBmdW5jIChDdHggKkNvbnRleHQpIExpc3RDcHVwb29sKCkgKGxpc3QgW11DcHVwb29saW5mbykg
ewogfQogCiAvLyBpbnQgbGlieGxfY3B1cG9vbF9pbmZvKGxpYnhsX2N0eCAqY3R4LCBsaWJ4bF9j
cHVwb29saW5mbyAqaW5mbywgdWludDMyX3QgcG9vbGlkKTsKLWZ1bmMgKEN0eCAqQ29udGV4dCkg
Q3B1cG9vbEluZm8oUG9vbGlkIHVpbnQzMikgKHBvb2wgQ3B1cG9vbGluZm8pIHsKK2Z1bmMgKEN0
eCAqQ29udGV4dCkgQ3B1cG9vbEluZm8oUG9vbGlkIHVpbnQzMikgKHBvb2wgQ3B1cG9vbGluZm8s
IGVyciBlcnJvcikgewogCXZhciBjX2NwdXBvb2wgQy5saWJ4bF9jcHVwb29saW5mbwogCiAJcmV0
IDo9IEMubGlieGxfY3B1cG9vbF9pbmZvKEN0eC5jdHgsICZjX2NwdXBvb2wsIEMudWludDMyX3Qo
UG9vbGlkKSkKIAlpZiByZXQgIT0gMCB7Ci0JCS8vZXJyID0gRXJyb3IoLXJldCkKKwkJZXJyID0g
RXJyb3IoLXJldCkKIAkJcmV0dXJuCiAJfQogCWRlZmVyIEMubGlieGxfY3B1cG9vbGluZm9fZGlz
cG9zZSgmY19jcHVwb29sKQogCi0JXyA9IHBvb2wuZnJvbUMoJmNfY3B1cG9vbCkKKwllcnIgPSBw
b29sLmZyb21DKCZjX2NwdXBvb2wpCiAKIAlyZXR1cm4KIH0KLS0gCjIuMTkuMQoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
