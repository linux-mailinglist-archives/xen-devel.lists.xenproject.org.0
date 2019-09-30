Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 02CAAC23DA
	for <lists+xen-devel@lfdr.de>; Mon, 30 Sep 2019 17:03:27 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iExAw-0006EM-9W; Mon, 30 Sep 2019 15:01:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=m4o0=XZ=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1iExAu-0006Da-A1
 for xen-devel@lists.xenproject.org; Mon, 30 Sep 2019 15:01:20 +0000
X-Inumbo-ID: 1972c15a-e393-11e9-bf31-bc764e2007e4
Received: from mail-wm1-x32b.google.com (unknown [2a00:1450:4864:20::32b])
 by localhost (Halon) with ESMTPS
 id 1972c15a-e393-11e9-bf31-bc764e2007e4;
 Mon, 30 Sep 2019 15:00:54 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id a6so13796336wma.5
 for <xen-devel@lists.xenproject.org>; Mon, 30 Sep 2019 08:00:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+NBwsgPo14hF2SBE5SphMAPpppnQLhW6kJgfDwP7ses=;
 b=W4jAwl1SnUJ1WI6MrUDQ/d2/6Jtxu//of+9egZ5uC+FLUPmXrxVhgMEPVfNFRWU04j
 neni1af4BcOs1ZMbw8OPImHmR0jEso5MS+aIbjCkB/xf1xztqi3QdOoBd+k4B/jmeI/u
 VWaNN1ug65fQC8ARtCDGamj+5o3S1YWGq1zbxVsNqQtSSa6IKYMOqC8JJi4ee3OpXMlW
 AYdjTL1I0CxRgvHc3vf5JVuSUAMGrCovjBUQzvUtfi0bpb+cra6ORa8lKXZIc4fT2YBs
 0nzf7OIkohWeRg+bz90lp9d9/Zi6zc4hWHc7qx/W7RQo6a6sPNW3Bv+xBmC7okNAcdqT
 5+1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=+NBwsgPo14hF2SBE5SphMAPpppnQLhW6kJgfDwP7ses=;
 b=EOKtV3WBJ30WqhfuHko4z7q71/HQLShOS37BWMrrGn7dbpYfJ018ZGqk7gIk76Pmm8
 8jfVSX/EkPFsDCvtSVuQ1BJ0AS+31KnrXLNkIs4kcPacySc0LJlUW4r7OVHu7OzBVwhp
 Si1T991eCerEq8+Wg/DVcrpKXkRtvahaQiAIIiknjTEOmO+G6qOdrxJXQkebjedN+9os
 LtREzZrscOWQCuenQzMNAgE3+5xBah4koDv4lqFOuGL8W0IMHoWCqf6Kg9BYeaEBkPJr
 cBbqE258xpHriGHKDHZnOBNfL50Q+Qt7yZma8b/BhzS10U0cv/wodlfpZEWZTzVqg/M5
 EzEA==
X-Gm-Message-State: APjAAAXLG8S1XgZ3DHUuyOAeoTX7SWhFf/XY5sPU5g8xN1r2jyxYMBEW
 jrPYvOGTxGgYGIYYAA8L/6QQt8RyTXw=
X-Google-Smtp-Source: APXvYqzQzmzlaqThHgVzqWeq6cGav5gQKngdTV2wVijSIvjWxCcXYrj5dA/5iV/c64qp47zlqudevA==
X-Received: by 2002:a1c:a516:: with SMTP id o22mr18764974wme.116.1569855653373; 
 Mon, 30 Sep 2019 08:00:53 -0700 (PDT)
Received: from debian.mshome.net (207.148.159.143.dyn.plus.net.
 [143.159.148.207])
 by smtp.gmail.com with ESMTPSA id f143sm32870852wme.40.2019.09.30.08.00.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Sep 2019 08:00:52 -0700 (PDT)
From: Wei Liu <wl@xen.org>
X-Google-Original-From: Wei Liu <liuwe@microsoft.com>
To: Xen Development List <xen-devel@lists.xenproject.org>
Date: Mon, 30 Sep 2019 16:00:40 +0100
Message-Id: <20190930150044.5734-7-liuwe@microsoft.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190930150044.5734-1-liuwe@microsoft.com>
References: <20190930150044.5734-1-liuwe@microsoft.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH for-next v2 6/9] x86: rename hypervisor_{alloc,
 free}_unused_page
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
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Michael Kelley <mikelley@microsoft.com>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhleSBhcmUgdXNlZCBpbiBYZW4gY29kZSBvbmx5LgoKTm8gZnVuY3Rpb25hbCBjaGFuZ2UuCgpT
aWduZWQtb2ZmLWJ5OiBXZWkgTGl1IDxsaXV3ZUBtaWNyb3NvZnQuY29tPgotLS0KIHhlbi9hcmNo
L3g4Ni9ndWVzdC94ZW4veGVuLmMgICAgfCA2ICsrKy0tLQogeGVuL2FyY2gveDg2L3B2L3NoaW0u
YyAgICAgICAgICB8IDQgKystLQogeGVuL2luY2x1ZGUvYXNtLXg4Ni9ndWVzdC94ZW4uaCB8IDQg
KystLQogMyBmaWxlcyBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDcgZGVsZXRpb25zKC0pCgpk
aWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L2d1ZXN0L3hlbi94ZW4uYyBiL3hlbi9hcmNoL3g4Ni9n
dWVzdC94ZW4veGVuLmMKaW5kZXggNzhmYzYwMzk5Ni4uOTg5NTAyNWQwMiAxMDA2NDQKLS0tIGEv
eGVuL2FyY2gveDg2L2d1ZXN0L3hlbi94ZW4uYworKysgYi94ZW4vYXJjaC94ODYvZ3Vlc3QveGVu
L3hlbi5jCkBAIC05Nyw3ICs5Nyw3IEBAIHN0YXRpYyB2b2lkIG1hcF9zaGFyZWRfaW5mbyh2b2lk
KQogICAgIHVuc2lnbmVkIGludCBpOwogICAgIHVuc2lnbmVkIGxvbmcgcmM7CiAKLSAgICBpZiAo
IGh5cGVydmlzb3JfYWxsb2NfdW51c2VkX3BhZ2UoJm1mbikgKQorICAgIGlmICggeGVuX2FsbG9j
X3VudXNlZF9wYWdlKCZtZm4pICkKICAgICAgICAgcGFuaWMoInVuYWJsZSB0byByZXNlcnZlIHNo
YXJlZCBpbmZvIG1lbW9yeSBwYWdlXG4iKTsKIAogICAgIHhhdHAuZ3BmbiA9IG1mbl94KG1mbik7
CkBAIC0yODQsNyArMjg0LDcgQEAgdm9pZCBoeXBlcnZpc29yX2FwX3NldHVwKHZvaWQpCiAgICAg
aW5pdF9ldnRjaG4oKTsKIH0KIAotaW50IGh5cGVydmlzb3JfYWxsb2NfdW51c2VkX3BhZ2UobWZu
X3QgKm1mbikKK2ludCB4ZW5fYWxsb2NfdW51c2VkX3BhZ2UobWZuX3QgKm1mbikKIHsKICAgICB1
bnNpZ25lZCBsb25nIG07CiAgICAgaW50IHJjOwpAQCAtMjk2LDcgKzI5Niw3IEBAIGludCBoeXBl
cnZpc29yX2FsbG9jX3VudXNlZF9wYWdlKG1mbl90ICptZm4pCiAgICAgcmV0dXJuIHJjOwogfQog
Ci1pbnQgaHlwZXJ2aXNvcl9mcmVlX3VudXNlZF9wYWdlKG1mbl90IG1mbikKK2ludCB4ZW5fZnJl
ZV91bnVzZWRfcGFnZShtZm5fdCBtZm4pCiB7CiAgICAgcmV0dXJuIHJhbmdlc2V0X3JlbW92ZV9y
YW5nZShtZW0sIG1mbl94KG1mbiksIG1mbl94KG1mbikpOwogfQpkaWZmIC0tZ2l0IGEveGVuL2Fy
Y2gveDg2L3B2L3NoaW0uYyBiL3hlbi9hcmNoL3g4Ni9wdi9zaGltLmMKaW5kZXggNTQ0MWU4OWRl
Mi4uNDFiNDY2NTY0OSAxMDA2NDQKLS0tIGEveGVuL2FyY2gveDg2L3B2L3NoaW0uYworKysgYi94
ZW4vYXJjaC94ODYvcHYvc2hpbS5jCkBAIC03MzksNyArNzM5LDcgQEAgc3RhdGljIGxvbmcgcHZf
c2hpbV9ncmFudF90YWJsZV9vcCh1bnNpZ25lZCBpbnQgY21kLAogICAgICAgICAgICAgICAgIH07
CiAgICAgICAgICAgICAgICAgbWZuX3QgbWZuOwogCi0gICAgICAgICAgICAgICAgcmMgPSBoeXBl
cnZpc29yX2FsbG9jX3VudXNlZF9wYWdlKCZtZm4pOworICAgICAgICAgICAgICAgIHJjID0geGVu
X2FsbG9jX3VudXNlZF9wYWdlKCZtZm4pOwogICAgICAgICAgICAgICAgIGlmICggcmMgKQogICAg
ICAgICAgICAgICAgIHsKICAgICAgICAgICAgICAgICAgICAgZ3ByaW50ayhYRU5MT0dfRVJSLApA
QCAtNzUxLDcgKzc1MSw3IEBAIHN0YXRpYyBsb25nIHB2X3NoaW1fZ3JhbnRfdGFibGVfb3AodW5z
aWduZWQgaW50IGNtZCwKICAgICAgICAgICAgICAgICByYyA9IHhlbl9oeXBlcmNhbGxfbWVtb3J5
X29wKFhFTk1FTV9hZGRfdG9fcGh5c21hcCwgJnhhdHApOwogICAgICAgICAgICAgICAgIGlmICgg
cmMgKQogICAgICAgICAgICAgICAgIHsKLSAgICAgICAgICAgICAgICAgICAgaHlwZXJ2aXNvcl9m
cmVlX3VudXNlZF9wYWdlKG1mbik7CisgICAgICAgICAgICAgICAgICAgIHhlbl9mcmVlX3VudXNl
ZF9wYWdlKG1mbik7CiAgICAgICAgICAgICAgICAgICAgIGJyZWFrOwogICAgICAgICAgICAgICAg
IH0KIApkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUvYXNtLXg4Ni9ndWVzdC94ZW4uaCBiL3hlbi9p
bmNsdWRlL2FzbS14ODYvZ3Vlc3QveGVuLmgKaW5kZXggMzE0NWY3NTM2MS4uODIyMWZjMTMyNSAx
MDA2NDQKLS0tIGEveGVuL2luY2x1ZGUvYXNtLXg4Ni9ndWVzdC94ZW4uaAorKysgYi94ZW4vaW5j
bHVkZS9hc20teDg2L2d1ZXN0L3hlbi5oCkBAIC0zMyw4ICszMyw4IEBAIGV4dGVybiBib29sIHB2
X2NvbnNvbGU7CiBleHRlcm4gdWludDMyX3QgeGVuX2NwdWlkX2Jhc2U7CiAKIHZvaWQgcHJvYmVf
aHlwZXJ2aXNvcih2b2lkKTsKLWludCBoeXBlcnZpc29yX2FsbG9jX3VudXNlZF9wYWdlKG1mbl90
ICptZm4pOwotaW50IGh5cGVydmlzb3JfZnJlZV91bnVzZWRfcGFnZShtZm5fdCBtZm4pOworaW50
IHhlbl9hbGxvY191bnVzZWRfcGFnZShtZm5fdCAqbWZuKTsKK2ludCB4ZW5fZnJlZV91bnVzZWRf
cGFnZShtZm5fdCBtZm4pOwogCiBERUNMQVJFX1BFUl9DUFUodW5zaWduZWQgaW50LCB2Y3B1X2lk
KTsKIERFQ0xBUkVfUEVSX0NQVShzdHJ1Y3QgdmNwdV9pbmZvICosIHZjcHVfaW5mbyk7Ci0tIAoy
LjIwLjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
