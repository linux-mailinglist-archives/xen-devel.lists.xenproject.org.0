Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7873E10B60F
	for <lists+xen-devel@lfdr.de>; Wed, 27 Nov 2019 19:48:05 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ia2JD-0003En-Vp; Wed, 27 Nov 2019 18:45:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8bDK=ZT=soleen.com=pasha.tatashin@srs-us1.protection.inumbo.net>)
 id 1ia2JB-0003Eg-Te
 for xen-devel@lists.xenproject.org; Wed, 27 Nov 2019 18:45:01 +0000
X-Inumbo-ID: 02cd106e-1146-11ea-a55d-bc764e2007e4
Received: from mail-qt1-x841.google.com (unknown [2607:f8b0:4864:20::841])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 02cd106e-1146-11ea-a55d-bc764e2007e4;
 Wed, 27 Nov 2019 18:44:58 +0000 (UTC)
Received: by mail-qt1-x841.google.com with SMTP id r20so26330062qtp.13
 for <xen-devel@lists.xenproject.org>; Wed, 27 Nov 2019 10:44:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=soleen.com; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=mmTY6jId1v+47cuDmza9RnIkjkXWdRY+vbpk8X/8frQ=;
 b=aqsQ5OAXHGXD5zjd0tkoV3bg//T0inyW1N4legOfHsJkyZLkH9CzwP4TcriC/5sAh2
 VtWLHeF/r+TnuRNjuKx6BMozUDoxsRSBodMfjdmrZjPn5UbxNWdE/xKI0vwSFb946OAy
 E/fmMSLqpDVgF/f1rcDGG5IPNKKs8vuiqhIfHK2V2nq2Xy5pNg/qK0AWwgxy9vafVI6E
 jcXCRTS5FOA86OpGapQ9fabPjE/agXmP2hEz0lge7LMIPLOKPa2CSdl1fWVpMCP8m2wq
 VTHfoVnSmr9gZrHaEfkbXJcZXX7Ep6k0Mz4a86uHKXKPaXscOTWBi9thXBkdTHkk0PET
 5hJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mmTY6jId1v+47cuDmza9RnIkjkXWdRY+vbpk8X/8frQ=;
 b=jgNdzbZahJm2pI+Jtj9CKbXgCJrwRzDoGgvFkXGeDpl3403fMW7TLNeNBcmnnLK9HA
 dXVbja+x5pauHi2tjlOT7vEIK9cT+99OetIV1mwbTWqTxtWNjEGF5fQMDC67Sge9eTCp
 MTSifVi1CBSy8OKFmyhIbLTRQv3r0Qs/vUusxqA80z3SyRHO6mrIS8Y0Sobu5KnmcuDj
 RFeoE/v11hlBWKp36Ml/D+cx0HeBCMz1n/vpTM7PBU7HjnmsnQXeqKw2OgPA2tOW/XUD
 amZzokKiToQNdarHAScXb2XCF9TvG8OHHDp8Sm29SF373VsEg7tRRNUAE23g07LcRQ/F
 HsoQ==
X-Gm-Message-State: APjAAAV5UUYiw8CEs09Q1A/Xxk0sR6QNQglDdjj1966PlB765Hpd/RO4
 acC/DTCMFPOHbLJnAHb3kpU09w==
X-Google-Smtp-Source: APXvYqyY+LUp3S+FmEH5qXulEID5wxm3WG9CKXcWORRy1nydUttaXn1SidAUBAt0nk0Tvq4RfvW4sQ==
X-Received: by 2002:aed:2f62:: with SMTP id l89mr33703579qtd.358.1574880297657; 
 Wed, 27 Nov 2019 10:44:57 -0800 (PST)
Received: from localhost.localdomain (c-73-69-118-222.hsd1.nh.comcast.net.
 [73.69.118.222])
 by smtp.gmail.com with ESMTPSA id o62sm2748024qte.76.2019.11.27.10.44.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Nov 2019 10:44:57 -0800 (PST)
From: Pavel Tatashin <pasha.tatashin@soleen.com>
To: pasha.tatashin@soleen.com, jmorris@namei.org, sashal@kernel.org,
 linux-kernel@vger.kernel.org, catalin.marinas@arm.com, will@kernel.org,
 steve.capper@arm.com, linux-arm-kernel@lists.infradead.org,
 marc.zyngier@arm.com, james.morse@arm.com, vladimir.murzin@arm.com,
 mark.rutland@arm.com, tglx@linutronix.de, gregkh@linuxfoundation.org,
 allison@lohutok.net, info@metux.net, alexios.zavras@intel.com,
 sstabellini@kernel.org, boris.ostrovsky@oracle.com, jgross@suse.com,
 stefan@agner.ch, yamada.masahiro@socionext.com,
 xen-devel@lists.xenproject.org, linux@armlinux.org.uk
Date: Wed, 27 Nov 2019 13:44:51 -0500
Message-Id: <20191127184453.229321-2-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191127184453.229321-1-pasha.tatashin@soleen.com>
References: <20191127184453.229321-1-pasha.tatashin@soleen.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 1/3] arm/arm64/xen: use C inlines for
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
Y2gvYXJtL2luY2x1ZGUvYXNtL2Fzc2VtYmxlci5oICAgICAgIHwgIDIgKy0KIGFyY2gvYXJtL2lu
Y2x1ZGUvYXNtL3hlbi9oeXBlcmNhbGwuaCAgIHwgMTAgKysrKysrKysrCiBhcmNoL2FybS94ZW4v
ZW5saWdodGVuLmMgICAgICAgICAgICAgICB8ICAyICstCiBhcmNoL2FybS94ZW4vaHlwZXJjYWxs
LlMgICAgICAgICAgICAgICB8ICA0ICsrLS0KIGFyY2gvYXJtNjQvaW5jbHVkZS9hc20veGVuL2h5
cGVyY2FsbC5oIHwgMjggKysrKysrKysrKysrKysrKysrKysrKysrKysKIGFyY2gvYXJtNjQveGVu
L2h5cGVyY2FsbC5TICAgICAgICAgICAgIHwgMTkgKystLS0tLS0tLS0tLS0tLS0KIGluY2x1ZGUv
eGVuL2FybS9oeXBlcmNhbGwuaCAgICAgICAgICAgIHwgMTIgKysrKystLS0tLS0KIDcgZmlsZXMg
Y2hhbmdlZCwgNTAgaW5zZXJ0aW9ucygrKSwgMjcgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEv
YXJjaC9hcm0vaW5jbHVkZS9hc20vYXNzZW1ibGVyLmggYi9hcmNoL2FybS9pbmNsdWRlL2FzbS9h
c3NlbWJsZXIuaAppbmRleCA5OTkyOTEyMmRhZDcuLjhlOTI2MmEwZjAxNiAxMDA2NDQKLS0tIGEv
YXJjaC9hcm0vaW5jbHVkZS9hc20vYXNzZW1ibGVyLmgKKysrIGIvYXJjaC9hcm0vaW5jbHVkZS9h
c20vYXNzZW1ibGVyLmgKQEAgLTQ4MCw3ICs0ODAsNyBAQCBUSFVNQigJb3JyCVxyZWcgLCBccmVn
ICwgI1BTUl9UX0JJVAkpCiAJLm1hY3JvCXVhY2Nlc3NfZGlzYWJsZSwgdG1wLCBpc2I9MQogI2lm
ZGVmIENPTkZJR19DUFVfU1dfRE9NQUlOX1BBTgogCS8qCi0JICogV2hlbmV2ZXIgd2UgcmUtZW50
ZXIgdXNlcnNwYWNlLCB0aGUgZG9tYWlucyBzaG91bGQgYWx3YXlzIGJlCisJICogV2hlbmV2ZXIg
d2UgcmUtZW50ZXIga2VybmVsLCB0aGUgZG9tYWlucyBzaG91bGQgYWx3YXlzIGJlCiAJICogc2V0
IGFwcHJvcHJpYXRlbHkuCiAJICovCiAJbW92CVx0bXAsICNEQUNSX1VBQ0NFU1NfRElTQUJMRQpk
aWZmIC0tZ2l0IGEvYXJjaC9hcm0vaW5jbHVkZS9hc20veGVuL2h5cGVyY2FsbC5oIGIvYXJjaC9h
cm0vaW5jbHVkZS9hc20veGVuL2h5cGVyY2FsbC5oCmluZGV4IDM1MjJjYmFlZDMxNi4uY2FjNWJk
OWVmNTE5IDEwMDY0NAotLS0gYS9hcmNoL2FybS9pbmNsdWRlL2FzbS94ZW4vaHlwZXJjYWxsLmgK
KysrIGIvYXJjaC9hcm0vaW5jbHVkZS9hc20veGVuL2h5cGVyY2FsbC5oCkBAIC0xICsxLDExIEBA
CisjaWZuZGVmIF9BU01fQVJNX1hFTl9IWVBFUkNBTExfSAorI2RlZmluZSBfQVNNX0FSTV9YRU5f
SFlQRVJDQUxMX0gKICNpbmNsdWRlIDx4ZW4vYXJtL2h5cGVyY2FsbC5oPgorCitzdGF0aWMgaW5s
aW5lIGxvbmcgcHJpdmNtZF9jYWxsKHVuc2lnbmVkIGludCBjYWxsLCB1bnNpZ25lZCBsb25nIGEx
LAorCQkJCXVuc2lnbmVkIGxvbmcgYTIsIHVuc2lnbmVkIGxvbmcgYTMsCisJCQkJdW5zaWduZWQg
bG9uZyBhNCwgdW5zaWduZWQgbG9uZyBhNSkKK3sKKwlyZXR1cm4gYXJjaF9wcml2Y21kX2NhbGwo
Y2FsbCwgYTEsIGEyLCBhMywgYTQsIGE1KTsKK30KKyNlbmRpZiAvKiBfQVNNX0FSTV9YRU5fSFlQ
RVJDQUxMX0ggKi8KZGlmZiAtLWdpdCBhL2FyY2gvYXJtL3hlbi9lbmxpZ2h0ZW4uYyBiL2FyY2gv
YXJtL3hlbi9lbmxpZ2h0ZW4uYwppbmRleCBkZDY4MDRhNjRmMWEuLmU4NzI4MGM2ZDI1ZCAxMDA2
NDQKLS0tIGEvYXJjaC9hcm0veGVuL2VubGlnaHRlbi5jCisrKyBiL2FyY2gvYXJtL3hlbi9lbmxp
Z2h0ZW4uYwpAQCAtNDQwLDQgKzQ0MCw0IEBAIEVYUE9SVF9TWU1CT0xfR1BMKEhZUEVSVklTT1Jf
cGxhdGZvcm1fb3BfcmF3KTsKIEVYUE9SVF9TWU1CT0xfR1BMKEhZUEVSVklTT1JfbXVsdGljYWxs
KTsKIEVYUE9SVF9TWU1CT0xfR1BMKEhZUEVSVklTT1Jfdm1fYXNzaXN0KTsKIEVYUE9SVF9TWU1C
T0xfR1BMKEhZUEVSVklTT1JfZG1fb3ApOwotRVhQT1JUX1NZTUJPTF9HUEwocHJpdmNtZF9jYWxs
KTsKK0VYUE9SVF9TWU1CT0xfR1BMKGFyY2hfcHJpdmNtZF9jYWxsKTsKZGlmZiAtLWdpdCBhL2Fy
Y2gvYXJtL3hlbi9oeXBlcmNhbGwuUyBiL2FyY2gvYXJtL3hlbi9oeXBlcmNhbGwuUwppbmRleCBi
MTFiYmE1NDJmYWMuLjI3NzA3OGM3ZGE0OSAxMDA2NDQKLS0tIGEvYXJjaC9hcm0veGVuL2h5cGVy
Y2FsbC5TCisrKyBiL2FyY2gvYXJtL3hlbi9oeXBlcmNhbGwuUwpAQCAtOTQsNyArOTQsNyBAQCBI
WVBFUkNBTEwyKG11bHRpY2FsbCk7CiBIWVBFUkNBTEwyKHZtX2Fzc2lzdCk7CiBIWVBFUkNBTEwz
KGRtX29wKTsKIAotRU5UUlkocHJpdmNtZF9jYWxsKQorRU5UUlkoYXJjaF9wcml2Y21kX2NhbGwp
CiAJc3RtZGIgc3AhLCB7cjR9CiAJbW92IHIxMiwgcjAKIAltb3YgcjAsIHIxCkBAIC0xMTksNCAr
MTE5LDQgQEAgRU5UUlkocHJpdmNtZF9jYWxsKQogCiAJbGRtIHNwISwge3I0fQogCXJldCBscgot
RU5EUFJPQyhwcml2Y21kX2NhbGwpOworRU5EUFJPQyhhcmNoX3ByaXZjbWRfY2FsbCk7CmRpZmYg
LS1naXQgYS9hcmNoL2FybTY0L2luY2x1ZGUvYXNtL3hlbi9oeXBlcmNhbGwuaCBiL2FyY2gvYXJt
NjQvaW5jbHVkZS9hc20veGVuL2h5cGVyY2FsbC5oCmluZGV4IDM1MjJjYmFlZDMxNi4uMWE3NGZi
Mjg2MDdmIDEwMDY0NAotLS0gYS9hcmNoL2FybTY0L2luY2x1ZGUvYXNtL3hlbi9oeXBlcmNhbGwu
aAorKysgYi9hcmNoL2FybTY0L2luY2x1ZGUvYXNtL3hlbi9oeXBlcmNhbGwuaApAQCAtMSArMSwy
OSBAQAorI2lmbmRlZiBfQVNNX0FSTTY0X1hFTl9IWVBFUkNBTExfSAorI2RlZmluZSBfQVNNX0FS
TTY0X1hFTl9IWVBFUkNBTExfSAogI2luY2x1ZGUgPHhlbi9hcm0vaHlwZXJjYWxsLmg+CisjaW5j
bHVkZSA8bGludXgvdWFjY2Vzcy5oPgorCitzdGF0aWMgaW5saW5lIGxvbmcgcHJpdmNtZF9jYWxs
KHVuc2lnbmVkIGludCBjYWxsLCB1bnNpZ25lZCBsb25nIGExLAorCQkJCXVuc2lnbmVkIGxvbmcg
YTIsIHVuc2lnbmVkIGxvbmcgYTMsCisJCQkJdW5zaWduZWQgbG9uZyBhNCwgdW5zaWduZWQgbG9u
ZyBhNSkKK3sKKwlsb25nIHJ2OworCisJLyoKKwkgKiBQcml2Y21kIGNhbGxzIGFyZSBpc3N1ZWQg
YnkgdGhlIHVzZXJzcGFjZS4gVGhlIGtlcm5lbCBuZWVkcyB0bworCSAqIGVuYWJsZSBhY2Nlc3Mg
dG8gVFRCUjBfRUwxIGFzIHRoZSBoeXBlcnZpc29yIHdvdWxkIGlzc3VlIHN0YWdlIDEKKwkgKiB0
cmFuc2xhdGlvbnMgdG8gdXNlciBtZW1vcnkgdmlhIEFUIGluc3RydWN0aW9ucy4gU2luY2UgQVQK
KwkgKiBpbnN0cnVjdGlvbnMgYXJlIG5vdCBhZmZlY3RlZCBieSB0aGUgUEFOIGJpdCAoQVJNdjgu
MSksIHdlIG9ubHkKKwkgKiBuZWVkIHRoZSBleHBsaWNpdCB1YWNjZXNzX2VuYWJsZS9kaXNhYmxl
IGlmIHRoZSBUVEJSMCBQQU4gZW11bGF0aW9uCisJICogaXMgZW5hYmxlZCAoaXQgaW1wbGllcyB0
aGF0IGhhcmR3YXJlIFVBTyBhbmQgUEFOIGRpc2FibGVkKS4KKwkgKi8KKwl1YWNjZXNzX3R0YnIw
X2VuYWJsZSgpOworCXJ2ID0gYXJjaF9wcml2Y21kX2NhbGwoY2FsbCwgYTEsIGEyLCBhMywgYTQs
IGE1KTsKKwkvKgorCSAqIERpc2FibGUgdXNlcnNwYWNlIGFjY2VzcyBmcm9tIGtlcm5lbCBvbmNl
IHRoZSBoeXAgY2FsbCBjb21wbGV0ZWQuCisJICovCisJdWFjY2Vzc190dGJyMF9kaXNhYmxlKCk7
CisKKwlyZXR1cm4gcnY7Cit9CisjZW5kaWYgLyogX0FTTV9BUk02NF9YRU5fSFlQRVJDQUxMX0gg
Ki8KZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQveGVuL2h5cGVyY2FsbC5TIGIvYXJjaC9hcm02NC94
ZW4vaHlwZXJjYWxsLlMKaW5kZXggYzVmMDVjNGE0ZDAwLi45MjE2MTE3NzhkMmEgMTAwNjQ0Ci0t
LSBhL2FyY2gvYXJtNjQveGVuL2h5cGVyY2FsbC5TCisrKyBiL2FyY2gvYXJtNjQveGVuL2h5cGVy
Y2FsbC5TCkBAIC00OSw3ICs0OSw2IEBACiAKICNpbmNsdWRlIDxsaW51eC9saW5rYWdlLmg+CiAj
aW5jbHVkZSA8YXNtL2Fzc2VtYmxlci5oPgotI2luY2x1ZGUgPGFzbS9hc20tdWFjY2Vzcy5oPgog
I2luY2x1ZGUgPHhlbi9pbnRlcmZhY2UveGVuLmg+CiAKIApAQCAtODYsMjcgKzg1LDEzIEBAIEhZ
UEVSQ0FMTDIobXVsdGljYWxsKTsKIEhZUEVSQ0FMTDIodm1fYXNzaXN0KTsKIEhZUEVSQ0FMTDMo
ZG1fb3ApOwogCi1FTlRSWShwcml2Y21kX2NhbGwpCitFTlRSWShhcmNoX3ByaXZjbWRfY2FsbCkK
IAltb3YgeDE2LCB4MAogCW1vdiB4MCwgeDEKIAltb3YgeDEsIHgyCiAJbW92IHgyLCB4MwogCW1v
diB4MywgeDQKIAltb3YgeDQsIHg1Ci0JLyoKLQkgKiBQcml2Y21kIGNhbGxzIGFyZSBpc3N1ZWQg
YnkgdGhlIHVzZXJzcGFjZS4gVGhlIGtlcm5lbCBuZWVkcyB0bwotCSAqIGVuYWJsZSBhY2Nlc3Mg
dG8gVFRCUjBfRUwxIGFzIHRoZSBoeXBlcnZpc29yIHdvdWxkIGlzc3VlIHN0YWdlIDEKLQkgKiB0
cmFuc2xhdGlvbnMgdG8gdXNlciBtZW1vcnkgdmlhIEFUIGluc3RydWN0aW9ucy4gU2luY2UgQVQK
LQkgKiBpbnN0cnVjdGlvbnMgYXJlIG5vdCBhZmZlY3RlZCBieSB0aGUgUEFOIGJpdCAoQVJNdjgu
MSksIHdlIG9ubHkKLQkgKiBuZWVkIHRoZSBleHBsaWNpdCB1YWNjZXNzX2VuYWJsZS9kaXNhYmxl
IGlmIHRoZSBUVEJSMCBQQU4gZW11bGF0aW9uCi0JICogaXMgZW5hYmxlZCAoaXQgaW1wbGllcyB0
aGF0IGhhcmR3YXJlIFVBTyBhbmQgUEFOIGRpc2FibGVkKS4KLQkgKi8KLQl1YWNjZXNzX3R0YnIw
X2VuYWJsZSB4NiwgeDcsIHg4CiAJaHZjIFhFTl9JTU0KLQotCS8qCi0JICogRGlzYWJsZSB1c2Vy
c3BhY2UgYWNjZXNzIGZyb20ga2VybmVsIG9uY2UgdGhlIGh5cCBjYWxsIGNvbXBsZXRlZC4KLQkg
Ki8KLQl1YWNjZXNzX3R0YnIwX2Rpc2FibGUgeDYsIHg3CiAJcmV0Ci1FTkRQUk9DKHByaXZjbWRf
Y2FsbCk7CitFTkRQUk9DKGFyY2hfcHJpdmNtZF9jYWxsKTsKZGlmZiAtLWdpdCBhL2luY2x1ZGUv
eGVuL2FybS9oeXBlcmNhbGwuaCBiL2luY2x1ZGUveGVuL2FybS9oeXBlcmNhbGwuaAppbmRleCBi
NDA0ODVlNTRkODAuLjYyNGM4YWQ3ZTQyYSAxMDA2NDQKLS0tIGEvaW5jbHVkZS94ZW4vYXJtL2h5
cGVyY2FsbC5oCisrKyBiL2luY2x1ZGUveGVuL2FybS9oeXBlcmNhbGwuaApAQCAtMzAsOCArMzAs
OCBAQAogICogSU4gVEhFIFNPRlRXQVJFLgogICovCiAKLSNpZm5kZWYgX0FTTV9BUk1fWEVOX0hZ
UEVSQ0FMTF9ICi0jZGVmaW5lIF9BU01fQVJNX1hFTl9IWVBFUkNBTExfSAorI2lmbmRlZiBfQVJN
X1hFTl9IWVBFUkNBTExfSAorI2RlZmluZSBfQVJNX1hFTl9IWVBFUkNBTExfSAogCiAjaW5jbHVk
ZSA8bGludXgvYnVnLmg+CiAKQEAgLTQxLDkgKzQxLDkgQEAKIAogc3RydWN0IHhlbl9kbV9vcF9i
dWY7CiAKLWxvbmcgcHJpdmNtZF9jYWxsKHVuc2lnbmVkIGNhbGwsIHVuc2lnbmVkIGxvbmcgYTEs
Ci0JCXVuc2lnbmVkIGxvbmcgYTIsIHVuc2lnbmVkIGxvbmcgYTMsCi0JCXVuc2lnbmVkIGxvbmcg
YTQsIHVuc2lnbmVkIGxvbmcgYTUpOworbG9uZyBhcmNoX3ByaXZjbWRfY2FsbCh1bnNpZ25lZCBp
bnQgY2FsbCwgdW5zaWduZWQgbG9uZyBhMSwKKwkJICAgICAgIHVuc2lnbmVkIGxvbmcgYTIsIHVu
c2lnbmVkIGxvbmcgYTMsCisJCSAgICAgICB1bnNpZ25lZCBsb25nIGE0LCB1bnNpZ25lZCBsb25n
IGE1KTsKIGludCBIWVBFUlZJU09SX3hlbl92ZXJzaW9uKGludCBjbWQsIHZvaWQgKmFyZyk7CiBp
bnQgSFlQRVJWSVNPUl9jb25zb2xlX2lvKGludCBjbWQsIGludCBjb3VudCwgY2hhciAqc3RyKTsK
IGludCBIWVBFUlZJU09SX2dyYW50X3RhYmxlX29wKHVuc2lnbmVkIGludCBjbWQsIHZvaWQgKnVv
cCwgdW5zaWduZWQgaW50IGNvdW50KTsKQEAgLTg4LDQgKzg4LDQgQEAgTVVMVElfbW11X3VwZGF0
ZShzdHJ1Y3QgbXVsdGljYWxsX2VudHJ5ICptY2wsIHN0cnVjdCBtbXVfdXBkYXRlICpyZXEsCiAJ
QlVHKCk7CiB9CiAKLSNlbmRpZiAvKiBfQVNNX0FSTV9YRU5fSFlQRVJDQUxMX0ggKi8KKyNlbmRp
ZiAvKiBfQVJNX1hFTl9IWVBFUkNBTExfSCAqLwotLSAKMi4yNC4wCgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
