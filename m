Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 62CB215D786
	for <lists+xen-devel@lfdr.de>; Fri, 14 Feb 2020 13:37:40 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j2aB7-0007Vh-1w; Fri, 14 Feb 2020 12:34:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8SxQ=4C=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1j2aB5-0007VU-Ja
 for xen-devel@lists.xenproject.org; Fri, 14 Feb 2020 12:34:39 +0000
X-Inumbo-ID: 5b2fd39a-4f26-11ea-b0fd-bc764e2007e4
Received: from mail-wm1-x344.google.com (unknown [2a00:1450:4864:20::344])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5b2fd39a-4f26-11ea-b0fd-bc764e2007e4;
 Fri, 14 Feb 2020 12:34:35 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id c84so10443020wme.4
 for <xen-devel@lists.xenproject.org>; Fri, 14 Feb 2020 04:34:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=phpR0ZvQOEGbnT+alhKVok5A9vEUunaI9i4J/hHQqps=;
 b=uaWDtoyYkHMQmrE+40q6TB/Zc+2ovGs/ErsWMT8xc66U43fIpdGVnaHV12lVAB/AyI
 SttMfUKwU0u25XFXuAursng6KkHxxLrm06nPiYE5xnboJejWcVYg9CzvF1EgdVFGHulV
 /4rS3qYKNbmcWSz4BDASVqnA4fmHigT7W8myPePr5qD6ZSZHAZFyHmrzBesCwnOczLNq
 GiiFhKkNVm1qdDZmspH0nGAXJpNAPjiGSvFkM6ITYGBoGHuZViX+5shmWCGrrXGKmX48
 8X7FXqlT914VgaFublUyg8oe0QNHSv9dzS9V6MTBcbj+CFSRUrbvWqZbBMCWxH6rC1Qn
 Jkog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=phpR0ZvQOEGbnT+alhKVok5A9vEUunaI9i4J/hHQqps=;
 b=RWzFCe4q7Jjr0IC38NdprbRPmB/jPZmLI6OPpyd1Q4zLiTFzoDOTfp66ZoCQf7QILw
 BI95Y63N9iBpYrYotk3DjJc/uiWvMPrtzfzLhg0w6+leZ4Q4eC1uAUkdAKdphkyPWGSm
 8NcbeTk5DfWBiUV4DTaGQAZvM/2MI8bcV+YUqsa9DJyWFjNAFF3yOFQJlSIDRwA4bED5
 P7BMdKhgaen7jC/wJBzpIrFTQsLuw4ZNGvXnrtf6MpP3nTpZgMQcM33g9rUrysA2yRRF
 7D/njqLnMufBsIdMzD9WJJ+nvWFggjhN1sm4VoEOb2ytef2UhOzaS/AFmbQhUykF4gvy
 Fy1g==
X-Gm-Message-State: APjAAAWQniGItlqrrpDIUfhwPuPgie5G+UNvEGg803ilAgCr9xumsdqx
 EY2jfNb9eQrycf0bC93S/aA/jVVsO18=
X-Google-Smtp-Source: APXvYqzTJtWj20KjrqYL7aRAzl9Xp1U2lRHUq6feh9bwyjUHPJRjpb2ACONmnohmNKpx+fLsPChaaw==
X-Received: by 2002:a1c:b603:: with SMTP id g3mr4734968wmf.133.1581683673969; 
 Fri, 14 Feb 2020 04:34:33 -0800 (PST)
Received: from localhost.localdomain (41.142.6.51.dyn.plus.net. [51.6.142.41])
 by smtp.gmail.com with ESMTPSA id
 x11sm7035566wmg.46.2020.02.14.04.34.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Feb 2020 04:34:33 -0800 (PST)
From: Wei Liu <wl@xen.org>
X-Google-Original-From: Wei Liu <liuwe@microsoft.com>
To: Xen Development List <xen-devel@lists.xenproject.org>
Date: Fri, 14 Feb 2020 12:34:28 +0000
Message-Id: <20200214123430.4942-2-liuwe@microsoft.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200214123430.4942-1-liuwe@microsoft.com>
References: <20200214123430.4942-1-liuwe@microsoft.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v2 1/3] x86/hypervisor: pass flags to
 hypervisor_flush_tlb
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
 Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <pdurrant@amazon.com>,
 Michael Kelley <mikelley@microsoft.com>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SHlwZXItVidzIEwwIGFzc2lzdGVkIGZsdXNoIGhhcyBmaW5lLWdyYWluZWQgY29udHJvbCBvdmVy
IHdoYXQgZ2V0cwpmbHVzaGVkLiBXZSBuZWVkIGFsbCB0aGUgZmxhZ3MgYXZhaWxhYmxlIHRvIG1h
a2UgdGhlIGJlc3QgZGVjaXNpb25zCnBvc3NpYmxlLgoKTm8gZnVuY3Rpb25hbCBjaGFuZ2UgYmVj
YXVzZSBYZW4ncyBpbXBsZW1lbnRhdGlvbiBkb2Vzbid0IGNhcmUgYWJvdXQKd2hhdCBpcyBwYXNz
ZWQgdG8gaXQuCgpTaWduZWQtb2ZmLWJ5OiBXZWkgTGl1IDxsaXV3ZUBtaWNyb3NvZnQuY29tPgot
LS0KdjI6CjEuIEludHJvZHVjZSBGTFVTSF9UTEJfRkxBR1NfTUFTSwotLS0KIHhlbi9hcmNoL3g4
Ni9ndWVzdC9oeXBlcnZpc29yLmMgICAgICAgIHwgIDcgKysrKystLQogeGVuL2FyY2gveDg2L2d1
ZXN0L3hlbi94ZW4uYyAgICAgICAgICAgfCAgMiArLQogeGVuL2FyY2gveDg2L3NtcC5jICAgICAg
ICAgICAgICAgICAgICAgfCAgNSArKy0tLQogeGVuL2luY2x1ZGUvYXNtLXg4Ni9mbHVzaHRsYi5o
ICAgICAgICAgfCAgMyArKysKIHhlbi9pbmNsdWRlL2FzbS14ODYvZ3Vlc3QvaHlwZXJ2aXNvci5o
IHwgMTAgKysrKystLS0tLQogNSBmaWxlcyBjaGFuZ2VkLCAxNiBpbnNlcnRpb25zKCspLCAxMSBk
ZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvZ3Vlc3QvaHlwZXJ2aXNvci5j
IGIveGVuL2FyY2gveDg2L2d1ZXN0L2h5cGVydmlzb3IuYwppbmRleCA0N2U5MzhlMjg3Li42ZWUy
OGM5ZGYxIDEwMDY0NAotLS0gYS94ZW4vYXJjaC94ODYvZ3Vlc3QvaHlwZXJ2aXNvci5jCisrKyBi
L3hlbi9hcmNoL3g4Ni9ndWVzdC9oeXBlcnZpc29yLmMKQEAgLTc1LDEwICs3NSwxMyBAQCB2b2lk
IF9faW5pdCBoeXBlcnZpc29yX2U4MjBfZml4dXAoc3RydWN0IGU4MjBtYXAgKmU4MjApCiB9CiAK
IGludCBoeXBlcnZpc29yX2ZsdXNoX3RsYihjb25zdCBjcHVtYXNrX3QgKm1hc2ssIGNvbnN0IHZv
aWQgKnZhLAotICAgICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGludCBvcmRlcikKKyAg
ICAgICAgICAgICAgICAgICAgICAgICB1bnNpZ25lZCBpbnQgZmxhZ3MpCiB7CisgICAgaWYgKCBm
bGFncyAmIH5GTFVTSF9UTEJfRkxBR1NfTUFTSyApCisgICAgICAgIHJldHVybiAtRUlOVkFMOwor
CiAgICAgaWYgKCBvcHMuZmx1c2hfdGxiICkKLSAgICAgICAgcmV0dXJuIGFsdGVybmF0aXZlX2Nh
bGwob3BzLmZsdXNoX3RsYiwgbWFzaywgdmEsIG9yZGVyKTsKKyAgICAgICAgcmV0dXJuIGFsdGVy
bmF0aXZlX2NhbGwob3BzLmZsdXNoX3RsYiwgbWFzaywgdmEsIGZsYWdzKTsKIAogICAgIHJldHVy
biAtRU5PU1lTOwogfQpkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L2d1ZXN0L3hlbi94ZW4uYyBi
L3hlbi9hcmNoL3g4Ni9ndWVzdC94ZW4veGVuLmMKaW5kZXggNWQzNDI3YTcxMy4uMGViMTExNWM0
ZCAxMDA2NDQKLS0tIGEveGVuL2FyY2gveDg2L2d1ZXN0L3hlbi94ZW4uYworKysgYi94ZW4vYXJj
aC94ODYvZ3Vlc3QveGVuL3hlbi5jCkBAIC0zMjQsNyArMzI0LDcgQEAgc3RhdGljIHZvaWQgX19p
bml0IGU4MjBfZml4dXAoc3RydWN0IGU4MjBtYXAgKmU4MjApCiAgICAgICAgIHB2X3NoaW1fZml4
dXBfZTgyMChlODIwKTsKIH0KIAotc3RhdGljIGludCBmbHVzaF90bGIoY29uc3QgY3B1bWFza190
ICptYXNrLCBjb25zdCB2b2lkICp2YSwgdW5zaWduZWQgaW50IG9yZGVyKQorc3RhdGljIGludCBm
bHVzaF90bGIoY29uc3QgY3B1bWFza190ICptYXNrLCBjb25zdCB2b2lkICp2YSwgdW5zaWduZWQg
aW50IGZsYWdzKQogewogICAgIHJldHVybiB4ZW5faHlwZXJjYWxsX2h2bV9vcChIVk1PUF9mbHVz
aF90bGJzLCBOVUxMKTsKIH0KZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9zbXAuYyBiL3hlbi9h
cmNoL3g4Ni9zbXAuYwppbmRleCA5YmM5MjU2MTZhLi4yYWIwZTMwZWVmIDEwMDY0NAotLS0gYS94
ZW4vYXJjaC94ODYvc21wLmMKKysrIGIveGVuL2FyY2gveDg2L3NtcC5jCkBAIC0yNTgsOSArMjU4
LDggQEAgdm9pZCBmbHVzaF9hcmVhX21hc2soY29uc3QgY3B1bWFza190ICptYXNrLCBjb25zdCB2
b2lkICp2YSwgdW5zaWduZWQgaW50IGZsYWdzKQogICAgICAgICAgIWNwdW1hc2tfc3Vic2V0KG1h
c2ssIGNwdW1hc2tfb2YoY3B1KSkgKQogICAgIHsKICAgICAgICAgaWYgKCBjcHVfaGFzX2h5cGVy
dmlzb3IgJiYKLSAgICAgICAgICAgICAhKGZsYWdzICYgfihGTFVTSF9UTEIgfCBGTFVTSF9UTEJf
R0xPQkFMIHwgRkxVU0hfVkFfVkFMSUQgfAotICAgICAgICAgICAgICAgICAgICAgICAgIEZMVVNI
X09SREVSX01BU0spKSAmJgotICAgICAgICAgICAgICFoeXBlcnZpc29yX2ZsdXNoX3RsYihtYXNr
LCB2YSwgZmxhZ3MgJiBGTFVTSF9PUkRFUl9NQVNLKSApCisgICAgICAgICAgICAgIShmbGFncyAm
IH5GTFVTSF9UTEJfRkxBR1NfTUFTSykgJiYKKyAgICAgICAgICAgICAhaHlwZXJ2aXNvcl9mbHVz
aF90bGIobWFzaywgdmEsIGZsYWdzKSApCiAgICAgICAgIHsKICAgICAgICAgICAgIGlmICggdGxi
X2Nsa19lbmFibGVkICkKICAgICAgICAgICAgICAgICB0bGJfY2xrX2VuYWJsZWQgPSBmYWxzZTsK
ZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRlL2FzbS14ODYvZmx1c2h0bGIuaCBiL3hlbi9pbmNsdWRl
L2FzbS14ODYvZmx1c2h0bGIuaAppbmRleCA5NzczMDE0MzIwLi5hNGRlMzE3NDUyIDEwMDY0NAot
LS0gYS94ZW4vaW5jbHVkZS9hc20teDg2L2ZsdXNodGxiLmgKKysrIGIveGVuL2luY2x1ZGUvYXNt
LXg4Ni9mbHVzaHRsYi5oCkBAIC0xMjMsNiArMTIzLDkgQEAgdm9pZCBzd2l0Y2hfY3IzX2NyNCh1
bnNpZ25lZCBsb25nIGNyMywgdW5zaWduZWQgbG9uZyBjcjQpOwogIC8qIEZsdXNoIGFsbCBIVk0g
Z3Vlc3RzIGxpbmVhciBUTEIgKHVzaW5nIEFTSUQvVlBJRCkgKi8KICNkZWZpbmUgRkxVU0hfR1VF
U1RTX1RMQiAweDQwMDAKIAorI2RlZmluZSBGTFVTSF9UTEJfRkxBR1NfTUFTSyAoRkxVU0hfVExC
IHwgRkxVU0hfVExCX0dMT0JBTCB8IEZMVVNIX1ZBX1ZBTElEIHwgXAorICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgRkxVU0hfT1JERVJfTUFTSykKKwogLyogRmx1c2ggbG9jYWwgVExCcy9j
YWNoZXMuICovCiB1bnNpZ25lZCBpbnQgZmx1c2hfYXJlYV9sb2NhbChjb25zdCB2b2lkICp2YSwg
dW5zaWduZWQgaW50IGZsYWdzKTsKICNkZWZpbmUgZmx1c2hfbG9jYWwoZmxhZ3MpIGZsdXNoX2Fy
ZWFfbG9jYWwoTlVMTCwgZmxhZ3MpCmRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS9hc20teDg2L2d1
ZXN0L2h5cGVydmlzb3IuaCBiL3hlbi9pbmNsdWRlL2FzbS14ODYvZ3Vlc3QvaHlwZXJ2aXNvci5o
CmluZGV4IDQzMmU1N2MyYTAuLjQ4ZDU0NzM1ZDIgMTAwNjQ0Ci0tLSBhL3hlbi9pbmNsdWRlL2Fz
bS14ODYvZ3Vlc3QvaHlwZXJ2aXNvci5oCisrKyBiL3hlbi9pbmNsdWRlL2FzbS14ODYvZ3Vlc3Qv
aHlwZXJ2aXNvci5oCkBAIC0zNSw3ICszNSw3IEBAIHN0cnVjdCBoeXBlcnZpc29yX29wcyB7CiAg
ICAgLyogRml4IHVwIGU4MjAgbWFwICovCiAgICAgdm9pZCAoKmU4MjBfZml4dXApKHN0cnVjdCBl
ODIwbWFwICplODIwKTsKICAgICAvKiBMMCBhc3Npc3RlZCBUTEIgZmx1c2ggKi8KLSAgICBpbnQg
KCpmbHVzaF90bGIpKGNvbnN0IGNwdW1hc2tfdCAqbWFzaywgY29uc3Qgdm9pZCAqdmEsIHVuc2ln
bmVkIGludCBvcmRlcik7CisgICAgaW50ICgqZmx1c2hfdGxiKShjb25zdCBjcHVtYXNrX3QgKm1h
c2ssIGNvbnN0IHZvaWQgKnZhLCB1bnNpZ25lZCBpbnQgZmxhZ3MpOwogfTsKIAogI2lmZGVmIENP
TkZJR19HVUVTVApAQCAtNDgsMTEgKzQ4LDExIEBAIHZvaWQgaHlwZXJ2aXNvcl9lODIwX2ZpeHVw
KHN0cnVjdCBlODIwbWFwICplODIwKTsKIC8qCiAgKiBMMCBhc3Npc3RlZCBUTEIgZmx1c2guCiAg
KiBtYXNrOiBjcHVtYXNrIG9mIHRoZSBkaXJ0eSB2Q1BVcyB0aGF0IHNob3VsZCBiZSBmbHVzaGVk
LgotICogdmE6IGxpbmVhciBhZGRyZXNzIHRvIGZsdXNoLCBvciBOVUxMIGZvciBnbG9iYWwgZmx1
c2hlcy4KLSAqIG9yZGVyOiBvcmRlciBvZiB0aGUgbGluZWFyIGFkZHJlc3MgcG9pbnRlZCBieSB2
YS4KKyAqIHZhOiBsaW5lYXIgYWRkcmVzcyB0byBmbHVzaCwgb3IgTlVMTCBmb3IgZW50aXJlIGFk
ZHJlc3Mgc3BhY2UuCisgKiBmbGFnczogZmxhZ3MgZm9yIGZsdXNoaW5nLCBpbmNsdWRpbmcgdGhl
IG9yZGVyIG9mIHZhLgogICovCiBpbnQgaHlwZXJ2aXNvcl9mbHVzaF90bGIoY29uc3QgY3B1bWFz
a190ICptYXNrLCBjb25zdCB2b2lkICp2YSwKLSAgICAgICAgICAgICAgICAgICAgICAgICB1bnNp
Z25lZCBpbnQgb3JkZXIpOworICAgICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGludCBm
bGFncyk7CiAKICNlbHNlCiAKQEAgLTY1LDcgKzY1LDcgQEAgc3RhdGljIGlubGluZSBpbnQgaHlw
ZXJ2aXNvcl9hcF9zZXR1cCh2b2lkKSB7IHJldHVybiAwOyB9CiBzdGF0aWMgaW5saW5lIHZvaWQg
aHlwZXJ2aXNvcl9yZXN1bWUodm9pZCkgeyBBU1NFUlRfVU5SRUFDSEFCTEUoKTsgfQogc3RhdGlj
IGlubGluZSB2b2lkIGh5cGVydmlzb3JfZTgyMF9maXh1cChzdHJ1Y3QgZTgyMG1hcCAqZTgyMCkg
e30KIHN0YXRpYyBpbmxpbmUgaW50IGh5cGVydmlzb3JfZmx1c2hfdGxiKGNvbnN0IGNwdW1hc2tf
dCAqbWFzaywgY29uc3Qgdm9pZCAqdmEsCi0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICB1bnNpZ25lZCBpbnQgb3JkZXIpCisgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICB1bnNpZ25lZCBpbnQgZmxhZ3MpCiB7CiAgICAgcmV0dXJuIC1FTk9TWVM7CiB9
Ci0tIAoyLjIwLjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
