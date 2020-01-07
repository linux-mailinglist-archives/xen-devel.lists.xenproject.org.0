Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 69CD31325A9
	for <lists+xen-devel@lfdr.de>; Tue,  7 Jan 2020 13:08:57 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iondl-0004xM-7W; Tue, 07 Jan 2020 12:07:17 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=tB6F=24=amazon.com=prvs=2686fb3d9=hongyxia@srs-us1.protection.inumbo.net>)
 id 1iondj-0004wu-Kw
 for xen-devel@lists.xenproject.org; Tue, 07 Jan 2020 12:07:15 +0000
X-Inumbo-ID: 3c4feddd-3146-11ea-abea-12813bfff9fa
Received: from smtp-fw-2101.amazon.com (unknown [72.21.196.25])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3c4feddd-3146-11ea-abea-12813bfff9fa;
 Tue, 07 Jan 2020 12:07:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1578398832; x=1609934832;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=JmnKc1RvQ63Kc9IxskD8nxU0+SIuQ6WCnZXK7dk0U+4=;
 b=LIOQwXmkWc6j0c48DcMQTrOa7IcyXXwjumGgpirtI/QKfGfLrXelE3S6
 ojpm4kQRwBUMyXEiX+NZPdPfUavHHeBB2eEjOKxn7NIgMRUBdcbnugN6y
 LWKnvvgRL3SdaYNRMgoPahqJTUnlCKplG08eEFnvT4/nb9usLdJ0e8Sqb E=;
IronPort-SDR: Ti+YQF7GAmnfvLPAxX0xTwRSicrW+bHUO0/kmZnwrWdcErRcIAW24ecgf/8fGiRV7QK5685U3A
 3eikrGXEHI2Q==
X-IronPort-AV: E=Sophos;i="5.69,406,1571702400"; d="scan'208";a="11310538"
Received: from iad12-co-svc-p1-lb1-vlan2.amazon.com (HELO
 email-inbound-relay-1d-474bcd9f.us-east-1.amazon.com) ([10.43.8.2])
 by smtp-border-fw-out-2101.iad2.amazon.com with ESMTP;
 07 Jan 2020 12:07:12 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan2.iad.amazon.com [10.40.159.162])
 by email-inbound-relay-1d-474bcd9f.us-east-1.amazon.com (Postfix) with ESMTPS
 id 01962A1FD7; Tue,  7 Jan 2020 12:07:09 +0000 (UTC)
Received: from EX13D37EUB001.ant.amazon.com (10.43.166.31) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.243) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Tue, 7 Jan 2020 12:07:09 +0000
Received: from EX13MTAUWB001.ant.amazon.com (10.43.161.207) by
 EX13D37EUB001.ant.amazon.com (10.43.166.31) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Tue, 7 Jan 2020 12:07:07 +0000
Received: from u0b3720fa96e858.ant.amazon.com (10.125.106.133) by
 mail-relay.amazon.com (10.43.161.249) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Tue, 7 Jan 2020 12:07:05 +0000
From: Hongyan Xia <hongyxia@amazon.com>
To: <xen-devel@lists.xenproject.org>
Date: Tue, 7 Jan 2020 12:06:47 +0000
Message-ID: <512c9e69ab0699062ac972efc4551b3b872f336b.1578397252.git.hongyxia@amazon.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1578397252.git.hongyxia@amazon.com>
References: <cover.1578397252.git.hongyxia@amazon.com>
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [PATCH v5 5/7] x86/mm: map_pages_to_xen would better
 have one exit path
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Wei Liu <wei.liu2@citrix.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, jgrall@amazon.com,
 Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KCldlIHdpbGwgc29vbiByZXdyaXRl
IHRoZSBmdW5jdGlvbiB0byBoYW5kbGUgZHluYW1pY2FsbHkgbWFwcGluZyBhbmQKdW5tYXBwaW5n
IG9mIHBhZ2UgdGFibGVzLgoKTm8gZnVuY3Rpb25hbCBjaGFuZ2UuCgpTaWduZWQtb2ZmLWJ5OiBX
ZWkgTGl1IDx3ZWkubGl1MkBjaXRyaXguY29tPgpTaWduZWQtb2ZmLWJ5OiBIb25neWFuIFhpYSA8
aG9uZ3l4aWFAYW1hem9uLmNvbT4KCi0tLQpDaGFuZ2VkIHNpbmNlIHY0OgotIGRyb3AgdGhlIGVu
ZF9vZl9sb29wIGdvdG8gbGFiZWwgc2luY2UgdGhpcyBmdW5jdGlvbiBtYXkgYmUgcmVmYWN0b3Jl
ZAogIGluIHRoZSBmdXR1cmUgYW5kIHRoZXJlIGFyZSBvcHRpb25zIHRvIGRvIHRoaW5ncyB3aXRo
b3V0IHRoZSBnb3RvLgoKQ2hhbmdlZCBzaW5jZSB2MzoKLSByZW1vdmUgYXNzZXJ0cyBvbiByYyBz
aW5jZSByYyBuZXZlciBnZXRzIGNoYW5nZWQgdG8gYW55dGhpbmcgZWxzZS4KLSByZXdvcmQgY29t
bWl0IG1lc3NhZ2UuCi0tLQogeGVuL2FyY2gveDg2L21tLmMgfCAyMCArKysrKysrKysrKysrLS0t
LS0tLQogMSBmaWxlIGNoYW5nZWQsIDEzIGluc2VydGlvbnMoKyksIDcgZGVsZXRpb25zKC0pCgpk
aWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L21tLmMgYi94ZW4vYXJjaC94ODYvbW0uYwppbmRleCA3
MTYwZGRjYjY3Li43MWU5YzRiMTllIDEwMDY0NAotLS0gYS94ZW4vYXJjaC94ODYvbW0uYworKysg
Yi94ZW4vYXJjaC94ODYvbW0uYwpAQCAtNTE2NCw5ICs1MTY0LDExIEBAIGludCBtYXBfcGFnZXNf
dG9feGVuKAogICAgIHVuc2lnbmVkIGludCBmbGFncykKIHsKICAgICBib29sIGxvY2tpbmcgPSBz
eXN0ZW1fc3RhdGUgPiBTWVNfU1RBVEVfYm9vdDsKKyAgICBsM19wZ2VudHJ5X3QgKnBsM2UsIG9s
M2U7CiAgICAgbDJfcGdlbnRyeV90ICpwbDJlLCBvbDJlOwogICAgIGwxX3BnZW50cnlfdCAqcGwx
ZSwgb2wxZTsKICAgICB1bnNpZ25lZCBpbnQgIGk7CisgICAgaW50IHJjID0gLUVOT01FTTsKIAog
I2RlZmluZSBmbHVzaF9mbGFncyhvbGRmKSBkbyB7ICAgICAgICAgICAgICAgICBcCiAgICAgdW5z
aWduZWQgaW50IG9fID0gKG9sZGYpOyAgICAgICAgICAgICAgICAgIFwKQEAgLTUxODQsMTAgKzUx
ODYsMTEgQEAgaW50IG1hcF9wYWdlc190b194ZW4oCiAKICAgICB3aGlsZSAoIG5yX21mbnMgIT0g
MCApCiAgICAgewotICAgICAgICBsM19wZ2VudHJ5X3Qgb2wzZSwgKnBsM2UgPSB2aXJ0X3RvX3hl
bl9sM2UodmlydCk7CisgICAgICAgIHBsM2UgPSB2aXJ0X3RvX3hlbl9sM2UodmlydCk7CiAKICAg
ICAgICAgaWYgKCAhcGwzZSApCi0gICAgICAgICAgICByZXR1cm4gLUVOT01FTTsKKyAgICAgICAg
ICAgIGdvdG8gb3V0OworCiAgICAgICAgIG9sM2UgPSAqcGwzZTsKIAogICAgICAgICBpZiAoIGNw
dV9oYXNfcGFnZTFnYiAmJgpAQCAtNTI3Nyw3ICs1MjgwLDcgQEAgaW50IG1hcF9wYWdlc190b194
ZW4oCiAKICAgICAgICAgICAgIGwydCA9IGFsbG9jX3hlbl9wYWdldGFibGUoKTsKICAgICAgICAg
ICAgIGlmICggbDJ0ID09IE5VTEwgKQotICAgICAgICAgICAgICAgIHJldHVybiAtRU5PTUVNOwor
ICAgICAgICAgICAgICAgIGdvdG8gb3V0OwogCiAgICAgICAgICAgICBmb3IgKCBpID0gMDsgaSA8
IEwyX1BBR0VUQUJMRV9FTlRSSUVTOyBpKysgKQogICAgICAgICAgICAgICAgIGwyZV93cml0ZShs
MnQgKyBpLApAQCAtNTMwNiw3ICs1MzA5LDcgQEAgaW50IG1hcF9wYWdlc190b194ZW4oCiAKICAg
ICAgICAgcGwyZSA9IHZpcnRfdG9feGVuX2wyZSh2aXJ0KTsKICAgICAgICAgaWYgKCAhcGwyZSAp
Ci0gICAgICAgICAgICByZXR1cm4gLUVOT01FTTsKKyAgICAgICAgICAgIGdvdG8gb3V0OwogCiAg
ICAgICAgIGlmICggKCgoKHZpcnQgPj4gUEFHRV9TSElGVCkgfCBtZm5feChtZm4pKSAmCiAgICAg
ICAgICAgICAgICAoKDF1IDw8IFBBR0VUQUJMRV9PUkRFUikgLSAxKSkgPT0gMCkgJiYKQEAgLTUz
NTAsNyArNTM1Myw3IEBAIGludCBtYXBfcGFnZXNfdG9feGVuKAogICAgICAgICAgICAgewogICAg
ICAgICAgICAgICAgIHBsMWUgPSB2aXJ0X3RvX3hlbl9sMWUodmlydCk7CiAgICAgICAgICAgICAg
ICAgaWYgKCBwbDFlID09IE5VTEwgKQotICAgICAgICAgICAgICAgICAgICByZXR1cm4gLUVOT01F
TTsKKyAgICAgICAgICAgICAgICAgICAgZ290byBvdXQ7CiAgICAgICAgICAgICB9CiAgICAgICAg
ICAgICBlbHNlIGlmICggbDJlX2dldF9mbGFncygqcGwyZSkgJiBfUEFHRV9QU0UgKQogICAgICAg
ICAgICAgewpAQCAtNTM3OCw3ICs1MzgxLDcgQEAgaW50IG1hcF9wYWdlc190b194ZW4oCiAKICAg
ICAgICAgICAgICAgICBsMXQgPSBhbGxvY194ZW5fcGFnZXRhYmxlKCk7CiAgICAgICAgICAgICAg
ICAgaWYgKCBsMXQgPT0gTlVMTCApCi0gICAgICAgICAgICAgICAgICAgIHJldHVybiAtRU5PTUVN
OworICAgICAgICAgICAgICAgICAgICBnb3RvIG91dDsKIAogICAgICAgICAgICAgICAgIGZvciAo
IGkgPSAwOyBpIDwgTDFfUEFHRVRBQkxFX0VOVFJJRVM7IGkrKyApCiAgICAgICAgICAgICAgICAg
ICAgIGwxZV93cml0ZSgmbDF0W2ldLApAQCAtNTUyNCw3ICs1NTI3LDEwIEBAIGludCBtYXBfcGFn
ZXNfdG9feGVuKAogCiAjdW5kZWYgZmx1c2hfZmxhZ3MKIAotICAgIHJldHVybiAwOworICAgIHJj
ID0gMDsKKworIG91dDoKKyAgICByZXR1cm4gcmM7CiB9CiAKIGludCBwb3B1bGF0ZV9wdF9yYW5n
ZSh1bnNpZ25lZCBsb25nIHZpcnQsIHVuc2lnbmVkIGxvbmcgbnJfbWZucykKLS0gCjIuMTUuMy5B
TVpOCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
