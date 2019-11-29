Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 42C6210D678
	for <lists+xen-devel@lfdr.de>; Fri, 29 Nov 2019 14:57:26 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iagjZ-0006OF-5W; Fri, 29 Nov 2019 13:54:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=mjd+=ZV=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iagjX-0006OA-QL
 for xen-devel@lists.xenproject.org; Fri, 29 Nov 2019 13:54:55 +0000
X-Inumbo-ID: d2569fa2-12af-11ea-a55d-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d2569fa2-12af-11ea-a55d-bc764e2007e4;
 Fri, 29 Nov 2019 13:54:55 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 35EF8AC68;
 Fri, 29 Nov 2019 13:54:54 +0000 (UTC)
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 Julien Grall <julien@xen.org>
References: <5766dd2b-2aa7-bafe-56ad-3ea33ddf4591@suse.com>
 <78b1df38-864c-768e-b306-2db75f3b76e0@citrix.com>
 <e765c741-cba4-42bf-b61a-20a206cd628d@suse.com>
 <24033.2185.509756.178278@mariner.uk.xensource.com>
 <47257a2e-5454-6115-93c9-e1b9ed3a4131@suse.com>
 <d8e8729a-3a20-f65d-0c1b-9f5522f4a450@citrix.com>
 <f998ce81-8b77-a2c6-ab90-cedff89799da@suse.com>
 <358e29a0-0fce-28de-fdf3-730e6b4aaf26@citrix.com>
 <11a7ce02-b4cd-a24f-f477-d3fe720b04ee@suse.com>
 <8b7db8ee-8dc8-0390-0d44-f12de573e81a@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <abddefb1-6fac-67d9-c825-43a1b63300c1@suse.com>
Date: Fri, 29 Nov 2019 14:55:02 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <8b7db8ee-8dc8-0390-0d44-f12de573e81a@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] console: avoid buffer overflow in
 guest_console_write()
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
 KonradWilk <konrad.wilk@oracle.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ilja Van Sprundel <ivansprundel@ioactive.com>,
 GeorgeDunlap <George.Dunlap@citrix.com>, Ian Jackson <ian.jackson@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjkuMTEuMjAxOSAxNDozNywgSsO8cmdlbiBHcm/DnyB3cm90ZToKPiBPbiAyOS4xMS4xOSAx
NDoyNiwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IE9uIDI5LjExLjIwMTkgMTM6MzcsIEFuZHJldyBD
b29wZXIgd3JvdGU6Cj4+PiBPbiAyOS8xMS8yMDE5IDEyOjE5LCBKYW4gQmV1bGljaCB3cm90ZToK
Pj4+PiBPbiAyOS4xMS4yMDE5IDEzOjE1LCBBbmRyZXcgQ29vcGVyIHdyb3RlOgo+Pj4+PiBPbiAy
OS8xMS8yMDE5IDEyOjEzLCBKYW4gQmV1bGljaCB3cm90ZToKPj4+Pj4+IE9uIDI5LjExLjIwMTkg
MTM6MDEsIElhbiBKYWNrc29uIHdyb3RlOgo+Pj4+Pj4+IEphbiBCZXVsaWNoIHdyaXRlcyAoIlJl
OiBbUEFUQ0hdIGNvbnNvbGU6IGF2b2lkIGJ1ZmZlciBvdmVyZmxvdyBpbiBndWVzdF9jb25zb2xl
X3dyaXRlKCkiKToKPj4+Pj4+Pj4gT24gMjkuMTEuMjAxOSAxMToyMiwgQW5kcmV3IENvb3BlciB3
cm90ZToKPj4+Pj4+Pj4+IElzIHNpemVvZihhcnJheVswXSkgYWx3YXlzIDAsIG9yIGlzIHRoaXMg
anVzdCBhIEdDQy1pc20gP8KgIEdvZGJvbHQKPj4+Pj4+Pj4+IHN1Z2dlc3RzIGlzIDAgb24gYWxs
IGNvbXBpbGVyIHdlIHN1cHBvcnQuCj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4gRWl0aGVyIHdheSwgaXNu
J3QgdGhlIG1vcmUgY29tbW9uIGlkaW9tICsgMHVsID/CoCBQZXJzb25hbGx5LCBJIGZlZWwgdGhh
dAo+Pj4+Pj4+Pj4gaXMgY2xlYXJlciB0byBmb2xsb3cuCj4+Pj4+Pj4+IEkgZGVjaWRlZCBhZ2Fp
bnN0ICsgMHVsIG9yIGFsaWtlIGJlY2F1c2UgaW4gcHJpbmNpcGxlIHNpemVfdAo+Pj4+Pj4+PiBh
bmQgdW5zaWduZWQgbG9uZyBhcmUgZGlmZmVyZW50IHR5cGVzLiBJbiBwYXJ0aWN1bGFyIDMyLWJp
dAo+Pj4+Pj4+PiB4ODYgZ2NjIHVzZXMgdW5zaWduZWQgaW50IGZvciBzaXplX3QsIGFuZCBoZW5j
ZSBtaW4oKSdzCj4+Pj4+Pj4+IHR5cGUgc2FmZXR5IGNoZWNrIHdvdWxkIGNhdXNlIHRoZSBidWls
ZCB0byBmYWlsIHRoZXJlLiBUaGUKPj4+Pj4+Pj4gc2FtZSByaXNrIG9idmlvdXNseSBleGlzdHMg
Zm9yIGFueSAzMi1iaXQgYXJjaCAoZS5nLiBBcm0zMiwKPj4+Pj4+Pj4gYnV0IEkgaGF2ZW4ndCBj
aGVja2VkIHdoYXQgdHlwZSBpdCBhY3R1YWxseSB1c2VzKS4KPj4+Pj4+PiBJIGRvbid0IGtub3cg
d2hhdCBpIHdyb25nIHdpdGgKPj4+Pj4+PiAgICAgKHNpemVfdCkwCj4+Pj4+Pj4gd2hpY2ggaXMg
c2hvcnRlciwgZXZlbiAhCj4+Pj4+PiBUcnVlLiBZZXQgaXQgY29udGFpbnMgYSBjYXN0LCBubyBt
YXR0ZXIgaG93IHJpc2stZnJlZSBpdCBtYXkgYmUKPj4+Pj4+IGluIHRoaXMgY2FzZS4gV2l0aCBh
IGNhc3QsIEkgY291bGQgYXMgd2VsbCBoYXZlIHdyaXR0ZW4gKHlldAo+Pj4+Pj4gc2hvcnRlcikg
KHNpemVfdCljb3VudC4KPj4+Pj4gR2l2ZW4gdGhhdCBtaW4oKSBoYXMgYSB2ZXJ5IHN0cmljdCB0
eXBlY2hlY2ssIEkgdGhpbmsgd2Ugc2hvdWxkIHBlcm1pdAo+Pj4+PiBhbnkgdXNlIG9mIGFuIGV4
cGxpY2l0IGNhc3QgaW4gYSBzaW5nbGUgb3BlcmFuZCwgYmVjYXVzZSBpdCAqaXMqIHNhZmVyCj4+
Pj4+IHRoYW4gc3dpdGNoaW5nIHRvIHRoZSBtaW5fdCgpIHJvdXRlIHRvIG1ha2UgdGhpbmdzIGNv
bXBpbGUuCj4+Pj4gV2VsbCwgSSBjYW4gc3dpdGNoIHRvIChzaXplX3QpY291bnQgaWYgdGhpcyBp
cyBsaWtlZCBiZXR0ZXIKPj4+PiBvdmVyYWxsLgo+Pj4KPj4+IFBlcnNvbmFsbHksIEknZCBwcmVm
ZXIgdGhpcyBvcHRpb24gbW9zdCBvZiBhbGwuCj4+Cj4+IE9rYXksIEkndmUgc3dpdGNoZWQgdG8g
dGhpcywgYnV0IHdoaWxlIGRvaW5nIHNvIEkgc3RhcnRlZCB3b25kZXJpbmcKPj4gd2h5IHdlJ2Qg
dGhlbiBub3QgdXNlCj4+Cj4+ICAgICAgICAgIGtjb3VudCA9IG1pbihjb3VudCwgKHVuc2lnbmVk
IGludClzaXplb2Yoa2J1ZikgLSAxKTsKPj4KPj4gd2hpY2ggaXMgYW4gKG9mdGVuIHNsaWdodGx5
IGNoZWFwZXIpIDMyLWJpdCBvcGVyYXRpb24gKGFuZCB3aGljaAo+PiBpcyB3aGF0IEkgaGFkIGFj
dHVhbGx5IHN0YXJ0ZWQgZnJvbSkuCj4gCj4gV2hpbGUgbW9kaWZ5aW5nIGd1ZXN0X2NvbnNvbGVf
d3JpdGUoKSwgd291bGQgeW91IG1pbmQgd3JpdGluZyBhICdcMCcKPiB0byBrYnVmW2tjb3VudF0/
IFRoZXJlIGlzIGEgImNvbnJpbmdfcHV0cyhrYnVmKTsiIGxhdGVyIGluIHRoaXMKPiBmdW5jdGlv
biB3aGljaCB3b3VsZCBsaWtlIGEgMCB0ZXJtaW5hdGVkIHN0cmluZyBhcyBpbnB1dC4KClRoYXQn
cyBub3QgdGhlIHJpZ2h0IGNoYW5nZSBmb3IgdGhpcyBwcm9ibGVtLCBJIHRoaW5rLiBOb3cgdGhh
dAp3ZSBzdXBwb3J0IGVtYmVkZGVkIG51bCBjaGFyYWN0ZXJzLCBhIGNvdW50IHNob3VsZCBiZSBw
YXNzZWQKaW5zdGVhZC4gSnVsaWVuPwoKSSBhbHNvIHdvdWxkbid0IHdhbnQgdG8gbWVyZ2UgdGhp
cyBpbnRvIHRoaXMgcGF0Y2g7IEknbSBoYXBweSB0bwpzZW5kIGEgc2VwYXJhdGUgb25lLgoKSmFu
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
