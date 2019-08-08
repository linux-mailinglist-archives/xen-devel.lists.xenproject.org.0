Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C4F88620D
	for <lists+xen-devel@lfdr.de>; Thu,  8 Aug 2019 14:41:56 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hvhhY-0004kV-Oz; Thu, 08 Aug 2019 12:39:28 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=BHrm=WE=amazon.de=prvs=1160688d3=wipawel@srs-us1.protection.inumbo.net>)
 id 1hvhhX-0004kQ-LT
 for xen-devel@lists.xen.org; Thu, 08 Aug 2019 12:39:27 +0000
X-Inumbo-ID: 8e6797c7-b9d9-11e9-8980-bc764e045a96
Received: from smtp-fw-2101.amazon.com (unknown [72.21.196.25])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 8e6797c7-b9d9-11e9-8980-bc764e045a96;
 Thu, 08 Aug 2019 12:39:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
 t=1565267966; x=1596803966;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=q4CBq1aZozqts7dUtfbi+9ryD/lZ1Tp9epKUytSMlJg=;
 b=Jp802TIDjgKI68DKVIjr0JFC1Q3PYnccdblTiH/kj2s3d/+btDUX8F7K
 5dt4hZNVnCiIUb7JJKR+XvbrSv0uR0UpBk9PYW11uVNgI7WlKcMPqKQhA
 3aCtpuPLHFz6BOMV5Dedga+8iFkhrQjbMV9wvriq0oWx/z00RZhM43AJc 4=;
X-IronPort-AV: E=Sophos;i="5.64,361,1559520000"; d="scan'208";a="745772967"
Received: from iad6-co-svc-p1-lb1-vlan2.amazon.com (HELO
 email-inbound-relay-2c-397e131e.us-west-2.amazon.com) ([10.124.125.2])
 by smtp-border-fw-out-2101.iad2.amazon.com with ESMTP;
 08 Aug 2019 12:39:24 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan3.pdx.amazon.com [10.170.41.166])
 by email-inbound-relay-2c-397e131e.us-west-2.amazon.com (Postfix) with ESMTPS
 id 26157A0831; Thu,  8 Aug 2019 12:39:24 +0000 (UTC)
Received: from EX13D03EUA003.ant.amazon.com (10.43.165.89) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.82) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 8 Aug 2019 12:39:23 +0000
Received: from EX13MTAUWC001.ant.amazon.com (10.43.162.135) by
 EX13D03EUA003.ant.amazon.com (10.43.165.89) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 8 Aug 2019 12:39:22 +0000
Received: from dev-dsk-wipawel-1a-0c4e6d58.eu-west-1.amazon.com (10.4.134.33)
 by mail-relay.amazon.com (10.43.162.232) with Microsoft SMTP Server
 id 15.0.1367.3 via Frontend Transport; Thu, 8 Aug 2019 12:39:20 +0000
From: Pawel Wieczorkiewicz <wipawel@amazon.de>
To: <xen-devel@lists.xen.org>
Date: Thu, 8 Aug 2019 12:39:16 +0000
Message-ID: <20190808123916.8706-1-wipawel@amazon.de>
X-Mailer: git-send-email 2.16.5
In-Reply-To: <20190416120716.26269-6-wipawel@amazon.de>
References: <20190416120716.26269-6-wipawel@amazon.de>
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [livepatch-build-tools part2 v2 6/6]
 create-diff-object: Do not include all .rodata sections
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: mpohlack@amazon.de, ross.lagerwall@citrix.com,
 Pawel Wieczorkiewicz <wipawel@amazon.de>, konrad.wilk@oracle.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T2xkZXIgdmVyc2lvbnMgb2YgR0NDIGRpZCBub3Qgc3BsaXQgLnJvZGF0YS5zdHIgc2VjdGlvbnMg
YnkgZnVuY3Rpb24uCkJlY2F1c2Ugb2YgdGhhdCwgdGhlIGVudGlyZSBzZWN0aW9uIHdhcyBhbHdh
eXMgaW5jbHVkZWQuClRoZSBsaXZlcGF0Y2gtYnVpbGQtdG9vbHMgY29tbWl0IFsxXSBmaXhlZCBw
YXRjaCBjcmVhdGlvbiBhbmQga2VwdAppbmNsdWRpbmcgYWxsIC5yb2RhdGEuc3RyIHNlY3Rpb25z
LCBpbiBvcmRlciB0byBtYWludGFpbiBleGlzdGluZwpiZWhhdmlvciBmb3IgR0NDIDYuMSsuClRo
aXMgbWVhbnMgYWxsIC5yb2RhdGEuc3RyIHNlY3Rpb25zIGFyZSBhbHdheXMgaW5jbHVkZWQgYnkg
ZGVmYXVsdCwKcmVnYXJkbGVzcyBvZiB3aGV0aGVyIHRoZXkgYXJlIG5lZWRlZCBvciBub3QuCgpE
dXJpbmcgc3RhY2tlZCBob3RwYXRjaCBidWlsZHMgaXQgbGVhZHMgdG8gdW5uZWNlc3NhcnkgYWNj
dW11bGF0aW9uIG9mCnRoZSAucm9kYXRhLnN0ciBzZWN0aW9ucyBhcyBlYWNoIGFuZCBldmVyeSBj
b25zZWN1dGl2ZSBob3RwYXRjaCBtb2R1bGUKY29udGFpbnMgYWxsIHRoZSAucm9kYXRhLnN0ciBz
ZWN0aW9ucyBvZiBwcmV2aW91cyBtb2R1bGVzLgoKVG8gcHJldmVudCB0aGlzIHNpdHVhdGlvbiwg
bWFyayB0aGUgLnJvZGF0YS5zdHIgc2VjdGlvbnMgZm9yIGluY2x1c2lvbgpvbmx5IGlmIHRoZXkg
YXJlIHJlZmVyZW5jZWQgYnkgYW55IG9mIHRoZSBjdXJyZW50IGhvdHBhdGNoIHN5bWJvbHMgKG9y
CmEgY29ycmVzcG9uZGluZyBSRUxBIHNlY3Rpb24pLgoKRXh0ZW5kIHBhdGNoYWJpbGl0eSB2ZXJp
ZmljYXRpb24gdG8gZGV0ZWN0IGFsbCBub24tc3RhbmRhcmQsIG5vbi1yZWxhLApub24tZGVidWcg
YW5kIG5vbi1zcGVjaWFsIHNlY3Rpb25zIHRoYXQgYXJlIG5vdCByZWZlcmVuY2VkIGJ5IGFueSBv
Zgp0aGUgc3ltYm9scyBvciBSRUxBIHNlY3Rpb25zLgoKWzFdIDJhZjZmMWFhNjIzMyBGaXggcGF0
Y2ggY3JlYXRpb24gd2l0aCBHQ0MgNi4xKwoKU2lnbmVkLW9mZi1ieTogUGF3ZWwgV2llY3pvcmtp
ZXdpY3ogPHdpcGF3ZWxAYW1hem9uLmRlPgpSZXZpZXdlZC1ieTogQW5kcmEtSXJpbmEgUGFyYXNj
aGl2IDxhbmRyYXByc0BhbWF6b24uY29tPgpSZXZpZXdlZC1ieTogQmpvZXJuIERvZWJlbCA8ZG9l
YmVsQGFtYXpvbi5kZT4KUmV2aWV3ZWQtYnk6IE5vcmJlcnQgTWFudGhleSA8bm1hbnRoZXlAYW1h
em9uLmRlPgotLS0KdjI6CiogTWFkZSB0aGUgY29tbWl0IG1lc3NhZ2UgbW9yZSBwcmVjaXNlIGFu
ZCBhY2N1cmF0ZSAoYmFzZWQgb24KICBSb3NzJyBjb21tZW50cyB0byB0aGUgdjEgcGF0Y2gpCiog
S2VwdCBsaW5lcyBsaW1pdGVkIHRvIDgwIGNoYXJzCi0tLQogY3JlYXRlLWRpZmYtb2JqZWN0LmMg
fCAzMCArKysrKysrKysrKysrKysrKysrKysrKysrKysrLS0KIDEgZmlsZSBjaGFuZ2VkLCAyOCBp
bnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2NyZWF0ZS1kaWZmLW9i
amVjdC5jIGIvY3JlYXRlLWRpZmYtb2JqZWN0LmMKaW5kZXggODM2NWFmMC4uNDI1MjE3NSAxMDA2
NDQKLS0tIGEvY3JlYXRlLWRpZmYtb2JqZWN0LmMKKysrIGIvY3JlYXRlLWRpZmYtb2JqZWN0LmMK
QEAgLTEzNTAsOCArMTM1MCw3IEBAIHN0YXRpYyB2b2lkIGtwYXRjaF9pbmNsdWRlX3N0YW5kYXJk
X2VsZW1lbnRzKHN0cnVjdCBrcGF0Y2hfZWxmICprZWxmKQogCiAJbGlzdF9mb3JfZWFjaF9lbnRy
eShzZWMsICZrZWxmLT5zZWN0aW9ucywgbGlzdCkgewogCQkvKiBpbmNsdWRlIHRoZXNlIHNlY3Rp
b25zIGV2ZW4gaWYgdGhleSBoYXZlbid0IGNoYW5nZWQgKi8KLQkJaWYgKGlzX3N0YW5kYXJkX3Nl
Y3Rpb24oc2VjKSB8fAotCQkgICAgc2hvdWxkX2luY2x1ZGVfc3RyX3NlY3Rpb24oc2VjLT5uYW1l
KSkgeworCQlpZiAoaXNfc3RhbmRhcmRfc2VjdGlvbihzZWMpKSB7CiAJCQlzZWMtPmluY2x1ZGUg
PSAxOwogCQkJaWYgKHNlYy0+c2Vjc3ltKQogCQkJCXNlYy0+c2Vjc3ltLT5pbmNsdWRlID0gMTsK
QEAgLTEzNjIsNiArMTM2MSwyMCBAQCBzdGF0aWMgdm9pZCBrcGF0Y2hfaW5jbHVkZV9zdGFuZGFy
ZF9lbGVtZW50cyhzdHJ1Y3Qga3BhdGNoX2VsZiAqa2VsZikKIAlsaXN0X2VudHJ5KGtlbGYtPnN5
bWJvbHMubmV4dCwgc3RydWN0IHN5bWJvbCwgbGlzdCktPmluY2x1ZGUgPSAxOwogfQogCitzdGF0
aWMgdm9pZCBrcGF0Y2hfaW5jbHVkZV9zdGFuZGFyZF9zdHJpbmdfZWxlbWVudHMoc3RydWN0IGtw
YXRjaF9lbGYgKmtlbGYpCit7CisJc3RydWN0IHNlY3Rpb24gKnNlYzsKKworCWxpc3RfZm9yX2Vh
Y2hfZW50cnkoc2VjLCAma2VsZi0+c2VjdGlvbnMsIGxpc3QpIHsKKwkJaWYgKHNob3VsZF9pbmNs
dWRlX3N0cl9zZWN0aW9uKHNlYy0+bmFtZSkgJiYKKwkJICAgIGlzX3JlZmVyZW5jZWRfc2VjdGlv
bihzZWMsIGtlbGYpKSB7CisJCQlzZWMtPmluY2x1ZGUgPSAxOworCQkJaWYgKHNlYy0+c2Vjc3lt
KQorCQkJCXNlYy0+c2Vjc3ltLT5pbmNsdWRlID0gMTsKKwkJfQorCX0KK30KKwogI2RlZmluZSBp
bmNfcHJpbnRmKGZtdCwgLi4uKSBcCiAJbG9nX2RlYnVnKCIlKnMiIGZtdCwgcmVjdXJzZWxldmVs
LCAiIiwgIyNfX1ZBX0FSR1NfXyk7CiAKQEAgLTE1NDEsNiArMTU1NCwxNyBAQCBzdGF0aWMgdm9p
ZCBrcGF0Y2hfdmVyaWZ5X3BhdGNoYWJpbGl0eShzdHJ1Y3Qga3BhdGNoX2VsZiAqa2VsZikKIAkJ
CWVycnMrKzsKIAkJfQogCisJCWlmIChzZWMtPmluY2x1ZGUpIHsKKwkJCWlmICghaXNfc3RhbmRh
cmRfc2VjdGlvbihzZWMpICYmICFpc19yZWxhX3NlY3Rpb24oc2VjKSAmJgorCQkJICAgICFpc19k
ZWJ1Z19zZWN0aW9uKHNlYykgJiYgIWlzX3NwZWNpYWxfc2VjdGlvbihzZWMpKSB7CisJCQkJaWYg
KCFpc19yZWZlcmVuY2VkX3NlY3Rpb24oc2VjLCBrZWxmKSkgeworCQkJCQlsb2dfbm9ybWFsKCJz
ZWN0aW9uICVzIGluY2x1ZGVkLCBidXQgbm90IHJlZmVyZW5jZWRcbiIsCisJCQkJCQkgICBzZWMt
Pm5hbWUpOworCQkJCQllcnJzKys7CisJCQkJfQorCQkJfQorCQl9CisKIAkJLyoKIAkJICogZW5z
dXJlIHdlIGFyZW4ndCBpbmNsdWRpbmcgLmRhdGEuKiBvciAuYnNzLioKIAkJICogKC5kYXRhLnVu
bGlrZWx5IGlzIG9rIGIvYyBpdCBvbmx5IGhhcyBfX3dhcm5lZCB2YXJzKQpAQCAtMjA3Miw2ICsy
MDk2LDggQEAgaW50IG1haW4oaW50IGFyZ2MsIGNoYXIgKmFyZ3ZbXSkKIAlrcGF0Y2hfaW5jbHVk
ZV9kZWJ1Z19zZWN0aW9ucyhrZWxmX3BhdGNoZWQpOwogCWxvZ19kZWJ1ZygiSW5jbHVkZSBob29r
IGVsZW1lbnRzXG4iKTsKIAlrcGF0Y2hfaW5jbHVkZV9ob29rX2VsZW1lbnRzKGtlbGZfcGF0Y2hl
ZCk7CisJbG9nX2RlYnVnKCJJbmNsdWRlIHN0YW5kYXJkIHN0cmluZyBlbGVtZW50c1xuIik7CisJ
a3BhdGNoX2luY2x1ZGVfc3RhbmRhcmRfc3RyaW5nX2VsZW1lbnRzKGtlbGZfcGF0Y2hlZCk7CiAJ
bG9nX2RlYnVnKCJJbmNsdWRlIG5ldyBnbG9iYWxzXG4iKTsKIAluZXdfZ2xvYmFsc19leGlzdCA9
IGtwYXRjaF9pbmNsdWRlX25ld19nbG9iYWxzKGtlbGZfcGF0Y2hlZCk7CiAJbG9nX2RlYnVnKCJu
ZXdfZ2xvYmFsc19leGlzdCA9ICVkXG4iLCBuZXdfZ2xvYmFsc19leGlzdCk7Ci0tIAoyLjE2LjUK
CgoKCkFtYXpvbiBEZXZlbG9wbWVudCBDZW50ZXIgR2VybWFueSBHbWJICktyYXVzZW5zdHIuIDM4
CjEwMTE3IEJlcmxpbgpHZXNjaGFlZnRzZnVlaHJ1bmc6IENocmlzdGlhbiBTY2hsYWVnZXIsIFJh
bGYgSGVyYnJpY2gKRWluZ2V0cmFnZW4gYW0gQW10c2dlcmljaHQgQ2hhcmxvdHRlbmJ1cmcgdW50
ZXIgSFJCIDE0OTE3MyBCClNpdHo6IEJlcmxpbgpVc3QtSUQ6IERFIDI4OSAyMzcgODc5CgoKCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
