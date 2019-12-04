Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B210311381F
	for <lists+xen-devel@lfdr.de>; Thu,  5 Dec 2019 00:24:18 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1icdxB-00014o-S4; Wed, 04 Dec 2019 23:21:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=cR3Y=Z2=soleen.com=pasha.tatashin@srs-us1.protection.inumbo.net>)
 id 1icdxA-00014j-CN
 for xen-devel@lists.xenproject.org; Wed, 04 Dec 2019 23:21:04 +0000
X-Inumbo-ID: bd766d10-16ec-11ea-aea8-bc764e2007e4
Received: from mail-qv1-xf43.google.com (unknown [2607:f8b0:4864:20::f43])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bd766d10-16ec-11ea-aea8-bc764e2007e4;
 Wed, 04 Dec 2019 23:21:03 +0000 (UTC)
Received: by mail-qv1-xf43.google.com with SMTP id p2so563205qvo.10
 for <xen-devel@lists.xenproject.org>; Wed, 04 Dec 2019 15:21:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=soleen.com; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=eby1Z/q7U+7Sxm/O/Jl7zP2rKdfik8y03EjcrV9rvuY=;
 b=NkJEU/yt/blJhAPAwm0//b+ZWq1n7s4JlJ6JP+qdBGuTQCQuHFZ8PMWe00iEhl9sXR
 D5h+fsIE0OGIVs9vXL4gpNLeOVHliEVsqZGstR3wOREMlUTyHMBjBqiiJN9XSmUHGnl9
 E029DgxCUKX3rVs0qGMWaVjtplCdTxiZQYRP12zEURRSXHIzCN4n9ZW6ehybuzzr5UNJ
 Zl0SICIsfPNpjp6MCNV3XJOhgzPiqFDsK+MaqCJejfrOaTmcJDz3S6PSEcE5G1+/Jk4t
 F2m0xoYu1kjAU9N6m6iUSEwzBQ39xf3hLWime1T3P66/AhdOKcdyJZrg+K7Z5WCheUkf
 kIJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eby1Z/q7U+7Sxm/O/Jl7zP2rKdfik8y03EjcrV9rvuY=;
 b=KieLTo+P+EgPtEmQ3AQuVs//fgnxji4fBO6v9/HjGKrP0u1Jpw19emas77KRKyUzTH
 Xw8LY4ElICE/u8ruKh2oGBNZcGfDT4+w1rmUSV94buv9fAMGvi5CC+jYS2/9OoQjZXsx
 oMztXXtyDtzklHmlWhp+WbxlTbwen6uapND8T7V6qFfN9shHLEDCasnvtZYhHm/re8J1
 QESidRmQq7ixE5PuvaiTetfBqLyZRckmwcBqN8vquaK1Uvb9yQxDvVCNGxZ09mIOlIIx
 TaJ+CcgYWE0BqXANwiZLfl9u0jB8gRTmfo9RJur/MJXTTQc9i4E3iIwW5S9ahh96SqUl
 tqiQ==
X-Gm-Message-State: APjAAAVkwq7IqIpQ/YC4zaLwv6KgyV4WZohMz1NZ0MJbibkyv0fDoR5I
 n7IFnh8/97W/9TiU15Q7WA0seg==
X-Google-Smtp-Source: APXvYqwCGhoOs0wEUWkqNpwRHUAKwjbY4ROZeLY1H9ddt2HeC0y/qK9F5ZFbRQ+FLH5XluAaaaKK8A==
X-Received: by 2002:a0c:ef91:: with SMTP id w17mr5033755qvr.202.1575501663211; 
 Wed, 04 Dec 2019 15:21:03 -0800 (PST)
Received: from localhost.localdomain (c-73-69-118-222.hsd1.nh.comcast.net.
 [73.69.118.222])
 by smtp.gmail.com with ESMTPSA id t38sm4667864qta.78.2019.12.04.15.21.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Dec 2019 15:21:02 -0800 (PST)
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
Date: Wed,  4 Dec 2019 18:20:53 -0500
Message-Id: <20191204232058.2500117-2-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191204232058.2500117-1-pasha.tatashin@soleen.com>
References: <20191204232058.2500117-1-pasha.tatashin@soleen.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v4 1/6] arm/arm64/xen: hypercall.h add includes
 guards
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

VGhlIGFybSBhbmQgYXJtNjQgdmVyc2lvbnMgb2YgaHlwZXJjYWxsLmggYXJlIG1pc3NpbmcgdGhl
IGluY2x1ZGUKZ3VhcmRzLiBUaGlzIGlzIG5lZWRlZCBiZWNhdXNlIEMgaW5saW5lcyBmb3IgcHJp
dmNtZF9jYWxsIGFyZSBnb2luZyB0bwpiZSBhZGRlZCB0byB0aGUgZmlsZXMuCgpBbHNvIGZpeCBh
IGNvbW1lbnQuCgpTaWduZWQtb2ZmLWJ5OiBQYXZlbCBUYXRhc2hpbiA8cGFzaGEudGF0YXNoaW5A
c29sZWVuLmNvbT4KLS0tCiBhcmNoL2FybS9pbmNsdWRlL2FzbS9hc3NlbWJsZXIuaCAgICAgICB8
IDIgKy0KIGFyY2gvYXJtL2luY2x1ZGUvYXNtL3hlbi9oeXBlcmNhbGwuaCAgIHwgNCArKysrCiBh
cmNoL2FybTY0L2luY2x1ZGUvYXNtL3hlbi9oeXBlcmNhbGwuaCB8IDQgKysrKwogaW5jbHVkZS94
ZW4vYXJtL2h5cGVyY2FsbC5oICAgICAgICAgICAgfCA2ICsrKy0tLQogNCBmaWxlcyBjaGFuZ2Vk
LCAxMiBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2FyY2gvYXJt
L2luY2x1ZGUvYXNtL2Fzc2VtYmxlci5oIGIvYXJjaC9hcm0vaW5jbHVkZS9hc20vYXNzZW1ibGVy
LmgKaW5kZXggOTk5MjkxMjJkYWQ3Li44ZTkyNjJhMGYwMTYgMTAwNjQ0Ci0tLSBhL2FyY2gvYXJt
L2luY2x1ZGUvYXNtL2Fzc2VtYmxlci5oCisrKyBiL2FyY2gvYXJtL2luY2x1ZGUvYXNtL2Fzc2Vt
Ymxlci5oCkBAIC00ODAsNyArNDgwLDcgQEAgVEhVTUIoCW9ycglccmVnICwgXHJlZyAsICNQU1Jf
VF9CSVQJKQogCS5tYWNybwl1YWNjZXNzX2Rpc2FibGUsIHRtcCwgaXNiPTEKICNpZmRlZiBDT05G
SUdfQ1BVX1NXX0RPTUFJTl9QQU4KIAkvKgotCSAqIFdoZW5ldmVyIHdlIHJlLWVudGVyIHVzZXJz
cGFjZSwgdGhlIGRvbWFpbnMgc2hvdWxkIGFsd2F5cyBiZQorCSAqIFdoZW5ldmVyIHdlIHJlLWVu
dGVyIGtlcm5lbCwgdGhlIGRvbWFpbnMgc2hvdWxkIGFsd2F5cyBiZQogCSAqIHNldCBhcHByb3By
aWF0ZWx5LgogCSAqLwogCW1vdglcdG1wLCAjREFDUl9VQUNDRVNTX0RJU0FCTEUKZGlmZiAtLWdp
dCBhL2FyY2gvYXJtL2luY2x1ZGUvYXNtL3hlbi9oeXBlcmNhbGwuaCBiL2FyY2gvYXJtL2luY2x1
ZGUvYXNtL3hlbi9oeXBlcmNhbGwuaAppbmRleCAzNTIyY2JhZWQzMTYuLmM2ODgyYmJhNTI4NCAx
MDA2NDQKLS0tIGEvYXJjaC9hcm0vaW5jbHVkZS9hc20veGVuL2h5cGVyY2FsbC5oCisrKyBiL2Fy
Y2gvYXJtL2luY2x1ZGUvYXNtL3hlbi9oeXBlcmNhbGwuaApAQCAtMSArMSw1IEBACisjaWZuZGVm
IF9BU01fQVJNX1hFTl9IWVBFUkNBTExfSAorI2RlZmluZSBfQVNNX0FSTV9YRU5fSFlQRVJDQUxM
X0gKICNpbmNsdWRlIDx4ZW4vYXJtL2h5cGVyY2FsbC5oPgorCisjZW5kaWYgLyogX0FTTV9BUk1f
WEVOX0hZUEVSQ0FMTF9IICovCmRpZmYgLS1naXQgYS9hcmNoL2FybTY0L2luY2x1ZGUvYXNtL3hl
bi9oeXBlcmNhbGwuaCBiL2FyY2gvYXJtNjQvaW5jbHVkZS9hc20veGVuL2h5cGVyY2FsbC5oCmlu
ZGV4IDM1MjJjYmFlZDMxNi4uYzMxOThmOWNjZDJlIDEwMDY0NAotLS0gYS9hcmNoL2FybTY0L2lu
Y2x1ZGUvYXNtL3hlbi9oeXBlcmNhbGwuaAorKysgYi9hcmNoL2FybTY0L2luY2x1ZGUvYXNtL3hl
bi9oeXBlcmNhbGwuaApAQCAtMSArMSw1IEBACisjaWZuZGVmIF9BU01fQVJNNjRfWEVOX0hZUEVS
Q0FMTF9ICisjZGVmaW5lIF9BU01fQVJNNjRfWEVOX0hZUEVSQ0FMTF9ICiAjaW5jbHVkZSA8eGVu
L2FybS9oeXBlcmNhbGwuaD4KKworI2VuZGlmIC8qIF9BU01fQVJNNjRfWEVOX0hZUEVSQ0FMTF9I
ICovCmRpZmYgLS1naXQgYS9pbmNsdWRlL3hlbi9hcm0vaHlwZXJjYWxsLmggYi9pbmNsdWRlL3hl
bi9hcm0vaHlwZXJjYWxsLmgKaW5kZXggYjQwNDg1ZTU0ZDgwLi5iYWJjYzA4YWY5NjUgMTAwNjQ0
Ci0tLSBhL2luY2x1ZGUveGVuL2FybS9oeXBlcmNhbGwuaAorKysgYi9pbmNsdWRlL3hlbi9hcm0v
aHlwZXJjYWxsLmgKQEAgLTMwLDggKzMwLDggQEAKICAqIElOIFRIRSBTT0ZUV0FSRS4KICAqLwog
Ci0jaWZuZGVmIF9BU01fQVJNX1hFTl9IWVBFUkNBTExfSAotI2RlZmluZSBfQVNNX0FSTV9YRU5f
SFlQRVJDQUxMX0gKKyNpZm5kZWYgX0FSTV9YRU5fSFlQRVJDQUxMX0gKKyNkZWZpbmUgX0FSTV9Y
RU5fSFlQRVJDQUxMX0gKIAogI2luY2x1ZGUgPGxpbnV4L2J1Zy5oPgogCkBAIC04OCw0ICs4OCw0
IEBAIE1VTFRJX21tdV91cGRhdGUoc3RydWN0IG11bHRpY2FsbF9lbnRyeSAqbWNsLCBzdHJ1Y3Qg
bW11X3VwZGF0ZSAqcmVxLAogCUJVRygpOwogfQogCi0jZW5kaWYgLyogX0FTTV9BUk1fWEVOX0hZ
UEVSQ0FMTF9IICovCisjZW5kaWYgLyogX0FSTV9YRU5fSFlQRVJDQUxMX0ggKi8KLS0gCjIuMjQu
MAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
