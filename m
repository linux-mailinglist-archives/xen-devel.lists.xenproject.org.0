Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC7B770BD1
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jul 2019 23:43:00 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hpg2o-0002x2-Rw; Mon, 22 Jul 2019 21:40:30 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=SK1b=VT=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hpg2k-0002pV-Pe
 for xen-devel@lists.xenproject.org; Mon, 22 Jul 2019 21:40:26 +0000
X-Inumbo-ID: 50767792-acc9-11e9-8a0f-579bf927f4ca
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 50767792-acc9-11e9-8a0f-579bf927f4ca;
 Mon, 22 Jul 2019 21:40:25 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BEDBC153B;
 Mon, 22 Jul 2019 14:40:24 -0700 (PDT)
Received: from e108454-lin.cambridge.arm.com (e108454-lin.cambridge.arm.com
 [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 18C523F71F;
 Mon, 22 Jul 2019 14:40:23 -0700 (PDT)
From: Julien Grall <julien.grall@arm.com>
To: xen-devel@lists.xenproject.org
Date: Mon, 22 Jul 2019 22:39:44 +0100
Message-Id: <20190722213958.5761-22-julien.grall@arm.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190722213958.5761-1-julien.grall@arm.com>
References: <20190722213958.5761-1-julien.grall@arm.com>
Subject: [Xen-devel] [PATCH v2 21/35] xen/arm32: head: Don't clobber r14/lr
 in the macro PRINT
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

VGhlIGN1cnJlbnQgaW1wbGVtZW50YXRpb24gb2YgdGhlIG1hY3JvIFBSSU5UIHdpbGwgY2xvYmJl
ciByMTQvbHIuIFRoaXMKbWVhbnMgdGhlIHVzZXIgc2hvdWxkIHNhdmUgcjE0IGlmIGl0IGNhcmVz
IGFib3V0IGl0LgoKRm9sbG93LXVwIHBhdGNoZXMgd2lsbCBpbnRyb2R1Y2UgbW9yZSB1c2Ugb2Yg
UFJJTlQgaW4gcGxhY2VzIHdoZXJlIGxyCnNob3VsZCBiZSBwcmVzZXJ2ZWQuIFJhdGhlciB0aGFu
IHJlcXVpcmluZyBhbGwgdGhlIHVzZXIgdG8gcHJlc2VydmUgbHIsCnRoZSBtYWNybyBQUklOVCBp
cyBtb2RpZmllZCB0byBzYXZlIGFuZCByZXN0b3JlIGl0LgoKV2hpbGUgdGhlIGNvbW1lbnQgc3Rh
dGUgcjMgd2lsbCBiZSBjbG9iYmVyZWQsIHRoaXMgaXMgbm90IHRoZSBjYXNlLiBTbwpQUklOVCB3
aWxsIHVzZSByMyB0byBwcmVzZXJ2ZSBsci4KCkxhc3RseSwgdGFrZSB0aGUgb3Bwb3J0dW5pdHkg
dG8gbW92ZSB0aGUgY29tbWVudCBvbiB0b3Agb2YgUFJJTlQgYW5kIHVzZQpQUklOVCBpbiBpbml0
X3VhcnQuIEJvdGggY2hhbmdlcyB3aWxsIGJlIGhlbHBmdWwgaW4gYSBmb2xsb3ctdXAgcGF0Y2gu
CgpTaWduZWQtb2ZmLWJ5OiBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPgoKLS0t
CiAgICBDaGFuZ2VzIGluIHYyOgogICAgICAgIC0gUGF0Y2ggYWRkZWQKLS0tCiB4ZW4vYXJjaC9h
cm0vYXJtMzIvaGVhZC5TIHwgMjcgKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tCiAxIGZpbGUg
Y2hhbmdlZCwgMTUgaW5zZXJ0aW9ucygrKSwgMTIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEv
eGVuL2FyY2gvYXJtL2FybTMyL2hlYWQuUyBiL3hlbi9hcmNoL2FybS9hcm0zMi9oZWFkLlMKaW5k
ZXggOGI0YzhhNDcxNC4uYjU0MzMxYzE5ZCAxMDA2NDQKLS0tIGEveGVuL2FyY2gvYXJtL2FybTMy
L2hlYWQuUworKysgYi94ZW4vYXJjaC9hcm0vYXJtMzIvaGVhZC5TCkBAIC02NCwxNSArNjQsMjAg
QEAKICAqICAgcjE0IC0gTFIKICAqICAgcjE1IC0gUEMKICAqLwotLyogTWFjcm8gdG8gcHJpbnQg
YSBzdHJpbmcgdG8gdGhlIFVBUlQsIGlmIHRoZXJlIGlzIG9uZS4KLSAqIENsb2JiZXJzIHIwLXIz
LiAqLwogI2lmZGVmIENPTkZJR19FQVJMWV9QUklOVEsKLSNkZWZpbmUgUFJJTlQoX3MpICAgICAg
IFwKLSAgICAgICAgYWRyICAgcjAsIDk4ZiA7IFwKLSAgICAgICAgYmwgICAgcHV0cyAgICA7IFwK
LSAgICAgICAgYiAgICAgOTlmICAgICA7IFwKLTk4OiAgICAgLmFzY2l6IF9zICAgICA7IFwKLSAg
ICAgICAgLmFsaWduIDIgICAgICA7IFwKKy8qCisgKiBNYWNybyB0byBwcmludCBhIHN0cmluZyB0
byB0aGUgVUFSVCwgaWYgdGhlcmUgaXMgb25lLgorICoKKyAqIENsb2JiZXJzIHIwIC0gcjMKKyAq
LworI2RlZmluZSBQUklOVChfcykgICAgICAgICAgIFwKKyAgICAgICAgbW92ICAgcjMsIGxyICAg
ICAgIDtcCisgICAgICAgIGFkciAgIHIwLCA5OGYgICAgICA7XAorICAgICAgICBibCAgICBwdXRz
ICAgICAgICAgO1wKKyAgICAgICAgbW92ICAgbHIsIHIzICAgICAgIDtcCisgICAgICAgIGIgICAg
IDk5ZiAgICAgICAgICA7XAorOTg6ICAgICAuYXNjaXogX3MgICAgICAgICAgO1wKKyAgICAgICAg
LmFsaWduIDIgICAgICAgICAgIDtcCiA5OToKICNlbHNlIC8qIENPTkZJR19FQVJMWV9QUklOVEsg
Ki8KICNkZWZpbmUgUFJJTlQocykKQEAgLTUwMCwxMCArNTA1LDggQEAgaW5pdF91YXJ0OgogI2lm
ZGVmIEVBUkxZX1BSSU5US19JTklUX1VBUlQKICAgICAgICAgZWFybHlfdWFydF9pbml0IHIxMSwg
cjEsIHIyCiAjZW5kaWYKLSAgICAgICAgYWRyICAgcjAsIDFmCi0gICAgICAgIGIgICAgIHB1dHMg
ICAgICAgICAgICAgICAgICAvKiBKdW1wIHRvIHB1dHMgKi8KLTE6ICAgICAgLmFzY2l6ICItIFVB
UlQgZW5hYmxlZCAtXHJcbiIKLSAgICAgICAgLmFsaWduIDQKKyAgICAgICAgUFJJTlQoIi0gVUFS
VCBlbmFibGVkIC1cclxuIikKKyAgICAgICAgbW92ICAgcGMsIGxyCiAKIC8qCiAgKiBQcmludCBl
YXJseSBkZWJ1ZyBtZXNzYWdlcy4KLS0gCjIuMTEuMAoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
