Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2117A126853
	for <lists+xen-devel@lfdr.de>; Thu, 19 Dec 2019 18:41:48 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ihzkq-0006GN-Iv; Thu, 19 Dec 2019 17:38:28 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=KiZr=2J=amazon.com=prvs=249f004f8=pdurrant@srs-us1.protection.inumbo.net>)
 id 1ihzkp-0006GI-7C
 for xen-devel@lists.xenproject.org; Thu, 19 Dec 2019 17:38:27 +0000
X-Inumbo-ID: 5cdee9dc-2286-11ea-9238-12813bfff9fa
Received: from smtp-fw-2101.amazon.com (unknown [72.21.196.25])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5cdee9dc-2286-11ea-9238-12813bfff9fa;
 Thu, 19 Dec 2019 17:38:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1576777106; x=1608313106;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=rgsXm5wx04IMIdD91vD9lT9sPMfHSGm8KZsX/ynXuRc=;
 b=JgDmRFQlqVQG3nU3lxh9Cd/lROq9UCWMlDOIa7NdeILB0wD2iyQjFAjV
 g2j7FiTV8n5BtyFiQeZtHdZiKkRaYHtuGR8fFKXjSAU3QArWDg87sK6e/
 GFa7orGOM47VeSxSJQ3kPeZeH2+sz1tsa5UIrUWnRknXFyX0ghX+SIpyZ U=;
IronPort-SDR: 8bXb22/8DhlDsXKgMCEBpTk9Jrv6CxcMaQZIrYZox/K/vpg961C1XrXsNkA2GqrH5/GUZL5ocr
 I2jrxuKbqLgA==
X-IronPort-AV: E=Sophos;i="5.69,332,1571702400"; 
   d="scan'208";a="9299699"
Received: from iad12-co-svc-p1-lb1-vlan2.amazon.com (HELO
 email-inbound-relay-2b-8cc5d68b.us-west-2.amazon.com) ([10.43.8.2])
 by smtp-border-fw-out-2101.iad2.amazon.com with ESMTP;
 19 Dec 2019 17:38:25 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan3.pdx.amazon.com [10.170.41.166])
 by email-inbound-relay-2b-8cc5d68b.us-west-2.amazon.com (Postfix) with ESMTPS
 id EB893A2349; Thu, 19 Dec 2019 17:38:24 +0000 (UTC)
Received: from EX13D32EUB003.ant.amazon.com (10.43.166.165) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.243) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 19 Dec 2019 17:38:24 +0000
Received: from EX13MTAUWA001.ant.amazon.com (10.43.160.58) by
 EX13D32EUB003.ant.amazon.com (10.43.166.165) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 19 Dec 2019 17:38:23 +0000
Received: from u2f063a87eabd5f.cbg10.amazon.com (10.125.106.135) by
 mail-relay.amazon.com (10.43.160.118) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Thu, 19 Dec 2019 17:38:21 +0000
From: Paul Durrant <pdurrant@amazon.com>
To: <xen-devel@lists.xenproject.org>
Date: Thu, 19 Dec 2019 17:38:19 +0000
Message-ID: <20191219173819.14065-1-pdurrant@amazon.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [PATCH v3] x86/save: reserve HVM save record numbers
 that have been consumed...
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Paul Durrant <pdurrant@amazon.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Li4uZm9yIHBhdGNoZXMgbm90ICh5ZXQpIHVwc3RyZWFtLgoKVGhpcyBwYXRjaCBpcyBzaW1wbHkg
YWRkaW5nIGEgY29tbWVudCB0byByZXNlcnZlIHNhdmUgcmVjb3JkIG51bWJlciBzcGFjZQp0byBh
dm9pZCB0aGUgcmlzayBvZiBjbGFzaGVzIGJldHdlZW4gZXhpc3RlbnQgZG93bnN0cmVhbSBjaGFu
Z2VzIG1hZGUgYnkKQW1hem9uIGFuZCBmdXR1cmUgdXBzdHJlYW0gY2hhbmdlcyB3aGljaCBtYXkg
YmUgaW5jb21wYXRpYmxlLgoKU2lnbmVkLW9mZi1ieTogUGF1bCBEdXJyYW50IDxwZHVycmFudEBh
bWF6b24uY29tPgpSZXZpZXdlZC1ieTogV2VpIExpdSA8d2xAeGVuLm9yZz4KLS0tCkNjOiBKYW4g
QmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CkNjOiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29v
cGVyM0BjaXRyaXguY29tPgpDYzogIlJvZ2VyIFBhdSBNb25uw6kiIDxyb2dlci5wYXVAY2l0cml4
LmNvbT4KCnYzOgogLSBSZWR1Y2VkIHJhbmdlIGFuZCBjbGFyaWZpZWQgaW5jbHVzaXZpdHkKCnYy
OgogLSBSZWR1Y2UgcGF0Y2ggdG8ganVzdCBhIGNvbW1lbnQKLS0tCiB4ZW4vaW5jbHVkZS9wdWJs
aWMvYXJjaC14ODYvaHZtL3NhdmUuaCB8IDIgKysKIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlv
bnMoKykKCmRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS9wdWJsaWMvYXJjaC14ODYvaHZtL3NhdmUu
aCBiL3hlbi9pbmNsdWRlL3B1YmxpYy9hcmNoLXg4Ni9odm0vc2F2ZS5oCmluZGV4IGIyYWQzZmNk
NzQuLjQ2OGMyOGRlZGIgMTAwNjQ0Ci0tLSBhL3hlbi9pbmNsdWRlL3B1YmxpYy9hcmNoLXg4Ni9o
dm0vc2F2ZS5oCisrKyBiL3hlbi9pbmNsdWRlL3B1YmxpYy9hcmNoLXg4Ni9odm0vc2F2ZS5oCkBA
IC02MzksNiArNjM5LDggQEAgc3RydWN0IGh2bV9tc3IgewogCiAjZGVmaW5lIENQVV9NU1JfQ09E
RSAgMjAKIAorLyogUmFuZ2UgMjIgLSAzNCAoaW5jbHVzaXZlKSByZXNlcnZlZCBmb3IgQW1hem9u
ICovCisKIC8qCiAgKiBMYXJnZXN0IHR5cGUtY29kZSBpbiB1c2UKICAqLwotLSAKMi4yMC4xCgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
