Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D5F11231BB
	for <lists+xen-devel@lfdr.de>; Tue, 17 Dec 2019 17:17:12 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ihFVN-0007fB-Bt; Tue, 17 Dec 2019 16:15:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=q1hL=2H=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1ihFVL-0007ez-DQ
 for xen-devel@lists.xenproject.org; Tue, 17 Dec 2019 16:15:23 +0000
X-Inumbo-ID: 68618534-20e8-11ea-b6f1-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 68618534-20e8-11ea-b6f1-bc764e2007e4;
 Tue, 17 Dec 2019 16:15:14 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 230D6AF43;
 Tue, 17 Dec 2019 16:15:14 +0000 (UTC)
To: SeongJae Park <sjpark@amazon.com>, axboe@kernel.dk,
 konrad.wilk@oracle.com, roger.pau@citrix.com
References: <20191217160748.693-1-sjpark@amazon.com>
 <20191217160748.693-5-sjpark@amazon.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <027a402d-029a-e6c4-9f07-98728a161f22@suse.com>
Date: Tue, 17 Dec 2019 17:15:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <20191217160748.693-5-sjpark@amazon.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v11 4/6] xen/blkback: Protect
 'reclaim_memory()' with 'reclaim_lock'
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
Cc: linux-block@vger.kernel.org, pdurrant@amazon.com,
 SeongJae Park <sjpark@amazon.de>, linux-kernel@vger.kernel.org,
 sj38.park@gmail.com, xen-devel@lists.xenproject.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTcuMTIuMTkgMTc6MDcsIFNlb25nSmFlIFBhcmsgd3JvdGU6Cj4gRnJvbTogU2VvbmdKYWUg
UGFyayA8c2pwYXJrQGFtYXpvbi5kZT4KPiAKPiBUaGUgJ3JlY2xhaW1fbWVtb3J5KCknIGNhbGxi
YWNrIG9mIGJsa2JhY2sgY291bGQgcmFjZSB3aXRoCj4gJ3hlbl9ibGtia19wcm9iZSgpJyBhbmQg
J3hlbl9ibGtia19yZW1vdmUoKScuICBJbiB0aGUgY2FzZSwgaW5jb21wbGV0ZWx5Cj4gbGlua2Vk
ICdiYWNrZW5kX2luZm8nIGFuZCAnYmxraWYnIG1pZ2h0IGJlIGV4cG9zZWQgdG8gdGhlIGNhbGxi
YWNrLCB0aHVzCj4gcmVzdWx0IGluIGJhZCByZXN1bHRzIGluY2x1ZGluZyBOVUxMIGRlcmVmZXJl
bmNlLiAgVGhpcyBjb21taXQgZml4ZXMgdGhlCj4gcHJvYmxlbSBieSBhcHBseWluZyB0aGUgJ3Jl
Y2xhaW1fbG9jaycgcHJvdGVjdGlvbiB0byB0aG9zZS4KPiAKPiBOb3RlIHRoYXQgdGhpcyBjb21t
aXQgaXMgc2VwYXJhdGVkIGZvciByZXZpZXcgcHVycG9zZSBvbmx5LiAgQXMgdGhlCj4gcHJldmlv
dXMgY29tbWl0IG1pZ2h0IHJlc3VsdCBpbiByYWNlIGNvbmRpdGlvbiBhbmQgbWlnaHQgbWFrZSBi
aXNlY3QKPiBjb25mdXNlLCBwbGVhc2Ugc3F1YXNoIHRoaXMgY29tbWl0IGludG8gcHJldmlvdXMg
Y29tbWl0IGlmIHBvc3NpYmxlLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFNlb25nSmFlIFBhcmsgPHNq
cGFya0BhbWF6b24uZGU+CgpQbGVhc2UgbWVyZ2UgdGhpcyBwYXRjaCBpbnRvIHBhdGNoIDIuCgoK
SnVlcmdlbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
