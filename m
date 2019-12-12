Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E6A0C11D6C2
	for <lists+xen-devel@lfdr.de>; Thu, 12 Dec 2019 20:04:33 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ifThG-0003Q2-Vk; Thu, 12 Dec 2019 19:00:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=VXz7=2C=davemloft.net=davem@srs-us1.protection.inumbo.net>)
 id 1ifThG-0003Pv-B0
 for xen-devel@lists.xenproject.org; Thu, 12 Dec 2019 19:00:22 +0000
X-Inumbo-ID: a4ce129c-1d11-11ea-a1e1-bc764e2007e4
Received: from shards.monkeyblade.net (unknown [2620:137:e000::1:9])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a4ce129c-1d11-11ea-a1e1-bc764e2007e4;
 Thu, 12 Dec 2019 19:00:20 +0000 (UTC)
Received: from localhost (unknown [IPv6:2601:601:9f00:1c3::3d5])
 (using TLSv1 with cipher AES256-SHA (256/256 bits))
 (Client did not present a certificate)
 (Authenticated sender: davem-davemloft)
 by shards.monkeyblade.net (Postfix) with ESMTPSA id B7C16153DFA42;
 Thu, 12 Dec 2019 11:00:19 -0800 (PST)
Date: Thu, 12 Dec 2019 11:00:19 -0800 (PST)
Message-Id: <20191212.110019.462290546870002203.davem@davemloft.net>
To: pdurrant@amazon.com
From: David Miller <davem@davemloft.net>
In-Reply-To: <20191212123723.21548-1-pdurrant@amazon.com>
References: <20191212123723.21548-1-pdurrant@amazon.com>
X-Mailer: Mew version 6.8 on Emacs 26.1
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12
 (shards.monkeyblade.net [149.20.54.216]);
 Thu, 12 Dec 2019 11:00:20 -0800 (PST)
Subject: Re: [Xen-devel] [PATCH net] xen-netback: avoid race that can lead
 to NULL pointer dereference
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
Cc: jgross@suse.com, wei.liu@kernel.org, jakub.kicinski@netronome.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogUGF1bCBEdXJyYW50IDxwZHVycmFudEBhbWF6b24uY29tPgpEYXRlOiBUaHUsIDEyIERl
YyAyMDE5IDEyOjM3OjIzICswMDAwCgo+IENvbW1pdCAyYWMwNjFjZTk3ZjQgKCJ4ZW4vbmV0YmFj
azogY2xlYW51cCBpbml0IGFuZCBkZWluaXQgY29kZSIpCj4gaW50cm9kdWNlZCBhIHByb2JsZW0u
IEluIGZ1bmN0aW9uIHhlbnZpZl9kaXNjb25uZWN0X3F1ZXVlKCksIHRoZSB2YWx1ZSBvZgo+IHF1
ZXVlLT5yeF9pcnEgaXMgemVyb2VkICpiZWZvcmUqIHF1ZXVlLT50YXNrIGlzIHN0b3BwZWQuIFVu
Zm9ydHVuYXRlbHkgdGhhdAo+IHRhc2sgbWF5IGNhbGwgbm90aWZ5X3JlbW90ZV92aWFfaXJxKHF1
ZXVlLT5yeF9pcnEpIGFuZCBjYWxsaW5nIHRoYXQKPiBmdW5jdGlvbiB3aXRoIGEgemVybyB2YWx1
ZSByZXN1bHRzIGluIGEgTlVMTCBwb2ludGVyIGRlcmVmZXJlbmNlIGluCj4gZXZ0Y2huX2Zyb21f
aXJxKCkuCj4gCj4gVGhpcyBwYXRjaCBzaW1wbHkgcmUtb3JkZXJzIHRoaW5ncywgc3RvcHBpbmcg
YWxsIHRhc2tzIGJlZm9yZSB6ZXJvLWluZyB0aGUKPiBpcnEgdmFsdWVzLCB0aGVyZWJ5IGF2b2lk
aW5nIHRoZSBwb3NzaWJpbGl0eSBvZiB0aGUgcmFjZS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBQYXVs
IER1cnJhbnQgPHBkdXJyYW50QGFtYXpvbi5jb20+CgpQbGVhc2UgcmVwb3N0IHRoaXMgd2l0aCBh
biBhcHByb3ByaWF0ZSBGaXhlczogdGFnLgoKQW5kIHRoZW4geW91IGNhbiByZW1vdmVkIHRoZSBl
eHBsaWNpdCBjb21taXQgcmVmZXJlbmNlIGZyb20gdGhlIGxvZyBtZXNzYWdlCmFuZCBzaW1wbHkg
c2F5ICJUaGUgY29tbWl0IG1lbnRpb25lZCBpbiB0aGUgRml4ZXMgdGFnIGludHJvZHVjZWQgYSBw
cm9ibGVuIC4uLiIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
