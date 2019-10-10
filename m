Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A3DAD1D94
	for <lists+xen-devel@lfdr.de>; Thu, 10 Oct 2019 02:44:26 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iIMX1-0005jS-Ly; Thu, 10 Oct 2019 00:42:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=klDL=YD=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1iIMX0-0005jK-IW
 for xen-devel@lists.xenproject.org; Thu, 10 Oct 2019 00:42:14 +0000
X-Inumbo-ID: ccd85cfe-eaf6-11e9-80e3-bc764e2007e4
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ccd85cfe-eaf6-11e9-80e3-bc764e2007e4;
 Thu, 10 Oct 2019 00:42:13 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s.hsd1.ca.comcast.net
 (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9F67320B7C;
 Thu, 10 Oct 2019 00:42:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1570668132;
 bh=E3OgBK+Xi6PVuKpoyyJXGXOVa1BJjWGHTvZQUGqq9xo=;
 h=From:To:Cc:Subject:Date:From;
 b=AS5SUS4e9FgWN69OS/8LbXn5xW8dsa/JEicXEtStCYqn7Iwm5QtP8IQiVhPTDhomO
 VPV8HgcA/mgtciGC1wZPpy3AxViUQ/Gd2EBJ2A+X2+0c4cPyI0uihBZkwwztqHnjgO
 nGyPYB5g+AP5qN9VD0vB9jjmII+NpINrNy8Ly62A=
From: Stefano Stabellini <sstabellini@kernel.org>
To: julien.grall@arm.com
Date: Wed,  9 Oct 2019 17:42:11 -0700
Message-Id: <20191010004211.31017-1-sstabellini@kernel.org>
X-Mailer: git-send-email 2.17.1
Subject: [Xen-devel] [PATCH v4] xen/arm: domain_build: harden
 make_cpus_node()
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
Cc: jgross@suse.com, xen-devel@lists.xenproject.org, sstabellini@kernel.org,
 Volodymyr_Babchuk@epam.com, Stefano Stabellini <stefano.stabellini@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

bWFrZV9jcHVzX25vZGUoKSBpcyB1c2luZyBhIHN0YXRpYyBidWZmZXIgdG8gZ2VuZXJhdGUgdGhl
IEZEVCBub2RlIG5hbWUuCldoaWxlIG1wZGlyX2FmZiBpcyBhIDY0LWJpdCBpbnRlZ2VyLCB3ZSBv
bmx5IGV2ZXIgdXNlIHRoZSBiaXRzIFsyMzowXSBhcwpvbmx5IEFGRnswLCAxLCAyfSBhcmUgc3Vw
cG9ydGVkIGZvciBub3cuCgpUbyBhdm9pZCBhbnkgcG90ZW50aWFsIGlzc3VlcyBpbiB0aGUgZnV0
dXJlLCBjaGVjayB0aGF0IG1wZGlyX2FmZiBoYXMKb25seSBiaXRzIFsyMzowXSBzZXQuCgpUYWtl
IHRoZSBvcHBvcnR1bml0eSB0byByZWR1Y2UgdGhlIHNpemUgb2YgdGhlIGJ1ZmZlci4gSW5kZWVk
LCBvbmx5IDgKY2hhcmFjdGVycyBhcmUgbmVlZGVkIHRvIHByaW50IGEgMzItYml0IGhleGFkZWNp
bWFsIG51bWJlci4gU28Kc2l6ZW9mKCJjcHVAIikgKyA4ICsgMSAoZm9yICdcMCcpID0gMTMgY2hh
cmFjdGVycyBpcyBzdWZmaWNpZW50LgoKRml4ZXM6IGM4MWE3OTFkMzQgKHhlbi9hcm06IFNldCAn
cmVnJyBvZiBjcHUgbm9kZSBmb3IgZG9tMCB0byBtYXRjaCBNUElEUidzIGFmZmluaXR5KQpTaWdu
ZWQtb2ZmLWJ5OiBTdGVmYW5vIFN0YWJlbGxpbmkgPHN0ZWZhbm8uc3RhYmVsbGluaUB4aWxpbngu
Y29tPgotLS0KQ2hhbmdlcyBpbiB2NDoKLSBjb21taXQgbWVzc2FnZQotIGluLWNvZGUgY29tbWVu
dHMKCkNoYW5nZXMgaW4gdjM6Ci0gbWFrZSBzdXJlIG9ubHkgWzIzOjBdIGJpdHMgYXJlIHVzZWQg
aW4gbXBpZHJfYWZmCi0gY2xhcmlmeSB0aGF0IHdlIG9ubHkgbmVlZCAzMmJpdCBmb3IgYnVmIHdy
aXRlcwoKQ2hhbmdlcyBpbiB2MjoKLSBwYXRjaCBhZGRlZAotLS0KIHhlbi9hcmNoL2FybS9kb21h
aW5fYnVpbGQuYyB8IDE5ICsrKysrKysrKysrKysrKysrLS0KIDEgZmlsZSBjaGFuZ2VkLCAxNyBp
bnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9k
b21haW5fYnVpbGQuYyBiL3hlbi9hcmNoL2FybS9kb21haW5fYnVpbGQuYwppbmRleCA5MjFiMDU0
NTIwLi4zOGFkYjZlOTU0IDEwMDY0NAotLS0gYS94ZW4vYXJjaC9hcm0vZG9tYWluX2J1aWxkLmMK
KysrIGIveGVuL2FyY2gvYXJtL2RvbWFpbl9idWlsZC5jCkBAIC03ODgsOCArNzg4LDggQEAgc3Rh
dGljIGludCBfX2luaXQgbWFrZV9jcHVzX25vZGUoY29uc3Qgc3RydWN0IGRvbWFpbiAqZCwgdm9p
ZCAqZmR0KQogICAgIHVuc2lnbmVkIGludCBjcHU7CiAgICAgY29uc3Qgdm9pZCAqY29tcGF0aWJs
ZSA9IE5VTEw7CiAgICAgdTMyIGxlbjsKLSAgICAvKiBQbGFjZWhvbGRlciBmb3IgY3B1QCArIGEg
MzItYml0IG51bWJlciArIFwwICovCi0gICAgY2hhciBidWZbMTVdOworICAgIC8qIFBsYWNlaG9s
ZGVyIGZvciBjcHVAICsgYSAzMi1iaXQgaGV4YWRlY2ltYWwgbnVtYmVyICsgXDAgKi8KKyAgICBj
aGFyIGJ1ZlsxM107CiAgICAgdTMyIGNsb2NrX2ZyZXF1ZW5jeTsKICAgICBib29sIGNsb2NrX3Zh
bGlkOwogICAgIHVpbnQ2NF90IG1waWRyX2FmZjsKQEAgLTg0NywxMSArODQ3LDI2IEBAIHN0YXRp
YyBpbnQgX19pbml0IG1ha2VfY3B1c19ub2RlKGNvbnN0IHN0cnVjdCBkb21haW4gKmQsIHZvaWQg
KmZkdCkKICAgICAgICAgICogdGhlIE1QSURSJ3MgYWZmaW5pdHkgYml0cy4gV2Ugd2lsbCB1c2Ug
QUZGMCBhbmQgQUZGMSB3aGVuCiAgICAgICAgICAqIGNvbnN0cnVjdGluZyB0aGUgcmVnIHZhbHVl
IG9mIHRoZSBndWVzdCBhdCB0aGUgbW9tZW50LCBmb3IgaXQKICAgICAgICAgICogaXMgZW5vdWdo
IGZvciB0aGUgY3VycmVudCBtYXggdmNwdSBudW1iZXIuCisgICAgICAgICAqCisgICAgICAgICAq
IFdlIG9ubHkgZGVhbCB3aXRoIEFGRnswLCAxLCAyfSBzdG9yZWQgaW4gYml0cyBbMjM6MF0gYXQg
dGhlCisgICAgICAgICAqIG1vbWVudC4KICAgICAgICAgICovCiAgICAgICAgIG1waWRyX2FmZiA9
IHZjcHVpZF90b192YWZmaW5pdHkoY3B1KTsKKyAgICAgICAgaWYgKCAobXBpZHJfYWZmICYgfkdF
Tk1BU0tfVUxMKDIzLCAwKSkgIT0gMCApCisgICAgICAgIHsKKyAgICAgICAgICAgIHByaW50ayhY
RU5MT0dfRVJSICJVbmFibGUgdG8gaGFuZGxlIE1QSURSIEFGRklOSVRZIDB4JSJQUkl4NjQiXG4i
LCAKKyAgICAgICAgICAgICAgICAgICBtcGlkcl9hZmYpOworICAgICAgICAgICAgcmV0dXJuIC1F
SU5WQUw7CisgICAgICAgIH0KKwogICAgICAgICBkdF9kcHJpbnRrKCJDcmVhdGUgY3B1QCUiUFJJ
eDY0IiAobG9naWNhbCBDUFVJRDogJWQpIG5vZGVcbiIsCiAgICAgICAgICAgICAgICAgICAgbXBp
ZHJfYWZmLCBjcHUpOwogCisgICAgICAgIC8qCisgICAgICAgICAqIFdlIHVzZSBQUkl4NjQgYmVj
YXVzZSBtcGlkcl9hZmYgaXMgYSA2NGJpdCBpbnRlZ2VyLiBIb3dldmVyLAorICAgICAgICAgKiBv
bmx5IGJpdHMgWzIzOjBdIGFyZSB1c2VkLCB0aHVzLCB3ZSBhcmUgc3VyZSBpdCB3aWxsIGZpdCBp
bgorICAgICAgICAgKiBidWYuCisgICAgICAgICAqLwogICAgICAgICBzbnByaW50ZihidWYsIHNp
emVvZihidWYpLCAiY3B1QCUiUFJJeDY0LCBtcGlkcl9hZmYpOwogICAgICAgICByZXMgPSBmZHRf
YmVnaW5fbm9kZShmZHQsIGJ1Zik7CiAgICAgICAgIGlmICggcmVzICkKLS0gCjIuMTcuMQoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
