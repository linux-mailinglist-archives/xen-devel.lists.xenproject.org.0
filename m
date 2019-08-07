Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A4BF84874
	for <lists+xen-devel@lfdr.de>; Wed,  7 Aug 2019 11:13:32 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hvHxw-0006Wy-PF; Wed, 07 Aug 2019 09:10:40 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=0f/x=WD=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hvHxv-0006Wq-AA
 for xen-devel@lists.xenproject.org; Wed, 07 Aug 2019 09:10:39 +0000
X-Inumbo-ID: 3824e255-b8f3-11e9-8980-bc764e045a96
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 3824e255-b8f3-11e9-8980-bc764e045a96;
 Wed, 07 Aug 2019 09:10:37 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 95507AFAB;
 Wed,  7 Aug 2019 09:10:36 +0000 (UTC)
To: Juergen Gross <jgross@suse.com>
References: <20190807073216.3239-1-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <e856a5a3-4363-0540-8b17-8089180da339@suse.com>
Date: Wed, 7 Aug 2019 11:10:37 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190807073216.3239-1-jgross@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2] xen/x86: lock cacheline for add_sized()
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
Cc: xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDcuMDguMjAxOSAwOTozMiwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPiBhZGRfc2l6ZWQoKSBz
aG91bGQgdXNlIGFuIGF0b21pYyB1cGRhdGUgb2YgdGhlIG1lbW9yeSB3b3JkLCBhcyBpdCBpcwo+
IHVzZWQgYnkgc3Bpbl91bmxvY2soKS4KPiAKPiBUaWNrZXQgbG9ja3MgYXJlIHVzaW5nIGEgcmVh
ZC1tb2RpZnktd3JpdGUgb3BlcmF0aW9uIG9uIHBhcnRzIG9mIHRoZQo+IGxvY2t3b3JkIGZvciB1
bmxvY2tpbmcsIHdoaWxlIHRyeWluZyB0byBsb2NrIGlzIGRvbmUgYnkgYW4gYXRvbWljCj4gdXBk
YXRlIG9mIHRoZSBjb21wbGV0ZSBsb2Nrd29yZC4gVGhpcyByZXF1aXJlcyB0aGUgdW5sb2NrIG9w
ZXJhdGlvbiB0bwo+IGJlIGF0b21pYywgdG9vLCBhcyBvdGhlcndpc2UgdGhlIHVubG9jayBtaWdo
dCBub3Qgd3JpdGUgYmFjayB0aGUKPiBjb3JyZWN0IGRhdGEuCgpJIGhhdmUgdG8gdGFrZSBiYWNr
IG15IHJlcGx5IHRvIHYxLCBhbmQgaGVuY2UgSSdtIGFmcmFpZCB0aGF0CmlmIHRoZSBjaGFuZ2Ug
aXMgcmVhbGx5IG5lZWRlZCB0aGUgZGVzY3JpcHRpb24gaXMgc3RpbGwKaW5zdWZmaWNpZW50LiBM
ZXQncyBsb29rIGF0IGJvdGggc2lkZXM6IEFjcXVpcmUgaXMgYSBMT0NLZWQKcmVhZC1tb2RpZnkt
d3JpdGUgb2YgdGhlIGZ1bGwgd29yZCwgd2l0aCB0aGUgYWRkaXRpb25hbApwcm9wZXJ0eSB0aGF0
IHRoZSB2YWx1ZSB3cml0dGVuIGJhY2sgdG8gdGhlIGxvdyBoYWxmIGlzCnVuY2hhbmdlZCBmcm9t
IHRoZSB2YWx1ZSByZWFkLiBSZWxlYXNlIGlzCgoJcmVhZCBsb3cgaGFsZgoJaW5jcmVtZW50IGxv
dyBoYWxmCgl3cml0ZSBsb3cgaGFsZgoKU2luY2UgdGhlIGxvdyBoYWxmIGRvZXNuJ3QgY2hhbmdl
IGR1cmluZyBhbnkgYWNxdWlyZSAoaW5jbHVkaW5nCmF0dGVtcHRzLCBpLmUuIHRyeS1sb2NrKSwg
aXQgZG9lc24ndCBtYXR0ZXIgaWYgaXQgcmFjZXMgd2l0aAp0aGUgYWJvdmUgc2VxdWVuY2UuIEl0
IGNhbiBmcmVlbHkgaGFwcGVuIGJldHdlZW4gYW55IHR3byBvZiB0aGUKdGhyZWUgc3RlcHMuCgpU
aGVyZWZvcmUgd2hhdCBJJ20gcmVhbGx5IGFmdGVyIGlzIChhKSBjbGFyaWZpY2F0aW9uIHdoZXRo
ZXIKdGhlIGlzc3VlIHlvdSBtZWFuIHRvIGZpeCB3YXMgb2JzZXJ2ZWQgaW4gcHJhY3RpY2UgYW5k
IChiKSBhCmNvbmNyZXRlIHNjZW5hcmlvIHdoZXJlIHRoaW5ncyB3b3VsZCBnbyB3cm9uZy4KCkph
bgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
