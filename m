Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E82F11381E
	for <lists+xen-devel@lfdr.de>; Thu,  5 Dec 2019 00:24:18 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1icdxL-00016A-ID; Wed, 04 Dec 2019 23:21:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=cR3Y=Z2=soleen.com=pasha.tatashin@srs-us1.protection.inumbo.net>)
 id 1icdxK-000160-Bk
 for xen-devel@lists.xenproject.org; Wed, 04 Dec 2019 23:21:14 +0000
X-Inumbo-ID: be8aeed8-16ec-11ea-aea8-bc764e2007e4
Received: from mail-qk1-x742.google.com (unknown [2607:f8b0:4864:20::742])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id be8aeed8-16ec-11ea-aea8-bc764e2007e4;
 Wed, 04 Dec 2019 23:21:05 +0000 (UTC)
Received: by mail-qk1-x742.google.com with SMTP id c124so1713919qkg.0
 for <xen-devel@lists.xenproject.org>; Wed, 04 Dec 2019 15:21:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=soleen.com; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=smj6n8EMZwJiO9OcqZKdj+gFypq1fwZIXw8AeaUdZHE=;
 b=N4nfr8PE7rjna1sy2un2T8I/QbS/FDLXdrJdb0wzVkKCQ0Nj4dVx7WmOcfoTbe5Err
 pCFB4uRN8dThnvHaL9+mll+NSkYsl6VZv2Yd50MyOh3YqGpl02gUx8B4ygniHLmcS6pV
 WwaVWKjUa5ffxJzDu0ELYDn5CgGrFItaaLreOkNgU/KSp+i9Suyx3HVGq7XY4Ej0TjWJ
 Ef1KpevZtJDkH9/dlSJgvPDOft/cByij6ONlj8yl/Cwgbln3gj9DTaq7uPAXOC0aWu+O
 iJaLlmbn717MW1qDNHGc+DEKhEaHFO9VZhUoOdnlsN+wP70BOG79UXsp6UJt4CRy/Zd9
 yz9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=smj6n8EMZwJiO9OcqZKdj+gFypq1fwZIXw8AeaUdZHE=;
 b=ioB0My81ai55L0vmmlibGeggMWgsuj4ZYpiJpjlgAzh2oQquw7h0yhtN8z6uLJQMgT
 EVfcs+G76baIHnizV3BycpygfVOf5UFJnK/8/LmQKPTjZMUreTgMP+ZOKjS8r0nAeNiu
 ZrYksRTMwy1sqfM5zAkCCXcSsf+j4MMWT/7xOxS/hkligpL9wR4tLUmXFgn3PVDBn/zO
 jiw+rzSBMViNkWT6GJPj5KvIjB3oZP70jhwwhZagRY8auqxRw6P7ZnzB0mWcIvj5UiMB
 rN+622s7tfeuG3mHl8PuI7TeoIxx986VUUUWdGO3h4yRFSz/vTmkviEU+L9gdJsDWd7u
 KuVA==
X-Gm-Message-State: APjAAAUS0yhN6tp5oqG+4/ExdhlOTRvMUBIENLDRW+yfvJrjhXxHXkLs
 B3JcyHbHbNYFUTa8Eon+xXwNqg==
X-Google-Smtp-Source: APXvYqxwjlWsEl+Nl33Swhk+ma+381+gPtq7UHPUaqWh/EAaKEnwlcNsIHolGzi5TlRApATztOnEyg==
X-Received: by 2002:a37:a744:: with SMTP id q65mr5771564qke.228.1575501664918; 
 Wed, 04 Dec 2019 15:21:04 -0800 (PST)
Received: from localhost.localdomain (c-73-69-118-222.hsd1.nh.comcast.net.
 [73.69.118.222])
 by smtp.gmail.com with ESMTPSA id t38sm4667864qta.78.2019.12.04.15.21.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Dec 2019 15:21:04 -0800 (PST)
From: Pavel Tatashin <pasha.tatashin@soleen.com>
To: pasha.tatashin@soleen.com, jmorris@namei.org, sashal@kernel.org,
 linux-kernel@vger.kernel.org, catalin.marinas@arm.com, will@kernel.org,
 steve.capper@arm.com, linux-arm-kernel@lists.infradead.org, maz@kernel.org,
 james.morse@arm.com, vladimir.murzin@arm.com, mark.rutland@arm.com,
 tglx@linutronix.de, gregkh@linuxfoundation.org, allison@lohutok.net,
 info@metux.net, alexios.zavras@intel.com, sstabellini@kernel.org,
 boris.ostrovsky@oracle.com, jgross@suse.com, stefan@agner.ch,
 yamada.masahiro@socionext.com, xen-devel@lists.xenproject.org,
 linux@armlinux.org.uk, andrew.cooper3@citrix.com, julien@xen.org
Date: Wed,  4 Dec 2019 18:20:54 -0500
Message-Id: <20191204232058.2500117-3-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191204232058.2500117-1-pasha.tatashin@soleen.com>
References: <20191204232058.2500117-1-pasha.tatashin@soleen.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v4 2/6] arm/arm64/xen: use C inlines for
 privcmd_call
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

cHJpdmNtZF9jYWxsIHJlcXVpcmVzIHRvIGVuYWJsZSBhY2Nlc3MgdG8gdXNlcnNwYWNlIGZvciB0
aGUKZHVyYXRpb24gb2YgdGhlIGh5cGVyY2FsbC4KCkN1cnJlbnRseSwgdGhpcyBpcyBkb25lIHZp
YSBhc3NlbWJseSBtYWNyb3MuIENoYW5nZSBpdCB0byBDCmlubGluZXMgaW5zdGVhZC4KClNpZ25l
ZC1vZmYtYnk6IFBhdmVsIFRhdGFzaGluIDxwYXNoYS50YXRhc2hpbkBzb2xlZW4uY29tPgpBY2tl
ZC1ieTogU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPgotLS0KIGFy
Y2gvYXJtL2luY2x1ZGUvYXNtL3hlbi9oeXBlcmNhbGwuaCAgIHwgIDYgKysrKysrCiBhcmNoL2Fy
bS94ZW4vZW5saWdodGVuLmMgICAgICAgICAgICAgICB8ICAyICstCiBhcmNoL2FybS94ZW4vaHlw
ZXJjYWxsLlMgICAgICAgICAgICAgICB8ICA0ICsrLS0KIGFyY2gvYXJtNjQvaW5jbHVkZS9hc20v
eGVuL2h5cGVyY2FsbC5oIHwgMjQgKysrKysrKysrKysrKysrKysrKysrKysrCiBhcmNoL2FybTY0
L3hlbi9oeXBlcmNhbGwuUyAgICAgICAgICAgICB8IDE5ICsrLS0tLS0tLS0tLS0tLS0tLS0KIGlu
Y2x1ZGUveGVuL2FybS9oeXBlcmNhbGwuaCAgICAgICAgICAgIHwgIDYgKysrLS0tCiA2IGZpbGVz
IGNoYW5nZWQsIDM4IGluc2VydGlvbnMoKyksIDIzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBh
L2FyY2gvYXJtL2luY2x1ZGUvYXNtL3hlbi9oeXBlcmNhbGwuaCBiL2FyY2gvYXJtL2luY2x1ZGUv
YXNtL3hlbi9oeXBlcmNhbGwuaAppbmRleCBjNjg4MmJiYTUyODQuLmNhYzViZDllZjUxOSAxMDA2
NDQKLS0tIGEvYXJjaC9hcm0vaW5jbHVkZS9hc20veGVuL2h5cGVyY2FsbC5oCisrKyBiL2FyY2gv
YXJtL2luY2x1ZGUvYXNtL3hlbi9oeXBlcmNhbGwuaApAQCAtMiw0ICsyLDEwIEBACiAjZGVmaW5l
IF9BU01fQVJNX1hFTl9IWVBFUkNBTExfSAogI2luY2x1ZGUgPHhlbi9hcm0vaHlwZXJjYWxsLmg+
CiAKK3N0YXRpYyBpbmxpbmUgbG9uZyBwcml2Y21kX2NhbGwodW5zaWduZWQgaW50IGNhbGwsIHVu
c2lnbmVkIGxvbmcgYTEsCisJCQkJdW5zaWduZWQgbG9uZyBhMiwgdW5zaWduZWQgbG9uZyBhMywK
KwkJCQl1bnNpZ25lZCBsb25nIGE0LCB1bnNpZ25lZCBsb25nIGE1KQoreworCXJldHVybiBhcmNo
X3ByaXZjbWRfY2FsbChjYWxsLCBhMSwgYTIsIGEzLCBhNCwgYTUpOworfQogI2VuZGlmIC8qIF9B
U01fQVJNX1hFTl9IWVBFUkNBTExfSCAqLwpkaWZmIC0tZ2l0IGEvYXJjaC9hcm0veGVuL2VubGln
aHRlbi5jIGIvYXJjaC9hcm0veGVuL2VubGlnaHRlbi5jCmluZGV4IGRkNjgwNGE2NGYxYS4uZTg3
MjgwYzZkMjVkIDEwMDY0NAotLS0gYS9hcmNoL2FybS94ZW4vZW5saWdodGVuLmMKKysrIGIvYXJj
aC9hcm0veGVuL2VubGlnaHRlbi5jCkBAIC00NDAsNCArNDQwLDQgQEAgRVhQT1JUX1NZTUJPTF9H
UEwoSFlQRVJWSVNPUl9wbGF0Zm9ybV9vcF9yYXcpOwogRVhQT1JUX1NZTUJPTF9HUEwoSFlQRVJW
SVNPUl9tdWx0aWNhbGwpOwogRVhQT1JUX1NZTUJPTF9HUEwoSFlQRVJWSVNPUl92bV9hc3Npc3Qp
OwogRVhQT1JUX1NZTUJPTF9HUEwoSFlQRVJWSVNPUl9kbV9vcCk7Ci1FWFBPUlRfU1lNQk9MX0dQ
TChwcml2Y21kX2NhbGwpOworRVhQT1JUX1NZTUJPTF9HUEwoYXJjaF9wcml2Y21kX2NhbGwpOwpk
aWZmIC0tZ2l0IGEvYXJjaC9hcm0veGVuL2h5cGVyY2FsbC5TIGIvYXJjaC9hcm0veGVuL2h5cGVy
Y2FsbC5TCmluZGV4IGIxMWJiYTU0MmZhYy4uMjc3MDc4YzdkYTQ5IDEwMDY0NAotLS0gYS9hcmNo
L2FybS94ZW4vaHlwZXJjYWxsLlMKKysrIGIvYXJjaC9hcm0veGVuL2h5cGVyY2FsbC5TCkBAIC05
NCw3ICs5NCw3IEBAIEhZUEVSQ0FMTDIobXVsdGljYWxsKTsKIEhZUEVSQ0FMTDIodm1fYXNzaXN0
KTsKIEhZUEVSQ0FMTDMoZG1fb3ApOwogCi1FTlRSWShwcml2Y21kX2NhbGwpCitFTlRSWShhcmNo
X3ByaXZjbWRfY2FsbCkKIAlzdG1kYiBzcCEsIHtyNH0KIAltb3YgcjEyLCByMAogCW1vdiByMCwg
cjEKQEAgLTExOSw0ICsxMTksNCBAQCBFTlRSWShwcml2Y21kX2NhbGwpCiAKIAlsZG0gc3AhLCB7
cjR9CiAJcmV0IGxyCi1FTkRQUk9DKHByaXZjbWRfY2FsbCk7CitFTkRQUk9DKGFyY2hfcHJpdmNt
ZF9jYWxsKTsKZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQvaW5jbHVkZS9hc20veGVuL2h5cGVyY2Fs
bC5oIGIvYXJjaC9hcm02NC9pbmNsdWRlL2FzbS94ZW4vaHlwZXJjYWxsLmgKaW5kZXggYzMxOThm
OWNjZDJlLi4xYTc0ZmIyODYwN2YgMTAwNjQ0Ci0tLSBhL2FyY2gvYXJtNjQvaW5jbHVkZS9hc20v
eGVuL2h5cGVyY2FsbC5oCisrKyBiL2FyY2gvYXJtNjQvaW5jbHVkZS9hc20veGVuL2h5cGVyY2Fs
bC5oCkBAIC0xLDUgKzEsMjkgQEAKICNpZm5kZWYgX0FTTV9BUk02NF9YRU5fSFlQRVJDQUxMX0gK
ICNkZWZpbmUgX0FTTV9BUk02NF9YRU5fSFlQRVJDQUxMX0gKICNpbmNsdWRlIDx4ZW4vYXJtL2h5
cGVyY2FsbC5oPgorI2luY2x1ZGUgPGxpbnV4L3VhY2Nlc3MuaD4KIAorc3RhdGljIGlubGluZSBs
b25nIHByaXZjbWRfY2FsbCh1bnNpZ25lZCBpbnQgY2FsbCwgdW5zaWduZWQgbG9uZyBhMSwKKwkJ
CQl1bnNpZ25lZCBsb25nIGEyLCB1bnNpZ25lZCBsb25nIGEzLAorCQkJCXVuc2lnbmVkIGxvbmcg
YTQsIHVuc2lnbmVkIGxvbmcgYTUpCit7CisJbG9uZyBydjsKKworCS8qCisJICogUHJpdmNtZCBj
YWxscyBhcmUgaXNzdWVkIGJ5IHRoZSB1c2Vyc3BhY2UuIFRoZSBrZXJuZWwgbmVlZHMgdG8KKwkg
KiBlbmFibGUgYWNjZXNzIHRvIFRUQlIwX0VMMSBhcyB0aGUgaHlwZXJ2aXNvciB3b3VsZCBpc3N1
ZSBzdGFnZSAxCisJICogdHJhbnNsYXRpb25zIHRvIHVzZXIgbWVtb3J5IHZpYSBBVCBpbnN0cnVj
dGlvbnMuIFNpbmNlIEFUCisJICogaW5zdHJ1Y3Rpb25zIGFyZSBub3QgYWZmZWN0ZWQgYnkgdGhl
IFBBTiBiaXQgKEFSTXY4LjEpLCB3ZSBvbmx5CisJICogbmVlZCB0aGUgZXhwbGljaXQgdWFjY2Vz
c19lbmFibGUvZGlzYWJsZSBpZiB0aGUgVFRCUjAgUEFOIGVtdWxhdGlvbgorCSAqIGlzIGVuYWJs
ZWQgKGl0IGltcGxpZXMgdGhhdCBoYXJkd2FyZSBVQU8gYW5kIFBBTiBkaXNhYmxlZCkuCisJICov
CisJdWFjY2Vzc190dGJyMF9lbmFibGUoKTsKKwlydiA9IGFyY2hfcHJpdmNtZF9jYWxsKGNhbGws
IGExLCBhMiwgYTMsIGE0LCBhNSk7CisJLyoKKwkgKiBEaXNhYmxlIHVzZXJzcGFjZSBhY2Nlc3Mg
ZnJvbSBrZXJuZWwgb25jZSB0aGUgaHlwIGNhbGwgY29tcGxldGVkLgorCSAqLworCXVhY2Nlc3Nf
dHRicjBfZGlzYWJsZSgpOworCisJcmV0dXJuIHJ2OworfQogI2VuZGlmIC8qIF9BU01fQVJNNjRf
WEVOX0hZUEVSQ0FMTF9IICovCmRpZmYgLS1naXQgYS9hcmNoL2FybTY0L3hlbi9oeXBlcmNhbGwu
UyBiL2FyY2gvYXJtNjQveGVuL2h5cGVyY2FsbC5TCmluZGV4IGM1ZjA1YzRhNGQwMC4uOTIxNjEx
Nzc4ZDJhIDEwMDY0NAotLS0gYS9hcmNoL2FybTY0L3hlbi9oeXBlcmNhbGwuUworKysgYi9hcmNo
L2FybTY0L3hlbi9oeXBlcmNhbGwuUwpAQCAtNDksNyArNDksNiBAQAogCiAjaW5jbHVkZSA8bGlu
dXgvbGlua2FnZS5oPgogI2luY2x1ZGUgPGFzbS9hc3NlbWJsZXIuaD4KLSNpbmNsdWRlIDxhc20v
YXNtLXVhY2Nlc3MuaD4KICNpbmNsdWRlIDx4ZW4vaW50ZXJmYWNlL3hlbi5oPgogCiAKQEAgLTg2
LDI3ICs4NSwxMyBAQCBIWVBFUkNBTEwyKG11bHRpY2FsbCk7CiBIWVBFUkNBTEwyKHZtX2Fzc2lz
dCk7CiBIWVBFUkNBTEwzKGRtX29wKTsKIAotRU5UUlkocHJpdmNtZF9jYWxsKQorRU5UUlkoYXJj
aF9wcml2Y21kX2NhbGwpCiAJbW92IHgxNiwgeDAKIAltb3YgeDAsIHgxCiAJbW92IHgxLCB4Mgog
CW1vdiB4MiwgeDMKIAltb3YgeDMsIHg0CiAJbW92IHg0LCB4NQotCS8qCi0JICogUHJpdmNtZCBj
YWxscyBhcmUgaXNzdWVkIGJ5IHRoZSB1c2Vyc3BhY2UuIFRoZSBrZXJuZWwgbmVlZHMgdG8KLQkg
KiBlbmFibGUgYWNjZXNzIHRvIFRUQlIwX0VMMSBhcyB0aGUgaHlwZXJ2aXNvciB3b3VsZCBpc3N1
ZSBzdGFnZSAxCi0JICogdHJhbnNsYXRpb25zIHRvIHVzZXIgbWVtb3J5IHZpYSBBVCBpbnN0cnVj
dGlvbnMuIFNpbmNlIEFUCi0JICogaW5zdHJ1Y3Rpb25zIGFyZSBub3QgYWZmZWN0ZWQgYnkgdGhl
IFBBTiBiaXQgKEFSTXY4LjEpLCB3ZSBvbmx5Ci0JICogbmVlZCB0aGUgZXhwbGljaXQgdWFjY2Vz
c19lbmFibGUvZGlzYWJsZSBpZiB0aGUgVFRCUjAgUEFOIGVtdWxhdGlvbgotCSAqIGlzIGVuYWJs
ZWQgKGl0IGltcGxpZXMgdGhhdCBoYXJkd2FyZSBVQU8gYW5kIFBBTiBkaXNhYmxlZCkuCi0JICov
Ci0JdWFjY2Vzc190dGJyMF9lbmFibGUgeDYsIHg3LCB4OAogCWh2YyBYRU5fSU1NCi0KLQkvKgot
CSAqIERpc2FibGUgdXNlcnNwYWNlIGFjY2VzcyBmcm9tIGtlcm5lbCBvbmNlIHRoZSBoeXAgY2Fs
bCBjb21wbGV0ZWQuCi0JICovCi0JdWFjY2Vzc190dGJyMF9kaXNhYmxlIHg2LCB4NwogCXJldAot
RU5EUFJPQyhwcml2Y21kX2NhbGwpOworRU5EUFJPQyhhcmNoX3ByaXZjbWRfY2FsbCk7CmRpZmYg
LS1naXQgYS9pbmNsdWRlL3hlbi9hcm0vaHlwZXJjYWxsLmggYi9pbmNsdWRlL3hlbi9hcm0vaHlw
ZXJjYWxsLmgKaW5kZXggYmFiY2MwOGFmOTY1Li42MjRjOGFkN2U0MmEgMTAwNjQ0Ci0tLSBhL2lu
Y2x1ZGUveGVuL2FybS9oeXBlcmNhbGwuaAorKysgYi9pbmNsdWRlL3hlbi9hcm0vaHlwZXJjYWxs
LmgKQEAgLTQxLDkgKzQxLDkgQEAKIAogc3RydWN0IHhlbl9kbV9vcF9idWY7CiAKLWxvbmcgcHJp
dmNtZF9jYWxsKHVuc2lnbmVkIGNhbGwsIHVuc2lnbmVkIGxvbmcgYTEsCi0JCXVuc2lnbmVkIGxv
bmcgYTIsIHVuc2lnbmVkIGxvbmcgYTMsCi0JCXVuc2lnbmVkIGxvbmcgYTQsIHVuc2lnbmVkIGxv
bmcgYTUpOworbG9uZyBhcmNoX3ByaXZjbWRfY2FsbCh1bnNpZ25lZCBpbnQgY2FsbCwgdW5zaWdu
ZWQgbG9uZyBhMSwKKwkJICAgICAgIHVuc2lnbmVkIGxvbmcgYTIsIHVuc2lnbmVkIGxvbmcgYTMs
CisJCSAgICAgICB1bnNpZ25lZCBsb25nIGE0LCB1bnNpZ25lZCBsb25nIGE1KTsKIGludCBIWVBF
UlZJU09SX3hlbl92ZXJzaW9uKGludCBjbWQsIHZvaWQgKmFyZyk7CiBpbnQgSFlQRVJWSVNPUl9j
b25zb2xlX2lvKGludCBjbWQsIGludCBjb3VudCwgY2hhciAqc3RyKTsKIGludCBIWVBFUlZJU09S
X2dyYW50X3RhYmxlX29wKHVuc2lnbmVkIGludCBjbWQsIHZvaWQgKnVvcCwgdW5zaWduZWQgaW50
IGNvdW50KTsKLS0gCjIuMjQuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
