Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AB45142F91
	for <lists+xen-devel@lfdr.de>; Mon, 20 Jan 2020 17:27:17 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1itZqP-0006Oz-CM; Mon, 20 Jan 2020 16:24:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=xaUo=3J=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1itZqN-0006Or-4w
 for xen-devel@lists.xenproject.org; Mon, 20 Jan 2020 16:24:03 +0000
X-Inumbo-ID: 402d2432-3ba1-11ea-9fd7-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 402d2432-3ba1-11ea-9fd7-bc764e2007e4;
 Mon, 20 Jan 2020 16:23:54 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 4682EAC2F;
 Mon, 20 Jan 2020 16:23:53 +0000 (UTC)
To: Tamas K Lengyel <tamas.lengyel@intel.com>
References: <cover.1578503483.git.tamas.lengyel@intel.com>
 <ce3871c8e9ee01523d2032990ff8acaaaf69a350.1578503483.git.tamas.lengyel@intel.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <03edb7c7-967a-19f4-76bd-9aa9c9af1bd3@suse.com>
Date: Mon, 20 Jan 2020 17:23:58 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <ce3871c8e9ee01523d2032990ff8acaaaf69a350.1578503483.git.tamas.lengyel@intel.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v4 13/18] x86/mem_sharing: Skip xen heap
 pages in memshr nominate
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
Cc: Tamas K Lengyel <tamas@tklengyel.com>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDguMDEuMjAyMCAxODoxNCwgVGFtYXMgSyBMZW5neWVsIHdyb3RlOgo+IFRyeWluZyB0byBz
aGFyZSB0aGVzZSB3b3VsZCBmYWlsIGFueXdheSwgYmV0dGVyIHRvIHNraXAgdGhlbSBlYXJseS4K
PiAKPiBTaWduZWQtb2ZmLWJ5OiBUYW1hcyBLIExlbmd5ZWwgPHRhbWFzLmxlbmd5ZWxAaW50ZWwu
Y29tPgoKUmV2aWV3ZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KYWxiZWl0
IEkgd29uZGVyIGlmIHRoaXMgY291bGRuJ3QgYmUgZnVydGhlciBnZW5lcmFsaXplZCBieSAuLi4K
Cj4gLS0tIGEveGVuL2FyY2gveDg2L21tL21lbV9zaGFyaW5nLmMKPiArKysgYi94ZW4vYXJjaC94
ODYvbW0vbWVtX3NoYXJpbmcuYwo+IEBAIC04NTIsNiArODUyLDExIEBAIHN0YXRpYyBpbnQgbm9t
aW5hdGVfcGFnZShzdHJ1Y3QgZG9tYWluICpkLCBnZm5fdCBnZm4sCj4gICAgICBpZiAoICFwMm1f
aXNfc2hhcmFibGUocDJtdCkgKQo+ICAgICAgICAgIGdvdG8gb3V0Owo+ICAKPiArICAgIC8qIFNr
aXAgeGVuIGhlYXAgcGFnZXMgKi8KPiArICAgIHBhZ2UgPSBtZm5fdG9fcGFnZShtZm4pOwo+ICsg
ICAgaWYgKCAhcGFnZSB8fCBpc194ZW5faGVhcF9wYWdlKHBhZ2UpICkKPiArICAgICAgICBnb3Rv
IG91dDsKCi4uLiBjaGVja2luZyBmb3IgYSB6ZXJvIHR5cGUgcmVmIGNvdW50ICh0aGUgb25seSBt
ZWFucyB0byBwZXJtaXQKYSB0eXBlIGNoYW5nZSkgaGVyZSwgYW5kIG1heWJlIGFsc28gLT5jb3Vu
dF9pbmZvIHRvIGZpdCB3aGF0CnBhZ2VfbWFrZV9zaGFyYWJsZSgpIGV4cGVjdHMuCgpKYW4KCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
