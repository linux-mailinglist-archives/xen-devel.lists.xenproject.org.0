Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F2763151AF5
	for <lists+xen-devel@lfdr.de>; Tue,  4 Feb 2020 14:09:31 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iyxuX-0003t6-8T; Tue, 04 Feb 2020 13:06:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=cOUj=3Y=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1iyxuW-0003sz-0g
 for xen-devel@lists.xenproject.org; Tue, 04 Feb 2020 13:06:36 +0000
X-Inumbo-ID: 2b96e990-474f-11ea-b211-bc764e2007e4
Received: from mail-wm1-f65.google.com (unknown [209.85.128.65])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2b96e990-474f-11ea-b211-bc764e2007e4;
 Tue, 04 Feb 2020 13:06:35 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id g1so3216603wmh.4
 for <xen-devel@lists.xenproject.org>; Tue, 04 Feb 2020 05:06:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=I/RYh/2DoPGwgWAaRh2LgcALyP0y0hX0y1FawturjEk=;
 b=LmgU0M8y7aush3VkWh8rrLAnfj7py/v3rPXglq3sr5TXyxKzlasVgVrA+OUxGN1tT6
 HrnceGlUTBeZqZFvBal2FLHXvi33L/AvEtpTaSPh/Cq/WFNy25jwmhwIOl4hXuk1Ztrg
 9fiw0kUJyoa9nJLTOsfSSb617cII+hq3NvfsBgTMVkU/P8SD3UKVVvUl5hQde9AqoZ3p
 A/TR+VPElOZneic7GYZUyEEaNM20YsRjhMpn+Zuo9+4qiuhE9p+vOQEyft7/gJ2DKTc1
 ERhYTXMGiOrsg4T4l9Iedd6BHIYJCmyiGuT3z6lrLyuYYNvbRgeXIrsmsZuXAhsSF/G0
 6wCg==
X-Gm-Message-State: APjAAAXx+oF/P3U7AgC6nUQhjWGdKEQIbO2B+jyCksqRpiBgVKSKqFTf
 lFgLEGCRfN6XKgi5IVFK9TzCNme3FWQ=
X-Google-Smtp-Source: APXvYqwdoxq3HVlJF/Eb+M4IzovaztivEiw82upR0UAE0tPFvW/hp19NimxZk3m9tpdT/5j7sjgh1g==
X-Received: by 2002:a7b:c152:: with SMTP id z18mr5674308wmi.70.1580821594192; 
 Tue, 04 Feb 2020 05:06:34 -0800 (PST)
Received: from ufe34d9ed68d054.ant.amazon.com (54-240-197-235.amazon.com.
 [54.240.197.235])
 by smtp.gmail.com with ESMTPSA id y8sm3624776wma.10.2020.02.04.05.06.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Feb 2020 05:06:33 -0800 (PST)
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Date: Tue,  4 Feb 2020 13:06:14 +0000
Message-Id: <20200204130614.15166-3-julien@xen.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200204130614.15166-1-julien@xen.org>
References: <20200204130614.15166-1-julien@xen.org>
Subject: [Xen-devel] [PATCH v2 2/2] xen/x86: hap: Clean-up and harden
 hap_enable()
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
Cc: julien@xen.org, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <jgrall@amazon.com>,
 Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogSnVsaWVuIEdyYWxsIDxqZ3JhbGxAYW1hem9uLmNvbT4KClVubGlrZSBzaGFkb3dfZW5h
YmxlKCksIGhhcF9lbmFibGUoKSBjYW4gb25seSBiZSBjYWxsZWQgb25jZSBkdXJpbmcKZG9tYWlu
IGNyZWF0aW9uIGFuZCB3aXRoIHRoZSBtb2RlIGVxdWFsIHRvIG1vZGUgZXF1YWwgdG8KUEdfZXh0
ZXJuYWwgfCBQR190cmFuc2xhdGUgfCBQR19yZWZjb3VudHMuCgpJZiBpdCB3ZXJlIGNhbGxlZCB0
d2ljZSwgdGhlbiB3ZSBtaWdodCBoYXZlIHNvbWV0aGluZyBpbnRlcmVzdGluZwpwcm9ibGVtIGFz
IHRoZSBwMm0gdGFibGVzIHdvdWxkIGJlIHJlLWFsbG9jYXRlZCAoYW5kIHRoZXJlZm9yZSBhbGwg
dGhlCm1hcHBpbmdzIHdvdWxkIGJlIGxvc3QpLgoKQWRkIGNvZGUgdG8gc2FuaXR5IGNoZWNrIHRo
ZSBtb2RlIGFuZCB0aGF0IHRoZSBmdW5jdGlvbiBpcyBvbmx5IGNhbGxlZApvbmNlLiBUYWtlIHRo
ZSBvcHBvcnR1bml0eSB0byBhbiBpZiBjaGVja2luZyB0aGF0IFBHX3RyYW5zbGF0ZSBpcyBzZXQu
CgpTaWduZWQtb2ZmLWJ5OiBKdWxpZW4gR3JhbGwgPGpncmFsbEBhbWF6b24uY29tPgoKLS0tCgpJ
dCBpcyBub3QgZW50aXJlbHkgY2xlYXIgd2hlbiBQR190cmFuc2xhdGUgd2FzIGVuZm9yY2VkLgoK
SSBrZWVwIHRoZSBjaGVjayAhPSAwIGJlY2F1c2UgdGhpcyBpcyBjb25zaXN0ZW50IHdpdGggdGhl
IHJlc3Qgb2YgdGhlCmZpbGUuIElmIHdlIHdhbnQgdG8gb21pdCBjb21wYXJpc29uIGFnYWluc3Qg
MCwgdGhlbiB0aGlzIHNob3VsZCBiZSBpbiBhCnNlcGFyYXRlIHBhdGNoZXMgY29udmVydGluZyB0
aGUgZmlsZS4KCiAgICBDaGFuZ2VzIGluIHYyOgogICAgICAgIC0gRml4IHR5cG9lcyBpbiB0aGUg
Y29tbWl0IG1lc3NhZ2UKICAgICAgICAtIFVzZSAtRUVYSVNUIGluc3RlYWQgb2YgLUVJTlZBTAot
LS0KIHhlbi9hcmNoL3g4Ni9tbS9oYXAvaGFwLmMgfCAxOCArKysrKysrKysrKy0tLS0tLS0KIDEg
ZmlsZSBjaGFuZ2VkLCAxMSBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdp
dCBhL3hlbi9hcmNoL3g4Ni9tbS9oYXAvaGFwLmMgYi94ZW4vYXJjaC94ODYvbW0vaGFwL2hhcC5j
CmluZGV4IDMxMzYyYTMxYjYuLjQ5NzRiZDEzZDQgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL3g4Ni9t
bS9oYXAvaGFwLmMKKysrIGIveGVuL2FyY2gveDg2L21tL2hhcC9oYXAuYwpAQCAtNDQ1LDYgKzQ0
NSwxMyBAQCBpbnQgaGFwX2VuYWJsZShzdHJ1Y3QgZG9tYWluICpkLCB1MzIgbW9kZSkKICAgICB1
bnNpZ25lZCBpbnQgaTsKICAgICBpbnQgcnYgPSAwOwogCisgICAgaWYgKCBtb2RlICE9IChQR19l
eHRlcm5hbCB8IFBHX3RyYW5zbGF0ZSB8IFBHX3JlZmNvdW50cykgKQorICAgICAgICByZXR1cm4g
LUVJTlZBTDsKKworICAgIC8qIFRoZSBmdW5jdGlvbiBjYW4gb25seSBiZSBjYWxsZWQgb25jZSAq
LworICAgIGlmICggZC0+YXJjaC5wYWdpbmcubW9kZSAhPSAwICkKKyAgICAgICAgcmV0dXJuIC1F
RVhJU1Q7CisKICAgICBkb21haW5fcGF1c2UoZCk7CiAKICAgICBvbGRfcGFnZXMgPSBkLT5hcmNo
LnBhZ2luZy5oYXAudG90YWxfcGFnZXM7CkBAIC00NjUsMTMgKzQ3MiwxMCBAQCBpbnQgaGFwX2Vu
YWJsZShzdHJ1Y3QgZG9tYWluICpkLCB1MzIgbW9kZSkKICAgICBkLT5hcmNoLnBhZ2luZy5hbGxv
Y19wYWdlID0gaGFwX2FsbG9jX3AybV9wYWdlOwogICAgIGQtPmFyY2gucGFnaW5nLmZyZWVfcGFn
ZSA9IGhhcF9mcmVlX3AybV9wYWdlOwogCi0gICAgLyogYWxsb2NhdGUgUDJtIHRhYmxlICovCi0g
ICAgaWYgKCBtb2RlICYgUEdfdHJhbnNsYXRlICkKLSAgICB7Ci0gICAgICAgIHJ2ID0gcDJtX2Fs
bG9jX3RhYmxlKHAybV9nZXRfaG9zdHAybShkKSk7Ci0gICAgICAgIGlmICggcnYgIT0gMCApCi0g
ICAgICAgICAgICBnb3RvIG91dDsKLSAgICB9CisgICAgLyogYWxsb2NhdGUgUDJNIHRhYmxlICov
CisgICAgcnYgPSBwMm1fYWxsb2NfdGFibGUocDJtX2dldF9ob3N0cDJtKGQpKTsKKyAgICBpZiAo
IHJ2ICE9IDAgKQorICAgICAgICBnb3RvIG91dDsKIAogICAgIGZvciAoIGkgPSAwOyBpIDwgTUFY
X05FU1RFRFAyTTsgaSsrICkKICAgICB7Ci0tIAoyLjE3LjEKCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
