Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 09A23168413
	for <lists+xen-devel@lfdr.de>; Fri, 21 Feb 2020 17:51:03 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j5BTF-0002ZV-Qg; Fri, 21 Feb 2020 16:48:09 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=P1D7=4J=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1j5BTE-0002ZO-CJ
 for xen-devel@lists.xenproject.org; Fri, 21 Feb 2020 16:48:08 +0000
X-Inumbo-ID: eef30e3d-54c9-11ea-86b3-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id eef30e3d-54c9-11ea-86b3-12813bfff9fa;
 Fri, 21 Feb 2020 16:48:08 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 0BDA9AE41;
 Fri, 21 Feb 2020 16:48:07 +0000 (UTC)
To: David Woodhouse <dwmw2@infradead.org>
References: <8a95f787ca93b23ee8d8c0b55fcc63d22a75c5f3.camel@infradead.org>
 <20200201003303.2363081-6-dwmw2@infradead.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <5bf73b67-6ea5-7929-84ee-dfa708ae1297@suse.com>
Date: Fri, 21 Feb 2020 17:48:09 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200201003303.2363081-6-dwmw2@infradead.org>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 6/8] x86/setup: move vm_init() before
 end_boot_allocator()
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Varad Gautam <vrd@amazon.de>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Hongyan Xia <hongyxia@amazon.com>,
 xen-devel@lists.xenproject.org, Paul Durrant <pdurrant@amazon.co.uk>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDEuMDIuMjAyMCAwMTozMywgRGF2aWQgV29vZGhvdXNlIHdyb3RlOgo+IEZyb206IERhdmlk
IFdvb2Rob3VzZSA8ZHdtd0BhbWF6b24uY28udWs+Cj4gCj4gV2Ugd291bGQgbGlrZSB0byBiZSBh
YmxlIHRvIHVzZSB2bWFwKCkgdG8gbWFwIHRoZSBsaXZlIHVwZGF0ZSBkYXRhLCBhbmQKPiB3ZSBu
ZWVkIHRvIGRvIGEgZmlyc3QgcGFzcyBvZiB0aGUgbGl2ZSB1cGRhdGUgZGF0YSBiZWZvcmUgd2Ug
cHJpbWUgdGhlCj4gaGVhcCBiZWNhdXNlIHdlIG5lZWQgdG8ga25vdyB3aGljaCBwYWdlcyBuZWVk
IHRvIGJlIHByZXNlcnZlZC4KPiAKPiBUaGUgd2FybmluZyBhYm91dCBBQ1BJIGNvZGUgY2FuIGJl
IGRyb3BwZWQsIHNpbmNlIHRoYXQgcHJvYmxlbSBubyBsb25nZXIKPiBleGlzdHMgd2hlbiB0aGlu
Z3MgYXJlIGRvbmUgaW4gdGhpcyBvcmRlci4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBEYXZpZCBXb29k
aG91c2UgPGR3bXdAYW1hem9uLmNvLnVrPgoKUmV2aWV3ZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1
bGljaEBzdXNlLmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
