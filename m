Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0873118F076
	for <lists+xen-devel@lfdr.de>; Mon, 23 Mar 2020 08:54:12 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jGHsU-0002Uh-Ks; Mon, 23 Mar 2020 07:52:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=1UMm=5I=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jGHsT-0002Ua-CU
 for xen-devel@lists.xenproject.org; Mon, 23 Mar 2020 07:52:05 +0000
X-Inumbo-ID: 2fcbf3e6-6cdb-11ea-a6c1-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2fcbf3e6-6cdb-11ea-a6c1-bc764e2007e4;
 Mon, 23 Mar 2020 07:52:04 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id E9262AB64;
 Mon, 23 Mar 2020 07:52:03 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20200319152622.31758-1-andrew.cooper3@citrix.com>
 <20200319152622.31758-6-andrew.cooper3@citrix.com>
 <2acabccd-da3b-9e22-8f27-41ab1b3cde8a@suse.com>
 <5b5994ae-db1c-b0d7-16d2-c2f264dc5440@citrix.com>
 <d8475c22-3350-c536-6cf8-f3e64515ede2@suse.com>
 <6e8a9bbb-c534-46de-9510-2aa791e43b99@citrix.com>
 <bc893330-0019-e075-f92f-fe997f120546@suse.com>
 <de1f9711-1fc5-1afe-e5d7-700538a126bf@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <c69e5e23-782e-84ac-5792-074250414a89@suse.com>
Date: Mon, 23 Mar 2020 08:52:02 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <de1f9711-1fc5-1afe-e5d7-700538a126bf@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 5/6] x86/ucode: Alter ops->free_patch() to
 free the entire patch
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjAuMDMuMjAyMCAxNzo0OCwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAyMC8wMy8yMDIw
IDE2OjE2LCBKYW4gQmV1bGljaCB3cm90ZToKPj4gT24gMjAuMDMuMjAyMCAxNzoxMCwgQW5kcmV3
IENvb3BlciB3cm90ZToKPj4+IE9uIDIwLzAzLzIwMjAgMTU6MTUsIEphbiBCZXVsaWNoIHdyb3Rl
Ogo+Pj4+IE9uIDIwLjAzLjIwMjAgMTU6NTAsIEFuZHJldyBDb29wZXIgd3JvdGU6Cj4+Pj4+IE9u
IDIwLzAzLzIwMjAgMTM6NTEsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+Pj4gT24gMTkuMDMuMjAy
MCAxNjoyNiwgQW5kcmV3IENvb3BlciB3cm90ZToKPj4+Pj4+PiBUaGUgZGF0YSBsYXlvdXQgZm9y
IHN0cnVjdCBtaWNyb2NvZGVfcGF0Y2ggaXMgZXh0cmVtZWx5IHBvb3IsIGFuZAo+Pj4+Pj4+IHVu
bmVjZXNzYXJpbHkgY29tcGxpY2F0ZWQuICBBbG1vc3QgYWxsIG9mIGl0IGlzIG9wYXF1ZSB0byBj
b3JlLmMsIHdpdGggdGhlCj4+Pj4+Pj4gZXhjZXB0aW9uIG9mIGZyZWVfcGF0Y2goKS4KPj4+Pj4+
Pgo+Pj4+Pj4+IE1vdmUgdGhlIHJlc3BvbnNpYmlsaXR5IGZvciBmcmVlaW5nIHRoZSBwYXRjaCBp
bnRvIHRoZSBmcmVlX3BhdGNoKCkgaG9vaywKPj4+Pj4+PiB3aGljaCB3aWxsIGFsbG93IGVhY2gg
ZHJpdmVyIHRvIGRvIGEgYmV0dGVyIGpvYi4KPj4+Pj4+IEJ1dCB0aGF0IHdyYXBwZXIgc3RydWN0
dXJlIGlzIHNvbWV0aGluZyBjb21tb24sIGkuZS4gdG8gYmUKPj4+Pj4+IGFsbG9jYXRlZCBhcyB3
ZWxsIGFzIHRvIGJlIGZyZWVkIChwcmVmZXJhYmx5KSBieSBjb21tb24gY29kZS4KPj4+Pj4+IFdl
IGRpZCBzcGVjaWZpY2FsbHkgbW92ZSB0aGVyZSBkdXJpbmcgcmV2aWV3IG9mIHRoZSBtb3N0Cj4+
Pj4+PiByZWNlbnQgcmUtd29yay4KPj4+Pj4gVGhlIGN1cnJlbnQgYmVoYXZpb3VyIG9mIGhhdmlu
ZyBpdCBhbGxvY2F0ZWQgYnkgdGhlIHJlcXVlc3QoKSBob29rLCBidXQKPj4+Pj4gImZyZWVkIiBp
biBhIG1peCBvZiBjb21tb24gY29kZSBhbmQgYSBmcmVlKCkgaG9vaywgY2Fubm90IHBvc3NpYmx5
IGhhdmUKPj4+Pj4gYmVlbiBhbiBpbnRlbmRlZCBjb25zZXF1ZW5jZSBmcm9tIG1vdmluZyBpdC4K
Pj4+Pj4KPj4+Pj4gVGhlIGZyZWUoKSBob29rIGlzIGN1cnJlbnRseSBuZWNlc3NhcnksIGFzIGlz
IHRoZSB2ZW5kb3Itc3BlY2lmaWMKPj4+Pj4gYWxsb2NhdGlvbiBsb2dpYywgc28gc3BsaXR0aW5n
IGZyZWVpbmcgcmVzcG9uc2liaWxpdHkgd2l0aCB0aGUgY29tbW9uCj4+Pj4+IGNvZGUgaXMgd3Jv
bmcuCj4+Pj4gSG1tLCB5ZXMsIHdpdGggdGhlIGFsbG9jYXRpb24gZG9uZSBpbiB2ZW5kb3IgY29k
ZSwgdGhlIGZyZWVpbmcKPj4+PiBjb3VsZCBiZSwgdG9vLiBCdXQgdGhlIHdyYXBwZXIgc3RydWN0
IGdldHMgYWxsb2NhdGVkIGxhc3QgaW4KPj4+PiBjcHVfcmVxdWVzdF9taWNyb2NvZGUoKSAoZm9y
IGJvdGggSW50ZWwgYW5kIEFNRCksIGFuZCBoZW5jZSBvdWdodAo+Pj4+IHRvIGJlIHJlbGF0aXZl
bHkgZWFzeSB0byBnZXQgcmlkIG9mLCBpbnN0ZWFkIG9mIG1vdmluZyBhcm91bmQKPj4+PiB0aGUg
ZnJlZWluZyAodGhlIGNvbW1vbiBjb2RlIHBhcnQgb2YgdGhlIGZyZWVpbmcgd291bGQgdGhlbgo+
Pj4+IHNpbXBseSBnbyBhd2F5KS4KPj4+IEkgYW0gd29ya2luZyBvbiByZW1vdmluZyBhbGwgdW5u
ZWNlc3NhcnkgYWxsb2NhdGlvbnMsIGluY2x1ZGluZyBmb2xkaW5nCj4+PiBtaWNyb2NvZGVfe2lu
dGVsLGFtZH0gaW50byBtaWNyb2NvZGVfcGF0Y2gsIGJ1dCBJJ20gc3RpbGwgY29uZmlkZW50IHRo
aXMKPj4+IHdhbnRzIHRvIGJlIGRvbmUgd2l0aCBtaWNyb2NvZGVfcGF0Y2ggYmVpbmcgcHJvcGVy
bHkgb3BhcXVlIHRvIGNvcmUuYwo+PiBPaCwgc3VyZSAtIEkgZGlkbid0IG1lYW4gdG8gcHV0IHRo
aXMgdW5kZXIgcXVlc3Rpb24uIEl0IGp1c3Qgc2VlbXMKPj4gdG8gbWUgdGhlIHRoZSByb3V0ZSB0
aGVyZSBtYXkgYmV0dGVyIGJlIHNvbWV3aGF0IGRpZmZlcmVudCBmcm9tIHRoaXMKPj4gYW5kIHRo
ZSBmb2xsb3dpbmcgcGF0Y2guCj4gCj4gSG93Pwo+IAo+IFdlIHdhbnQgdG8gcmVtb3ZlIHRoZSBw
b2ludGVyIGZyb20gbWljcm9jb2RlX3BhdGNoLCBhbmQgZG9uJ3Qgd2FudCB0aGUKPiBjdXJyZW50
IGNvbnRlbnRzIG9mIG1pY3JvY29kZV97aW50ZWwsYW1kfSBlc2NhcGluZyBmcm9tIHRoZWlyIGN1
cnJlbnQKPiBzb3VyY2UgZmlsZXMuCj4gCj4gSSBkb24ndCBzZWUgYW55IG9wdGlvbiBidXQgdG8g
cmVhcnJhbmdlIGl0IHRvIGJlIG9wYXF1ZS4KCkkgYWdyZWUuIEJ1dCB3aHkgZG8geW91IG5lZWQg
dG8gZmlyc3QgcmUtYXJyYW5nZSBmcmVlaW5nLCBpZiB0aGVuIHlvdQpkcm9wIHRoZSB3cmFwcGVy
IHN0cnVjdCAod2hpY2ggcmVhbGx5IGlzIGEgdW5pb24pIGFueXdheT8gQnkgZHJvcHBpbmcKaXQg
cmlnaHQgYXdheSwgdGhlIHNwbGl0IGZyZWVpbmcgd2lsbCBnbyBhd2F5IGFzIGEgc2lkZSBlZmZl
Y3QuCgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
