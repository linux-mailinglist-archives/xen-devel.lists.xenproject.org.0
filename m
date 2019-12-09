Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 59329116CD8
	for <lists+xen-devel@lfdr.de>; Mon,  9 Dec 2019 13:07:14 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ieHn1-00034l-I7; Mon, 09 Dec 2019 12:05:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=RNMk=Z7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ieHmz-00034b-EU
 for xen-devel@lists.xenproject.org; Mon, 09 Dec 2019 12:05:21 +0000
X-Inumbo-ID: 2bf07db6-1a7c-11ea-a1e1-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2bf07db6-1a7c-11ea-a1e1-bc764e2007e4;
 Mon, 09 Dec 2019 12:05:20 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id E9B50ACC0;
 Mon,  9 Dec 2019 12:05:19 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <57491ade-fa47-5e66-47ac-a5f79de84070@suse.com>
 <313f5f41-1572-aa0e-1112-d606ad5dee9c@suse.com>
 <355ec482-c6f7-4ec7-cefe-dbcc1bdf5f3f@citrix.com>
 <3f5f0679-758d-c1c9-0beb-681a7495c44c@suse.com>
 <d7ce8632-a47e-d437-b01e-1143f76ceeb3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <cfb208a4-e7d8-fe55-dffe-627df1258369@suse.com>
Date: Mon, 9 Dec 2019 13:05:38 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <d7ce8632-a47e-d437-b01e-1143f76ceeb3@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 1/3] x86: relax GDT check in
 arch_set_info_guest()
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

T24gMDYuMTIuMjAxOSAyMDo1MSwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAwNi8xMi8yMDE5
IDExOjMyLCBKYW4gQmV1bGljaCB3cm90ZToKPj4gT24gMDYuMTIuMjAxOSAxMToyNSwgQW5kcmV3
IENvb3BlciB3cm90ZToKPj4+IE9uIDA2LzEyLzIwMTkgMTA6MTQsIEphbiBCZXVsaWNoIHdyb3Rl
Ogo+Pj4+IEl0IGlzIHdyb25nIGZvciB1cyB0byBjaGVjayBmcmFtZXMgYmV5b25kIHRoZSBndWVz
dCBzcGVjaWZpZWQgbGltaXQuCj4+Pj4KPj4+PiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8
amJldWxpY2hAc3VzZS5jb20+Cj4+PiBJIGRvbid0IGNvbXBsZXRlbHkgYWdyZWUuwqAgVGhlIGNv
ZGUgaGFzIGJlZW4gbGlrZSB0aGlzIHNpbmNlIGl0IHdhcwo+Pj4gaW50cm9kdWNlZCwgYW5kIGlz
IHVzZWQgdG8gY2hlY2sgZGF0YSBmcm9tIHRoZSBkb21haW4gYnVpbGRlciAoaW5jCj4+PiBtaWdy
YXRpb24pLCBhbmQgZnJvbSB0aGUgZ3Vlc3RzLgo+Pj4KPj4+IEF0IHRoZSBtb21lbnQsIGV2ZXJ5
IGNhbGxlciBpcyByZXF1aXJlZCBub3QgdG8gcGFzcyBqdW5rIGluIHVudXNlZAo+Pj4gZnJhbWVz
LCBhbmQgSSBkb24ndCBzZWUgYW4gaXNzdWUgd2l0aCBrZWVwaW5nIHRoaXMgYmVoYXZpb3VyLgo+
PiBLZWVwaW5nIHRoZSBiZWhhdmlvciBpc24ndCBnb2luZyB0byBicmVhayBhbnl0aGluZywgeWVz
LCBidXQgaXQKPj4gc2hvdWxkbid0IGhhdmUgYmVlbiB0aGlzIHdheSB0byBiZWdpbiB3aXRoLiBJ
IHNpbXBseSBkb24ndCBzZWUKPj4gdGhlIHZhbHVlIG9mIHZhbGlkYXRpbmcgZGF0YSB3ZSdyZSBu
b3QgY29uc3VtaW5nIGFueXdheS4gUGVyaGFwcwo+PiBJIGNvdWxkIHNheSAibm90IGhlbHBmdWwi
IG9yICJwb2ludGxlc3MiIGluc3RlYWQgb2YgIndyb25nIiAuLi4KPiAKPiBCdXQgaW4gb3RoZXIg
Y2FzZXMgd2UgZ28gb3V0IG9mIG91ciB3YXkgdG8gY2hlY2sgcGFyYW1ldGVycyAoZXNwZWNpYWxs
eQo+IHJlc2VydmVkIGZpZWxkcykgZXZlbiB3aGVuIHRoZXkgYXJlbid0IHByZXNlbnRseSBjb25z
dW1lZC4KCldoaWNoIHdlIGRvIHRvIG1ha2Ugc3VyZSB3ZSBjb3VsZCB1c2UgdGhlIGZpZWxkcyBk
b3duIHRoZSByb2FkCndpdGhvdXQgYnJlYWtpbmcgZXhpc3RpbmcgY2FsbGVycy4gVGhhdCdzIHF1
aXRlIGRpZmZlcmVudCBmcm9tCnRoZSBvdmVyemVhbG91cyBjaGVja2luZyB3ZSBkbyBoZXJlLgoK
PiBpLmUuIHdoYXQgZG8gd2UgZ2FpbiAob3RoZXIgdGhhbiBtb3JlIGNvbXBsaWNhdGVkIGNvZGUp
IGJ5IHJlbGF4aW5nIGEKPiByZXN0cmljdGlvbiB3ZSBrbm93IGlzIG9iZXllZCBieSBldmVyeSBj
YWxsZXI/CgpGaXJzdCAtIEkgZG9uJ3QgdGhpbmsgdGhlIGNvZGUgZ2V0cyBtb3JlIGNvbXBsaWNh
dGVkIGJ5IHRoaXMKY2hhbmdlIChub3IgdGhlIExEVCBjb3VudGVycGFydCkuIElmIGFueXRoaW5n
IEknbSBzZWVpbmcgYQpyZWFsbHkgbWlub3Igc2ltcGxpZmljYXRpb24gKGJ5IGNvbnNpc3RlbnRs
eSB1c2luZyBhIG5vdwpjb21tb24gdmFyaWFibGUpLiBGdXJ0aGVyLCBpZiB5b3UgbG9vayBjbG9z
ZWx5LCB5b3UnbGwgbm90ZQp0aGF0IHRoZSBjb21wYXQgcGF0aCBpcyBhbHJlYWR5IG9ubHkgY2hl
Y2tpbmcgdGhlIHNwZWNpZmllZApudW1iZXIgb2YgZnJhbWVzLiBIZW5jZSBJJ20gYnJpbmdpbmcg
dGhlIG5vbi1jb21wYXQgb25lIGluCmxpbmUsIGkuZS4gYW4gaW1wcm92ZW1lbnQgaW4gY29uc2lz
dGVuY3kuCgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
