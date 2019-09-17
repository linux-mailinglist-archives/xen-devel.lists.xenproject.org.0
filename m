Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E268B4746
	for <lists+xen-devel@lfdr.de>; Tue, 17 Sep 2019 08:18:55 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iA6mn-00019H-0L; Tue, 17 Sep 2019 06:16:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=+VJ/=XM=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iA6ml-000193-MZ
 for xen-devel@lists.xenproject.org; Tue, 17 Sep 2019 06:16:23 +0000
X-Inumbo-ID: abcc763a-d912-11e9-978d-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id abcc763a-d912-11e9-978d-bc764e2007e4;
 Tue, 17 Sep 2019 06:16:23 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 63BA3AF5A;
 Tue, 17 Sep 2019 06:16:22 +0000 (UTC)
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <625c29ba-cfb8-88ee-eb15-5f2019198865@suse.com>
Message-ID: <4e44e6e6-ca5c-dd93-2407-f92f6a82b053@suse.com>
Date: Tue, 17 Sep 2019 08:16:28 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <625c29ba-cfb8-88ee-eb15-5f2019198865@suse.com>
Content-Language: en-US
Subject: [Xen-devel] [PATCH v2 6/9] x86/HVM: relax shadow mode check in
 hvm_set_cr3()
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
Cc: George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlcmUncyBubyBuZWVkIHRvIHJlLW9idGFpbiBhIHBhZ2UgcmVmZXJlbmNlIGlmIG9ubHkgYml0
cyBub3QgYWZmZWN0aW5nCnRoZSBhZGRyZXNzIGNoYW5nZS4KClNpZ25lZC1vZmYtYnk6IEphbiBC
ZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KUmV2aWV3ZWQtYnk6IFJvZ2VyIFBhdSBNb25uw6kg
PHJvZ2VyLnBhdUBjaXRyaXguY29tPgoKLS0tIGEveGVuL2FyY2gveDg2L2h2bS9odm0uYworKysg
Yi94ZW4vYXJjaC94ODYvaHZtL2h2bS5jCkBAIC0yMzI1LDcgKzIzMjUsNyBAQCBpbnQgaHZtX3Nl
dF9jcjModW5zaWduZWQgbG9uZyB2YWx1ZSwgYm9vCiAgICAgfQogCiAgICAgaWYgKCBodm1fcGFn
aW5nX2VuYWJsZWQodikgJiYgIXBhZ2luZ19tb2RlX2hhcChjdXJyZCkgJiYKLSAgICAgICAgICh2
YWx1ZSAhPSB2LT5hcmNoLmh2bS5ndWVzdF9jclszXSkgKQorICAgICAgICAgKCh2YWx1ZSBeIHYt
PmFyY2guaHZtLmd1ZXN0X2NyWzNdKSA+PiBQQUdFX1NISUZUKSApCiAgICAgewogICAgICAgICAv
KiBTaGFkb3ctbW9kZSBDUjMgY2hhbmdlLiBDaGVjayBQREJSIGFuZCB1cGRhdGUgcmVmY291bnRz
LiAqLwogICAgICAgICBIVk1fREJHX0xPRyhEQkdfTEVWRUxfVk1NVSwgIkNSMyB2YWx1ZSA9ICVs
eCIsIHZhbHVlKTsKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
