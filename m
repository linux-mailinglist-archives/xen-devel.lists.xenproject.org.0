Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F39FB473A
	for <lists+xen-devel@lfdr.de>; Tue, 17 Sep 2019 08:14:57 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iA6jR-0000Zc-OK; Tue, 17 Sep 2019 06:12:57 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=+VJ/=XM=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iA6jQ-0000Z3-GW
 for xen-devel@lists.xenproject.org; Tue, 17 Sep 2019 06:12:56 +0000
X-Inumbo-ID: 301f1fb0-d912-11e9-9601-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 301f1fb0-d912-11e9-9601-12813bfff9fa;
 Tue, 17 Sep 2019 06:12:55 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id CD0B8AC4D;
 Tue, 17 Sep 2019 06:12:54 +0000 (UTC)
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <625c29ba-cfb8-88ee-eb15-5f2019198865@suse.com>
Message-ID: <be39b9f6-7404-8c05-26e3-4416533ed9a0@suse.com>
Date: Tue, 17 Sep 2019 08:13:00 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <625c29ba-cfb8-88ee-eb15-5f2019198865@suse.com>
Content-Language: en-US
Subject: [Xen-devel] [PATCH v2 1/9] x86: adjust cr3_pcid() return type
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

VGhlcmUncyBubyBuZWVkIGZvciBpdCB0byBiZSA2NCBiaXRzIHdpZGUgLSBvbmx5IHRoZSBsb3cg
dHdlbHZlIGJpdHMKb2YgQ1IzIGhvbGQgdGhlIFBDSUQuCgpTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1
bGljaCA8amJldWxpY2hAc3VzZS5jb20+ClJldmlld2VkLWJ5OiBSb2dlciBQYXUgTW9ubsOpIDxy
b2dlci5wYXVAY2l0cml4LmNvbT4KCi0tLSBhL3hlbi9hcmNoL3g4Ni9mbHVzaHRsYi5jCisrKyBi
L3hlbi9hcmNoL3g4Ni9mbHVzaHRsYi5jCkBAIC0xMDMsNyArMTAzLDggQEAgc3RhdGljIHZvaWQg
ZG9fdGxiX2ZsdXNoKHZvaWQpCiAKIHZvaWQgc3dpdGNoX2NyM19jcjQodW5zaWduZWQgbG9uZyBj
cjMsIHVuc2lnbmVkIGxvbmcgY3I0KQogewotICAgIHVuc2lnbmVkIGxvbmcgZmxhZ3MsIG9sZF9j
cjQsIG9sZF9wY2lkOworICAgIHVuc2lnbmVkIGxvbmcgZmxhZ3MsIG9sZF9jcjQ7CisgICAgdW5z
aWduZWQgaW50IG9sZF9wY2lkOwogICAgIHUzMiB0OwogCiAgICAgLyogVGhpcyBub24tcmVlbnRy
YW50IGZ1bmN0aW9uIGlzIHNvbWV0aW1lcyBjYWxsZWQgaW4gaW50ZXJydXB0IGNvbnRleHQuICov
Ci0tLSBhL3hlbi9pbmNsdWRlL2FzbS14ODYvcHJvY2Vzc29yLmgKKysrIGIveGVuL2luY2x1ZGUv
YXNtLXg4Ni9wcm9jZXNzb3IuaApAQCAtMjg3LDcgKzI4Nyw3IEBAIHN0YXRpYyBpbmxpbmUgdW5z
aWduZWQgbG9uZyBjcjNfcGEodW5zaWcKICAgICByZXR1cm4gY3IzICYgWDg2X0NSM19BRERSX01B
U0s7CiB9CiAKLXN0YXRpYyBpbmxpbmUgdW5zaWduZWQgbG9uZyBjcjNfcGNpZCh1bnNpZ25lZCBs
b25nIGNyMykKK3N0YXRpYyBpbmxpbmUgdW5zaWduZWQgaW50IGNyM19wY2lkKHVuc2lnbmVkIGxv
bmcgY3IzKQogewogICAgIHJldHVybiBjcjMgJiBYODZfQ1IzX1BDSURfTUFTSzsKIH0KCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
