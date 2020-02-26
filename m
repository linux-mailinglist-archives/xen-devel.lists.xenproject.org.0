Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 35D18170245
	for <lists+xen-devel@lfdr.de>; Wed, 26 Feb 2020 16:23:45 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j6yUc-0001Au-NK; Wed, 26 Feb 2020 15:20:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=RfmG=4O=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1j6yUb-0001Ao-N2
 for xen-devel@lists.xenproject.org; Wed, 26 Feb 2020 15:20:57 +0000
X-Inumbo-ID: 9672249c-58ab-11ea-aba8-bc764e2007e4
Received: from mail-qt1-x842.google.com (unknown [2607:f8b0:4864:20::842])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9672249c-58ab-11ea-aba8-bc764e2007e4;
 Wed, 26 Feb 2020 15:20:57 +0000 (UTC)
Received: by mail-qt1-x842.google.com with SMTP id v25so2484321qto.7
 for <xen-devel@lists.xenproject.org>; Wed, 26 Feb 2020 07:20:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lygCv0fXeRA8hLfYhPykOOLRebIgfRLYlOPXtqIcsWk=;
 b=RHmDNteOlXSU6OHAFYOZ/9CR346ldplcfXkIjlwa+1onSg+RiDDAujlgu/Jp60AlmQ
 aQBJSBRkI4lnLX0+lM6P1j0Phv5qUBNiTsKzTWcHLqTiNRdhbYnp1PMLUm3ErzG3+LBq
 EaOVswD7Ah/NqWnbtbegQNCz/EGbbWHTI/XABBzwls252l02Wj3N8YOF0TCOItgj9brU
 ZjrMOxqZHzhlXYNH3w2TbUFDD8pl7PwaV9UO6ud7KW4lNqgTY58PEzeSa95kUSCA0aek
 mM4vTyexUKmZpP4ZWWC9xH9aAXdgmxtVPc4uJT7UjEH/xZsR4ViDbamKVCu6s1Y2cwhE
 g+tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lygCv0fXeRA8hLfYhPykOOLRebIgfRLYlOPXtqIcsWk=;
 b=Z/THKy94ca4R0UXxhq63ljUzU5Lz6kZfwo1hXnkYoy+YWKAHDxpuEeAz8rf7LUDRFm
 LWWP3WHMZVgJPcbYEaqOOQkUyosnIJnqZJSxhUAhilelkThxhJUos5dxDcKSiipLSwHN
 /WdAwK9NJgw0tklo3/+91iCkf2VffGSdc8wsOSxMyznDJiczgpyfT/bwxVPTU5dUQtyn
 5PLPz/8xyL4aYv8S4AR+CarWb1K7tTDc5n6/PTslMJINKdjb0canuMcYhYBFh+SQEbR8
 UzaORNBkibXOUPT10g9yV1B6TLuUyuQu12+x9gIeyH3vDL2zByv6tP3OwQ065Rr8C9lx
 cWZQ==
X-Gm-Message-State: APjAAAWO+C7PNNH3XOW5JyboTQhseSNeP0ciE3p6MLFEFo8KknmBfvqJ
 f/xbk4/L6RdHqzt9BGcTiwohIRoL
X-Google-Smtp-Source: APXvYqy60CO4ZMzSohLAXfZS9PCwcJYwNKm//tr3S7l65LFbTZ9Imic4Yr+HQkHenpRIAuUfRqKuBg==
X-Received: by 2002:ac8:4711:: with SMTP id f17mr5404744qtp.160.1582730456832; 
 Wed, 26 Feb 2020 07:20:56 -0800 (PST)
Received: from pm2-ws13.praxislan02.com ([2001:470:8:67e:ba27:ebff:fee8:ce27])
 by smtp.gmail.com with ESMTPSA id
 q196sm327187qke.80.2020.02.26.07.20.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Feb 2020 07:20:56 -0800 (PST)
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Date: Wed, 26 Feb 2020 10:20:12 -0500
Message-Id: <20200226152013.12200-2-jandryuk@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200226152013.12200-1-jandryuk@gmail.com>
References: <20200226152013.12200-1-jandryuk@gmail.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 1/2] tools/helpers: Introduce cmp-fd-file-inode
 utility
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
Cc: Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>,
 Jason Andryuk <jandryuk@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhpcyBpcyBhIEMgaW1wbGVtZW50YXRpb24gb2YgdGhlIHBlcmwgY29kZSBpbnNpZGUgb2YgbG9j
a2luZy5zaCB0bwpjaGVjayB0aGF0IHRoZSBsb2NrZWQgZmlsZSBkZXNjcmlwdG9yIGFuZCBsb2Nr
IGZpbGUgc2hhcmUgdGhlIHNhbWUgaW5vZGUKYW5kIHRoZXJlZm9yZSBtYXRjaC4gIE9uZSBjaGFu
Z2UgZnJvbSB0aGUgcGVybCB2ZXJzaW9uIGlzIHJlcGxhY2luZwpwcmludGluZyAieSIgb24gc3Vj
Y2VzcyB3aXRoIGV4aXQgdmFsdWVzIG9mIDAgKHNoZWxsIFRydWUpIGFuZCAxIChzaGVsbApGYWxz
ZSkuCgpSZXF1aXJpbmcgcGVybCBpcyBhIGxhcmdlIGRlcGVuZGVuY3kgZm9yIHRoZSBzaW5nbGUg
dXNlLCBzbyBhIGRlZGljYXRlZAp1dGlsaXR5IHJlbW92ZXMgdGhhdCBkZXBlbmRlbmN5IGZvciBz
eXN0ZW1zIHRoYXQgb3RoZXJ3aXNlIHdvdWxkIG5vdAppbnN0YWxsIHBlcmwuCgpTaWduZWQtb2Zm
LWJ5OiBKYXNvbiBBbmRyeXVrIDxqYW5kcnl1a0BnbWFpbC5jb20+Ci0tLQogLmdpdGlnbm9yZSAg
ICAgICAgICAgICAgICAgICAgICAgIHwgIDEgKwogdG9vbHMvaGVscGVycy9NYWtlZmlsZSAgICAg
ICAgICAgIHwgIDMgKysrCiB0b29scy9oZWxwZXJzL2NtcC1mZC1maWxlLWlub2RlLmMgfCA0MyAr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCiAzIGZpbGVzIGNoYW5nZWQsIDQ3IGluc2Vy
dGlvbnMoKykKIGNyZWF0ZSBtb2RlIDEwMDY0NCB0b29scy9oZWxwZXJzL2NtcC1mZC1maWxlLWlu
b2RlLmMKCmRpZmYgLS1naXQgYS8uZ2l0aWdub3JlIGIvLmdpdGlnbm9yZQppbmRleCA0Y2E2Nzlk
ZGJjLi44OTdmODc4ZWVmIDEwMDY0NAotLS0gYS8uZ2l0aWdub3JlCisrKyBiLy5naXRpZ25vcmUK
QEAgLTE2NCw2ICsxNjQsNyBAQCB0b29scy9mdXp6L3g4Nl9pbnN0cnVjdGlvbl9lbXVsYXRvci94
ODYtZW11bGF0ZS5bY2hdCiB0b29scy9oZWxwZXJzL19wYXRocy5oCiB0b29scy9oZWxwZXJzL2lu
aXQteGVuc3RvcmUtZG9tYWluCiB0b29scy9oZWxwZXJzL3hlbi1pbml0LWRvbTAKK3Rvb2xzL2hl
bHBlcnMvY21wLWZkLWZpbGUtaW5vZGUKIHRvb2xzL2hvdHBsdWcvY29tbW9uL2hvdHBsdWdwYXRo
LnNoCiB0b29scy9ob3RwbHVnL0ZyZWVCU0QvcmMuZC94ZW5jb21tb25zCiB0b29scy9ob3RwbHVn
L0ZyZWVCU0QvcmMuZC94ZW5kcml2ZXJkb21haW4KZGlmZiAtLWdpdCBhL3Rvb2xzL2hlbHBlcnMv
TWFrZWZpbGUgYi90b29scy9oZWxwZXJzL01ha2VmaWxlCmluZGV4IGY3NTk1MjgzMjIuLjdkYWY1
YzQ2Y2EgMTAwNjQ0Ci0tLSBhL3Rvb2xzL2hlbHBlcnMvTWFrZWZpbGUKKysrIGIvdG9vbHMvaGVs
cGVycy9NYWtlZmlsZQpAQCAtOCw2ICs4LDcgQEAgaW5jbHVkZSAkKFhFTl9ST09UKS90b29scy9S
dWxlcy5tawogUFJPR1MgKz0geGVuLWluaXQtZG9tMAogaWZlcSAoJChDT05GSUdfTGludXgpLHkp
CiBQUk9HUyArPSBpbml0LXhlbnN0b3JlLWRvbWFpbgorUFJPR1MgKz0gY21wLWZkLWZpbGUtaW5v
ZGUKIGVuZGlmCiAKIFhFTl9JTklUX0RPTTBfT0JKUyA9IHhlbi1pbml0LWRvbTAubyBpbml0LWRv
bS1qc29uLm8KQEAgLTQwLDEyICs0MSwxNCBAQCBpbnN0YWxsOiBhbGwKIAkkKElOU1RBTExfUFJP
RykgeGVuLWluaXQtZG9tMCAkKERFU1RESVIpJChMSUJFWEVDX0JJTikKIGlmZXEgKCQoQ09ORklH
X0xpbnV4KSx5KQogCSQoSU5TVEFMTF9QUk9HKSBpbml0LXhlbnN0b3JlLWRvbWFpbiAkKERFU1RE
SVIpJChMSUJFWEVDX0JJTikKKwkkKElOU1RBTExfUFJPRykgY21wLWZkLWZpbGUtaW5vZGUgJChE
RVNURElSKSQoTElCRVhFQ19CSU4pCiBlbmRpZgogCiAuUEhPTlk6IHVuaW5zdGFsbAogdW5pbnN0
YWxsOgogaWZlcSAoJChDT05GSUdfTGludXgpLHkpCiAJcm0gLWYgJChERVNURElSKSQoTElCRVhF
Q19CSU4pL2luaXQteGVuc3RvcmUtZG9tYWluCisJcm0gLWYgJChERVNURElSKSQoTElCRVhFQ19C
SU4pL2NtcC1mZC1maWxlLWlub2RlCiBlbmRpZgogCXJtIC1mICQoREVTVERJUikkKExJQkVYRUNf
QklOKS94ZW4taW5pdC1kb20wCiAKZGlmZiAtLWdpdCBhL3Rvb2xzL2hlbHBlcnMvY21wLWZkLWZp
bGUtaW5vZGUuYyBiL3Rvb2xzL2hlbHBlcnMvY21wLWZkLWZpbGUtaW5vZGUuYwpuZXcgZmlsZSBt
b2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMDAwLi44ODZlYTg4OGVkCi0tLSAvZGV2L251bGwKKysr
IGIvdG9vbHMvaGVscGVycy9jbXAtZmQtZmlsZS1pbm9kZS5jCkBAIC0wLDAgKzEsNDMgQEAKKyNp
bmNsdWRlIDxzdGRpby5oPgorI2luY2x1ZGUgPHN0ZGxpYi5oPgorI2luY2x1ZGUgPHN5cy90eXBl
cy5oPgorI2luY2x1ZGUgPHN5cy9zdGF0Lmg+CisjaW5jbHVkZSA8dW5pc3RkLmg+CisKK3ZvaWQg
dXNhZ2UoY29uc3QgY2hhciAqIHByb2cpCit7CisgICAgZnByaW50ZihzdGRlcnIsCisiJXMgPGZk
PiA8ZmlsZW5hbWU+XG4iCisiQ2hlY2tzIHRoYXQgdGhlIG9wZW4gZmlsZSBkZXNjcmlwdG9yIChy
ZWZlcmVuY2VkIGJ5IG51bWJlcikgaGFzIHRoZSBzYW1lXG4iCisiaW5vZGUgYXMgdGhlIGZpbGVu
YW1lLlxuIgorIlJldHVybnMgMCBvbiBtYXRjaCBhbmQgMSBvbiBub24tbWF0Y2hcbiIsIHByb2cp
OworfQorCitpbnQgbWFpbihpbnQgYXJnYywgY2hhciAqYXJndltdKQoreworICAgIHN0cnVjdCBz
dGF0IGZkX3N0YXRidWYsIGZpbGVfc3RhdGJ1ZjsKKyAgICBpbnQgcmV0OworICAgIGludCBmZDsK
KworICAgIGlmIChhcmdjIDwgMykgeworICAgICAgICB1c2FnZShhcmd2WzBdKTsKKyAgICAgICAg
cmV0dXJuIDE7CisgICAgfQorCisgICAgZmQgPSBzdHJ0b3VsKGFyZ3ZbMV0sIE5VTEwsIDApOwor
CisgICAgcmV0ID0gZnN0YXQoZmQsICZmZF9zdGF0YnVmKTsKKyAgICBpZiAocmV0KSB7CisgICAg
ICAgIHJldHVybiAxOworICAgIH0KKworICAgIHJldCA9IHN0YXQoYXJndlsyXSwgJmZpbGVfc3Rh
dGJ1Zik7CisgICAgaWYgKHJldCkgeworICAgICAgICByZXR1cm4gMTsKKyAgICB9CisKKyAgICBp
ZiAoZmRfc3RhdGJ1Zi5zdF9pbm8gPT0gZmlsZV9zdGF0YnVmLnN0X2lubykKKyAgICAgICAgcmV0
dXJuIDA7CisgICAgZWxzZQorICAgICAgICByZXR1cm4gMTsKK30KLS0gCjIuMjQuMQoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
