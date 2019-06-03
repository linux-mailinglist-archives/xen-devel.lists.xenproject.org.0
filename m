Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E0A4533498
	for <lists+xen-devel@lfdr.de>; Mon,  3 Jun 2019 18:08:10 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hXpRg-0002Bk-SN; Mon, 03 Jun 2019 16:04:24 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=fnY6=UC=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hXpRf-0002A3-0D
 for xen-devel@lists.xenproject.org; Mon, 03 Jun 2019 16:04:23 +0000
X-Inumbo-ID: 3ffb4560-8619-11e9-8980-bc764e045a96
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id 3ffb4560-8619-11e9-8980-bc764e045a96;
 Mon, 03 Jun 2019 16:04:21 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9476380D;
 Mon,  3 Jun 2019 09:04:21 -0700 (PDT)
Received: from e108454-lin.cambridge.arm.com (e108454-lin.cambridge.arm.com
 [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3DF273F246;
 Mon,  3 Jun 2019 09:04:20 -0700 (PDT)
From: Julien Grall <julien.grall@arm.com>
To: xen-devel@lists.xenproject.org
Date: Mon,  3 Jun 2019 17:03:48 +0100
Message-Id: <20190603160350.29806-13-julien.grall@arm.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190603160350.29806-1-julien.grall@arm.com>
References: <20190603160350.29806-1-julien.grall@arm.com>
Subject: [Xen-devel] [PATCH v3 12/14] xen/x86: p2m: Rework printk format in
 audit_p2m()
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
Cc: Wei Liu <wl@xen.org>, George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien.grall@arm.com>,
 Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T25lIG9mIHRoZSBwcmludGsgZm9ybWF0IGluIGF1ZGl0X3AybSgpIG1heSBiZSBkaWZmaWN1bHQg
dG8gcmVhZCBhcyBpdAppcyBub3QgY2xlYXIgd2hhdCBpcyB0aGUgZmlyc3QgbnVtYmVyLgoKRnVy
dGhlcm1vcmUsIHRoZSBmb3JtYXQgY2FuIG5vdyB0YWtlIGFkdmFudGFnZSBvZiAlcGQuCgpTaWdu
ZWQtb2ZmLWJ5OiBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPgoKLS0tCiAgICBD
aGFuZ2VzIGluIHYzOgogICAgICAgIC0gUGF0Y2ggYWRkZWQKLS0tCiB4ZW4vYXJjaC94ODYvbW0v
cDJtLmMgfCAzICstLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAyIGRlbGV0aW9u
cygtKQoKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9tbS9wMm0uYyBiL3hlbi9hcmNoL3g4Ni9t
bS9wMm0uYwppbmRleCBlMDNmMGFlNjMwLi4yMDhjMTk2NjY3IDEwMDY0NAotLS0gYS94ZW4vYXJj
aC94ODYvbW0vcDJtLmMKKysrIGIveGVuL2FyY2gveDg2L21tL3AybS5jCkBAIC0yODM4LDggKzI4
MzgsNyBAQCB2b2lkIGF1ZGl0X3AybShzdHJ1Y3QgZG9tYWluICpkLAogCiAgICAgICAgIGlmICgg
b2QgIT0gZCApCiAgICAgICAgIHsKLSAgICAgICAgICAgIFAyTV9QUklOVEsoIndyb25nIG93bmVy
ICUjbHggLT4gJXAoJXUpICE9ICVwKCV1KVxuIiwKLSAgICAgICAgICAgICAgICAgICAgICAgbWZu
LCBvZCwgKG9kP29kLT5kb21haW5faWQ6LTEpLCBkLCBkLT5kb21haW5faWQpOworICAgICAgICAg
ICAgUDJNX1BSSU5USygibWZuICUiUFJJX21mbiIgb3duZXIgJXBkICE9ICVwZFxuIiwgbWZuLCBv
ZCwgZCk7CiAgICAgICAgICAgICBjb250aW51ZTsKICAgICAgICAgfQogCi0tIAoyLjExLjAKCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
