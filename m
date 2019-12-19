Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D5AC1261B7
	for <lists+xen-devel@lfdr.de>; Thu, 19 Dec 2019 13:07:56 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ihuYD-0001tF-Ms; Thu, 19 Dec 2019 12:05:05 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=KiZr=2J=amazon.com=prvs=249f004f8=pdurrant@srs-us1.protection.inumbo.net>)
 id 1ihuYB-0001t9-RS
 for xen-devel@lists.xenproject.org; Thu, 19 Dec 2019 12:05:03 +0000
X-Inumbo-ID: c985537a-2257-11ea-9191-12813bfff9fa
Received: from smtp-fw-6001.amazon.com (unknown [52.95.48.154])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c985537a-2257-11ea-9191-12813bfff9fa;
 Thu, 19 Dec 2019 12:05:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1576757103; x=1608293103;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=lQPeT1+tZNPL5cg2HY3I6xHQICswBH7lS2kd+pHT9Qs=;
 b=eO5yTVksbLlzzU1bmeSDTam2aAM5HeAQIC4wtXxnA3gvyxVdRi3yEWX8
 sQS/LUsr5025oC9ob2HvqrsXgv8qRLD9XAXUJxk3MB+8GueCXtaQmHRl1
 pMhQwVdggEQ8tjI+GADs/x/RoF0xXdeoyFy0uZfFcmdnrua2QpA1zttO4 c=;
IronPort-SDR: exDHRye/Mmg5on9IeLwfTb4S2IVDKjNnIfcy/HUKFwmPdDgMl7BUva4wFtR4sMGxh/Fpa0L/wV
 UhszGBMNZJJA==
X-IronPort-AV: E=Sophos;i="5.69,331,1571702400"; 
   d="scan'208";a="9773324"
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-1a-821c648d.us-east-1.amazon.com) ([10.43.8.6])
 by smtp-border-fw-out-6001.iad6.amazon.com with ESMTP;
 19 Dec 2019 12:05:02 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan3.iad.amazon.com [10.40.159.166])
 by email-inbound-relay-1a-821c648d.us-east-1.amazon.com (Postfix) with ESMTPS
 id 9570BA2007; Thu, 19 Dec 2019 12:05:00 +0000 (UTC)
Received: from EX13D32EUB001.ant.amazon.com (10.43.166.125) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.243) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 19 Dec 2019 12:05:00 +0000
Received: from EX13MTAUEA001.ant.amazon.com (10.43.61.82) by
 EX13D32EUB001.ant.amazon.com (10.43.166.125) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 19 Dec 2019 12:04:59 +0000
Received: from u2f063a87eabd5f.cbg10.amazon.com (10.125.106.135) by
 mail-relay.amazon.com (10.43.61.243) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Thu, 19 Dec 2019 12:04:57 +0000
From: Paul Durrant <pdurrant@amazon.com>
To: <xen-devel@lists.xenproject.org>
Date: Thu, 19 Dec 2019 12:04:55 +0000
Message-ID: <20191219120455.13357-1-pdurrant@amazon.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [PATCH v2] x86/save: reserve HVM save record numbers
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
LmNvbT4KCnYyOgogLSBSZWR1Y2UgcGF0Y2ggdG8ganVzdCBhIGNvbW1lbnQKLS0tCiB4ZW4vaW5j
bHVkZS9wdWJsaWMvYXJjaC14ODYvaHZtL3NhdmUuaCB8IDIgKysKIDEgZmlsZSBjaGFuZ2VkLCAy
IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS9wdWJsaWMvYXJjaC14ODYv
aHZtL3NhdmUuaCBiL3hlbi9pbmNsdWRlL3B1YmxpYy9hcmNoLXg4Ni9odm0vc2F2ZS5oCmluZGV4
IGIyYWQzZmNkNzQuLmIzZDQ0NWFjZjcgMTAwNjQ0Ci0tLSBhL3hlbi9pbmNsdWRlL3B1YmxpYy9h
cmNoLXg4Ni9odm0vc2F2ZS5oCisrKyBiL3hlbi9pbmNsdWRlL3B1YmxpYy9hcmNoLXg4Ni9odm0v
c2F2ZS5oCkBAIC02MzksNiArNjM5LDggQEAgc3RydWN0IGh2bV9tc3IgewogCiAjZGVmaW5lIENQ
VV9NU1JfQ09ERSAgMjAKIAorLyogUmFuZ2UgMjIgLSA0MCByZXNlcnZlZCBmb3IgQW1hem9uICov
CisKIC8qCiAgKiBMYXJnZXN0IHR5cGUtY29kZSBpbiB1c2UKICAqLwotLSAKMi4yMC4xCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
