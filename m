Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 01C39189CEE
	for <lists+xen-devel@lfdr.de>; Wed, 18 Mar 2020 14:26:27 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jEYfi-00016J-MB; Wed, 18 Mar 2020 13:23:46 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Ggnj=5D=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jEYfh-00016E-Ok
 for xen-devel@lists.xenproject.org; Wed, 18 Mar 2020 13:23:45 +0000
X-Inumbo-ID: b0674687-691b-11ea-bae8-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b0674687-691b-11ea-bae8-12813bfff9fa;
 Wed, 18 Mar 2020 13:23:44 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id DCD34B13C;
 Wed, 18 Mar 2020 13:23:43 +0000 (UTC)
To: Julien Grall <julien@xen.org>
References: <56f7fe21daff2dc4bf8db7ee356666233bdb0f7a.camel@infradead.org>
 <20200207155701.2781820-1-dwmw2@infradead.org>
 <a531f518-f996-34a0-7218-a746ae210393@suse.com>
 <641040a4aebc62e1e0e3874f513e3a308ec3ace0.camel@infradead.org>
 <9b0d191e-2553-6368-84d6-8425abe23c39@suse.com>
 <6b41e45f-fc91-3a9f-20f8-28d66604adec@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <0fe7ad4a-47a9-afa2-5a4e-aa4a075c20c2@suse.com>
Date: Wed, 18 Mar 2020 14:23:40 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <6b41e45f-fc91-3a9f-20f8-28d66604adec@xen.org>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 1/2] xen/mm: fold PGC_broken into PGC_state
 bits
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Jeff Kubascik <jeff.kubascik@dornerworks.com>,
 Stewart Hildebrand <stewart.hildebrand@dornerworks.com>,
 xen-devel@lists.xenproject.org, David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTguMDMuMjAyMCAxMzozMSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IE9uIDE4LzAzLzIwMjAg
MDk6NTYsIEphbiBCZXVsaWNoIHdyb3RlOgo+PiBPbiAxNy4wMy4yMDIwIDIyOjUyLCBEYXZpZCBX
b29kaG91c2Ugd3JvdGU6Cj4+PiBPbiBUaHUsIDIwMjAtMDItMjAgYXQgMTI6MTAgKzAxMDAsIEph
biBCZXVsaWNoIHdyb3RlOgo+Pj4+IE9uIDA3LjAyLjIwMjAgMTY6NTcsIERhdmlkIFdvb2Rob3Vz
ZSB3cm90ZToKPj4+Pj4gKyNkZWZpbmUgcGFnZV9pc19vZmZsaW5pbmcocGcpwqDCoMKgwqDCoCAo
cGFnZV9zdGF0ZV9pcygocGcpLCBicm9rZW5fb2ZmbGluaW5nKSB8fCBcCj4+Pj4+ICvCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIHBhZ2Vfc3RhdGVfaXMoKHBnKSwgb2ZmbGluaW5nKSkKPj4+Pgo+Pj4+IE92ZXJhbGwg
SSB3b25kZXIgd2hldGhlciB0aGUgUEdDX3N0YXRlXyogb3JkZXJpbmcgY291bGRuJ3QgYmUKPj4+
PiBhZGp1c3RlZCBzdWNoIHRoYXQgYXQgbGVhc3Qgc29tZSBvZiB0aGVzZSB0aHJlZSB3b24ndCBu
ZWVkCj4+Pj4gdHdvIGNvbXBhcmlzb25zIChieSBtYXNraW5nIG9mZiBhIGJpdCBiZWZvcmUgY29t
cGFyaW5nKS4KPj4+Cj4+PiBUaGUgd2hvbGUgcG9pbnQgaW4gdGhpcyBleGVyY2lzZSBpcyB0aGF0
IHRoZXJlIGlzbid0IGEgd2hvbGUgYml0IGZvcgo+Pj4gdGhlc2U7IHRoZXkgYXJlIGVhY2ggKnR3
byogc3RhdGVzIG91dCBvZiB0aGUgcG9zc2libGUgOC4KPj4KPj4gU3VyZS4gQnV0IGp1c3QgY29u
c2lkZXIgdGhlIG1vcmUgZ2VuZXJhbCBjYXNlOiBJbnN0ZWFkIG9mIHdyaXRpbmcKPj4KPj4gwqDC
oMKgwqDCoGlmICggaSA9PSA2IHx8IGkgPT0gNyApCj4+Cj4+IHlvdSBjYW4gYXMgd2VsbCB3cml0
ZQo+Pgo+PiDCoMKgwqDCoMKgaWYgKCAoaSB8IDEpID09IDcgKQo+IAo+IEkgc3R1bWJsZWQgYWNj
cm9zcyBhIGZldyBvZiB0aG9zZSByZWNlbnRseSBhbmQgdGhpcyBpcyBub3QgdGhlCj4gb2J2aW91
cyB0aGluZ3MgdG8gcmVhZC4KCkRlcGVuZHMgb24gdGhlIHJlYWRlciwgSSBndWVzcy4KCj4gWWVz
LCB5b3VyIGNvZGUgbWF5IGJlIGZhc3Rlci4gQnV0IGlzIGl0IHJlYWxseSB3b3J0aCBpdCBjb21w
YXJlCj4gdG8gdGhlIGNvc3Qgb2YgcmVhZGFiaWxpdHkgYW5kIGZ1dHVyZXByb29mbmVzcz8KCk5v
dCBzdXJlIGhvdyBiZWluZyBmdXR1cmUgcHJvb2YgY29tZXMgaW50byBwbGF5IGhlcmUuIEknbSBu
b3QKc3VnZ2VzdGluZyB0byB1c2UgbGl0ZXJhbCBudW1iZXJzLiBJJ2QgYWxzbyBiZSBoYXBweSB0
byBiZSBwcm92ZW4Kd3JvbmcgaW4gYXNzdW1pbmcgdGhhdCB0aGUgY29tcGlsZXIgc3RpbGwgY2Fu
J3QgZG8gc3VjaAp0cmFuc2Zvcm1hdGlvbnMgaXRzZWxmOyBpdCBjb3VsZG4ndCB3aGVuIEkgY2hl
Y2sgYSB3aGlsZSBiYWNrLgpSZWR1Y2luZyB0aGUgbnVtYmVyIG9mIGNvbmRpdGlvbmFsIGJyYW5j
aGVzIGlzLCBpbW8sIHdvcnRoIGF0CmxlYXN0IHNvbWUgZWZmb3J0IGF0IHRoZSBzb3VyY2UgbGV2
ZWwuCgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
