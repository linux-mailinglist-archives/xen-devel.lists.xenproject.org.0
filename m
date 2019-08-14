Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CC89E8CFD2
	for <lists+xen-devel@lfdr.de>; Wed, 14 Aug 2019 11:39:43 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hxphZ-0001lw-H3; Wed, 14 Aug 2019 09:36:17 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=gPVK=WK=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hxphY-0001lr-87
 for xen-devel@lists.xenproject.org; Wed, 14 Aug 2019 09:36:16 +0000
X-Inumbo-ID: f41718d4-be76-11e9-8d56-7fd98633b014
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id f41718d4-be76-11e9-8d56-7fd98633b014;
 Wed, 14 Aug 2019 09:36:12 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EFD54344;
 Wed, 14 Aug 2019 02:36:11 -0700 (PDT)
Received: from e108454-lin.cambridge.arm.com (e108454-lin.cambridge.arm.com
 [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4A11F3F694;
 Wed, 14 Aug 2019 02:36:11 -0700 (PDT)
From: Julien Grall <julien.grall@arm.com>
To: xen-devel@lists.xenproject.org
Date: Wed, 14 Aug 2019 10:36:07 +0100
Message-Id: <20190814093607.22927-1-julien.grall@arm.com>
X-Mailer: git-send-email 2.11.0
Subject: [Xen-devel] [PATCH] xen/arm: traps: Remove all zero padding before
 PRIregister format
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

Q29tbWl0IGFmMTU2ZmYwODUgInhlbi9hcm06IHR5cGVzOiBTcGVjaWZ5IHRoZSB6ZXJvIHBhZGRp
bmcgaW4gdGhlCmRlZmluaXRpb24gb2YgUFJJcmVnaXN0ZXIiIG1vdmVkIHRoZSB6ZXJvIHBhZGRp
bmcgd2l0aGluIHRoZSBkZWZpbml0aW9uCm9mIFBSSXJlZ2lzdGVyLgoKSG93ZXZlciwgc29tZSBv
ZiB0aGUgdXNlcnMgc3RpbGwgaGFkIHplcm8gcGFkZGluZyBiZWZvcmUgd2hpY2ggcmVzdWx0CnRv
IHByaW50IHRlbnMgb2YgemVybyB3aGVuIGR1bXBpbmcgdGhlIENQVSBzdGF0ZS4KClRvIHByZXZl
bnQgdGhpcywgcmVtb3ZlIHRoZSBsYXN0IHVzZXJzIG9mIHplcm8gcGFkZGluZyBiZWZvcmUKUFJJ
cmVnaXN0ZXIuCgpTaWduZWQtb2ZmLWJ5OiBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0u
Y29tPgotLS0KIHhlbi9hcmNoL2FybS90cmFwcy5jIHwgNCArKy0tCiAxIGZpbGUgY2hhbmdlZCwg
MiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2Fy
bS90cmFwcy5jIGIveGVuL2FyY2gvYXJtL3RyYXBzLmMKaW5kZXggZjA2MmFlNmY2YS4uYTNiOTYx
YmQwNiAxMDA2NDQKLS0tIGEveGVuL2FyY2gvYXJtL3RyYXBzLmMKKysrIGIveGVuL2FyY2gvYXJt
L3RyYXBzLmMKQEAgLTkzOCw3ICs5MzgsNyBAQCBzdGF0aWMgdm9pZCBfc2hvd19yZWdpc3RlcnMo
Y29uc3Qgc3RydWN0IGNwdV91c2VyX3JlZ3MgKnJlZ3MsCiAgICAgcHJpbnRrKCIgVFRCUjBfRUwy
OiAlMDE2IlBSSXg2NCJcbiIsIFJFQURfU1lTUkVHNjQoVFRCUjBfRUwyKSk7CiAgICAgcHJpbnRr
KCJcbiIpOwogICAgIHByaW50aygiICAgRVNSX0VMMjogJTA4IlBSSXgzMiJcbiIsIHJlZ3MtPmhz
cik7Ci0gICAgcHJpbnRrKCIgSFBGQVJfRUwyOiAlMDE2IlBSSXJlZ2lzdGVyIlxuIiwgUkVBRF9T
WVNSRUcoSFBGQVJfRUwyKSk7CisgICAgcHJpbnRrKCIgSFBGQVJfRUwyOiAlIlBSSXJlZ2lzdGVy
IlxuIiwgUkVBRF9TWVNSRUcoSFBGQVJfRUwyKSk7CiAKICNpZmRlZiBDT05GSUdfQVJNXzMyCiAg
ICAgcHJpbnRrKCIgICAgIEhERkFSOiAlMDgiUFJJeDMyIlxuIiwgUkVBRF9DUDMyKEhERkFSKSk7
CkBAIC0xNzU5LDcgKzE3NTksNyBAQCB2b2lkIGR1bXBfZ3Vlc3RfczFfd2FsayhzdHJ1Y3QgZG9t
YWluICpkLCB2YWRkcl90IGFkZHIpCiAgICAgbWZuID0gZ2ZuX3RvX21mbihkLCBnYWRkcl90b19n
Zm4odHRicjApKTsKIAogICAgIHByaW50aygiZG9tJWQgVkEgMHglMDgiUFJJdmFkZHIiXG4iLCBk
LT5kb21haW5faWQsIGFkZHIpOwotICAgIHByaW50aygiICAgIFRUQkNSOiAweCUwOCJQUklyZWdp
c3RlciJcbiIsIHR0YmNyKTsKKyAgICBwcmludGsoIiAgICBUVEJDUjogMHglIlBSSXJlZ2lzdGVy
IlxuIiwgdHRiY3IpOwogICAgIHByaW50aygiICAgIFRUQlIwOiAweCUwMTYiUFJJeDY0IiA9IDB4
JSJQUklwYWRkciJcbiIsCiAgICAgICAgICAgIHR0YnIwLCBtZm5fdG9fbWFkZHIobWZuKSk7CiAK
LS0gCjIuMTEuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
