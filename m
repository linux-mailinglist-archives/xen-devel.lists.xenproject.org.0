Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 081FD12EB23
	for <lists+xen-devel@lfdr.de>; Thu,  2 Jan 2020 22:16:34 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1in7nD-00016y-Ud; Thu, 02 Jan 2020 21:14:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=XNPw=2X=soleen.com=pasha.tatashin@srs-us1.protection.inumbo.net>)
 id 1in7nC-00016r-Mk
 for xen-devel@lists.xenproject.org; Thu, 02 Jan 2020 21:14:06 +0000
X-Inumbo-ID: cce32792-2da4-11ea-88e7-bc764e2007e4
Received: from mail-qt1-x844.google.com (unknown [2607:f8b0:4864:20::844])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id cce32792-2da4-11ea-88e7-bc764e2007e4;
 Thu, 02 Jan 2020 21:14:02 +0000 (UTC)
Received: by mail-qt1-x844.google.com with SMTP id n15so35572493qtp.5
 for <xen-devel@lists.xenproject.org>; Thu, 02 Jan 2020 13:14:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=soleen.com; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references;
 bh=sLfto7pDtwtBpFy7vHWfBkT+4MM0vP3E4VHWVzt8Ru4=;
 b=VXzjqIBLu3/HymaztMnJa4bgYGRIKjuKvwh/j9RPNIJWjpGXOEr1VmGNPSBxUDjp51
 jCJlFgiNVRUfJZn6U40n9Z0YUEOc48bycD7pBbYa3hWgMnBJFiDGV2Zt4MkJ7YLqEtwM
 wGod6fo6QvA9UzKjlu2OU1A8lBDFiz0GoHozfSABoVdIzYWL89usU6RoBoA7YQDG+qny
 vXj8qD2XmnZ493Dr1R7rUb8bOQttoaqcAZD1nEYLr40Axq9CupzdqJcr6CALslZgu0W+
 UGFrW3BmiMeOFLTiiQx1pNqrm7K+5BxUfVnvg1KFLiEbEZnx/1ujngCGiaofoUXqOJKY
 8k5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references;
 bh=sLfto7pDtwtBpFy7vHWfBkT+4MM0vP3E4VHWVzt8Ru4=;
 b=HKkQz8ARJ5TwEXjVORJ5+abCVI/kedE2ZIeTiAMY8XpZGc24yTLRdJShSGG0vp/35x
 LseSeZXbmKAgHlmX/kygUg/6sga56E/FFkJYrI4Div2cv93mhQs9kgB1eCP/wMVv0Ele
 oO46ZhkvO9xwWlyEVmZCYQhXtchT7ioI4KDrnPuzVC4w77O7uT7bJDi1qf08F4/TePdY
 ZekdTAgUmWVtzODagVXpF4uv1bsUeqSpT9bUyP5ZvkHH2hOXKMIFmU21/IHgR4rxCWCx
 uPxXlhchtExIvpP12IY9Ik07DpMrCgfSfNdl8vxwMiw9ZGSjLZdpWXZ1F30Y4heLK9Bx
 KkCA==
X-Gm-Message-State: APjAAAWBFPEcBq+6DgiQR6tlGSgvObuUCpEDkupYlZ/VQCfNpH2e94zS
 ROL1ipZEq/qO1t/EP10S8m3BBg==
X-Google-Smtp-Source: APXvYqxfIYiffLt+0sAKnDiS1/f+cfl6AxYc1/2VA/kOzDQqWA8cYvIwfRewT5+nHZ3IdtFcW1T0QA==
X-Received: by 2002:ac8:5159:: with SMTP id h25mr62711218qtn.249.1577999642118; 
 Thu, 02 Jan 2020 13:14:02 -0800 (PST)
Received: from localhost.localdomain (c-73-69-118-222.hsd1.nh.comcast.net.
 [73.69.118.222])
 by smtp.gmail.com with ESMTPSA id f97sm17384185qtb.18.2020.01.02.13.14.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jan 2020 13:14:01 -0800 (PST)
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
Date: Thu,  2 Jan 2020 16:13:52 -0500
Message-Id: <20200102211357.8042-2-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200102211357.8042-1-pasha.tatashin@soleen.com>
References: <20200102211357.8042-1-pasha.tatashin@soleen.com>
Subject: [Xen-devel] [PATCH v5 1/6] arm/arm64/xen: hypercall.h add includes
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
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlIGFybSBhbmQgYXJtNjQgdmVyc2lvbnMgb2YgaHlwZXJjYWxsLmggYXJlIG1pc3NpbmcgdGhl
IGluY2x1ZGUKZ3VhcmRzLiBUaGlzIGlzIG5lZWRlZCBiZWNhdXNlIEMgaW5saW5lcyBmb3IgcHJp
dmNtZF9jYWxsIGFyZSBnb2luZyB0bwpiZSBhZGRlZCB0byB0aGUgZmlsZXMuCgpTaWduZWQtb2Zm
LWJ5OiBQYXZlbCBUYXRhc2hpbiA8cGFzaGEudGF0YXNoaW5Ac29sZWVuLmNvbT4KUmV2aWV3ZWQt
Ynk6IEp1bGllbiBHcmFsbCA8anVsaWVuQHhlbi5vcmc+Ci0tLQogYXJjaC9hcm0vaW5jbHVkZS9h
c20veGVuL2h5cGVyY2FsbC5oICAgfCA0ICsrKysKIGFyY2gvYXJtNjQvaW5jbHVkZS9hc20veGVu
L2h5cGVyY2FsbC5oIHwgNCArKysrCiBpbmNsdWRlL3hlbi9hcm0vaHlwZXJjYWxsLmggICAgICAg
ICAgICB8IDYgKysrLS0tCiAzIGZpbGVzIGNoYW5nZWQsIDExIGluc2VydGlvbnMoKyksIDMgZGVs
ZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvYXJjaC9hcm0vaW5jbHVkZS9hc20veGVuL2h5cGVyY2Fs
bC5oIGIvYXJjaC9hcm0vaW5jbHVkZS9hc20veGVuL2h5cGVyY2FsbC5oCmluZGV4IDM1MjJjYmFl
ZDMxNi4uYzY4ODJiYmE1Mjg0IDEwMDY0NAotLS0gYS9hcmNoL2FybS9pbmNsdWRlL2FzbS94ZW4v
aHlwZXJjYWxsLmgKKysrIGIvYXJjaC9hcm0vaW5jbHVkZS9hc20veGVuL2h5cGVyY2FsbC5oCkBA
IC0xICsxLDUgQEAKKyNpZm5kZWYgX0FTTV9BUk1fWEVOX0hZUEVSQ0FMTF9ICisjZGVmaW5lIF9B
U01fQVJNX1hFTl9IWVBFUkNBTExfSAogI2luY2x1ZGUgPHhlbi9hcm0vaHlwZXJjYWxsLmg+CisK
KyNlbmRpZiAvKiBfQVNNX0FSTV9YRU5fSFlQRVJDQUxMX0ggKi8KZGlmZiAtLWdpdCBhL2FyY2gv
YXJtNjQvaW5jbHVkZS9hc20veGVuL2h5cGVyY2FsbC5oIGIvYXJjaC9hcm02NC9pbmNsdWRlL2Fz
bS94ZW4vaHlwZXJjYWxsLmgKaW5kZXggMzUyMmNiYWVkMzE2Li5jMzE5OGY5Y2NkMmUgMTAwNjQ0
Ci0tLSBhL2FyY2gvYXJtNjQvaW5jbHVkZS9hc20veGVuL2h5cGVyY2FsbC5oCisrKyBiL2FyY2gv
YXJtNjQvaW5jbHVkZS9hc20veGVuL2h5cGVyY2FsbC5oCkBAIC0xICsxLDUgQEAKKyNpZm5kZWYg
X0FTTV9BUk02NF9YRU5fSFlQRVJDQUxMX0gKKyNkZWZpbmUgX0FTTV9BUk02NF9YRU5fSFlQRVJD
QUxMX0gKICNpbmNsdWRlIDx4ZW4vYXJtL2h5cGVyY2FsbC5oPgorCisjZW5kaWYgLyogX0FTTV9B
Uk02NF9YRU5fSFlQRVJDQUxMX0ggKi8KZGlmZiAtLWdpdCBhL2luY2x1ZGUveGVuL2FybS9oeXBl
cmNhbGwuaCBiL2luY2x1ZGUveGVuL2FybS9oeXBlcmNhbGwuaAppbmRleCBiNDA0ODVlNTRkODAu
LmJhYmNjMDhhZjk2NSAxMDA2NDQKLS0tIGEvaW5jbHVkZS94ZW4vYXJtL2h5cGVyY2FsbC5oCisr
KyBiL2luY2x1ZGUveGVuL2FybS9oeXBlcmNhbGwuaApAQCAtMzAsOCArMzAsOCBAQAogICogSU4g
VEhFIFNPRlRXQVJFLgogICovCiAKLSNpZm5kZWYgX0FTTV9BUk1fWEVOX0hZUEVSQ0FMTF9ICi0j
ZGVmaW5lIF9BU01fQVJNX1hFTl9IWVBFUkNBTExfSAorI2lmbmRlZiBfQVJNX1hFTl9IWVBFUkNB
TExfSAorI2RlZmluZSBfQVJNX1hFTl9IWVBFUkNBTExfSAogCiAjaW5jbHVkZSA8bGludXgvYnVn
Lmg+CiAKQEAgLTg4LDQgKzg4LDQgQEAgTVVMVElfbW11X3VwZGF0ZShzdHJ1Y3QgbXVsdGljYWxs
X2VudHJ5ICptY2wsIHN0cnVjdCBtbXVfdXBkYXRlICpyZXEsCiAJQlVHKCk7CiB9CiAKLSNlbmRp
ZiAvKiBfQVNNX0FSTV9YRU5fSFlQRVJDQUxMX0ggKi8KKyNlbmRpZiAvKiBfQVJNX1hFTl9IWVBF
UkNBTExfSCAqLwotLSAKMi4xNy4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
