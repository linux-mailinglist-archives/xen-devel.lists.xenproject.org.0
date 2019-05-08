Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AB4A17593
	for <lists+xen-devel@lfdr.de>; Wed,  8 May 2019 12:02:32 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hOJMX-0005e6-IV; Wed, 08 May 2019 09:59:45 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=O+xT=TI=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1hOJMW-0005dv-KZ
 for xen-devel@lists.xen.org; Wed, 08 May 2019 09:59:44 +0000
X-Inumbo-ID: 0010a965-7178-11e9-843c-bc764e045a96
Received: from mail-lj1-x242.google.com (unknown [2a00:1450:4864:20::242])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 0010a965-7178-11e9-843c-bc764e045a96;
 Wed, 08 May 2019 09:59:43 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id e13so2341699ljl.11
 for <xen-devel@lists.xen.org>; Wed, 08 May 2019 02:59:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=ub7oPvhz5Sx32zhTP0sFlTWKTefTxr3drYY/p0XkoKg=;
 b=V9FtBmDiOIBMtybCvbmfqXYMvt2jWqTugD+mPOjjtkJ3R+DgDLB5G9TJnHSM5NrSar
 EIjgEBZZJu7kU/bs1n4CZIgK7oloz5pW2yUI8Av8Zg9cGnmFhD9FJflAULU/AQuy+cCG
 CK0JpXxUvDeXp4nU7rMQjFZLCxtYmFEqSspzWcULMt63I/pxdYOVO3TNNg5sxbCYiT1p
 XuZ2AN2PbOP3B4X8OEVnGaeIwJBYbHLZvKbqYywojRbtX6ebjcdnLK/QWvUhT57kzsaQ
 /YDJCBloRPMK1JeJgkCh6FmfK2hRnhMuhH45A4XXX1pdc/bXBFob3IVwdK8oQ3ARqoiW
 h0uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=ub7oPvhz5Sx32zhTP0sFlTWKTefTxr3drYY/p0XkoKg=;
 b=id5Aa4XvjwrUQIlSgEwxqQt/jC53bcym0NW1pUBkH1uNO0EuKKE7Xh+7pWt1hGl0Ou
 wSy0uE8vwA94O+XHVMMLYmpX+uIoY+WYn4lXA7q0vK/OkdkVdVD5g1BChAfjbbs2l/Ny
 TP5kIjnkV0V6OyXXglUKD7JsD2XcBFkhtGMwwwhXx/6/cdAQV4fwDMKr7B0lzqxOUusF
 DpTSGzloZf1pjKPqcStPmZEeiBkODR3MFuaO08FFfuVYxIJwlG9/Lt6Je7BQdWsJ7/Zw
 Rr0BQViBqebKtuQSCdUQe6K/YdStL2ENCO3u9SjMHwldNZducu/r74A3HG+DG3OWOPnH
 dofw==
X-Gm-Message-State: APjAAAXkODvYTSUMjRJbnF3XmWjyluc46QrifXezFJSK2diVnwsN+dg7
 xGBtyDZcgcj44mJpTYEpNgu/K/bJTXU=
X-Google-Smtp-Source: APXvYqykNxqbbMH8afa4aRzQyR8FV8CuF0npjZu0eg/E7GqRQpCSmR1ybj6TQFoYallsLDaeR4xV5w==
X-Received: by 2002:a2e:7f12:: with SMTP id a18mr3473498ljd.144.1557309580986; 
 Wed, 08 May 2019 02:59:40 -0700 (PDT)
Received: from aanisov-work.kyiv.epam.com (ll-22.209.223.85.sovam.net.ua.
 [85.223.209.22])
 by smtp.gmail.com with ESMTPSA id x2sm3779665ljx.13.2019.05.08.02.59.39
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Wed, 08 May 2019 02:59:40 -0700 (PDT)
From: Andrii Anisov <andrii.anisov@gmail.com>
To: xen-devel@lists.xen.org
Date: Wed,  8 May 2019 12:59:38 +0300
Message-Id: <1557309578-6436-1-git-send-email-andrii.anisov@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [Xen-devel] [PATCH] xen:arm: we never get into schedule_tail() with
 prev==current
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
Cc: xen-devel@lists.xenproject.org, Julien Grall <julien.grall@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Andrii Anisov <andrii_anisov@epam.com>, Dario Faggioli <dfaggioli@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogQW5kcmlpIEFuaXNvdiA8YW5kcmlpX2FuaXNvdkBlcGFtLmNvbT4KCkFSTSdzIHNjaGVk
dWxlX3RhaWwoKSBpcyBjYWxsZWQgZnJvbSB0d28gcGxhY2VzOiBjb250ZXh0X3N3aXRjaCgpIGFu
ZApjb250aW51ZV9uZXdfdmNwdSgpLiBCb3RoIGZ1bmN0aW9ucyBhcmUgYWx3YXlzIGNhbGxlZCB3
aXRoCnByZXYhPWN1cnJlbnQuIFNvIHJlcGxhY2UgdGhlIGNvcnJlc3BvbmRlbnQgY2hlY2sgaW4g
c2NoZWR1bGVfdGFpbCgpCndpdGggQVNTRVJUKCkgd2hpY2ggaXMgdGhlIGRldmVsb3BtZW50IChk
ZWJ1ZykgYnVpbGQgZ3VhcmQuCgpTaWduZWQtb2ZmLWJ5OiBBbmRyaWkgQW5pc292IDxhbmRyaWlf
YW5pc292QGVwYW0uY29tPgotLS0KIHhlbi9hcmNoL2FybS9kb21haW4uYyB8IDUgKysrLS0KIDEg
ZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0
IGEveGVuL2FyY2gvYXJtL2RvbWFpbi5jIGIveGVuL2FyY2gvYXJtL2RvbWFpbi5jCmluZGV4IDZk
YzYzM2UuLjcyMWQ0MGUgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL2FybS9kb21haW4uYworKysgYi94
ZW4vYXJjaC9hcm0vZG9tYWluLmMKQEAgLTMwNSw2ICszMDUsOCBAQCBzdGF0aWMgdm9pZCB1cGRh
dGVfcnVuc3RhdGVfYXJlYShzdHJ1Y3QgdmNwdSAqdikKIAogc3RhdGljIHZvaWQgc2NoZWR1bGVf
dGFpbChzdHJ1Y3QgdmNwdSAqcHJldikKIHsKKyAgICBBU1NFUlQocHJldiAhPSBjdXJyZW50KTsK
KwogICAgIGN0eHRfc3dpdGNoX2Zyb20ocHJldik7CiAKICAgICBjdHh0X3N3aXRjaF90byhjdXJy
ZW50KTsKQEAgLTMxMyw4ICszMTUsNyBAQCBzdGF0aWMgdm9pZCBzY2hlZHVsZV90YWlsKHN0cnVj
dCB2Y3B1ICpwcmV2KQogCiAgICAgY29udGV4dF9zYXZlZChwcmV2KTsKIAotICAgIGlmICggcHJl
diAhPSBjdXJyZW50ICkKLSAgICAgICAgdXBkYXRlX3J1bnN0YXRlX2FyZWEoY3VycmVudCk7Cisg
ICAgdXBkYXRlX3J1bnN0YXRlX2FyZWEoY3VycmVudCk7CiAKICAgICAvKiBFbnN1cmUgdGhhdCB0
aGUgdmNwdSBoYXMgYW4gdXAtdG8tZGF0ZSB0aW1lIGJhc2UuICovCiAgICAgdXBkYXRlX3ZjcHVf
c3lzdGVtX3RpbWUoY3VycmVudCk7Ci0tIAoyLjcuNAoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
