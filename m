Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F80414D1DE
	for <lists+xen-devel@lfdr.de>; Wed, 29 Jan 2020 21:23:42 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iwtpX-0006Wt-FE; Wed, 29 Jan 2020 20:20:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=bu37=3S=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1iwtpV-0006Wd-Ue
 for xen-devel@lists.xenproject.org; Wed, 29 Jan 2020 20:20:53 +0000
X-Inumbo-ID: d1eddfe4-42d4-11ea-b211-bc764e2007e4
Received: from mail-wr1-x444.google.com (unknown [2a00:1450:4864:20::444])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d1eddfe4-42d4-11ea-b211-bc764e2007e4;
 Wed, 29 Jan 2020 20:20:41 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id t2so1090251wrr.1
 for <xen-devel@lists.xenproject.org>; Wed, 29 Jan 2020 12:20:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/FbJPxpmB5OoBHeLoD4a2Tb0dzwLPZohxRxFGDvz/aM=;
 b=BLGE7OHaGGUF5ilIbVyBjY9XiiaCmjK4Mfe60MEmj8qbr5cB9EpoYL61G16cSaTvJ5
 oIepJoEa3iXy+ti7A3ap+Pnyss7gXd8Z0FOk/F1FQEUX1KIRe2Sf+MnZg6oepsNEneUP
 +mh3rEUvel9pPv+qgEPl8hvFVmGDfHDKzkdaVays1soHKiL2VwzHHNAh1sjYezYLMzQn
 CHV+GTZhqbrvFqSAei2qQ60ApcZaIIYALZM3Oyx1UT0CSmM4fpaPyYgM/IE7tZ2dyXsX
 50MC+euCeN7fZYXg6BsfXwLJH+aszcBDPeIvtCoV47VTbBDZIRyVz+XSl/pfzVBtSamZ
 58Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=/FbJPxpmB5OoBHeLoD4a2Tb0dzwLPZohxRxFGDvz/aM=;
 b=P0UWrWOTNEB5VTXTgQfvHLCqtE56AazotW9o9EgbaIwqGu85TQWhGpGVskCtiPjzfc
 E9KZ1/SdqLnWaMm7TLiUxPtFmwnTni8d4v84OHGzYu8BbRqocrHPo3+iaOGd1YPPFNiw
 vO0kM9j4x5prC2oUmOdTB4I7CqzIBzY93DZL8so/FC30NZz3OouTpSLwuXa3pRp+jpuY
 eT7XkHEwn1eCK7EDkBrS9tZ4rqdNzaqwRX5ql61KCWT2jcPGlrnnSO99ag8c+MM4MZTv
 GrLUlkGLtQAvr4HEbcC6DTvXVuNyAQMigHuxO/hm73PPj6warqbXiy+b7IQh690UBcf/
 yctw==
X-Gm-Message-State: APjAAAWxscpBrQyKAQ3LQiDptPj2C0Y4ukRZudJBDSKekieL/zSgVBn8
 Xl1Ro6j9m86Rhu9CbBE9cDB9rSibbuw=
X-Google-Smtp-Source: APXvYqw7egBWkgvJxpUfm4AAiudYV7Ho+QXD1BugIAlILurcy88HxFWc1wrKRwjq7XeXsnzXIDy0Gw==
X-Received: by 2002:adf:f58a:: with SMTP id f10mr633206wro.105.1580329240578; 
 Wed, 29 Jan 2020 12:20:40 -0800 (PST)
Received: from localhost.localdomain (41.142.6.51.dyn.plus.net. [51.6.142.41])
 by smtp.gmail.com with ESMTPSA id
 a22sm3564115wmd.20.2020.01.29.12.20.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Jan 2020 12:20:40 -0800 (PST)
From: Wei Liu <wl@xen.org>
X-Google-Original-From: Wei Liu <liuwe@microsoft.com>
To: Xen Development List <xen-devel@lists.xenproject.org>
Date: Wed, 29 Jan 2020 20:20:25 +0000
Message-Id: <20200129202034.15052-4-liuwe@microsoft.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200129202034.15052-1-liuwe@microsoft.com>
References: <20200129202034.15052-1-liuwe@microsoft.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v5 03/12] x86/smp: don't online cpu if
 hypervisor_ap_setup fails
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
 Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <pdurrant@amazon.com>,
 Michael Kelley <mikelley@microsoft.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

UHVzaCBoeXBlcnZpc29yX2FwX3NldHVwIGRvd24gdG8gc21wX2NhbGxpbi4KClRha2UgdGhlIGNo
YW5jZSB0byByZXBsYWNlIHhlbl9ndWVzdCB3aXRoIGNwdV9oYXNfaHlwZXJ2aXNvci4KClNpZ25l
ZC1vZmYtYnk6IFdlaSBMaXUgPGxpdXdlQG1pY3Jvc29mdC5jb20+Ci0tLQogeGVuL2FyY2gveDg2
L3NtcGJvb3QuYyB8IDEwICsrKysrKystLS0KIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMo
KyksIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L3NtcGJvb3QuYyBi
L3hlbi9hcmNoL3g4Ni9zbXBib290LmMKaW5kZXggYzlkMWFiNDQyMy4uOTNiODZhMDllOSAxMDA2
NDQKLS0tIGEveGVuL2FyY2gveDg2L3NtcGJvb3QuYworKysgYi94ZW4vYXJjaC94ODYvc21wYm9v
dC5jCkBAIC0xOTksNiArMTk5LDEzIEBAIHN0YXRpYyB2b2lkIHNtcF9jYWxsaW4odm9pZCkKICAg
ICAgICAgZ290byBoYWx0OwogICAgIH0KIAorICAgIGlmICggY3B1X2hhc19oeXBlcnZpc29yICYm
IChyYyA9IGh5cGVydmlzb3JfYXBfc2V0dXAoKSkgIT0gMCApCisgICAgeworICAgICAgICBwcmlu
dGsoIkNQVSVkOiBGYWlsZWQgdG8gaW5pdGlhbGlzZSBoeXBlcnZpc29yIGZ1bmN0aW9ucy4gTm90
IGNvbWluZyBvbmxpbmUuXG4iLCBjcHUpOworICAgICAgICBjcHVfZXJyb3IgPSByYzsKKyAgICAg
ICAgZ290byBoYWx0OworICAgIH0KKwogICAgIGlmICggKHJjID0gaHZtX2NwdV91cCgpKSAhPSAw
ICkKICAgICB7CiAgICAgICAgIHByaW50aygiQ1BVJWQ6IEZhaWxlZCB0byBpbml0aWFsaXNlIEhW
TS4gTm90IGNvbWluZyBvbmxpbmUuXG4iLCBjcHUpOwpAQCAtMzcxLDkgKzM3OCw2IEBAIHZvaWQg
c3RhcnRfc2Vjb25kYXJ5KHZvaWQgKnVudXNlZCkKIAogICAgIHRzeF9pbml0KCk7IC8qIE5lZWRz
IG1pY3JvY29kZS4gIE1heSBjaGFuZ2UgSExFL1JUTSBmZWF0dXJlIGJpdHMuICovCiAKLSAgICBp
ZiAoIHhlbl9ndWVzdCApCi0gICAgICAgIGh5cGVydmlzb3JfYXBfc2V0dXAoKTsKLQogICAgIHNt
cF9jYWxsaW4oKTsKIAogICAgIHNldF9jcHVfc2libGluZ19tYXAoY3B1KTsKLS0gCjIuMjAuMQoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
