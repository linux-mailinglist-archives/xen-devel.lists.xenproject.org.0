Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 27F792C959
	for <lists+xen-devel@lfdr.de>; Tue, 28 May 2019 16:58:00 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hVdUq-0000Us-E6; Tue, 28 May 2019 14:54:36 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=twwc=T4=suse.com=vliaskovitis@srs-us1.protection.inumbo.net>)
 id 1hVdUo-0000Ul-Sa
 for xen-devel@lists.xenproject.org; Tue, 28 May 2019 14:54:34 +0000
X-Inumbo-ID: 802c995a-8158-11e9-8980-bc764e045a96
Received: from smtp.nue.novell.com (unknown [195.135.221.5])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 802c995a-8158-11e9-8980-bc764e045a96;
 Tue, 28 May 2019 14:54:32 +0000 (UTC)
Received: from emea4-mta.ukb.novell.com ([10.120.13.87])
 by smtp.nue.novell.com with ESMTP (TLS encrypted);
 Tue, 28 May 2019 16:54:31 +0200
Received: from linux-nq5u.suse.de (nwb-a10-snat.microfocus.com [10.120.13.201])
 by emea4-mta.ukb.novell.com with ESMTP (NOT encrypted);
 Tue, 28 May 2019 15:54:22 +0100
From: Vasilis Liaskovitis <vliaskovitis@suse.com>
To: xen-devel@lists.xenproject.org
Date: Tue, 28 May 2019 16:54:12 +0200
Message-Id: <20190528145416.16918-1-vliaskovitis@suse.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v4 0/4] Support for reading runtime hypervisor
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
 jbeulich@suse.com, George.Dunlap@eu.citrix.com, andrew.cooper3@citrix.com,
 ian.jackson@eu.citrix.com, tim@xen.org, vliaskovitis@suse.com,
 anthony.perard@citrix.com, dgdegra@tycho.nsa.gov
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
dHRpbmdzLgoKRXhhbXBsZXM6Cgp4bCBnZXQtcGFyYW1ldGVycyAiZ250dGFiX21heF9mcmFtZXMg
Z250dGFiX21heF9tYXB0cmFja19mcmFtZXMiCmdudHRhYl9tYXhfZnJhbWVzIGdudHRhYl9tYXhf
bWFwdHJhY2tfZnJhbWVzIDogNjQgMTAyNAoKeGwgc2V0LXBhcmFtZXRlcnMgZ250dGFiX21heF9m
cmFtZXM9MTI4Cgp4bCBnZXQtcGFyYW1ldGVycyBnbnR0YWJfbWF4X2ZyYW1lcwpnbnR0YWJfbWF4
X2ZyYW1lcyA6IDEyOAoKeGwgZ2V0LXBhcmFtZXRlcnMgImdudHRhYl9tYXhfZnJhbWVzIGdudHRh
Yl9tYXhfbWFwdHJhY2tfZnJhbWVzIgpnbnR0YWJfbWF4X2ZyYW1lcyBnbnR0YWJfbWF4X21hcHRy
YWNrX2ZyYW1lcyA6IDEyOCAxMDI0CgoKQ2hhbmdlcyB2My0+djQ6CgotIEZpeCByZXR1cm4gdmFs
dWUgYW5kIGxvZ2dpbmcgaW4gbmV3IGxpYnhsIGZ1bmN0aW9uLgoKQ2hhbmdlcyB2Mi0+djM6Cgot
IFNldmVyYWwgc3R5bGUgLyBmb3JtYXR0aW5nIGZpeGVzCi0gTGltaXRhdGlvbnMgZm9yIHNpZ25l
ZCBpbnRlZ2VyIHBhcmFtZXRlcnMgYWRkZWQgaW4gY29kZSBhbmQgY29tbWl0IGxvZy4KCkNoYW5n
ZXMgdjEtPnYyOgoKLSBmaXhlZCBzbnByaW50ZiBpc3N1ZXMsIGZpeGVkIG1lbW9yeSBsZWFrcyBh
bmQgZXJyb3IgaGFuZGxpbmcKLSByZW1vdmVkIHVubmVjZXNzYXJ5IHdyYXBwZXIgZnVuY3Rpb24K
LSBPUFRfU0laRSBpcyBoYW5kbGVkCgpMaW1pdGF0aW9uczoKCi0gQ3VzdG9tIHJ1bnRpbWUgcGFy
YW1ldGVycyAoT1BUX0NVU1RPTSkgYXJlIG5vdCBzdXBwb3J0ZWQgeWV0LiBJJ2QgbGlrZQogIHRv
IGRvIHRoaXMgaW4gYSBmb2xsb3ctdXAgc2VyaWVzLiBTZWUgYWxzbyBkaXNjdXNzaW9uIGF0CiAg
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9hcmNoaXZlcy9odG1sL3hlbi1kZXZlbC8yMDE5
LTAzL21zZzAxMzgzLmh0bWwKLSBGb3IgaW50ZWdlciBwYXJhbWV0ZXJzIChPUFRfVUlOVCksIG9u
bHkgdW5zaWduZWQgcGFyYW1ldGVycyBhcmUgcHJpbnRlZAogIGNvcnJlY3RseSBhdCB0aGUgbW9t
ZW50LgoKVmFzaWxpcyBMaWFza292aXRpcyAoNCk6CiAgeGVuOiBhZGQgaHlwZXJjYWxsIGZvciBn
ZXR0aW5nIHBhcmFtZXRlcnMgYXQgcnVudGltZQogIGxpYnhjOiBhZGQgZnVuY3Rpb24gdG8gZ2V0
IGh5cGVydmlzb3IgcGFyYW1ldGVycwogIGxpYnhsOiBhZGQgbGlieGxfZ2V0X3BhcmFtZXRlcnMo
KSBmdW5jdGlvbgogIHhsOiBhZGQgbmV3IHhsIGNvbW1hbmQgZ2V0LXBhcmFtZXRlcnMKCiBkb2Nz
L21hbi94bC4xLnBvZC5pbiAgICAgICAgICAgICAgICB8ICAgNSArKwogdG9vbHMvZmxhc2svcG9s
aWN5L21vZHVsZXMvZG9tMC50ZSAgfCAgIDIgKy0KIHRvb2xzL2xpYnhjL2luY2x1ZGUveGVuY3Ry
bC5oICAgICAgIHwgICAxICsKIHRvb2xzL2xpYnhjL3hjX21pc2MuYyAgICAgICAgICAgICAgIHwg
IDI2ICsrKysrKwogdG9vbHMvbGlieGwvbGlieGwuYyAgICAgICAgICAgICAgICAgfCAgMTkgKysr
KysKIHRvb2xzL2xpYnhsL2xpYnhsLmggICAgICAgICAgICAgICAgIHwgICAxICsKIHRvb2xzL3hs
L3hsLmggICAgICAgICAgICAgICAgICAgICAgIHwgICAxICsKIHRvb2xzL3hsL3hsX2NtZHRhYmxl
LmMgICAgICAgICAgICAgIHwgICA1ICsrCiB0b29scy94bC94bF9taXNjLmMgICAgICAgICAgICAg
ICAgICB8ICAyNSArKysrKysKIHhlbi9jb21tb24va2VybmVsLmMgICAgICAgICAgICAgICAgIHwg
MTE4ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysKIHhlbi9jb21tb24vc3lzY3RsLmMgICAg
ICAgICAgICAgICAgIHwgIDUyICsrKysrKysrKysrLQogeGVuL2luY2x1ZGUvcHVibGljL3N5c2N0
bC5oICAgICAgICAgfCAgMTggKysrKysKIHhlbi9pbmNsdWRlL3hlbi9saWIuaCAgICAgICAgICAg
ICAgIHwgICAxICsKIHhlbi94c20vZmxhc2svaG9va3MuYyAgICAgICAgICAgICAgIHwgICAzICsK
IHhlbi94c20vZmxhc2svcG9saWN5L2FjY2Vzc192ZWN0b3JzIHwgICAyICsKIDE1IGZpbGVzIGNo
YW5nZWQsIDI3NiBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQoKLS0gCjIuMjAuMQoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
