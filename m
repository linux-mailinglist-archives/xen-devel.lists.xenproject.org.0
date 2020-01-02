Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EA84D12EB29
	for <lists+xen-devel@lfdr.de>; Thu,  2 Jan 2020 22:17:16 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1in7nT-0001Ay-18; Thu, 02 Jan 2020 21:14:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=XNPw=2X=soleen.com=pasha.tatashin@srs-us1.protection.inumbo.net>)
 id 1in7nR-0001Ae-NB
 for xen-devel@lists.xenproject.org; Thu, 02 Jan 2020 21:14:21 +0000
X-Inumbo-ID: d02843ce-2da4-11ea-b6f1-bc764e2007e4
Received: from mail-qv1-xf43.google.com (unknown [2607:f8b0:4864:20::f43])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d02843ce-2da4-11ea-b6f1-bc764e2007e4;
 Thu, 02 Jan 2020 21:14:07 +0000 (UTC)
Received: by mail-qv1-xf43.google.com with SMTP id f16so15499077qvi.4
 for <xen-devel@lists.xenproject.org>; Thu, 02 Jan 2020 13:14:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=soleen.com; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references;
 bh=DSu775/r8r2Tkmehdmqp98rpWAvc+FGMQ75JxAM97Qk=;
 b=OrYEDSt9+5eRFaPFkWqZfdDPoX8oBOMKWIx5RN37UsN5RKyL+QI/bFCjKt/9bYqTwb
 cGAKt4VFDzZWzGI8HGRlHNOOm51h9iKkmHQLaQ+ZGeK0srrJ9d1XGb/S8Iur7VBkcQxI
 MyCi32PMGR+VJwl5o/HPoHX+4mEo6v21yZPg0Yozv/0f4RoeG/gKdK1GTUm1zsmp1IzG
 Oij+HSsTiiV/BYAwNB6O6q5MrhW0WnE1lSlIG0HBRmZTt/xuarTCeW5+SFsx5RxgQYpN
 EROSSyM7QLIWulE8Z34ge0x3MEAOAjIJngvTC8mpdtwXVyRogdKoqDe3A2BMBnsEiOqS
 bEOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references;
 bh=DSu775/r8r2Tkmehdmqp98rpWAvc+FGMQ75JxAM97Qk=;
 b=G+rjT3N01IKCMbCzEehj1ksylW4JdpwJ6XB+E3whKApRLs1Gat7G94zNtTvk2yzJMS
 WOhqPmXyfKEFgV4pypbaW34E8GlmBjHv8p28PFT2j9aqOA9mfyctRP622rWIf+4Vqokq
 zFLpsRf6Vil8AD6y5aNLJs3pCUhHElImJ7pBobBpWgP7El0TyiNqGlF+hEtN/4oBA/pT
 SVuQzGr5d9twVON5h7vAs/IO8X0EGmW/g3HYJu5iLMY+odLMIboyiWFvrtH3SHIyYCqF
 W4cL18n5gzvjBvb0h+IsWqfeyvTWIUVKVMLLJn/mhTkL7Qp5y1Jvq8YSnd8XWcsiiujr
 BZlA==
X-Gm-Message-State: APjAAAX4gY5xIP6lELEqWmqzsjLnKc78slt6JbL5MwTSJ6BrKQ9KpAkm
 c2ZG+N0zukTl3EZNeoiK6/ZFOmU8wXU=
X-Google-Smtp-Source: APXvYqwxDCRcHnwDHHB6fG/rrbyOkgBibEXX240FPR8z4mLL8J0UkjGCVHk+Ow7I/qMA/mj7d2MLrg==
X-Received: by 2002:a05:6214:146e:: with SMTP id
 c14mr65985808qvy.82.1577999647488; 
 Thu, 02 Jan 2020 13:14:07 -0800 (PST)
Received: from localhost.localdomain (c-73-69-118-222.hsd1.nh.comcast.net.
 [73.69.118.222])
 by smtp.gmail.com with ESMTPSA id f97sm17384185qtb.18.2020.01.02.13.14.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jan 2020 13:14:06 -0800 (PST)
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
Date: Thu,  2 Jan 2020 16:13:55 -0500
Message-Id: <20200102211357.8042-5-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200102211357.8042-1-pasha.tatashin@soleen.com>
References: <20200102211357.8042-1-pasha.tatashin@soleen.com>
Subject: [Xen-devel] [PATCH v5 4/6] arm64: remove __asm_flush_icache_range
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

X19hc21fZmx1c2hfaWNhY2hlX3JhbmdlIGlzIGFuIGFsaWFzIHRvIF9fYXNtX2ZsdXNoX2NhY2hl
X3VzZXJfcmFuZ2UsCmJ1dCBub3cgdGhhdCB0aGVzZSBmdW5jdGlvbnMgYXJlIGNhbGxlZCBmcm9t
IEMgd3JhcHBlcnMgdGhlIGZhbGwKdGhyb3VnaCBjYW4gaW5zdGVhZCBiZSBkb25lIGF0IGEgaGln
aGVyIGxldmVsLgoKUmVtb3ZlIHRoZSBfX2FzbV9mbHVzaF9pY2FjaGVfcmFuZ2UgYWxpYXMgaW4g
YXNzZW1ibHksIGFuZCBpbnN0ZWFkIGNhbGwKX19mbHVzaF9jYWNoZV91c2VyX3JhbmdlKCkgZnJv
bSBfX2ZsdXNoX2ljYWNoZV9yYW5nZSgpLgoKU2lnbmVkLW9mZi1ieTogUGF2ZWwgVGF0YXNoaW4g
PHBhc2hhLnRhdGFzaGluQHNvbGVlbi5jb20+Ci0tLQogYXJjaC9hcm02NC9pbmNsdWRlL2FzbS9j
YWNoZWZsdXNoLmggfCAgNSArLS0tLQogYXJjaC9hcm02NC9tbS9jYWNoZS5TICAgICAgICAgICAg
ICAgfCAxNCAtLS0tLS0tLS0tLS0tLQogYXJjaC9hcm02NC9tbS9mbHVzaC5jICAgICAgICAgICAg
ICAgfCAgMiArLQogMyBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDE5IGRlbGV0aW9u
cygtKQoKZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQvaW5jbHVkZS9hc20vY2FjaGVmbHVzaC5oIGIv
YXJjaC9hcm02NC9pbmNsdWRlL2FzbS9jYWNoZWZsdXNoLmgKaW5kZXggY2IwMGM2MWUwYmRlLi4w
NDdhZjMzOGJhMTUgMTAwNjQ0Ci0tLSBhL2FyY2gvYXJtNjQvaW5jbHVkZS9hc20vY2FjaGVmbHVz
aC5oCisrKyBiL2FyY2gvYXJtNjQvaW5jbHVkZS9hc20vY2FjaGVmbHVzaC5oCkBAIC02MSw3ICs2
MSw2IEBACiAgKgkJLSBrYWRkciAgLSBwYWdlIGFkZHJlc3MKICAqCQktIHNpemUgICAtIHJlZ2lv
biBzaXplCiAgKi8KLWV4dGVybiB2b2lkIF9fYXNtX2ZsdXNoX2ljYWNoZV9yYW5nZSh1bnNpZ25l
ZCBsb25nIHN0YXJ0LCB1bnNpZ25lZCBsb25nIGVuZCk7CiBleHRlcm4gbG9uZyBfX2FzbV9mbHVz
aF9jYWNoZV91c2VyX3JhbmdlKHVuc2lnbmVkIGxvbmcgc3RhcnQsCiAJCQkJCSB1bnNpZ25lZCBs
b25nIGVuZCk7CiBleHRlcm4gaW50ICBfX2FzbV9pbnZhbGlkYXRlX2ljYWNoZV9yYW5nZSh1bnNp
Z25lZCBsb25nIHN0YXJ0LApAQCAtODcsOSArODYsNyBAQCBzdGF0aWMgaW5saW5lIGxvbmcgX19m
bHVzaF9jYWNoZV91c2VyX3JhbmdlKHVuc2lnbmVkIGxvbmcgc3RhcnQsCiAKIHN0YXRpYyBpbmxp
bmUgdm9pZCBfX2ZsdXNoX2ljYWNoZV9yYW5nZSh1bnNpZ25lZCBsb25nIHN0YXJ0LCB1bnNpZ25l
ZCBsb25nIGVuZCkKIHsKLQl1YWNjZXNzX3R0YnIwX2VuYWJsZSgpOwotCV9fYXNtX2ZsdXNoX2lj
YWNoZV9yYW5nZShzdGFydCwgZW5kKTsKLQl1YWNjZXNzX3R0YnIwX2Rpc2FibGUoKTsKKwlfX2Zs
dXNoX2NhY2hlX3VzZXJfcmFuZ2Uoc3RhcnQsIGVuZCk7CiB9CiAKIHN0YXRpYyBpbmxpbmUgaW50
IGludmFsaWRhdGVfaWNhY2hlX3JhbmdlKHVuc2lnbmVkIGxvbmcgc3RhcnQsCmRpZmYgLS1naXQg
YS9hcmNoL2FybTY0L21tL2NhY2hlLlMgYi9hcmNoL2FybTY0L21tL2NhY2hlLlMKaW5kZXggNjAy
YjlhYTg2MDNhLi4xOTgxY2JhZjVkOTIgMTAwNjQ0Ci0tLSBhL2FyY2gvYXJtNjQvbW0vY2FjaGUu
UworKysgYi9hcmNoL2FybTY0L21tL2NhY2hlLlMKQEAgLTE0LDE5ICsxNCw2IEBACiAjaW5jbHVk
ZSA8YXNtL2FsdGVybmF0aXZlLmg+CiAjaW5jbHVkZSA8YXNtL2FzbS11YWNjZXNzLmg+CiAKLS8q
Ci0gKglfX2FzbV9mbHVzaF9pY2FjaGVfcmFuZ2Uoc3RhcnQsZW5kKQotICoKLSAqCUVuc3VyZSB0
aGF0IHRoZSBJIGFuZCBEIGNhY2hlcyBhcmUgY29oZXJlbnQgd2l0aGluIHNwZWNpZmllZCByZWdp
b24uCi0gKglUaGlzIGlzIHR5cGljYWxseSB1c2VkIHdoZW4gY29kZSBoYXMgYmVlbiB3cml0dGVu
IHRvIGEgbWVtb3J5IHJlZ2lvbiwKLSAqCWFuZCB3aWxsIGJlIGV4ZWN1dGVkLgotICoKLSAqCS0g
c3RhcnQgICAtIHZpcnR1YWwgc3RhcnQgYWRkcmVzcyBvZiByZWdpb24KLSAqCS0gZW5kICAgICAt
IHZpcnR1YWwgZW5kIGFkZHJlc3Mgb2YgcmVnaW9uCi0gKi8KLUVOVFJZKF9fYXNtX2ZsdXNoX2lj
YWNoZV9yYW5nZSkKLQkvKiBGQUxMVEhST1VHSCAqLwotCiAvKgogICoJX19hc21fZmx1c2hfY2Fj
aGVfdXNlcl9yYW5nZShzdGFydCxlbmQpCiAgKgpAQCAtNjIsNyArNDksNiBAQCBhbHRlcm5hdGl2
ZV9lbHNlX25vcF9lbmRpZgogMToJcmV0CiA5Ogltb3YJeDAsICMtRUZBVUxUCiAJYgkxYgotRU5E
UFJPQyhfX2FzbV9mbHVzaF9pY2FjaGVfcmFuZ2UpCiBFTkRQUk9DKF9fYXNtX2ZsdXNoX2NhY2hl
X3VzZXJfcmFuZ2UpCiAKIC8qCmRpZmYgLS1naXQgYS9hcmNoL2FybTY0L21tL2ZsdXNoLmMgYi9h
cmNoL2FybTY0L21tL2ZsdXNoLmMKaW5kZXggYjIzZjM0ZDIzZjMxLi42MTUyMTI4NWYyN2QgMTAw
NjQ0Ci0tLSBhL2FyY2gvYXJtNjQvbW0vZmx1c2guYworKysgYi9hcmNoL2FybTY0L21tL2ZsdXNo
LmMKQEAgLTc1LDcgKzc1LDcgQEAgRVhQT1JUX1NZTUJPTChmbHVzaF9kY2FjaGVfcGFnZSk7CiAv
KgogICogQWRkaXRpb25hbCBmdW5jdGlvbnMgZGVmaW5lZCBpbiBhc3NlbWJseS4KICAqLwotRVhQ
T1JUX1NZTUJPTChfX2FzbV9mbHVzaF9pY2FjaGVfcmFuZ2UpOworRVhQT1JUX1NZTUJPTChfX2Fz
bV9mbHVzaF9jYWNoZV91c2VyX3JhbmdlKTsKIAogI2lmZGVmIENPTkZJR19BUkNIX0hBU19QTUVN
X0FQSQogdm9pZCBhcmNoX3diX2NhY2hlX3BtZW0odm9pZCAqYWRkciwgc2l6ZV90IHNpemUpCi0t
IAoyLjE3LjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
