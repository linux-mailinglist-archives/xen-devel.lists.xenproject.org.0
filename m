Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BCB2257F2D
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jun 2019 11:22:44 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hgQZT-0007Vd-W8; Thu, 27 Jun 2019 09:19:59 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ndTn=U2=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hgQZS-0007VY-U5
 for xen-devel@lists.xenproject.org; Thu, 27 Jun 2019 09:19:58 +0000
X-Inumbo-ID: b9c9cd78-98bc-11e9-ad73-ffdab950e947
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id b9c9cd78-98bc-11e9-ad73-ffdab950e947;
 Thu, 27 Jun 2019 09:19:55 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C3CB32B;
 Thu, 27 Jun 2019 02:19:54 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1D6F33F718;
 Thu, 27 Jun 2019 02:19:54 -0700 (PDT)
To: Stefano Stabellini <sstabellini@kernel.org>
References: <20190610193215.23704-1-julien.grall@arm.com>
 <20190610193215.23704-16-julien.grall@arm.com>
 <alpine.DEB.2.21.1906261202110.5851@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <f0331fe2-0132-eadb-e024-d7e2b145c5a8@arm.com>
Date: Thu, 27 Jun 2019 10:19:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.1906261202110.5851@sstabellini-ThinkPad-T480s>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 15/17] xen/arm64: head: Rework and document
 setup_fixmap()
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
Cc: xen-devel@lists.xenproject.org, Oleksandr_Tyshchenko@epam.com,
 andrii_anisov@epam.com, andre.przywara@arm.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgU3RlZmFubywKCk9uIDI2LzA2LzIwMTkgMjA6MDIsIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90
ZToKPiBPbiBNb24sIDEwIEp1biAyMDE5LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+IEF0IHRoZSBt
b21lbnQsIHRoZSBmaXhtYXAgdGFibGUgaXMgb25seSBob29rZWQgd2hlbiBlYXJseXByaW50ayBp
cyB1c2VkLgo+PiBUaGlzIGlzIGZpbmUgdG9kYXkgYmVjYXVzZSBpbiBDIGxhbmQsIHRoZSBmaXht
YXAgaXMgbm90IHVzZWQgYnkgYW55b25lCj4+IHVudGlsIHRoZSB0aGUgYm9vdCBDUFUgaXMgc3dp
dGNoaW5nIHRvIHRoZSBydW50aW1lIHBhZ2UtdGFibGVzLgo+Pgo+PiBJbiB0aGUgZnV0dXJlLCB0
aGUgYm9vdCBDUFUgd2lsbCBub3Qgc3dpdGNoIGJldHdlZW4gcGFnZS10YWJsZXMgdG8gYXZvaWQK
Pj4gVExCIGNvbmZsaWN0LiBUaGlzIG1lYW5zIHRoZSBmaXhtYXAgdGFibGUgd2lsbCBuZWVkIHRv
IGJlIGhvb2tlZCBiZWZvcmUKPj4gYW55IHVzZS4gRm9yIHNpbXBsaWNpdHksIHNldHVwX2ZpeG1h
cCgpIHdpbGwgbm93IGRvIHRoYXQgam9iLgo+Pgo+PiBMYXN0bHksIGRvY3VtZW50IHRoZSBiZWhh
dmlvciBhbmQgdGhlIG1haW4gcmVnaXN0ZXJzIHVzYWdlIHdpdGhpbiB0aGUKPj4gZnVuY3Rpb24u
Cj4+Cj4+IFNpZ25lZC1vZmYtYnk6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+
Cj4+IC0tLQo+PiAgIHhlbi9hcmNoL2FybS9hcm02NC9oZWFkLlMgfCAxMyArKysrKysrKysrKy0t
Cj4+ICAgMSBmaWxlIGNoYW5nZWQsIDExIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4+
Cj4+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vYXJtNjQvaGVhZC5TIGIveGVuL2FyY2gvYXJt
L2FybTY0L2hlYWQuUwo+PiBpbmRleCA5NmU4NWY4ODM0Li40ZjdmYTY3NjlmIDEwMDY0NAo+PiAt
LS0gYS94ZW4vYXJjaC9hcm0vYXJtNjQvaGVhZC5TCj4+ICsrKyBiL3hlbi9hcmNoL2FybS9hcm02
NC9oZWFkLlMKPj4gQEAgLTcwMCw4ICs3MDAsMTcgQEAgaWRfbWFwX3JlbW92ZWQ6Cj4+ICAgICAg
ICAgICByZXQKPj4gICBFTkRQUk9DKHJlbW92ZV9pZF9tYXApCj4+ICAgCj4+ICsvKgo+PiArICog
TWFwIHRoZSBVQVJUIGluIHRoZSBmaXhtYXAgKHdoZW4gZWFybHlwcmludGsgaXMgdXNlZCkgYW5k
IGhvb2sgdGhlCj4+ICsgKiBmaXhtYXAgdGFibGUgaW4gdGhlIHBhZ2UgdGFibGVzLgo+PiArICoK
Pj4gKyAqIFRoZSBmaXhtYXAgY2Fubm90IGJlIG1hcHBlZCBpbiBjcmVhdGVfcGFnZV90YWJsZXMg
YmVjYXVzZSBpdCBtYXkKPj4gKyAqIGNsYXNoIHdpdGggdGhlIElEIG1hcC4KPj4gKyAqCj4+ICsg
KiBDbG9iYmVycyB4MCAtIHgxCj4gCj4gSSBtaXNzZWQgdGhpcyBpbiB0aGUgbGFzdCBlbWFpbDog
aXQgc2hvdWxkIGJlIHgwIC0geDQ/Cgp4MCBpcyBub3QgdXNlZCBpbiB0aGUgc2V0dXBfZml4bWFw
LiBTbyBpdCBzaG91bGQgYmUgeDEgLSB4NC4KCkNoZWVycywKCi0tIApKdWxpZW4gR3JhbGwKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
