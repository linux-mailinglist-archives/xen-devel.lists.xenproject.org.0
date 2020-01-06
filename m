Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 781B213123E
	for <lists+xen-devel@lfdr.de>; Mon,  6 Jan 2020 13:45:32 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ioRhm-0001UX-0m; Mon, 06 Jan 2020 12:41:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=5DW6=23=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ioRhk-0001US-QN
 for xen-devel@lists.xenproject.org; Mon, 06 Jan 2020 12:41:56 +0000
X-Inumbo-ID: ebe2c582-3081-11ea-aafd-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ebe2c582-3081-11ea-aafd-12813bfff9fa;
 Mon, 06 Jan 2020 12:41:55 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id DA985AC91;
 Mon,  6 Jan 2020 12:41:54 +0000 (UTC)
To: Alexandru Stefan ISAILA <aisaila@bitdefender.com>
References: <20191223140409.32449-1-aisaila@bitdefender.com>
 <20191223140409.32449-3-aisaila@bitdefender.com>
 <d9a3c8a4-f089-adf8-2129-41e7422b514c@citrix.com>
 <ef48f9b8-0eb9-160d-9524-c312445257e4@bitdefender.com>
 <8c85333c-e655-4a4a-daa1-ee4b9d3913f7@citrix.com>
 <578c32be-a45a-d58e-7f88-03db2ff109a8@bitdefender.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <79bb6899-d8e7-6626-cf2d-33eded654288@suse.com>
Date: Mon, 6 Jan 2020 13:42:40 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <578c32be-a45a-d58e-7f88-03db2ff109a8@bitdefender.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH V6 3/4] x86/mm: Pull out the p2m specifics
 from p2m_init_altp2m_ept
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
Cc: Kevin Tian <kevin.tian@intel.com>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Jun Nakajima <jun.nakajima@intel.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDYuMDEuMjAyMCAxMjo1NSwgQWxleGFuZHJ1IFN0ZWZhbiBJU0FJTEEgd3JvdGU6Cj4gT24g
MjQuMTIuMjAxOSAxMjoxNSwgR2VvcmdlIER1bmxhcCB3cm90ZToKPj4gT24gMTIvMjQvMTkgMTA6
MDggQU0sIEFsZXhhbmRydSBTdGVmYW4gSVNBSUxBIHdyb3RlOgo+Pj4KPj4+Cj4+PiBPbiAyNC4x
Mi4yMDE5IDEwOjAxLCBHZW9yZ2UgRHVubGFwIHdyb3RlOgo+Pj4+IE9uIDEyLzIzLzE5IDI6MDQg
UE0sIEFsZXhhbmRydSBTdGVmYW4gSVNBSUxBIHdyb3RlOgo+Pj4+Cj4+Pj4gV2h5Pwo+Pj4+Cj4+
Pgo+Pj4gVGhpcyB3YXMgYSByZXF1ZXN0IGZyb20gSmFuLgo+Pgo+PiBZZXMsIEkgc2F3IHRoZSBS
ZXF1ZXN0ZWQtYnkuICBJdCBzdGlsbCBuZWVkcyBhbiBleHBsYW5hdGlvbi4KPj4KPiAKPiBUaGlz
IGlzIHdoYXQgSmFuIHNhaWQgaW4gVjI6Cj4gCj4gIkFsbCBvZiB0aGlzIGlzIG5vdCBFUFQtc3Bl
Y2lmaWMuIEJlZm9yZSBhZGRpbmcgbW9yZSBpbmZyYXN0cnVjdHVyZSB0bwo+IGNvdmVyIGZvciB0
aGlzIChoZXJlOiBhbm90aGVyIGZ1bmN0aW9uIHBhcmFtZXRlciksIGhvdyBhYm91dCBtb3ZpbmcK
PiB0aGVzZSBwYXJ0cyBpbnRvIHZlbmRvci1pbmRlcGVuZGVudCBjb2RlPyIKPiAKPiBJZiB0aGVy
ZSBpcyBhIG5lZWQgZm9yIGZ1cnRoZXIgZXhwbGFuYXRpb24gbWF5YmUgSmFuIGNhbiBoZWxwIGhl
cmUuCgpObyBtYXR0ZXIgd2hvIGl0IHdhcyB0aGF0IGFza2VkIGZvciBzb21ldGhpbmcsIHRoZXJl
J3Mgbm8gcmVhc29uCnRvIGhhdmUgYSBjb21wbGV0ZWx5IGVtcHR5IGNvbW1pdCBtZXNzYWdlLCB1
bmxlc3MgdGhlIHRpdGxlIGlzCmJvdGggY2hhbmdlIGRlc2NyaXB0aW9uIGFuZCByYXRpb25hbGUg
YXQgb25jZS4gUGVyaGFwcyBhIHNsaWdodGx5CnJlLXdyaXR0ZW4gc2VudGVuY2UgbGlrZSAiU29t
ZSBvZiB3aGF0IHRoaXMgRVBULXNwZWNpZmljIGZ1bmN0aW9uCmRvZXMgaXQgbm90IEVQVC1zcGVj
aWZpYyIgd291bGQgYWxyZWFkeSBkby4gWW91IGNvdWxkIGdvIGZ1cnRoZXIKYW5kIGFsc28gc3Rh
dGUgdGhlcmUgd2hhdCBJJ3ZlIHNhaWQgaW4gdGhlIHNlY29uZCBzZW50ZW5jZS4KCkphbgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
