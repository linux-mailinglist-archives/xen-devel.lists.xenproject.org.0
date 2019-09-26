Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 408B5BF962
	for <lists+xen-devel@lfdr.de>; Thu, 26 Sep 2019 20:42:19 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDYek-0002OS-OH; Thu, 26 Sep 2019 18:38:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=fOM6=XV=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1iDYei-0002OC-Qo
 for xen-devel@lists.xenproject.org; Thu, 26 Sep 2019 18:38:20 +0000
X-Inumbo-ID: cd4a7fb0-e08c-11e9-97fb-bc764e2007e4
Received: from foss.arm.com (unknown [217.140.110.172])
 by localhost (Halon) with ESMTP
 id cd4a7fb0-e08c-11e9-97fb-bc764e2007e4;
 Thu, 26 Sep 2019 18:38:15 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 50DD81596;
 Thu, 26 Sep 2019 11:38:15 -0700 (PDT)
Received: from e108454-lin.cambridge.arm.com (e108454-lin.cambridge.arm.com
 [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8487C3F67D;
 Thu, 26 Sep 2019 11:38:14 -0700 (PDT)
From: Julien Grall <julien.grall@arm.com>
To: xen-devel@lists.xenproject.org
Date: Thu, 26 Sep 2019 19:38:00 +0100
Message-Id: <20190926183808.11630-3-julien.grall@arm.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190926183808.11630-1-julien.grall@arm.com>
References: <20190926183808.11630-1-julien.grall@arm.com>
Subject: [Xen-devel] [PATCH RFC for-4.13 02/10] xen/arm64: head: Check if an
 SError is pending when receiving a vSError
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
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, andrii.anisov@gmail.com
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QXQgdGhlIG1vbWVudCwgd2hlbiB3ZSByZWNlaXZlIGFuIFNFcnJvciBleGNlcHRpb24gZnJvbSB0
aGUgZ3Vlc3QsIHdlCmRvbid0IGNoZWNrIGlmIHRoZXJlIGFyZSBhbnkgb3RoZXIgcGVuZGluZy4g
Rm9yIGhhcmRlbmluZyB0aGUgY29kZSwgd2UKc2hvdWxkIGVuc3VyZSBhbnkgcGVuZGluZyBTRXJy
b3IgYXJlIGFjY291bnRlZCB0byB0aGUgZ3Vlc3QgYmVmb3JlCmV4ZWN1dGluZyBhbnkgY29kZSB3
aXRoIFNFcnJvciB1bm1hc2tlZC4KClRoZSByZWNlbnRseSBpbnRyb2R1Y2VkIG1hY3JvICdndWVz
dF92ZWN0b3InIGNvdWxkIHVzZWQgdG8gZ2VuZXJhdGUgdGhlCnR3byB2ZWN0b3JzIGFuZCB0aGVy
ZWZvcmUgdGFrZSBhZHZhbnRhZ2Ugb2YgYW55IGNoYW5nZSByZXF1aXJlZCBpbiB0aGUKZnV0dXJl
LgoKU2lnbmVkLW9mZi1ieTogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KLS0t
CiB4ZW4vYXJjaC9hcm0vYXJtNjQvZW50cnkuUyB8IDEyICsrLS0tLS0tLS0tLQogMSBmaWxlIGNo
YW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMTAgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEveGVu
L2FyY2gvYXJtL2FybTY0L2VudHJ5LlMgYi94ZW4vYXJjaC9hcm0vYXJtNjQvZW50cnkuUwppbmRl
eCA4NjY1ZDI4NDRhLi40MGQ5ZjNlYzhjIDEwMDY0NAotLS0gYS94ZW4vYXJjaC9hcm0vYXJtNjQv
ZW50cnkuUworKysgYi94ZW4vYXJjaC9hcm0vYXJtNjQvZW50cnkuUwpAQCAtMzI0LDExICszMjQs
NyBAQCBndWVzdF9maXFfaW52YWxpZDoKICAgICAgICAgaW52YWxpZCBCQURfRklRCiAKIGd1ZXN0
X2Vycm9yOgotICAgICAgICBlbnRyeSAgIGh5cD0wLCBjb21wYXQ9MAotICAgICAgICBtc3IgICAg
IGRhaWZjbHIsICM2Ci0gICAgICAgIG1vdiAgICAgeDAsIHNwCi0gICAgICAgIGJsICAgICAgZG9f
dHJhcF9ndWVzdF9zZXJyb3IKLSAgICAgICAgZXhpdCAgICBoeXA9MCwgY29tcGF0PTAKKyAgICAg
ICAgZ3Vlc3RfdmVjdG9yIGNvbXBhdD0wLCBpZmxhZ3M9NiwgdHJhcD1ndWVzdF9zZXJyb3IKIAog
Z3Vlc3Rfc3luY19jb21wYXQ6CiAgICAgICAgIGd1ZXN0X3ZlY3RvciBjb21wYXQ9MSwgaWZsYWdz
PTYsIHRyYXA9Z3Vlc3Rfc3luYwpAQCAtMzQxLDExICszMzcsNyBAQCBndWVzdF9maXFfaW52YWxp
ZF9jb21wYXQ6CiAgICAgICAgIGludmFsaWQgQkFEX0ZJUQogCiBndWVzdF9lcnJvcl9jb21wYXQ6
Ci0gICAgICAgIGVudHJ5ICAgaHlwPTAsIGNvbXBhdD0xCi0gICAgICAgIG1zciAgICAgZGFpZmNs
ciwgIzYKLSAgICAgICAgbW92ICAgICB4MCwgc3AKLSAgICAgICAgYmwgICAgICBkb190cmFwX2d1
ZXN0X3NlcnJvcgotICAgICAgICBleGl0ICAgIGh5cD0wLCBjb21wYXQ9MQorICAgICAgICBndWVz
dF92ZWN0b3IgY29tcGF0PTEsIGlmbGFncz02LCB0cmFwPWd1ZXN0X3NlcnJvcgogCiBFTlRSWShy
ZXR1cm5fdG9fbmV3X3ZjcHUzMikKICAgICAgICAgZXhpdCAgICBoeXA9MCwgY29tcGF0PTEKLS0g
CjIuMTEuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
