Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2933C13FAA7
	for <lists+xen-devel@lfdr.de>; Thu, 16 Jan 2020 21:33:12 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1isBn8-0000QC-IF; Thu, 16 Jan 2020 20:30:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Je7C=3F=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1isBn6-0000Q7-Lg
 for xen-devel@lists.xenproject.org; Thu, 16 Jan 2020 20:30:56 +0000
X-Inumbo-ID: 19299474-389f-11ea-ac27-bc764e2007e4
Received: from mail-qk1-x742.google.com (unknown [2607:f8b0:4864:20::742])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 19299474-389f-11ea-ac27-bc764e2007e4;
 Thu, 16 Jan 2020 20:30:56 +0000 (UTC)
Received: by mail-qk1-x742.google.com with SMTP id w127so20478147qkb.11
 for <xen-devel@lists.xenproject.org>; Thu, 16 Jan 2020 12:30:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yCqtrNWi/RM9EB7BrfRSR3dCdkeW7/TD3EjORCYLmHc=;
 b=KDOGuU7M6oOkZgvNLMQXlKxCe9RsBgpV1SjH1i9KOPQExkv9nPuxhLB59uAmxhw2YP
 Vkjjc+H5uzQ2Xyd551G831sCZmjb9HdC0o/SAetmI4kNj2qq5rb67aHPCCn4hdOvqUJr
 +qDxRNkgX6lXmeh8TfdPxQ8oe2b2O72EzJbHKNmAMlcuv6f6P8PUHkFzAYnE0fND6c/b
 otR+E3Ta+8gLNQ2PUvf2XlZFVdeX99BfAAbWGcsY4D+ZoJJfcev2nIxzI7zVpTFLeWhY
 72oDrATPsQsdgAEBopVbyTr2yFfs4ZydvC5cOi05K7z3orRjiw9PF+NEIefVyYlU4C+U
 sLHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yCqtrNWi/RM9EB7BrfRSR3dCdkeW7/TD3EjORCYLmHc=;
 b=QznuJSXoAdx+b//bxwsKsmVvDmMrQtRUrCoPZQ8aY1F0LbQpWg6nRl/Fgy46YIftOO
 OpNn/n+WJSDX9v6rBROltLtkDA69UCfgb8hRBJcbBdZlY3lTaTq9ZEZzquI763t5DcVD
 /AMACmLNTxnW3vuaRuNt6teK6XJt7goEp5n/naJmRSYiSvMFsyriJaKoNqXDu8qnoLlP
 AbMrMf89cNom6dbNQrL3csvoi3YfhB6wMmTUaq9g/0PxnLth/BQO0j6SeN7BkWRzw+Ot
 YvjdtBfqH1/3BKs4TqiGhw+s2/W09XoaMTWZSofWWbZaC7dj/Z+U+Wn/Cc3dthEl0CVD
 dhCQ==
X-Gm-Message-State: APjAAAUmyvRnFjN1McsUDCxcJABBQ4upUPlGSdMjJMpnNOT/tT8VtOXg
 R+277pPy0rRd+dFmwQi2p4UYP3MVoCo=
X-Google-Smtp-Source: APXvYqzFyxBI4hBF8yjuyK11NgiYPHsNH/QiFq33d99JYnKj+dMegB5UKQbm63JlXwCM5WlgWIugJA==
X-Received: by 2002:a37:a30a:: with SMTP id m10mr33470162qke.56.1579206655522; 
 Thu, 16 Jan 2020 12:30:55 -0800 (PST)
Received: from pm2-ws13.praxislan02.com ([2001:470:8:67e:3c49:73c1:aa01:b504])
 by smtp.gmail.com with ESMTPSA id
 s91sm11754808qtd.50.2020.01.16.12.30.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jan 2020 12:30:54 -0800 (PST)
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Date: Thu, 16 Jan 2020 15:29:26 -0500
Message-Id: <20200116202926.23230-1-jandryuk@gmail.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH] x86/shadow: use single (atomic) MOV for
 emulated writes
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
Cc: Wei Liu <wl@xen.org>, Jason Andryuk <jandryuk@gmail.com>,
 George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>,
 Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhpcyBpcyB0aGUgY29ycmVzcG9uZGluZyBjaGFuZ2UgdG8gdGhlIHNoYWRvdyBjb2RlIGFzIG1h
ZGUgYnkKYmYwOGE4YTA4YTJlICJ4ODYvSFZNOiB1c2Ugc2luZ2xlIChhdG9taWMpIE1PViBmb3Ig
YWxpZ25lZCBlbXVsYXRlZAp3cml0ZXMiIHRvIHRoZSBub24tc2hhZG93IEhWTSBjb2RlLgoKVGhl
IGJmMDhhOGEwOGEyZSBjb21taXQgbWVzc2FnZToKVXNpbmcgbWVtY3B5KCkgbWF5IHJlc3VsdCBp
biBtdWx0aXBsZSBpbmRpdmlkdWFsIGJ5dGUgYWNjZXNzZXMKKGRlcGVuZGluZyBob3cgbWVtY3B5
KCkgaXMgaW1wbGVtZW50ZWQgYW5kIGhvdyB0aGUgcmVzdWx0aW5nIGluc25zLAplLmcuIFJFUCBN
T1ZTQiwgZ2V0IGNhcnJpZWQgb3V0IGluIGhhcmR3YXJlKSwgd2hpY2ggaXNuJ3Qgd2hhdCB3ZQp3
YW50L25lZWQgZm9yIGNhcnJ5aW5nIG91dCBndWVzdCBpbnNucyBhcyBjb3JyZWN0bHkgYXMgcG9z
c2libGUuIEZhbGwKYmFjayB0byBtZW1jcHkoKSBvbmx5IGZvciBhY2Nlc3NlcyBub3QgMiwgNCwg
b3IgOCBieXRlcyBpbiBzaXplLgoKU2lnbmVkLW9mZi1ieTogSmFzb24gQW5kcnl1ayA8amFuZHJ5
dWtAZ21haWwuY29tPgotLS0KIHhlbi9hcmNoL3g4Ni9tbS9zaGFkb3cvaHZtLmMgfCAxMCArKysr
KysrKystCiAxIGZpbGUgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpk
aWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L21tL3NoYWRvdy9odm0uYyBiL3hlbi9hcmNoL3g4Ni9t
bS9zaGFkb3cvaHZtLmMKaW5kZXggNDhkZmFkNDU1Ny4uYTIxOTI2NmZhMiAxMDA2NDQKLS0tIGEv
eGVuL2FyY2gveDg2L21tL3NoYWRvdy9odm0uYworKysgYi94ZW4vYXJjaC94ODYvbW0vc2hhZG93
L2h2bS5jCkBAIC0yMTUsNyArMjE1LDE1IEBAIGh2bV9lbXVsYXRlX3dyaXRlKGVudW0geDg2X3Nl
Z21lbnQgc2VnLAogICAgICAgICByZXR1cm4gflBUUl9FUlIocHRyKTsKIAogICAgIHBhZ2luZ19s
b2NrKHYtPmRvbWFpbik7Ci0gICAgbWVtY3B5KHB0ciwgcF9kYXRhLCBieXRlcyk7CisKKyAgICAv
KiBXaGVyZSBwb3NzaWJsZSB1c2Ugc2luZ2xlIChhbmQgaGVuY2UgZ2VuZXJhbGx5IGF0b21pYykg
TU9WIGluc25zLiAqLworICAgIHN3aXRjaCAoIGJ5dGVzICkKKyAgICB7CisgICAgY2FzZSAyOiB3
cml0ZV91MTZfYXRvbWljKHB0ciwgKih1aW50MTZfdCAqKXBfZGF0YSk7IGJyZWFrOworICAgIGNh
c2UgNDogd3JpdGVfdTMyX2F0b21pYyhwdHIsICoodWludDMyX3QgKilwX2RhdGEpOyBicmVhazsK
KyAgICBjYXNlIDg6IHdyaXRlX3U2NF9hdG9taWMocHRyLCAqKHVpbnQ2NF90ICopcF9kYXRhKTsg
YnJlYWs7CisgICAgZGVmYXVsdDogbWVtY3B5KHB0ciwgcF9kYXRhLCBieXRlcyk7ICAgICAgICAg
ICAgICAgIGJyZWFrOworICAgIH0KIAogICAgIGlmICggdGJfaW5pdF9kb25lICkKICAgICAgICAg
di0+YXJjaC5wYWdpbmcubW9kZS0+c2hhZG93LnRyYWNlX2VtdWxfd3JpdGVfdmFsKHB0ciwgYWRk
ciwKLS0gCjIuMjQuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
