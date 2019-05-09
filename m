Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 128BB18D47
	for <lists+xen-devel@lfdr.de>; Thu,  9 May 2019 17:45:21 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hOlB1-0007e7-Su; Thu, 09 May 2019 15:41:43 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=L0k/=TJ=suse.com=vliaskovitis@srs-us1.protection.inumbo.net>)
 id 1hOlB0-0007e2-96
 for xen-devel@lists.xenproject.org; Thu, 09 May 2019 15:41:42 +0000
X-Inumbo-ID: efcebcb2-7270-11e9-8980-bc764e045a96
Received: from smtp.nue.novell.com (unknown [195.135.221.5])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id efcebcb2-7270-11e9-8980-bc764e045a96;
 Thu, 09 May 2019 15:41:40 +0000 (UTC)
Received: from emea4-mta.ukb.novell.com ([10.120.13.87])
 by smtp.nue.novell.com with ESMTP (TLS encrypted);
 Thu, 09 May 2019 17:41:39 +0200
Received: from linux-nq5u.suse.de (nwb-a10-snat.microfocus.com [10.120.13.202])
 by emea4-mta.ukb.novell.com with ESMTP (NOT encrypted);
 Thu, 09 May 2019 16:41:32 +0100
From: Vasilis Liaskovitis <vliaskovitis@suse.com>
To: xen-devel@lists.xenproject.org
Date: Thu,  9 May 2019 17:41:24 +0200
Message-Id: <20190509154128.9196-1-vliaskovitis@suse.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v3 0/4] Support for reading runtime hypervisor
 parameters
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
Cc: jgross@suse.com, sstabellini@kernel.org, wei.liu2@citrix.com,
 vliaskovitis@suse.com, George.Dunlap@eu.citrix.com, andrew.cooper3@citrix.com,
 ian.jackson@eu.citrix.com, tim@xen.org, jbeulich@suse.com,
 dgdegra@tycho.nsa.gov
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Q3VycmVudGx5IHJ1bnRpbWUgcGFyYW1ldGVycyBvZiB0aGUgaHlwZXJ2aXNvciBjYW5ub3QgYmUg
aW5zcGVjdGVkIHRocm91Z2ggYW4KeGwgY29tbWFuZCwgaG93ZXZlciB0aGV5IGNhbiBiZSBjaGFu
Z2VkIHdpdGggdGhlICJ4bCBzZXQtcGFyYW1ldGVyIiBjb21tYW5kLgpCZWluZyBhYmxlIHRvIGNo
ZWNrIHRoZXNlIHBhcmFtZXRlcnMgYXQgcnVudGltZSB3b3VsZCBiZSBhIHVzZWZ1bCBkaWFnbm9z
dGljCnRvb2wuCgpUaGlzIHBhdGNoIHNlcmllcyBpbXBsZW1lbnRzIGEgbmV3IHhsIGNvbW1hbmQg
InhsIGdldC1wYXJhbWV0ZXJzIgp3aGljaCB0YWtlcyBhIHN0cmluZyBvZiBpbnB1dCBwYXJhbWV0
ZXJzIGFuZCByZXR1cm5zIHRoZWlyIGN1cnJlbnQKdmFsdWVzIGluIHRoZSBoeXBlcnZpc29yIHNl
dHRpbmdzLgoKQ2hhbmdlcyB2Mi0+djM6CgotIFNldmVyYWwgc3R5bGUgLyBmb3JtYXR0aW5nIGZp
eGVzCi0gTGltaXRhdGlvbnMgZm9yIHNpZ25lZCBpbnRlZ2VyIHBhcmFtZXRlcnMgYWRkZWQgaW4g
Y29kZSBhbmQgY29tbWl0IGxvZy4KCkNoYW5nZXMgdjEtPnYyOgoKLSBmaXhlZCBzbnByaW50ZiBp
c3N1ZXMsIGZpeGVkIG1lbW9yeSBsZWFrcyBhbmQgZXJyb3IgaGFuZGxpbmcKLSByZW1vdmVkIHVu
bmVjZXNzYXJ5IHdyYXBwZXIgZnVuY3Rpb24KLSBPUFRfU0laRSBpcyBoYW5kbGVkCgpMaW1pdGF0
aW9uczoKCi0gQ3VzdG9tIHJ1bnRpbWUgcGFyYW1ldGVycyAoT1BUX0NVU1RPTSkgYXJlIG5vdCBz
dXBwb3J0ZWQgeWV0LiBJJ2QgbGlrZQogIHRvIGRvIHRoaXMgaW4gYSBmb2xsb3ctdXAgc2VyaWVz
LiBTZWUgYWxzbyBkaXNjdXNzaW9uIGF0CiAgaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9h
cmNoaXZlcy9odG1sL3hlbi1kZXZlbC8yMDE5LTAzL21zZzAxMzgzLmh0bWwKLSBGb3IgaW50ZWdl
ciBwYXJhbWV0ZXJzIChPUFRfVUlOVCksIG9ubHkgdW5zaWduZWQgcGFyYW1ldGVycyBhcmUgcHJp
bnRlZAogIGNvcnJlY3RseSBhdCB0aGUgbW9tZW50LgoKRXhhbXBsZXM6Cgp4bCBnZXQtcGFyYW1l
dGVycyAiZ250dGFiX21heF9mcmFtZXMgZ250dGFiX21heF9tYXB0cmFja19mcmFtZXMiCmdudHRh
Yl9tYXhfZnJhbWVzIGdudHRhYl9tYXhfbWFwdHJhY2tfZnJhbWVzIDogNjQgMTAyNAoKeGwgc2V0
LXBhcmFtZXRlcnMgZ250dGFiX21heF9mcmFtZXM9MTI4Cgp4bCBnZXQtcGFyYW1ldGVycyBnbnR0
YWJfbWF4X2ZyYW1lcwpnbnR0YWJfbWF4X2ZyYW1lcyA6IDEyOAoKeGwgZ2V0LXBhcmFtZXRlcnMg
ImdudHRhYl9tYXhfZnJhbWVzIGdudHRhYl9tYXhfbWFwdHJhY2tfZnJhbWVzIgpnbnR0YWJfbWF4
X2ZyYW1lcyBnbnR0YWJfbWF4X21hcHRyYWNrX2ZyYW1lcyA6IDEyOCAxMDI0CgpWYXNpbGlzIExp
YXNrb3ZpdGlzICg0KToKICB4ZW46IGFkZCBoeXBlcmNhbGwgZm9yIGdldHRpbmcgcGFyYW1ldGVy
cyBhdCBydW50aW1lCiAgbGlieGM6IGFkZCBmdW5jdGlvbiB0byBnZXQgaHlwZXJ2aXNvciBwYXJh
bWV0ZXJzCiAgbGlieGw6IGFkZCBsaWJ4bF9nZXRfcGFyYW1ldGVycygpIGZ1bmN0aW9uCiAgeGw6
IGFkZCBuZXcgeGwgY29tbWFuZCBnZXQtcGFyYW1ldGVycwoKIGRvY3MvbWFuL3hsLjEucG9kLmlu
ICAgICAgICAgICAgICAgIHwgICA1ICsrCiB0b29scy9mbGFzay9wb2xpY3kvbW9kdWxlcy9kb20w
LnRlICB8ICAgMiArLQogdG9vbHMvbGlieGMvaW5jbHVkZS94ZW5jdHJsLmggICAgICAgfCAgIDEg
KwogdG9vbHMvbGlieGMveGNfbWlzYy5jICAgICAgICAgICAgICAgfCAgMjYgKysrKysrKwogdG9v
bHMvbGlieGwvbGlieGwuYyAgICAgICAgICAgICAgICAgfCAgMTUgKysrKwogdG9vbHMvbGlieGwv
bGlieGwuaCAgICAgICAgICAgICAgICAgfCAgIDEgKwogdG9vbHMveGwveGwuaCAgICAgICAgICAg
ICAgICAgICAgICAgfCAgIDEgKwogdG9vbHMveGwveGxfY21kdGFibGUuYyAgICAgICAgICAgICAg
fCAgIDUgKysKIHRvb2xzL3hsL3hsX21pc2MuYyAgICAgICAgICAgICAgICAgIHwgIDI1ICsrKysr
KwogeGVuL2NvbW1vbi9rZXJuZWwuYyAgICAgICAgICAgICAgICAgfCAxMTMgKysrKysrKysrKysr
KysrKysrKysrKysrKysrKwogeGVuL2NvbW1vbi9zeXNjdGwuYyAgICAgICAgICAgICAgICAgfCAg
NTIgKysrKysrKysrKysrLQogeGVuL2luY2x1ZGUvcHVibGljL3N5c2N0bC5oICAgICAgICAgfCAg
MTggKysrKysKIHhlbi9pbmNsdWRlL3hlbi9saWIuaCAgICAgICAgICAgICAgIHwgICAxICsKIHhl
bi94c20vZmxhc2svaG9va3MuYyAgICAgICAgICAgICAgIHwgICAzICsKIHhlbi94c20vZmxhc2sv
cG9saWN5L2FjY2Vzc192ZWN0b3JzIHwgICAyICsKIDE1IGZpbGVzIGNoYW5nZWQsIDI2NyBpbnNl
cnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQoKLS0gCjIuMjAuMQoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
