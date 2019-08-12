Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 44D828A49F
	for <lists+xen-devel@lfdr.de>; Mon, 12 Aug 2019 19:33:29 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hxE9d-0006qh-CG; Mon, 12 Aug 2019 17:30:45 +0000
Received: from [172.99.69.81] (helo=us1-rack-iad1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=dIXR=WI=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hxE9b-0006oz-Lm
 for xen-devel@lists.xenproject.org; Mon, 12 Aug 2019 17:30:43 +0000
X-Inumbo-ID: e911ec08-bd26-11e9-984b-bf171714a9dd
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id e911ec08-bd26-11e9-984b-bf171714a9dd;
 Mon, 12 Aug 2019 17:30:42 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A2A8515AB;
 Mon, 12 Aug 2019 10:30:42 -0700 (PDT)
Received: from e108454-lin.cambridge.arm.com (e108454-lin.cambridge.arm.com
 [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F09C13F706;
 Mon, 12 Aug 2019 10:30:41 -0700 (PDT)
From: Julien Grall <julien.grall@arm.com>
To: xen-devel@lists.xenproject.org
Date: Mon, 12 Aug 2019 18:30:08 +0100
Message-Id: <20190812173019.11956-18-julien.grall@arm.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190812173019.11956-1-julien.grall@arm.com>
References: <20190812173019.11956-1-julien.grall@arm.com>
Subject: [Xen-devel] [PATCH v3 17/28] xen/arm32: head: Document enable_mmu()
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

RG9jdW1lbnQgdGhlIGJlaGF2aW9yIGFuZCB0aGUgbWFpbiByZWdpc3RlcnMgdXNhZ2Ugd2l0aGlu
IGVuYWJsZV9tbXUoKS4KClNpZ25lZC1vZmYtYnk6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxs
QGFybS5jb20+ClJldmlld2VkLWJ5OiBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtl
cm5lbC5vcmc+CgotLS0KICAgIENoYW5nZXMgaW4gdjM6CiAgICAgICAgLSBBZGQgU3RlZmFubydz
IGFja2VkLWJ5CgogICAgQ2hhbmdlcyBpbiB2MjoKICAgICAgICAtIFBhdGNoIGFkZGVkCi0tLQog
eGVuL2FyY2gvYXJtL2FybTMyL2hlYWQuUyB8IDcgKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDcg
aW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9hcm0zMi9oZWFkLlMgYi94
ZW4vYXJjaC9hcm0vYXJtMzIvaGVhZC5TCmluZGV4IDgzZjg3NzRlMmEuLmY4NjAzMDUxZTQgMTAw
NjQ0Ci0tLSBhL3hlbi9hcmNoL2FybS9hcm0zMi9oZWFkLlMKKysrIGIveGVuL2FyY2gvYXJtL2Fy
bTMyL2hlYWQuUwpAQCAtNDIzLDYgKzQyMywxMyBAQCB2aXJ0cGh5c19jbGFzaDoKICAgICAgICAg
YiAgICAgZmFpbAogRU5EUFJPQyhjcmVhdGVfcGFnZV90YWJsZXMpCiAKKy8qCisgKiBUdXJuIG9u
IHRoZSBEYXRhIENhY2hlIGFuZCB0aGUgTU1VLiBUaGUgZnVuY3Rpb24gd2lsbCByZXR1cm4gb24g
dGhlIDE6MQorICogbWFwcGluZy4gSW4gb3RoZXIgd29yZCwgdGhlIGNhbGxlciBpcyByZXNwb25z
aWJsZSB0byBzd2l0Y2ggdG8gdGhlIHJ1bnRpbWUKKyAqIG1hcHBpbmcuCisgKgorICogQ2xvYmJl
cnMgcjAgLSByMworICovCiBlbmFibGVfbW11OgogICAgICAgICBQUklOVCgiLSBUdXJuaW5nIG9u
IHBhZ2luZyAtXHJcbiIpCiAKLS0gCjIuMTEuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
