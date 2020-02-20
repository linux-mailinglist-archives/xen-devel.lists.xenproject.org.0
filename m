Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F326B16592C
	for <lists+xen-devel@lfdr.de>; Thu, 20 Feb 2020 09:29:25 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j4hBM-0004Fs-Ak; Thu, 20 Feb 2020 08:27:40 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=vvQh=4I=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1j4hBK-0004FY-Bk
 for xen-devel@lists.xenproject.org; Thu, 20 Feb 2020 08:27:38 +0000
X-Inumbo-ID: d94ecb58-53ba-11ea-84e6-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d94ecb58-53ba-11ea-84e6-12813bfff9fa;
 Thu, 20 Feb 2020 08:27:36 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 0754EAC8F;
 Thu, 20 Feb 2020 08:27:36 +0000 (UTC)
To: Jan Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
References: <20200213113237.58795-1-roger.pau@citrix.com>
 <20200213113237.58795-2-roger.pau@citrix.com>
 <6700a65f-44eb-401f-755a-ebb5d68b9b21@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <8abb37bc-e1e8-d9ab-d66e-4c0e9c8f4da3@suse.com>
Date: Thu, 20 Feb 2020 09:27:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <6700a65f-44eb-401f-755a-ebb5d68b9b21@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 1/2] smp: convert the cpu maps lock into a
 rw lock
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
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xenproject.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjAuMDIuMjAgMDk6MTMsIEphbiBCZXVsaWNoIHdyb3RlOgo+IE9uIDEzLjAyLjIwMjAgMTI6
MzIsIFJvZ2VyIFBhdSBNb25uZSB3cm90ZToKPj4gTW9zdCB1c2VycyBvZiB0aGUgY3B1IG1hcHMg
anVzdCBjYXJlIGFib3V0IHRoZSBtYXBzIG5vdCBjaGFuZ2luZyB3aGlsZQo+PiB0aGUgbG9jayBp
cyBiZWluZyBoZWxkLCBidXQgZG9uJ3QgYWN0dWFsbHkgbW9kaWZ5IHRoZSBtYXBzLgo+Pgo+PiBD
b252ZXJ0IHRoZSBsb2NrIGludG8gYSBydyBsb2NrLCBhbmQgdGFrZSB0aGUgbG9jayBpbiByZWFk
IG1vZGUgaW4KPj4gZ2V0X2NwdV9tYXBzIGFuZCBpbiB3cml0ZSBtb2RlIGluIGNwdV9ob3RwbHVn
X2JlZ2luLiBUaGlzIHdpbGwgbG93ZXIKPj4gdGhlIGNvbnRlbnRpb24gYXJvdW5kIHRoZSBsb2Nr
LCBzaW5jZSBwbHVnIGFuZCB1bnBsdWcgb3BlcmF0aW9ucyB0aGF0Cj4+IHRha2UgdGhlIGxvY2sg
aW4gd3JpdGUgbW9kZSBhcmUgbm90IHRoYXQgY29tbW9uLgo+Pgo+PiBOb3RlIHRoYXQgdGhlIHJl
YWQgbG9jayBjYW4gYmUgdGFrZW4gcmVjdXJzaXZlbHkgKGFzIGl0J3MgYSBzaGFyZWQKPj4gbG9j
ayksIGFuZCBoZW5jZSB3aWxsIGtlZXAgdGhlIHNhbWUgYmVoYXZpb3IgYXMgdGhlIHByZXZpb3Vz
bHkgdXNlZAo+PiByZWN1cnNpdmUgbG9jay4gQXMgZm9yIHRoZSB3cml0ZSBsb2NrLCBpdCdzIG9u
bHkgdXNlZCBieSBDUFUKPj4gcGx1Zy91bnBsdWcgb3BlcmF0aW9ucywgYW5kIHRoZSBsb2NrIGlz
IG5ldmVyIHRha2VuIHJlY3Vyc2l2ZWx5IGluCj4+IHRoYXQgY2FzZS4KPj4KPj4gV2hpbGUgdGhl
cmUgYWxzbyBjaGFuZ2UgZ2V0X2NwdV9tYXBzIHJldHVybiB0eXBlIHRvIGJvb2wuCj4+Cj4+IFJl
cG9ydGVkLWJ5OiBKdWxpZW4gR3JhbGwgPGp1bGllbkB4ZW4ub3JnPgo+PiBTdWdnZXN0ZWQtYWxz
by1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgo+PiBTaWduZWQtb2ZmLWJ5OiBS
b2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KPiAKPiBJJ20gYWZyYWlkIEkg
Y2FuJ3Qgc2VlIGhvdyBvZmZsaW5pbmcgYSBDUFUgd291bGQgbm93IHdvcmsuCj4gQ29uZGVuc2Vk
IHRvIGp1c3QgdGhlIHJlbGV2YW50IGNhbGxzLCB0aGUgc2VxdWVuY2UgZnJvbQo+IGNwdV9kb3du
KCkgaXMKPiAKPiBjcHVfaG90cGx1Z19iZWdpbigpIChpLmUuIGxvY2sgdGFrZW4gaW4gd3JpdGUg
bW9kZSkKPiBzdG9wX21hY2hpbmVfcnVuKCkKPiAtPiBnZXRfY3B1X21hcHMoKSAobG9jayB1bmF2
YWlsYWJsZSB0byByZWFkZXJzKQoKSSd2ZSBhbHJlYWR5IHBvaW50ZWQgdGhhdCBvdXQgaW4gYW5v
dGhlciB0aHJlYWQuIDotKQoKPiAKPiBPdGhlciB0aGFuIHJlY3Vyc2l2ZSBzcGluIGxvY2tzLCBy
dyBsb2NrcyBkb24ndCBjdXJyZW50bHkKPiBoYXZlIGEgY29uY2VwdCBvZiBwZXJtaXR0aW5nIGlu
IGEgcmVhZGVyIHdoZW4gdGhpcyBDUFUKPiBhbHJlYWR5IGhvbGRzIHRoZSBsb2NrIGluIHdyaXRl
IG1vZGUuIEhlbmNlIEkgY2FuJ3Qgc2VlCj4gaG93IHRoZSBnZXRfY3B1X21hcHMoKSBhYm92ZSB3
b3VsZCBub3cgZXZlciBzdWNjZWVkLiBBbSBJCj4gbWlzc2luZyBhbnl0aGluZywgb3IgZG9lcyB0
aGUgcGF0Y2ggbmVlZCByZXZlcnRpbmcgdW50aWwKPiB0aGUgcmVhZF90cnlsb2NrKCkgZ290IGVu
aGFuY2VkIHRvIGNvcGUgd2l0aCB0aGlzPwoKSSB0aGluayB0aGlzIGNhbiBiZSBoYW5kbGVkIGxv
Y2FsbHkgaW4gZ2V0X2NwdV9tYXBzKCkgYW5kCmNwdV9ob3RwbHVnX2JlZ2luKCkgd2l0aCB0aGUg
dXNlIG9mIGEgdmFyaWFibGUgaG9sZGluZyB0aGUgY3B1IChvcgpOUl9DUFVTKSBvZiB0aGUgY3B1
IGhvbGRpbmcgdGhlIHdyaXRlIGxvY2suIGdldF9jcHVfbWFwcygpIGNhbiBqdXN0CnN1Y2NlZWQg
aW4gY2FzZSB0aGlzIHZhcmlhYmxlIGNvbnRhaW5zIHNtcF9wcm9jZXNzb3JfaWQoKS4KCgpKdWVy
Z2VuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
