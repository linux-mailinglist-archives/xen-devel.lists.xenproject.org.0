Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AAA4E46F9
	for <lists+xen-devel@lfdr.de>; Fri, 25 Oct 2019 11:20:07 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iNviP-0007p0-7S; Fri, 25 Oct 2019 09:17:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=cMeb=YS=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1iNviN-0007oY-Nd
 for xen-devel@lists.xenproject.org; Fri, 25 Oct 2019 09:16:59 +0000
X-Inumbo-ID: 2aeb47b2-f708-11e9-beca-bc764e2007e4
Received: from mail-wm1-x342.google.com (unknown [2a00:1450:4864:20::342])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2aeb47b2-f708-11e9-beca-bc764e2007e4;
 Fri, 25 Oct 2019 09:16:46 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id c22so1241715wmd.1
 for <xen-devel@lists.xenproject.org>; Fri, 25 Oct 2019 02:16:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EhsqHaMATtvXE4hbd+Eeu66aFe8FP/Jxe1IdUOxtz0I=;
 b=cXaqNNMATjfnf//Csgy85n5sfFQ5GaaOMC9FY4AAWj4TcH3tZusKjqY2eGxHZ8DfoO
 Q+hIOM5DlyZP2Px8OfqP7Ko/+5+7UQ6xfYshHb7cVBx7qrgB0ykb5fZBDAr92hujDrcS
 DHUgZ8g5YLAB5Ca16VQ+q4Ub6HpRW0BrD5b802aEWxEG5oiLLgMwM8nbnASF4OYFBqQW
 Nr/cHR7rLwYq8N7FiN5eZckcHtmenfgedpr5GFDvahm3e2cNNskdPGmTiJF6MhH7gZ+a
 VoR1yezI80LvpJRwt4lwRZmXJo2oRv7r+f052F1yIK0nxWkj/l4P/SRIxpBKyeRP8yAB
 tf1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=EhsqHaMATtvXE4hbd+Eeu66aFe8FP/Jxe1IdUOxtz0I=;
 b=DZAvroLU9oBMhgxFlHc6hmLU86uhi5Oxs0hfiJq74yTdGhUqOwa+h4FgCSG42CnF18
 g9p5hLScoLK6blTJX1h3f7kmhGYcu9Tmjd7TEegJeEz5S6yRZ6OjLvMg9IuedWGmqhB3
 mAeRH3NFo72E17ePC8CXajRU8Wy1rPpq1Y3nFyiBgxpreYCFQ8qLkPy/tBJsjk0MWYCz
 4J9knYR/r4Yt+wu8fMcJpKmHcLG+RbkQ6nB1UG4wt38wODcddIjo24zdf753g8A5on1D
 nG46g/HSfhSVpGSJH/Hvp+WCvVtrmc13fjAAT5YPn1592bZXjMPjXwfzhHoHrIMkUG3d
 aIAQ==
X-Gm-Message-State: APjAAAX+i2WaqIFdoNtCsGd92BMzUXPo7ERJR47wtnkjGl6pgU6MGdm3
 IdS1vuNsY0DnTKIX5kxBGp3XjFMCBEg=
X-Google-Smtp-Source: APXvYqwxYs/IdBeIJfAqfKEw7+Yqzw9jdJUgPtzZkNr/+Ferlo9A9zAWFAMDffCyXAWUf2jiXIFxSg==
X-Received: by 2002:a1c:39c1:: with SMTP id g184mr2507650wma.75.1571995005877; 
 Fri, 25 Oct 2019 02:16:45 -0700 (PDT)
Received: from debian.mshome.net (54.163.200.146.dyn.plus.net.
 [146.200.163.54])
 by smtp.gmail.com with ESMTPSA id b62sm1873283wmc.13.2019.10.25.02.16.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Oct 2019 02:16:45 -0700 (PDT)
From: Wei Liu <wl@xen.org>
X-Google-Original-From: Wei Liu <liuwe@microsoft.com>
To: Xen Development List <xen-devel@lists.xenproject.org>
Date: Fri, 25 Oct 2019 10:16:14 +0100
Message-Id: <20191025091618.10153-4-liuwe@microsoft.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191025091618.10153-1-liuwe@microsoft.com>
References: <20191025091618.10153-1-liuwe@microsoft.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH for-next 3/7] x86/hyperv: extract more
 information from Hyper-V
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
Cc: Wei Liu <liuwe@microsoft.com>, Wei Liu <wl@xen.org>,
 Paul Durrant <paul@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Michael Kelley <mikelley@microsoft.com>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

UHJvdmlkZSBhIHN0cnVjdHVyZSB0byBzdG9yZSB0aGF0IGluZm9ybWF0aW9uLiBUaGUgc3RydWN0
dXJlIHdpbGwgYmUKYWNjZXNzZWQgZnJvbSBvdGhlciBwbGFjZXMgbGF0ZXIgc28gbWFrZSBpdCBw
dWJsaWMuCgpTaWduZWQtb2ZmLWJ5OiBXZWkgTGl1IDxsaXV3ZUBtaWNyb3NvZnQuY29tPgotLS0K
IHhlbi9hcmNoL3g4Ni9ndWVzdC9oeXBlcnYvaHlwZXJ2LmMgfCAxNCArKysrKysrKysrKysrKwog
eGVuL2luY2x1ZGUvYXNtLXg4Ni9ndWVzdC9oeXBlcnYuaCB8IDEyICsrKysrKysrKysrKwogMiBm
aWxlcyBjaGFuZ2VkLCAyNiBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2
L2d1ZXN0L2h5cGVydi9oeXBlcnYuYyBiL3hlbi9hcmNoL3g4Ni9ndWVzdC9oeXBlcnYvaHlwZXJ2
LmMKaW5kZXggN2FiNGIxMjdmMy4uMDQxMTY2ZjM0NCAxMDA2NDQKLS0tIGEveGVuL2FyY2gveDg2
L2d1ZXN0L2h5cGVydi9oeXBlcnYuYworKysgYi94ZW4vYXJjaC94ODYvZ3Vlc3QvaHlwZXJ2L2h5
cGVydi5jCkBAIC0yMSw2ICsyMSw5IEBACiAjaW5jbHVkZSA8eGVuL2luaXQuaD4KIAogI2luY2x1
ZGUgPGFzbS9ndWVzdC5oPgorI2luY2x1ZGUgPGFzbS9ndWVzdC9oeXBlcnYtdGxmcy5oPgorCitz
dHJ1Y3QgbXNfaHlwZXJ2X2luZm8gbXNfaHlwZXJ2OwogCiBib29sIF9faW5pdCBoeXBlcnZfcHJv
YmUodm9pZCkKIHsKQEAgLTM2LDYgKzM5LDE3IEBAIGJvb2wgX19pbml0IGh5cGVydl9wcm9iZSh2
b2lkKQogICAgIGlmICggZWF4ICE9IDB4MzEyMzc2NDggKSAgICAvKiBIdiMxICovCiAgICAgICAg
IHJldHVybiBmYWxzZTsKIAorICAgIC8qIEV4dHJhY3QgbW9yZSBpbmZvcm1hdGlvbiBmcm9tIEh5
cGVyLVYgKi8KKyAgICBtc19oeXBlcnYuZmVhdHVyZXMgPSBjcHVpZF9lYXgoSFlQRVJWX0NQVUlE
X0ZFQVRVUkVTKTsKKyAgICBtc19oeXBlcnYubWlzY19mZWF0dXJlcyA9IGNwdWlkX2VkeChIWVBF
UlZfQ1BVSURfRkVBVFVSRVMpOworICAgIG1zX2h5cGVydi5oaW50cyA9IGNwdWlkX2VheChIWVBF
UlZfQ1BVSURfRU5MSUdIVE1FTlRfSU5GTyk7CisKKyAgICBpZiAoIG1zX2h5cGVydi5oaW50cyAm
IEhWX1g2NF9FTkxJR0hURU5FRF9WTUNTX1JFQ09NTUVOREVEICkKKyAgICAgICAgbXNfaHlwZXJ2
Lm5lc3RlZF9mZWF0dXJlcyA9IGNwdWlkX2VheChIWVBFUlZfQ1BVSURfTkVTVEVEX0ZFQVRVUkVT
KTsKKworICAgIG1zX2h5cGVydi5tYXhfdnBfaW5kZXggPSBjcHVpZF9lYXgoSFlQRVJWX0NQVUlE
X0lNUExFTUVOVF9MSU1JVFMpOworICAgIG1zX2h5cGVydi5tYXhfbHBfaW5kZXggPSBjcHVpZF9l
YngoSFlQRVJWX0NQVUlEX0lNUExFTUVOVF9MSU1JVFMpOworCiAgICAgcmV0dXJuIHRydWU7CiB9
CiAKZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRlL2FzbS14ODYvZ3Vlc3QvaHlwZXJ2LmggYi94ZW4v
aW5jbHVkZS9hc20teDg2L2d1ZXN0L2h5cGVydi5oCmluZGV4IDRiOWNjNWE4MzYuLjBmODgwMDA0
MGEgMTAwNjQ0Ci0tLSBhL3hlbi9pbmNsdWRlL2FzbS14ODYvZ3Vlc3QvaHlwZXJ2LmgKKysrIGIv
eGVuL2luY2x1ZGUvYXNtLXg4Ni9ndWVzdC9oeXBlcnYuaApAQCAtMjEsOCArMjEsMjAgQEAKIAog
I2lmZGVmIENPTkZJR19IWVBFUlZfR1VFU1QKIAorI2luY2x1ZGUgPHhlbi90eXBlcy5oPgorCiAj
aW5jbHVkZSA8YXNtL2d1ZXN0L2h5cGVydmlzb3IuaD4KIAorc3RydWN0IG1zX2h5cGVydl9pbmZv
IHsKKyAgICB1aW50MzJfdCBmZWF0dXJlczsKKyAgICB1aW50MzJfdCBtaXNjX2ZlYXR1cmVzOwor
ICAgIHVpbnQzMl90IGhpbnRzOworICAgIHVpbnQzMl90IG5lc3RlZF9mZWF0dXJlczsKKyAgICB1
aW50MzJfdCBtYXhfdnBfaW5kZXg7CisgICAgdWludDMyX3QgbWF4X2xwX2luZGV4OworfTsKK2V4
dGVybiBzdHJ1Y3QgbXNfaHlwZXJ2X2luZm8gbXNfaHlwZXJ2OworCiBleHRlcm4gc3RydWN0IGh5
cGVydmlzb3Jfb3BzIGh5cGVydl9vcHM7CiAKIGJvb2wgaHlwZXJ2X3Byb2JlKHZvaWQpOwotLSAK
Mi4yMC4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
