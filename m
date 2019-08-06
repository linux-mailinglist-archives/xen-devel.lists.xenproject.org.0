Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B94383CF3
	for <lists+xen-devel@lfdr.de>; Tue,  6 Aug 2019 23:52:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hv7Kb-0000kq-5o; Tue, 06 Aug 2019 21:49:21 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=/mMd=WC=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hv7KZ-0000kj-5x
 for xen-devel@lists.xenproject.org; Tue, 06 Aug 2019 21:49:19 +0000
X-Inumbo-ID: 0a181623-b894-11e9-8980-bc764e045a96
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 0a181623-b894-11e9-8980-bc764e045a96;
 Tue, 06 Aug 2019 21:49:17 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 20DF1216F4;
 Tue,  6 Aug 2019 21:49:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1565128157;
 bh=ynu8ojFi9YTbdVWO8PLVOvPR0Ms+YcHSk19tI9UnZBI=;
 h=Date:From:To:cc:Subject:From;
 b=mIY9HkLJ7PeQJn9z6GiedepHf0VhWAoMbPp18lZK6lpDiPyS9dZCD8kolzoHNhNr6
 34+ksTxAeRoeW56ZsQcxNRInamPdoaLHFyMbjCODYzrPOf3zTPec7YtWkH8xTOhmG5
 c+fU3vqMyLDNvrFPOON0uwDpc5qyoJxXeCcJbCcw=
Date: Tue, 6 Aug 2019 14:49:16 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: xen-devel@lists.xenproject.org
Message-ID: <alpine.DEB.2.21.1908061428420.2451@sstabellini-ThinkPad-T480s>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v4 0/7] reserved-memory in dom0
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
Cc: julien.grall@arm.com, sstabellini@kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgYWxsLAoKVGhpcyBwYXRjaCBzZXJpZXMgaW50cm9kdWNlcyBwYXJ0aWFsIHJlc2VydmVkLW1l
bW9yeSBzdXBwb3J0IGZvciBkb20wCm9ubHkgKG5vIGRvbVUgc3VwcG9ydCBmb3IgcmVzZXJ2ZWQt
bWVtb3J5IHlldC4pCgoKVGhlIGZvbGxvd2luZyBjaGFuZ2VzIHNpbmNlIGNvbW1pdCA0NWNlNWI4
NzQ5YTIyMGFkN2M0Y2U1ZDVlYmE3YzIwMWE5NDE4MDc4OgoKICBtbTogU2FmZSB0byBjbGVhciBQ
R0NfYWxsb2NhdGVkIG9uIHhlbmhlYXAgcGFnZXMgd2l0aG91dCBhbiBleHRyYSByZWZlcmVuY2Ug
KDIwMTktMDgtMDYgMTI6MTk6NTUgKzAxMDApCgphcmUgYXZhaWxhYmxlIGluIHRoZSBHaXQgcmVw
b3NpdG9yeSBhdDoKCiAgaHR0cDovL3hlbmJpdHMueGVucHJvamVjdC5vcmcvZ2l0LWh0dHAvcGVv
cGxlL3NzdGFiZWxsaW5pL3hlbi11bnN0YWJsZS5naXQgcmVzZXJ2ZWQtbWVtLTIKCmZvciB5b3Ug
dG8gZmV0Y2ggY2hhbmdlcyB1cCB0byBiM2IyMGM5ODdmZTUzMWY3MDZmZTUwZGJhNWU3NDljM2Ni
MzA2YjNmOgoKICB4ZW4vYXJtOiBhZGQgcmVzZXJ2ZWQtbWVtb3J5IHJlZ2lvbnMgdG8gdGhlIGRv
bTAgbWVtb3J5IG5vZGUgKDIwMTktMDgtMDYgMTQ6MzY6MTQgLTA3MDApCgotLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tClN0ZWZh
bm8gU3RhYmVsbGluaSAoNyk6CiAgICAgIHhlbi9hcm06IGV4dGVuZCBkZXZpY2VfdHJlZV9mb3Jf
ZWFjaF9ub2RlCiAgICAgIHhlbi9hcm06IG1ha2UgcHJvY2Vzc19tZW1vcnlfbm9kZSBhIGRldmlj
ZV90cmVlX25vZGVfZnVuYwogICAgICB4ZW4vYXJtOiBrZWVwIHRyYWNrIG9mIHJlc2VydmVkLW1l
bW9yeSByZWdpb25zCiAgICAgIHhlbi9hcm06IGVhcmx5X3ByaW50X2luZm8gcHJpbnQgcmVzZXJ2
ZWRfbWVtCiAgICAgIHhlbi9hcm06IGhhbmRsZSByZXNlcnZlZC1tZW1vcnkgaW4gY29uc2lkZXJf
bW9kdWxlcyBhbmQgZHRfdW5yZXNlcnZlZF9yZWdpb25zCiAgICAgIHhlbi9hcm06IGRvbid0IGlv
bWVtX3Blcm1pdF9hY2Nlc3MgZm9yIHJlc2VydmVkLW1lbW9yeSByZWdpb25zCiAgICAgIHhlbi9h
cm06IGFkZCByZXNlcnZlZC1tZW1vcnkgcmVnaW9ucyB0byB0aGUgZG9tMCBtZW1vcnkgbm9kZQoK
IHhlbi9hcmNoL2FybS9hY3BpL2Jvb3QuYyAgICAgIHwgIDIgKy0KIHhlbi9hcmNoL2FybS9ib290
ZmR0LmMgICAgICAgIHwgOTQgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrLS0tLS0t
LS0tLQogeGVuL2FyY2gvYXJtL2RvbWFpbl9idWlsZC5jICAgfCA0NiArKysrKysrKysrKysrKy0t
LS0tLS0KIHhlbi9hcmNoL2FybS9zZXR1cC5jICAgICAgICAgIHwgNTMgKysrKysrKysrKysrKysr
KysrKysrKy0tCiB4ZW4vaW5jbHVkZS9hc20tYXJtL3NldHVwLmggICB8ICAxICsKIHhlbi9pbmNs
dWRlL3hlbi9kZXZpY2VfdHJlZS5oIHwgIDYgKystCiA2IGZpbGVzIGNoYW5nZWQsIDE2MCBpbnNl
cnRpb25zKCspLCA0MiBkZWxldGlvbnMoLSkKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
