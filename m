Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D016770BCD
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jul 2019 23:42:56 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hpg2m-0002rY-0D; Mon, 22 Jul 2019 21:40:28 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=SK1b=VT=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hpg2k-0002ox-Hh
 for xen-devel@lists.xenproject.org; Mon, 22 Jul 2019 21:40:26 +0000
X-Inumbo-ID: 4ff350d8-acc9-11e9-ab9d-9ba8a994a9dd
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 4ff350d8-acc9-11e9-ab9d-9ba8a994a9dd;
 Mon, 22 Jul 2019 21:40:24 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D901F1509;
 Mon, 22 Jul 2019 14:40:23 -0700 (PDT)
Received: from e108454-lin.cambridge.arm.com (e108454-lin.cambridge.arm.com
 [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 32BBC3F71F;
 Mon, 22 Jul 2019 14:40:23 -0700 (PDT)
From: Julien Grall <julien.grall@arm.com>
To: xen-devel@lists.xenproject.org
Date: Mon, 22 Jul 2019 22:39:43 +0100
Message-Id: <20190722213958.5761-21-julien.grall@arm.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190722213958.5761-1-julien.grall@arm.com>
References: <20190722213958.5761-1-julien.grall@arm.com>
Subject: [Xen-devel] [PATCH v2 20/35] xen/arm32: head: Mark the end of
 subroutines with ENDPROC
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
Cc: Julien Grall <julien.grall@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

cHV0bigpIGFuZCBwdXRzKCkgYXJlIHR3byBzdWJyb3V0aW5lcy4gQWRkIEVORFBST0MgZm9yIHRo
ZSBiZW5lZml0cyBvZgpzdGF0aWMgYW5hbHlzaXMgdG9vbHMgYW5kIHRoZSByZWFkZXIuCgpTaWdu
ZWQtb2ZmLWJ5OiBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPgoKLS0tCiAgICBD
aGFuZ2VzIGluIHYyOgogICAgICAgIC0gUGF0Y2ggYWRkZWQKLS0tCiB4ZW4vYXJjaC9hcm0vYXJt
MzIvaGVhZC5TIHwgMiArKwogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQoKZGlmZiAt
LWdpdCBhL3hlbi9hcmNoL2FybS9hcm0zMi9oZWFkLlMgYi94ZW4vYXJjaC9hcm0vYXJtMzIvaGVh
ZC5TCmluZGV4IDk5ZjRhZjE4ZDguLjhiNGM4YTQ3MTQgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL2Fy
bS9hcm0zMi9oZWFkLlMKKysrIGIveGVuL2FyY2gvYXJtL2FybTMyL2hlYWQuUwpAQCAtNTE4LDYg
KzUxOCw3IEBAIHB1dHM6CiAgICAgICAgIG1vdmVxIHBjLCBscgogICAgICAgICBlYXJseV91YXJ0
X3RyYW5zbWl0IHIxMSwgcjEKICAgICAgICAgYiBwdXRzCitFTkRQUk9DKHB1dHMpCiAKIC8qCiAg
KiBQcmludCBhIDMyLWJpdCBudW1iZXIgaW4gaGV4LiAgU3BlY2lmaWMgdG8gdGhlIFBMMDExIFVB
UlQuCkBAIC01MzcsNiArNTM4LDcgQEAgcHV0bjoKICAgICAgICAgc3VicyAgcjMsIHIzLCAjMQog
ICAgICAgICBibmUgICAxYgogICAgICAgICBtb3YgICBwYywgbHIKK0VORFBST0MocHV0bikKIAog
aGV4OiAgICAuYXNjaWkgIjAxMjM0NTY3ODlhYmNkZWYiCiAgICAgICAgIC5hbGlnbiAyCi0tIAoy
LjExLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
