Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8727D17DF96
	for <lists+xen-devel@lfdr.de>; Mon,  9 Mar 2020 13:11:29 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jBHD0-00032e-Ud; Mon, 09 Mar 2020 12:08:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=k1Ob=42=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jBHCy-00032L-Vc
 for xen-devel@lists.xenproject.org; Mon, 09 Mar 2020 12:08:32 +0000
X-Inumbo-ID: b1d0cb88-61fe-11ea-90c4-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b1d0cb88-61fe-11ea-90c4-bc764e2007e4;
 Mon, 09 Mar 2020 12:08:32 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id D2F86AFA0;
 Mon,  9 Mar 2020 12:08:31 +0000 (UTC)
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <e0b6b003-18c6-56a0-f791-1ebd4172f5fc@suse.com>
Message-ID: <44eb87d4-da48-16ca-e1d5-0513dbca2d35@suse.com>
Date: Mon, 9 Mar 2020 13:08:36 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <e0b6b003-18c6-56a0-f791-1ebd4172f5fc@suse.com>
Content-Language: en-US
Subject: [Xen-devel] [PATCH 5/9] x86/HVM: reduce vioapic.h include
 dependencies
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RHJvcCBhbiAjaW5jbHVkZSBub3QgbmVlZGVkIGJ5IHRoZSBoZWFkZXIgaXRzZWxmLiBXaGlsZSB2
ZXJpZnlpbiB0aGUKaGVhZGVyIChub3cpIGJ1aWxkcyBzdGFuZGFsb25lLCBJIG5vdGljZWQgYW4g
b21pc3Npb24gaW4gYSBwdWJsaWMgaGVhZGVyCndoaWNoIGdldHMgdGFrZW4gY2FyZSBvZiBoZXJl
IGFzIHdlbGwuCgpTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+
CgotLS0gYS94ZW4vaW5jbHVkZS9hc20teDg2L2h2bS92aW9hcGljLmgKKysrIGIveGVuL2luY2x1
ZGUvYXNtLXg4Ni9odm0vdmlvYXBpYy5oCkBAIC0yNSw3ICsyNSw2IEBACiAjZGVmaW5lIF9fQVNN
X1g4Nl9IVk1fVklPQVBJQ19IX18KIAogI2luY2x1ZGUgPHhlbi90eXBlcy5oPgotI2luY2x1ZGUg
PHhlbi9zbXAuaD4KICNpbmNsdWRlIDxwdWJsaWMvaHZtL3NhdmUuaD4KIAogI2RlZmluZSBWSU9B
UElDX1ZFUlNJT05fSUQgMHgxMSAvKiBJT0FQSUMgdmVyc2lvbiAqLwotLS0gYS94ZW4vaW5jbHVk
ZS9wdWJsaWMvYXJjaC14ODYvaHZtL3NhdmUuaAorKysgYi94ZW4vaW5jbHVkZS9wdWJsaWMvYXJj
aC14ODYvaHZtL3NhdmUuaApAQCAtMjYsNiArMjYsOCBAQAogI2lmbmRlZiBfX1hFTl9QVUJMSUNf
SFZNX1NBVkVfWDg2X0hfXwogI2RlZmluZSBfX1hFTl9QVUJMSUNfSFZNX1NBVkVfWDg2X0hfXwog
CisjaW5jbHVkZSAiLi4vLi4veGVuLmgiCisKIC8qCiAgKiBTYXZlL3Jlc3RvcmUgaGVhZGVyOiBn
ZW5lcmFsIGluZm8gYWJvdXQgdGhlIHNhdmUgZmlsZS4KICAqLwoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
