Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 628DF11823D
	for <lists+xen-devel@lfdr.de>; Tue, 10 Dec 2019 09:30:45 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iearp-0004oP-DS; Tue, 10 Dec 2019 08:27:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=1mH3=2A=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iearo-0004oK-D7
 for xen-devel@lists.xenproject.org; Tue, 10 Dec 2019 08:27:36 +0000
X-Inumbo-ID: eaaebd4e-1b26-11ea-b6f1-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id eaaebd4e-1b26-11ea-b6f1-bc764e2007e4;
 Tue, 10 Dec 2019 08:27:35 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 0515FB3C8;
 Tue, 10 Dec 2019 08:27:33 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20191205223008.8623-1-andrew.cooper3@citrix.com>
 <20191205223008.8623-5-andrew.cooper3@citrix.com>
 <2c3ea72b-b85a-a65e-9403-3abeae76a41a@suse.com>
 <69f66b76-7352-dba2-bd04-2ffe2840a30b@suse.com>
 <5ac03858-2ed8-7c4b-82c9-a1ebafa164bb@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <2eefaf3c-d2c3-7c92-ed5a-081007eef063@suse.com>
Date: Tue, 10 Dec 2019 09:27:49 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <5ac03858-2ed8-7c4b-82c9-a1ebafa164bb@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 4/6] xen/hypercall: Cope with -ERESTART on
 more hypercall paths
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
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDkuMTIuMjAxOSAxODo0MywgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAwOS8xMi8yMDE5
IDE2OjI5LCBKYW4gQmV1bGljaCB3cm90ZToKPj4gT24gMDkuMTIuMjAxOSAxNzoyNSwgSmFuIEJl
dWxpY2ggd3JvdGU6Cj4+PiBPbiAwNS4xMi4yMDE5IDIzOjMwLCBBbmRyZXcgQ29vcGVyIHdyb3Rl
Ogo+Pj4+IFRoZXNlIGh5cGVyY2FsbHMgZWFjaCB1c2UgY29udGludWVfaHlwZXJjYWxsX29uX2Nw
dSgpLCB3aG9zZSBBUEkgaXMgYWJvdXQgdG8KPj4+PiBzd2l0Y2ggdG8gdXNlIC1FUkVTVEFSVC4g
IFVwZGF0ZSB0aGUgc29vbi10by1iZSBhZmZlY3RlZCBwYXRocyB0byBjb3BlLAo+Pj4+IGZvbGRp
bmcgZXhpc3RpbmcgY29udGluYXRpb24gbG9naWMgd2hlcmUgYXBwbGljYWJsZS4KPj4+Pgo+Pj4+
IEluIGFkZGl0aW9uOgo+Pj4+ICAqIEZvciBwbGF0Zm9ybSBvcCBhbmQgc3lzY3RsLCBpbnNlcnQg
YSBjcHVfcmVsYXgoKSBpbnRvIHdoYXQgaXMgb3RoZXJ3aXNlIGEKPj4+PiAgICB0aWdodCBzcGlu
bG9jayBsb29wLCBhbmQgbWFrZSB0aGUgY29udGludWF0aW9uIGxvZ2ljIGNvbW1vbiBhdCB0aGUK
Pj4+PiAgICBlcGlsb2d1ZS4KPj4+IElzIHRoaXMgcmVhbGx5IG5lZWRlZCB3aXRoIGEgaHlwZXJj
YWxsX3ByZWVtcHRfY2hlY2soKSBpbnZvY2F0aW9uCj4+PiBhbHJlYWR5IGluIHRoZSBib2RpZXMg
b2YgdGhlc2UgbG9vcHM/Cj4gCj4gWWVzLsKgIFRoZSByZWFzb24geW91J3JlIHN1cHBvc2VkIHRv
IHBhdXNlIGlzIHRvIHN0b3AgaGF2aW5nIG1lbW9yeQo+IHRyYWZmaWMgY29uc3RhbnRseSB0cnlp
bmcgdG8gcHVsbCB0aGUgc3BpbmxvY2sncyBjYWNoZWxpbmUgaW50byBzaGFyZWQKPiBzdGF0ZS4K
PiAKPiBSYWNpbmcgcm91bmQgYSB0aWdodCBsb29wIGNvbnN0YW50bHkgcmVhZGluZyA0IG9yIDUg
bWVtb3J5IGxvY2F0aW9ucyBpcwo+IGFsbW9zdCBhcyBiYWQuCj4gCj4+IEFuZCBpZiBpdCdzIHJl
YWxseSB0byBiZSBhZGRlZCwgc2hvdWxkbid0IGl0IGJlIGF0IHRoZSBib3R0b20KPj4gb2YgdGhl
IGxvb3AgYm9kaWVzIHJhdGhlciB0aGFuIGF0IHRoZSB0b3A/Cj4gCj4gSXQgZG9lc24ndCBtYXR0
ZXIuCgpXZWxsLCBtb2Rlcm4gZG9jdW1lbnRhdGlvbiBpbmRlZWQgZ2l2ZXMgbm8gaGludCB3aGF0
c29ldmVyIHRvd2FyZHMKaXRzIHBsYWNlbWVudC4gUmVjYWxsaW5nIHRoZSBpbml0aWFsIGd1aWRl
bGluZXMgZnJvbSBJbnRlbCAoZnJvbQpldmVuIGJlZm9yZSB0aGUgd2hpdGVwYXBlciB3YXMgbWFk
ZSBhdmFpbGFibGUpIHRoZXJlIHdhcyBhCnN1Z2dlc3Rpb24gdG93YXJkcyBwbGFjaW5nIGl0IGNs
b3NlIGFoZWFkIG9mIHRoZSBwcm9ibGVtYXRpYwptZW1vcnkgYWNjZXNzLiBUaGUgbGFzdCBleGFt
cGxlIGluIHRoZSB3aGl0ZXBhcGVyIGxvb2tzIHRvIHN1cHBvcnQKdGhpcyB3aXRob3V0IGV4cGxp
Y2l0bHkgc2F5aW5nIHNvLgoKQW55d2F5LCBwcmVmZXJhYmx5IHdpdGggaXQgbW92ZWQKUmV2aWV3
ZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KCkphbgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
