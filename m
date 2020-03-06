Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B2DA17BBEE
	for <lists+xen-devel@lfdr.de>; Fri,  6 Mar 2020 12:44:27 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jABMT-0000CA-Tq; Fri, 06 Mar 2020 11:41:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=JlMq=4X=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jABMT-0000C5-48
 for xen-devel@lists.xenproject.org; Fri, 06 Mar 2020 11:41:49 +0000
X-Inumbo-ID: 769090aa-5f9f-11ea-b52f-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 769090aa-5f9f-11ea-b52f-bc764e2007e4;
 Fri, 06 Mar 2020 11:41:48 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 150B4AC23;
 Fri,  6 Mar 2020 11:41:47 +0000 (UTC)
To: pdurrant@amzn.com
References: <20200305124504.3564-1-pdurrant@amzn.com>
 <20200305124504.3564-2-pdurrant@amzn.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <a03ffabd-14e7-703c-ad0a-ef716030fd1a@suse.com>
Date: Fri, 6 Mar 2020 12:41:49 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200305124504.3564-2-pdurrant@amzn.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3 1/6] domain: introduce
 alloc/free_shared_info() helpers...
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
 Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <pdurrant@amazon.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDUuMDMuMjAyMCAxMzo0NCwgcGR1cnJhbnRAYW16bi5jb20gd3JvdGU6Cj4gRnJvbTogUGF1
bCBEdXJyYW50IDxwZHVycmFudEBhbWF6b24uY29tPgo+IAo+IC4uLiBhbmQgc2F2ZSB0aGUgTUZO
Lgo+IAo+IFRoaXMgcGF0Y2ggbW9kaWZpZXMgdGhlICdzaGFyZWRfaW5mbycgZmllbGQgb2Ygc3Ry
dWN0IGRvbWFpbiB0byBiZQo+IGEgc3RydWN0dXJlIGNvbXByaXNpbmcgYW4gTUZOIGFuZCBhIHZp
cnR1YWwgYWRkcmVzcy4gQWxsb2NhdGlvbnMgYXJlCj4gc3RpbGwgZG9uZSBmcm9tIHhlbmhlYXAs
IHNvIHRoZSB2aXJ0dWFsIGFkZHJlc3Mgc3RpbGwgZXF1YXRlcyB0bwo+IHZpcnRfdG9fbWZuKCkg
Y2FsbGVkIG9uIHRoZSBNRk4gYnV0IHN1YnNlcXVlbnQgcGF0Y2ggd2lsbCBjaGFuZ2UgdGhpcy4K
PiBIZW5jZSB0aGUgbmVlZCB0byBzYXZlIHRoZSBNRk4uCj4gCj4gTk9URTogV2hpc3QgZGVmaW5p
bmcgdGhlIG5ldyBoZWxwZXJzLCB2aXJ0X3RvX21mbigpIGluIGNvbW1vbi9kb21haW4uYwo+ICAg
ICAgIGlzIG1hZGUgdHlwZSBzYWZlLgo+ICAgICAgIFRoZSBkZWZpbml0aW9uIG9mIG5taV9yZWFz
b24oKSBpbiBhc20teDg2L3NoYXJlZC5oIGlzIGFsc28gcmUtCj4gICAgICAgZmxvd2VkIHRvIGF2
b2lkIG92ZXJseSBsb25nIGxpbmVzLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFBhdWwgRHVycmFudCA8
cGR1cnJhbnRAYW1hem9uLmNvbT4KPiBSZXZpZXdlZC1ieTogSnVsaWVuIEdyYWxsIDxqdWxpZW5A
eGVuLm9yZz4KClRoaXMgcGF0Y2ggYnkgaXRzZWxmIGxvb2tzIG9rYXksIGJ1dCBvZiBjb3Vyc2Ug
aW5jcmVhc2VzIHN0b3JhZ2UKcmVxdWlyZW1lbnRzIGEgbGl0dGxlLiBUaGVyZWZvcmUKQWNrZWQt
Ynk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4Kb25seSBpZiB3ZSByZWFjaCBhZ3Jl
ZW1lbnQgdGhhdCB0aGUgZmluYWwgcGF0Y2ggaW4gdGhpcyBzZXJpZXMgaXMKYWxzbyB0byBnbyBp
biwgd2hpY2ggSSdtIHlldCB0byBiZSBjb252aW5jZWQgb2YuCgpKYW4KCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
