Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC5A41154B5
	for <lists+xen-devel@lfdr.de>; Fri,  6 Dec 2019 16:59:02 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1idFvG-0007dm-3h; Fri, 06 Dec 2019 15:53:38 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=JJ0v=Z4=amazon.com=prvs=23679664e=hongyxia@srs-us1.protection.inumbo.net>)
 id 1idFvE-0007dh-GG
 for xen-devel@lists.xenproject.org; Fri, 06 Dec 2019 15:53:36 +0000
X-Inumbo-ID: 8ee10583-1840-11ea-8369-12813bfff9fa
Received: from smtp-fw-6001.amazon.com (unknown [52.95.48.154])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8ee10583-1840-11ea-8369-12813bfff9fa;
 Fri, 06 Dec 2019 15:53:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1575647616; x=1607183616;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=uoulwX/qy9TB+gF3/b4JKgBI2tqpryV6wBHdBCcxNL8=;
 b=rYerGaTuOUzx3vWu3SwbyT8pxGZVBFrW7oSg8Czfti73AJgufs37LX+i
 tyJyQVXzE5j3ZO2j4y3Lzp3my4W50o04G3FHyJrBxHv1JmuCagOdQzjb5
 fVxhBq+5ysTx6ENvi+AUzT/7MUi9IhE+BfUha2sbCufGDxW7upjEOm9zB 4=;
IronPort-SDR: 7rtxxe83mYf6tA8UDnklc+QB/1gINYYqKnf54UUkR0YIpln2+qRQ0/Kx0rJ3X9MFiQFT4jljBd
 6YW521XWrzzA==
X-IronPort-AV: E=Sophos;i="5.69,285,1571702400"; 
   d="scan'208";a="7965721"
Received: from iad6-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-1e-303d0b0e.us-east-1.amazon.com) ([10.124.125.6])
 by smtp-border-fw-out-6001.iad6.amazon.com with ESMTP;
 06 Dec 2019 15:53:35 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan3.iad.amazon.com [10.40.159.166])
 by email-inbound-relay-1e-303d0b0e.us-east-1.amazon.com (Postfix) with ESMTPS
 id 65C18A25B6; Fri,  6 Dec 2019 15:53:33 +0000 (UTC)
Received: from EX13D37EUB001.ant.amazon.com (10.43.166.31) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.82) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Fri, 6 Dec 2019 15:53:32 +0000
Received: from EX13MTAUEE001.ant.amazon.com (10.43.62.200) by
 EX13D37EUB001.ant.amazon.com (10.43.166.31) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Fri, 6 Dec 2019 15:53:31 +0000
Received: from u60d575063b1f53.ant.amazon.com (10.125.106.64) by
 mail-relay.amazon.com (10.43.62.226) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Fri, 6 Dec 2019 15:53:30 +0000
From: Hongyan Xia <hongyxia@amazon.com>
To: <xen-devel@lists.xenproject.org>
Date: Fri, 6 Dec 2019 15:53:28 +0000
Message-ID: <cover.1575646580.git.hongyxia@amazon.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [PATCH 0/2] Refactor super page shattering
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, jgrall@amazon.com,
 Wei Liu <wl@xen.org>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

bWFwX3BhZ2VzX3RvX3hlbiBhbmQgbW9kaWZ5X3hlbl9tYXBwaW5ncyB1c2UgYWxtb3N0IGV4YWN0
bHkgdGhlIHNhbWUKcGFnZSBzaGF0dGVyaW5nIGxvZ2ljLCBhbmQgdGhlIGNvZGUgaXMgbWluZ2xl
ZCB3aXRoIG90aGVyIFBURQptYW5pcHVsYXRpb25zIHNvIGl0IGlzIGxlc3Mgb2J2aW91cyB0aGF0
IHRoZSBpbnRlbnRpb24gaXMgcGFnZQpzaGF0dGVyaW5nLiBGYWN0b3Igb3V0IHRoZSBmdW5jdGlv
bnMgdG8gbWFrZSB0aGVtIHJldXNhYmxlIGFuZCB0byBtYWtlCnRoZSBpbnRlbnRpb24gbW9yZSBv
YnZpb3VzLgoKT2YgY291cnNlLCB0aGVyZSBpcyBub3QgbXVjaCBkaWZmZXJlbmNlIGJldHdlZW4g
dGhlIHNoYXR0ZXJpbmcgbG9naWMgb2YKZWFjaCBsZXZlbCwgc28gd2UgY291bGQgZnVydGhlciB0
dXJuIHRoZSBwZXItbGV2ZWwgZnVuY3Rpb25zIGludG8gYQpzaW5nbGUgbWFjcm8sIGFsdGhvdWdo
IHRoaXMgaXMgbm90IHRoYXQgc2ltcGxlIHNpbmNlIHdlIGhhdmUgcGVyLWxldmVsCmZ1bmN0aW9u
cyBhbmQgbWFjcm9zIGFsbCBvdmVyIHRoZSBwbGFjZSBhbmQgdGhlcmUgYXJlIHNsaWdodCBkaWZm
ZXJlbmNlcwpiZXR3ZWVuIGxldmVscy4gS2VlcCBpdCBwZXItbGV2ZWwgZm9yIG5vdy4KCkhvbmd5
YW4gWGlhICgyKToKICB4ODYvbW06IGZhY3RvciBvdXQgdGhlIGNvZGUgZm9yIHNoYXR0ZXJpbmcg
YW4gbDMgUFRFCiAgeDg2L21tOiBmYWN0b3Igb3V0IHRoZSBjb2RlIGZvciBzaGF0dGVyaW5nIGFu
IGwyIFBURQoKIHhlbi9hcmNoL3g4Ni9tbS5jIHwgMTY2ICsrKysrKysrKysrKysrKysrKysrKyst
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA3OCBpbnNlcnRpb25zKCsp
LCA4OCBkZWxldGlvbnMoLSkKCi0tIAoyLjE3LjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
