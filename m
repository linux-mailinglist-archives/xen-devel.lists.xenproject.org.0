Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7376AC0546
	for <lists+xen-devel@lfdr.de>; Fri, 27 Sep 2019 14:37:28 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDpTB-0007TA-Nb; Fri, 27 Sep 2019 12:35:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=tE9W=XW=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1iDpTA-0007T4-Em
 for xen-devel@lists.xenproject.org; Fri, 27 Sep 2019 12:35:32 +0000
X-Inumbo-ID: 4b624b94-e123-11e9-bf31-bc764e2007e4
Received: from foss.arm.com (unknown [217.140.110.172])
 by localhost (Halon) with ESMTP
 id 4b624b94-e123-11e9-bf31-bc764e2007e4;
 Fri, 27 Sep 2019 12:35:31 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4C03F1000;
 Fri, 27 Sep 2019 05:35:31 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 98D9A3F67D;
 Fri, 27 Sep 2019 05:35:30 -0700 (PDT)
To: Oleksandr Tyshchenko <olekstysh@gmail.com>, xen-devel@lists.xenproject.org
References: <1569585474-8955-1-git-send-email-olekstysh@gmail.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <a630303c-7951-385d-2875-da40eca2511a@arm.com>
Date: Fri, 27 Sep 2019 13:35:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <1569585474-8955-1-git-send-email-olekstysh@gmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH V5] xen/arm: Restrict "p2m_ipa_bits"
 according to the IOMMU requirements
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
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 sstabellini@kernel.org, volodymyr_babchuk@epam.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpPbiAyNy8wOS8yMDE5IDEyOjU3LCBPbGVrc2FuZHIgVHlzaGNoZW5rbyB3cm90ZToKPiBG
cm9tOiBPbGVrc2FuZHIgVHlzaGNoZW5rbyA8b2xla3NhbmRyX3R5c2hjaGVua29AZXBhbS5jb20+
Cj4gCj4gVGhlcmUgaXMgYSBzdHJpY3QgcmVxdWlyZW1lbnQgZm9yIHRoZSBJT01NVSB3aGljaCB3
YW50cyB0byBzaGFyZQo+IHRoZSBQMk0gdGFibGUgd2l0aCB0aGUgQ1BVLiBUaGUgSU9NTVUncyBT
dGFnZS0yIGlucHV0IHNpemUgbXVzdCBiZSBlcXVhbAo+IHRvIHRoZSBQMk0gSVBBIHNpemUuIEl0
IGlzIG5vdCBhIHByb2JsZW0gd2hlbiB0aGUgSU9NTVUgY2FuIHN1cHBvcnQKPiBhbGwgdmFsdWVz
IHRoZSBDUFUgc3VwcG9ydHMuIEluIHRoYXQgY2FzZSwgdGhlIElPTU1VIGRyaXZlciB3b3VsZCBq
dXN0Cj4gdXNlIGFueSAicDJtX2lwYV9iaXRzIiB2YWx1ZSBhcyBpcy4gQnV0LCB0aGVyZSBhcmUg
Y2FzZXMgd2hlbiBub3QuCj4gCj4gSW4gb3JkZXIgdG8gbWFrZSBQMk0gc2hhcmluZyBwb3NzaWJs
ZSBvbiB0aGUgcGxhdGZvcm1zIHdoaWNoCj4gSU9NTVVzIGhhdmUgYSBsaW1pdGF0aW9uIGluIG1h
eGltdW0gU3RhZ2UtMiBpbnB1dCBzaXplIGludHJvZHVjZQo+IHRoZSBmb2xsb3dpbmcgbG9naWMu
Cj4gCj4gRmlyc3QgaW5pdGlhbGl6ZSB0aGUgSU9NTVUgc3Vic3lzdGVtIGFuZCBnYXRoZXIgcmVx
dWlyZW1lbnRzIHJlZ2FyZGluZwo+IHRoZSBtYXhpbXVtIElQQSBiaXRzIHN1cHBvcnRlZCBieSBl
YWNoIElPTU1VIGRldmljZSB0byBmaWd1cmUgb3V0Cj4gdGhlIG1pbmltdW0gdmFsdWUgYW1vbmcg
dGhlbS4gSW4gdGhlIFAyTSBjb2RlLCB0YWtlIGludG8gdGhlIGFjY291bnQKPiB0aGUgSU9NTVUg
cmVxdWlyZW1lbnRzIGFuZCBjaG9vc2Ugc3VpdGFibGUgInBhX3JhbmdlIiBhY2NvcmRpbmcKPiB0
byB0aGUgcmVzdHJpY3RlZCAicDJtX2lwYV9iaXRzIi4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBPbGVr
c2FuZHIgVHlzaGNoZW5rbyA8b2xla3NhbmRyX3R5c2hjaGVua29AZXBhbS5jb20+Cj4gQ0M6IEp1
bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+CgpSZXZpZXdlZC1ieTogSnVsaWVuIEdy
YWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KCkNoZWVycywKCi0tIApKdWxpZW4gR3JhbGwKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
