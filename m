Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 68C271543D1
	for <lists+xen-devel@lfdr.de>; Thu,  6 Feb 2020 13:13:21 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1izfzP-0004tm-Si; Thu, 06 Feb 2020 12:10:35 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=NKTe=32=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1izfzN-0004tf-W8
 for xen-devel@lists.xenproject.org; Thu, 06 Feb 2020 12:10:34 +0000
X-Inumbo-ID: aa10e560-48d9-11ea-af50-12813bfff9fa
Received: from mail-wr1-f65.google.com (unknown [209.85.221.65])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id aa10e560-48d9-11ea-af50-12813bfff9fa;
 Thu, 06 Feb 2020 12:10:29 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id w12so6903059wrt.2
 for <xen-devel@lists.xenproject.org>; Thu, 06 Feb 2020 04:10:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/5xyUTPHlnntCvjJ20lqVh79epuXpml2WbCik5V4xZo=;
 b=RUiGy89H29ENfJXzwaa+0vkLOJ580oBy9+6NKcOfrneAocPPICeBC3UOrc8rOP3wAL
 l2xO5LNFHXKS68acq2cRLalE6Mwk2yuDrjI3h41rFF0Izurqn+X5fH3kpTHlJuR0kuSW
 aILamzJYRsZIPO4FExm06RxE1AEvaYEJC+W4yq2Sx8qojchtI1MPkwLOUJe3ISF0QGQd
 U9lztUBHxagcFPCqTxxjqcgsohFLNbclTpT7qOZUJZO6KueJXPYtJOp2QUfqmmIOU0vj
 fTiJ6mAq/q0ckAqI4waoYG253YV5jLqeNWwKFyaPDNQ0KjYaU5xlfcABQtmGGPzDMP0A
 0a2Q==
X-Gm-Message-State: APjAAAXGBDJpLRr8wPGbjya2rsaopq1QQ+qJ3w6cVGg/LqBTlp4X7otX
 AAV0Q4OIfbr9dAgBFHZS9+ctn6L0jSU=
X-Google-Smtp-Source: APXvYqwU6bLJahglAWi/O8nNDE0cBBCfr8IXLQJ1VspfzSabhdu47cFvE/pGbyWPh1jcmucNHAbn0w==
X-Received: by 2002:adf:ed09:: with SMTP id a9mr3634352wro.350.1580991028084; 
 Thu, 06 Feb 2020 04:10:28 -0800 (PST)
Received: from localhost.localdomain (41.142.6.51.dyn.plus.net. [51.6.142.41])
 by smtp.gmail.com with ESMTPSA id
 2sm3789362wrq.31.2020.02.06.04.10.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Feb 2020 04:10:27 -0800 (PST)
From: Wei Liu <wl@xen.org>
To: Xen Development List <xen-devel@lists.xenproject.org>
Date: Thu,  6 Feb 2020 12:10:24 +0000
Message-Id: <20200206121024.21803-1-wl@xen.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH] x86: make it clear range is inclusive when
 printing e820 range
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Q2hhbmdlIHRoZSBmb3JtYXQgc3RyaW5nIHRvIHVzZSAiWyxdIiBhbmQgc3VidHJhY3QgMSBmcm9t
IHRoZSBlbmQuCgpTaWduZWQtb2ZmLWJ5OiBXZWkgTGl1IDx3bEB4ZW4ub3JnPgotLS0KIHhlbi9h
cmNoL3g4Ni9lODIwLmMgfCA0ICsrLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyks
IDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L2U4MjAuYyBiL3hlbi9h
cmNoL3g4Ni9lODIwLmMKaW5kZXggMTYwZjAyOWVkZC4uYzlkYzUyYzc2OCAxMDA2NDQKLS0tIGEv
eGVuL2FyY2gveDg2L2U4MjAuYworKysgYi94ZW4vYXJjaC94ODYvZTgyMC5jCkBAIC05Miw5ICs5
Miw5IEBAIHN0YXRpYyB2b2lkIF9faW5pdCBwcmludF9lODIwX21lbW9yeV9tYXAoc3RydWN0IGU4
MjBlbnRyeSAqbWFwLCB1bnNpZ25lZCBpbnQgZW50CiAgICAgdW5zaWduZWQgaW50IGk7CiAKICAg
ICBmb3IgKGkgPSAwOyBpIDwgZW50cmllczsgaSsrKSB7Ci0gICAgICAgIHByaW50aygiICUwMTZM
eCAtICUwMTZMeCAiLAorICAgICAgICBwcmludGsoIiBbJTAxNkx4LCAlMDE2THhdICIsCiAgICAg
ICAgICAgICAgICAodW5zaWduZWQgbG9uZyBsb25nKShtYXBbaV0uYWRkciksCi0gICAgICAgICAg
ICAgICAodW5zaWduZWQgbG9uZyBsb25nKShtYXBbaV0uYWRkciArIG1hcFtpXS5zaXplKSk7Cisg
ICAgICAgICAgICAgICAodW5zaWduZWQgbG9uZyBsb25nKShtYXBbaV0uYWRkciArIG1hcFtpXS5z
aXplKSAtIDEpOwogICAgICAgICBzd2l0Y2ggKG1hcFtpXS50eXBlKSB7CiAgICAgICAgIGNhc2Ug
RTgyMF9SQU06CiAgICAgICAgICAgICBwcmludGsoIih1c2FibGUpXG4iKTsKLS0gCjIuMjAuMQoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
