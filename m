Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DD07E107297
	for <lists+xen-devel@lfdr.de>; Fri, 22 Nov 2019 14:00:00 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iY8VS-0003EG-F9; Fri, 22 Nov 2019 12:57:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=28IZ=ZO=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iY8VR-0003EA-FC
 for xen-devel@lists.xenproject.org; Fri, 22 Nov 2019 12:57:49 +0000
X-Inumbo-ID: aea52412-0d27-11ea-9631-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id aea52412-0d27-11ea-9631-bc764e2007e4;
 Fri, 22 Nov 2019 12:57:47 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 9375EABEA;
 Fri, 22 Nov 2019 12:57:46 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <fba2992c-e306-dfb2-8edb-20fe5d18ca98@suse.com>
 <ad0a9bc4-dbd6-d59c-d33b-8bed744376ae@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <ccebdbf3-7cd9-b1e9-b3c5-976ee5b5380b@suse.com>
Date: Fri, 22 Nov 2019 13:57:49 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <ad0a9bc4-dbd6-d59c-d33b-8bed744376ae@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] x86: avoid HPET use on certain Intel
 platforms
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
Cc: Juergen Gross <jgross@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjIuMTEuMjAxOSAxMzo1MCwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAyMi8xMS8yMDE5
IDEyOjQ2LCBKYW4gQmV1bGljaCB3cm90ZToKPj4gTGludXggY29tbWl0IGZjNWRiNTg1MzliNDkz
NTFlNzZmMTk4MTdlZDExMDJiZjdjNzEyZDAgc2F5cwo+Pgo+PiAiU29tZSBDb2ZmZWUgTGFrZSBw
bGF0Zm9ybXMgaGF2ZSBhIHNrZXdlZCBIUEVUIHRpbWVyIG9uY2UgdGhlIFNvQ3MgZW50ZXJlZAo+
PiAgUEMxMCwgd2hpY2ggaW4gY29uc2VxdWVuY2UgbWFya3MgVFNDIGFzIHVuc3RhYmxlIGJlY2F1
c2UgSFBFVCBpcyB1c2VkIGFzCj4+ICB3YXRjaGRvZyBjbG9ja3NvdXJjZSBmb3IgVFNDLiIKPj4K
Pj4gRm9sbG93IHRoaXMgZm9yIFhlbiBhcyB3ZWxsLiBMb29raW5nIGF0IGl0cyBwYXRjaCBjb250
ZXh0IG1hZGUgbWUgbm90aWNlCj4+IHRoZXkgaGF2ZSBhIHByZS1leGlzdGluZyBxdWlyayBmb3Ig
QmF5IFRyYWlsIGFzIHdlbGwuIFRoZSBjb21tZW50IHRoZXJlLAo+PiBob3dldmVyLCBwb2ludHMg
YXQgYSBDaGVycnkgVHJhaWwgZG9jdW1lbnQuIExvb2tpbmcgYXQgdGhlIGRhdGFzaGVldHMgb2YK
Pj4gYm90aCwgdGhlcmUgYXBwZWFyIHRvIGJlIHNpbWlsYXIgaXNzdWVzLCBzbyBnbyBiZXlvbmQg
TGludXgnZXMgY292ZXJhZ2UKPj4gYW5kIGV4Y2x1ZGUgYm90aC4gQWxzbyBrZXkgdGhlIGRpc2Fi
bGUgb24gdGhlIFBDSSBJRHMgb2YgdGhlIGFjdHVhbAo+PiBhZmZlY3RlZCBkZXZpY2VzLCByYXRo
ZXIgdGhhbiB0aG9zZSBvZiAwMDowMC4wLgo+Pgo+PiBBcHBseSB0aGUgd29ya2Fyb3VuZHMgb25s
eSB3aGVuIHRoZSB1c2Ugb2YgSFBFVCB3YXMgbm90IGV4cGxpY2l0bHkKPj4gcmVxdWVzdGVkIG9u
IHRoZSBjb21tYW5kIGxpbmUgYW5kIHdoZW4gdXNlIG9mIChkZWVwKSBDLXN0YXRlcyB3YXMgbm90
Cj4+IGRpc2FibGVkLgo+Pgo+PiBBZGp1c3QgYSBmZXcgdHlwZXMgaW4gdG91Y2hlZCBvciBuZWFy
YnkgY29kZSBhdCB0aGUgc2FtZSB0aW1lLgo+IAo+IFJlcG9ydGVkLWJ5ID8KClRoZSBMaW51eCBj
b21taXQgaGFzIGEgU3VnZ2VzdGVkLWJ5LCBidXQgbm8gUmVwb3J0ZWQtYnkuIERvIHlvdQp3YW50
IG1lIHRvIGNvcHkgdGhhdCBvbmU/IE9yIGVsc2UgZG8geW91IGhhdmUgYW55IHN1Z2dlc3Rpb24g
YXMKdG8gd2hvIHRoZSByZXBvcnRlciB3YXM/Cgo+PiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGlj
aCA8amJldWxpY2hAc3VzZS5jb20+Cj4gCj4gQWNrZWQtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJl
dy5jb29wZXIzQGNpdHJpeC5jb20+CgpUaGFua3MuCgpKYW4KCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
