Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B992FE5F0
	for <lists+xen-devel@lfdr.de>; Fri, 15 Nov 2019 20:47:37 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iVhWt-0001KK-SM; Fri, 15 Nov 2019 19:45:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=1SQg=ZH=gmail.com=rosbrookn@srs-us1.protection.inumbo.net>)
 id 1iVhWs-0001Jl-G3
 for xen-devel@lists.xenproject.org; Fri, 15 Nov 2019 19:45:14 +0000
X-Inumbo-ID: 6a4da196-07e0-11ea-b678-bc764e2007e4
Received: from mail-qv1-xf41.google.com (unknown [2607:f8b0:4864:20::f41])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6a4da196-07e0-11ea-b678-bc764e2007e4;
 Fri, 15 Nov 2019 19:45:02 +0000 (UTC)
Received: by mail-qv1-xf41.google.com with SMTP id i3so4226373qvv.7
 for <xen-devel@lists.xenproject.org>; Fri, 15 Nov 2019 11:45:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Bl4kmcGwcbL0QI9zZzG8ebrx0FfXrmxwyQuh29q0y+o=;
 b=o1Kk0r9eSfUrtfVO+oaE3vb539jkXLsPeETlmMgJB/5CL1f20aRaqt63FNke0/R+i+
 K/njuBL1oCxOL6y7CAPigFazdnohIAtkI1jKDBDWCx9Z7nTsADvivS4vUCw1e/5IbSZO
 95IoO9SjrPbAzuTlbSaGL8Baf7mKHFu8ZU5q6NmdCRpZsQrnhkbv4+0pll/nnm0jvB4F
 RPGbcHyHpD9EUNVeONjzJ9UvSkHT4SYWVxyzJ7DOYXgmIdYGOH5M4bji0NqBY/reFAqh
 21UTLfVhABF/fuNMHt17PZR/VZojokdtkfsZVQlUQ9K6qIn3QrDbmsAc0Ux2yCCq5o8Y
 IyjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Bl4kmcGwcbL0QI9zZzG8ebrx0FfXrmxwyQuh29q0y+o=;
 b=RUqM8grYNDYjuUccrh/rHYNQ2ds4madGsvIpsq9Wk0/8LTYMReVmNRz+qB/Qt51bjq
 MFqpN0j8xINWOsc/dJw44Y+PC/RZmkP0RPX/J5WHrTwZxbnrPX0oP532aLZgqOhq+1EM
 vcdaqb3sTvTDV7x4nlFnRFh2DPPZaiV1y0r9mu5Q1bxBeY20I7lwMD7ZmrQyT8HjuJ/P
 h6ki16joiLu/CUABkDRzdY6s1cMO+6I1k21rC5KY8rkwPpTkIpBk3RPlmFL7DUro0QpV
 ClvjCSjoMktoQ0TX8jM1ytXM5jAGvM61XxZii5sVgg0uQRgnDhx+hTcuQRA0JUw0E7bO
 RMpA==
X-Gm-Message-State: APjAAAWyOflK+Fa0vmBIE4gdMIjRIV1dHacHgWp75+PpzzNXR2wYR/3x
 hXIuDGes9cUGRlwVH1pFvYbpBTpa
X-Google-Smtp-Source: APXvYqxSbBon3vU0SZiiFutdAuzKP2JRdgirGoGDD0ybyb4T1TjdHDUrqX8jTG1poxUPZphsvWNvag==
X-Received: by 2002:ad4:408d:: with SMTP id l13mr1235441qvp.49.1573847101905; 
 Fri, 15 Nov 2019 11:45:01 -0800 (PST)
Received: from five.crux.rad.ainfosec.com (209-217-208-226.northland.net.
 [209.217.208.226])
 by smtp.googlemail.com with ESMTPSA id y10sm4649679qkb.55.2019.11.15.11.45.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Nov 2019 11:45:01 -0800 (PST)
From: Nick Rosbrook <rosbrookn@gmail.com>
To: xen-devel@lists.xenproject.org
Date: Fri, 15 Nov 2019 14:44:10 -0500
Message-Id: <a77f82046710bf352e5026589a160d91fbfffe19.1573840474.git.rosbrookn@ainfosec.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1573840473.git.rosbrookn@ainfosec.com>
References: <cover.1573840473.git.rosbrookn@ainfosec.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v2 03/22] golang/xenlight: define Devid type as
 int
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

RnJvbTogTmljayBSb3Nicm9vayA8cm9zYnJvb2tuQGFpbmZvc2VjLmNvbT4KClNpZ25lZC1vZmYt
Ynk6IE5pY2sgUm9zYnJvb2sgPHJvc2Jyb29rbkBhaW5mb3NlYy5jb20+ClJldmlld2VkLWJ5OiBH
ZW9yZ2UgRHVubGFwIDxnZW9yZ2UuZHVubGFwQGNpdHJpeC5jb20+Ci0tLQogdG9vbHMvZ29sYW5n
L3hlbmxpZ2h0L3hlbmxpZ2h0LmdvIHwgMyArKysKIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlv
bnMoKykKCmRpZmYgLS1naXQgYS90b29scy9nb2xhbmcveGVubGlnaHQveGVubGlnaHQuZ28gYi90
b29scy9nb2xhbmcveGVubGlnaHQveGVubGlnaHQuZ28KaW5kZXggNjQwZDgyZjM1Zi4uOGFjMjZl
NjNmMCAxMDA2NDQKLS0tIGEvdG9vbHMvZ29sYW5nL3hlbmxpZ2h0L3hlbmxpZ2h0LmdvCisrKyBi
L3Rvb2xzL2dvbGFuZy94ZW5saWdodC94ZW5saWdodC5nbwpAQCAtODEsNiArODEsOSBAQCBmdW5j
IChlIEVycm9yKSBFcnJvcigpIHN0cmluZyB7CiAKIHR5cGUgRG9taWQgdWludDMyCiAKKy8vIERl
dmlkIGlzIGEgZGV2aWNlIElELgordHlwZSBEZXZpZCBpbnQKKwogdHlwZSBNZW1LQiB1aW50NjQK
IAogdHlwZSBVdWlkIEMubGlieGxfdXVpZAotLSAKMi4xOS4xCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
