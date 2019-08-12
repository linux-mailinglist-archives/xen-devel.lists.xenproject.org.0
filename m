Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 363A88B038
	for <lists+xen-devel@lfdr.de>; Tue, 13 Aug 2019 08:55:19 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hxQgg-00027e-3a; Tue, 13 Aug 2019 06:53:42 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ZmNG=WJ=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hxQge-000271-WE
 for xen-devel@lists.xenproject.org; Tue, 13 Aug 2019 06:53:41 +0000
X-Inumbo-ID: 8671caf8-bd50-11e9-b16b-6f9be8d9867d
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8671caf8-bd50-11e9-b16b-6f9be8d9867d;
 Mon, 12 Aug 2019 22:28:36 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9BB392067D;
 Mon, 12 Aug 2019 22:28:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1565648915;
 bh=2tnaD+c5Ylw4T9qx3vJRVUsIN4jpNRafwrZYo/+SlG0=;
 h=Date:From:To:cc:Subject:From;
 b=t/a23/IAHSp+015X0KwHUccc4a97UyfJtqP35RMFTjUDoEpW2/NfESU3m3j2zbTdH
 nxv9Ms/iPdJ0FWJM1Jex9tyG/qEOt47ErbJTREH1l/eq9ErmivKAQ61Jvcft73qgvV
 O8yTl8E9YfEo0Bq9PR8GY6Mp0MhhQwPCxIsLLGkQ=
Date: Mon, 12 Aug 2019 15:28:27 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: xen-devel@lists.xenproject.org
Message-ID: <alpine.DEB.2.21.1908121227360.7788@sstabellini-ThinkPad-T480s>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v5 0/7] reserved-memory in dom0
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
Cc: julien.grall@arm.com, sstabellini@kernel.org, Volodymyr_Babchuk@epam.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgYWxsLAoKVGhpcyBwYXRjaCBzZXJpZXMgaW50cm9kdWNlcyBwYXJ0aWFsIHJlc2VydmVkLW1l
bW9yeSBzdXBwb3J0IGZvciBkb20wCm9ubHkgKG5vIGRvbVUgc3VwcG9ydCBmb3IgcmVzZXJ2ZWQt
bWVtb3J5IHlldC4pCgoKVGhlIGZvbGxvd2luZyBjaGFuZ2VzIHNpbmNlIGNvbW1pdCA3NjJiOWEy
ZDk5MGJiYTFmM2FlZmU2NjBjZmYwYzM3YWQyZTM3NWJjOgoKICB4ZW4vcGFnZV9hbGxvYzogS2Vl
cCBhd2F5IE1GTiAwIGZyb20gdGhlIGJ1ZGR5IGFsbG9jYXRvciAoMjAxOS0wOC0wOSAxMToxMjo1
NSAtMDcwMCkKCmFyZSBhdmFpbGFibGUgaW4gdGhlIEdpdCByZXBvc2l0b3J5IGF0OgoKICBodHRw
Oi8veGVuYml0cy54ZW5wcm9qZWN0Lm9yZy9naXQtaHR0cC9wZW9wbGUvc3N0YWJlbGxpbmkveGVu
LXVuc3RhYmxlLmdpdCByZXNlcnZlZC1tZW0tNCAKCmZvciB5b3UgdG8gZmV0Y2ggY2hhbmdlcyB1
cCB0byA3NGQyMDg4ZGJkNzkzNDA5NTg3YTIwZGIxMjRkMDA0ZTk0NGQyM2U4OgoKICB4ZW4vYXJt
OiBhZGQgcmVzZXJ2ZWQtbWVtb3J5IHJlZ2lvbnMgdG8gdGhlIGRvbTAgbWVtb3J5IG5vZGUgKDIw
MTktMDgtMTIgMTI6MjU6NDUgLTA3MDApCgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tClN0ZWZhbm8gU3RhYmVsbGluaSAoNyk6
CiAgICAgIHhlbi9hcm06IHBhc3Mgbm9kZSB0byBkZXZpY2VfdHJlZV9mb3JfZWFjaF9ub2RlCiAg
ICAgIHhlbi9hcm06IG1ha2UgcHJvY2Vzc19tZW1vcnlfbm9kZSBhIGRldmljZV90cmVlX25vZGVf
ZnVuYwogICAgICB4ZW4vYXJtOiBrZWVwIHRyYWNrIG9mIHJlc2VydmVkLW1lbW9yeSByZWdpb25z
CiAgICAgIHhlbi9hcm06IGVhcmx5X3ByaW50X2luZm8gcHJpbnQgcmVzZXJ2ZWRfbWVtCiAgICAg
IHhlbi9hcm06IGhhbmRsZSByZXNlcnZlZC1tZW1vcnkgaW4gY29uc2lkZXJfbW9kdWxlcyBhbmQg
ZHRfdW5yZXNlcnZlZF9yZWdpb25zCiAgICAgIHhlbi9hcm06IGRvbid0IGlvbWVtX3Blcm1pdF9h
Y2Nlc3MgZm9yIHJlc2VydmVkLW1lbW9yeSByZWdpb25zCiAgICAgIHhlbi9hcm06IGFkZCByZXNl
cnZlZC1tZW1vcnkgcmVnaW9ucyB0byB0aGUgZG9tMCBtZW1vcnkgbm9kZQoKIHhlbi9hcmNoL2Fy
bS9hY3BpL2Jvb3QuYyAgICAgIHwgIDggKystLQogeGVuL2FyY2gvYXJtL2Jvb3RmZHQuYyAgICAg
ICAgfCA5NiArKysrKysrKysrKysrKysrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0tCiB4ZW4v
YXJjaC9hcm0vZG9tYWluX2J1aWxkLmMgICB8IDQ2ICsrKysrKysrKysrKysrLS0tLS0tLQogeGVu
L2FyY2gvYXJtL3NldHVwLmMgICAgICAgICAgfCA1MyArKysrKysrKysrKysrKysrKysrKysrLS0K
IHhlbi9pbmNsdWRlL2FzbS1hcm0vc2V0dXAuaCAgIHwgIDEgKwogeGVuL2luY2x1ZGUveGVuL2Rl
dmljZV90cmVlLmggfCAgNiArLS0KIDYgZmlsZXMgY2hhbmdlZCwgMTU3IGluc2VydGlvbnMoKyks
IDUzIGRlbGV0aW9ucygtKQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
