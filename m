Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A306117B83E
	for <lists+xen-devel@lfdr.de>; Fri,  6 Mar 2020 09:22:01 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jA8CM-0005Vq-0S; Fri, 06 Mar 2020 08:19:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=JlMq=4X=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jA8CK-0005Vl-Qi
 for xen-devel@lists.xenproject.org; Fri, 06 Mar 2020 08:19:08 +0000
X-Inumbo-ID: 26741676-5f83-11ea-8eb5-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 26741676-5f83-11ea-8eb5-bc764e2007e4;
 Fri, 06 Mar 2020 08:19:08 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 61977AFDB;
 Fri,  6 Mar 2020 08:19:07 +0000 (UTC)
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
References: <20200226124705.29212-1-jgross@suse.com>
 <20200226124705.29212-5-jgross@suse.com>
 <b9398158-4f27-b0e0-f3e3-12eb398dd616@suse.com>
 <83dd1317-cda4-5e39-0c36-3f526b488c6c@suse.com>
 <67266e10-3b87-a48c-53aa-2caac8ea61b7@suse.com>
 <81ed41b2-9d8e-b0c3-e8c9-20b04a4b51ff@suse.com>
 <5acb0709-9a53-3314-9e40-418cc6246700@suse.com>
 <d6c474e3-f2a5-5f7c-01e8-cb6ad7533ebd@suse.com>
 <db0355a2-c00e-b84e-64d7-55a6dc7d0859@suse.com>
 <c799989e-fc68-15f9-4d1f-3e1d8d452fcc@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <db9f4d33-8059-4e27-c44a-cef59d0a5144@suse.com>
Date: Fri, 6 Mar 2020 09:19:09 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <c799989e-fc68-15f9-4d1f-3e1d8d452fcc@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v6 04/12] xen: add basic hypervisor
 filesystem support
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
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDYuMDMuMjAyMCAwNzowNiwgSsO8cmdlbiBHcm/DnyB3cm90ZToKPiBPbiAwNC4wMy4yMCAx
NjoyMSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IE9uIDA0LjAzLjIwMjAgMTY6MTQsIErDvHJnZW4g
R3Jvw58gd3JvdGU6Cj4+PiBPbiAwNC4wMy4yMCAxNjowNywgSmFuIEJldWxpY2ggd3JvdGU6Cj4+
Pj4gT24gMDQuMDMuMjAyMCAxNTozOSwgSsO8cmdlbiBHcm/DnyB3cm90ZToKPj4+Pj4gT24gMDQu
MDMuMjAgMTQ6MDMsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+Pj4gT24gMDQuMDMuMjAyMCAxMzow
MCwgSsO8cmdlbiBHcm/DnyB3cm90ZToKPj4+Pj4+PiBJdCBpcyBwZXJmZWN0bHkgdmFsaWQgdG8g
d3JpdGUgYSBzaG9ydGVyIHN0cmluZyBpbnRvIGEgY2hhcmFjdGVyCj4+Pj4+Pj4gYXJyYXkuIEkg
Y291bGQgZHJvcCB0aGUgYmxvYiBoZXJlLCBidXQgaW4gdGhlIGVuZCBJIHRoaW5rIGFsbG93aW5n
Cj4+Pj4+Pj4gZm9yIGEgYmxvYiB0byBjaGFuZ2UgdGhlIHNpemUgc2hvdWxkIGJlIGZpbmUuCj4+
Pj4+Pgo+Pj4+Pj4gQnV0IHNob3VsZG4ndCB0aGlzIHRoZW4gYWxzbyBhZGp1c3QgdGhlIHJlY29y
ZGVkIHNpemU/Cj4+Pj4+Cj4+Pj4+IE5vLCB0aGlzIGlzIHRoZSBtYXggc2l6ZSBvZiB0aGUgYnVm
ZmVyICh5b3UgY2FuIGhhdmUgYSBsb29rIGF0IHBhdGNoIDkKPj4+Pj4gd2hlcmUgdGhlIHNpemUg
aXMgc2V0IHRvIHRoZSBwcm92aWRlZCBzcGFjZSBmb3IgY3VzdG9tIGFuZCBzdHJpbmcKPj4+Pj4g
cGFyYW1ldGVycykuCj4+Pj4KPj4+PiBJZiBJJ20gbm90IG1pc3Rha2VuIGl0IGlzIGh5cGZzX3Jl
YWRfbGVhZigpIHdoaWNoIHByb2Nlc3NlcyByZWFkCj4+Pj4gcmVxdWVzdHMgZm9yIHN0cmluZ3Mu
IFlldCB0aGF0IGNvcGllcyBlbnRyeS0+c2l6ZSBieXRlcywgbm90IHRoZQo+Pj4+IHBvdGVudGlh
bGx5IHNtYWxsZXIgc3RybGVuKCktYm91bmRlZCBwYXlsb2FkLiBUaGluZ3Mgd291bGQgYmUKPj4+
Cj4+PiBUaGVyZSBpcyBubyByaXNrIG9mIGxlYWtpbmcgcHJvYmxlbWF0aWMgZGF0YSBoZXJlLgo+
Pgo+PiBJIGRpZG4ndCB0aGluayBvZiBsZWFrcywgYnV0IHJhdGhlciBvZiBjb25zdW1lcnMgbG9v
a2luZyBhdCB0aGUKPj4gc2l6ZSBhbmQgc3RybGVuKCkgYW5kIGdldHRpbmcgY29uZnVzZWQgYWJv
dXQgdGhlIG1pc21hdGNoLgo+IAo+IEkgdGhpbmsgdGVsbGluZyB0aGUgbWF4aW11bSBwb3NzaWJs
ZSB3cml0ZSBsZW5ndGggaXMgbWFuZGF0b3J5Lgo+IAo+IFNvIGVpdGhlciBJIGNhbiBhZGQgYSBj
b21tZW50IHRvIHRoZSBoZWFkZXIgc2F5aW5nIHRoYXQgZm9yIHN0cmluZ3MKPiBhbmQgYmxvYnMg
dGhlIGxlbmd0aCBpcyB0aGUgbWF4aW11bSB2YWx1ZSBhbmQgdGhlIGNvbnRlbnQgaXMgdG8gYmUK
PiBzZWxmLWRlc2NyaXB0aXZlIHJlZ2FyZGluZyBpdHMgdHJ1ZSBsZW5ndGggKHdoaWNoIGlzIHRo
ZSBjYXNlIGZvcgo+IHN0cmluZ3MgZHVlIHRvIHRoZSB0ZXJtaW5hdGluZyAwIGJ5dGUpLCBvciBJ
IG5lZWQgdHdvIHNpemUgZmllbGRzOgo+IG9uZSBmb3IgdGhlIGFjdHVhbCBzaXplIGFuZCBvbmUg
Zm9yIHRoZSBtYXhpbXVtIGFsbG93ZWQgc2l6ZSBmb3IKPiB3cml0ZXMgKHRoaXMgY291bGQgdGhl
biByZXBsYWNlIHRoZSB3cml0YWJsZSBmbGFnIHdpdGggIjAiIGZvciAibm90Cj4gd3JpdGFibGUi
KS4KClBlcnNvbmFsbHkgSSdkIHByZWZlciB0aGUgbGF0dGVyLCBidXQgSSBjb3VsZCBhbHNvIGxp
dmUgd2l0aCBhCmNvbW1lbnQuIFRoZSBzZWxmLWRlc2NyaXB0aXZlIHBhcnQgbWF5LCBmb3IgYmxv
YnMgb3IgZ3ppcC1lZApkYXRhLCBiZSBwcm9ibGVtYXRpYyB0aG91Z2guCgpKYW4KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
