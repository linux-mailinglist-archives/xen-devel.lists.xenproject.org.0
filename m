Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CEB316EBBD
	for <lists+xen-devel@lfdr.de>; Tue, 25 Feb 2020 17:51:43 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j6dOF-0002Tu-DI; Tue, 25 Feb 2020 16:48:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=g8Eh=4N=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1j6dOD-0002Tp-W4
 for xen-devel@lists.xenproject.org; Tue, 25 Feb 2020 16:48:58 +0000
X-Inumbo-ID: b6ce8db0-57ee-11ea-a490-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b6ce8db0-57ee-11ea-a490-bc764e2007e4;
 Tue, 25 Feb 2020 16:48:57 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 26B21B233;
 Tue, 25 Feb 2020 16:48:56 +0000 (UTC)
To: Roger Pau Monne <roger.pau@citrix.com>
References: <20200224104645.96381-1-roger.pau@citrix.com>
 <20200224104645.96381-3-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <3eef30e7-b000-04f0-12ff-b77108d6e638@suse.com>
Date: Tue, 25 Feb 2020 17:49:01 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200224104645.96381-3-roger.pau@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3 2/5] x86: track when in #NMI context
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
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjQuMDIuMjAyMCAxMTo0NiwgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+IEFkZCBoZWxwZXJz
IHRvIHRyYWNrIHdoZW4gcnVubmluZyBpbiAjTk1JIGNvbnRleHQuIFRoaXMgaXMgbW9kZWxlZAo+
IGFmdGVyIHRoZSBpbl9pcnEgaGVscGVycy4KPiAKPiBUaGUgU0RNIHN0YXRlcyB0aGF0IG5vICNO
TUkgY2FuIGJlIGRlbGl2ZXJlZCB3aGlsZSBoYW5kbGluZyBhICNOTUkKPiB1bnRpbCB0aGUgcHJv
Y2Vzc29yIGhhcyBleGVjdXRlZCBhbiBpcmV0IGluc3RydWN0aW9uLiBJdCdzIHBvc3NpYmxlCj4g
aG93ZXZlciB0aGF0IGFub3RoZXIgZmF1bHQgaXMgcmVjZWl2ZWQgd2hpbGUgaGFuZGxpbmcgdGhl
ICNOTUkgKGEgI01DCj4gZm9yIGV4YW1wbGUpLCBhbmQgdGh1cyB0aGUgaXJldCBmcm9tIHRoYXQg
ZmF1bHQgd291bGQgYWxsb3cgZnVydGhlcgo+ICNOTUlzIHRvIGJlIGluamVjdGVkIHdoaWxlIHN0
aWxsIHByb2Nlc3NpbmcgdGhlIHByZXZpb3VzIG9uZSwgYW5kCj4gaGVuY2UgYW4gaW50ZWdlciBp
cyBuZWVkZWQgaW4gb3JkZXIgdG8ga2VlcCB0cmFjayBvZiBpbiBzZXJ2aWNlICNOTUlzLgoKV2hp
bGUgSSBhZ3JlZSB0aGF0IHRoaXMgbmVlZHMgdGFraW5nIGNhcmUgb2YsIEknbSBhZnJhaWQgaW5f
bm1pKCkKaXMgYmVjb21pbmcgYW1iaWd1b3VzIGJlY2F1c2Ugb2YgdGhpcyAtIHlvdSBnaXZlIGl0
IHRoZSBtZWFuaW5nCiJ3ZSdyZSBoYW5kbGluZyBhbiBOTUkiLCB3aGlsZSBvbmUgY291bGQgYWxz
byBhc3N1bWUgaXQgdG8gbWVhbgoid2UncmUgaW4gTk1JIGNvbnRleHQsIGkuZS4gZnVydGhlciBO
TUlzIGFyZSBub3QgcG9zc2libGUiLiBJT1cKSSB0aGluayB3ZSB3YW50IHRvIGNvbnNpZGVyIHVz
aW5nIGFub3RoZXIgbmFtZSwgZGVzcGl0ZSB0aGlzCmdldHRpbmcgdGhpbmdzIGxlc3MgbmljZWx5
IGFsaWduZWQgd2l0aCBpbl9pcnEoKS4gUGVyaGFwcwppbl9ubWlfaGFuZGxlcigpPwoKPiBXaGls
ZSB0aGVyZSBtb3ZlIG5taV9jb3VudCgpIGludG8gYSB4ODYgc3BlY2lmaWMgaGVhZGVyIGFuZCBk
cm9wIHRoZQo+IGxlYWRpbmcgdW5kZXJzY29yZXMgZnJvbSBfX25taV9jb3VudCBmaWVsZC4KCkkg
bm90aWNlIHlvdSByZS11c2UgdGhlIGZpZWxkcyB0aGF0IEkgc3VnZ2VzdGVkIHRvIGJlIHJlbW92
ZWQgYnkKdGhlIHByaW9yIHBhdGNoLiBJIHRoaW5rIGxvZ2ljYWxseSB0aGV5IHNob3VsZCBpbmRl
ZWQgYmUgcmVtb3ZlZAp0aGVyZSwgYW5kIGEgbmV3IGZpZWxkIGFuZCBhIG5ldyBtYWNybyBiZSBp
bnRyb2R1Y2VkIGhlcmUuCgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
