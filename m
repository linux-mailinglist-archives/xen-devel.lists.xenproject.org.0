Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A0261315ED
	for <lists+xen-devel@lfdr.de>; Mon,  6 Jan 2020 17:19:41 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ioV4i-00070R-Uj; Mon, 06 Jan 2020 16:17:52 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=5DW6=23=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ioV4h-00070L-9O
 for xen-devel@lists.xenproject.org; Mon, 06 Jan 2020 16:17:51 +0000
X-Inumbo-ID: 153f7d6d-30a0-11ea-ab2d-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 153f7d6d-30a0-11ea-ab2d-12813bfff9fa;
 Mon, 06 Jan 2020 16:17:50 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id E104CAE8A;
 Mon,  6 Jan 2020 16:17:48 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <73ea220a-d234-7a87-464e-59683fc3d815@suse.com>
 <3bd38586-d76b-2ce5-a8bb-0777b30d5b61@suse.com>
 <924cfe8a-1e6c-9f1e-e22c-06ff0fd3a886@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <c574a0da-5403-76a3-1e49-3a97b0443804@suse.com>
Date: Mon, 6 Jan 2020 17:18:33 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <924cfe8a-1e6c-9f1e-e22c-06ff0fd3a886@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2 1/3] x86/mm: mod_l<N>_entry() have no
 need to use __copy_from_user()
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
Cc: George Dunlap <George.Dunlap@eu.citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDYuMDEuMjAyMCAxNzowOSwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAwNi8wMS8yMDIw
IDE1OjM0LCBKYW4gQmV1bGljaCB3cm90ZToKPj4gLS0tIGEveGVuL2luY2x1ZGUvYXNtLXg4Ni9w
YWdlLmgKPj4gKysrIGIveGVuL2luY2x1ZGUvYXNtLXg4Ni9wYWdlLmgKPj4gQEAgLTU1LDYgKzU1
LDE2IEBACj4+ICAjZGVmaW5lIGw0ZV93cml0ZShsNGVwLCBsNGUpIFwKPj4gICAgICBwdGVfd3Jp
dGUoJmw0ZV9nZXRfaW50cHRlKCoobDRlcCkpLCBsNGVfZ2V0X2ludHB0ZShsNGUpKQo+PiAgCj4+
ICsvKiBUeXBlLWNvcnJlY3QgQUNDRVNTX09OQ0UoKSB3cmFwcGVycyBmb3IgUFRFIGFjY2Vzc2Vz
LiAqLwo+PiArI2RlZmluZSBsMWVfYWNjZXNzX29uY2UobDFlKSAoKmNvbnRhaW5lcl9vZigmQUND
RVNTX09OQ0UobDFlX2dldF9pbnRwdGUobDFlKSksIFwKPj4gKyAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgdm9sYXRpbGUgbDFfcGdlbnRyeV90LCBsMSkpCj4+ICsj
ZGVmaW5lIGwyZV9hY2Nlc3Nfb25jZShsMmUpICgqY29udGFpbmVyX29mKCZBQ0NFU1NfT05DRShs
MmVfZ2V0X2ludHB0ZShsMmUpKSwgXAo+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICB2b2xhdGlsZSBsMl9wZ2VudHJ5X3QsIGwyKSkKPj4gKyNkZWZpbmUgbDNl
X2FjY2Vzc19vbmNlKGwzZSkgKCpjb250YWluZXJfb2YoJkFDQ0VTU19PTkNFKGwzZV9nZXRfaW50
cHRlKGwzZSkpLCBcCj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIHZvbGF0aWxlIGwzX3BnZW50cnlfdCwgbDMpKQo+PiArI2RlZmluZSBsNGVfYWNjZXNzX29u
Y2UobDRlKSAoKmNvbnRhaW5lcl9vZigmQUNDRVNTX09OQ0UobDRlX2dldF9pbnRwdGUobDRlKSks
IFwKPj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdm9sYXRp
bGUgbDRfcGdlbnRyeV90LCBsNCkpCj4gCj4gV2hhdCdzIHdyb25nIHdpdGggbD9lX3JlYWRfYXRv
bWljKCkgd2hpY2ggYWxyZWFkeSBleGlzdCwgYW5kIGFyZSBhbHJlYWR5Cj4gdXNlZCBlbHNld2hl
cmU/CgpJIGRpZCBjb25zaWRlciBnb2luZyB0aGF0IHJvdXRlLCBidXQgcHJlZGljdGVkIHlvdSB3
b3VsZCBvYmplY3QgdG8gaXRzCnVzZSBoZXJlOiBJaXJjIHlvdSd2ZSBwcmV2aW91c2x5IHZvaWNl
ZCBvcGluaW9uIGluIHRoaXMgZGlyZWN0aW9uCihwZXJoYXBzIG5vdCBvbiB0aGUgcGFnZSB0YWJs
ZSBhY2Nlc3NvcnMgdGhlbXNlbHZlcyBidXQgdGhlIHVuZGVybHlpbmcKe3JlYWQsd3JpdGV9X3U8
Tj5fYXRvbWljKCkpLgoKPiBJZiBub3RoaW5nLCB0aGVuIFJldmlld2VkLWJ5OiBBbmRyZXcgQ29v
cGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgo+IHRvIHNhdmUgYW5vdGhlciByb3VuZCBv
ZiBwb3N0aW5nLgoKTGV0J3MgZ2V0IHRoZSBhYm92ZSBjbGFyaWZpZWQgLSBJJ2xsIGJlIGhhcHB5
IHRvIHN3aXRjaCB0bwpsPE4+ZV9yZWFkX2F0b21pYygpIGlmIHRoYXQncyBmaW5lIGJ5IHlvdS4K
CkphbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
