Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EBD2B17B961
	for <lists+xen-devel@lfdr.de>; Fri,  6 Mar 2020 10:35:40 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jA9Lj-0004yD-Db; Fri, 06 Mar 2020 09:32:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=JlMq=4X=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jA9Li-0004y8-5G
 for xen-devel@lists.xenproject.org; Fri, 06 Mar 2020 09:32:54 +0000
X-Inumbo-ID: 74147b82-5f8d-11ea-90c4-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 74147b82-5f8d-11ea-90c4-bc764e2007e4;
 Fri, 06 Mar 2020 09:32:53 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 4E70EB282;
 Fri,  6 Mar 2020 09:32:52 +0000 (UTC)
To: Roger Pau Monne <roger.pau@citrix.com>
References: <20200303172046.50569-1-roger.pau@citrix.com>
 <20200303172046.50569-7-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <260013af-2af0-98e1-70d8-087fd8d22a4f@suse.com>
Date: Fri, 6 Mar 2020 10:32:55 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200303172046.50569-7-roger.pau@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v6 6/6] x86/tlb: use Xen L0 assisted TLB
 flush when available
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
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDMuMDMuMjAyMCAxODoyMCwgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+IFVzZSBYZW4ncyBM
MCBIVk1PUF9mbHVzaF90bGJzIGh5cGVyY2FsbCBpbiBvcmRlciB0byBwZXJmb3JtIGZsdXNoZXMu
Cj4gVGhpcyBncmVhdGx5IGluY3JlYXNlcyB0aGUgcGVyZm9ybWFuY2Ugb2YgVExCIGZsdXNoZXMg
d2hlbiBydW5uaW5nCj4gd2l0aCBhIGhpZ2ggYW1vdW50IG9mIHZDUFVzIGFzIGEgWGVuIGd1ZXN0
LCBhbmQgaXMgc3BlY2lhbGx5IGltcG9ydGFudAo+IHdoZW4gcnVubmluZyBpbiBzaGltIG1vZGUu
Cj4gCj4gVGhlIGZvbGxvd2luZyBmaWd1cmVzIGFyZSBmcm9tIGEgUFYgZ3Vlc3QgcnVubmluZyBg
bWFrZSAtajMyIHhlbmAgaW4KPiBzaGltIG1vZGUgd2l0aCAzMiB2Q1BVcyBhbmQgSEFQLgo+IAo+
IFVzaW5nIHgyQVBJQyBhbmQgQUxMQlVUIHNob3J0aGFuZDoKPiByZWFsCTRtMzUuOTczcwo+IHVz
ZXIJNG0zNS4xMTBzCj4gc3lzCTM2bTI0LjExN3MKPiAKPiBVc2luZyBMMCBhc3Npc3RlZCBmbHVz
aDoKPiByZWFsICAgIDFtMi41OTZzCj4gdXNlciAgICA0bTM0LjgxOHMKPiBzeXMgICAgIDVtMTYu
Mzc0cwo+IAo+IFRoZSBpbXBsZW1lbnRhdGlvbiBhZGRzIGEgbmV3IGhvb2sgdG8gaHlwZXJ2aXNv
cl9vcHMgc28gb3RoZXIKPiBlbmxpZ2h0ZW5tZW50cyBjYW4gYWxzbyBpbXBsZW1lbnQgc3VjaCBh
c3Npc3RlZCBmbHVzaCBqdXN0IGJ5IGZpbGxpbmcKPiB0aGUgaG9vay4KPiAKPiBOb3RlIHRoYXQg
dGhlIFhlbiBpbXBsZW1lbnRhdGlvbiBjb21wbGV0ZWx5IGlnbm9yZXMgdGhlIGRpcnR5IENQVSBt
YXNrCj4gYW5kIHRoZSBsaW5lYXIgYWRkcmVzcyBwYXNzZWQgaW4sIGFuZCBhbHdheXMgcGVyZm9y
bXMgYSBnbG9iYWwgVExCCj4gZmx1c2ggb24gYWxsIHZDUFVzLiBUaGlzIGlzIGEgbGltaXRhdGlv
biBvZiB0aGUgaHlwZXJjYWxsIHByb3ZpZGVkIGJ5Cj4gWGVuLiBBbHNvIG5vdGUgdGhhdCBsb2Nh
bCBUTEIgZmx1c2hlcyBhcmUgbm90IHBlcmZvcm1lZCB1c2luZyB0aGUKPiBhc3Npc3RlZCBUTEIg
Zmx1c2gsIG9ubHkgcmVtb3RlIG9uZXMuCgpBcyB0byB0aGlzIGxhc3Qgc2VudGVuY2UgLSBpc24n
dCB0aGlzIHdhc3RlZnVsIGF0IGxlYXN0IHdoZW4gYQpmdWxsIGFkZHJlc3Mgc3BhY2UgZmx1c2gg
aXMgYmVpbmcgcHJvY2Vzc2VkIGFueXdheT8KCj4gU2lnbmVkLW9mZi1ieTogUm9nZXIgUGF1IE1v
bm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+Cj4gUmV2aWV3ZWQtYnk6IFdlaSBMaXUgPHdsQHhl
bi5vcmc+CgpSZXZpZXdlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
