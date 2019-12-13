Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6482911E45E
	for <lists+xen-devel@lfdr.de>; Fri, 13 Dec 2019 14:09:59 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ifkfS-000462-II; Fri, 13 Dec 2019 13:07:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=D6vH=2D=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ifkfR-00045x-BM
 for xen-devel@lists.xenproject.org; Fri, 13 Dec 2019 13:07:37 +0000
X-Inumbo-ID: 83390ad6-1da9-11ea-b6f1-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 83390ad6-1da9-11ea-b6f1-bc764e2007e4;
 Fri, 13 Dec 2019 13:07:28 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 40698B03C;
 Fri, 13 Dec 2019 13:07:27 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <a1b23ffd-6af4-a3c1-b4ac-ba7bd3ec1d70@suse.com>
 <ce9102e8-3e12-2479-4f15-292aa99f34a1@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <706bf675-f0e6-15ef-17f9-7bbb72770628@suse.com>
Date: Fri, 13 Dec 2019 14:07:49 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <ce9102e8-3e12-2479-4f15-292aa99f34a1@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] x86emul: correct far branch handling for
 64-bit mode
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTMuMTIuMjAxOSAxNDowMSwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAxMy8xMi8yMDE5
IDEyOjU0LCBKYW4gQmV1bGljaCB3cm90ZToKPj4gQU1EIGFuZCBmcmllbmRzIGV4cGxpY2l0bHkg
c3BlY2lmeSB0aGF0IDY0LWJpdCBvcGVyYW5kcyBhcmVuJ3QgcG9zc2libGUKPj4gZm9yIHRoZXNl
IGluc25zLiBOZXZlcnRoZWxlc3MgUkVYLlcgaXNuJ3QgZnVsbHkgaWdub3JlZDogSXQgc3RpbGwK
Pj4gY2FuY2VscyBhIHBvc3NpYmxlIG9wZXJhbmQgc2l6ZSBvdmVycmlkZSAoMHg2NikuIEludGVs
IG90b2ggZXhwbGljaXRseQo+PiBwcm92aWRlcyBmb3IgNjQtYml0IG9wZXJhbmRzIG9uIHRoZSBy
ZXNwZWN0aXZlIGluc24gcGFnZSBvZiB0aGUgU0RNLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBKYW4g
QmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cj4gCj4gUmV2aWV3ZWQtYnk6IEFuZHJldyBDb29w
ZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+CgpUaGFua3MuCgo+PiAtLS0gYS94ZW4vYXJj
aC94ODYveDg2X2VtdWxhdGUveDg2X2VtdWxhdGUuYwo+PiArKysgYi94ZW4vYXJjaC94ODYveDg2
X2VtdWxhdGUveDg2X2VtdWxhdGUuYwo+PiBAQCAtMjUxOSw5ICsyNTE5LDE2IEBAIHg4Nl9kZWNv
ZGVfb25lYnl0ZSgKPj4gICAgICAgICAgY2FzZSA2OiAvKiBwdXNoICovCj4+ICAgICAgICAgICAg
ICBpZiAoIG1vZGVfNjRiaXQoKSAmJiBvcF9ieXRlcyA9PSA0ICkKPj4gICAgICAgICAgICAgICAg
ICBvcF9ieXRlcyA9IDg7Cj4+IC0gICAgICAgICAgICAvKiBmYWxsIHRocm91Z2ggKi8KPj4gKyAg
ICAgICAgICAgIHN0YXRlLT5kZXNjID0gRHN0Tm9uZSB8IFNyY01lbSB8IE1vdjsKPj4gKyAgICAg
ICAgICAgIGJyZWFrOwo+PiArCj4+ICAgICAgICAgIGNhc2UgMzogLyogY2FsbCAoZmFyLCBhYnNv
bHV0ZSBpbmRpcmVjdCkgKi8KPj4gICAgICAgICAgY2FzZSA1OiAvKiBqbXAgKGZhciwgYWJzb2x1
dGUgaW5kaXJlY3QpICovCj4+ICsgICAgICAgICAgICAvKiBSRVguVyBpZ25vcmVkIG9uIGEgdmVu
ZG9yLWRlcGVuZGVudCBiYXNpcy4gKi8KPj4gKyAgICAgICAgICAgIGlmICggb3BfYnl0ZXMgPT0g
OCAmJgo+PiArICAgICAgICAgICAgICAgICAoY3R4dC0+Y3B1aWQtPng4Nl92ZW5kb3IgJgo+PiAr
ICAgICAgICAgICAgICAgICAgKFg4Nl9WRU5ET1JfQU1EIHwgWDg2X1ZFTkRPUl9IWUdPTikpICkK
PiAKPiBJJ20gd29uZGVyaW5nIHdoZXRoZXIgaW4gZ2VuZXJhbCB3ZSB3YW50IHNvbWUgYW1kX2xp
a2UoKSBhbmQKPiBpbnRlbF9saWtlKCkgcHJlZGljYXRlcy7CoCBJdCBpcyBob3cgYWxtb3N0IGFs
bCBvZiB0aGUgYm91bmRhcmllcyBlbmQgdXAKPiBmYWxsaW5nLgoKSSd2ZSBiZWVuIHdvbmRlcmlu
ZyB0aGUgc2FtZSwgYnV0IGRpZG4ndCBkbyBzbyB5ZXQgYmVjYXVzZSB3aGlsZQpmb3IgSHlnb24g
d2UgY2FuIGJlIHByZXR0eSBzdXJlIGl0J3MgQU1ELWxpa2UsIEknbSBub3Qgc3VyZSBob3cKZmFy
IHdlIGNvdWxkIGdvIHdpdGggY292ZXJpbmcgb3RoZXIgdGhhbiBJbnRlbCBhcyBJbnRlbC1saWtl
LgpCdXQgeWVzLCBwZXJoYXBzIHdlIGNvdWxkIHN0YXJ0IHdpdGgganVzdCBhbWRfbGlrZSgpIChJ
IGRvbid0CnBhcnRpY3VsYXJseSBsaWtlIHRoaXMgbmFtZSwgYnV0IEkgYWxzbyBjYW4ndCB0aGlu
ayBvZiBhbnl0aGluZwpJIHdvdWxkIGxpa2UgYmV0dGVyKS4KCkphbgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
