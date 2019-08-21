Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B372B974D3
	for <lists+xen-devel@lfdr.de>; Wed, 21 Aug 2019 10:24:09 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i0Lsw-0002s2-Rl; Wed, 21 Aug 2019 08:22:26 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=BiIg=WR=amazon.de=prvs=129f3311c=wipawel@srs-us1.protection.inumbo.net>)
 id 1i0Lsv-0002py-A2
 for xen-devel@lists.xen.org; Wed, 21 Aug 2019 08:22:25 +0000
X-Inumbo-ID: c0915f12-c3ec-11e9-adc2-12813bfff9fa
Received: from smtp-fw-33001.amazon.com (unknown [207.171.190.10])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c0915f12-c3ec-11e9-adc2-12813bfff9fa;
 Wed, 21 Aug 2019 08:22:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
 t=1566375722; x=1597911722;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=HMLHaYGnYdsl4+f8w+M2LsBhl1+9LxdtIOk2BKjFp5w=;
 b=qF5pPE0XLtJnNAn8l+gY8GZFlW9g4DrytH68XxonENQAJoPvW+ibVopZ
 U9nmAlp9+wQ7iSGIxHXPxm/FonUl5KXmhjfIrtzHj0zLEzX7WoPC5ffWi
 SOpfV3YOVbwtWPRv3tlpl6pXvRsrqSqiHYVGm8kIIvFGEMPMGCgWV2uf9 o=;
X-IronPort-AV: E=Sophos;i="5.64,412,1559520000"; d="scan'208";a="822132978"
Received: from sea3-co-svc-lb6-vlan2.sea.amazon.com (HELO
 email-inbound-relay-2a-69849ee2.us-west-2.amazon.com) ([10.47.22.34])
 by smtp-border-fw-out-33001.sea14.amazon.com with ESMTP;
 21 Aug 2019 08:22:02 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
 by email-inbound-relay-2a-69849ee2.us-west-2.amazon.com (Postfix) with ESMTPS
 id 9E67BA263B; Wed, 21 Aug 2019 08:22:01 +0000 (UTC)
Received: from EX13D05EUC002.ant.amazon.com (10.43.164.231) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.82) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 21 Aug 2019 08:21:40 +0000
Received: from EX13MTAUEB001.ant.amazon.com (10.43.60.96) by
 EX13D05EUC002.ant.amazon.com (10.43.164.231) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 21 Aug 2019 08:21:39 +0000
Received: from dev-dsk-wipawel-1a-0c4e6d58.eu-west-1.amazon.com (10.4.134.33)
 by mail-relay.amazon.com (10.43.60.129) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Wed, 21 Aug 2019 08:21:37 +0000
From: Pawel Wieczorkiewicz <wipawel@amazon.de>
To: <xen-devel@lists.xen.org>
Date: Wed, 21 Aug 2019 08:20:55 +0000
Message-ID: <20190821082056.91090-20-wipawel@amazon.de>
X-Mailer: git-send-email 2.16.5
In-Reply-To: <20190821082056.91090-1-wipawel@amazon.de>
References: <20190821082056.91090-1-wipawel@amazon.de>
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [PATCH 19/20] livepatch-build: Strip transient or
 unneeded symbols
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: wipawel@amazon.com, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>, mpohlack@amazon.com,
 Pawel Wieczorkiewicz <wipawel@amazon.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SW4gdGhlIHByb2Nlc3Mgb2YgY3JlYXRpbmcgYSBmaW5hbCBob3RwYXRjaCBtb2R1bGUgZmlsZSBt
YWtlIHN1cmUgdG8Kc3RyaXAgYWxsIHRyYW5zaWVudCBzeW1ib2xzIHRoYXQgaGF2ZSBub3QgYmVl
biBjYXVnaHQgYW5kIHJlbW92ZWQgYnkKY3JlYXRlLWRpZmYtb2JqZWN0IHByb2Nlc3NpbmcuIEZv
ciBub3cgdGhlc2UgYXJlIG9ubHkgdGhlIGhvb2tzCmtwYXRjaCBsb2FkL3VubG9hZCBzeW1ib2xz
LgoKRm9yIGFsbCBuZXcgb2JqZWN0IGZpbGVzIHRoYXQgYXJlIGNhcnJpZWQgYWxvbmcgZm9yIHRo
ZSBmaW5hbCBsaW5raW5nCnRoZSB0cmFuc2llbnQgaG9va3Mgc3ltYm9scyBhcmUgbm90IHN0cmlw
cGVkIGFuZCBuZWl0aGVyIGFyZSBhbnkKdW5uZWVkZWQgc3ltYm9scy4gU3RyaXAgdGhlbSBleHBs
aWNpdGx5IGZyb20gcmVzdWx0aW5nIG9iamVjdCBmaWxlLgoKU2lnbmVkLW9mZi1ieTogUGF3ZWwg
V2llY3pvcmtpZXdpY3ogPHdpcGF3ZWxAYW1hem9uLmRlPgotLS0KIGxpdmVwYXRjaC1idWlsZCB8
IDI1ICsrKysrKysrKysrKysrKysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCAyNSBpbnNlcnRp
b25zKCspCgpkaWZmIC0tZ2l0IGEvbGl2ZXBhdGNoLWJ1aWxkIGIvbGl2ZXBhdGNoLWJ1aWxkCmlu
ZGV4IDNmMDUzMGUuLmNjNzE2NDAgMTAwNzU1Ci0tLSBhL2xpdmVwYXRjaC1idWlsZAorKysgYi9s
aXZlcGF0Y2gtYnVpbGQKQEAgLTExMSw2ICsxMTEsMjggQEAgZnVuY3Rpb24gYnVpbGRfc3BlY2lh
bCgpCiAgICAgdW5zZXQgTElWRVBBVENIX0NBUFRVUkVfRElSCiB9CiAKK3N0cmlwX2V4dHJhX3N5
bWJvbHMgKCkKK3sKKyAgICBsb2NhbCAtciBGSUxFPSIkMSIKKyAgICBsb2NhbCAtYSBTVFJJUF9D
TURfT1BUUz0oKQorICAgIGxvY2FsIC1hIFNZTV9QUkVGSVg9KCJsaXZlcGF0Y2hfbG9hZF9kYXRh
XyIKKyAgICAgICAgICAgICAgICAgICAgICAgICAibGl2ZXBhdGNoX3VubG9hZF9kYXRhXyIKKyAg
ICAgICAgICAgICAgICAgICAgICAgICAibGl2ZXBhdGNoX3ByZWFwcGx5X2RhdGFfIgorICAgICAg
ICAgICAgICAgICAgICAgICAgICJsaXZlcGF0Y2hfYXBwbHlfZGF0YV8iCisgICAgICAgICAgICAg
ICAgICAgICAgICAgImxpdmVwYXRjaF9wb3N0YXBwbHlfZGF0YV8iCisgICAgICAgICAgICAgICAg
ICAgICAgICAgImxpdmVwYXRjaF9wcmVyZXZlcnRfZGF0YV8iCisgICAgICAgICAgICAgICAgICAg
ICAgICAgImxpdmVwYXRjaF9yZXZlcnRfZGF0YV8iCisgICAgICAgICAgICAgICAgICAgICAgICAg
ImxpdmVwYXRjaF9wb3N0cmV2ZXJ0X2RhdGFfIikKKworICAgIFNUUklQX0NNRF9PUFRTKz0oIi13
IikKKyAgICBmb3Igc3ltIGluICIke1NZTV9QUkVGSVhbQF19IjsgZG8KKyAgICAgICAgU1RSSVBf
Q01EX09QVFMrPSgiLU4iKQorICAgICAgICBTVFJJUF9DTURfT1BUUys9KCJcIiR7c3ltfSpcIiIp
CisgICAgZG9uZQorCisgICAgc3RyaXAgIiR7U1RSSVBfQ01EX09QVFNbQF19IiAiJEZJTEUiCit9
CisKIGZ1bmN0aW9uIGNyZWF0ZV9wYXRjaCgpCiB7CiAgICAgZWNobyAiRXh0cmFjdGluZyBuZXcg
YW5kIG1vZGlmaWVkIEVMRiBzZWN0aW9ucy4uLiIKQEAgLTE1MCw2ICsxNzIsNyBAQCBmdW5jdGlv
biBjcmVhdGVfcGF0Y2goKQogICAgIE5FV19GSUxFUz0kKGNvbW0gLTIzIDwoY2QgcGF0Y2hlZC94
ZW4gJiYgZmluZCAuIC10eXBlIGYgLW5hbWUgJyoubycgfCBzb3J0KSA8KGNkIG9yaWdpbmFsL3hl
biAmJiBmaW5kIC4gLXR5cGUgZiAtbmFtZSAnKi5vJyB8IHNvcnQpKQogICAgIGZvciBpIGluICRO
RVdfRklMRVM7IGRvCiAgICAgICAgIGNwICJwYXRjaGVkLyRpIiAib3V0cHV0LyRpIgorICAgICAg
ICBzdHJpcCAtLXN0cmlwLXVubmVlZGVkICJvdXRwdXQvJGkiCiAgICAgICAgIENIQU5HRUQ9MQog
ICAgIGRvbmUKIApAQCAtMTc2LDYgKzE5OSw4IEBAIGZ1bmN0aW9uIGNyZWF0ZV9wYXRjaCgpCiAg
ICAgICAgICIke1RPT0xTRElSfSIvcHJlbGluayAkZGVidWdvcHQgb3V0cHV0Lm8gIiR7UEFUQ0hO
QU1FfS5saXZlcGF0Y2giICIkWEVOU1lNUyIgJj4+ICIke09VVFBVVH0vcHJlbGluay5sb2ciIHx8
IGRpZQogICAgIGZpCiAKKyAgICBzdHJpcF9leHRyYV9zeW1ib2xzICIke1BBVENITkFNRX0ubGl2
ZXBhdGNoIgorCiAgICAgb2JqY29weSAtLWFkZC1zZWN0aW9uIC5saXZlcGF0Y2guZGVwZW5kcz1k
ZXBlbmRzLmJpbiAiJHtQQVRDSE5BTUV9LmxpdmVwYXRjaCIKICAgICBvYmpjb3B5IC0tc2V0LXNl
Y3Rpb24tZmxhZ3MgLmxpdmVwYXRjaC5kZXBlbmRzPWFsbG9jLHJlYWRvbmx5ICIke1BBVENITkFN
RX0ubGl2ZXBhdGNoIgogCi0tIAoyLjE2LjUKCgoKCkFtYXpvbiBEZXZlbG9wbWVudCBDZW50ZXIg
R2VybWFueSBHbWJICktyYXVzZW5zdHIuIDM4CjEwMTE3IEJlcmxpbgpHZXNjaGFlZnRzZnVlaHJ1
bmc6IENocmlzdGlhbiBTY2hsYWVnZXIsIFJhbGYgSGVyYnJpY2gKRWluZ2V0cmFnZW4gYW0gQW10
c2dlcmljaHQgQ2hhcmxvdHRlbmJ1cmcgdW50ZXIgSFJCIDE0OTE3MyBCClNpdHo6IEJlcmxpbgpV
c3QtSUQ6IERFIDI4OSAyMzcgODc5CgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
