Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F2B6D1465CC
	for <lists+xen-devel@lfdr.de>; Thu, 23 Jan 2020 11:33:01 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iuZkA-0004Ro-K9; Thu, 23 Jan 2020 10:29:46 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=UGQU=3M=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iuZk9-0004Rj-QN
 for xen-devel@lists.xenproject.org; Thu, 23 Jan 2020 10:29:45 +0000
X-Inumbo-ID: 45cf3b74-3dcb-11ea-bdfc-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 45cf3b74-3dcb-11ea-bdfc-12813bfff9fa;
 Thu, 23 Jan 2020 10:29:45 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id F0482ADA1;
 Thu, 23 Jan 2020 10:29:43 +0000 (UTC)
To: Eslam Elnikety <elnikety@amazon.com>
References: <cover.1579727989.git.elnikety@amazon.com>
 <ced5b600ea66af84a9d53c467f99ec32ed6af742.1579727989.git.elnikety@amazon.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <97fbc66a-9029-d56e-adb1-72702e37ae79@suse.com>
Date: Thu, 23 Jan 2020 11:29:53 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <ced5b600ea66af84a9d53c467f99ec32ed6af742.1579727989.git.elnikety@amazon.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v1 3/4] x86/microcode: avoid unnecessary
 xmalloc/memcpy of ucode data
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
Cc: Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Paul Durrant <pdurrant@amazon.co.uk>, xen-devel@lists.xenproject.org,
 David Woodhouse <dwmw@amazon.co.uk>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjIuMDEuMjAyMCAyMzozMCwgRXNsYW0gRWxuaWtldHkgd3JvdGU6Cj4gV2hlbiB1c2luZyBg
dWNvZGU9c2NhbmAgYW5kIGlmIGEgbWF0Y2hpbmcgbW9kdWxlIGlzIGZvdW5kLCB0aGUgbWljcm9j
b2RlCj4gcGF5bG9hZCBpcyBtYWludGFpbmVkIGluIGFuIHhtYWxsb2MoKSdkIHJlZ2lvbi4gVGhp
cyBpcyB1bm5lY2Vzc2FyeSBzaW5jZQo+IHRoZSBib290bWFwIHdvdWxkIGp1c3QgZG8uIFJlbW92
ZSB0aGUgeG1hbGxvYyBhbmQgeGZyZWUgb24gdGhlIG1pY3JvY29kZQo+IG1vZHVsZSBzY2FuIHBh
dGguCj4gCj4gVGhpcyBjb21taXQgYWxzbyBkb2VzIGF3YXkgd2l0aCB0aGUgcmVzdHJpY3Rpb24g
b24gdGhlIG1pY3JvY29kZSBtb2R1bGUKPiBzaXplIGxpbWl0LiBUaGUgY29uY2VybiB0aGF0IGEg
bGFyZ2UgbWljcm9jb2RlIG1vZHVsZSB3b3VsZCBjb25zdW1lIHRvbwo+IG11Y2ggbWVtb3J5IHBy
ZXZlbnRpbmcgZ3Vlc3RzIGxhdW5jaCBpcyBtaXNwbGFjZWQgc2luY2UgdGhpcyBpcyBhbGwgdGhl
Cj4gaW5pdCBwYXRoLiBXaGlsZSBoYXZpbmcgc3VjaCBzYWZlZ3VhcmRzIGlzIHZhbHVhYmxlLCB0
aGlzIHNob3VsZCBhcHBseQo+IGFjcm9zcyB0aGUgYm9hcmQgZm9yIGFsbCBlYXJseS9sYXRlIG1p
Y3JvY29kZSBsb2FkaW5nLiBIYXZpbmcgaXQganVzdCBvbgo+IHRoZSBgc2NhbmAgcGF0aCBpcyBj
b25mdXNpbmcuCj4gCj4gTG9va2luZyBmb3J3YXJkLCB3ZSBhcmUgYSBiaXQgY2xvc2VyIChpLmUu
LCBvbmUgeG1hbGxvYyBkb3duKSB0byBwdWxsaW5nCj4gdGhlIGVhcmx5IG1pY3JvY29kZSBsb2Fk
aW5nIG9mIHRoZSBCU1AgYSBiaXQgZWFybGllciBpbiB0aGUgZWFybHkgYm9vdAo+IHByb2Nlc3Mu
IFRoaXMgY29tbWl0IGlzIHRoZSBsb3cgaGFuZ2luZyBmcnVpdC4gVGhlcmUgaXMgc3RpbGwgYSBz
aXphYmxlCj4gYW1vdW50IG9mIHdvcmsgdG8gZ2V0IHRoZXJlIGFzIHRoZXJlIGFyZSBzdGlsbCBh
IGhhbmRmdWwgb2YgeG1hbGxvYyBpbgo+IG1pY3JvY29kZV97YW1kLGludGVsfS5jLgo+IAo+IEZp
cnN0LCB0aGVyZSBhcmUgeG1hbGxvY3Mgb24gdGhlIHBhdGggb2YgZmluZGluZyBhIG1hdGNoaW5n
IG1pY3JvY29kZQo+IHVwZGF0ZS4gU2ltaWxhciB0byB0aGUgY29tbWl0IGF0IGhhbmQsIHNlYXJj
aGluZyB0aHJvdWdoIHRoZSBtaWNyb2NvZGUKPiBibG9iIGNhbiBiZSBkb25lIG9uIHRoZSBhbHJl
YWR5IHByZXNlbnQgYnVmZmVyIHdpdGggbm8gbmVlZCB0byB4bWFsbG9jCj4gYW55IGZ1cnRoZXIu
IEV2ZW4gYmV0dGVyLCBkbyB0aGUgZmlsdGVyaW5nIGluIG1pY3JvY29kZS5jIGJlZm9yZQo+IHJl
cXVlc3RpbmcgdGhlIG1pY3JvY29kZSB1cGRhdGUgb24gYWxsIENQVXMuIFRoZSBsYXR0ZXIgcmVx
dWlyZXMgY2FyZWZ1bAo+IHJlc3RydWN0dXJpbmcgYW5kIGV4cG9zaW5nIHRoZSBhcmNoLXNwZWNp
ZmljIGxvZ2ljIGZvciBpdGVyYXRpbmcgb3Zlcgo+IHBhdGNoZXMgYW5kIGRlY2xhcmluZyBhIG1h
dGNoLgo+IAo+IFNlY29uZCwgdGhlcmUgYXJlIHhtYWxsb2NzIGZvciB0aGUgbWljcm9jb2RlIGNh
Y2hlLiBIZXJlLCB3ZSB3b3VsZCBuZWVkCj4gdG8gZW5zdXJlIHRoYXQgdGhlIGNhY2hlIGNvcnJl
c3BvbmRpbmcgdG8gdGhlIEJTUCBnZXRzIHhtYWxsb2MoKSdkIGFuZAo+IHBvcHVsYXRlZCBhZnRl
ciB0aGUgZmFjdC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBFc2xhbSBFbG5pa2V0eSA8ZWxuaWtldHlA
YW1hem9uLmNvbT4KPiBBY2tlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoK
QnR3LCBpZiB5b3UgY291bGQgY29uZmlybSAoYWxzbyBmb3IgcGF0Y2ggNCkgdGhhdCB0aGlzIGlz
IGluZGVwZW5kZW50Cm9mIHBhdGNoZXMgMSBhbmQgMiAoaXQgbG9va3MgbGlrZSBzbyB0byBtZSBh
dCBsZWFzdCksIHRoZW4gc3VyZWx5IHRoZQp0d28gb25lcyBjb3VsZCBnbyBpbiBpbmRlcGVuZGVu
dCBhbmQgYWhlYWQgb2YgcGF0Y2ggMi4KCkphbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
