Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EDACD6DF5
	for <lists+xen-devel@lfdr.de>; Tue, 15 Oct 2019 05:54:15 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iKDq6-0007Qg-Cf; Tue, 15 Oct 2019 03:49:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=yms0=YI=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1iKDq4-0007Qb-R9
 for xen-devel@lists.xenproject.org; Tue, 15 Oct 2019 03:49:36 +0000
X-Inumbo-ID: ce21a42e-eefe-11e9-a531-bc764e2007e4
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ce21a42e-eefe-11e9-a531-bc764e2007e4;
 Tue, 15 Oct 2019 03:49:36 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6CBF22089C;
 Tue, 15 Oct 2019 03:49:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1571111375;
 bh=vP1HWt/8eqpLjyORcVjHdf+gp9WQkxNwYvwrVZyeZLw=;
 h=Date:From:To:cc:Subject:From;
 b=ZLE7+nGWIGOWGHOgw63yOE5I+2gcbhfcr6i8B4ChTfiVA/+zDJPdr7mLshY5iTkia
 1jmt+kM6+MG/oBbzbcFQUvOXsxaRADWg88CcjW3a41P/0faqAHn0fzM7QnkI2WwqKa
 ndj3ic3Gnylf5GRAmypeXh1PlBuM/cmAChpBeyFo=
Date: Mon, 14 Oct 2019 20:49:34 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: julien.grall@arm.com
Message-ID: <alpine.DEB.2.21.1910142041270.6326@sstabellini-ThinkPad-T480s>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH] xen/arm: remove special dom0 case in
 dump_hyp_walk
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
Cc: jgross@suse.com, xen-devel@lists.xenproject.org, sstabellini@kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlcmUgaXMgbm8gbmVlZCB0byBoYXZlIGEgc3BlY2lhbCBkb20wIGNhc2UgdG8gY29udmVydCB0
aGUgcGd0YWJsZQp2aXJ0dWFsIGFkZHJlc3MgaW50byBhIHBoeXNpY2FsIGFkZHJlc3MuIFRoZSB2
aXJ0X3RvX21hZGRyIGZ1bmN0aW9uIGNhbgp3b3JrIGJvdGggaW4gdGhlIGRvbTAgY2FzZSBhbmQg
dGhlIGRvbVUgY2FzZS4KClRoaXMgaXMgbW9yZSB0aGFuIGEgY2xlYW51cDogd2hlbiBYZW4gaXMg
bG9hZGVkIGF0IGFkZHJlc3NlcyBsb3dlciB0aGFuCjJNQiBvbiBhcm0zMiBwaHlzX29mZnNldCBt
aWdodCBub3QgaG9sZCB0aGUgcmlnaHQgdmFsdWUgYW5kIGJlIHVuYWJsZSB0bwpwZXJmb3JtIGEg
dmlydCB0byBwaHlzIGNvbnZlcnNpb24gcHJvcGVybHkuIFJlZHVjaW5nIHRoZSB1bm5lY2Vzc2Fy
eQp1c2FnZSBvZiBwaHlzX29mZnNldCBpcyBhIGdvb2QgaWRlYS4KCkxpbms6IGh0dHBzOi8vbWFy
Yy5pbmZvLz9sPXhlbi1kZXZlbCZtPTE1NzA4MTM5ODAyMjQwMQpTaWduZWQtb2ZmLWJ5OiBTdGVm
YW5vIFN0YWJlbGxpbmkgPHN0ZWZhbm8uc3RhYmVsbGluaUB4aWxpbnguY29tPgoKZGlmZiAtLWdp
dCBhL3hlbi9hcmNoL2FybS9tbS5jIGIveGVuL2FyY2gvYXJtL21tLmMKaW5kZXggYTY2MzdjZTM0
Ny4uYjc4ODNjZmJhYiAxMDA2NDQKLS0tIGEveGVuL2FyY2gvYXJtL21tLmMKKysrIGIveGVuL2Fy
Y2gvYXJtL21tLmMKQEAgLTI4NCwxMCArMjg0LDcgQEAgdm9pZCBkdW1wX2h5cF93YWxrKHZhZGRy
X3QgYWRkcikKICAgICAgICAgICAgIm9uIENQVSVkIHZpYSBUVEJSIDB4JTAxNiJQUkl4NjQiXG4i
LAogICAgICAgICAgICBhZGRyLCBzbXBfcHJvY2Vzc29yX2lkKCksIHR0YnIpOwogCi0gICAgaWYg
KCBzbXBfcHJvY2Vzc29yX2lkKCkgPT0gMCApCi0gICAgICAgIEJVR19PTiggKGxwYWVfdCAqKSh1
bnNpZ25lZCBsb25nKSh0dGJyIC0gcGh5c19vZmZzZXQpICE9IHBndGFibGUgKTsKLSAgICBlbHNl
Ci0gICAgICAgIEJVR19PTiggdmlydF90b19tYWRkcihwZ3RhYmxlKSAhPSB0dGJyICk7CisgICAg
QlVHX09OKCB2aXJ0X3RvX21hZGRyKHBndGFibGUpICE9IHR0YnIgKTsKICAgICBkdW1wX3B0X3dh
bGsodHRiciwgYWRkciwgSFlQX1BUX1JPT1RfTEVWRUwsIDEpOwogfQogCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
