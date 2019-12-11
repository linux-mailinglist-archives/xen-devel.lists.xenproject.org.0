Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3639811B234
	for <lists+xen-devel@lfdr.de>; Wed, 11 Dec 2019 16:34:56 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1if3y3-0002VK-26; Wed, 11 Dec 2019 15:31:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=bHGM=2B=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1if3y1-0002V4-Mr
 for xen-devel@lists.xenproject.org; Wed, 11 Dec 2019 15:31:57 +0000
X-Inumbo-ID: 58bef3ee-1c2b-11ea-88e7-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 58bef3ee-1c2b-11ea-88e7-bc764e2007e4;
 Wed, 11 Dec 2019 15:31:49 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 5E9E4AD6B;
 Wed, 11 Dec 2019 15:31:48 +0000 (UTC)
To: Hongyan Xia <hongyxia@amazon.com>
References: <cover.1576061451.git.hongyxia@amazon.com>
 <caf43a60c79fd8380efe0bc178c6b31e040c179c.1576061451.git.hongyxia@amazon.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <1dedbe02-b4de-baca-d444-fda4f3711e28@suse.com>
Date: Wed, 11 Dec 2019 16:32:09 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <caf43a60c79fd8380efe0bc178c6b31e040c179c.1576061451.git.hongyxia@amazon.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3 1/2] x86/mm: factor out the code for
 shattering an l3 PTE
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
Cc: xen-devel@lists.xenproject.org, jgrall@amazon.com,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTEuMTIuMjAxOSAxMTo1OCwgSG9uZ3lhbiBYaWEgd3JvdGU6Cj4gQEAgLTU1NzgsMjcgKzU1
OTcsOCBAQCBpbnQgbW9kaWZ5X3hlbl9tYXBwaW5ncyh1bnNpZ25lZCBsb25nIHMsIHVuc2lnbmVk
IGxvbmcgZSwgdW5zaWduZWQgaW50IG5mKQo+ICAgICAgICAgICAgICB9Cj4gIAo+ICAgICAgICAg
ICAgICAvKiBQQUdFMUdCOiBzaGF0dGVyIHRoZSBzdXBlcnBhZ2UgYW5kIGZhbGwgdGhyb3VnaC4g
Ki8KPiAtICAgICAgICAgICAgcGwyZSA9IGFsbG9jX3hlbl9wYWdldGFibGUoKTsKPiAtICAgICAg
ICAgICAgaWYgKCAhcGwyZSApCj4gKyAgICAgICAgICAgIGlmICggc2hhdHRlcl9sM2UocGwzZSwg
MCwgbG9ja2luZykgKQo+ICAgICAgICAgICAgICAgICAgcmV0dXJuIC1FTk9NRU07CgpIbW0sIEkg
ZGlkbid0IGV4cGVjdCBJJ2QgbmVlZCB0byBjb21tZW50IG9uIHRoaXMgYWdhaW46IEFzIHBlcgpt
eSB2MiByZXBseSwgeW91IHNob3VsZCBoYW5kIG9uIHRoZSByZXR1cm4gdmFsdWUgZnJvbSB0aGUK
ZnVuY3Rpb24sIG5vdCBtYWtlIHVwIHlvdXIgb3duLiBUaGlzIGlzIHNvIHRoYXQgaW4gY2FzZSB0
aGUKZnVuY3Rpb24gZ2FpbnMgYW5vdGhlciBlcnJvciBwYXRoIHdpdGggYSBkaWZmZXJlbnQgZXJy
b3IgY29kZSwKaXQgd291bGRuJ3QgYmVjb21lIGluZGlzdGluZ3Vpc2hhYmxlIHRvIGNhbGxlcnMg
ZnVydGhlciB1cC4KCkphbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
