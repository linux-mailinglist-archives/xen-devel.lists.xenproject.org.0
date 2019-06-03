Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 801E333AA6
	for <lists+xen-devel@lfdr.de>; Tue,  4 Jun 2019 00:03:38 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hXv1X-0003Mi-HL; Mon, 03 Jun 2019 22:01:47 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=RTL5=UC=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hXv1V-0003Mb-J4
 for xen-devel@lists.xenproject.org; Mon, 03 Jun 2019 22:01:45 +0000
X-Inumbo-ID: 2ca66417-864b-11e9-8980-bc764e045a96
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 2ca66417-864b-11e9-8980-bc764e045a96;
 Mon, 03 Jun 2019 22:01:44 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A2B3C26D60;
 Mon,  3 Jun 2019 22:01:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1559599303;
 bh=FHq3N8t78k+DkKONsz3v2+II+4mtGHgRmONIP5MUGkk=;
 h=Date:From:To:cc:Subject:From;
 b=sbUNQvFt0DooVX4ULBQ7nMAwjhZMuSwHBCMXSuRStNy/V/9D8T0TV50LuffiV/ahZ
 eRpkdr5R8Si0QB74Huhq8FWUmmhfRUOl0jTRw+y1QRGkrsOF2nJK7UJXyahRq8ZORt
 2hkQKxOdeXOYKFGJWbqBuZHAUH5qlXxpQWQBdifw=
Date: Mon, 3 Jun 2019 15:01:43 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: xen-devel@lists.xenproject.org
Message-ID: <alpine.DEB.2.21.1906031456390.14041@sstabellini-ThinkPad-T480s>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v3 0/3] PDX fixes
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
Cc: julien.grall@arm.com, sstabellini@kernel.org, JBeulich@suse.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgYWxsLAoKVGhpcyBzZXJpZXMgaXMgYSBzbWFsbCBjb2xsZWN0aW9uIG9mIFBEWCBmaXhlcy4g
VGhleSBhcmUgdGVjaG5pY2FsbHkKaW5kZXBlbmRlbnQgYnV0IGRpc2NvdmVyZWQgdG9nZXRoZXIg
dHJ5aW5nIHRvIHVuZGVyc3RhbmQgdGhlIG1lbW9yeQp3YXN0ZSBjYXVzZWQgYnkgdGhlIGZyYW1l
dGFibGUgYWxsb2NhdGlvbiBvbiBYaWxpbnggWnlucU1QLgoKQ2hlZXJzLAoKU3RlZmFubwoKClRo
ZSBmb2xsb3dpbmcgY2hhbmdlcyBzaW5jZSBjb21taXQgODQ0YWEwYTEzZDM0ZTlhMzQxYTgzNzQx
MTlkMmVkNjdkNGRjZDZiYjoKCiAgc2NoZWRfbnVsbDogc3VwZXJmaWNpYWwgY2xlYW4tdXBzICgy
MDE5LTA2LTAzIDE3OjU2OjIwICswMjAwKQoKYXJlIGF2YWlsYWJsZSBpbiB0aGUgR2l0IHJlcG9z
aXRvcnkgYXQ6CgogIGh0dHA6Ly94ZW5iaXRzLnhlbnByb2plY3Qub3JnL2dpdC1odHRwL3Blb3Bs
ZS9zc3RhYmVsbGluaS94ZW4tdW5zdGFibGUuZ2l0IAoKZm9yIHlvdSB0byBmZXRjaCBjaGFuZ2Vz
IHVwIHRvIGM5MmY1ODllN2NmNjZmYzljM2FkOGE4MTJjZGJjNjkyMTRhODEyZDE6CgogIHhlbi9h
cm06IGZpeCBtYXNrIGNhbGN1bGF0aW9uIGluIHBkeF9pbml0X21hc2sgKDIwMTktMDYtMDMgMTQ6
NDI6MTAgLTA3MDApCgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tClN0ZWZhbm8gU3RhYmVsbGluaSAoMyk6CiAgICAgIHhlbi9h
cm06IGZpeCBucl9wZHhzIGNhbGN1bGF0aW9uCiAgICAgIHhlbjogYWN0dWFsbHkgc2tpcCB0aGUg
Zmlyc3QgTUFYX09SREVSIGJpdHMgaW4gcGZuX3BkeF9ob2xlX3NldHVwCiAgICAgIHhlbi9hcm06
IGZpeCBtYXNrIGNhbGN1bGF0aW9uIGluIHBkeF9pbml0X21hc2sKCiB4ZW4vYXJjaC9hcm0vbW0u
YyAgICB8ICA0ICsrLS0KIHhlbi9hcmNoL2FybS9zZXR1cC5jIHwgIDkgKysrKysrKystCiB4ZW4v
Y29tbW9uL3BkeC5jICAgICB8IDE0ICsrKysrKysrKysrLS0tCiAzIGZpbGVzIGNoYW5nZWQsIDIx
IGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0pCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
