Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CDAF015276E
	for <lists+xen-devel@lfdr.de>; Wed,  5 Feb 2020 09:14:37 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1izFni-0000k9-CV; Wed, 05 Feb 2020 08:12:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=rprq=3Z=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1izFng-0000k3-8O
 for xen-devel@lists.xenproject.org; Wed, 05 Feb 2020 08:12:44 +0000
X-Inumbo-ID: 48c6aae6-47ef-11ea-b211-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 48c6aae6-47ef-11ea-b211-bc764e2007e4;
 Wed, 05 Feb 2020 08:12:43 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id E4FBBAF33;
 Wed,  5 Feb 2020 08:12:42 +0000 (UTC)
To: Wei Liu <wl@xen.org>
References: <20200204165535.17214-1-liuwe@microsoft.com>
 <6e488f84-bc56-5bcf-0c60-3cdee48770e8@suse.com>
 <20200204171959.pejeoqfg4n37gno6@debian>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <c31b8129-2c6a-17c5-b30b-c3a2ff577768@suse.com>
Date: Wed, 5 Feb 2020 09:12:50 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <20200204171959.pejeoqfg4n37gno6@debian>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] x86: fix off-by-one error when printing
 memory ranges
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
Cc: Xen Development List <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <liuwe@microsoft.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDQuMDIuMjAyMCAxODoxOSwgV2VpIExpdSB3cm90ZToKPiBPbiBUdWUsIEZlYiAwNCwgMjAy
MCBhdCAwNjowNzowMFBNICswMTAwLCBKYW4gQmV1bGljaCB3cm90ZToKPj4gT24gMDQuMDIuMjAy
MCAxNzo1NSwgV2VpIExpdSB3cm90ZToKPj4+IFNpZ25lZC1vZmYtYnk6IFdlaSBMaXUgPGxpdXdl
QG1pY3Jvc29mdC5jb20+Cj4+PiAtLS0KPj4+ICB4ZW4vYXJjaC94ODYvZTgyMC5jIHwgMiArLQo+
Pj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+Pj4KPj4+
IGRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvZTgyMC5jIGIveGVuL2FyY2gveDg2L2U4MjAuYwo+
Pj4gaW5kZXggYjlmNTg5Y2FjMy4uZDY3Mzg3ZjEzNyAxMDA2NDQKPj4+IC0tLSBhL3hlbi9hcmNo
L3g4Ni9lODIwLmMKPj4+ICsrKyBiL3hlbi9hcmNoL3g4Ni9lODIwLmMKPj4+IEBAIC05NCw3ICs5
NCw3IEBAIHN0YXRpYyB2b2lkIF9faW5pdCBwcmludF9lODIwX21lbW9yeV9tYXAoc3RydWN0IGU4
MjBlbnRyeSAqbWFwLCB1bnNpZ25lZCBpbnQgZW50Cj4+PiAgICAgIGZvciAoaSA9IDA7IGkgPCBl
bnRyaWVzOyBpKyspIHsKPj4+ICAgICAgICAgIHByaW50aygiICUwMTZMeCAtICUwMTZMeCAiLAo+
Pj4gICAgICAgICAgICAgICAgICh1bnNpZ25lZCBsb25nIGxvbmcpKG1hcFtpXS5hZGRyKSwKPj4+
IC0gICAgICAgICAgICAgICAodW5zaWduZWQgbG9uZyBsb25nKShtYXBbaV0uYWRkciArIG1hcFtp
XS5zaXplKSk7Cj4+PiArICAgICAgICAgICAgICAgKHVuc2lnbmVkIGxvbmcgbG9uZykobWFwW2ld
LmFkZHIgKyBtYXBbaV0uc2l6ZSkgLSAxKTsKPj4KPj4gV2h5IHdhcyB0aGlzIGFuIGVycm9yPyBJ
ZiB3ZSB1c2VkIFssXSBsaWtlIExpbnV4IGRvZXMgLSBzdXJlLgo+PiBCdXQgd2UgZG9uJ3QuIFRo
ZSBwcmVzZW50YXRpb24sIHdpdGhvdXQgbG9va2luZyBhdCB0aGUgc291cmNlLAo+PiBzaW1wbHkg
bGVhdmVzIG9wZW4gd2hldGhlciB0aGlzIHdhcyBtZWFudCB0byBiZSBbLF0gb3IgWywpLgo+PiBB
bmQgaXQgY29udGludWVzIHRvIGJlIGxlZnQgb3BlbiB3aXRoIHRoZSBhZGp1c3RtZW50IG1hZGUu
Cj4+Cj4gCj4gV2VsbCwgTGludXgncyByZXByZXNlbnRhdGlvbiBpcyBub3Qgd2hhdCBpcyBub3Jt
YWxseSBkb25lIGluIG1hdGgKPiBlaXRoZXIuCj4gCj4gSXQgaXMgbGlrZQo+IAo+ICAgWGVuOiBb
bWVtIDB4MDAwMDAwMDAwMDAwMDAwMC0weDAwMDAwMDAwMDAwOWVmZmZdIHVzYWJsZQo+IAo+IE5v
dGUgaXQgaXMgdXNpbmcgJy0nLCBub3QgJywnLiBBbmQgdGhlcmUgaXMgIm1lbSIgYXQgdGhlIGJl
Z2lubmluZy4KPiAKPiBJIGhhdmUgYWx3YXlzIGludGVycHJldGVkIHRoZSBbXSBwYWlyIGFzIHNv
bWV0aGluZyB0byBlbmNsb3NlIHRoZSByYW5nZSwKPiBub3Qgb2YgbWF0aGVtYXRpY2FsbHkgbWVh
bmluZy4KPiAKPiBJZiB5b3Ugd2FudCwgSSBjYW4gY2hhbmdlIFhlbidzIGZvcm1hdCBzdHJpbmcg
dG8gIlslMDE2THgsICUwMTZMeF0iLgoKSSB0aGluayB0aGlzIHdvdWxkIG1ha2UgdGhpbmdzIGxl
c3MgYW1iaWd1b3VzLCB5ZXMuIEJ1dCBteSBwcmltYXJ5CnJlcXVlc3QgaGVyZSBpcyB0byBoYXZl
IG5laXRoZXIgImZpeCIgbm9yICJlcnJvciIgbm9yIGFueXRoaW5nCmFsaWtlIGluIHRoZSB0aXRs
ZSBvciBkZXNjcmlwdGlvbi4KCkphbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
