Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EDCE71169AA
	for <lists+xen-devel@lfdr.de>; Mon,  9 Dec 2019 10:43:33 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ieFVV-0002ly-95; Mon, 09 Dec 2019 09:39:09 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=HzjL=Z7=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1ieFVT-0002lt-VD
 for xen-devel@lists.xenproject.org; Mon, 09 Dec 2019 09:39:07 +0000
X-Inumbo-ID: bd5ed7c6-1a67-11ea-87ab-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id bd5ed7c6-1a67-11ea-87ab-12813bfff9fa;
 Mon, 09 Dec 2019 09:39:05 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 3F59BB1A3;
 Mon,  9 Dec 2019 09:39:04 +0000 (UTC)
To: SeongJae Park <sjpark@amazon.com>, axboe@kernel.dk,
 konrad.wilk@oracle.com, roger.pau@citrix.com
References: <20191209085839.21215-1-sjpark@amazon.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <954f7beb-9d40-253e-260b-4750809bf808@suse.com>
Date: Mon, 9 Dec 2019 10:39:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <20191209085839.21215-1-sjpark@amazon.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3 0/1] xen/blkback: Squeeze page pools if a
 memory pressure
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
Cc: linux-block@vger.kernel.org, sj38.park@gmail.com, pdurrant@amazon.com,
 linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDkuMTIuMTkgMDk6NTgsIFNlb25nSmFlIFBhcmsgd3JvdGU6Cj4gRWFjaCBgYmxraWZgIGhh
cyBhIGZyZWUgcGFnZXMgcG9vbCBmb3IgdGhlIGdyYW50IG1hcHBpbmcuICBUaGUgc2l6ZSBvZgo+
IHRoZSBwb29sIHN0YXJ0cyBmcm9tIHplcm8gYW5kIGJlIGluY3JlYXNlZCBvbiBkZW1hbmQgd2hp
bGUgcHJvY2Vzc2luZwo+IHRoZSBJL08gcmVxdWVzdHMuICBJZiBjdXJyZW50IEkvTyByZXF1ZXN0
cyBoYW5kbGluZyBpcyBmaW5pc2hlZCBvciAxMDAKPiBtaWxsaXNlY29uZHMgaGFzIHBhc3NlZCBz
aW5jZSBsYXN0IEkvTyByZXF1ZXN0cyBoYW5kbGluZywgaXQgY2hlY2tzIGFuZAo+IHNocmlua3Mg
dGhlIHBvb2wgdG8gbm90IGV4Y2VlZCB0aGUgc2l6ZSBsaW1pdCwgYG1heF9idWZmZXJfcGFnZXNg
Lgo+IAo+IFRoZXJlZm9yZSwgYGJsa2Zyb250YCBydW5uaW5nIGd1ZXN0cyBjYW4gY2F1c2UgYSBt
ZW1vcnkgcHJlc3N1cmUgaW4gdGhlCj4gYGJsa2JhY2tgIHJ1bm5pbmcgZ3Vlc3QgYnkgYXR0YWNo
aW5nIGEgbGFyZ2UgbnVtYmVyIG9mIGJsb2NrIGRldmljZXMgYW5kCj4gaW5kdWNpbmcgSS9PLgoK
SSdtIGhhdmluZyBwcm9ibGVtcyB0byB1bmRlcnN0YW5kIGhvdyBhIGd1ZXN0IGNhbiBhdHRhY2gg
YSBsYXJnZSBudW1iZXIKb2YgYmxvY2sgZGV2aWNlcyB3aXRob3V0IHRob3NlIGhhdmluZyBiZWVu
IGNvbmZpZ3VyZWQgYnkgdGhlIGhvc3QgYWRtaW4KYmVmb3JlLgoKSWYgdGhvc2UgZGV2aWNlcyBo
YXZlIGJlZW4gY29uZmlndXJlZCwgZG9tMCBzaG91bGQgYmUgcmVhZHkgZm9yIHRoYXQKbnVtYmVy
IG9mIGRldmljZXMsIGUuZy4gYnkgaGF2aW5nIGVub3VnaCBzcGFyZSBtZW1vcnkgYXJlYSBmb3Ig
YmFsbG9vbmVkCnBhZ2VzLgoKU28gZWl0aGVyIEknbSBtaXNzaW5nIHNvbWV0aGluZyBoZXJlIG9y
IHlvdXIgcmVhc29uaW5nIGZvciB0aGUgbmVlZCBvZgp0aGUgcGF0Y2ggaXMgd3JvbmcuCgoKSnVl
cmdlbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
