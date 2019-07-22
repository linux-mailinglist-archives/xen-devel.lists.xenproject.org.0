Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C78370B45
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jul 2019 23:26:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hpfkk-0000zT-MH; Mon, 22 Jul 2019 21:21:50 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=MfEy=VT=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hpfkj-0000zO-Is
 for xen-devel@lists.xenproject.org; Mon, 22 Jul 2019 21:21:49 +0000
X-Inumbo-ID: b6639e2d-acc6-11e9-8980-bc764e045a96
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id b6639e2d-acc6-11e9-8980-bc764e045a96;
 Mon, 22 Jul 2019 21:21:48 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D2FAE21955;
 Mon, 22 Jul 2019 21:21:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1563830507;
 bh=oi2LbgP41uYNh56j3VeB5qocyGvsKdlACY3+Oo49onc=;
 h=Date:From:To:cc:Subject:From;
 b=P1+eGF0mH1r2rgx51dx5fVv2UFNkM/0Q9HhK9Iu6I7svs+WDU83odHVm4cyR+h2sr
 2t92GepfEijogPT9HJ8ST8vP/IGKpTlTSLCTrJyBXiiN4E2lTDxEZiuUrAB7+y2XlQ
 JaBxpMGfXodNvtlKg01cEyWIr3z8z6LYsA8UMnmo=
Date: Mon, 22 Jul 2019 14:21:46 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: jgross@suse.com
Message-ID: <alpine.DEB.2.21.1907221341080.31177@sstabellini-ThinkPad-T480s>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: [Xen-devel] [BUG?] limit too low in privcmd-buf.c
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
Cc: xen-devel@lists.xenproject.org, boris.ostrovsky@oracle.com,
 sstabellini@kernel.org, 206497@studenti.unimore.it, marco.solieri@unimore.it
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgSnVlcmdlbiwKCldlIGFyZSB3b3JraW5nIG9uIGEgdGVjaG5vbG9neSB0byBsaW1pdCBjYWNo
ZSBpbnRlcmZlcmVuY2UgYmV0d2VlbgpndWVzdHMgcnVubmluZyBvbiB0aGUgc2FtZSBTb0MuIEl0
IHdvcmtzIHdlbGwsIGJ1dCBhcyBhIGNvbnNlcXVlbmNlLCBhbGwKbWVtb3J5IGFsbG9jYXRpb25z
IGFyZSA0SyBvbmx5OiBoaWdoZXIgZ3JhbnVsYXJpdGllcyAoMk0sIDFHKSBkbyBub3QKd29yayBh
dCBhbGwuCgpPbmUgb2YgdGhlIGlzc3VlcyBJIGFtIHNlZWluZyBhZnRlciB1cGdyYWRpbmcgZG9t
MCBrZXJuZWwgaXMgdGhhdCB0aGUKbGltaXQgaW4gcHJpdmNtZC1idWYuYywgd2hpY2ggaXMgNjQs
IGlzIHRvbyBsb3cuICAoUHJldmlvdXNseSBJIHdhcwp1c2luZyBhbiBvbGQga2VybmVsIHdpdGhv
dXQgcHJpdmNtZC1idWYuYy4pIFRoZSBpc3N1ZSBpcyB0aGF0IEkgY2Fubm90CnN0YXJ0IGEgZ3Vl
c3Qgb2YgMTI4TUIgYmVjYXVzZSBtbWFwIHJldHVybnMgYW4gZXJyb3IsIHNwZWNpZmljYWxseSB0
aGUKZm9sbG93aW5nIGNoZWNrIGluIHByaXZjbWRfYnVmX21tYXA6cHJpdmNtZF9idWZfbW1hcCBm
YWlsczoKCiAgICAgICAgaWYgKCEodm1hLT52bV9mbGFncyAmIFZNX1NIQVJFRCkgfHwgY291bnQg
PiBsaW1pdCB8fAogICAgICAgICAgICBmaWxlX3ByaXYtPmFsbG9jYXRlZCArIGNvdW50ID4gbGlt
aXQpCiAgICAgICAgICAgIHJldHVybiAtRUlOVkFMOwoKVGhlIGNoZWNrIHRvIGZhaWwgaXMgImZp
bGVfcHJpdi0+YWxsb2NhdGVkICsgY291bnQgPiBsaW1pdCIuCgpJbiBteSB0ZXN0cywgbGltaXQg
bmVlZHMgdG8gYmUgcm91Z2hseSBzaW1pbGFyIHRvIHRoZSBhbW91bnQgb2YgTUIgb2YKZ3Vlc3Qg
UkFNIGdpdmVuIHRvIHRoZSBndWVzdC4gRm9yIGV4YW1wbGUsIHdlIHdhbnQgYSBsaW1pdCBvZiA1
MTIgdG8gYmUKYWJsZSB0byBzdGFydCBhIGd1ZXN0IHdpdGggNTEyTUIgb2YgUkFNLgoKRm9yIHRo
ZSBtb21lbnQsIEkgc29sdmVkIHRoZSBwcm9ibGVtIHNpbXBseSBieSBpbmNyZWFzaW5nIHRoZSBs
aW1pdC4KSG93ZXZlciwgSSBkb24ndCBrbm93IGZvciBzdXJlIHdoYXQgdGhlIHJpZ2h0IGxpbWl0
IHdvdWxkIGJlIGFuZCB3aGV0aGVyCml0IGlzIHRoZSByaWdodCB3YXkgdG8gc29sdmUgdGhlIHBy
b2JsZW0uCgpEbyB5b3UgaGF2ZSBhbnkgc3VnZ2VzdGlvbnM/CgpDaGVlcnMsCgpTdGVmYW5vCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
