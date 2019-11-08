Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EEB34F5482
	for <lists+xen-devel@lfdr.de>; Fri,  8 Nov 2019 20:13:11 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iT9dv-0001qQ-5Y; Fri, 08 Nov 2019 19:09:59 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=hcls=ZA=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1iT9dt-0001qL-K1
 for xen-devel@lists.xenproject.org; Fri, 08 Nov 2019 19:09:57 +0000
X-Inumbo-ID: 5a4eabda-025b-11ea-a1d6-12813bfff9fa
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5a4eabda-025b-11ea-a1d6-12813bfff9fa;
 Fri, 08 Nov 2019 19:09:57 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s.xilinx.com
 (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 11573206A3;
 Fri,  8 Nov 2019 19:09:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1573240196;
 bh=yd7AO6vcWsMShBrSoLjrUKQjgekF39PtMdmSnelw7I8=;
 h=From:To:Cc:Subject:Date:From;
 b=WahbwMp5jEHMAqSxX3W1gkZqyi5TT90ZY0glmgEYai40gIv249FRPbHtq9H7X6/QV
 wPhMnvGBUz3psJ7vcPVFXTZn4uJ+hZbKXRiigLzxjgL3YEphUZFc1ISzLS0BxRWeql
 FXK5GylhXeIen2b82vfetrkWnHaXdmPdn9/Fq/go=
From: Stefano Stabellini <sstabellini@kernel.org>
To: xen-devel@lists.xenproject.org
Date: Fri,  8 Nov 2019 11:09:52 -0800
Message-Id: <20191108190952.22163-1-sstabellini@kernel.org>
X-Mailer: git-send-email 2.17.1
Subject: [Xen-devel] [PATCH] Introduce a description of a new optional tag
 for Backports
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
Cc: lars.kurth@citrix.com, sstabellini@kernel.org, julien@xen.org, wl@xen.org,
 konrad.wilk@oracle.com, andrew.cooper3@citrix.com, ian.jackson@eu.citrix.com,
 george.dunlap@citrix.com, jbeulich@suse.com,
 Stefano Stabellini <stefano.stabellini@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

U2lnbmVkLW9mZi1ieTogU3RlZmFubyBTdGFiZWxsaW5pIDxzdGVmYW5vLnN0YWJlbGxpbmlAeGls
aW54LmNvbT4KQ0M6IGpiZXVsaWNoQHN1c2UuY29tCkNDOiBnZW9yZ2UuZHVubGFwQGNpdHJpeC5j
b20KQ0M6IGp1bGllbkB4ZW4ub3JnCkNDOiBsYXJzLmt1cnRoQGNpdHJpeC5jb20KQ0M6IGFuZHJl
dy5jb29wZXIzQGNpdHJpeC5jb20KQ0M6IGlhbi5qYWNrc29uQGV1LmNpdHJpeC5jb20KQ0M6IGtv
bnJhZC53aWxrQG9yYWNsZS5jb20KQ0M6IHdsQHhlbi5vcmcKLS0tCiBkb2NzL3Byb2Nlc3MvYmFj
a3BvcnQtdGFnLnBhbmRvYyB8IDIzICsrKysrKysrKysrKysrKysrKysrKysrCiAxIGZpbGUgY2hh
bmdlZCwgMjMgaW5zZXJ0aW9ucygrKQogY3JlYXRlIG1vZGUgMTAwNjQ0IGRvY3MvcHJvY2Vzcy9i
YWNrcG9ydC10YWcucGFuZG9jCgpkaWZmIC0tZ2l0IGEvZG9jcy9wcm9jZXNzL2JhY2twb3J0LXRh
Zy5wYW5kb2MgYi9kb2NzL3Byb2Nlc3MvYmFja3BvcnQtdGFnLnBhbmRvYwpuZXcgZmlsZSBtb2Rl
IDEwMDY0NAppbmRleCAwMDAwMDAwMDAwLi5lNTcwZWZkY2M4Ci0tLSAvZGV2L251bGwKKysrIGIv
ZG9jcy9wcm9jZXNzL2JhY2twb3J0LXRhZy5wYW5kb2MKQEAgLTAsMCArMSwyMyBAQAorQmFja3Bv
cnQgVGFnCistLS0tLS0tLS0tLS0KKworQSBiYWNrcG9ydCB0YWcgaXMgYW4gb3B0aW9uYWwgdGFn
IGluIHRoZSBjb21taXQgbWVzc2FnZSB0byByZXF1ZXN0IGEKK2dpdmVuIGNvbW1pdCB0byBiZSBi
YWNrcG9ydGVkIHRvIHRoZSBzdGFibGUgdHJlZXM6CisKKyAgICBCYWNrcG9ydDogYWxsCisKK0l0
IG1hcmtzIGEgY29tbWl0IGZvciBiZWluZyBhIGNhbmRpZGF0ZSBmb3IgYmFja3BvcnRzIHRvIGFs
bCByZWxldmFudAordHJlZXMuCisKKyAgICBCYWNrcG9ydDogNC45KworCitJdCBtYXJrcyBhIGNv
bW1pdCBmb3IgYmVpbmcgYSBjYW5kaWRhdGUgZm9yIGJhY2twb3J0cyB0byBhbGwgc3RhYmxlCit0
cmVlcyBmcm9tIDQuOSBvbndhcmQuCisKK01haW50YWluZXJzIHJlcXVlc3QgdGhlIEJhY2twb3J0
IHRhZyB0byBiZSBhZGRlZCBvbiBjb21taXQuCitDb250cmlidXRvcnMgYXJlIGFsc28gd2VsY29t
ZSB0byBtYXJrIHRoZWlyIHBhdGNoZXMgd2l0aCB0aGUgQmFja3BvcnQKK3RhZyB3aGVuIHRoZXkg
ZGVlbSBhcHByb3ByaWF0ZS4gTWFpbnRhaW5lcnMgd2lsbCByZXF1ZXN0IGZvciBpdCB0byBiZQor
cmVtb3ZlZCB3aGVuIHRoYXQgaXMgbm90IHRoZSBjYXNlLgorCitQbGVhc2Ugbm90ZSB0aGF0IHRo
ZSBCYWNrcG9ydCB0YWcgaXMgYSAqKnJlcXVlc3QqKiBmb3IgYmFja3BvcnQsIHdoaWNoCit3aWxs
IHN0aWxsIG5lZWQgdG8gYmUgZXZhbHVhdGVkIGJ5IHRoZSBzdGFibGUgdHJlZSBtYWludGFpbmVy
cy4KLS0gCjIuMTcuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
