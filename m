Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CD1CF1212
	for <lists+xen-devel@lfdr.de>; Wed,  6 Nov 2019 10:22:46 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iSHTi-0006xR-Ks; Wed, 06 Nov 2019 09:19:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=rf37=Y6=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1iSHTh-0006xD-UI
 for xen-devel@lists.xenproject.org; Wed, 06 Nov 2019 09:19:49 +0000
X-Inumbo-ID: 888272fc-0076-11ea-b678-bc764e2007e4
Received: from mail-lf1-x142.google.com (unknown [2a00:1450:4864:20::142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 888272fc-0076-11ea-b678-bc764e2007e4;
 Wed, 06 Nov 2019 09:19:29 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id y6so17476485lfj.2
 for <xen-devel@lists.xenproject.org>; Wed, 06 Nov 2019 01:19:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=051XW9OjPeed0xS97OPOpuHNYizMGvM3NpFZuAOd2bA=;
 b=kBg2hJnVWs2KeV57ITQd3crZeispZqLWt4aQXSraZwtFX2E3KGsbSY0fznvsPdUzTT
 Rax/RkbTm1JY8gEGG1VKOEteQROXbQHHIKXfj7XFukVlrMPLVbd7WZKsKb84T7Vhuucv
 prGGZG3uGpCW9hRXIfDzfgLyV9pT9W2EV0CmdCnSz4Zq2jivLdyvc9HEsgCO4dwjRmnY
 CkxEg/g/NQQ228dhbRB8olNnRRSjt26Uevqs8HcUmrsqug7n8q7nESjLnNDS3AxoGMHv
 DRxAopinuSRaMhSVhDcSGpP/J2q1p2krc0m2Oo370dAsZgwwQA3ew7CD/ikK5HxmUWfi
 Mg5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=051XW9OjPeed0xS97OPOpuHNYizMGvM3NpFZuAOd2bA=;
 b=Ru3orZYMqae/ZqqsyIBYbawvjCUjmy5Hx7/dueHq+sF5wDjcNxKYo2N3ex7MFBrUMt
 yRy9joydMRwN8BdVZUla4/rzrNPIGcEmbgZLsONCPz7BGgmsAQ7gNdxUSmMOe9mFkxW2
 yeJg+y1iK6XVwYM9tefupkBKLvfQSBM1fs0DvKmHc03fXDIjv2+eqTJa+6hGZeGzqFpe
 jM7vOg45hZjFX8UED3rBVnjLqDgyuQgyIv/cPw0GOtTH9c/cu9rwJoLyXGSkeisURzbF
 KAAH+WHzy5GpYHpZJ38bGtmacmHe+NhoOsyLjbDY725rVz7KN1eJlRMx+aJTF8Cwkfcj
 yjTQ==
X-Gm-Message-State: APjAAAWmh/tmDOMIMEutEALCULH4+b5Q41EQ/Xw1KCPfnIkydU1Xdt8v
 yz7iFiVqoKp2ZIrtqAF5Mrtaz1Nj5MA=
X-Google-Smtp-Source: APXvYqwxFCF7juC5qHSk6BA6fIRYtyr8ZnHUhWcCEH/vHIBdwAGaFoEtSg3sdgWeyyLotHscDttnKA==
X-Received: by 2002:a19:cc07:: with SMTP id c7mr24094186lfg.107.1573031967381; 
 Wed, 06 Nov 2019 01:19:27 -0800 (PST)
Received: from aanisov-work.kyiv.epam.com (ll-74.141.223.85.sovam.net.ua.
 [85.223.141.74])
 by smtp.gmail.com with ESMTPSA id g23sm3945937lja.104.2019.11.06.01.19.26
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Wed, 06 Nov 2019 01:19:26 -0800 (PST)
From: Andrii Anisov <andrii.anisov@gmail.com>
To: xen-devel@lists.xenproject.org
Date: Wed,  6 Nov 2019 11:19:12 +0200
Message-Id: <1573031953-12894-7-git-send-email-andrii.anisov@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1573031953-12894-1-git-send-email-andrii.anisov@gmail.com>
References: <1573031953-12894-1-git-send-email-andrii.anisov@gmail.com>
Subject: [Xen-devel] [RFC 6/7] arm: Introduce dummy empty functions for data
 only C files
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
Cc: Julien Grall <julien@xen.org>, Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Andrii Anisov <andrii_anisov@epam.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogQW5kcmlpIEFuaXNvdiA8YW5kcmlpX2FuaXNvdkBlcGFtLmNvbT4KCkFSTSBDb21waWxl
ciA2IGhhcyBhIHByb3ZlbiBidWc6IGl0IGNvbXBpbGVzIGRhdGEgb25seSBDIGZpbGVzIHdpdGgK
U29mdFZGUCBhdHRyaWJ1dGVzLiBUaGlzIGxlYWRzIHRvIGEgZmFpbGVkIGxpbmthZ2UgYWZ0ZXJ3
YXJkcyB3aXRoCmFuIGVycm9yOgoKRXJyb3I6IEw2MjQyRTogQ2Fubm90IGxpbmsgb2JqZWN0IGJ1
aWx0X2luLm8gYXMgaXRzIGF0dHJpYnV0ZXMgYXJlIGluY29tcGF0aWJsZSB3aXRoIHRoZSBpbWFn
ZSBhdHRyaWJ1dGVzLgouLi4gQTY0IGNsYXNoZXMgd2l0aCBTb2Z0VkZQLgoKVGhlIGtub3duIHdv
cmthcm91bmQgaXMgaW50cm9kdWNpbmcgc29tZSBjb2RlIGludG8gdGhlIGFmZmVjdGVkIGZpbGUs
CmUuZy4gYW4gZW1wdHkgKG5vbi1zdGF0aWMpIGZ1bmN0aW9uIGlzIGVub3VnaC4KClNpZ25lZC1v
ZmYtYnk6IEFuZHJpaSBBbmlzb3YgPGFuZHJpaV9hbmlzb3ZAZXBhbS5jb20+Ci0tLQogeGVuL2Fy
Y2gvYXJtL3BsYXRmb3Jtcy9icmNtLXJhc3BiZXJyeS1waS5jIHwgMiArKwogeGVuL2FyY2gvYXJt
L3BsYXRmb3Jtcy90aHVuZGVyeC5jICAgICAgICAgIHwgMiArKwogeGVuL3hzbS9mbGFzay9nZW4t
cG9saWN5LnB5ICAgICAgICAgICAgICAgIHwgNCArKysrCiAzIGZpbGVzIGNoYW5nZWQsIDggaW5z
ZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9wbGF0Zm9ybXMvYnJjbS1yYXNw
YmVycnktcGkuYyBiL3hlbi9hcmNoL2FybS9wbGF0Zm9ybXMvYnJjbS1yYXNwYmVycnktcGkuYwpp
bmRleCBiNjk3ZmEyLi43YWIxODEwIDEwMDY0NAotLS0gYS94ZW4vYXJjaC9hcm0vcGxhdGZvcm1z
L2JyY20tcmFzcGJlcnJ5LXBpLmMKKysrIGIveGVuL2FyY2gvYXJtL3BsYXRmb3Jtcy9icmNtLXJh
c3BiZXJyeS1waS5jCkBAIC00MCw2ICs0MCw4IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZHRfZGV2
aWNlX21hdGNoIHJwaTRfYmxhY2tsaXN0X2RldltdIF9faW5pdGNvbnN0ID0KICAgICB7IC8qIHNl
bnRpbmVsICovIH0sCiB9OwogCit2b2lkIGJyY21fcmFzcGJlcnJ5X3BpX2R1bW15X2Z1bmModm9p
ZCkge30KKwogUExBVEZPUk1fU1RBUlQocnBpNCwgIlJhc3BiZXJyeSBQaSA0IikKICAgICAuY29t
cGF0aWJsZSAgICAgPSBycGk0X2R0X2NvbXBhdCwKICAgICAuYmxhY2tsaXN0X2RldiAgPSBycGk0
X2JsYWNrbGlzdF9kZXYsCmRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vcGxhdGZvcm1zL3RodW5k
ZXJ4LmMgYi94ZW4vYXJjaC9hcm0vcGxhdGZvcm1zL3RodW5kZXJ4LmMKaW5kZXggOWIzMmEyOS4u
ODAxNTMyMyAxMDA2NDQKLS0tIGEveGVuL2FyY2gvYXJtL3BsYXRmb3Jtcy90aHVuZGVyeC5jCisr
KyBiL3hlbi9hcmNoL2FybS9wbGF0Zm9ybXMvdGh1bmRlcnguYwpAQCAtMzMsNiArMzMsOCBAQCBz
dGF0aWMgY29uc3Qgc3RydWN0IGR0X2RldmljZV9tYXRjaCB0aHVuZGVyeF9ibGFja2xpc3RfZGV2
W10gX19pbml0Y29uc3QgPQogICAgIHsgLyogc2VudGluZWwgKi8gfSwKIH07CiAKK3ZvaWQgdGh1
bmRlcnhfZHVtbXlfZnVuYyh2b2lkKSB7fQorCiBQTEFURk9STV9TVEFSVCh0aHVuZGVyeCwgIlRI
VU5ERVJYIikKICAgICAuY29tcGF0aWJsZSA9IHRodW5kZXJ4X2R0X2NvbXBhdCwKICAgICAuYmxh
Y2tsaXN0X2RldiA9IHRodW5kZXJ4X2JsYWNrbGlzdF9kZXYsCmRpZmYgLS1naXQgYS94ZW4veHNt
L2ZsYXNrL2dlbi1wb2xpY3kucHkgYi94ZW4veHNtL2ZsYXNrL2dlbi1wb2xpY3kucHkKaW5kZXgg
Yzc1MDFlNC4uNzNiZjdkMiAxMDA2NDQKLS0tIGEveGVuL3hzbS9mbGFzay9nZW4tcG9saWN5LnB5
CisrKyBiL3hlbi94c20vZmxhc2svZ2VuLXBvbGljeS5weQpAQCAtMjEsMyArMjEsNyBAQCBzeXMu
c3Rkb3V0LndyaXRlKCIiIgogfTsKIGNvbnN0IHVuc2lnbmVkIGludCBfX2luaXRjb25zdCB4c21f
Zmxhc2tfaW5pdF9wb2xpY3lfc2l6ZSA9ICVkOwogIiIiICUgcG9saWN5X3NpemUpCisKK3N5cy5z
dGRvdXQud3JpdGUoIiIiCit2b2lkIHBvbGljeV9kdW1teV9mdW5jKHZvaWQpIHt9CisiIiIpCi0t
IAoyLjcuNAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
