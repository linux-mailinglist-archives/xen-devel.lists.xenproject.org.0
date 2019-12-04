Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE30411381D
	for <lists+xen-devel@lfdr.de>; Thu,  5 Dec 2019 00:24:17 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1icdxW-00018u-49; Wed, 04 Dec 2019 23:21:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=cR3Y=Z2=soleen.com=pasha.tatashin@srs-us1.protection.inumbo.net>)
 id 1icdxU-00018O-Bf
 for xen-devel@lists.xenproject.org; Wed, 04 Dec 2019 23:21:24 +0000
X-Inumbo-ID: c0956e24-16ec-11ea-9c09-bc764e2007e4
Received: from mail-qk1-x742.google.com (unknown [2607:f8b0:4864:20::742])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c0956e24-16ec-11ea-9c09-bc764e2007e4;
 Wed, 04 Dec 2019 23:21:08 +0000 (UTC)
Received: by mail-qk1-x742.google.com with SMTP id d124so1665286qke.6
 for <xen-devel@lists.xenproject.org>; Wed, 04 Dec 2019 15:21:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=soleen.com; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=cJGBuyv8MEIEHzLn/Uzof9JuYF+NT8m3hWWPuvSYlYo=;
 b=Cqr2IaSkSM3+ylTz/1+aa0wyv0GTLmyzuvfeKqJdPU6Ym61dE8ilpQ/o6O3zLo76yG
 yWs4zxmVduoS9thvdX42Qhy/yXxpxLqmowjGfyNWNr2CrS0btzvUZX1xjS5/NQKuKc9m
 09+5SGckvzu6mOOsgNPtOpMxLWPdDl8+PqcmsBcfflKtmm4meriKJKjLOG29yS1QWciV
 0Wcks1MLbJb1W3cxbNWfbO8w7CCl3rfq/IVgDaUT9y3uk+unlYn3uMSIPYga04jFVfkX
 ZrVptH6pK0eqeK+rnhBPLi9SvwE1cFLa6IaeQSpSBwJircBHJEjEs6Y3XEWblHYg0XxR
 IQmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cJGBuyv8MEIEHzLn/Uzof9JuYF+NT8m3hWWPuvSYlYo=;
 b=gVHRdP689vA8B/2+RNm3EgiNvGovxB2ik0PJ3ks78n2Rb4wRxNBb/KWWG7UOcrwMzv
 KZGSLRmNv6C6HVTIHf0RG2IqMyAJch1N+dMw/7LFiAaEeEiC6Z1DiUfwggSmxKnXiFnS
 J/h7OsUhxVXifoJXLgm8KmYlhJ5T5C5/AC6cvsa2cpy62jaKZuH090a9YdWCN5+wqbSl
 ZwEqHCeabuMkQsj9AmRNMJgdCjRSr9m4EupfBnGWE/HHhSqMqMuxLZZll/SG2s78u2ZR
 MEZsfvMsyeIdhdPU83HS3Ff9l4xhNLgDZieS58l9GuwbNKxWWeUCd1zoOnjO12ooD1SF
 M6Jw==
X-Gm-Message-State: APjAAAXQMewsQOnat4TBt40Hn5pnVxIxxj4eCN4xvgUB2cP7LVXa9yoX
 0574yei03vX15eZaSDhoPHChrg==
X-Google-Smtp-Source: APXvYqyIMm2ogNBIfOvl3Mqg4T1YApxStKZp5KMJvJR//w2WVxMty/nhPiOLBe4oOlxwY24OIF3FHA==
X-Received: by 2002:ae9:e115:: with SMTP id g21mr53454qkm.187.1575501668421;
 Wed, 04 Dec 2019 15:21:08 -0800 (PST)
Received: from localhost.localdomain (c-73-69-118-222.hsd1.nh.comcast.net.
 [73.69.118.222])
 by smtp.gmail.com with ESMTPSA id t38sm4667864qta.78.2019.12.04.15.21.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Dec 2019 15:21:07 -0800 (PST)
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
Date: Wed,  4 Dec 2019 18:20:56 -0500
Message-Id: <20191204232058.2500117-5-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191204232058.2500117-1-pasha.tatashin@soleen.com>
References: <20191204232058.2500117-1-pasha.tatashin@soleen.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v4 4/6] arm64: remove __asm_flush_icache_range
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
YXJjaC9hcm02NC9pbmNsdWRlL2FzbS9jYWNoZWZsdXNoLmgKaW5kZXggNDMxZjhkYTJkZDAyLi5l
YTU2MzM0NGI0YWQgMTAwNjQ0Ci0tLSBhL2FyY2gvYXJtNjQvaW5jbHVkZS9hc20vY2FjaGVmbHVz
aC5oCisrKyBiL2FyY2gvYXJtNjQvaW5jbHVkZS9hc20vY2FjaGVmbHVzaC5oCkBAIC02MSw3ICs2
MSw2IEBACiAgKgkJLSBrYWRkciAgLSBwYWdlIGFkZHJlc3MKICAqCQktIHNpemUgICAtIHJlZ2lv
biBzaXplCiAgKi8KLWV4dGVybiB2b2lkIF9fYXNtX2ZsdXNoX2ljYWNoZV9yYW5nZSh1bnNpZ25l
ZCBsb25nIHN0YXJ0LCB1bnNpZ25lZCBsb25nIGVuZCk7CiBleHRlcm4gbG9uZyBfX2FzbV9mbHVz
aF9jYWNoZV91c2VyX3JhbmdlKHVuc2lnbmVkIGxvbmcgc3RhcnQsCiAJCQkJCSB1bnNpZ25lZCBs
b25nIGVuZCk7CiBleHRlcm4gaW50ICBfX2FzbV9pbnZhbGlkYXRlX2ljYWNoZV9yYW5nZSh1bnNp
Z25lZCBsb25nIHN0YXJ0LApAQCAtODMsOSArODIsNyBAQCBzdGF0aWMgaW5saW5lIHZvaWQgX19m
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
IAoyLjI0LjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
