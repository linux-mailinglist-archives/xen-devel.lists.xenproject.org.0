Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 92AA81846FD
	for <lists+xen-devel@lfdr.de>; Fri, 13 Mar 2020 13:37:08 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jCjW6-0006VI-Fe; Fri, 13 Mar 2020 12:34:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=AUXq=46=amazon.de=prvs=334f24509=mheyne@srs-us1.protection.inumbo.net>)
 id 1jCjVN-0006SW-0P
 for xen-devel@lists.xenproject.org; Fri, 13 Mar 2020 12:33:33 +0000
X-Inumbo-ID: d3fe9c14-6526-11ea-92cf-bc764e2007e4
Received: from smtp-fw-9101.amazon.com (unknown [207.171.184.25])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d3fe9c14-6526-11ea-92cf-bc764e2007e4;
 Fri, 13 Mar 2020 12:33:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
 t=1584102804; x=1615638804;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=BChTlQBLR5Hi7t+3wQCEI1Do3gF52UgIeaC1oWVTedE=;
 b=oCHEmouf9k8ZQ2uZkEiWAdSHsLxik3kPwLKr79KeKl6hFR0SQ0SUjo4E
 +CTq4R6/LAtkgvZaGKlc5hajq0GYAN4awsT44A9swDFk8bO29Nbs0rtEJ
 94cGRjmfQ8L/mjSSM2FRDlvvEJFRxvyh++Q3sxJkx21xcieixEzAh04y4 8=;
IronPort-SDR: wRaDgsisarsoZYkLJvW8dTehwKbheRz/m1VJ3n2NI+miGACj9vclYxnhTHZIaZ7OS+cZgcliJ2
 KCnvfzQ1keug==
X-IronPort-AV: E=Sophos;i="5.70,548,1574121600"; d="scan'208";a="22665808"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-1d-2c665b5d.us-east-1.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-9101.sea19.amazon.com with ESMTP;
 13 Mar 2020 12:33:21 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan3.iad.amazon.com [10.40.159.166])
 by email-inbound-relay-1d-2c665b5d.us-east-1.amazon.com (Postfix) with ESMTPS
 id 3C6D0A2C41; Fri, 13 Mar 2020 12:33:19 +0000 (UTC)
Received: from EX13D08EUB001.ant.amazon.com (10.43.166.236) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1236.3; Fri, 13 Mar 2020 12:33:19 +0000
Received: from EX13MTAUWA001.ant.amazon.com (10.43.160.58) by
 EX13D08EUB001.ant.amazon.com (10.43.166.236) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Fri, 13 Mar 2020 12:33:18 +0000
Received: from dev-dsk-mheyne-60001.pdx1.corp.amazon.com (10.184.85.242) by
 mail-relay.amazon.com (10.43.160.118) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Fri, 13 Mar 2020 12:33:17 +0000
Received: by dev-dsk-mheyne-60001.pdx1.corp.amazon.com (Postfix,
 from userid 5466572)
 id 86A0421CA2; Fri, 13 Mar 2020 12:33:16 +0000 (UTC)
From: Maximilian Heyne <mheyne@amazon.de>
To: <xen-devel@lists.xenproject.org>
Date: Fri, 13 Mar 2020 12:33:15 +0000
Message-ID: <20200313123316.122003-3-mheyne@amazon.de>
X-Mailer: git-send-email 2.16.6
In-Reply-To: <20200313123316.122003-1-mheyne@amazon.de>
References: <20200313123316.122003-1-mheyne@amazon.de>
MIME-Version: 1.0
Precedence: Bulk
X-Mailman-Approved-At: Fri, 13 Mar 2020 12:34:17 +0000
Subject: [Xen-devel] [PATCH 2/3] Add exit notifiers.
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Ian Jackson <ian.jackson@citrix.com>, Paul Durrant <paul@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogR2VyZCBIb2ZmbWFubiA8a3JheGVsQHJlZGhhdC5jb20+CgpIb29rIHVwIGFueSBjbGVh
bnVwIHdvcmsgd2hpY2ggbmVlZHMgdG8gYmUgZG9uZSBoZXJlLiAgQWR2YW50YWdlcyBvdmVyCnVz
aW5nIGF0ZXhpdCgzKToKCiAgKDEpIFlvdSBnZXQgcGFzc2VkIGluIGEgcG9pbnRlciB0byB0aGUg
bm90aWZpZXIuICBJZiB5b3UgZW1iZWQgdGhhdAogICAgICBpbnRvIHlvdXIgc3RhdGUgc3RydWN0
IHlvdSBjYW4gdXNlIGNvbnRhaW5lcl9vZigpIHRvIGdldCBnZXQgeW91cgogICAgICBzdGF0ZSBp
bmZvLgogICgyKSBZb3UgY2FuIHVucmVnaXN0ZXIsIHNheSB3aGVuIHVuLXBsdWdnaW5nIGEgZGV2
aWNlLgoKWyB2MjogbW92ZSBjb2RlIG91dCBvZiAjaWZuZGVmIF9XSU4zMiBdCgpTaWduZWQtb2Zm
LWJ5OiBBbnRob255IExpZ3VvcmkgPGFsaWd1b3JpQHVzLmlibS5jb20+CihjaGVycnkgcGlja2Vk
IGZyb20gY29tbWl0IGZkNDJkZWViNGNiNDJmOTAwODQwNDZlM2ViZGI0MzgzOTUzMTk1ZTMpClNp
Z25lZC1vZmYtYnk6IE1heGltaWxpYW4gSGV5bmUgPG1oZXluZUBhbWF6b24uZGU+Ci0tLQogc3lz
ZW11LmggfCAgNSArKysrKwogdmwuYyAgICAgfCAyMCArKysrKysrKysrKysrKysrKysrKwogMiBm
aWxlcyBjaGFuZ2VkLCAyNSBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvc3lzZW11LmggYi9z
eXNlbXUuaAppbmRleCA5NjgyNThhODQuLjc1OWQwZTlkNSAxMDA2NDQKLS0tIGEvc3lzZW11LmgK
KysrIGIvc3lzZW11LmgKQEAgLTIsNiArMiw4IEBACiAjZGVmaW5lIFNZU0VNVV9ICiAvKiBNaXNj
LiB0aGluZ3MgcmVsYXRlZCB0byB0aGUgc3lzdGVtIGVtdWxhdG9yLiAgKi8KIAorI2luY2x1ZGUg
Im5vdGlmeS5oIgorCiAvKiB2bC5jICovCiBleHRlcm4gY29uc3QgY2hhciAqYmlvc19uYW1lOwog
ZXh0ZXJuIGNvbnN0IGNoYXIgKmJpb3NfZGlyOwpAQCAtMzksNiArNDEsOSBAQCB2b2lkIHFlbXVf
c3lzdGVtX3Bvd2VyZG93bih2b2lkKTsKICNlbmRpZgogdm9pZCBxZW11X3N5c3RlbV9yZXNldCh2
b2lkKTsKIAordm9pZCBxZW11X2FkZF9leGl0X25vdGlmaWVyKE5vdGlmaWVyICpub3RpZnkpOwor
dm9pZCBxZW11X3JlbW92ZV9leGl0X25vdGlmaWVyKE5vdGlmaWVyICpub3RpZnkpOworCiB2b2lk
IGRvX3NhdmV2bShjb25zdCBjaGFyICpuYW1lKTsKIHZvaWQgZG9fbG9hZHZtKGNvbnN0IGNoYXIg
Km5hbWUpOwogdm9pZCBkb19kZWx2bShjb25zdCBjaGFyICpuYW1lKTsKZGlmZiAtLWdpdCBhL3Zs
LmMgYi92bC5jCmluZGV4IGMzYzVkNjMwZS4uMjE2MzIxN2VjIDEwMDY0NAotLS0gYS92bC5jCisr
KyBiL3ZsLmMKQEAgLTI4Miw2ICsyODIsOSBAQCB1aW50OF90IHFlbXVfdXVpZFsxNl07CiAKICNp
bmNsdWRlICJ4ZW4tdmwtZXh0cmEuYyIKIAorc3RhdGljIE5vdGlmaWVyTGlzdCBleGl0X25vdGlm
aWVycyA9CisgICAgTk9USUZJRVJfTElTVF9JTklUSUFMSVpFUihleGl0X25vdGlmaWVycyk7CisK
IC8qKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKi8KIC8qIHg4NiBJU0EgYnVzIHN1cHBvcnQgKi8KIApAQCAtNDg0Myw2ICs0ODQ2LDIxIEBA
IHN0YXRpYyB2b2lkIHZjcHVfaGV4X3N0cl90b19iaXRtYXAoY29uc3QgY2hhciAqb3B0YXJnKQog
ICAgIH0KIH0KIAordm9pZCBxZW11X2FkZF9leGl0X25vdGlmaWVyKE5vdGlmaWVyICpub3RpZnkp
Cit7CisgICAgbm90aWZpZXJfbGlzdF9hZGQoJmV4aXRfbm90aWZpZXJzLCBub3RpZnkpOworfQor
Cit2b2lkIHFlbXVfcmVtb3ZlX2V4aXRfbm90aWZpZXIoTm90aWZpZXIgKm5vdGlmeSkKK3sKKyAg
ICBub3RpZmllcl9saXN0X3JlbW92ZShub3RpZnkpOworfQorCitzdGF0aWMgdm9pZCBxZW11X3J1
bl9leGl0X25vdGlmaWVycyh2b2lkKQoreworICAgIG5vdGlmaWVyX2xpc3Rfbm90aWZ5KCZleGl0
X25vdGlmaWVycyk7Cit9CisKIGludCBtYWluKGludCBhcmdjLCBjaGFyICoqYXJndiwgY2hhciAq
KmVudnApCiB7CiAjaWZkZWYgQ09ORklHX0dEQlNUVUIKQEAgLTQ4ODcsNiArNDkwNSw4IEBAIGlu
dCBtYWluKGludCBhcmdjLCBjaGFyICoqYXJndiwgY2hhciAqKmVudnApCiAgICAgY29uc3QgY2hh
ciAqY2hyb290X2RpciA9IE5VTEw7CiAgICAgY29uc3QgY2hhciAqcnVuX2FzID0gTlVMTDsKIAor
ICAgIGF0ZXhpdChxZW11X3J1bl9leGl0X25vdGlmaWVycyk7CisKICAgICBxZW11X2NhY2hlX3V0
aWxzX2luaXQoZW52cCk7CiAgICAgbG9nZmlsZSA9IHN0ZGVycjsgLyogaW5pdGlhbCB2YWx1ZSAq
LwogCi0tIAoyLjE2LjYKCgoKCkFtYXpvbiBEZXZlbG9wbWVudCBDZW50ZXIgR2VybWFueSBHbWJI
CktyYXVzZW5zdHIuIDM4CjEwMTE3IEJlcmxpbgpHZXNjaGFlZnRzZnVlaHJ1bmc6IENocmlzdGlh
biBTY2hsYWVnZXIsIEpvbmF0aGFuIFdlaXNzCkVpbmdldHJhZ2VuIGFtIEFtdHNnZXJpY2h0IENo
YXJsb3R0ZW5idXJnIHVudGVyIEhSQiAxNDkxNzMgQgpTaXR6OiBCZXJsaW4KVXN0LUlEOiBERSAy
ODkgMjM3IDg3OQoKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
