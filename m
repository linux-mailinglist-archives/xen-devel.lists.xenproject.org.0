Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 50FB3FB2DA
	for <lists+xen-devel@lfdr.de>; Wed, 13 Nov 2019 15:50:10 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iUtvU-0001BK-Uu; Wed, 13 Nov 2019 14:47:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=SDLk=ZF=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iUtvU-0001BF-2H
 for xen-devel@lists.xenproject.org; Wed, 13 Nov 2019 14:47:20 +0000
X-Inumbo-ID: 7d2e92e2-0624-11ea-b678-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7d2e92e2-0624-11ea-b678-bc764e2007e4;
 Wed, 13 Nov 2019 14:47:18 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id D4217B1F1;
 Wed, 13 Nov 2019 14:47:16 +0000 (UTC)
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
References: <20191002112004.25793-1-jgross@suse.com>
 <20191002112004.25793-3-jgross@suse.com>
 <ad94351a-27a2-69c0-0a7c-6364953b84eb@suse.com>
 <efa0fac1-475d-6ad5-c238-41866120ecc9@suse.com>
 <05c32080-23bb-1b4e-aa94-ae1163703864@suse.com>
 <627f971c-7fe3-c60f-97ba-e432f91d5c71@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <08a2f3d8-de85-c8d4-7d61-8da782d9c974@suse.com>
Date: Wed, 13 Nov 2019 15:47:32 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <627f971c-7fe3-c60f-97ba-e432f91d5c71@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2 2/6] xen: add basic hypervisor filesystem
 support
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
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 xen-devel@lists.xenproject.org, Daniel de Graaf <dgdegra@tycho.nsa.gov>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTMuMTEuMjAxOSAxNTo0MCwgSsO8cmdlbiBHcm/DnyB3cm90ZToKPiBPbiAxMy4xMS4xOSAx
NTowNywgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IE9uIDEyLjExLjIwMTkgMTc6MDYsIErDvHJnZW4g
R3Jvw58gd3JvdGU6Cj4+PiBPbiAxMi4xMS4xOSAxNDo0OCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+
Pj4gT24gMDIuMTAuMjAxOSAxMzoyMCwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPj4+Pj4gK3N0YXRp
YyB1bnNpZ25lZCBpbnQgaHlwZnNfZ2V0X2VudHJ5X2xlbihzdHJ1Y3QgaHlwZnNfZW50cnkgKmVu
dHJ5KQo+Pj4+PiArewo+Pj4+PiArICAgIHVuc2lnbmVkIGludCBsZW4gPSAwOwo+Pj4+PiArCj4+
Pj4+ICsgICAgc3dpdGNoICggZW50cnktPnR5cGUgKQo+Pj4+PiArICAgIHsKPj4+Pj4gKyAgICBj
YXNlIGh5cGZzX3R5cGVfZGlyOgo+Pj4+PiArICAgICAgICBsZW4gPSBlbnRyeS0+ZGlyLT5jb250
ZW50X3NpemU7Cj4+Pj4+ICsgICAgICAgIGJyZWFrOwo+Pj4+PiArICAgIGNhc2UgaHlwZnNfdHlw
ZV9zdHJpbmc6Cj4+Pj4+ICsgICAgICAgIGxlbiA9IHN0cmxlbihlbnRyeS0+c3RyX3ZhbCkgKyAx
Owo+Pj4+PiArICAgICAgICBicmVhazsKPj4+Pj4gKyAgICBjYXNlIGh5cGZzX3R5cGVfdWludDoK
Pj4+Pj4gKyAgICAgICAgbGVuID0gMTE7ICAgICAgLyogbG9uZ2VzdCBwb3NzaWJsZSBwcmludGVk
IHZhbHVlICsgMSAqLwo+Pj4+Cj4+Pj4gV2h5IHdvdWxkIHVpbnQgdmFsdWVzIGJlIHJlc3RyaWN0
ZWQgdG8gMzIgYml0cz8gVGhlcmUgYXJlIHBsZW50eSBvZgo+Pj4+IDY0LWJpdCBudW1iZXJzIHRo
YXQgbWlnaHQgYmUgb2YgaW50ZXJlc3QgZXhwb3NpbmcgdGhyb3VnaCB0aGlzCj4+Pj4gaW50ZXJm
YWNlIChhbmQgZXZlbiBtb3JlIHNvIGlmIGRvd24gdGhlIHJvYWQgd2Ugd2VyZSB0byByZS11c2Ug
dGhpcwo+Pj4+IGZvciBzb21ldGhpbmcgZGVidWdmcy1saWtlKS4gQW5kIGV2ZW4gd2l0aG91dCB0
aGlzIEkgdGhpbmsgaXQgd291bGQKPj4+PiBiZSBiZXR0ZXIgdG8gbm90IGhhdmUgYSBsaXRlcmFs
IG51bWJlciBoZXJlIC0gaXQnbGwgYmUgY2xvc2UgdG8KPj4+PiB1bm5vdGljZWFibGUgKHdpdGhv
dXQgc29tZW9uZSByZW1lbWJlcmluZykgd2hlbiBwb3J0aW5nIHRvIGFuIGFyY2gKPj4+PiB3aXRo
IHVuc2lnbmVkIGludCB3aWRlciB0aGFuIDMyIGJpdHMuCj4+Pgo+Pj4gU3VwcG9ydCBvZiA2NC1i
aXQgbnVtYmVycyB3b3VsZCBhZGQgImh5cGZzX3R5cGVfdWxvbmciLgo+Pgo+PiBBdCB0aGlzIGxh
eWVyIEkgZGlzbGlrZSBtYWtpbmcgYXNzdW1wdGlvbnMgb24gdGhlIGJpdG5lc3Mgb2YgaW50Cj4+
IG9yIGxvbmcuIENhbiB3ZSBzZXR0bGUgb24gZWl0aGVyIGEgdHlwZSB0aGF0J3Mgc3VpdGFibGUg
Zm9yIGFsbAo+PiBzZW5zaWJsZSB2YWx1ZXMgKHdvdWxkIGxpa2VseSBiZSB1bnNpZ25lZCBsb25n
IGxvbmcpIG9yIHVzZSBmaXhlZAo+PiB3aXRoIGlkZW50aWZpY2F0aW9ucyAoaHlwZnNfdHlwZV91
MzIgZXQgYWwpPwo+IAo+IFRoaXMgaXMgYSBwcm9ibGVtIHdpdGggZS5nLiBydW50aW1lIHBhcmFt
ZXRlcnMuIFRoZSBjdXJyZW50IGludCB0eXBlCj4gcGFyYW1ldGVycyBhcmUgdW5zaWduZWQgaW50
LiBTbyBjaGFuZ2luZyB0aGUgdHlwZSB0byBoeXBmc190eXBlX3UzMgo+IHdvdWxkIHRoZW4gbWFr
ZSBhc3N1bXB0aW9ucyBhYm91dCB1bnNpZ25lZCBpbnQgYml0bmVzcy4KPiAKPiBNeSBwbGFuIHdh
cyB0byBoYXZlIGh5cGZzX3R5cGVfKiBhY2NvcmRpbmcgdG8gdGhlIGRlZmluaXRpb25zIG9mIHRo
ZQo+IHZhcmlhYmxlcyBwb2ludGVkIHRvLiBNYXliZSB0aGUgc2Vuc2libGUgd2F5IHRvIGhhbmRs
ZSB0aGF0IHdvdWxkIGJlCj4gdG8gaGF2ZSBoeXBmc190eXBlX3Uoc3opIHNpbWlsYXIgdG8gYm9v
dC9ydW50aW1lIHBhcmFtZXRlciBoYW5kbGluZy4KCkFncmVlZC4KCj4+Pj4+ICsgICAgdW5pb24g
ewo+Pj4+PiArICAgICAgICB2b2lkICpjb250ZW50Owo+Pj4+Cj4+Pj4gY29uc3Q/Cj4+Pj4KPj4+
Pj4gKyAgICAgICAgc3RydWN0IGh5cGZzX2RpciAqZGlyOwo+Pj4+Cj4+Pj4gY29uc3Q/Cj4+Pgo+
Pj4gQXMgYWxyZWFkeSBzYWlkIGFib3ZlOiBtaXhpbmcgY29uc3QgYW5kIG5vbi1jb25zdCBwb2lu
dGVycyBpbiBhCj4+PiB1bmlvbiBsb29rcyBmaXNoeSB0byBtZS4KPj4KPj4gSG1tLCB3ZWxsLCBJ
IGNhbiBzZWUgeW91ciBwb2ludCwgYnV0IEkgdGhpbmsgaXQgc3RpbGwgY2FuIGJlIHZpZXdlZAo+
PiB0byBoYXZlIGl0cyAocGVyaGFwcyBsYXJnZWx5IGRvY3VtZW50YXRpb24pIHZhbHVlLgo+IAo+
IFNvIHRoZSB2b2lkIHBvaW50ZXIgc2hvdWxkbid0IGJlIGNvbnN0IElNTyBhcyBpdCBjYW4gYmUg
dXNlZCBhcyBhCj4gcmVwbGFjZW1lbnQgZm9yIGFsbCBvZiB0aGUgb3RoZXIgdW5pb24gbWVtYmVy
cy4KCkJ1dCB0aGlzIHdhcyBleGFjdGx5IHRoZSByZWFzb24gd2h5IEkgY29uc2lkZXJlZCBpdCB0
byBiZWNvbWUKY29uc3QgLSB0byBkaXNhbGxvdyBzdWNoIHVzZSB3aGVuIGl0J3MgYWJvdXQgY2hh
bmdpbmcgYSB2YWx1ZS4KCj4gQW5kIHRoZSBkaXIgbWVtYmVyIGlzCj4gdXNlZCBhcyBub24gY29u
c3QgaW4gY2FzZSBvZiBhZGRpbmcgYW4gZW50cnkuCgpXZWxsLCBpZiB0aGVyZSBpbmRlZWQgaXMg
c3VjaCBhIHVzZSAod2hpY2ggSSBoYWQgbG9va2VkIGZvciBidXQKYXBwYXJlbnRseSBvdmVybG9v
a2VkKSwgdGhlbiBvZiBjb3Vyc2UgY29uc3Qgc2hvdWxkbid0IGJlIGFkZGVkLgpIZW5jZSB0aGUg
cXVlc3Rpb24gbWFyayBpbiBteSBpbml0aWFsIHJlcGx5LgoKSmFuCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
