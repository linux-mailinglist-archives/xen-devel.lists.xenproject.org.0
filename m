Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 240987B1EF
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jul 2019 20:27:04 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hsWnC-0004Lf-74; Tue, 30 Jul 2019 18:24:10 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=7c++=V3=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hsWnA-0004La-W7
 for xen-devel@lists.xenproject.org; Tue, 30 Jul 2019 18:24:09 +0000
X-Inumbo-ID: 381fae0a-b2f7-11e9-ba0b-735c837b3b03
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 381fae0a-b2f7-11e9-ba0b-735c837b3b03;
 Tue, 30 Jul 2019 18:24:08 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8F2D62087F;
 Tue, 30 Jul 2019 18:24:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1564511047;
 bh=niOJC0ff6LK1CGPfxZn/NH2dTNinGQyelOxEZ6D5yvg=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=lbhuSE8f0PLsZomTeYljbNjEGSSVkO6D223/WWqjxhhLZGwefSDLUfhUATvWMZDyC
 Jmj5x4Tnhary5AXqTWogbF+HJSCX3UWZCsNOlypZpXi8uSzuWDh/T1GxnpGK/hQji2
 L1z0T+3G8Wx+Cka+4+UXNY2URPXNZVudaa5fkDPc=
Date: Tue, 30 Jul 2019 11:24:07 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien.grall@arm.com>
In-Reply-To: <20190722213958.5761-19-julien.grall@arm.com>
Message-ID: <alpine.DEB.2.21.1907301121510.28600@sstabellini-ThinkPad-T480s>
References: <20190722213958.5761-1-julien.grall@arm.com>
 <20190722213958.5761-19-julien.grall@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v2 18/35] xen/arm64: head: Introduce a macro
 to get a PC-relative address of a symbol
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
Cc: xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCAyMiBKdWwgMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IEFybTY0IHByb3ZpZGVz
IGluc3RydWN0aW9ucyB0byBsb2FkIGEgUEMtcmVsYXRpdmUgYWRkcmVzcywgYnV0IHdpdGggc29t
ZQo+IGxpbWl0YXRpb25zOgo+ICAgIC0gYWRyIGlzIGVuYWJsZSB0byBjb3BlIHdpdGggKy8tMU1C
Cj4gICAgLSBhZHJwIGlzIGVuYWxlIHRvIGNvcGUgd2l0aCArLy00R0IgYnV0IHJlbGF0aXZlIHRv
IGEgNEtCIHBhZ2UKPiAgICAgIGFkZHJlc3MKPiAKPiBCZWNhdXNlIG9mIHRoYXQsIHRoZSBjb2Rl
IHJlcXVpcmVzIHRvIHVzZSAyIGluc3RydWN0aW9ucyB0byBsb2FkIGFueSBYZW4KPiBzeW1ib2wu
IFRvIG1ha2UgdGhlIGNvZGUgbW9yZSBvYnZpb3VzLCBpbnRyb2R1Y2luZyBhIG5ldyBtYWNybyBh
ZHJfbCBpcwo+IGludHJvZHVjZWQuCj4gCj4gVGhlIG5ldyBtYWNybyBpcyB1c2VkIHRvIHJlcGxh
Y2UgYSBjb3VwbGUgb2Ygb3Blbi1jb2RlZCB1c2UgaW4KPiBlZmlfeGVuX3N0YXJ0Lgo+IAo+IFRo
ZSBtYWNybyBpcyBjb3BpZWQgZnJvbSBMaW51eCA1LjItcmM0LgoKSSB3YXMgZ29pbmcgdG8gYXNr
IHdoeSB0aGUgc3RyYW5nZSBuYW1lICJhZHJfbCIsIG5vdyBJIGtub3cgd2h5IDotKQoKSSdkIHN1
Z2dlc3QgdG8gbmFtZSBpdCBtb3JlIGNsZWFybHkgdG8gbWF5YmUgImFkcl9yZWxhdGl2ZSI/Cklu
IGFueSBjYXNlOgoKQWNrZWQtYnk6IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2Vy
bmVsLm9yZz4KCgo+IFNpZ25lZC1vZmYtYnk6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFy
bS5jb00+CgpUeXBvIGluIHlvdXIgYWRkcmVzcwoKCj4gLS0tCj4gICAgIENoYW5nZXMgaW4gdjI6
Cj4gICAgICAgICAtIFBhdGNoIGFkZGVkCj4gLS0tCj4gIHhlbi9hcmNoL2FybS9hcm02NC9oZWFk
LlMgfCAxOCArKysrKysrKysrKysrKy0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDE0IGluc2VydGlv
bnMoKyksIDQgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9hcm02
NC9oZWFkLlMgYi94ZW4vYXJjaC9hcm0vYXJtNjQvaGVhZC5TCj4gaW5kZXggOWFmZDg5ZDQ0Ny4u
MjI4N2YzY2U0OCAxMDA2NDQKPiAtLS0gYS94ZW4vYXJjaC9hcm0vYXJtNjQvaGVhZC5TCj4gKysr
IGIveGVuL2FyY2gvYXJtL2FybTY0L2hlYWQuUwo+IEBAIC0xMTEsNiArMTExLDE4IEBACj4gIAo+
ICAjZW5kaWYgLyogIUNPTkZJR19FQVJMWV9QUklOVEsgKi8KPiAgCj4gKy8qCj4gKyAqIFBzZXVk
by1vcCBmb3IgUEMgcmVsYXRpdmUgYWRyIDxyZWc+LCA8c3ltYm9sPiB3aGVyZSA8c3ltYm9sPiBp
cwo+ICsgKiB3aXRoaW4gdGhlIHJhbmdlICsvLSA0R0Igb2YgdGhlIFBDLgo+ICsgKgo+ICsgKiBA
ZHN0OiBkZXN0aW5hdGlvbiByZWdpc3RlciAoNjQgYml0IHdpZGUpCj4gKyAqIEBzeW06IG5hbWUg
b2YgdGhlIHN5bWJvbAo+ICsgKi8KPiArLm1hY3JvICBhZHJfbCwgZHN0LCBzeW0KPiArICAgICAg
ICBhZHJwIFxkc3QsIFxzeW0KPiArICAgICAgICBhZGQgIFxkc3QsIFxkc3QsIDpsbzEyOlxzeW0K
PiArLmVuZG0KPiArCj4gIC8qIExvYWQgdGhlIHBoeXNpY2FsIGFkZHJlc3Mgb2YgYSBzeW1ib2wg
aW50byB4YiAqLwo+ICAubWFjcm8gbG9hZF9wYWRkciB4Yiwgc3ltCj4gICAgICAgICAgbGRyIFx4
YiwgPVxzeW0KPiBAQCAtODg2LDExICs4OTgsOSBAQCBFTlRSWShlZmlfeGVuX3N0YXJ0KQo+ICAg
ICAgICAgICAqIEZsdXNoIGRjYWNoZSBjb3ZlcmluZyBjdXJyZW50IHJ1bnRpbWUgYWRkcmVzc2Vz
Cj4gICAgICAgICAgICogb2YgeGVuIHRleHQvZGF0YS4gVGhlbiBmbHVzaCBhbGwgb2YgaWNhY2hl
Lgo+ICAgICAgICAgICAqLwo+IC0gICAgICAgIGFkcnAgIHgxLCBfc3RhcnQKPiAtICAgICAgICBh
ZGQgICB4MSwgeDEsICM6bG8xMjpfc3RhcnQKPiArICAgICAgICBhZHJfbCB4MSwgX3N0YXJ0Cj4g
ICAgICAgICAgbW92ICAgeDAsIHgxCj4gLSAgICAgICAgYWRycCAgeDIsIF9lbmQKPiAtICAgICAg
ICBhZGQgICB4MiwgeDIsICM6bG8xMjpfZW5kCj4gKyAgICAgICAgYWRyX2wgeDIsIF9lbmQKPiAg
ICAgICAgICBzdWIgICB4MSwgeDIsIHgxCj4gIAo+ICAgICAgICAgIGJsICAgIF9fZmx1c2hfZGNh
Y2hlX2FyZWEKPiAtLSAKPiAyLjExLjAKPiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
