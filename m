Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 384FF12FA1C
	for <lists+xen-devel@lfdr.de>; Fri,  3 Jan 2020 17:11:29 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1inPVi-0005T7-CE; Fri, 03 Jan 2020 16:09:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=fV2H=2Y=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1inPVg-0005Sk-Kd
 for xen-devel@lists.xenproject.org; Fri, 03 Jan 2020 16:09:12 +0000
X-Inumbo-ID: 5a81d460-2e43-11ea-a914-bc764e2007e4
Received: from mail-wm1-x342.google.com (unknown [2a00:1450:4864:20::342])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5a81d460-2e43-11ea-a914-bc764e2007e4;
 Fri, 03 Jan 2020 16:09:00 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id a5so8826475wmb.0
 for <xen-devel@lists.xenproject.org>; Fri, 03 Jan 2020 08:09:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gvmWC2BuiVkIzJZx/luRPH2eJYAdGqz17W1cKVo4/9M=;
 b=pQCRr8JYbHc7z9/csugoZ8r2OsoJObDGeZwtWzlm+h4/c56uBeSnh2etlJafkCPZ/k
 90cEuhNz5dmd9UUM6UmfMn9AlXONJl45NDU9lYTznVM4Gc+KadRd2TI7iq+jruWZqPIF
 SS1N8rVo+iZL4r538feNOwxOegTND+yqqJVzIX7VBUxIrsBS7qEu/gKCl7TuaaXco3Uz
 9ie6elVpSt+0fTWv10wNOm9PmIhNOMyN31JMNyY/dJDBA7man20O0EzE7Oxgas0CJWFC
 bkyLtb2Qm2d38F9vIqTxYbHiJERf2j3X2zn/LjqaAs5bbvus4zJ5FNZla124FETzRIdM
 l0Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=gvmWC2BuiVkIzJZx/luRPH2eJYAdGqz17W1cKVo4/9M=;
 b=q6tqBR0sM+FGO2ZzEGf+Yt7wGsJjeU2kuVkLbuhkv46zswKJpuwstckEEzII9Rd10j
 RnpYNmC22SWYtp9SluaTqDqusb+xVwCKvaQRpkZ1AwmpZRLeG5rLNaevjfre3Trgy7Q7
 EsLUbCd/gVgURmTnUBT/AFNn6Rl0zg7PCJLMF8ChfU5bJbmiM/0IRxjBN0K0WoyF++iM
 TvvVWLo/8FfeqIQ1GVe+573Ks+it24724la5CDcEfGovPrPdzylq+yqmxQhqk/S67l9E
 rxktubvDGVYOrxNfTJ6Pt3daUsNjvHBm7JumbFUuBdAz49GYTJENwIE7DCQubjETsa+Q
 i8WQ==
X-Gm-Message-State: APjAAAV4kxoGDNvsCfXIWoUXcfn4RVQp/exL4iHxECo6zJsVfsqlkTck
 iw1ZgBShDyauH80/46Y/h1hHWPcGXgRjGA==
X-Google-Smtp-Source: APXvYqxXGcegu67DdeDDmrIBAqf0He81OqI/mFhZxL9RUkqd15Px0MdQG+NXibrZluj6waOysHZFFg==
X-Received: by 2002:a05:600c:409:: with SMTP id
 q9mr20365834wmb.19.1578067740002; 
 Fri, 03 Jan 2020 08:09:00 -0800 (PST)
Received: from localhost.localdomain (38.163.200.146.dyn.plus.net.
 [146.200.163.38])
 by smtp.gmail.com with ESMTPSA id z11sm61000235wrt.82.2020.01.03.08.08.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jan 2020 08:08:59 -0800 (PST)
From: Wei Liu <wl@xen.org>
X-Google-Original-From: Wei Liu <liuwe@microsoft.com>
To: Xen Development List <xen-devel@lists.xenproject.org>
Date: Fri,  3 Jan 2020 16:08:20 +0000
Message-Id: <20200103160825.19377-4-liuwe@microsoft.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200103160825.19377-1-liuwe@microsoft.com>
References: <20200103160825.19377-1-liuwe@microsoft.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v2 3/8] x86: rename guest/hypercall.h to
 guest/xen-hypercall.h
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
 Paul Durrant <paul@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Michael Kelley <mikelley@microsoft.com>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

V2Ugd2lsbCBwcm92aWRlIGEgaGVhZGVyIGZpbGUgZm9yIEh5cGVyLVYgaHlwZXJjYWxscy4KCk5v
IGZ1bmN0aW9uYWwgY2hhbmdlLgoKU2lnbmVkLW9mZi1ieTogV2VpIExpdSA8bGl1d2VAbWljcm9z
b2Z0LmNvbT4KUmV2aWV3ZWQtYnk6IFBhdWwgRHVycmFudCA8cGF1bEB4ZW4ub3JnPgotLS0KIHhl
bi9pbmNsdWRlL2FzbS14ODYvZ3Vlc3QuaCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
fCAyICstCiB4ZW4vaW5jbHVkZS9hc20teDg2L2d1ZXN0L3toeXBlcmNhbGwuaCA9PiB4ZW4taHlw
ZXJjYWxsLmh9IHwgMiArLQogMiBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVs
ZXRpb25zKC0pCiByZW5hbWUgeGVuL2luY2x1ZGUvYXNtLXg4Ni9ndWVzdC97aHlwZXJjYWxsLmgg
PT4geGVuLWh5cGVyY2FsbC5ofSAoOTklKQoKZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRlL2FzbS14
ODYvZ3Vlc3QuaCBiL3hlbi9pbmNsdWRlL2FzbS14ODYvZ3Vlc3QuaAppbmRleCA5NDQ0ODYwNmQ0
Li43ZjA5YzY0M2Q0IDEwMDY0NAotLS0gYS94ZW4vaW5jbHVkZS9hc20teDg2L2d1ZXN0LmgKKysr
IGIveGVuL2luY2x1ZGUvYXNtLXg4Ni9ndWVzdC5oCkBAIC0xOSwxMSArMTksMTEgQEAKICNpZm5k
ZWYgX19YODZfR1VFU1RfSF9fCiAjZGVmaW5lIF9fWDg2X0dVRVNUX0hfXwogCi0jaW5jbHVkZSA8
YXNtL2d1ZXN0L2h5cGVyY2FsbC5oPgogI2luY2x1ZGUgPGFzbS9ndWVzdC9oeXBlcnYuaD4KICNp
bmNsdWRlIDxhc20vZ3Vlc3QvaHlwZXJ2aXNvci5oPgogI2luY2x1ZGUgPGFzbS9ndWVzdC9wdmgt
Ym9vdC5oPgogI2luY2x1ZGUgPGFzbS9ndWVzdC94ZW4uaD4KKyNpbmNsdWRlIDxhc20vZ3Vlc3Qv
eGVuLWh5cGVyY2FsbC5oPgogI2luY2x1ZGUgPGFzbS9wdi9zaGltLmg+CiAKICNlbmRpZiAvKiBf
X1g4Nl9HVUVTVF9IX18gKi8KZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRlL2FzbS14ODYvZ3Vlc3Qv
aHlwZXJjYWxsLmggYi94ZW4vaW5jbHVkZS9hc20teDg2L2d1ZXN0L3hlbi1oeXBlcmNhbGwuaApz
aW1pbGFyaXR5IGluZGV4IDk5JQpyZW5hbWUgZnJvbSB4ZW4vaW5jbHVkZS9hc20teDg2L2d1ZXN0
L2h5cGVyY2FsbC5oCnJlbmFtZSB0byB4ZW4vaW5jbHVkZS9hc20teDg2L2d1ZXN0L3hlbi1oeXBl
cmNhbGwuaAppbmRleCBkMGQyZjUwMjJkLi42ODFkM2FlY2Q3IDEwMDY0NAotLS0gYS94ZW4vaW5j
bHVkZS9hc20teDg2L2d1ZXN0L2h5cGVyY2FsbC5oCisrKyBiL3hlbi9pbmNsdWRlL2FzbS14ODYv
Z3Vlc3QveGVuLWh5cGVyY2FsbC5oCkBAIC0xLDUgKzEsNSBAQAogLyoqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKgotICogYXNtLXg4Ni9ndWVzdC9oeXBlcmNhbGwuaAorICogYXNtLXg4Ni9ndWVzdC94ZW4t
aHlwZXJjYWxsLmgKICAqCiAgKiBUaGlzIHByb2dyYW0gaXMgZnJlZSBzb2Z0d2FyZTsgeW91IGNh
biByZWRpc3RyaWJ1dGUgaXQgYW5kL29yCiAgKiBtb2RpZnkgaXQgdW5kZXIgdGhlIHRlcm1zIGFu
ZCBjb25kaXRpb25zIG9mIHRoZSBHTlUgR2VuZXJhbCBQdWJsaWMKLS0gCjIuMjAuMQoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
