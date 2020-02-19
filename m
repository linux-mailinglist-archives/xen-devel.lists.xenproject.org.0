Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ECA571644BA
	for <lists+xen-devel@lfdr.de>; Wed, 19 Feb 2020 13:58:32 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j4OtZ-0003Me-83; Wed, 19 Feb 2020 12:56:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=wVCj=4H=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1j4OtY-0003MZ-3l
 for xen-devel@lists.xenproject.org; Wed, 19 Feb 2020 12:56:04 +0000
X-Inumbo-ID: 2f13d97e-5317-11ea-b0fd-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2f13d97e-5317-11ea-b0fd-bc764e2007e4;
 Wed, 19 Feb 2020 12:56:03 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 3B998B229;
 Wed, 19 Feb 2020 12:56:02 +0000 (UTC)
To: Roger Pau Monne <roger.pau@citrix.com>
References: <20200213113237.58795-1-roger.pau@citrix.com>
 <20200213113237.58795-2-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <d1ab3bc4-5b9e-25c7-130d-c64e91f7705c@suse.com>
Date: Wed, 19 Feb 2020 13:56:02 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <20200213113237.58795-2-roger.pau@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 1/2] smp: convert the cpu maps lock into a
 rw lock
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
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTMuMDIuMjAyMCAxMjozMiwgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+ICB2b2lkIF9faW5p
dCByZWdpc3Rlcl9jcHVfbm90aWZpZXIoc3RydWN0IG5vdGlmaWVyX2Jsb2NrICpuYikKPiAgewo+
IC0gICAgaWYgKCAhc3Bpbl90cnlsb2NrKCZjcHVfYWRkX3JlbW92ZV9sb2NrKSApCj4gKyAgICBp
ZiAoICF3cml0ZV90cnlsb2NrKCZjcHVfYWRkX3JlbW92ZV9sb2NrKSApCj4gICAgICAgICAgQlVH
KCk7IC8qIFNob3VsZCBuZXZlciBmYWlsIGFzIHdlIGFyZSBjYWxsZWQgb25seSBkdXJpbmcgYm9v
dC4gKi8KPiAgICAgIG5vdGlmaWVyX2NoYWluX3JlZ2lzdGVyKCZjcHVfY2hhaW4sIG5iKTsKPiAt
ICAgIHNwaW5fdW5sb2NrKCZjcHVfYWRkX3JlbW92ZV9sb2NrKTsKPiArICAgIHdyaXRlX3VubG9j
aygmY3B1X2FkZF9yZW1vdmVfbG9jayk7Cj4gIH0KClNvIHdoeSBhIHdyaXRlIGxvY2sgaGVyZT8K
CkphbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
