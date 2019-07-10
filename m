Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D31CB645EE
	for <lists+xen-devel@lfdr.de>; Wed, 10 Jul 2019 13:52:33 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hlB62-000675-Te; Wed, 10 Jul 2019 11:49:14 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=dFy6=VH=amazon.de=prvs=087c1bc88=nmanthey@srs-us1.protection.inumbo.net>)
 id 1hlB61-000670-BU
 for xen-devel@lists.xenproject.org; Wed, 10 Jul 2019 11:49:13 +0000
X-Inumbo-ID: bb27c882-a308-11e9-8980-bc764e045a96
Received: from smtp-fw-9101.amazon.com (unknown [207.171.184.25])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id bb27c882-a308-11e9-8980-bc764e045a96;
 Wed, 10 Jul 2019 11:49:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
 t=1562759351; x=1594295351;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=wejiTR3bsd/CcOsI08ciEqntCE2XB3IJH/uFKukEYaU=;
 b=TYSKwOd5mBrW64XdJ53kdQQwqNrio6IfUUVvl1sbsNWTeI0r3+ufaoWd
 vtpl0/AqltNW9FaVGm2VUOkm6Dp7o2is0GGRbpwOhPXytLFMGPxN8j53V
 j3YkAD0qNe8TgHdKxLrvPoj4iCPO/gwbkQiNRqCFpf28JNXPDRstDhNQL s=;
X-IronPort-AV: E=Sophos;i="5.62,474,1554768000"; d="scan'208";a="815380097"
Received: from sea3-co-svc-lb6-vlan2.sea.amazon.com (HELO
 email-inbound-relay-2b-55156cd4.us-west-2.amazon.com) ([10.47.22.34])
 by smtp-border-fw-out-9101.sea19.amazon.com with ESMTP;
 10 Jul 2019 11:49:08 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
 by email-inbound-relay-2b-55156cd4.us-west-2.amazon.com (Postfix) with ESMTPS
 id 43B42A2357; Wed, 10 Jul 2019 11:49:08 +0000 (UTC)
Received: from EX13D02EUB001.ant.amazon.com (10.43.166.150) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.82) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 10 Jul 2019 11:49:07 +0000
Received: from uc1a35a69ae4659.ant.amazon.com (10.43.161.139) by
 EX13D02EUB001.ant.amazon.com (10.43.166.150) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 10 Jul 2019 11:49:01 +0000
To: Jan Beulich <JBeulich@suse.com>
References: <1558424746-24059-1-git-send-email-nmanthey@amazon.de>
 <1558424746-24059-4-git-send-email-nmanthey@amazon.de>
 <5CE6B5E50200007800231C66@prv1-mh.provo.novell.com>
 <f44e9114-96e8-bf8a-e66e-f6d8951080d5@amazon.de>
 <dcdef572-0eb9-dcfd-b614-aa494cf4d4a6@suse.com>
From: Norbert Manthey <nmanthey@amazon.de>
Openpgp: preference=signencrypt
Autocrypt: addr=nmanthey@amazon.de; prefer-encrypt=mutual; keydata=
 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
 pEddsOqYwOs=
Message-ID: <77a680cd-8108-f0a9-b511-e9c8e915b302@amazon.de>
Date: Wed, 10 Jul 2019 13:48:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <dcdef572-0eb9-dcfd-b614-aa494cf4d4a6@suse.com>
Content-Language: en-US
X-Originating-IP: [10.43.161.139]
X-ClientProxiedBy: EX13D03UWA002.ant.amazon.com (10.43.160.144) To
 EX13D02EUB001.ant.amazon.com (10.43.166.150)
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH L1TF MDS GT v1 3/3] common/grant_table:
 harden version dependent accesses
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Juergen Gross <JGross@suse.com>, Tim Deegan <tim@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George
 Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 IanJackson <Ian.Jackson@eu.citrix.com>, Dario Faggioli <dfaggioli@suse.com>,
 Martin Pohlack <mpohlack@amazon.de>, "wipawel@amazon.de" <wipawel@amazon.de>,
 Julien Grall <julien.grall@arm.com>, David Woodhouse <dwmw@amazon.co.uk>,
 "Martin Mazein\(amazein\)" <amazein@amazon.de>,
 xen-devel <xen-devel@lists.xenproject.org>, Bjoern Doebel <doebel@amazon.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gNy8xMC8xOSAwNToxMiwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMDguMDcuMjAxOSAxNTo1
MywgTm9yYmVydCBNYW50aGV5IHdyb3RlOgo+PiBPbiA1LzIzLzE5IDE3OjAxLCBKYW4gQmV1bGlj
aCB3cm90ZToKPj4+Pj4+IE9uIDIxLjA1LjE5IGF0IDA5OjQ1LCA8bm1hbnRoZXlAYW1hem9uLmRl
PiB3cm90ZToKPj4+PiAgICogZ250dGFiX3NldF92ZXJzaW9uOiBhbGwgYWNjZXNzaWJsZSBkYXRh
IGlzIGFsbG9jYXRlZCBmb3IgYm90aCB2ZXJzaW9ucwo+Pj4gVGhpcyBpcyBub3QgZW5vdWdoIGZv
ciBteSB0YXN0ZTogVGhlIHZlcnkgZmlyc3QgbG9vcCBpcyBzYWZlIG9ubHkKPj4+IGJlY2F1c2Ug
bnJfZ3JhbnRfZW50cmllcygpIGlzLiBBbmQgc3BlY3VsYXRpbmcgaW50bwo+Pj4gZ250dGFiX3Vu
cG9wdWxhdGVfc3RhdHVzX2ZyYW1lcygpIGRvZXNuJ3QgbG9vayBzYWZlIGF0IGFsbCwgYXMKPj4+
IGd0LT5zdGF0dXNbaV0gbWF5IGJlIE5VTEwuCj4+IFNvLCB5b3UgYmFzaWNhbGx5IHdhbnQgdG8g
c2VlIGEgYmxvY2tfc3BlY3VsYXRpb24oKSBhdCB0aGUgYmVnaW5uaW5nIG9mCj4+IHRoZSBmdW5j
dGlvbiBnbnR0YWJfcG9wdWxhdGVfc3RhdHVzX2ZyYW1lcyBhbmQKPj4gZ250dGFiX3VucG9wdWxh
dGVfc3RhdHVzX2ZyYW1lcz8gSSBkbyBub3QgY2xhaW0gdG8gcHJvdGVjdCBhZ2FpbnN0Cj4+IHNw
ZWN1bGF0aXZlIG91dC1vZi1ib3VuZCBhY2Nlc3NlcyB0aGF0IGFyZSBjYXVzZWQgYnkgdGhlIGZv
ciBsb29wIGluCj4+IGdudHRhYl9zZXRfdmVyc2lvbi4KPiBUaGUgcG9pbnQgaXNuJ3QgdGhlIGxv
b3AsIGJ1dCB0aGUgZmFjdCB0aGF0IGJ5IG1pcy1zcGVjdWxhdGluZyB0aHJvdWdoCj4gdGhlIHR3
byBjb25kaXRpb25zIGJlZm9yZSB0aGUgZnVuY3Rpb24gY2FsbCBhIE5VTEwgZ3QtPnN0YXR1c1sw
XSBtYXkKPiBnZXQgYWNjZXNzZWQsIGVudGlyZWx5IGluZGVwZW5kZW50IG9mIHRoaXMgYmVpbmcg
YSBsb29wIG9yIGp1c3QgYQo+IHNpbmd1bGFyIGFjY2Vzcy4KCkkgdW5kZXJzdGFuZC4gVG8gcHJl
dmVudCB0aGlzIGtpbmQgb2YgYWNjZXNzIGR1cmluZyBzcGVjdWxhdGl2ZQpleGVjdXRpb24sIEkg
d2lsbCBhZGQgYSBibG9ja19zcGVjdWxhdGlvbigpIGF0IHRoZSB0b3Agb2YgdGhlIGZ1bmN0aW9u
CnRvIG1ha2Ugc3VyZSB0aGUgY29kZSBpcyByZWFjaGVkIG9ubHkgd2hlbiB0aGUgY29ycmVjdCB2
ZXJzaW9uIG51bWJlciBpcwp1c2VkLgoKQmVzdCwKTm9yYmVydAoKCgoKCkFtYXpvbiBEZXZlbG9w
bWVudCBDZW50ZXIgR2VybWFueSBHbWJICktyYXVzZW5zdHIuIDM4CjEwMTE3IEJlcmxpbgpHZXNj
aGFlZnRzZnVlaHJ1bmc6IENocmlzdGlhbiBTY2hsYWVnZXIsIFJhbGYgSGVyYnJpY2gKRWluZ2V0
cmFnZW4gYW0gQW10c2dlcmljaHQgQ2hhcmxvdHRlbmJ1cmcgdW50ZXIgSFJCIDE0OTE3MyBCClNp
dHo6IEJlcmxpbgpVc3QtSUQ6IERFIDI4OSAyMzcgODc5CgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
