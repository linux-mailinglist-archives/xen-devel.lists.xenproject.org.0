Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D638FBF4BF
	for <lists+xen-devel@lfdr.de>; Thu, 26 Sep 2019 16:11:34 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDURq-0005Pq-4P; Thu, 26 Sep 2019 14:08:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=breC=XV=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iDURo-0005Pg-Dy
 for xen-devel@lists.xen.org; Thu, 26 Sep 2019 14:08:44 +0000
X-Inumbo-ID: 255f79ec-e067-11e9-97fb-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id 255f79ec-e067-11e9-97fb-bc764e2007e4;
 Thu, 26 Sep 2019 14:08:43 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 023B6AC50;
 Thu, 26 Sep 2019 14:08:42 +0000 (UTC)
To: Sergey Dyasli <sergey.dyasli@citrix.com>
References: <20190926133618.24083-1-sergey.dyasli@citrix.com>
 <20190926135041.72cri2bam4ub3ojq@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <9ac64417-7011-c4b5-d2f9-3f34e8f53d68@suse.com>
Date: Thu, 26 Sep 2019 16:08:42 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20190926135041.72cri2bam4ub3ojq@Air-de-Roger>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] x86/shim: fix ballooning down the guest
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
Cc: Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel@lists.xen.org, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjYuMDkuMjAxOSAxNTo1MSwgUm9nZXIgUGF1IE1vbm7DqSAgd3JvdGU6Cj4gT24gVGh1LCBT
ZXAgMjYsIDIwMTkgYXQgMDI6MzY6MThQTSArMDEwMCwgU2VyZ2V5IER5YXNsaSB3cm90ZToKPj4g
Q3VycmVudGx5IGJhbGxvb25pbmcgZG93biBhIHB2c2hpbSBndWVzdCBjYXVzZXMgdGhlIGZvbGxv
d2luZyBlcnJvcnMKPj4gaW5zaWRlIHRoZSBzaGltOgo+Pgo+PiAgICAgZDN2MCBmYWlsZWQgdG8g
cmVzZXJ2ZSA1MTIgZXh0ZW50cyBvZiBvcmRlciA1MTIgZm9yIG9mZmxpbmluZwo+Pgo+PiBBbmQg
dGhlIGJhbGxvb25lZC1vdXQgcGFnZXMgc3RheSBpbnNpZGUgc2hpbSBhbmQgZG9uJ3QgcmVhY2gg
TDAgWGVuLgo+Pgo+PiBGaXggdGhpcyBieSBwYXNzaW5nIHRoZSBjb3JyZWN0IGFyZ3VtZW50cyB0
byBwdl9zaGltX29mZmxpbmVfbWVtb3J5KCkKPj4gZHVyaW5nIGEgWEVOTUVNX2RlY3JlYXNlX3Jl
c2VydmF0aW9uIHJlcXVlc3QuCj4+Cj4gCj4gVGhpcyBpcyBtaXNzaW5nOgo+IAo+IEZpeGVzOiBi
MjI0NWFjYzYwYzMgKCd4ZW4vcHZzaGltOiBtZW1vcnkgaG90cGx1ZycpCj4gCj4+IFNpZ25lZC1v
ZmYtYnk6IFNlcmdleSBEeWFzbGkgPHNlcmdleS5keWFzbGlAY2l0cml4LmNvbT4KPiAKPiBSZXZp
ZXdlZC1ieTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+CgpBY2tlZC1i
eTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
