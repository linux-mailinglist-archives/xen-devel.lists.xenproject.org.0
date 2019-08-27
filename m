Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DE7079F04A
	for <lists+xen-devel@lfdr.de>; Tue, 27 Aug 2019 18:36:22 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i2ePc-0004ZJ-Ep; Tue, 27 Aug 2019 16:33:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=FFrq=WX=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1i2ePb-0004Z9-7A
 for xen-devel@lists.xenproject.org; Tue, 27 Aug 2019 16:33:39 +0000
X-Inumbo-ID: 6bcea6a0-c8e8-11e9-8980-bc764e2007e4
Received: from mail-lf1-x144.google.com (unknown [2a00:1450:4864:20::144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6bcea6a0-c8e8-11e9-8980-bc764e2007e4;
 Tue, 27 Aug 2019 16:33:38 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id n19so15687507lfe.13
 for <xen-devel@lists.xenproject.org>; Tue, 27 Aug 2019 09:33:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=9rQRUXPKNMSnB0hA3pjo5R6Axo+XMHgf6/hfvw1UOMg=;
 b=bT1wDe5da8aC8dZ7gP3jH8DbHqms9nkp4erG2zLnVYBECGeNqIZWec9HffyOaTk/8J
 mUOhPfK8UDYAjUBGpxzoh9RMIRRj9FGf07kRDTQWZAGyffk/Qvzjo39Bf29sIuHtUpvU
 9QuvnJ+rfDzmSqoald5na5Qp4giNrCbl0eaJSpgcGZJbJVx8qMecycremE0ymLDTXAeS
 HJLMtQAPgHkFdwzA0UV17P/0n9ZgH5ziUsWZxlA8x5yPuUgWOs58MIG597In1tIJ/reE
 V2YaCM18SejHZKJdxQnf70bBvUl5h9ibwQF2E7KBKLb6kzJn+oXHfo1kQfy++gz7LESn
 FKNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=9rQRUXPKNMSnB0hA3pjo5R6Axo+XMHgf6/hfvw1UOMg=;
 b=KG8Kyj1e3PXd5wAak5pdO5RLT4U5mxXtRr1ec/rgzIlJf8IhJy7kWty9jcMRPZth+V
 2sSM23Savh4XADkSIOTx4lCAfJOTPCEFJBrxSOayJ73U0G8OUOMHABB2w8zXu1QpCpL6
 Zu7oyovxAMt+Ssy7e3oSLEj8wgciPcaQgdhfXMcrgujJU7oQqjf0BMb7UWjQmD9hP/la
 E6zZNm8Evzi/KK47g1LmuatySutRQCfjBvtX29rArP8XSQbAkeJ0wyLLU1OnD4zozVSK
 KH8dr5q4q1vNPoyxHbbv5esHgzBBYHpYh7OejpAWjCtIP/xDuWoAd+07NHctjkUI6UCX
 M5AQ==
X-Gm-Message-State: APjAAAU3rYaFYVb31eUWGyKEOpC842P5OL8ELsu69rt5gF7x0m+m++kl
 piDFc+nGZVI7aACDtmdLinU=
X-Google-Smtp-Source: APXvYqwX9VSAbVKxxQq+XqRf1iV5tsuDAjTX6pNKTJJmTSFRJWJXgKigLvVHGF4/ijoYoBsEgDPBBg==
X-Received: by 2002:a19:3f47:: with SMTP id m68mr10498707lfa.108.1566923617153; 
 Tue, 27 Aug 2019 09:33:37 -0700 (PDT)
Received: from aanisov-work.kyiv.epam.com (ll-22.209.223.85.sovam.net.ua.
 [85.223.209.22])
 by smtp.gmail.com with ESMTPSA id b30sm147466lfq.59.2019.08.27.09.33.35
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Tue, 27 Aug 2019 09:33:35 -0700 (PDT)
From: Andrii Anisov <andrii.anisov@gmail.com>
To: 
Date: Tue, 27 Aug 2019 19:33:34 +0300
Message-Id: <1566923614-12503-1-git-send-email-andrii.anisov@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [Xen-devel] [PATCH] arm/traps.c: Adjust HPFAR_EL2 representation
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
Cc: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Julien Grall <julien.grall@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Andrii Anisov <andrii_anisov@epam.com>, xen-devel@lists.xenproject.org
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogQW5kcmlpIEFuaXNvdiA8YW5kcmlpX2FuaXNvdkBlcGFtLmNvbT4KCkluIHRoZSBjb21t
aXQgYWYxNTZmZjA4NTljOGQzNjJhNTcwNjY0MDYxNGM5ZDEwZjYyYWRmMiwgaXQKd2FzIGxlZnQg
dW5hdHRlbmRlZCBIUEZBUl9FTDIgcmVnaXN0ZXIgb3V0cHV0LiBOb3cgaXQgaXMgcHJpbnRlZAp3
aXRoIDE2MDggZGlnaXRzLCB3aGF0IGlzIHdheSB0b28gd2lkZSBldmVuIGZvciB0aGUgYmlnZ2Vz
dAptb25pdG9ycy4gU28gY2xlYW51cCBleGNlc3NpdmUgcGFkZGluZ3MuCgpTaWduZWQtb2ZmLWJ5
OiBBbmRyaWkgQW5pc292IDxhbmRyaWlfYW5pc292QGVwYW0uY29tPgotLS0KIHhlbi9hcmNoL2Fy
bS90cmFwcy5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0
aW9uKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL3RyYXBzLmMgYi94ZW4vYXJjaC9hcm0v
dHJhcHMuYwppbmRleCBmMDEzMjk3Li5hZGRjY2I5IDEwMDY0NAotLS0gYS94ZW4vYXJjaC9hcm0v
dHJhcHMuYworKysgYi94ZW4vYXJjaC9hcm0vdHJhcHMuYwpAQCAtOTM4LDcgKzkzOCw3IEBAIHN0
YXRpYyB2b2lkIF9zaG93X3JlZ2lzdGVycyhjb25zdCBzdHJ1Y3QgY3B1X3VzZXJfcmVncyAqcmVn
cywKICAgICBwcmludGsoIiBUVEJSMF9FTDI6ICUwMTYiUFJJeDY0IlxuIiwgUkVBRF9TWVNSRUc2
NChUVEJSMF9FTDIpKTsKICAgICBwcmludGsoIlxuIik7CiAgICAgcHJpbnRrKCIgICBFU1JfRUwy
OiAlMDgiUFJJeDMyIlxuIiwgcmVncy0+aHNyKTsKLSAgICBwcmludGsoIiBIUEZBUl9FTDI6ICUw
MTYiUFJJcmVnaXN0ZXIiXG4iLCBSRUFEX1NZU1JFRyhIUEZBUl9FTDIpKTsKKyAgICBwcmludGso
IiBIUEZBUl9FTDI6ICUiUFJJcmVnaXN0ZXIiXG4iLCBSRUFEX1NZU1JFRyhIUEZBUl9FTDIpKTsK
IAogI2lmZGVmIENPTkZJR19BUk1fMzIKICAgICBwcmludGsoIiAgICAgSERGQVI6ICUwOCJQUkl4
MzIiXG4iLCBSRUFEX0NQMzIoSERGQVIpKTsKLS0gCjIuNy40CgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
